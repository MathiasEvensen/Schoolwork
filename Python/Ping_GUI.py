from tkinter import *
from tkinter import ttk
import os
import socket
import subprocess
import ipaddress
import threading
from multiprocessing.pool import ThreadPool

kjorer = True


class Vindu(Tk):
  def __init__(self):
    Tk.__init__(self, None)

    self.entry = Entry(width=50, justify=CENTER)
    self.entry.grid(column=0, row=0, columnspan=30)

    execute_ping = ttk.Button(text='Execute Ping', command=self.run_ping)
    execute_ping.grid(column=0, row=2)

    ping_your_ip = ttk.Button(text='Ping Your IP', command=self.ping_your_ip)
    ping_your_ip.grid(column=1, row=2)

    ping_all_ip = ttk.Button(text='Ping all', command=self.ping_all)
    ping_all_ip.grid(column=2, row=2)

    stop_ping_all = ttk.Button(text='stop ping all', command=self.stopit)
    stop_ping_all.grid(column=2, row=3)

    run_ping_script = ttk.Button(text='Script', command=self.script)
    run_ping_script.grid(column=3, row=2)

    exit_button = ttk.Button(text='Exit', command=self.exiting)  # TODO thread fails after exit
    exit_button.grid(column=0, row=3)

    text1 = ttk.Label(self, text='1. Execute Ping : Write IP in textbox and press Execute Ping. If no IP is written, '
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
      self.entry.delete(0, 'end')
      global kjorer
      kjorer = False

    t = threading.Thread(target=callback)
    t.start()

  def run_ping(self):
    def callback():
      if len(self.entry.get()) == 0:
        os.system('ping localhost')
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
        print("You have to write an IP : EX(192.168.0.0)")
      else:
        net_address = str(self.entry.get()) + "/24"
        ip_net = ipaddress.ip_network(net_address)
        all_hosts = list(ip_net.hosts())
        info = subprocess.STARTUPINFO()
        info.dwFlags |= subprocess.STARTF_USESHOWWINDOW
        info.wShowWindow = subprocess.SW_HIDE

        for i in range(len(all_hosts)):
          output = subprocess.Popen(['ping', '-n', '1', '-w', '500', str(all_hosts[i])],
                                    stdout=subprocess.PIPE).communicate()[0]

          if "Destination host unreachable" in output.decode('utf-8'):
            print(str(all_hosts[i]), "is Offline")
          elif "Request timed out" in output.decode('utf-8'):
            print(str(all_hosts[i]), "is Offline")
          elif kjorer == False:
            break
          else:
            print(str(all_hosts[i]), "is Online")

    t = threading.Thread(target=callback)
    t.start()

  def script(self):
    subprocess.call("C:/Users/mathi/Desktop/ping2.sh", shell=True)
    os.chmod('C:/Users/mathi/Desktop/ping2.sh', 0o755)

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
  starter()
  root = Tk()

input()
