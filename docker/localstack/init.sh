#!/bin/bash

set -e

# Wait for LocalStack to be ready
while ! nc -z localhost 4566; do sleep 1; done

# Create S3 Bucket
awslocal s3 mb s3://advertising-analytics-test

# Put Objects in Bucket
awslocal s3 cp src/main/resources/development/dump/relation-query/relation_query_keyword_MLA_2022-12-23.csv s3://advertising-analytics-test/BAds/relation_query_keyword/MLA/