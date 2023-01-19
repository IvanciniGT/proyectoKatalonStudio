pipeline {
    agent any
    stages {
        stage('Test') {
            steps {
               sh 'docker run -t --rm -v "$(pwd)":/tmp/project katalonstudio/katalon katalonc.sh -projectPath=/tmp/project -browserType="Chrome" -retry=0 -statusDelay=15 -testSuitePath="Test Suites/Wikipedia" -apiKey=<your-api-key>'
            }
        }
    }


