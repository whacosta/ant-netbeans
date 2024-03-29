FROM alpine

RUN apk add zip
RUN apk add openjdk8
RUN apk add icedtea-web-mozilla
RUN apk add icedtea-web

ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk
ENV PATH=$JAVA_HOME/bin:${PATH}

COPY javaws.jar /usr/lib/jvm/java-1.8-openjdk/jre/lib/

RUN mkdir /opt/builder
COPY build.properties /opt/builder/

RUN wget https://download.netbeans.org/netbeans/8.2/final/zip/netbeans-8.2-201609300101-javase.zip -P /opt/
RUN unzip /opt/netbeans-8.2-201609300101-javase.zip -d /opt/

RUN wget http://apache.dattatec.com//ant/binaries/apache-ant-1.9.14-bin.zip -P /opt/
RUN unzip /opt/apache-ant-1.9.14-bin.zip -d /opt/

ENV ANT_HOME=/opt/apache-ant-1.9.14
ENV PATH=${PATH}:${ANT_HOME}/bin
