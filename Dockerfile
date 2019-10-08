FROM bellsoft/liberica-openjdk-alpine:13

COPY ldap-test.jar /

WORKDIR /
ENTRYPOINT ["java", "-jar", "ldap-test.jar"]
