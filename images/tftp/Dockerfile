FROM alpine:3.7

MAINTAINER Ian Harrier <github@harrier.us>

#-------------------------------------------------------------------------------
#  TFTP
#-------------------------------------------------------------------------------

RUN set -ex \
        && apk --no-cache add \
               tftp-hpa

EXPOSE 69/udp

VOLUME ["/var/tftpboot"]

CMD ["/usr/sbin/in.tftpd","--foreground","--user","nobody","--address","0.0.0.0:69/udp","--secure","/var/tftpboot"]
