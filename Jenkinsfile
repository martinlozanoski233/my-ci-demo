pipeline {
   agent any

   stages {

      stage('Run inside Docker with root') {
            steps {
                script {
                    docker.image('postgres:13').inside('-u root --privileged -v /var/run/docker.sock:/var/run/docker.sock') {
                        sh 'whoami'
                        sh 'apt-get update && apt-get install -y curl'
                        sh 'curl --version'
                    }
                }
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
