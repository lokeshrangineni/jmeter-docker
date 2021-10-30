# build on the top of Java image
FROM java:8
# JMeter Version
ARG JMETER_VERSION="5.4.1"
# Add jmeter to docker.
ADD apache-jmeter-5.4.1-enhanced.tar.gz /opt

# Adding the Jmeter benchmark files to docker images.
ADD UsersDurationSimpleHT.jmx /opt
ADD UsersRequestsSimpleHT.jmx /opt

# Add the jmeter bin directory to the path so that we can run the benchmarking from any directory.
ENV PATH="/opt/apache-jmeter-5.4.1-enhanced/bin/:${PATH}"

# Indicate the default command to run, we also can override during actual run.
CMD jmeter --version && JMeterPluginsCMD.sh --version
