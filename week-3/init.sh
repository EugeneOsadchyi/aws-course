#!/bin/bash

bucket_name="eosadchyi"

# Interactive parameters
while [ "$1" != "" ]; do
    case $1 in
        -b | --bucket )
            shift
            bucket_name=$1
            ;;
        * )
            ;;
    esac
    shift
done

# Commands
aws s3 mb s3://$bucket_name

aws s3api put-bucket-tagging --bucket $bucket_name --tagging "TagSet=[{Key=Project_Name, Value=Lohika AWS Course}]"
aws s3api put-bucket-versioning --bucket $bucket_name --versioning-configuration Status=Enabled
aws s3api put-public-access-block --bucket $bucket_name --public-access-block-configuration BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true

aws s3 cp dynamodb-script.sh s3://$bucket_name
aws s3 cp rds-script.sql s3://$bucket_name
