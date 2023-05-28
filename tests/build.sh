#!/usr/bin/env bash

cat package.json | grep -v electron > server-package.json

docker build . --tag elestio4test/trilium:latest
TAG_TO_CHANGE