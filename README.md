# Formal Languages and Compilers Library

### Structure
- __lib/__ contains templates file for the exam
- __tools/__ contains archives needed to build the docker image

### Docker image
Download java from [oracle](http://www.oracle.com/technetwork/java/javase/downloads/index.html) and place it under __tools/__ folder (i.e. tools/jdk-13.0.2_linux-x64_bin.tar.gz). The Dockerfile assume version _13.0.2_.
__Note__: openjdk cannot be used.

#### Build image
```
docker build -t flc .
```

#### Run container
It is assumed that the image provide only the build tools, while the source code remains in the host file system

This command create a container from the previously built image, open a shell (zsh) in interactive mode, remove the container on exit and mount the current working directory on the host into /mnt
```
docker run --rm -it -v "$(pwd):/mnt" flc
```

#### Run tools
Execute this command from the mounted directory inside the container (i.e. ```cd /mnt```).

Assuming that the current working directory contains necessary files _(see lib/ directory for templates)_
:
```
make run
```
