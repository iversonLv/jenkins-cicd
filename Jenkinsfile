pipeline {
    agent any

    environment {
        CI = 'true'
    }

    stages {
        stage('CI') {
            steps {
                sh './ci.sh'
            }
        }
    }
}