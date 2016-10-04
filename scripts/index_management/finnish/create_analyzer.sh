#!/usr/bin/env bash

HOSTNAME=${1:-"localhost"}
PORT=${2:-8000}
INDEX_NAME=${3:-"jenny-fi-0"}
BASEPATH=${4:-""}

if [[ $# -le 1 ]]; then
	echo "Usage: ${0} <hostname> <port> <indexname> <basepath>"
	echo "Esample: ${0} ${HOSTNAME} ${PORT} ${INDEX_NAME} \"/soshojenny\""
	echo "Default: ${0} ${HOSTNAME} ${PORT} ${INDEX_NAME} ${BASENAME}"
	exit 1
fi

echo "Parameters: $@"

curl --header "apikey: xxxxxx" -XPUT "${HOSTNAME}:${PORT}${BASEPATH}/${INDEX_NAME}" -d '
{
	"settings": {
		"index.queries.cache.enabled": true,
		"analysis":
		{
			"char_filter":
			{
				"&_to_and": {
					"type":       "mapping",
					"mappings": [ "&=> and "]
				}
			},
			"filter":
			{
				"ele_fi_stopwords":
				{
					"type":       "stop",
					"stopwords": "_finnish_"
				},
				"finnish_stemmer": {
					"type":       "stemmer",
					"language":   "finnish"
				},
				"ele_fi_shingle_4":
				{
					"type":	"shingle",
					"min_shingle_size": 4,
					"max_shingle_size": 4,
					"output_unigrams": true
				}
			},
			"analyzer":
			{
				"ele_base_analyzer":
				{
					"tokenizer":    "standard",
					"char_filter":  [ "&_to_and" ],
					"filter":       [ "lowercase"]
				},
				"ele_stop_analyzer":
				{
					"tokenizer":    "standard",
					"char_filter":  [ "&_to_and" ],
					"filter":       [ "lowercase", "ele_fi_stopwords"]
				},
				"ele_stem_analyzer":
				{
					"tokenizer":    "standard",
					"char_filter":  [ "&_to_and" ],
					"filter":       [ "lowercase", "ele_fi_stopwords", "finnish_stemmer"]
				},
				"ele_shingles_4_analyzer":
				{
					"tokenizer":    "standard",
					"char_filter":  [ "html_strip", "&_to_and" ],
					"filter":       [ "lowercase", "ele_fi_shingle_4"]
				},
				"ele_stemmed_shingles_4_analyzer":
				{
					"tokenizer":    "standard",
					"char_filter":  [ "html_strip", "&_to_and" ],
					"filter":       [ "lowercase", "finnish_stemmer", "ele_fi_shingle_4"]
				}
			} 
		}
	}
}'

