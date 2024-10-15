FROM        golang:1.14-alpine as builder
WORKDIR     /usr/src/mongodb_exporter
COPY        . /usr/src/mongodb_exporter
RUN         go build -v


FROM        alpine:3.11
RUN apk add --no-cache ca-certificates
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=builder /usr/src/mongodb_exporter/mongodb_exporter /mongodb_exporter
EXPOSE 9216
# 设置环境变量
ENV MONGODB_URI=${MONGODB_URI}
ENTRYPOINT  ["/mongodb_exporter"]



#FROM alpine AS builder
#RUN apk add --no-cache ca-certificates
#
#FROM scratch AS final
#USER 65535:65535
#COPY  --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
#COPY ./mongodb_exporter /
#EXPOSE 9216
#ENTRYPOINT ["/mongodb_exporter"]