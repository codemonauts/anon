#! /usr/bin/env bash

set -e

# Get config for this bot from S3
aws s3 cp s3://wikichanges/${INSTANZ}.json /opt/anon/config.json

# Get newest IP Ranges
git clone https://github.com/codemonauts/bundesedit /tmp/ranges
cp /tmp/ranges/${INSTANZ}.json /opt/anon/ranges.json

/opt/anon/anon.coffee
