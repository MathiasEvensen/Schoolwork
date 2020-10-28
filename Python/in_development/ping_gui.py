from ip2geotools.databases.noncommercial import DbIpCity
from colorama import Fore
from tkinter import *
from tkinter import ttk
from tqdm import tqdm
from queue import Queue
import urllib.request, re
import time
import os
import socket
import subprocess
import ipaddress
import threading
import speedtest

class Vindu(Tk):
    kjorer = True
    def __init__(self):
        Tk.__init__(self, None)

        # self.results = s.results.dict()

        self.entry = Entry(width=40, justify=CENTER)
        self.entry.grid(column=1, row=0, columnspan=30, sticky=W)

        execute_ping = ttk.Button(text='Execute Ping', command=self.run_ping)
        execute_ping.grid(column=10, row=2)

        ping_your_ip = ttk.Button(text='Ping Your IP', command=self.ping_your_ip)
        ping_your_ip.place(x=500, y=0)

        get_ip = ttk.Button(text='Get public IP', command=self.get_public_ip)
        get_ip.place(x=500, y=25)

        ping_all_ip = ttk.Button(text='Ping all', command=self.multi_ping)
        ping_all_ip.grid(column=0, row=2)

        stop_ping_all = ttk.Button(text='stop ping all', command=self.stopit)
        stop_ping_all.grid(column=0, row=3)

        run_ping_script = ttk.Button(text='Speedtest', command=self.measure_speed)
        run_ping_script.place(x=500, y=50)

        clear_text = ttk.Button(text='Clear Text', command=self.clear_text)
        clear_text.grid(column=20, row=2)

        exit_button = ttk.Button(text='Exit', command=self.exiting)  # TODO thread fails after exit
        exit_button.place(x=748, y=375)

        self.output = Text(height=20, width=61)
        self.output.grid(column=0, row=4, columnspan=30, sticky=W)

        text1 = ttk.Label(self,
                          text='1. Execute Ping : Write IP in textbox and press Execute Ping. If no IP is written, '
                               'it will ping your localhost.', font='Times 9', justify=LEFT, wraplength=310)
        text2 = ttk.Label(self, text='2. Ping Your IP : Pings your IP address.', font='Times 9',
                          justify=LEFT, wraplength=310)
        text3 = ttk.Label(self, text='3. Write the first part of the IP and all other IPs in the'
                                     ' network will be pinged. EX : (192.168.0.0).', font='Times 9', justify=LEFT,
                          wraplength=310)
        text4 = Label(self, text='4. Exit : Exits the program (FUNKER IKKE PGA MULTITHREADING).',
                      font='Times 9', justify=LEFT, fg='red', wraplength=310)

        text1.place(x=500, y=90)
        text2.place(x=500, y=125)
        text3.place(x=500, y=145)
        text4.place(x=500, y=180)

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
            self.output.delete('1.0', END)

        t = threading.Thread(target=callback)
        t.start()

    def get_public_ip(self):
        self.output.delete('1.0', END)
        def callback():
            filtered_list_ip = ['ip']
            def seek_keys(d, key_list):
                for k, v in d.items():
                    if k in key_list:
                        if isinstance(v, dict):
                            # print(k + ": " + list(v.keys())[0])
                            self.output.insert(END, k + ": " + list(v.keys())[0])
                        else:
                            # print(k + ": " + str(v))
                            self.output.insert(END, k + ": " + str(v))
                    if isinstance(v, dict):
                        seek_keys(v, key_list)
            if len(self.entry.get()) == 0:
                # print("Retrieving public ip address: \n")
                self.output.insert(END, "Retrieving public ip address: \n")
                s = speedtest.Speedtest()
                s.get_servers()
                s.get_best_server()
                s.get_config()
                res = s.results.dict()
                seek_keys(res, filtered_list_ip)
                # self.output.insert(END, str(seek_keys(res, filtered_list_ip)))
            else:
                self.output.insert(END, "Nothing should be written in input\n")
                print("Nothing should be written in input\n")

        self.output.see("end")

        t = threading.Thread(target=callback)
        t.start()

    def measure_speed(self):
        self.output.delete('1.0', END)
        def callback():
            dataip = re.search('"([0-9.]*)"',
                               urllib.request.urlopen("http://ip.jsontest.com/").read().decode('utf-8')).group(1)
            filtered_list = ['cc', 'host', 'ip', 'isp']
            def seek_keys(d, key_list):
                for k, v in d.items():
                    if k in key_list:
                        if isinstance(v, dict):
                            # print(k + ": " + list(v.keys())[0])
                            self.output.insert(END, k + ": " + list(v.keys())[0] + "\n")
                        else:
                            # print(k + ": " + str(v))
                            self.output.insert(END, k + ": " + str(v) + "\n")
                    if isinstance(v, dict):
                        seek_keys(v, key_list)
            if len(self.entry.get()) == 0:
                # print("Running speedtest\n")
                self.output.insert(END, "Running speedtest\n")
                s = speedtest.Speedtest()
                s.get_servers()
                s.get_best_server()
                s.download()
                s.upload()
                res = s.results.dict()
                seek_keys(res, filtered_list)
                response = DbIpCity.get(dataip, api_key = 'free')
                self.output.insert(END, "city: " + response.city + "\nstate: " + response.region + "\n")
                self.output.insert(END, '')
                self.output.insert(END, "Download: {:.2f} Mbps/s".format(res["download"] / 1024 / 1024) +
                      '\nUpload: {:.2f} Mbps/s'.format(res["upload"] / 1024 / 1024) +
                      '\nPing: {}\n'.format(res["ping"]))
            else:
                self.output.insert(END, "Nothing should be written in input\n")

        self.output.see("end")

        t = threading.Thread(target=callback)
        t.start()

    def run_ping(self):
        self.output.delete('1.0', END)
        def callback():
            global kjorer

            if len(self.entry.get()) == 0:
                self.output.insert(END, "You have to write an IP : EX(192.168.1.0)\n")
            else:
                self.output.insert(END, "Pinging: " + self.entry.get() + "\n")
                ping = os.popen('ping ' + self.entry.get()).read()
                self.output.insert(END, ping)

        t = threading.Thread(target=callback)
        t.start()

    def ping_your_ip(self):
        self.output.delete('1.0', END)
        def callback():
            ping = os.popen('ping ' + socket.gethostbyname(socket.gethostname())).read()
            self.output.insert(END, ping)

        self.output.see("end")

        t = threading.Thread(target=callback)
        t.start()

    def multi_ping(self):
        self.output.delete('1.0', END)
        def callback():
            print_lock = threading.Lock()

            # Prompt the user to input a network address
            net_addr = str(self.entry.get())
            # actual code start time
            start_time = time.time()
            # Create the network
            ip_net = ipaddress.ip_network(net_addr)
            # Get all hosts on that network
            all_hosts = list(ip_net.hosts())
            # Configure subprocess to hide the console window
            info = subprocess.STARTUPINFO()
            info.dwFlags |= subprocess.STARTF_USESHOWWINDOW
            info.wShowWindow = subprocess.SW_HIDE

            print('Sweeping Network with ICMP: ', net_addr)
            self.output.insert(END, 'Sweeping Network with ICMP: ' + str(net_addr) + '\n')

            if len(self.entry.get()) == 0:
                self.output.insert(END, "You have to write an IP : EX(192.168.1.0)\n")
            else:
                def pingsweep(ip):
                    response = \
                    subprocess.Popen(['ping', '-n', '1', '-w', '150', str(all_hosts[ip])], stdout=subprocess.PIPE,
                                         startupinfo=info).communicate()[0]

                    # lock this section, until we get a complete chunk
                    # then free it (so it doesn't write all over itself)
                    with print_lock:
                        print('\033[93m', end='')
                        # code logic if we have/don't have good response
                        if "Reply" in response.decode('utf-8'):
                            print(str(all_hosts[ip]), '\033[32m' + "is Online")
                            self.output.insert(END, str(all_hosts[ip]) + " is Online\n")
                        elif "Destination host unreachable" in response.decode('utf-8'):
                            # print(str(all_hosts[ip]), '\033[90m'+"is Offline (Unreachable)")
                            pass
                        elif "Request timed out" in response.decode('utf-8'):
                            # print(str(all_hosts[ip]), '\033[90m'+"is Offline (Timeout)")
                            pass
                        else:
                            # print colors in green if online
                            print("UNKNOWN", end='')

                # defines a new ping using def pingsweep for each thread
                # holds task until thread completes
                def threader():
                    while True:
                        worker = q.get()
                        pingsweep(worker)
                        q.task_done()

                q = Queue()

                # up to 100 threads, daemon for cleaner shutdown
                # just spawns the threads and makes them daemon mode
                for x in range(100):
                    th = threading.Thread(target=threader)
                    th.daemon = True
                    th.start()

                # loops over the last octet in our network object
                # passing it to q.put (entering it into queue)
                for worker in range(len(all_hosts)):
                    q.put(worker)

                # queue management
                q.join()

                runtime = float("%0.2f" % (time.time() - start_time))
                print("Run Time: ", runtime, "seconds")
                self.output.insert(END, "Run Time: " + str(runtime) + " seconds")

        t = threading.Thread(target=callback)
        t.start()


    def script(self):
        os.chmod('C:/Users/mathi/Desktop/ping2.sh', 0o755)
        subprocess.call("C:/Users/mathi/Desktop/ping2.sh", shell=True)

    def exiting(self):
        self.destroy()


def starter():
    app = Vindu()
    app.geometry('825x400')
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
