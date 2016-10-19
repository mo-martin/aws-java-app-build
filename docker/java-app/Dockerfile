FROM jboss/wildfly
MAINTAINER moses.martin@skybettingandgaming.com
ADD CompactDiscRESTEnterprise-0.0.1-SNAPSHOT.war /opt/jboss/wildfly/standalone/deployments/
ADD mysql-connector-java.jar /opt/jboss/wildfly/standalone/deployments/
RUN mkdir -p /server/common/lib && cp /opt/jboss/wildfly/standalone/deployments/mysql-connector-java.jar /server/common/lib/
EXPOSE 8080
EXPOSE 9990
