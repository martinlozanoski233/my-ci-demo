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
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t my-postgres .'
            }
        }
        stage('Run container') {
            steps {
                sh '''
                docker run -d \
                --name postgres-container \
                -e POSTGRES_PASSWORD=secret \
                -v $PWD/init-db.sql:/docker-entrypoint-initdb.d/init-db.sql \
                -v $PWD/script.sh:/scripts/script.sh
                '''
                sh 'sleep 10' 
            }
        }
        stage('Run script inside a container') {
            steps {
                sh 'docker exec postgres-container bash /scripts/script.sh'
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
