pipeline {
  agent {
    dockerfile {
      label 'docker'
    }    
  }
  stages {
    stage('SCM checkout') {
      steps {
        svn 'svn://svn.riscos.info/gccsdk/trunk/gcc4'
      }
    }
    stage('Build') {
      steps {
        script {
          dockerImage = docker.build 'riscos-gccsdk-4.7'
        }
      }
    }
  }
}
