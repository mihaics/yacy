FROM centos

ENV YACY_RELEASE = yacy_v1.90_20160704_9000
MAINTAINER mcsaky <mihai.csaky@sysop-consulting.ro>

RUN yum -y update

RUN yum install -y --nogpgcheck java-1.7.0-openjdk tar wget which sed; yum clean all
#http://yacy.net/release/yacy_v1.90_20160704_9000.tar.gz
RUN curl -L http://yacy.net/release/yacy_v1.90_20160704_9000.tar.gz -o /opt/yacy_v1.90_20160704_9000.tar.gz
RUN gunzip /opt/yacy_v1.90_20160704_9000.tar.gz
RUN tar -C /opt -xvf /opt/yacy_v1.90_20160704_9000.tar ; rm /opt/yacy_v1.90_20160704_9000.tar

RUN sed -i '/adminAccount=/c\adminAccount=admin:docker' /opt/yacy/defaults/yacy.init

RUN echo 'wait $!'  >> /opt/yacy/startYACY.sh

EXPOSE 8090

CMD /opt/yacy/startYACY.sh

