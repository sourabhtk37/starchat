#!/usr/bin/env bash

HOSTNAME=${1:-"localhost"}
PORT=${2:-8000}
INDEX_NAME=${3:-"jenny-en-0"}
BASEPATH=${4:-""}

if [[ $# -le 1 ]]; then
    echo "Usage: ${0} <hostname> <port> <indexname> <basepath>"
    echo "Esample: ${0} ${HOSTNAME} ${PORT} ${INDEX_NAME} \"/soshojenny\""
    echo "Default: ${0} ${HOSTNAME} ${PORT} ${INDEX_NAME} ${BASENAME}"
    exit 1
fi

echo "Parameters: $@"

curl --header "apikey: xxxxxx" -XDELETE "${HOSTNAME}:${PORT}${BASEPATH}/${INDEX_NAME}"

