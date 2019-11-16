pipeline {
  agent {
    label 'docker'
  }
  
  environment {
    AWS_DEV_ACCOUNT_NUMBER = credentials('AWS_DEV_ACCOUNT_NUMBER')
    AWS_ACCESS_KEY = credentials('AWS_MASTER_JENKINS_AK')
    AWS_SECRET_KEY = credentials('AWS_MASTER_JENKINS_SK')
    AWS_CROSS_ACCOUNT_ROLE_ARN = "arn:aws:iam::$AWS_DEV_ACCOUNT_NUMBER:role/SystemCrossAccountAccess"
    GIT_TOKEN = credentials('GITHUB_TOKEN')
    SLACK_TOKEN_SECRET = credentials('SLACK_TOKEN_SECRET')
  }
  
  stages{

    stage('RunThisJob') {
      steps {
        script {
          docker.image('alpine').inside('--privileged --user root'){
            sh '''apk update
                  env
                  ls -lah
               '''
          }
        }
      }
      
      post {
        success {
          slackSend(channel: "${env.slack_channel}", message: "\n:white_check_mark: *${env.STAGE_NAME} passed*\n\n    Job URL: ${env.JOB_URL}${env.BUILD_NUMBER}\n    PR: ${env.GITHUB_PR_URL}\n", iconEmoji: "jenkins", username: "Jenkins")
        }
        failure {
          slackSend(channel: "${env.slack_channel}", message: "\n:red_circle: *${env.STAGE_NAME} ran into testing issues, probably best to check it out*\n\n    PR: ${env.GITHUB_PR_URL}\n", iconEmoji: "jenkins", username: "Jenkins")
        }
      }
    }      
  }
}
