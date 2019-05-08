
import os

from flask import Flask
from flask import jsonify
from flask import request
from models.model import Model
from hw_controllers.motor_controller import MotorController


motors = MotorController()


class FlaskServer:

    def __init__(self, dbController):
        self.db = dbController

    app = Flask(__name__)
    request_error = {
        'connection': 'local',
        'status': 'online',
        'message': 'error request type'
    }

    @app.route('/', methods=['GET', 'POST'])
    def home():
        response = {
            'status': 'online',
            'connection': 'local'
        }
        if request.method == 'GET' or request.method == 'POST':
            return jsonify(response)

    # FEEDING ROUTE
    @app.route('/feed', methods=['GET', 'POST'])
    def feed():
        if request.method == 'GET' or request.method == 'POST':
            # device feed() #not yet completed\
            motors.fish()
            response = {
                'connection': 'local',
                'status': 'success',
                'message': 'fed successfully'
            }

            return jsonify(response)

        else:
            response = request_error
            return jsonify(response)

    @app.route('/start-hopper')
    def startHopper():
        if request.method == 'GET' or request.method == 'POST':
            motors.start()
            response = {
                'connection': 'local',
                'status': 'success',
                'message': 'hopper started'
            }

    @app.route('/stop-hopper')
    def startHopper():
        if request.method == 'GET' or request.method == 'POST':
            motors.stop()
            response = {
                'connection': 'local',
                'status': 'success',
                'message': 'hopper stopped'
            }

    @app.route('/restart')
    def restart():
        os.system("sudo reboot")

    @app.route('/shutdown')
    def shutdown():
        os.system("sudo poweroff")

    def start(self):
        self.app.run(host='0.0.0.0', port=8848, debug=True)

    def fish(self):
        motors.fish()
