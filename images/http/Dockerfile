FROM alpine:3.7

#-------------------------------------------------------------------------------
#  Apache
#-------------------------------------------------------------------------------

RUN set -ex \
        && apk --no-cache add \
               apache2 \
        && sed -i 's/^ServerTokens .*/ServerTokens Prod/g' /etc/apache2/httpd.conf \
        && sed -i 's/^ServerSignature .*/ServerSignature Off/g' /etc/apache2/httpd.conf \
        && sed -i 's/^#ServerName .*/ServerName localhost/g' /etc/apache2/httpd.conf \
        && ln -sf /dev/stdout /var/log/apache2/access.log \
        && ln -sf /dev/stderr /var/log/apache2/error.log \
        && mkdir -p /var/www/localhost/htdocs/content /var/www/localhost/htdocs/nbi \
        && mkdir -p /run/apache2

EXPOSE 80

VOLUME ["/var/www/localhost/htdocs/content"]
VOLUME ["/var/www/localhost/htdocs/nbi"]

CMD ["/usr/sbin/httpd","-D","FOREGROUND"]

#-------------------------------------------------------------------------------
#  Scripts
#-------------------------------------------------------------------------------

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint

RUN set -ex \
        && chmod +x /usr/local/bin/docker-entrypoint

ENTRYPOINT ["docker-entrypoint"]
