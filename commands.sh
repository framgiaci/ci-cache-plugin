#!/bin/bash
if [ ! -d  /cache ]; then
  mkdir /cache
fi

if [ ! -d  /original ]; then
  mkdir /original
fi

if [ ! -d  /tmp ]; then
  mkdir /tmp
fi

IFS=' ' read -a arr <<< "${CACHE}"

if [ ! tmpLen = 0 ]; then
  tmpLen=${#arr[@]}
  for (( i=0; i<${tmpLen}; i++ )); do
    cp -R /original/${arr[$i]} /tmp
  done
fi

cd /tmp && zip -r cache.zip ./*
cp /tmp/cache.zip /cache
