# #ProvedCode

## Prerequisites:
- JDK 17 or later

## Installing:

Build Maven project:

To build the application execute the following commands in the project folder (where pom.xml and mvnw are located):

- ```./mvnw clean package ``` # this will build the project

For the first time it will download and install Maven version configured in the project settings (v.3.8.6) Next time the cached version will be used without redownloading.

After the build is completed, the folder ```/target``` will be created with a compiled ```.jar``` ready to be launched.

### Running the Application:
Now you can launch the server for example (default port is 8080):

- ```java -jar ./target/*.jar```

### Built With:
- Maven - Build tool
- Spring Boot - Web framework
- JUnit - Testing framework
