pipeline {
   agent {
      docker {
          image 'lozanoskim/my-postgres:latest' 
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
