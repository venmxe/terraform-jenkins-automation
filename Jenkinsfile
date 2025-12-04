pipeline {
    agent any

    parameters {
        string(name: 'BUCKET_NAME', defaultValue: 'default-bucket', description: 'S3 Bucket Name')
    }

    environment {
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
                withCredentials([
                    usernamePassword(
                        credentialsId: 'aws-creds',
                        usernameVariable: 'AWS_ACCESS_KEY_ID',
                        passwordVariable: 'AWS_SECRET_ACCESS_KEY'
                    )
                ]) {
                    bat "${TF} init"
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                withCredentials([
                    usernamePassword(credentialsId: 'aws-creds', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    bat "${TF} plan -var \"bucket_name=${BUCKET_NAME}\""   // ⭐ FIXED HERE
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                withCredentials([
                    usernamePassword(credentialsId: 'aws-creds', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY')
                ]) {
                    bat "${TF} apply -auto-approve -var \"bucket_name=${BUCKET_NAME}\""  // ⭐ FIXED HERE
                }
            }
        }
    }
}
