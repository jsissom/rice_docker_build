FROM ubuntu

RUN apt-get update
RUN apt-get upgrade -y

RUN mkdir /usr/local/rice/
ADD rice/* /usr/local/rice/
RUN /usr/local/rice/setup.sh

VOLUME /logs
VOLUME /config

EXPOSE 8081
CMD ["/usr/local/bin/run"]
