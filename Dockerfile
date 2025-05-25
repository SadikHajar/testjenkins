# Image de base officielle python 3.11
FROM python:3.11-slim

# Met le répertoire de travail
WORKDIR /app

# Copier les fichiers requirements.txt et app.py dans le conteneur
COPY requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Expose le port 5000
EXPOSE 5000

# Commande pour lancer l’API
CMD ["python", "app.py"]
