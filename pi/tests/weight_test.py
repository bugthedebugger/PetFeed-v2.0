#! /usr/bin/python3

from hx711 import HX711
import RPi.GPIO as GPIO

try:
    GPIO.setmode(GPIO.BCM)

    hx = HX711(dout_pin=21, pd_sck_pin=20)

    knownWeight = 100

    GPIO.cleanup()
except:
    print('error occured')
