pipeline {
    agent {label 'rhel-node-slave01'}
    environment {
        WORKDIR = "${WORKSPACE}"
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    }
    tools {
       terraform 'terraform'
    }
    stages {
        stage('Terraform Init') {
            steps{
                sh(
                  """
                  cd ${env.WORKDIR}/tf-aws-infra/
                  terraform init -no-color
                  """  
                ) 
            }
        }
        stage('Terraform Validate') {
            steps{
                sh(
                  """
                  cd ${env.WORKDIR}/tf-aws-infra/
                  terraform fmt -no-color
                  terraform validate -no-color
                  """  
                ) 
            }
        }
        stage('Terraform Plan') {
            steps{
                sh(
                  """
                  cd ${env.WORKDIR}/tf-aws-infra/
                  terraform plan -no-color
                  terraform show tfplan > tfplan.txt
                  """  
                )
            }
        }
        // stage('terraform apply') {
        //     steps{
        //         sh(
        //           """
        //           cd ${env.WORKDIR}/tf-aws-infra/
        //           terraform apply --auto-approve
        //           """  
        //         )
        //     }
        // }
    }    
}