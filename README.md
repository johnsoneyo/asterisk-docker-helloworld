# asterisk-docker-helloworld

### Instructions

First clone the repository.

`git clone https://github.com/bigyan/asterisk-docker-helloworld.git`

Build the docker image.

`cd asterisk-docker-helloworld`

`docker build -t asterisk-alpine:1 .`

Now, run the docker container

`docker run -it --name=test1 --rm --net=host asterisk-alpine:1 /bin/sh`

You are now inside the docker container. You can now run asterisk.

`asterisk -cvvvvv`


### Softphone Configuration

You can use the following two predefined sip accounts to connect your softphones to asterisk.

```username: 3001
password: 3001pass

username: 3002
password: 3002pass```


### First Run

Dial any number in your connected softphone and you will hear a 'Hello World' audio.
