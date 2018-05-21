FROM arm32v6/alpine 

RUN apk add --no-cache dovecot \
    && addgroup -S -g 5000 vmail \
    && adduser -S -u 5000 -g vmail -h /home/vmail vmail \
    && touch /var/log/dovecot.log /var/log/dovecot-info.log \ 
    && mkdir -p /Maildir \
    && chown vmail:vmail /var/log/dovecot.log /var/log/dovecot-info.log /Maildir

COPY dovecot.conf /etc/dovecot/
COPY users /etc/dovecot/

EXPOSE 143 
CMD ["/usr/sbin/dovecot","-F","-c","/etc/dovecot/dovecot.conf"]
