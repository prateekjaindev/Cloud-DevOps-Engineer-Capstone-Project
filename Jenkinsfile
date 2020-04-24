pipeline {
    environment {
        registry = "prateekjain/capstone"
        registryCredential = 'dockerhub'
        dockerImage = ''
    }
    agent any
    stages {

		    stage('Lint HTML') {
			    steps {
				    sh 'tidy -q -e *.html'
				    sh 'echo $USER'
			    }
		    }
        
        
            stage('Building image') {
                steps{
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                    }
                }
            }

            stage('Container Security Scan') {
                steps {
                script {
                    sh 'echo "docker.io/prateekjain/capstone 'pwd'/Dockerfile" > anchore_images'
                    anchore name: 'anchore_images'
                    }
                }
            }
            stage('Deploy Image') {
                steps{
                script {
                    docker.withRegistry( '', registryCredential ) {
                    dockerImage.push()
                        }
                    }
                }
            }

            stage('Configure and Build Kubernetes Cluster'){
            steps {
                catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'ansible-playbook ./playbooks/create-cluster.yml'
                    }
                }
            }
            stage('Deploy Updated Image to Cluster'){
                steps {
                    catchError(buildResult: 'SUCCESS', stageResult: 'FAILURE') {
                    sh 'sudo kubectl apply -f ./deployments'
                }
            }
        }
    }
}
