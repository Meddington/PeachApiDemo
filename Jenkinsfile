node {
   checkout scm

   stage('Build')
   {
       try
       {
        sh "/opt/build.sh"
       }
       catch(err)
       {
        junit '*.xml'
       }
	   
	   //sleep(5 * 60)// * 1000)
   }
   stage('Test')
   {
       echo "Testing..."
   }
   stage('Peach API Security')
   {
   
       try
       {
           sh "ls"
           sh "ls -R"
            sh "PEACH_AUTOMATION_CMD=\"/usr/local/bin/pytest --peach=on test.py\" " +
            "PEACH_PROFILE=Quick " +
            "PEACH_CONFIG=/opt/sdk/testrunners/custom/python/peach-web.project " +
            "PEACH_API=http://127.0.0.1:5000 " +
            "PEACH_UI=http://52.52.169.252:5000 " +
            "PEACH_JUNIT=$WORKSPACE/peach-web_test_target.xml " +
            "PEACH_VERBOSE=True "+
            "/usr/bin/python /opt/sdk/ci/generic/peach_ci_runner.py"
       }
       catch(err)
       {
            junit healthScaleFactor: 100.0, testResults: '*.xml'
            throw err
       }
	
	//sleep(7 * 60)// * 1000)
   }
   stage('Deploy')
   {
       echo "Deploying..."
	   //sleep(5 * 60)// * 1000)
   }
}
