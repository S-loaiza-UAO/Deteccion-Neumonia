# Usamos una imagen base de Python específica
FROM python:3.9-slim

# Instalamos las dependencias del sistema
RUN apt-get update && apt-get install -y \
    python3-opencv \
    && rm -rf /var/lib/apt/lists/* 

# Establecemos el directorio de trabajo en el contenedor
WORKDIR /home/src

# Copia los archivos necesarios al contenedor
COPY requirements.txt .

# Instalamos las dependencias de Python
RUN pip install --no-cache-dir -r requirements.txt

# Copiar el resto de los archivos al contenedor
COPY . .

# Exponer el puerto (si tu aplicación lo necesita)
EXPOSE 8501

# Comando para ejecutar la aplicación
CMD ["python", "detector_neumonia.py"]
