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
   }
}
