FROM openjdk:8-jre-alpine
EXPOSE 8080
COPY maven /maven/
ENTRYPOINT java $JAVA_OPTS -jar /maven/exec/monolithic-1.4.4.RELEASE-exec.jar
