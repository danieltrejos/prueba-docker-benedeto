# Usa una imagen base de Python con una versión específica (o la más reciente estable)
FROM python:3.13-alpine

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia los archivos requirements.txt y package.json
COPY requirements.txt ./
# COPY package.json ./

# Instala las dependencias de Python
RUN pip install --no-cache-dir -r requirements.txt

# Instala Node.js y npm (necesarios para Tailwind CSS)
# RUN apt-get update && apt-get install -y --no-install-recommends \
#    nodejs npm
RUN apk add --no-cache nodejs npm

# Copia package.json y tailwind.config.js
#COPY package.json tailwind.config.js ./
COPY package.json ./

# Instala las dependencias de JavaScript (Tailwind CSS, etc.)
RUN npm install

# Copia el resto del código fuente
COPY . .

# Ejecuta el comando de construcción de Tailwind (esto generará los archivos CSS estáticos)
# Reemplaza 'tailwind' por el comando correcto si es diferente
# RUN npm run build  # Asume que tienes un script 'build' en tu package.json que ejecuta Tailwind

# Construye los archivos CSS de Tailwind (si es necesario)
#RUN npx tailwindcss -i ./static/css/input.css -o ./static/css/output.css --minify



# Expon la puerto de la aplicación Flask
EXPOSE 5001

# Comando para ejecutar la aplicación Flask
# Asegúrate de que 'app.py' sea el punto de entrada correcto de tu aplicación
# CMD ["python", "app.py"] 
CMD ["gunicorn", "--bind", "0.0.0.0:5001", "wsgi:app"]  

# Ejecuta Gunicorn

# docker build -t benedetto-img .
# Usa powershell
# docker run --rm -d -p 5001:5001 -v "$($PWD):/app" --name benedetto-container benedetto-img
# docker run --rm -p 5001:5001 -v  --name benedetto-container benedetto-img