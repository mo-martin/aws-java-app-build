sudo apt-get update
sudo apt-get install -y openjdk-8-jdk-headless maven
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
# MVN Java compiler
cd /home/ubuntu/scripts/docker/java-app/app
warfile='./target/CompactDiscRESTEnterprise-0.0.1-SNAPSHOT.war'
if [ -f '$warfile' ]; then
sudo rm -rf ./target/CompactDiscRESTEnterprise-0.0.1-SNAPSHOT.war
fi
mvn install
mv ./target/CompactDiscRESTEnterprise-0.0.1-SNAPSHOT.war ./target/app.war
# Wildfly
cd /opt
sudo cp /home/ubuntu/scripts/shell/files/wildfly.tar.gz /opt/wildfly.tar.gz
tar -xvzf wildfly.tar.gz
sudo rm -rf wildfly.tar.gz
sudo chown -R ubuntu wildfly-10.1.0.Final
sudo chmod -R 755 wildfly-10.1.0.Final
sudo mv wildfly-10.1.0.Final wildfly
sudo cp /home/ubuntu/scripts/shell/config/standalone.conf /opt/wildfly/bin/standalone.conf
# Start Wildfly Server
cd wildfly
sudo ./bin/standalone.sh > /dev/null &
deploy /home/ubuntu/synced/java/target/app.war
