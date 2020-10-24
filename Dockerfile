ARG PICT_VER=3.7.1
ARG ALPINE_VER=3.12

FROM alpine:${ALPINE_VER} AS builder
ARG PICT_VER
RUN apk add --no-cache alpine-sdk perl
RUN curl -L https://github.com/microsoft/pict/archive/v${PICT_VER}.tar.gz \
    | tar -xz -C /tmp \
    && cd /tmp/pict-${PICT_VER} \
    && make \
    && make test

FROM alpine:${ALPINE_VER}
ARG PICT_VER
RUN apk add --no-cache libstdc++
COPY --from=builder /tmp/pict-${PICT_VER}/pict /usr/local/bin/pict
WORKDIR /pict
ENTRYPOINT [ "/usr/local/bin/pict" ]