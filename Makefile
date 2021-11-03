.PHONY: all build push test version
include VERSION.env
include ARCHI.env

DOCKER_IMAGE_VERSION=$(VERSION)
DOCKER_IMAGE_ARCHI=$(ARCHI)
DOCKER_IMAGE_NAME=tloxipeuhca/rpi-rclone


all: build

build:
	docker build -t $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_VERSION) --build-arg GF_VERSION=$(DOCKER_IMAGE_VERSION) -f Dockerfile$(DOCKER_IMAGE_ARCHI) .
	docker build -t $(DOCKER_IMAGE_NAME):latest --build-arg GF_VERSION=$(DOCKER_IMAGE_VERSION) -f Dockerfile$(DOCKER_IMAGE_ARCHI) .
push:
	docker push $(DOCKER_IMAGE_NAME)

test:
	docker run --rm $(DOCKER_IMAGE_NAME) /bin/echo "Success."

version:
	docker run --rm $(DOCKER_IMAGE_NAME) rclone version

