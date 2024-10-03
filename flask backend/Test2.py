import flask
app = flask.Flask(__name__) 
@app.route('/api',methods=['GET'])
def hello_world():
	d = {}
	d['Username'] = str(flask.request.args['Username'])
	d['Password'] = str(flask.request.args['Password'])
	return flask.jsonify(d)
if __name__ == '__main__':
    app.run(host='0.0.0.0')
