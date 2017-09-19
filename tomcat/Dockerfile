FROM ubuntu:xenial

# Install essential tools
ENV DEBIAN_FRONTEND noninteractive
RUN set -e \
  && apt-get update \
  && apt-get install -y \
    curl \
    wget \
    unzip \
  && rm -rf /var/cache/apt/archives/*

# Define system variables
ENV \
  JAVA_HOME="/opt/java" \
  CATALINA_HOME="/opt/tomcat"

# Install Java Runtime Environment
ENV \
  JAVA_PACKAGE_URL="http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/server-jre-8u144-linux-x64.tar.gz"
#  JAVA_PACKAGE_URL="http://download.oracle.com/otn-pub/java/jdk/8u111-b14/jdk-8u111-linux-x64.tar.gz"
RUN set -e \
  && mkdir -p $JAVA_HOME \
  && wget "$JAVA_PACKAGE_URL" -O java.tar.gz --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" \
  && tar -xvf java.tar.gz -C $JAVA_HOME --strip-components=1 \
  && rm java.tar.gz

# Install Tomcat
ENV \
#  TOMCAT_PACKAGE_URL="http://archive.apache.org/dist/tomcat/tomcat-8/v8.5.20/bin/apache-tomcat-8.5.20.tar.gz"
  TOMCAT_PACKAGE_URL="http://archive.apache.org/dist/tomcat/tomcat-8/v8.0.46/bin/apache-tomcat-8.0.46.tar.gz"
RUN set -e \
  && mkdir -p $CATALINA_HOME \
  && wget "$TOMCAT_PACKAGE_URL" -O tomcat.tar.gz \
  && tar -xvf tomcat.tar.gz -C $CATALINA_HOME --strip-components=1 \
  && rm tomcat.tar.gz* \
  && rm -r $CATALINA_HOME/webapps/docs \
  && rm -r $CATALINA_HOME/webapps/examples \
  && rm -r $CATALINA_HOME/webapps/host-manager \
  && rm -r $CATALINA_HOME/webapps/ROOT/* \
  && echo "Tomcat" > $CATALINA_HOME/webapps/ROOT/index.html

# Configure Tomcat and integrate Logback
COPY conf/* $CATALINA_HOME/conf/
COPY bin/* $CATALINA_HOME/bin/
COPY lib/* $CATALINA_HOME/lib/
RUN set -e \
  && chmod +x $CATALINA_HOME/bin/*.sh \
  && rm $CATALINA_HOME/conf/logging.properties

ENV PATH="$CATALINA_HOME/bin:$JAVA_HOME/bin:$PATH"

EXPOSE 8080

CMD ["catalina.sh", "run"]
