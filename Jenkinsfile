pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Ensure Docker daemon is accessible
                    sh 'docker --version'
                    sh 'docker info'
                    sh 'echo "Building Docker Image ..."'
                    sh 'docker build -t jenkinstestreact .'
 
                }
            }
        }

        stage('Test Docker Image') {
            steps {
                script {
                    // Run Docker container
                    sh 'echo "Running Tests ..."'
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    // Authenticate with Docker registry
                    sh 'echo "Logging into Docker Hub ..."'
                }
            }
        }
    }

    post {
        always {
            echo 'Cleaning up...'
        }
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
