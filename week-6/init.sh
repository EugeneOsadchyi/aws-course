#!/bin/bash

bucket_name='eosadchyi'

aws s3 mb s3://$bucket_name

aws s3api put-bucket-tagging --bucket $bucket_name --tagging "TagSet=[{Key=Project_Name, Value=Lohika AWS Course}]"
aws s3api put-bucket-versioning --bucket $bucket_name --versioning-configuration Status=Enabled
aws s3api put-public-access-block --bucket $bucket_name --public-access-block-configuration BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true

aws s3 cp calc-0.0.1-SNAPSHOT.jar s3://$bucket_name
aws s3 cp persist3-0.0.1-SNAPSHOT.jar s3://$bucket_name

aws s3 cp bootstrap_public.service s3://$bucket_name
aws s3 cp bootstrap_private.service s3://$bucket_name
