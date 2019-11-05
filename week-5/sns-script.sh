#!/bin/bash

mkdir -p ~/.aws
echo -e "[default]\nregion = eu-west-2" > ~/.aws/config

# Interactive parameters
while [ "$1" != "" ]; do
    case $1 in
        -t | --topic-arn )
            shift
            topic_arn=$1
            ;;
        -m | --message )
            shift
            message=$1
            ;;
        * )
            ;;
    esac
    shift
done

aws sns publish --topic-arn $topic_arn --message $message
