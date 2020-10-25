#!/bin/sh

IMAGE="pict"
if [ -n "$1" ]; then
    IMAGE="$1"
fi

MODEL="A: 1"
RES_EXPECTED=$(printf "A\n1")
RES_ACTUAL=$(echo "$MODEL" | docker run --rm -i "$IMAGE")

if [ "$RES_ACTUAL" != "$RES_EXPECTED" ]; then
    printf "TEST FAILED

model:
%s

expected:
%s

got:
%s\n" "$MODEL" "$RES_EXPECTED" "$RES_ACTUAL"
    exit 1
else
    printf "TEST PASSED\n"
fi