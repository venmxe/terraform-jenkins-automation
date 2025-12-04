pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-creds').username
        AWS_SECRET_ACCESS_KEY = credentials('aws-creds').password
        TF = "C:/TF/terraform/terraform.exe"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/venmxe/terraform-jenkins-automation.git'
            }
        }

        stage('Terraform Init') {
            steps {
                bat "${TF} init"
            }
        }

        stage('Terraform Plan') {
            steps {
                bat "${TF} plan"
            }
        }

        stage('Terraform Apply') {
            steps {
                bat "${TF} apply -auto-approve"
            }
        }
    }
}
