pipeline {
    agent any
    tools {
        maven "maven"
    }

    environment {
        APP_VERSION: "jd-1.0.0"
    }

    stages {
        stage("build jar") {
            steps {
                sh "mvn package"
            }
        }

       stage("build image") {
           steps {
               withCredentials([
                   usernamePassword(credentials: 'dockerhub-credentials', usernameVariable: USERNAME, passwordVariable: PASSWORD)
               ]) {
                   sh "docker build -i t abdessamadabidar/jenkins-demo:${APP_VERSION}"
                   sh "echo ${PASSWORD} | docker login -u ${USERNAME} --password-stdin"
                   sh "docker push abdessamadabidar/jenkins-demo:${APP_VERSION}"
               }
           }
       }


    }
}