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
        stage('terraform Validate') {
            steps{
                sh(
                  """
                  cd ${env.WORKDIR}/tf-aws-infra/
                  terraform validate
                  """  
                ) 
            }
        }
        // stage('terraform apply') {
        //     steps{
        //         sh 'terraform apply --auto-approve'
        //     }
        // }
    }    
}