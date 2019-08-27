FROM jenkins/jenkins:2.191
RUN apt-get update
RUN apt-get install build-essential
COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy
