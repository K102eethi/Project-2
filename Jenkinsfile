pipeline {
    agent any

    tools {
        maven 'Maven_3.8.7' // Make sure this matches the name configured in Jenkins > Global Tool Configuration
    }

    environment {
        MAVEN_HOME = '/opt/maven'
        PATH = "$PATH:/opt/maven/bin"
    }

    stages {
        stage('Build') {
            steps {
                echo 'Building the project with Maven...'
                sh 'mvn clean package'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying with Ansible...'
                sh 'ansible-playbook -i ansible/inventory.ini ansible/deploy.yml'
            }
        }
    }
}
