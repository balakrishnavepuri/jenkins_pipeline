pipeline {
  agent {label 'slave'}
  environment {
    imagename = "assignment:1"
    registryCredential = 'dockerhubid'
    dockerImage = ''
  }
  
  stages {
    stage('Cloning Git') {
      agent {label 'slave'}
      steps {
        git 'https://github.com/balakrishnavepuri/jenkins_pipeline.git'

      }
    }
    stage('Building image') {
      agent {label 'slave'}
      steps{
        script {
          dockerImage = docker.build imagename
        }
      }
    }
    stage('Deploy Image') {
      agent {label 'slave'}
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push("$BUILD_NUMBER")
             dockerImage.push('latest')

          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $imagename:$BUILD_NUMBER"
         

      }
    }


  stage('Creating Container') {
      steps{
        sh "docker run -it -d -p 80:8080 $imagename:latest"
         

      }
    }


  }
}
