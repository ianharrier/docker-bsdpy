FROM alpine:3.8

#-------------------------------------------------------------------------------
#  Python
#-------------------------------------------------------------------------------

RUN set -ex \
        && apk --no-cache add \
               python2

#-------------------------------------------------------------------------------
#  BSDPy (https://github.com/bruienne/bsdpy)
#-------------------------------------------------------------------------------

ARG BSDPY_VERSION

WORKDIR /usr/local/bsdpy

RUN set -ex \
        && apk --no-cache add \
               git \
               py2-pip \
        && git clone https://github.com/bruienne/bsdpy.git . \
        && git checkout ${BSDPY_VERSION} \
        && ln -s /dev/stdout /var/log/bsdpserver.log \
        && pip install -r requirements.txt \
        && mkdir -p /nbi \
        && apk --no-cache del \
               git \
               py2-pip

EXPOSE 67/udp

VOLUME ["/nbi"]

CMD ["python","bsdpserver.py"]

#-------------------------------------------------------------------------------
#  Scripts
#-------------------------------------------------------------------------------

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint

RUN set -ex \
        && chmod +x /usr/local/bin/docker-entrypoint

ENTRYPOINT ["docker-entrypoint"]
