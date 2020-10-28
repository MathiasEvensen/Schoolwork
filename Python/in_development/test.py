import nmap

nm = nmap.PortScanner()
#nm.scan('192.168.11.1', '22-443')
#print(nm['127.0.0.1'].all_ip())


"""nm.scan(hosts='192.168.11.0/24', arguments='-n -sP -PE -PA21,23,80,3389')
hosts_list = [(x, nm[x]['status']['state']) for x in nm.all_hosts()]
for host, status in hosts_list:
    print('{0}:{1}'.format(host, status))"""
#print(nm['127.0.0.1'].all_tcp())
#print(nm.command_line())