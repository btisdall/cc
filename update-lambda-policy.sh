#!/usr/bin/env bash

set -e

sed -i "s!%%ACCOUNT_ID%%!$(aws sts get-caller-identity --query 'Account' --output text)"! *yaml
