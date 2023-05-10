FROM alpine:3.15 AS build

WORKDIR /tmp
ENV GOPATH /tmp

RUN apk add --update build-base git go libcap-dev
RUN git config --global http.followRedirects true
# RUN git clone https://github.com/hlandau/acmetool
RUN go install github.com/hlandau/acmetool@latest

# WORKDIR /tmp/acmetool
# RUN make .
# RUN make install

FROM alpine:3.15
LABEL org.opencontainers.image.authors="rmamba@gmail.com"

COPY --from=build /usr/local/bin/acmetool /usr/local/bin/acmetool

RUN acmetool
