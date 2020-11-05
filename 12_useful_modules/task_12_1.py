# -*- coding: utf-8 -*-
"""
Задание 12.1

Создать функцию ping_ip_addresses, которая проверяет пингуются ли IP-адреса.

Функция ожидает как аргумент список IP-адресов.

Функция должна возвращать кортеж с двумя списками:
* список доступных IP-адресов
* список недоступных IP-адресов

Для проверки доступности IP-адреса, используйте команду ping.

Ограничение: Все задания надо выполнять используя только пройденные темы.
"""
import subprocess

def ping_ip_addresses(ips):
    '''
    '''
    accessIP = []
    inaccessIP = []
    for ad in ips:
        reply = subprocess.run(['ping','-c', '1', ad], stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
        if reply.returncode == 0:
            accessIP.append(ad)
        else:
            inaccessIP.append(ad)

    return accessIP, inaccessIP

print(ping_ip_addresses(['8.8.8.8', 'qqq.qq', 'ya.ru']))
