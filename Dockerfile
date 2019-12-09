FROM alpine

RUN apk add openrc
RUN apk add apache2
RUN apk add zip
RUN apk add openjdk8

ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk
ENV PATH="$JAVA_HOME/bin:${PATH}" 

RUN wget https://download.netbeans.org/netbeans/8.2/final/zip/netbeans-8.2-201609300101-javase.zip -P /opt/
RUN unzip /opt/netbeans-8.2-201609300101-javase.zip -d /opt/

RUN wget http://apache.dattatec.com//ant/binaries/apache-ant-1.9.14-bin.zip -P /opt/
RUN unzip /opt/apache-ant-1.9.14-bin.zip -d /opt/

ENV ANT_HOME=/opt/apache-ant-1.9.14
ENV PATH=${PATH}:${ANT_HOME}/bin

RUN rc-update add apache2

EXPOSE 80 443
