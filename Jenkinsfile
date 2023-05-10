pipeline {
    agent any

    environment {
        gitLabel = VersionNumber([
            projectStartDate: '2023-01-01',
            versionNumberString: "${params.gitLabel}",
            worstResultForIncrement: 'SUCCESS'
        ])
    }

    stages {
        stage('Docker Build') {
            steps {
                sh "docker build --build-arg debug_mode=--no-dev -t rmamba/acmetool:latest ."
            }
        }
        stage('Docker:latest') {
            steps {
                sh "docker tag rmamba/acmetool:latest rmamba/acmetool:alpine-3.15-latest"
                sh "docker push rmamba/acmetool:alpine-3.15-latest"
                sh "docker rmi rmamba/acmetool:alpine-3.15-latest"
            }
        }
        stage('Docker:tag') {
            steps {
                sh "docker tag rmamba/acmetool:latest rmamba/acmetool:alpine-3.15-${params.gitLabel}"
                sh "docker push rmamba/acmetool:alpine-3.15-${params.gitLabel}"
                sh "docker rmi rmamba/acmetool:alpine-3.15-${params.gitLabel}"
            }
        }
    }
}
