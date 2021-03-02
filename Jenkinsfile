pipeline {
  agent {
    dockerfile {
      label 'docker'
    }    
  }
  stages {
    stage('Build') {
      steps {
        script {
          dockerImage = docker.build 'riscos-gccsdk-4.7'
        }
      }
    }
  }
}
