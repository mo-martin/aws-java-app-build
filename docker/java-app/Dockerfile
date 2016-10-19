FROM jboss/wildfly
MAINTAINER moses.martin@skybettingandgaming.com

ADD app /opt/jboss/java-app
RUN cd /opt/jboss/java-app
RUN mvn install
ADD /opt/jboss/java-app/target/CompactDiscRESTEnterprise-0.0.1-SNAPSHOT.war /opt/jboss/wildfly/standalone/deployments/
EXPOSE 8080
