pipeline {
    agent any
    tools {
        maven "maven"
    }

    environment {
        APP_VERSION = "jd-1.0.0"
    }

    stages {
        stage("build jar") {
            steps {
                sh "mvn package"
            }
        }

       stage("build image") {
           steps {
               script {
                   withCredentials([
                       usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')
                   ]) {
                       sh """
                            echo $USERNAME
                           docker build -t abdessamadabidar/jenkins-demo:${APP_VERSION} .
                           echo $PASSWORD | docker login -u $USERNAME --password-stdin
                           docker push abdessamadabidar/jenkins-demo:${APP_VERSION}
                       """
                   }
               }
           }
       }


    }
}