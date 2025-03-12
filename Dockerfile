FROM python:3.12-slim

# Establece el directorio de trabajo en /app
WORKDIR /app

# Instala las dependencias del sistema necesarias para mysqlclient
RUN apt-get update && apt-get install -y \
    default-libmysqlclient-dev \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copia el archivo requirements.txt primero (para aprovechar la caché de Docker)
COPY requirements.txt .

# Instala las dependencias de Python
RUN pip install --no-cache-dir -r requirements.txt

# Copia la carpeta app al contenedor
COPY ./app /app

# Expone el puerto en el que se ejecutará la aplicación
EXPOSE 5000

# Comando para ejecutar la aplicación (ahora usando main.py)
CMD ["python", "main.py"]