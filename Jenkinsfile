pipeline {
    agent any

    stages {
        stage('Install') {
            steps {
                sh 'npm install'
            }
        }
       
        stage('Linting') {
            steps {
                sh 'npm run lint'
            }
        }
      
        stage('Docker build & Push') {
                    steps {
                    script {
                        sh 'docker context use default'
                        withDockerRegistry(credentialsId: 'docker-id', toolName: 'Docker Home') {
                        sh 'docker build -t devops-test-angular .'
                        sh 'docker tag devops-test-angular 72821/devops-test-angular'
                        sh 'docker push 72821/devops-test-angular'
                        sh 'docker-compose -f docker-compose.yaml up -d'
                        }
                    }
                    }
        }
    }
}