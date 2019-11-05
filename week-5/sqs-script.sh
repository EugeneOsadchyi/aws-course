#!/bin/bash

mkdir -p ~/.aws
echo -e "[default]\nregion = eu-west-2" > ~/.aws/config

# Interactive parameters
while [ "$1" != "" ]; do
    case $1 in
        -q | --queue-url )
            shift
            queue_url=$1
            ;;
        -m | --message-body )
            shift
            message=$1
            ;;
        * )
            ;;
    esac
    shift
done

aws sqs send-message --queue-url $queue_url  --message-body $message
aws sqs receive-message --queue-url $queue_url
