#!/usr/bin/env bash

set -e

export AWS_DEFAULT_REGION=us-east-1
custodian run vols.yaml -s s3://photobox-aws-cost-control/
