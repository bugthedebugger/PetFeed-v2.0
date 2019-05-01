import RPi.GPIO as GPIO

# SET THE PIN LAYOUT TO BCM LAYOUT
GPIO.setmode(GPIO.BCM)

# MOTOR'S TERMINAL 1
left_pin = 14
# MOTOR'S TERMINAL 2
right_pin = 15


class MotorControl:
    def __init__(self, left_pin=14, right_pin=15):
        self.left_pin = left_pin
        self.right_pin = right_pin

        GPIO.setup([self.left_pin, self.right_pin], GPIO.OUT)

        self.left_pwm = GPIO.PWM(self.left_pin, 50)
        self.right_pwm = GPIO.PWM(self.right_pin, 50)
        self.left_pwm.start(0)
        self.right_pwm.start(0)

    def start(self):
        self.left_pwm.ChangeDutyCycle(0)
        self.right_pwm.ChangeDutyCycle(100)

    def start(self):
        self.left_pwm.ChangeDutyCycle(0)
        self.right_pwm.ChangeDutyCycle(0)
