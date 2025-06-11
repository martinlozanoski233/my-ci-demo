pipeline {
    agent {
       docker {
           image 'lozanoskim/my-postgres:latest'
           args '-u root'
       }
    }    
        
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Check Docker') {
            steps {
                sh 'docker --version'
            }
        } 
         stage('Start PostgreSQL') {
            steps {
                sh '''
                docker run -d --name my_postgres \
                    -e POSTGRES_USER=postgres \
                    -e POSTGRES_PASSWORD=postgres \
                    -e POSTGRES_DB=mydatabase \
                    lozanoskim/my-postgres:latest
                '''
            }
        }
    }    
    post {
       always {
          sh 'docker stop postgres-container || true'
          sh 'docker rm postgres-container || true'
       }
    }
}
