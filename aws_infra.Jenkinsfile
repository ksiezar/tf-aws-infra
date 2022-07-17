pipeline {
    agent {label 'rhel-node-slave01'}
    environment {
        WORKDIR = "${WORKSPACE}"
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