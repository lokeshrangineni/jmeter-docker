# jmeter-docker
This project will add Jmeter in the docker. You can build docker image and run the image on Docker, Kubernets or Openshift environments. 

### Building the docker images

Please execute below to command from the home directory of this project. Below command will build a docker image and tags the name as ``lokesh/jmeter``. Please modify it as per your requirement.

```shell
docker build -t lokesh/jmeter:1.0.0 .
```

### Running the Jmeter docker image.
Running the default command - `jmeter --version`

```shell
docker run lokesh/jmeter
```
**Output**
```shell
➜  jmeter-docker git:(main) docker run lokesh/jmeter
Oct 30, 2021 4:46:17 AM java.util.prefs.FileSystemPreferences$1 run
INFO: Created user preferences directory.
    _    ____   _    ____ _   _ _____       _ __  __ _____ _____ _____ ____
   / \  |  _ \ / \  / ___| | | | ____|     | |  \/  | ____|_   _| ____|  _ \
  / _ \ | |_) / _ \| |   | |_| |  _|    _  | | |\/| |  _|   | | |  _| | |_) |
 / ___ \|  __/ ___ \ |___|  _  | |___  | |_| | |  | | |___  | | | |___|  _ <
/_/   \_\_| /_/   \_\____|_| |_|_____|  \___/|_|  |_|_____| |_| |_____|_| \_\ 5.4.1

Copyright (c) 1999-2021 The Apache Software Foundation
```

Running the custom command. 

```shell
docker run lokesh/jmeter /bin/bash -c "jmeter --version && echo another command"
```

```shell
➜  jmeter-docker git:(main) ✗ docker run lokesh/jmeter /bin/bash -c "jmeter --version && echo another command"
Oct 30, 2021 4:48:51 AM java.util.prefs.FileSystemPreferences$1 run
INFO: Created user preferences directory.
    _    ____   _    ____ _   _ _____       _ __  __ _____ _____ _____ ____
   / \  |  _ \ / \  / ___| | | | ____|     | |  \/  | ____|_   _| ____|  _ \
  / _ \ | |_) / _ \| |   | |_| |  _|    _  | | |\/| |  _|   | | |  _| | |_) |
 / ___ \|  __/ ___ \ |___|  _  | |___  | |_| | |  | | |___  | | | |___|  _ <
/_/   \_\_| /_/   \_\____|_| |_|_____|  \___/|_|  |_|_____| |_| |_____|_| \_\ 5.4.1

Copyright (c) 1999-2021 The Apache Software Foundation

another command
```

```shell
docker run -v `pwd`/tmp:'/tmp' lokesh/jmeter /bin/bash -c "jmeter --version > /tmp/hello.txt"
```


## Running the Benchmarking [UsersDurationSimpleHT.jmx](UsersDurationSimpleHT.jmx) using Jmeter
Below command will use the docker image to run the test and generate the aggregate report to docker containers /tmp directory. This command also mounts the docker container's `/tmp` directory to `hostPwd/tmp` so that we can see the results after Jmeter benchmark execution is completed in the docker container.

```shell
docker run -v `pwd`/tmp:'/tmp' lokesh/jmeter /bin/bash -c "jmeter -n -t /opt/UsersDurationSimpleHT.jmx -Jschema=http -Jurl=process-quarkus-example-mpaul-kogito.apps.mpkogito.p9nf.p1.openshiftapps.com -Jusers=60 -Jduration=120 -l /tmp/res0.jtl && JMeterPluginsCMD.sh --generate-csv /tmp/res0.csv --input-jtl /tmp/res0.jtl --plugin-type AggregateReport" 
```


#### Deploy the application using Pod yaml

Use the [pod definition](open-shift-kogito-jmeter-benchmark-pod.yml) to run the Kogito Jmeter benchmark project and upload the report to Noobaa storage. Also prints the report to console log.

If you are new to the Noobaa then refer this [tutorial](https://blog.oddbit.com/post/2021-02-10-object-storage-with-openshift/) and [Noobaa Wiki](https://github.com/noobaa/noobaa-core/wiki).

If you are new to AWS S3 CLIs then refer this [tutorial](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-docker.html)