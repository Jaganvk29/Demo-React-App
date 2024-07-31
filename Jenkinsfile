pipeline {
    agent any

    stages {
        stage('Clone repository') {
            steps {
                /* Let's make sure we have the repository cloned to our workspace */
                checkout scm
            }
        }

        stage('Build image') {
            steps {
                script {
                    /* This builds the actual image; synonymous to
                     * docker build on the command line */
                    app = docker.build("getintodevops/hellonode")
                }
            }
        }

        stage('Test image') {
            steps {
                script {
                    /* Ideally, we would run a test framework against our image.
                     * For this example, we're using a Volkswagen-type approach ;-) */
                    app.inside {
                        sh 'echo "Tests passed"'
                    }
                }
            }
        }

        stage('Push image') {
            steps {
                echo 'Image Pushed ...'
                }
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
