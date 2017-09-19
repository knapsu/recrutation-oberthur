#!/bin/sh

# Do not allow dumping console output to file
CATALINA_OUT="/dev/null"

# JULI Logback configuration
JAVA_OPTS="$JAVA_OPTS -Djuli-logback.configurationFile=file:$CATALINA_HOME/conf/logback.xml"

# Useful parameters
CATALINA_OPTS="${CATALINA_OPTS} -Djava.awt.headless=true"
