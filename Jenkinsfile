pipeline {
  agent { label 'docker' }
    stages {
      stage('Checkout SVN') {
        steps {
          script {
            def scmVars = checkout([$class: 'SubversionSCM', additionalCredentials: [], excludedCommitMessages: '', excludedRegions: '', excludedRevprop: '', excludedUsers: '', filterChangelog: false, ignoreDirPropChanges: false, includedRegions: '', locations: [[cancelProcessOnExternalsFail: true, credentialsId: '', depthOption: 'infinity', ignoreExternalsOption: false, local: 'gcc4', remote: 'svn://svn.riscos.info/gccsdk/trunk/gcc4']], quietOperation: true, workspaceUpdater: [$class: 'UpdateUpdater']])
            svnRevision = scmVars.SVN_REVISION
          }
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
           sh 'cd gcc4 && make clean && MAKEFLAGS=-j$(nproc) ./build-world'
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
            dockerImage = docker.build("riscosdotinfo/riscos-gccsdk-4.7:ci", "./riscos-gccsdk-4.7")
	    docker.withRegistry('https://registry.hub.docker.com', 'dockerHub') {
              dockerImage.push('ci')
              dockerImage.push('r'+${env.svnRevision})
            }
          }
	}
      }
    }

}
