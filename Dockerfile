FROM python:2.7.13

RUN useradd -m -d /aws -s /bin/bash aws
USER aws
WORKDIR /aws
RUN \
  virtualenv --python=python2 custodian \
  && echo source custodian/bin/activate > .bash_profile \
  && bash -lc "pip install c7n" \
;
