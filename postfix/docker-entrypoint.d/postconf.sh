#!/bin/sh
postconf -e myorigin=$mydomain
postconf -e smtpd_banner=$myhostname ESMTP $mail_name (Debian/GNU)
postconf -e biff=no
postconf -e append_dot_mydomain=no
postconf -e readme_directory=no
postconf -e compatibility_level=2
postconf -e smtpd_use_tls=no
postconf -e smtpd_sasl_path=inet:${sasl_host:=dovecot.mail:12345}
postconf -e smtpd_sasl_type=dovecot
postconf -e smtpd_relay_restrictions=permit_mynetworks permit_sasl_authenticated defer_unauth_destination
postconf -e myhostname=${hostname:=`hostname`}
postconf -e relayhost=
postconf -e mynetworks=127.0.0.0/8 [::ffff:127.0.0.0]/104 [::1]/128
postconf -e mailboxsizelimit=0
postconf -e recipientdelimeter=+
postconf -e inet_interfaces=all
postconf -e inet_protocols=all
postconf -e virtual_transport=lmtp:inet:${lmtp_host:=dovecot.mail:24}
postconf -e virtual_mailbox_domains=${mail_domain}:=test.pi}
postconf -M submission/inet="submission   inet   n   -   y   -   -   smtpd"
postconf -P "submission/inet/syslog_name=postfix/submission"
postconf -P "submission/inet/smtpd_recipient_restrictions="
postconf -P "submission/inet/smtpd_sasl_auth_enable=yes"
postconf -P "submission/inet/smtpd_reject_unlisted_recipient=no"
postconf -P "submission/inet/smtpd_relay_restrictions=permit_sasl_authenticated,reject"
postconf -P "submission/inet/milter_macro_daemon_name=ORIGINATING"
