FROM python:2.7.13

RUN useradd -m -d /code -s /bin/bash aws
USER aws
WORKDIR /code

RUN \
  virtualenv --python=python2 custodian \
;
