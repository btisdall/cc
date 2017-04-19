IMAGE = photobox-custodian:latest

ifeq (${AWS_PROFILE},)
$(error AWS_PROFILE unset)
endif

docker_base_command = docker run \
	-e AWS_PROFILE=$${AWS_PROFILE} \
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
