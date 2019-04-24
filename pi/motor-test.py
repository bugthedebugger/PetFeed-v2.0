import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BCM)
GPIO.setup(14, GPIO.OUT)
GPIO.setup(15, GPIO.OUT)

left = GPIO.PWM(14, 50)
right = GPIO.PWM(15, 50)

left.start(0)
right.start(0)

left.ChangeDutyCycle(0)
right.ChangeDutyCycle(100)


GPIO.cleanup()
