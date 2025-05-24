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
  }
}