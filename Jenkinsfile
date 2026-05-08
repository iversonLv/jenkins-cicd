pipeline {
    agent any

    environment {
        CI = 'true'
    }

    stages {
        stage('Set Build Name') {
          steps {
              script {
                  def commit = sh(script: "git rev-parse --short HEAD", returnStdout: true).trim()
                  def branch = sh(script: "git rev-parse --abbrev-ref HEAD", returnStdout: true).trim()

                  currentBuild.displayName = "#${BUILD_NUMBER} ${branch} ${commit}"
              }
          }
        }

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
                allowMissing: false,
                alwaysLinkToLastBuild: true
            ])
        }
    }
}