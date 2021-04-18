pipeline { 
  agent {label 'Slave'}
    environment { 

        registry = "mypresentdocker/jenkins" 

        registryCredential = 'dockerhubid' 

        dockerImage = '' 
        imagename = "nginx/tejaswvi"

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

                    dockerImage = docker.build imagename

                }
            } 

        }

        stage('Deploy our image') { 

            steps { 

                script { 

                     docker.withRegistry( '', registryCredential ) {
                    dockerImage.push('assignment:1')

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
