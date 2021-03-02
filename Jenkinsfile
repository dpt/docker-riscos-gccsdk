pipeline {
  stages {
    stage('SCM checkout') {
      steps {
        checkout([$class: 'SubversionSCM', remote: 'svn://svn.riscos.info/gccsdk/trunk/gcc4'])
      }
    }
    stage('Build') {
      agent {
        dockerfile {
          label 'docker'
        }    
      }
      steps {
        script {
          dockerImage = docker.build 'riscos-gccsdk-4.7'
        }
      }
    }
  }
}
