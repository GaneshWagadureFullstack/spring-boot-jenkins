pipeline {
    agent any
    tools {
        maven 'maven_3_8_6'
    }
    stages{
        stage('build maven'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/GaneshWagadureFullstack/spring-boot-jenkins']]])
                bat 'mvn clean install'
           }
        }
        stage('build docker image'){
            steps{
                script{
                    bat 'docker build -t eazycodestack/spring-boot-devops-integrations .'
                }
            }
        }
        stage('push docker image'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerhubpwd')]) {
                       bat 'docker login -u ganeshwagadure -p {dockerhubpwd}'

                  }
                  bat 'docker push eazycodestack/spring-boot-devops-integrations'
                }
            }
        }
    }
}