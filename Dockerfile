FROM wurstmeister/kafka:latest

# we replace the default connect-standalone.properties so we can properly resolve to our local kafka docker development
COPY connect-standalone.properties /opt/kafka/config/
COPY connect-rockset-sink.properties /opt/kafka/config/

COPY kafka-connect-rockset-*-jar-with-dependencies.jar /tmp/

# we replace the start command creating a connector instead.
COPY start-kafka.sh /usr/bin/

# setting permissions to make script executable
RUN chmod a+x /usr/bin/start-kafka.sh
