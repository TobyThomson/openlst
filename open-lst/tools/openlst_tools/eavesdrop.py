from .commands import get_handler
from .translator import Translator

import serial
from time import sleep

timeout = 1.0 #seconds
rx_path = '/dev/ttyUSB1' #location of the serial device that reads the eavesdropping radio reciever

mSerialCommandHandler = get_handler(0, rx_path, None) #destination hwid dosen't matter because we aren't trying to send any messages. Only recieve.
mTranslator = Translator()

print("Eavesdropping...")

ser = serial.Serial(rx_path, baudrate=2400, timeout=0.)

def main():
    while True:
        reply_msg = mSerialCommandHandler.poll_message(timeout=timeout)
            
        if reply_msg:
            print("\nI've overheard something: ")
            print('RAW: %s' % reply_msg)
            print('DECODED AS: %s' % mTranslator.string_from_bytes(reply_msg))