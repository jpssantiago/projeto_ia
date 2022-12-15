from flask import Flask, jsonify, request, send_file
from data import Data
from kmeans import KMeans
from view import View
import matplotlib
import os

app = Flask(__name__)
matplotlib.use('agg')

@app.route('/status')
def status():
    return jsonify({ 'msg': 'Everything looks fine!' })

@app.route('/csv', methods=['POST'])
def post_csv():
    try:
        if request.data == None:
            return jsonify({ 'msg': 'Empty body data.' })

        data_list = []
        data = request.data.decode('utf-8')
        lines = data.rstrip().split('\n')
        
        for line in lines:
            attrs = line.rstrip().split(',')
            attrs = list(map(float, attrs))
            data_list.append(Data(attrs))
        
        k = int(request.headers['k-value'])
        k_means = KMeans(k, data_list)

        new_cluster = k_means.run()
        View.save_file(new_cluster)

        file = open(os.path.join('outputs', 'output.png'))

        return send_file(file.name, mimetype='image/png')
    except Exception as e:
        return jsonify({ 'msg': 'Error on request', 'err': e.__str__() }) 

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)