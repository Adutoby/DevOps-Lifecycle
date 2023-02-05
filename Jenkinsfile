pipeline {
    agent any

    stages {
        stage('Build the website') {
            steps {
                script {
                    docker.build("website-image", "-f Dockerfile .")
                }
            }
        }
        
        stage('Test') {
            steps {
                sh './run-tests.sh'
            }
        }
    }
}

