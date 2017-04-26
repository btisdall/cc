#!/usr/bin/env bash

set -e

ACCOUNTID=${ACCOUNT_ID:-"$(aws sts get-caller-identity --query 'Account' --output text)"}
sed -i "s!%%ACCOUNT_ID%%!${ACCOUNT_ID}!" *yaml
