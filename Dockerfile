FROM ubuntu:19.10
RUN apt-get update \
 && apt-get install -y git curl wget kcov busybox less tree vim nano shellcheck \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*
ENV TERM=xterm-color
WORKDIR /root/demo
COPY ./docker-entrypoint.sh /
COPY ./ /root/demo/
RUN rm /root/demo/docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "/bin/bash" ]
