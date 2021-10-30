# build on the top of Java image
FROM java:8
# JMeter Version
ARG JMETER_VERSION="5.4.1"
# Add jmeter to docker.
ADD apache-jmeter-5.4.1-enhanced.tar.gz /opt
RUN cd /opt && ls -lah .
# Create a symlink to the jmeter process in a normal bin directory
RUN ln -s /opt/apache-jmeter-5.4.1-enhanced/bin/jmeter /usr/local/bin
# Indicate the default command to run
CMD jmeter --version
