# -*- coding: utf-8 -*-
"""
Задание 11.1

Создать функцию parse_cdp_neighbors, которая обрабатывает вывод команды show cdp neighbors.

У функции должен быть один параметр command_output, который ожидает как аргумент вывод команды одной строкой (не имя файла). 
Для этого надо считать все содержимое файла в строку,
а затем передать строку как аргумент функции (как передать вывод команды показано в коде ниже).

Функция должна возвращать словарь, который описывает соединения между устройствами.

Например, если как аргумент был передан такой вывод:
R4>show cdp neighbors

Device ID    Local Intrfce   Holdtme     Capability       Platform    Port ID
R5           Fa 0/1          122           R S I           2811       Fa 0/1
R6           Fa 0/2          143           R S I           2811       Fa 0/0

Функция должна вернуть такой словарь:

    {("R4", "Fa0/1"): ("R5", "Fa0/1"),
     ("R4", "Fa0/2"): ("R6", "Fa0/0")}

В словаре интерфейсы должны быть записаны без пробела между типом и именем. То есть так Fa0/0, а не так Fa 0/0.

Проверить работу функции на содержимом файла sh_cdp_n_sw1.txt. При этом функция работать
и на других файлах (тест проверяет работу функции на выводе из sh_cdp_n_sw1.txt и sh_cdp_n_r3.txt).

Ограничение: Все задания надо выполнять используя только пройденные темы.
"""


def parse_cdp_neighbors(command_output):
    """
    Тут мы передаем вывод команды одной строкой потому что именно в таком виде
    будет получен вывод команды с оборудования. Принимая как аргумент вывод
    команды, вместо имени файла, мы делаем функцию более универсальной: она может
    работать и с файлами и с выводом с оборудования.
    Плюс учимся работать с таким выводом.
    """
    d = {}
    hd ={'Device ID':0,    'Local Intrfce':0,    'Port ID':0}
    c = command_output.split('\n')
    id = None
    headerfound = False
    for l in c:
        if l.strip(' ') == '':
            continue
        if id == None:
            id = l.split('>')[0]
        if headerfound: 
            s, e = hd['Device ID']
            devId = l[0:e].strip(' ')
            s, e = hd['Local Intrfce']
            localIn = l[s:e].strip(' ').replace(' ', '')
            s, e = hd['Port ID']
            portId = l[s:e].strip(' ').replace(' ', '')
            #print(devId, localIn,portId)
            d[id, localIn] = devId, portId
            '''
    {("R4", "Fa0/1"): ("R5", "Fa0/1"),
     ("R4", "Fa0/2"): ("R6", "Fa0/0")}
            '''
        elif l.startswith('Device ID'):
            headerfound = True
            for k in hd.keys(): #идем по словарю hd и находим позиции (начало и конец), откуда брать пары
                p = l.find(k)
                hd[k] = p, p + len(k)+1 
            #print(hd)

    return d 

if __name__ == "__main__":
    with open("sh_cdp_n_sw1.txt") as f:
        print(parse_cdp_neighbors(f.read()))
