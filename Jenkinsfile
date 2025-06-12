pipeline {
   agent {
      label 'agent1'
   }

   stages {

      stage('Check environment') {
          steps {
              sh '''
              echo "Running as: $(whoami)"
              docker --version
              git --version
              '''
          }
      }
     
      stage('Install Docker') {
            steps {
                echo 'Checking Docker installation'
                sh '''
                if ! command -v docker &> /dev/null; then
                echo "Docker is not installed, aborting pipeline."
                exit 1
                else
                echo "Docker is installed"
                fi
                '''
            }
      }
   }
}
