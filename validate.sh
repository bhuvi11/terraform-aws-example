#!/usr/bin/env bash
cd example/examplea || return
rm .terraform.lock.hcl 2>/dev/null
rm .terraform -fr 2>/dev/null
terraform init -upgrade
terraform validate
make valid
