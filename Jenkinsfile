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
                        withDockerRegistry(credentialsId: 'docker-id', toolName: 'Docker Home') {
                        sh 'docker build -t devops-test-angular .'
                        sh 'docker tag devops-test-angular 72821/devops-test-angular'
                        sh 'docker push 72821/devops-test-angular'
                        }
                    }
                    }
        }

        stage('Docker run') {
            steps {
                script {
                    docker.image('devops-test-angular').withRun('-d=true -p 8080:80') { c ->
                    docker.image('devops-test-angular').inside{
                     echo 'Application has been started'
                    }
                }
            }
        }
        }
    }
}