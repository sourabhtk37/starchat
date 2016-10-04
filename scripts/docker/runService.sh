#!/usr/bin/env bash

docker run -d --net="host" -p 0.0.0.0:8888:8888 ${1}

