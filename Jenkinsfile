node {
    checkout scm

    stage('Build')
    {
        sh "pip install -r /opt/sdk/libraries/python/requirements.txt"
        sh "pip install -r requirements.txt"
    }
    stage('Test')
    {
        try
        {
            // Start target service
            sh "killall python || true"
            sh "BUILD_ID=dontKillMe python rest_target.py &"

            // Automated tests
            sh "pytest --junitxml test_target.xml tests.py"
        }
        catch(err)
        {
            junit '*.xml'
            sh "killall python || true"

            throw err
        }
    }
    stage('Peach API Security')
    {
        try
        {
            sh  "PEACH_AUTOMATION_CMD=\"/usr/local/bin/pytest --peach=on tests.py\" " +
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
            sh "killall python || true"
            throw err
        }
        finally
        {
            sh "killall python || true"
        }
    }
    stage('Deploy')
    {
        echo "Deploying..."
    }
}
