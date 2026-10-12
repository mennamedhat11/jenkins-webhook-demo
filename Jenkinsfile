pipeline {
    agent any

    triggers {
        // بيشتغل أوتوماتيك لما GitHub يبعت webhook (Push)
        githubPush()
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Run Code') {
            steps {
                // غيّر الأمر ده حسب لغتك:
                // Python:  sh 'python3 main.py'   أو   sh 'pytest'
                // Node:    sh 'npm install && npm test'
                // Java:    sh 'mvn test'
                sh 'python3 main.py'
            }
        }
    }

    post {
        failure {
            mail to: 'your-email@example.com',
                 subject: "FAILED: ${env.JOB_NAME} #${env.BUILD_NUMBER}",
                 body: """البيلد فشل ❌

Job: ${env.JOB_NAME}
Build: #${env.BUILD_NUMBER}
Logs: ${env.BUILD_URL}console
"""
        }
        success {
            echo 'Build passed ✅'
        }
    }
}
