FROM schemaspy/schemaspy:latest

RUN rm -f /drivers_inc/mysql-connector-java-*.jar
ADD http://search.maven.org/remotecontent?filepath=mysql/mysql-connector-java/8.0.22/mysql-connector-java-8.0.22.jar \
    /drivers_inc/mysql-connector-java-8.0.22.jar

USER root
RUN apk add --no-cache mysql-client

COPY schemaspy.sh /usr/local/bin/schemaspy
RUN chmod +x /usr/local/bin/schemaspy
ENTRYPOINT ["/usr/local/bin/schemaspy"]
