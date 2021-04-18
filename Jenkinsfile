pipeline { 
    agent {label 'Slave'}
    parameters {
  imageTag(name: 'DOCKER_IMAGE', image: assignment:1/assignment:1')
}

    environment { 

        registry = "mypresentdocker/jenkins" 

        registryCredential = 'dockerhubid' 

        dockerImage = 'assignment:1' 

    }

    

    stages { 
        stage('Cloning our Git') { 

            steps { 

                git 'https://github.com/balakrishnavepuri/jenkins_pipeline.git' 

            }

        } 

        stage('Building our image') { 

            steps { 

                script { 

                    dockerImage = docker.build registry + ":$BUILD_NUMBER" 

                }
            } 

        }

        stage('Deploy our image') { 

            steps { 

                script { 

                    docker.withRegistry( '', registryCredential ) { 

                        dockerImage.push() 

                    }

                } 

            }

        } 

        stage('creating container') { 

            steps { 

                sh "docker run -d -p 8080:80 assignment:1" 

            }

        } 

    }

}
