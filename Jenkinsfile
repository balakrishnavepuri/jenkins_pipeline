pipeline {
  agent any
  stages {
    stage('Cloning our Git') {
      agent {
       
      }
      steps {
        git 'https://github.com/balakrishnavepuri/jenkins_pipeline.git'
      }
    }
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t nginx/tejaswini:assignment:1 .'
      }
   stage('Docker Push') {
      agent any
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhubid', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh 'docker push shanem/spring-petclinic:latest'
        }
      }
    }

    }
  }
}
