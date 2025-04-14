pipeline {
    agent { label 'linux_pi' } 

    stages {
        
        stage('checkout') {
            steps {
                echo 'get code'
                checkout scm
            }
        }

        stage('flash') {
            steps {
                echo 'Hello World'
                sh '''
                    python -m venv .venv
                    . .venv/bin/activate
                    pip install robotframework
                    echo 'robotframework installed'
                    cd ./tests
                    robot flash_test.robot
                '''
            }
        }
    }
    
    post {
        always {
            robot outputPath: 'tests', passThreshold: 80.0, unstableThreshold: 70.0
        }
    }
}
