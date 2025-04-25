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

        stage('nexus uploads'){
            steps{
                nexusArtifactUploader artifacts: [[artifactId: 'maven-web-applicatio', classifier: '', file: '/var/lib/jenkins/workspace/albert-web-app-pipeline/target/web-app.war', type: 'war']], credentialsId: 'nexus-credentials', groupId: 'com.mt', nexusUrl: '3.147.71.219:8081/repository/lilian-webapp/', nexusVersion: 'nexus3', protocol: 'http', repository: 'lilian-webapp', version: '3.0.6-RELEASE'
            }
        }
        
        stage('deploy to tomcat'){
            steps{
                deploy adapters: [tomcat9(credentialsId: 'tomcat credentials', path: '', url: 'http://56.228.12.46:8080/')], contextPath: null, war: 'target/web-app.war'
            }
        }
    }


    }
