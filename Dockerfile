# Utilisez une image de base avec Python préinstallé
FROM python:3.8-slim

# Définissez le répertoire de travail dans le conteneur
WORKDIR /app

# Copiez le fichier requirements.txt contenant les dépendances de l'application
COPY requirements.txt .

# Installez les dépendances spécifiées dans requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copiez le reste des fichiers de l'application dans le répertoire de travail
COPY . .

# Exposez le port sur lequel l'application va écouter
EXPOSE 8000

# Commande par défaut pour démarrer l'application
CMD ["python", "app.py"]
