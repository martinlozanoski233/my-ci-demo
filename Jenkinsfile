pipeline {
   agent {
      label 'docker-agent-ci'
   }

   stages {
      stage('Check environment') {
          steps {
              sh '''
              echo "Running as: $(whoami)"
              docker --version
              psql --version
              git --version
              '''
          }
      }
   }
}
