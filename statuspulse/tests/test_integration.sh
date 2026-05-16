#!/bin/bash

set -e

BASE_URL=http://localhost:8000

echo "Testing health endpoint"
curl -f $BASE_URL/health

echo "Testing services creation"
curl -X POST $BASE_URL/services \
-H "Content-Type: application/json" \
-d '{"name":"google","url":"https://google.com"}'

echo "Testing services list"
curl $BASE_URL/services

echo "Testing incidents"
curl -X POST $BASE_URL/incidents \
-H "Content-Type: application/json" \
-d '{"service_name":"google","title":"Down"}'

echo "Testing incidents list"
curl $BASE_URL/incidents

echo "All tests passed"
