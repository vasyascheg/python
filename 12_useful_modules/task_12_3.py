# -*- coding: utf-8 -*-
"""
Задание 12.3


Создать функцию print_ip_table, которая отображает таблицу доступных и недоступных IP-адресов.

Функция ожидает как аргументы два списка:
* список доступных IP-адресов
* список недоступных IP-адресов

Результат работы функции - вывод на стандартный поток вывода таблицы вида:

Reachable    Unreachable
-----------  -------------
10.1.1.1     10.1.1.7
10.1.1.2     10.1.1.8
             10.1.1.9

Функция не должна изменять списки, которые переданы ей как аргументы.
То есть, до выполнения функции и после списки должны выглядеть одинаково.


Для этого задания нет тестов
"""
#from task_12_1 import ping_ip_addresses


def print_ip_table(reach, unreach):
    '''
    функция отображает таблицу доступных и недоступных IP-адресов
    '''
    f = '{:15}  {:15}' 
    print(f.format('Reachable', 'Unreachable'))
    print(f.format('-' * 15, '-' * 15))
    for i in range(max(len(reach), len(unreach))):
        print( f.format( list_item( reach, i), list_item( unreach, i)))

def list_item(list, index):
    if index >= len(list):
        return ''
    else:
        return list[index]

print_ip_table(['10.1.1.1', '10.1.1.2'], ['10.1.1.7', '10.1.1.8', '10.1.1.9'])


