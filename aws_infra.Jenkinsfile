pipeline {
    agent {label 'rhel-node-slave01'}
    environment {
        WORKDIR = "${WORKSPACE}"
    }
    tools {
       terraform 'terraform'
    }
    stages {
        stage('terraform format check') {
            steps{
                sh(
                  """
                  cd ${env.WORKDIR}/tf-aws-infra/
                  ls -la
                  """  
                ) 
            }
        }
        stage('terraform Init') {
            steps{
                sh 'ls -la'
            }
        }
        // stage('terraform apply') {
        //     steps{
        //         sh 'terraform apply --auto-approve'
        //     }
        // }
    }    
}