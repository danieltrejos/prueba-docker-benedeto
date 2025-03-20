import os
from flask import Flask, jsonify, render_template

app = Flask(__name__)

@app.route('/')
def hello_world():
    return render_template('index.html')

@app.route('/hello')
def hello():
    return 'Hola desde desde docker'

@app.route('/volumen')
def volumen():
    return 'Prueba de actualizar automatique'

@app.route('/health')
def health_check():
    return jsonify({"status": "ok"}), 200

print(app.url_map)

if __name__ == '__main__':
    # Variable de entorno PORT
    port = int(os.environ.get('PORT', 5001))
    app.run(debug=False, host='0.0.0.0', port=port)
    # Para ejecutar el Dockerfile en Docker:
    # docker build -t flask-app.
    # docker run -p 5000:5000 flask-app

