FROM ubuntu:16.04

RUN apt-get update
RUN apt-get -y install openjdk-8-jre-headless apt-utils
RUN apt-get -y install curl

WORKDIR /opt
RUN curl -s https://archive.apache.org/dist/lucene/solr/3.6.2/apache-solr-3.6.2.tgz > apache-solr.tgz
RUN tar xfvz apache-solr.tgz
RUN rm apache-solr.tgz

EXPOSE 8983

RUN echo 'v1'
WORKDIR /opt/apache-solr-3.6.2/example
COPY conf/* solr/conf/
COPY solr.xml solr/

CMD java -jar start.jar
