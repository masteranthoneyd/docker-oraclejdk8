FROM frolvlad/alpine-oraclejre8:8.202.08-slim
MAINTAINER ybd <yangbingdong1994@gmail.com>

ARG TZ 
ENV TZ=${TZ:-"Asia/Shanghai"}
COPY --from=hengyunabc/arthas:latest /opt/arthas /arthas
RUN apk update && \
    apk add --no-cache && \
    apk add curl bash tree tzdata busybox-extras && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone 
