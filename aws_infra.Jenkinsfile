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
                  terraform init
                  """  
                ) 
            }
        }
        stage('Terraform Validate') {
            steps{
                sh(
                  """
                  cd ${env.WORKDIR}/tf-aws-infra/
                  terraform fmt
                  terraform validate
                  """  
                ) 
            }
        }
        stage('Terraform Plan') {
            steps{
                sh(
                  """
                  cd ${env.WORKDIR}/tf-aws-infra/
                  terraform plan
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