pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'
        EKS_CLUSTER = 'static-site-cluster'
        ECR_REPO = 'static-site'
        IMAGE_TAG = "latest"
        AWS_ACCOUNT_ID = '588738586526'
    }

    stages {
        stage('Clone Infra Repo') {
            steps {
                git 'https://github.com/ganesh-ui/infra-eks-static-site.git'
            }
        }

        stage('Terraform Init & Plan') {
            steps {
                sh '''
                terraform init
                terraform plan -var-file=environments/dev.tfvars
                '''
            }
        }

        stage('Terraform Apply') {
            steps {
                sh '''
                terraform apply -auto-approve -var-file=environments/dev.tfvars
                '''
            }
        }

        stage('Build & Push Docker Image') {
            steps {
                sh '''
                git clone https://github.com/ganesh-ui/GaneshGym.git website
                docker build -t $ECR_REPO:$IMAGE_TAG ./website
                aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com
                docker tag $ECR_REPO:$IMAGE_TAG $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPO:$IMAGE_TAG
                docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com/$ECR_REPO:$IMAGE_TAG
                '''
            }
        }

        stage('Deploy to EKS') {
            steps {
                sh '''
                aws eks update-kubeconfig --region $AWS_REGION --name $EKS_CLUSTER
                kubectl apply -f k8s/deployment.yaml
                kubectl apply -f k8s/service.yaml
                '''
            }
        }
    }

    post {
        success {
            echo 'Infrastructure and website successfully deployed!'
        }
        failure {
            echo 'Deployment failed! Rolling back...'
            sh 'terraform destroy -auto-approve -var-file=environments/dev.tfvars'
        }
    }
}
