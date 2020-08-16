# Java 8 linux image
FROM openjdk:8-jdk-alpine

# The application runs on Port 8056 in docker container
EXPOSE 8056

# current working directory /opt/app
WORKDIR /opt/app

# Download the Artifactory from Artifact Server and copy the same to /opt/app/app.jar
RUN wget --header 'X-JFrog-Art-Api:AKCp5fUPMw6GmcnfJZWQoKkQqYaU8V9L8RCi7STHtE2unddoDdT4R6ypNJVGt25CWN2Tc9HJu' -O app.jar http://docker.for.win.localhost:8082/artifactory/Jenkins-integration/id/test/spring-boot-testing/0.0.1/spring-boot-testing-0.0.1.jar

# when the docker container start up this will executed -> "java -jar /opt/app/app.jar"
ENTRYPOINT ["java","-jar","app.jar"]