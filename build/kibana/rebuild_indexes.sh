#!/bin/bash

for index in $(curl -s $ELASTICSEARCH_URL/_aliases?pretty=true | grep `date +"%Y"` | sed 's/[":{ ]//g' | sed "s/`date +"%Y"`.*/*/g") ; do
     if [[ "$index" != "docker-entrypoint.sh" ]]; then
        #echo $index
	curl -s -XPUT $ELASTICSEARCH_URL/.kibana/index-pattern/$index -d '{"title" : "$index",  "timeFieldName": "@timestamp"}'
     fi
done
