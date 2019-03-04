#!/bin/sh

# wait for Elasticsearch to start, then run the setup script to
# create and configure the index.
curl -s -H 'Content-Type: application/json' -XPUT "http://elasticsearch:9200/_ingest/pipeline/test-pipeline" -d '{
                  "description": "Test pipeline",
                  "processors": [
                      {
                          "json": {
                              "if": "ctx.message.startsWith(\"{\")",
                              "field": "message",
                              "target_field": "tmt"
                          }
                      }
                  ]
              }'