pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID     = credentials('aws-creds').username
        AWS_SECRET_ACCESS_KEY = credentials('aws-creds').password

        // Path to your terraform.exe
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
                bat "${env.TF} init"
            }
        }

        stage('Terraform Plan') {
            steps {
                bat "${env.TF} plan"
            }
        }

        stage('Terraform Apply') {
            steps {
                bat "${env.TF} apply -auto-approve"
            }
        }
    }
}
