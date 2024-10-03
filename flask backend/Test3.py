import flask
import requests
import json
from flask_sqlalchemy import SQLAlchemy
import supabase
import ast

db = SQLAlchemy()
app = flask.Flask(__name__)
app.debug = True
app.config["SQLALCHEMY_DATABASE_URI"] = "postgresql://postgres:DaemonDevslol@db.zthdyyiqdqkuyzfnyfdf.supabase.co:5432/postgres"
db.init_app(app)

url = "https://zthdyyiqdqkuyzfnyfdf.supabase.co"
key = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inp0aGR5eWlxZHFrdXl6Zm55ZmRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE2NzU4NjYzNzAsImV4cCI6MTk5MTQ0MjM3MH0.X1ONsH7sb6SAuUqeqhieP8LUkUCzconUiJZSHGuyS2c"
supabasestuff = supabase.create_client(url, key)

class Test1(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    email_id = db.Column(db.String)
    username = db.Column(db.String, unique = True)
    password = db.Column(db.String)
    session_active = db.Column(db.Boolean)
with app.app_context():
    db.create_all()

@app.route('/create',methods=['GET','POST'])
def test_insert():
    dicfinallol = {}
    cremailval = str(flask.request.args['Email'])
    cruserval = str(flask.request.args['Username'])
    crpassval = str(flask.request.args['Password'])
    data = Test1(id=3,email_id=cremailval,username=cruserval,password = crpassval, session_active = True)
    db.session.add(data)
    db.session.commit()
    lolcr = {}
    lolcr["flag"] = "True"
    return flask.jsonify(lolcr)

@app.route('/select')
def test_select():
    datalol = supabasestuff.table("test1").select("*").execute()
    datalol1 = str(datalol)
    return redirect('test')

@app.route('/test')
def test():
    return 'YOU MAH BOI HAVE DONE IT'

@app.route('/login',methods=['GET'])
def login():
    dicfinal = {}
    userval = str(flask.request.args['Username'])
    passval = str(flask.request.args['Password'])
    datalol = supabasestuff.table("test1").select("*").execute()
    datalol1 = str(datalol)
    stringlol = ""
    placestart = datalol1.find("[")
    placeend = datalol1.find("]")

    for i in range(placestart,placeend+1):
        stringlol += datalol1[i]

    stringlist = ast.literal_eval(stringlol)
    i=0
    for dic in stringlist:
            dicfinal['Query'+str(i)] = dic
            i+=1
    dicfinal1 = str(dicfinal)
    dicfinal2 = dicfinal1.replace("'","\"")
    datasemifinal = json.loads(dicfinal2)
    datafinal = json.dumps(datasemifinal)
    datafinal1 = str(datafinal)
    lol = {}
    for j in dicfinal.values():
        if j["username"] == userval and j["password"] == passval:
            lol["flag"] = "True"
            break
                
    return flask.jsonify(lol)

#usernamefinal = "hank"
#passwordfinal = "lol"


#@app.route('/testlogin',methods=['GET'])
#def testlogin():
#    return 'lol'


#print(testretrieve())


if __name__ == '__main__':
    app.run(host="0.0.0.0",debug = True)
