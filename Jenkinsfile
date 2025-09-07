pipeline {
    agent any
    
    stages {
        stage('Get Code') {
            steps {
                echo '📥 Getting code from Git...'
                checkout scm
            }
        }
        
        stage('Build') {
            steps {
                echo '🔧 Building the application...'
                sh 'mvn clean compile'
            }
        }
        
        stage('Test') {
            steps {
                echo '🧪 Running tests...'
                sh 'mvn test'
            }
        }
        
        stage('Package') {
            steps {
                echo '📦 Creating WAR file...'
                sh 'mvn clean package -DskipTests'
            }
        }
        
        stage('Deploy') {
            steps {
                echo '🚀 Deploying with Ansible...'
                sh '''
                    ansible-playbook -i /etc/ansible/hosts /etc/ansible/playbooks/deploy.yml
                '''
            }
        }
        
        stage('Verify') {
            steps {
                echo '✅ Checking if deployment worked...'
                script {
                    sleep 10
                    sh 'curl -f http://localhost:8080/hello-world/ || echo "App not ready yet"'
                }
            }
        }
    }
    
    post {
        success {
            echo '🎉 Pipeline completed successfully!'
        }
        failure {
            echo '❌ Pipeline failed!'
        }
    }
}
