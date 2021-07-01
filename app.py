#from random import randint
from flask import Flask, render_template, jsonify, request, session 
from functools import wraps
import datetime
import base64
import jwt 
import os

app = Flask(__name__)
application = app
app.config['SECRET_KEY'] = 'super-secret'


with open("/home/std/web-2020-1/qt_8_lab/app/avatar.jpg", "rb") as image_file:
    encoded_string = base64.b64encode(image_file.read())

#from faker import Faker
#from flask_jwt import JWT, jwt_required, current_identity
#from werkzeug.security import safe_str_cmp


#class User(object):
 #   def __init__(self, id, username, password):
 #       self.id = id
 #       self.username = username
 #       self.password = password

 #   def __str__(self):
 #       return "User(id='%s')" % self.id

#users = [
#    User(1, 'user1', 'abcxyz'),
 #   User(2, 'user2', 'abcxyz'),
#]

def users():
    return [{'user_id': '1', 'login': 'user', 'password': 'qwerty'}]



def token_check(func):
    @wraps(func)
    def wrapped(*args, **kwargs):
        token = request.args.get('token')
        if not token:
            return jsonify({'message': 'Missing token'}), 403
        try:
            print(token)
            data = jwt.decode(token, app.config['SECRET_KEY'], algorithms=["HS256"])
        except Exception as e:
            print(e)
            
            #return jsonify({'message': 'jwt.exceptions.InvalidTokenError'}), 403
            return jsonify({'message': 'Invalid token'}), 403
        #except jwt.exceptions.DecodeError:
          #  return jsonify({'message': 'jwt.exceptions.DecodeError'}), 403
        #except jwt.exceptions.InvalidSignatureError:
        #    return jsonify({'message': 'jwt.exceptions.InvalidSignatureError'}), 403
        return func(*args, **kwargs)
    return wrapped


@app.route('/')
def index():
    return render_template('index.html')

app.config['PROPAGATE_EXCEPTIONS'] = True ####!!!!!
#app.debug = True

#jwt = JWT(app, authenticate, identity)
#print('qqqq')
#print(os.getcwd())

@app.route('/protected')
#@jwt_required()
@token_check
def protected():
    return jsonify({'current_time': datetime.datetime.now(), 'message': 'Hi', 'img': encoded_string.decode('utf-8')})
    #return  '%s' % current_identity




@app.route('/login', methods=['GET', 'POST'])
def login():
   # username = request.args.get('username')
    #username = request.args.get('login')
    #password = request.args.get('password')
    username = request.form.get('username')
    password = request.form.get('password')
    print(request.args) #
    if username and password:
        #for user in users:
        for user in users():
            #if user.username == username and user.password == password:
            if user['login'] == username and user['password'] == password:
                session['logged_in'] = True
                token = jwt.encode({
                    'user': username, 
                    'exp': datetime.datetime.utcnow() 
                    + datetime.timedelta(seconds=90)
                }, app.config['SECRET_KEY'])
                return jsonify({'token': token})
            else:
                return jsonify({'message': 'Authentication failed'}), 403
    return render_template('login.html')


if __name__ == '__main__':
    #app.run(debug=True, ssl_context=('cert.pem', 'key.pem'))
    app.run()
