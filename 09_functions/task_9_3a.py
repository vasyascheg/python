# -*- coding: utf-8 -*-
"""
Задание 9.3a

Сделать копию функции get_int_vlan_map из задания 9.3.

Дополнить функцию:
    - добавить поддержку конфигурации, когда настройка access-порта выглядит так:
            interface FastEthernet0/20
                switchport mode access
                duplex auto
      То есть, порт находится в VLAN 1

В таком случае, в словарь портов должна добавляться информация, что порт в VLAN 1
      Пример словаря: {'FastEthernet0/12': 10,
                       'FastEthernet0/14': 11,
                       'FastEthernet0/20': 1 }

У функции должен быть один параметр config_filename, который ожидает как аргумент имя конфигурационного файла.

Проверить работу функции на примере файла config_sw2.txt


Ограничение: Все задания надо выполнять используя только пройденные темы.
"""

def get_int_vlan_map(config_filename):
    '''
    У функции должен быть один параметр config_filename, который ожидает как аргумент имя конфигурационного файла.
    '''
    access = {}
    trunk = {}
    f = open(config_filename, 'r')
    k = ''
    for i in f.read().split('\n'):
        if i.startswith('interface'): 
            k = i.split(' ')[1]   
           # access[k] = 1 #когда находим интерфейс и всегда присваиваем влану единицу (а позже он может изменяться)
        if i.startswith(' switchport mode access'):
            access[k] = 1
        if i.startswith(' switchport access vlan'):
            access[k]= int(i.split(' ')[-1])    
        if i.startswith(' switchport trunk allowed vlan'):
            trunk[k]=[int(x) for x in i.split(' ')[-1].split(',')]  
         


    f.close()
    return (access, trunk)
print(get_int_vlan_map('config_sw2.txt'))
