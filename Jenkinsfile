pipeline {

  agent {
    kubernetes {
      yamlFile 'build.yaml'
    }
  }

  stages {

    stage('Kaniko Build & Push Image') { # Kaniko used to build images without having interactive access with docker daemon.
      steps {
        container('kaniko') {
          script {
            sh '''
            /kaniko/executor --dockerfile `pwd`/Dockerfile \ # Passing dockerfile to build
                             --context `pwd` \
                             --destination=rocksathish/helloworld:${BUILD_NUMBER} # pushing docker image to private repo
            '''
          }
        }
      }
    }

    stage('Deploy App to Kubernetes') {
      steps {
        container('kubectl') { #Using kubectl to deploy images
          withCredentials([file(credentialsId: 'k8s', variable: 'KUBECONFIG')]) {  # Passing kubernetes config file as variable
            sh 'kubectl apply -f namspace.yaml'
            sh 'sed -i "s/<TAG>/${BUILD_NUMBER}/" deploy.yaml'
            sh 'kubectl apply -f deploy.yaml'
          }
        }
      }
    }

  }
}
