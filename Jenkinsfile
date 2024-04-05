pipeline {
    environment {
        ID_DOCKER = "${ID_DOCKER_PARAMS}"
        IMAGE_NAME = "projet1"
        IMAGE_TAG = "latest"
        STAGING = "${ID_DOCKER}-staging"
        PRODUCTION = "${ID_DOCKER}-production"
        EMAIL_ADDRESS = 'notif@joelkoussawo.me'
    }
    
    agent any
    
    stages {
        stage('Clonage du Repository') {
            steps {
                git 'https://github.com/Fazeur95/Projet1.git'
            }
        }
        
        stage('Build de l\'Artefact') {
            steps {
                sh "docker build -t $IMAGE_NAME:$IMAGE_TAG ."
            }
        }
        
        stage('Tests') {
            steps {
                // Ajoutez ici les commandes pour exécuter vos tests
            }
        }
        
        stage('Enregistrement de l\'Artefact') {
            steps {
                sh "docker tag $IMAGE_NAME:$IMAGE_TAG $STAGING"
                sh "docker push $STAGING"
            }
        }
        
        stage('Déploiement') {
            steps {
                // Déployez l'image sur votre environnement de production
                sh "docker pull $STAGING"
                sh "docker tag $STAGING $PRODUCTION"
                sh "docker push $PRODUCTION"
            }
        }
    }
    
   
}
