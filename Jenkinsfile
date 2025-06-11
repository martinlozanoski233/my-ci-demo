pipeline {
   agent {
      docker {
          image 'postgres:13' 
          args '-u root'
      }
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
