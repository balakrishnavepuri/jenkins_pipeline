pipeline {
agent {label 'slave'}
  stages {
    stage('Cloning our Git') {
      agent {label 'slave'}
      steps {
        git 'https://github.com/balakrishnavepuri/jenkins_pipeline.git'
      }
    }
    stage('Docker Build') {
      agent {label 'slave'}
      steps {
        sh 'docker build -t nginx/tejaswini:assignment-1 .'
      }
    }
   stage('Docker Push') {
     agent {label 'slave'}
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhubid', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh 'docker tag nginx/tejaswini:assignment-1 bala4636/nginx/tejaswini:assignment-1'
    
          sh 'bat docker push nginx/tejaswini:assignment-1'
        }
      }
    }

    }
  }
