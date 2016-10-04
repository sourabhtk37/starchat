#!/usr/bin/env bash

curl -v -H "Content-Type: application/json" -X PUT http://localhost:8888/knowledgebase/0 -d '{
	"conversation": "id:1001",
	"question": "hello, how are you?",
	"answer": "fine thanks",
	"verified": true,
	"topics": "t1 t2",
	"doctype": "normal",
	"state": "",
	"status": 0
}' 

