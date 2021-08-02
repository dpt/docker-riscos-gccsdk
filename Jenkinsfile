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
           sh 'cp ./gccsdk-params ./gcc4'
           sh 'cd gcc4 && MAKEFLAGS=-j$(nproc) ./build-world'
	   sh 'echo "Compile successful"'
           sh 'ls -l ${WORKSPACE}/riscos-gccsdk-4.7'
           sh 'rm -rf riscos-gccsdk-4.7/home'
           sh 'mkdir -p riscos-gccsdk-4.7/home'
           sh 'cp -rf /home/riscos riscos-gccsdk-4.7/home/riscos'
           sh 'cp -rf gccsdk-params riscos-gccsdk-4.7/home/riscos/gccsdk-params'
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
