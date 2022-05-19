#!/bin/sh
#
# Copyright (c) 2022 Circle Internet Financial Trading Company Limited.
# All rights reserved.
#
# Circle Internet Financial Trading Company Limited CONFIDENTIAL
# This file includes unpublished proprietary source code of Circle Internet
# Financial Trading Company Limited, Inc. The copyright notice above does not
# evidence any actual or intended publication of such source code. Disclosure
# of this source code or any related proprietary information is strictly
# prohibited without the express written permission of Circle Internet Financial
# Trading Company Limited.
#

## linter.sh - Helper script to lint yml files
## Requires the yamllint package. can be installed apt-get -y install yamllint
## Usage : ./linter.sh "FILE TO CHECK"
if [ $# -ne 1 ]
then
    echo "Usage: $0 YAML file" >&2
    exit 1
fi
FILE="$1"
# ensure yamllint package is installed
yamllint -v &> /dev/null
if [ $? -ne 0 ]
then
    echo "Package yamllint does not exist. Please install yamllint" >&2
    exit 1
fi


### Steps
if [ $FILE == *.yml ] || [ $FILE == *.yaml ]  ; then
    yamllint $FILE
else
    echo "File $FILE does not exist or it isnt a yml or yaml file. Please check your file"
    exit 1
fi


