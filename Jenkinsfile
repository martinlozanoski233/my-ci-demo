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

      stage('Setub DB') {
          steps {
              sh '''
                echo "Running SQL init script"
                docker cp init-db.sql my-postgres:/init-db.sql 
                docker exec my-postgres bash -c "PGPASSWORD=secret psql -U postgres -d mydb -f /init-db.sql"
              '''
          }
      }
   }
}
