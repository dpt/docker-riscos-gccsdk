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
            args '-v /var/run/docker.sock:/var/run/docker.sock -v ${WORKSPACE}:/usr/src/gccsdk'
          }    
        }
        steps {
           sh 'mkdir -p ./home/riscos && touch ./home/riscos/foo'
	   sh 'echo "Compile successful"'
           sh 'ls -l ${WORKSPACE}'
           sh 'mv ./home riscos-gccsdk-4.7/'
        }
      }
      stage('Docker build') {
        steps {
          script {
            dockerImage = docker.build("riscos-gccsdk-4.7", "./riscos-gccsdk-4.7")
          }
	}
      }
    }

}