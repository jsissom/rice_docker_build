#!/bin/sh

export TOMCAT_VERSION=7.0.78

apt-get -y install openjdk-8-jdk curl

mkdir /usr/local/rice/plugins
mkdir /usr/local/rice/kew_attachments
mkdir -p /usr/local/rice/kew/xml

curl -o /opt/apache-tomcat.tar.gz http://www-us.apache.org/dist/tomcat/tomcat-7/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz
cd /opt
tar xzf ./apache-tomcat.tar.gz
mv apache-tomcat-${TOMCAT_VERSION} tomcat

# Setup logs folder
mkdir /logs
rm -rf /opt/tomcat/logs
ln -s /logs /opt/tomcat/logs

# Copy shared resources into tomcat
mv /usr/local/rice/spring-instrument-tomcat-3.2.12.RELEASE.jar /opt/tomcat/lib/
mv /usr/local/rice/mysql-connector-java-5.1.36-bin.jar /opt/tomcat/lib/
mv /usr/local/rice/ojdbc6_11_2_0_1_0.jar /opt/tomcat/lib/

# Deploy application
mv /usr/local/rice/kr-dev.war /opt/tomcat/webapps

# Install edited run file
rm /usr/local/bin/run
mv /usr/local/rice/run /usr/local/bin/run

# Setup config file
ln -s /config/rice-config.xml /usr/local/rice/rice-config.xml

# Install edited server.xml file
rm /opt/tomcat/conf/server.xml
mv /usr/local/rice/server.xml /opt/tomcat/conf
