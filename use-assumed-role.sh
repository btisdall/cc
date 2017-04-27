#!/usr/bin/env bash

set -e

unset AWS_SECRET_ACCESS_KEY AWS_ACCESS_KEY_ID AWS_SESSION_TOKEN

[ "$0" == "reset" ] && exit 0

eval $(aws sts assume-role --role-arn arn:aws:iam::${ACCOUNT_ID}:role/custodian-executor --role-session-name SER-1005 \
  | jq '.Credentials|["AWS_SECRET_ACCESS_KEY=\(.SecretAccessKey)","AWS_ACCESS_KEY_ID=\(.AccessKeyId)","AWS_SESSION_TOKEN=\(.SessionToken)"]|map("export \(.)")[]' -r)
