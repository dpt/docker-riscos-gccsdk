pipeline {
  agent {
    label 'master'
  }
  stages {
    stage('SCM checkout') {
      steps {
	checkout([$class: 'SubversionSCM', additionalCredentials: [], excludedCommitMessages: '', excludedRegions: '', excludedRevprop: '', excludedUsers: '', filterChangelog: false, ignoreDirPropChanges: false, includedRegions: '', locations: [[cancelProcessOnExternalsFail: true, credentialsId: '', depthOption: 'infinity', ignoreExternalsOption: false, local: '.', remote: 'svn://svn.riscos.info/gccsdk/trunk/gcc4']], quietOperation: true, workspaceUpdater: [$class: 'UpdateUpdater']])
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
