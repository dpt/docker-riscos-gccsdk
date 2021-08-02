pipeline {
  agent { label 'docker' }
    stages {
      stage('Checkout SVN') {
        steps {
          checkout([$class: 'SubversionSCM', additionalCredentials: [], excludedCommitMessages: '', excludedRegions: '', excludedRevprop: '', excludedUsers: '', filterChangelog: false, ignoreDirPropChanges: false, includedRegions: '', locations: [[cancelProcessOnExternalsFail: true, credentialsId: '', depthOption: 'infinity', ignoreExternalsOption: false, local: 'gcc4', remote: 'svn://svn.riscos.info/gccsdk/trunk/gcc4']], quietOperation: true, workspaceUpdater: [$class: 'UpdateUpdater']])
        }
      }
      stage('Compile') {
        agent {
          dockerfile {
            label 'docker'
            reuseNode true
            args '-v /var/run/docker.sock:/var/run/docker.sock -v ${env.WORKSPACE}:/home/riscos'
          }    
        }
        steps {
	   sh 'echo "Compile successful"'
           sh 'ls -l ${env.WORKSPACE}'
        }
      }
      stage('Docker build') {
	steps {
          sh 'echo "Build docker image here"'
	  sh 'ls -l ${env.WORKSPACE}'
          }
	}
      }
    }

}