pipeline {
	agent any
	
    stages {
	     stage('Build') {
            steps {
                echo 'Build..'
		     echo 'Building..'
                sh 'npm i npm@latest -g'
                sh 'npm fund'
                sh 'npm install'
                sh 'npm run build'
            }
	  }
        stage('Test') {
            steps {
                echo 'Testing..'
		        sh 'sudo npm run test'
            }
        } 
    }
	 post {
    	
    	success {
	 echo 'Testing success!'		
    	}
    	
    	failure {
		emailext attachLog: true,
			body: "${currentBuild.currentResult}: Job ${env.JOB_NAME}", 
			subject: 'Jenkins testing failed', 
			to: 'michal76aw@gmail.com'
    	}
    }
}
