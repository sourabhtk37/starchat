#!/usr/bin/env bash

curl -v -H "Content-Type: application/json" -X POST http://localhost:8888/knowledgebase -d '{
	"id": "0",
	"conversation": "id:1000",
	"index_in_conversation": 1,
	"question": "how are you?",
	"answer": "fine thanks",
	"verified": true,
	"topics": "t1 t2",
	"doctype": "normal",
	"state": "",
	"status": 0
}' 

