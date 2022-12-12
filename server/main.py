from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route('/status')
def status():
    return jsonify({ 'msg': 'Everything looks fine!' })

@app.route('/csv', methods=['POST'])
def post_csv():
    try:
        data = request.data

        if data == None:
            return jsonify({ 'err': 'Empty body data.' })

        print(data.decode('utf-8'))

        return jsonify({ 'msg': 'File received.' })
    except:
        return jsonify({ 'err': 'Error on request' }) 

if __name__ == '__main__':
    app.run(port=8080)