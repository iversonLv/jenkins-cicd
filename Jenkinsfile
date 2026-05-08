pipeline {
    agent any

    environment {
        CI = 'true'
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/iversonLv/jenkins-cicd.git'
            }
        }

        stage('CI') {
            steps {
                sh './ci.sh'
            }
        }
    }
}