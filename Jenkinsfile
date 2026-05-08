pipeline {
    agent any

    environment {
        CI = 'true'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/iversonLv/jenkins-cicd.git'
            }
        }

        stage('CI') {
            steps {
                sh 'bash ci.sh'
            }
        }
    }
}