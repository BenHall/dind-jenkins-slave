USER=benhall
IMAGE=dind-jenkins-agent

.PHONY: build push

default: build

build:
	docker build -t $(USER)/$(IMAGE) .

push:
	docker push $(USER)/$(IMAGE)
