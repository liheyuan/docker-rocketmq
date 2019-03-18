# Start from a Java image.
FROM openjdk:8

ARG version

# RocketMQ Version
ENV ROCKETMQ_VERSION 4.3.2

# Expose
EXPOSE 10909 10911 9876

# RocketMQ Home
ENV ROCKETMQ_HOME  /opt/rocketmq-${ROCKETMQ_VERSION}

# Files
WORKDIR ${ROCKETMQ_HOME}
RUN curl https://dist.apache.org/repos/dist/release/rocketmq/${ROCKETMQ_VERSION}/rocketmq-all-${ROCKETMQ_VERSION}-bin-release.zip -o rocketmq.zip \
          && unzip rocketmq.zip \
          && rm rocketmq.zip

# Add Custom script
COPY scripts/ ${ROCKETMQ_HOME}/bin/
COPY mm/ ${ROCKETMQ_HOME}/conf/

RUN ls ${ROCKETMQ_HOME}/bin
RUN mv ${ROCKETMQ_HOME}/bin/runserver-customize.sh ${ROCKETMQ_HOME}/bin/runserver.sh \
 && chmod +x ${ROCKETMQ_HOME}/bin/runserver.sh \
 && chmod +x ${ROCKETMQ_HOME}/bin/mqnamesrv

RUN mv ${ROCKETMQ_HOME}/bin/runbroker-customize.sh ${ROCKETMQ_HOME}/bin/runbroker.sh \
 && chmod +x ${ROCKETMQ_HOME}/bin/runbroker.sh \
 && chmod +x ${ROCKETMQ_HOME}/bin/mqbroker

# RocketMQ WorkDIR
WORKDIR ${ROCKETMQ_HOME}/bin
