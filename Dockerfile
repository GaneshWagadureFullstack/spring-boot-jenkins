FROM openjdk:8
EXPOSE 3030
ADD target/spring-boot-devops-integrations.jar
ENTRYPOINT ["java","-jar","spring-boot-devops-integrations.jar"]