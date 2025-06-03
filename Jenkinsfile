pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Install Docker') {
            steps {
                sh '''
                if ! command -v docker &> /dev/null
                then
                   echo "Installing docker"
                   apt-get update
                   apt-get install -y docker.io
                else
                   echo "Docker already installed"
                fi  
                '''
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
