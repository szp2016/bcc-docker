REPO := bcc
TAG := focal

UNAMER := $(shell uname -r)
HOST_DIRS := /lib/modules/$(UNAMER) /usr/src/linux-headers-$(UNAMER)
HOST_DIRS += /usr/src/linux-headers-$(subst -generic,,$(UNAMER))
HOST_DIRS += /etc/localtime
DOCKER_VOLUMES := $(join $(HOST_DIRS),$(addprefix :,$(HOST_DIRS)))
DOCKER_VOLUMES := $(addsuffix :ro,$(DOCKER_VOLUMES))
DOCKER_VOLUMES := $(addprefix -v ,$(DOCKER_VOLUMES))

#DOCKER_CAP_ADD := SYS_ADMIN
#DOCKER_CAPS := $(addprefix --cap-add ,$(DOCKER_CAP_ADD))
DOCKER_CAPS := --privileged
DOCKER_PIDS := --pid=host

build: build.${TAG}
.PHONY: build.${TAG}
build.${TAG}:
	docker build -t $(REPO):${TAG} -f Dockerfile.${TAG} .

push: push.${TAG}
.PHONY: push.${TAG}
push.${TAG}:
	docker push $(REPO):${TAG}}

.PHONY: run.${TAG}
run.${TAG}:
	docker run -it --rm $(DOCKER_CAPS) $(DOCKER_VOLUMES) $(DOCKER_CAPS) $(DOCKER_PIDS) --workdir /usr/share/bcc/ $(REPO):${TAG}

.PHONY: build push


.PHONY: run
run:
	echo "Run targets are: $(addprefix run.,$(TAG))"

