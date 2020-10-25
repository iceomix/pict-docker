# Dockerized Pairwise Independent Combinatorial Testing

This is a dockerized version of [PICT](https://github.com/microsoft/pict)

## How to use

Standalone PICT accepts filename as input model, but in docker wrapper it is more convenient to use standard input:

```cat model | docker run --rm -i ghcr.io/iceomix/pict```

Alternatively, you can pass PICT options as arguments:

```cat model | docker run --rm -i ghcr.io/iceomix/pict [options]```

PICT options:

    /o:N    - Order of combinations (default: 2)
    /d:C    - Separator for values  (default: ,)
    /a:C    - Separator for aliases (default: |)
    /n:C    - Negative value prefix (default: ~)
    /e:file - File with seeding rows
    /r[:N]  - Randomize generation, N - seed
    /c      - Case-sensitive model evaluation
    /s      - Show model statistics