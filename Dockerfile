FROM cloudron/base:0.10.0
MAINTAINER Scott Humphries <docker@sscotth.io>

RUN apt-get update -q
RUN apt-get upgrade -qy
RUN apt-get install -qy znc
RUN rm -rf /var/lib/apt/lists/*

ADD znc.conf.template /app/code/znc.conf.template
ADD start.sh /app/code/start.sh

CMD [ "/app/code/start.sh" ]
