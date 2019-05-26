# Libraries
import RPi.GPIO as GPIO
import time


class Distance:

    def __init__(self, GPIO, GPIO_TRIGGER=18, GPIO_ECHO=23):
        self.GPIO = GPIO
        self.GPIO_TRIGGER = GPIO_TRIGGER
        self.GPIO_ECHO = GPIO_ECHO
        self.GPIO.setup(GPIO_TRIGGER, GPIO.OUT)
        self.GPIO.setup(GPIO_ECHO, GPIO.IN)

    def distance(self):
        # set Trigger to HIGH
        self.GPIO.output(self.GPIO_TRIGGER, True)

        # set Trigger after 0.01ms to LOW
        time.sleep(0.00001)
        self.GPIO.output(self.GPIO_TRIGGER, False)

        StartTime = time.time()
        StopTime = time.time()

        # save StartTime
        while self.GPIO.input(self.GPIO_ECHO) == 0:
            StartTime = time.time()

        # save time of arrival
        while self.GPIO.input(self.GPIO_ECHO) == 1:
            StopTime = time.time()

        # time difference between start and arrival
        TimeElapsed = StopTime - StartTime
        # multiply with the sonic speed (34300 cm/s)
        # and divide by 2, because there and back
        distance = (TimeElapsed * 34300) / 2

        return distance

    def fish(self):
        max = 11
        min = 3

        distance = self.distance()

        print(distance)

        if distance >= max:
            distance = max
        elif distance <= min:
            distance = min

        print(distance)

        percentRemain = ((int(distance) - min) * 100) / (max - min)

        return 100 - percentRemain
