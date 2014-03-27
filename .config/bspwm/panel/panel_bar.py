import time
import threading
import socket
import os


def output_loop():
    threading.Timer(1, output_loop).start()
    output = ""
    f = os.popen('bspc control --get-status').read()
    output += f
    #output += os.system("bspc control") + " "
    #output += socket.gethostname() + " "
    #output += time.strftime("%a, %b %d %Y %X")
    print(output)

output_loop()
