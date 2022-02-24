#!/bin/bash
sudo docker run -it --rm  -v /lib/modules:/lib/modules:ro  -v /usr/src:/usr/src:ro -v /etc/localtime:/etc/localtime:ro --privileged --pid=host --workdir /usr/share/bcc/ szp2030/bcc:v1.0
