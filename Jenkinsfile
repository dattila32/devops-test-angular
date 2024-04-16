pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                echo 'Hello World'
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
    }
}