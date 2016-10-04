#!/usr/bin/env bash

# retrieve one or more entries with given ids; ids can be specified multiple times
curl -v -H "Content-Type: application/json" "http://localhost:8888/decisiontable?ids=further_details_access_question"

