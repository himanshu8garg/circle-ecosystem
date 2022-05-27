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

if [ $# -ne 2 ]
then
    echo "Usage: $0 bucket_name file_to_upload" >&2
    exit 1
fi

BUCKET="$1"
FILE="$2"

if [ -f "$FILE" ]
then
    echo "$FILE exists."
else
    echo "$FILE does not exist or isn't a file"
    exit 1
fi

aws s3 cp $FILE s3://$BUCKET/$FILE
#aws s3 sync catalog s3://$BUCKET/catalog --acl public-read --exclude "*" --include "*.yml" --include "*.yaml"



