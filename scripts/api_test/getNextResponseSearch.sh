#!/usr/bin/env bash

curl -v -H "Content-Type: application/json" -X POST http://localhost:8888/get_next_response -d '{
	"user_id": "1234",
	"user_input": { "text": "cannot access account" },
	"values": {
		"return_value": "",
		"data": {}
	}
}'
