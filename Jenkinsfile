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
     
      stage('Start PostgreSQL') {
          steps {
              sh '''
              docker run -d --name my-postgres \
                -e POSTGRES_USER=postgres \
                -e POSTGRES_PASSWORD=secret \
                -e POSTGRES_DB=mydb
                lozanoskim/my-postgres:latest
              '''  
          }
      }

      stage('Setub DB') {
          steps {
              sh '''
                echo "Running SQL init script" 
                PGPASSWORD=secret psql -h my-postgres -U postgres -d mydb -f init-db.sql
              '''
          }
      }
   }
}
