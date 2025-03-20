import os
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World! desde flask usando docker'

@app.route('/hello')
def hello():
    return 'Hola desde desde docker'

@app.route('/volumen')
def volumen():
    return 'Prueba de actualizar automatique'

print(app.url_map)

if __name__ == '__main__':
    # Variable de entorno PORT
    port = int(os.environ.get('PORT', 5001))
    app.run(debug=True, host='0.0.0.0', port=port)
    # Para ejecutar el Dockerfile en Docker:
    # docker build -t flask-app.
    # docker run -p 5000:5000 flask-app

