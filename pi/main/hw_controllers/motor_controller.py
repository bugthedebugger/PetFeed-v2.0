from .hx711 import HX711
import RPi.GPIO as GPIO
import time
# SET THE PIN LAYOUT TO BCM LAYOUT
GPIO.setmode(GPIO.BCM)


# MOTOR CONTROLLER CLASS
class MotorController:
    def __init__(self, left_pin=5, right_pin=6):
        # ASSIGN THE PIN NUMBERS, 14 AND 15 IF NONE PASSED
        self.left_pin = left_pin
        self.right_pin = right_pin
        # INITIALIZE LEFT AND RIGHT PINS OF THE MOTOR AS OUTPUT
        GPIO.setup([self.left_pin, self.right_pin], GPIO.OUT)
        # INITIALIZE LEFT AND RIGHT PINS AS PWM OUTPUT AT 50hz
        self.left_pwm = GPIO.PWM(self.left_pin, 50)
        self.right_pwm = GPIO.PWM(self.right_pin, 50)
        # INITIALIZE THE PINS AT 0hz i.e. BOTH PINS SET AS OFF
        self.left_pwm.start(0)
        self.right_pwm.start(0)
        # INITIALIZE WEIGHT SENSOR
        try:
            self.wt = HX711(dout_pin=21, pd_sck_pin=20)
            self.weightSensor = True
        except:
            self.wt = None
            self.weightSensor = False

    # FUNCTION THAT RUNS THE MOTOR
    def start(self):
        # CHANGING DUTY CYCLE TO 100 MEANS SUPPLY FULL 5v TO THAT PIN
        # WHILE 0 MEANS NONE
        self.left_pwm.ChangeDutyCycle(0)
        self.right_pwm.ChangeDutyCycle(100)

    def stop(self):
        self.left_pwm.ChangeDutyCycle(0)
        self.right_pwm.ChangeDutyCycle(0)

    def fish(self, duration=1):
        self.start()
        time.sleep(duration)
        self.stop()

    def __del__(self):
        GPIO.cleanup()

    # FUNCTION TO CLEAN UP USED RPi CHANNELS
    def end(self):
        GPIO.cleanup()
