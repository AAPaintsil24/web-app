pipeline{
  agent any

  tools {
    maven 'builder'
  }

  stages {
    stgae('git clone'){
      steps {
        git branch: 'main', url: 'https://github.com/AAPaintsil24/web-app.git'
      }
    }
  }
}