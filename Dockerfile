FROM python:3.12-slim

# Instala las dependencias del sistema necesarias
RUN apt-get update && apt-get install -y \
    default-libmysqlclient-dev \
    build-essential \
    && apt-get clean

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia los archivos de la aplicación al contenedor
COPY . /app

# Instala las dependencias de Python
RUN pip install --no-cache-dir -r requirements.txt

# Expone el puerto en el que se ejecutará la aplicación
EXPOSE 8080

# Comando para ejecutar la aplicación
CMD ["python", "/app/main.py"]
