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

        stage('Run CI Script') {
            steps {
                sh 'bash ci.sh'
            }
        }

        stage('Archive Artifacts') {
            steps {
                archiveArtifacts artifacts: 'dist/**, coverage/**', fingerprint: true
            }
        }

    }

    post {
        always {
            publishHTML([
                reportDir: 'coverage',
                reportFiles: 'index.html',
                reportName: 'Coverage Report',
                keepAll: true,
                allowMissing: false
            ])
        }
    }
}