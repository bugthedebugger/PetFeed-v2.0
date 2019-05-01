import RPi.GPIO as GPIO

# SET THE PIN LAYOUT TO BCM LAYOUT
GPIO.setmode(GPIO.BCM)


class MotorControl:
    def __init__(self, left_pin=14, right_pin=15):
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

    # FUNCTION THAT RUNS THE MOTOR
    def start(self):
        # CHANGING DUTY CYCLE TO 100 MEANS SUPPLY FULL 5v TO THAT PIN
        # WHILE 0 MEANS NONE
        self.left_pwm.ChangeDutyCycle(0)
        self.right_pwm.ChangeDutyCycle(100)

    def stop(self):
        self.left_pwm.ChangeDutyCycle(0)
        self.right_pwm.ChangeDutyCycle(0)


# FUNCTION TO CLEAN UP USED RPi CHANNELS
def end():
    GPIO.cleanup()
