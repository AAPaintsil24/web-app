pipeline {
    agent any
    
    tools {
        maven 'maven'
    }
    
    stages {
        stage('git checkout'){
            steps{
                git branch: 'main', url: 'https://github.com/AAPaintsil24/web-app.git'
            }
        }
        
        stage('clean and package'){
            steps{
                sh 'mvn clean package'
            }
        }

        stage('code analysis'){
            environment {
                ScannerHome = tool 'albertsonarscanner'
            }
            steps{
                script{
                    withSonarQubeEnv('albertsonarserver'){
                        sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=paintsil-webapp" 
                    }
                }
            }
        }

        stage("Quality Gate") {
            steps {
              timeout(time: 1, unit: 'HOURS') {
                waitForQualityGate abortPipeline: false
              }
            }
        }

    }
}