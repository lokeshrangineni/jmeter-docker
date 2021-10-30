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




