IMAGE = photobox-custodian:latest

docker_base_command = docker run \
	-e HOME=/aws \
	-it \
	-v `pwd`:/aws/config \
	-v $${HOME}/.aws:/aws/.aws \
	-w /aws \
	${IMAGE}

.PHONY: shell
shell: image
	${docker_base_command} \
		/bin/bash -l

.PHONY: image
image:
	docker build -t photobox-custodian .
