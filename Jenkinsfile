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
			    }
		    }
        
        
            stage('Building image') {
                steps{
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                    }
                }
            }

            stage('Scan') {
                steps{
                    aquaMicroscanner imageName: 'capstone', notCompliesCmd: 'exit 4', onDisallowed: 'pass', outputFormat: 'html'
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
    }
}