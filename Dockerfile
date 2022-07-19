FROM centos

RUN yum install -y epel-release java-1.8.0-openjdk wget
RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.8.23.tar.gz && \
	tar -xvf elasticsearch-6.8.23.tar.gz -C /opt && \
	ln -s /opt/elasticsearch-6.8.23 /opt/elasticsearch && \
	rm elasticsearch-6.8.23.tar.gz
RUN useradd esUser
COPY limits.conf /etc/security/limits.conf
RUN yum clean all
COPY plugins /opt/elasticsearch/plugins
COPY elasticsearch.yml /opt/elasticsearch/config/
COPY entrypoint.sh /
RUN chown esUser:esUser /opt/* -R

ENTRYPOINT ["/bin/bash", "/entrypoint.sh"]
	



