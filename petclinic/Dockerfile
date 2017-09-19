FROM knapsu/tomcat:8

# Deploy Pet Clinic web application
# Assuming we downloaded the petclinic.war to build directory
#COPY petclinic.war $CATALINA_HOME/webapps/

# Workaround for unwanted values in data-access.properties
# Assuming petclinic.war was extracted to 'webapp' directory
COPY webapp $CATALINA_HOME/webapps/petclinic
COPY patched/data-access.properties $CATALINA_HOME/webapps/petclinic/WEB-INF/classes/spring/
