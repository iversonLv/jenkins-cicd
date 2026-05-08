pipeline {
    agent {
        docker {
            image 'node:22'
        }
    }

    environment {
        CI = 'true'
    }

    stages {
        stage('CI') {
            steps {
                sh 'bash ci.sh'
            }
        }
    }
}