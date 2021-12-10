FROM debian:11

# define activemq version and workdir
ENV ACTIVEMQ_VERSION 5.16.3
ENV ACTIVEMQ_WORKDIR /app

# create the work dir
RUN mkdir -p $ACTIVEMQ_WORKDIR

# copy activemq
COPY activemq/apache-activemq-5.16.3-bin.tar.gz .

# download active mq and extract
RUN tar -xzf apache-activemq-5.16.3-bin.tar.gz -C $ACTIVEMQ_WORKDIR


# EXPOSE PORTS
# ACTIVEMQ UI
EXPOSE 8161
# ACTIVEMQ TCP
EXPOSE 61616

# start
CMD ["/bin/sh", "-c", "bin/activemq console"]