#!/bin/bash

#docker run -it --rm --volume "$(pwd)/pom.xml"://usr/src/app/pom.xml maven:3-jdk-8-alpine mvn install

docker run -it --rm --name tagsoup \
        --volume "$(pwd)"/.m2:/root/.m2 \
        -v "$(pwd)":/usr/src/tagsoup \
        -w /usr/src/tagsoup maven:3.3-jdk-8 \
        mvn clean compile assembly:single

mkdir -p dist \
    && [ -e dist/tagsoup.jar ] && rm dist/tagsoup.jar || true \
    && cp target/tagsoup-*.jar dist/tagsoup.jar

#--volume "$(pwd)"/.m2:/root/.m2
#-u $(id -u):$(id -g)