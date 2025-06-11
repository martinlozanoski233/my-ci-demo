pipeline {
   agent any

   stages {

      stage('Install psql') {
         steps {
            sh '''
            apt-get update && apt-get install -y postgresql-client
            psql --version
            '''
         }
      }

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
