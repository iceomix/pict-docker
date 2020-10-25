# Dockerized Pairwise Independent Combinatorial Testing

This is a dockerized version of [PICT](https://github.com/microsoft/pict)

## How to use

Standalone PICT accepts filename as input model, but in docker wrapper it is more convenient to use standard input:

```cat model | docker run --rm -i ghcr.io/iceomix/pict```

Alternatively, you can pass PICT parameters as arguments:

```cat model | docker run --rm -i ghcr.io/iceomix/pict [options]```