#!/bin/bash

owner_name="Eugene Osadchyi"
bucket_name="eosadchyi"

# Interactive parameters
while [ "$1" != "" ]; do
    case $1 in
        -o | --owner )
            shift
            owner_name=$1
            ;;
        -b | --bucket )
            shift
            bucket_name=$1
            ;;
        * )
            ;;
    esac
    shift
done

echo $owner_name > .project_owner

# Commands
aws s3 mb s3://$bucket_name

aws s3api put-bucket-tagging --bucket $bucket_name --tagging "TagSet=[{Key=Project_Name, Value=Lohika AWS Course}]"
aws s3api put-bucket-versioning --bucket $bucket_name --versioning-configuration Status=Enabled
aws s3api put-public-access-block --bucket $bucket_name --public-access-block-configuration BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true

aws s3 cp .project_owner s3://$bucket_name
