from tkinter import *
from tkinter import ttk
from tqdm import tqdm
import os
import socket
import subprocess
import ipaddress
import threading
import colorama
from colorama import Fore, Style
import speedtest

kjorer = True


class Vindu(Tk):

    def __init__(self):
        Tk.__init__(self, None)

        # self.results = s.results.dict()

        self.entry = Entry(width=50, justify=CENTER)
        self.entry.grid(column=0, row=0, columnspan=30)

        execute_ping = ttk.Button(text='Execute Ping', command=self.run_ping)
        execute_ping.grid(column=0, row=2)

        ping_your_ip = ttk.Button(text='Ping Your IP', command=self.ping_your_ip)
        ping_your_ip.grid(column=1, row=2)

        get_ip = ttk.Button(text='Get public IP', command=self.get_public_ip)
        get_ip.grid(column=1, row=3)

        ping_all_ip = ttk.Button(text='Ping all', command=self.ping_all)
        ping_all_ip.grid(column=2, row=2)

        stop_ping_all = ttk.Button(text='stop ping all', command=self.stopit)
        stop_ping_all.grid(column=2, row=3)

        run_ping_script = ttk.Button(text='Speedtest', command=self.measure_speed)
        run_ping_script.grid(column=3, row=2)

        clear_text = ttk.Button(text='Clear Text', command=self.clear_text)
        clear_text.grid(column=3, row=3)

        exit_button = ttk.Button(text='Exit', command=self.exiting)  # TODO thread fails after exit
        exit_button.grid(column=0, row=3)

        text1 = ttk.Label(self,
                          text='1. Execute Ping : Write IP in textbox and press Execute Ping. If no IP is written, '
                               'it will ping your localhost', font='Times 9', justify=LEFT, wraplength=305)
        text2 = ttk.Label(self, text='2. Ping Your IP : Pings your IP address', font='Times 9',
                          justify=LEFT, wraplength=305)
        text3 = ttk.Label(self, text='3. Write the first part of the IP and all other IPs in the'
                                     ' network will be pinged. EX : (192.168.0.0)', font='Times 9', justify=LEFT,
                          wraplength=305)
        text4 = Label(self, text='4. Exit : Exits the program (FUNKER IKKE PGA MULTITHREADING)',
                      font='Times 9', justify=LEFT, fg='red', wraplength=305)

        text1.place(x=0, y=70)
        text2.place(x=0, y=105)
        text3.place(x=0, y=125)
        text4.place(x=0, y=160)

    def stopit(self):
        def callback():
            #self.entry.delete(0, 'end')
            global kjorer
            kjorer = False

        t = threading.Thread(target=callback)
        t.start()

    def clear_text(self):
        def callback():
            self.entry.delete(0, 'end')

        t = threading.Thread(target=callback)
        t.start()

    def get_public_ip(self):
        def callback():
            filtered_list_ip = ['ip']
            def seek_keys(d, key_list):
                for k, v in d.items():
                    if k in key_list:
                        if isinstance(v, dict):
                            print(k + ": " + list(v.keys())[0])
                        else:
                            print(k + ": " + str(v))
                    if isinstance(v, dict):
                        seek_keys(v, key_list)
            if len(self.entry.get()) == 0:
                print("Retrieving public ip address: \n")
                s = speedtest.Speedtest()
                s.get_servers()
                s.get_best_server()
                s.get_config()
                res = s.results.dict()
                seek_keys(res, filtered_list_ip)
            else:
                print("Nothing should be written in input\n")

        t = threading.Thread(target=callback)
        t.start()

    def measure_speed(self):
        def callback():
            filtered_list = ['cc', 'name', 'host', 'ip', 'isp']
            def seek_keys(d, key_list):
                for k, v in d.items():
                    if k in key_list:
                        if isinstance(v, dict):
                            print(k + ": " + list(v.keys())[0])
                        else:
                            print(k + ": " + str(v))
                    if isinstance(v, dict):
                        seek_keys(v, key_list)
            if len(self.entry.get()) == 0:
                print("Running speedtest\n")
                s = speedtest.Speedtest()
                s.get_servers()
                s.get_best_server()
                s.download()
                s.upload()
                res = s.results.dict()
                seek_keys(res, filtered_list)
                print('')
                print("Download: {:.2f} Mb/s".format(res["download"] / 1024 / 1024) +
                      '\nUpload: {:.2f} Mb/s'.format(res["upload"] / 1024 / 1024) +
                      '\nPing: {}\n'.format(res["ping"]))
            else:
                print("Nothing should be written in input\n")

        t = threading.Thread(target=callback)
        t.start()

    def run_ping(self):
        def callback():
            global kjorer

            if len(self.entry.get()) == 0:
                print("You have to write an IP : EX(192.168.1.0)\n")
            elif kjorer == False: # TODO: Not working
                stopit()
            else:
                os.system('ping ' + self.entry.get())

        t = threading.Thread(target=callback)
        t.start()

    def ping_your_ip(self):
        def callback():
            os.system('ping ' + socket.gethostbyname(socket.gethostname()))

        t = threading.Thread(target=callback)
        t.start()

    def ping_all(self):
        global kjorer
        kjorer = True

        def callback():
            if len(self.entry.get()) == 0:
                print("You have to write an IP : EX(192.168.1.0)\n")
            else:
                try:
                    net_address = str(self.entry.get()) + "/24"
                    ip_net = ipaddress.ip_network(net_address)
                    all_hosts = list(ip_net.hosts())
                    info = subprocess.STARTUPINFO()
                    info.dwFlags |= subprocess.STARTF_USESHOWWINDOW
                    info.wShowWindow = subprocess.SW_HIDE

                    for i in tqdm(range(len(all_hosts))):
                        output = subprocess.Popen(['ping', '-n', '1', '-w', '500', str(all_hosts[i])],
                                                    stdout=subprocess.PIPE).communicate()[0]

                        if "Destination host unreachable" in output.decode('utf-8'):
                            #print(Fore.RED + str(all_hosts[i]), "  Offline")
                            pass
                        elif "Request timed out" in output.decode('utf-8'):
                            #print(Fore.RED + str(all_hosts[i]), "  Offline")
                            pass
                        elif not kjorer:
                            break
                        else:
                            print('\r'+Fore.GREEN + str(all_hosts[i]), "  Online")


                except ValueError:
                    print("Check spelling or add 0 to last number in ip: EX(192.168.1.0)\n")
                except Exception:
                    print("Something went wrong\n")

        t = threading.Thread(target=callback)
        t.start()

    def script(self):
        os.chmod('C:/Users/mathi/Desktop/ping2.sh', 0o755)
        subprocess.call("C:/Users/mathi/Desktop/ping2.sh", shell=True)

    def exiting(self):
        self.destroy()


def starter():
    app = Vindu()
    app.geometry('305x220')
    app.title('Ping')
    app.mainloop()


if __name__ == '__main__':
    def callback():
        t = threading.Thread(target=callback)
        t.start()
        print(t.is_alive())


    starter()
    root = Tk()

input()
