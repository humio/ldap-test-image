FROM bellsoft/liberica-openjdk-alpine:12

COPY ldap-test.jar /

WORKDIR /
ENTRYPOINT ["java", "-jar", "ldap-test.jar"]