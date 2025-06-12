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
     
      stage('Install Docker') {
            steps {
                echo 'Checking Docker installation'
                sh '''
                if ! command -v docker &> /dev/null
                then
                    echo "Docker not found, installing..."
                    sudo apt-get update
                    sudo apt-get install -y docker.io
                else
                    echo "Docker already installed"
                fi
                '''
            }
      }
   }
}
