pipeline {
    agent any

    stages {
        stage('CI') {
            steps {
                sh '''
                docker build -t my-ci .
                docker run --rm my-ci
                '''
            }
        }
    }
}