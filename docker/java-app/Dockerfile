FROM jboss/base-jdk:8
MAINTAINER moses.martin@skybettingandgaming.com

# Set the WILDFLY_VERSION env variable
ENV WILDFLY_VERSION 8.2.1.Final
ENV WILDFLY_SHA1 77161d682005f26acb9d2df5548c8623ba3a4905
ENV JBOSS_HOME /opt/jboss/wildfly

# Add the WildFly distribution to /opt
RUN cd $HOME \
    && curl -O https://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz \
    && sha1sum wildfly-$WILDFLY_VERSION.tar.gz | grep $WILDFLY_SHA1 \
    && tar xf wildfly-$WILDFLY_VERSION.tar.gz \
    && mv $HOME/wildfly-$WILDFLY_VERSION $JBOSS_HOME \
    && rm wildfly-$WILDFLY_VERSION.tar.gz

CMD ["/opt/jboss/wildfly/bin/standalone.sh", "-b", "0.0.0.0"]

ADD app /java
RUN cd /java && mvn install
ADD /java/target/app.war /opt/jboss/wildfly/standalone/deployments/
EXPOSE 8080
