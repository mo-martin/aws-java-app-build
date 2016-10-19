FROM jboss/wildfly
MAINTAINER moses.martin@skybettingandgaming.com
ADD CompactDiscRESTEnterprise-0.0.1-SNAPSHOT.war /opt/jboss/wildfly/standalone/deployments/
RUN yum install mysql-connector-java
EXPOSE 8080
EXPOSE 9990
