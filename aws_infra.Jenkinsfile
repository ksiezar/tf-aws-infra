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
                  ${env.WORKDIR}
                  pwd
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