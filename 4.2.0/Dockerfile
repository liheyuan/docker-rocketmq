# Start from a Java image.
FROM java:8

ARG version

# Rocketmq Version
ENV ROCKETMQ_VERSION 4.2.0 

# Rocketmq Home
ENV ROCKETMQ_HOME  /opt/rocketmq-${ROCKETMQ_VERSION}

# Work Dir
WORKDIR  ${ROCKETMQ_HOME}

# Expose
EXPOSE 10909 10911

# Volume
RUN mkdir -p /opt/logs /opt/store
VOLUME /opt/logs /opt/store

# Files
ADD run.sh .

RUN curl https://dist.apache.org/repos/dist/release/rocketmq/${ROCKETMQ_VERSION}/rocketmq-all-${ROCKETMQ_VERSION}-bin-release.zip -o rocketmq.zip \
          && unzip rocketmq.zip \
          && rm rocketmq.zip

RUN chmod +x bin/mqbroker bin/mqnamesrv

# Final Command
CMD [ "./run.sh" ]

