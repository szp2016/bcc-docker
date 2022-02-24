[bcc-docker](https://hub.docker.com/r/szp2030/bcc) is provided for user to try out [bcc](https://github.com/iovisor/bcc).
采用bcc源码在docker中编译安装bcc，使用Ubuntu 20.04.3 LTS作为基础镜像
相比二进制文件安装的bcc，此版本较新。
From your host shell:
```bash
sudo docker run -it  \
-v /lib/modules:/lib/modules:ro  \
-v /usr/src:/usr/src:ro \
-v /etc/localtime:/etc/localtime:ro \
--privileged --pid=host --workdir /usr/share/bcc/ szp2030/bcc:v1.0
```

Now, from the container shell, you can try the various pre-installed bcc tools.

For examples, please refer to the [bcc tutorial](https://github.com/iovisor/bcc/tree/master/docs/tutorial.md#1-general-performance).
