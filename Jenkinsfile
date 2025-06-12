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

      stage('Start PostgreSQL Container') {
            steps {
                sh '''
                docker run -d --name my_postgres \
                    -e POSTGRES_USER=postgres \
                    -e POSTGRES_PASSWORD=secret \
                    -e POSTGRES_DB=mydatabase \
                    lozanoskim/my-postgres:latest
                '''
            }
      }
   }
}
