pipeline{
  agent any

  tools {
    maven 'builder'
  }

  stages {
    stage('git clone'){
      steps {
        git branch: 'main', url: 'https://github.com/AAPaintsil24/web-app.git'
      }
    }
    stage('maven build'){
      steps {
        sh 'mvn clean package'
      }
    }
    stage('code analysis'){
      environment{
        ScannerHome = tool "sonarscanner"
      }
      steps{
        script{
          withSonarQubeEnv('sonarserver'){
            sh "${ScannerHome}/bin/sonar-scanner -Dsonar.projectKey=lilian-love"
          }
        }
      }
    }
    stage('upload to nexus'){
      steps {
        nexusArtifactUploader artifacts: [[artifactId: 'maven-web-application', classifier: '', file: '/var/lib/jenkins/workspace/albert-pipeline/target/web-app.war', type: 'war']], credentialsId: 'nexus-credentials', groupId: 'com.mt', nexusUrl: '13.58.218.177:8081/repository/albert-fs/', nexusVersion: 'nexus3', protocol: 'http', repository: 'albert-fs', version: '3.0.6-RELEASE'
      }
    }
  }
}