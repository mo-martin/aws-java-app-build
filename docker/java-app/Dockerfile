FROM jboss/wildfly
MAINTAINER moses.martin@skybettingandgaming.com

ADD app ~/java-app
RUN cd ~/java-app
RUN mvn install
ADD ~/java-app/target/CompactDiscRESTEnterprise-0.0.1-SNAPSHOT.war /opt/jboss/wildfly/standalone/deployments/
EXPOSE 8080
