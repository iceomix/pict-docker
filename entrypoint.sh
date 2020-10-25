#!/bin/sh

if [ -t 0 ]; then
    printf "Pairwise Independent Combinatorial Testing in Docker

Usage: cat model | docker run --rm -i ghcr.io/iceomix/pict [options]

Options:
 /o:N    - Order of combinations (default: 2)
 /d:C    - Separator for values  (default: ,)
 /a:C    - Separator for aliases (default: |)
 /n:C    - Negative value prefix (default: ~)
 /e:file - File with seeding rows
 /r[:N]  - Randomize generation, N - seed
 /c      - Case-sensitive model evaluation
 /s      - Show model statistics\n"
    exit 1
else
    cat > /tmp/model
    if [ -s "/tmp/model" ]; then
        pict /tmp/model "$@"
    else
        echo "Empty model is provided or missing -i option for docker run"
        exit 1
    fi
fi