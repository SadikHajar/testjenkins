pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git branch: 'main', url: 'https://github.com/SadikHajar/testjenkins.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("testjenkins-api:${env.BUILD_ID}")
                }
            }
        }
        stage('Run Docker Container') {
            steps {
                script {
                    // Stop et supprime l'ancien container (si existe)
                    sh "docker stop testjenkins-api || true"
                    sh "docker rm testjenkins-api || true"
                    // Lance un nouveau container
                    sh "docker run -d -p 5000:5000 --name testjenkins-api testjenkins-api:${env.BUILD_ID}"
                }
            }
        }
    }
}
