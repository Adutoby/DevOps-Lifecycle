pipeline {
    agent any

    stages {
        stage('Build the website') {
            steps {
                script {
                    // Use the Docker plugin to build the Docker image from the Dockerfile
                    docker.build("myimage", "-f Dockerfile .")
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Use a shell script or other testing tools to run the test cases
                    sh "curl http://localhost:3000"
                }
            }
        }

        stage('Push to production') {
            steps {
                script {
                    // Use a shell script to push the Docker image to production
                    sh "docker push myimage"
                }
            }
        }
    }
}
