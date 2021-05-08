pipeline {
	agent any
	
    stages {
	     stage('Build') {
            steps {
                echo 'Build..'
		     
		    	 
                	sh 'npm install'
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
