from flask import Flask, jsonify, request

app = Flask(__name__)

@app.route('/status')
def status():
    return jsonify({ 'msg': 'Everything looks fine!' })

@app.route('/csv', methods=['POST'])
def post_csv():
    try:
        file = request.files['file']
        file_data = file.read().decode("latin-1")
        print(file_data)

        return jsonify({ 'msg': 'File received.' })
    except Exception as e:
        print(e)
        return jsonify({ 'msg': 'File not found.' })

if __name__ == '__main__':
    app.run(port=8080)