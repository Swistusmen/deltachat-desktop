pipeline {
	agent any
	
    stages {
	     stage('Build') {
            steps {
                echo 'Build..'           
                sh 'npm install'
                sh 'npm run build'
		script 	{
                    last_stage = env.STAGE_NAME
				}
            }
	  }
        stage('Test') {
            steps {
		        script{
                    last_stage = env.STAGE_NAME		
									
					if("${currentBuild.currentResult}"=='SUCCESS'){			
					echo 'Testing..'				 
					sh 'npm run test' 
						}	
					else{
					echo "Build status: ${currentBuild.currentResult}"
					}  
					
				}
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
