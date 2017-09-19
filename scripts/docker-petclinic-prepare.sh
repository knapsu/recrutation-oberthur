#!/usr/bin/env bash
set -e

cp jenkins-data/workspace/petclinic/target/petclinic.war petclinic/

mkdir -p petclinic/webapp/
unzip petclinic/petclinic.war -d petclinic/webapp/
