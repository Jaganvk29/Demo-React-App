pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Install dependencies') {
            steps {
                sh 'npm install'
                echo 'Installing dependencies'
            }
        }
        stage('Build') {
            steps {
                sh 'npm run build'
                echo 'Building the app'
            }
        }
        stage('Test') {
            steps {
                sh 'npm test'
                echo 'Testing the app'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying the app'
                // Add your deployment steps here
            }
        }
    }
    post {
        always {
            echo 'Cleaning up...'
            // Add any cleanup steps if necessary
        }
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
