bucket_name='eosadchyi'

aws s3 mb s3://$bucket_name

aws s3api put-bucket-tagging --bucket $bucket_name --tagging "TagSet=[{Key=Project_Name, Value=Lohika AWS Course}]"
aws s3api put-bucket-versioning --bucket $bucket_name --versioning-configuration Status=Enabled
aws s3api put-public-access-block --bucket $bucket_name --public-access-block-configuration BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true

aws s3 cp sns-script.sh s3://$bucket_name
aws s3 cp sqs-script.sh s3://$bucket_name
