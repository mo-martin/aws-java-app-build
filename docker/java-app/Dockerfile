FROM jboss/wildfly
MAINTAINER moses.martin@skybettingandgaming.com

ADD java /java
RUN cd /java && mvn install
ADD /java/target/app.war /opt/jboss/wildfly/standalone/deployments/
