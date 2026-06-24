FROM ubuntu:24.04

ENV APPDIR="/root/app"

ENV NODENUMBER=1

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get -y install --no-install-recommends nano nodejs npm && rm -rf /var/lib/apt/lists/*

RUN mkdir -vp $APPDIR && cd $APPDIR && npm install express --save

COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]


