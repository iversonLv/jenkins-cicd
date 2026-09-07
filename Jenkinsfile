pipeline {
    agent any
    parameters {
        string(name: 'PR_NUMBER', defaultValue: '', description: 'GitHub PR number from n8n')
        string(name: 'BRANCH', defaultValue: '', description: 'PR branch')
        string(name: 'SHA', defaultValue: '', description: 'Commit SHA')
    }
    environment {
        CI = 'true'
    }

    stages {
        stage('Set Build Metadata') {
            steps {
                script {
                    def commit = sh(script: "git rev-parse --short HEAD", returnStdout: true).trim()

                    def branch = env.GIT_BRANCH?.replace('origin/', '')

                    def author = sh(
                        script: "git log -1 --pretty=%an",
                        returnStdout: true
                    ).trim()

                    currentBuild.displayName = "#${BUILD_NUMBER} ${branch} ${commit}"
                    currentBuild.description = """By: ${author}"""
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
                archiveArtifacts artifacts: 'dist/**, coverage/**, artifact/*.zip', fingerprint: true
            }
        }

    }

    post {
        always {
            publishHTML([
                reportDir: 'coverage',
                reportFiles: 'index.html',
                reportName: 'UT coverage',
                keepAll: true,
                allowMissing: false,
                alwaysLinkToLastBuild: true
            ])
        }
        success {
            script { notifyN8n('SUCCESS') }
        }
        failure {
            script { notifyN8n('FAILURE') }
        }
    }
}

def notifyN8n(String status) {
    def payload = groovy.json.JsonOutput.toJson([
        pr_number   : params.PR_NUMBER,
        status       : status,
        job_name     : env.JOB_NAME,
        build_number : env.BUILD_NUMBER,
        build_url    : env.BUILD_URL
    ])
    sh """
        curl -sS -X POST 'https://iversonlv.app.n8n.cloud/webhook/jenkins-build-result' \
             -H 'Content-Type: application/json' \
             -d '${payload}'
    """
}
