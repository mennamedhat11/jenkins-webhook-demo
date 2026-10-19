pipeline {
    agent any

    options {
        timeout(time: 5, unit: 'MINUTES')
        timestamps()
    }

    triggers {
        // Runs automatically when GitHub sends a push webhook
        githubPush()
    }

    environment {
        // Set NOTIFY_EMAIL in Jenkins (Manage Jenkins > System > Global properties)
        // so the address is not hard-coded in a public repository.
        NOTIFY_EMAIL = "${env.NOTIFY_EMAIL ?: ''}"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Run Code') {
            steps {
                // Change this command to match your language:
                //   Python: sh 'python3 main.py'  or  sh 'pytest'
                //   Node:   sh 'npm install && npm test'
                //   Java:   sh 'mvn test'
                sh 'chmod +x hello.sh && ./hello.sh'
            }
        }
    }

    post {
        success {
            echo 'Build passed ✅'
        }
        failure {
            echo 'Build failed ❌'
            script {
                if (env.NOTIFY_EMAIL) {
                    mail to: env.NOTIFY_EMAIL,
                         subject: "FAILED: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                         body: """The build failed.

Job:   ${env.JOB_NAME}
Build: #${env.BUILD_NUMBER}
Logs:  ${env.BUILD_URL}console
"""
                } else {
                    echo 'NOTIFY_EMAIL is not set, skipping failure email.'
                }
            }
        }
    }
}
