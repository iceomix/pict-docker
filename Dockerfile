ARG PICT_VER=3.7.4
ARG ALPINE_VER=3.20

FROM alpine:${ALPINE_VER} AS builder
ARG PICT_VER
RUN apk add --no-cache alpine-sdk perl curl
RUN curl -L https://github.com/microsoft/pict/archive/v${PICT_VER}.tar.gz \
    | tar -xz -C /tmp \
    && cd /tmp/pict-${PICT_VER} \
    && make

FROM alpine:${ALPINE_VER}
ARG PICT_VER
RUN apk add --no-cache libstdc++
COPY --from=builder /tmp/pict-${PICT_VER}/pict /usr/local/bin/pict
COPY --from=builder /tmp/pict-${PICT_VER}/LICENSE.TXT /
COPY entrypoint.sh /
ENTRYPOINT [ "/entrypoint.sh" ]
