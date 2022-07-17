pipeline {
    agent {label 'rhel-node-slave01'}
    tools {
       terraform 'terraform'
    }
    stages {
        stage('terraform format check') {
            steps{
                sh(
                  """
                  cd ${env.WORKDIR}
                  ls -la
                  """  
                ) 
            }
        }
        stage('terraform Init') {
            steps{
                // sh 'terraform init'
            }
        }
        // stage('terraform apply') {
        //     steps{
        //         sh 'terraform apply --auto-approve'
        //     }
        // }
    }    
}