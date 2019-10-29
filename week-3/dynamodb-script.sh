#!/bin/bash

mkdir ~/.aws
echo -e "[default]\nregion = eu-west-2" > ~/.aws/config

aws dynamodb put-item \
    --table-name AwsTrainingUsers \
    --item '{ "UserName": {"S": "Eugene"}, "Title": {"S": "Software Engineer"} }' \
    --return-consumed-capacity TOTAL

sleep 10

aws dynamodb query \
    --table-name AwsTrainingUsers \
    --key-condition-expression "UserName = :name" \
    --expression-attribute-values '{":name": {"S":"Eugene"}}'
