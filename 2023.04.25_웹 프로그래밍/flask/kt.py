from flask import *
import pymongo, os

app = Flask(__name__)
app.secret_key = os.urandom(24)
client = pymongo.MongoClient('mongodb://kt:ktpw@3.34.192.77:27017')

def is_login():
    try:
        session['id']
        return True
    except:
        return False

@app.route('/')
def index():
    user = {}
    if is_login():
        user['name'] = session['id']
    return render_template('index.html', user=user)

@app.route('/join')
def join():
    return render_template('join.html')

@app.route('/login')
def login():
    return render_template('login.html')

@app.route('/logout')
def logout():
    session.pop('id')
    return redirect('/')

@app.route('/api/join', methods=['POST'])
def api_join():
    account = dict(request.values)
    print('account:', account)
    
    # connect collection
    collection = client.mongo.users
    
    result = {}
    # check account
    document = collection.find_one({'id' : account['id']})
    if document: # already has acount
        result['msg'] = 'Already has account.'
    else: # save account
        save_result = collection.insert_one(account)
        result['inserted_id'] = str(save_result.inserted_id)
        result['msg'] = 'Joined Account.'
    
    return jsonify(result), 200

@app.route('/api/login', methods=['POST'])
def api_login():
    account = dict(request.values)
    
    # check account on database
    collection = client.mongo.users
    document = collection.find_one({
            'id': account['id'], 'pw': account['pw']
        })
    result = {}
    if document: # login
        session['id'] = account['id']
        result['msg'] = 'logined'
    else: # there is no account
        result['msg'] = 'no account'
    return jsonify(result)
    


# debug : 개발자 모드 : 코드 수정하면 바로 서버 재시작해서 적용
app.run(debug=True)