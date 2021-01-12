FROM tomcat:9.0

WORKDIR /usr/local/tomcat/lib
COPY abac-authorization-client-for-tomcat-1.0.0-SNAPSHOT-jar-with-dependencies.jar abac-authorization-client-for-tomcat-1.0.0-SNAPSHOT-jar-with-dependencies.jar

WORKDIR /usr/local/tomcat
COPY truststore-client.p12 truststore-client.p12

WORKDIR /usr/local/tomcat/bin
COPY run.sh run.sh

RUN chmod +x run.sh

RUN apt-get update
RUN apt-get install software-properties-common --assume-yes
RUN apt-add-repository 'deb http://security.debian.org/debian-security stretch/updates main'
RUN apt-get update
RUN apt-get install openjdk-8-jdk --assume-yes
RUN apt-get install zip --assume-yes

ENV JPDA_ADDRESS="8000"
ENV JPDA_TRANSPORT="dt_socket"

COPY entrypoint.sh /entrypoint.sh
RUN chmod 755 /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

WORKDIR /usr/local/tomcat/bin