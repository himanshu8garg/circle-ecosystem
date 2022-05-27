#!/bin/bash
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

## scanner.sh - Helper script to scan images using VirusTotalAPI
## Requires VIRUS_TOTAL_API_KEY env var

if [ $# -ne 1 ]
then
    echo "Usage: $0 bucket name" >&2
    exit 1
fi

BUCKET=$1


aws s3 sync catalog s3://$BUCKET/catalog --acl public-read --exclude "*" --include "*.yml" --include "*.yaml"



