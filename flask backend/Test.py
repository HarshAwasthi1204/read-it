import flask
from flask_sqlalchemy import SQLAlchemy
import supabase

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

tid = 1
emailid = "lol@gmail.com"
lolusername = "lol"
lolpassword = "lolcool"
session = True

d = {}

@app.route('/insert')
def test_insert():
    data = Test1(id=2,email_id=emailid,username="lol",password = lolpassword, session_active = session)
    db.session.add(data)
    db.session.commit()
    return 'You mah boi are a genius'

@app.route('/select')
def test_select():
    datalol = supabasestuff.table("test1").select("*").execute()
    datalol1 = str(datalol)
    return redirect('test')

@app.route('/test')
def test():
    return 'YOU MAH BOI HAVE DONE IT'




if __name__ == '__main__':
    app.run(host="0.0.0.0",debug = True)
