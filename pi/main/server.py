import pusher
from flask import Flask
from flask import request
from flask import jsonify
from flask import copy_current_request_context
import pymysql.cursors


  #FLASK SERVER WITHOUT APPLICATIONFACTORY


app=Flask(__name__)
request_error={
	'connection':'local',
	'status':'online',
	'message':'error request type'
}
@app.route('/',methods=['GET','POST'])

def home():
	response={
	'status':'online',
	'connection':'local'
	}
	if request.method=='GET' or request.method=='POST':
		return jsonify(response)
	


#FEEDING ROUTE


@app.route('/feed',methods=['GET','POST'])

def feed():
	if request.method=='GET' or request.method=='POST':
		#device feed() #not yet completed
		response={
		'connection':'local',
		'status':'success',
		'message':'fed successfully'
		}

		return jsonify(response)

	else:
		response=request_error
		return jsonify(response)


#USER SETUP
@app.route('/set/user',methods=['GET','POST'])
def setupUser():
	if request.method=='GET':
		email=request.args.get('email')
		if email is None:
			return{
		'status':'error',
		'message':'email field is required'
		}

	elif request.method=='POST':

		email=request.form['email']
		if email is None:
			return{
			'status':'error',
			'message':'email field is required'
			}

	else:
		response=request_error
		return jsonify(response)

	with connection.cursor as cursor:
		try:
			query="DROP FROM users"
			cursor.execute(query)

			query="DROP FROM schedules"
			cursor.execute(query)

			query="INSERT INTO users(email) VALUES('%s')"
			cursor.execute(query,email)
			connection.commit()

			response={
			'connection':'local',
			'status':'success',
			'message':'user has been registered'
			}

			return jsonify(response)

		except:
			connection.rollback()
			response={
			'connection':'local',
			'status':'error',
			'message':'there was an error registering the user'
			}

	@app.route('/restart')	
	def restart():
		os.system("sudo reboot")

	@app.route('shutdown')
	def shutdown():
		os.system("sudo poweroff")




		
	app.run()

