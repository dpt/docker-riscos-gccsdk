pipeline {
  agent {
    label 'docker'
  }
  stages {
    stage('Build') {
      agent {
        dockerfile {
          label 'docker'
        }    
      }
      steps {
	checkout([$class: 'SubversionSCM', additionalCredentials: [], excludedCommitMessages: '', excludedRegions: '', excludedRevprop: '', excludedUsers: '', filterChangelog: false, ignoreDirPropChanges: false, includedRegions: '', locations: [[cancelProcessOnExternalsFail: true, credentialsId: '', depthOption: 'infinity', ignoreExternalsOption: false, local: 'gcc4', remote: 'svn://svn.riscos.info/gccsdk/trunk/gcc4']], quietOperation: true, workspaceUpdater: [$class: 'UpdateUpdater']])
        script {
          dockerImage = docker.build 'riscos-gccsdk-4.7'
        }
      }
    }
  }
}
