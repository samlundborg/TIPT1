 pipeline {
    agent any
    stages {


        stage('Robot Test - Matglad') {
            steps {
            	catchError(buildResult: 'FAILURE', stageResult: 'FAILURE') {
                	sh 'robot --variable BROWSER:headlesschrome -d Robot_TIPT1/Results Robot_TIPT1/Tests'
                }
            }
            post {
                always {
                    script {
                        step(
                            [
                                $class                  :   'RobotPublisher',
                                outputPath              :   'Robot_TIPT1/Results',
                                outputFileName          :   '**/output.xml',
                                reportFileName          :   '**/report.html',
                                logFileName             :   '**/log.html',
                                disableArchiveOutput    :   false,
                                passThreshold           :   50,
                                unstableThreshold       :   40,
                                otherFiles              :   "**/*.png,**/*.jpg",
                            ]
                        )
                    }
                }
            }
        }
    }
}
