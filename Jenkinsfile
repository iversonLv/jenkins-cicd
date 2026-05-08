pipeline {
    agent any

    stages {
        stage('CI') {
            steps {
                sh '''
                docker run --rm \
                -v $WORKSPACE:/app \
                -w /app \
                node:22 \
                bash ci.sh
                '''
            }
        }
    }
}