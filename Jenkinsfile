pipeline {
    agent { dockerfile true }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Install dependencies') {
            steps {
                echo 'Installing dependencies'
                nodejs(nodeJSInstallationName: 'Node-22.4.1') {
                    sh 'docker --version'
                    sh 'npm install'
                }
            }
        }
        stage('Build') {
            steps {
                echo 'Building the app'
                nodejs(nodeJSInstallationName: 'Node-22.4.1') {
                    sh 'npm run build'
                }
            }
        }
        stage('Test') {
            steps {
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
