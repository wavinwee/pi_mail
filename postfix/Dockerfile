FROM resin/rpi-raspbian 

# RUN apt-get update && apt-get install expect
# COPY install_script /etc/postfix/install_script
# ENV DEBIAN_FRONTEND interactive
# ENTRYPOINT set -v && /etc/postfix/install_script
# EXPOSE 25
# CMD postfix start && tail -f /dev/null

# Set params for postfix install
RUN apt update && apt install debconf
# RUN debconf-set-selections <<< "postfix postfix/mailname string $(hostname -f)" 
# RUN debconf-set-selections <<< "postfix postfix/main_mailer_type string 'Internet Site'"
RUN echo "postfix postfix/main_mailer_type string Internet Site" | debconf-set-selections
RUN echo "postfix postfix/mailname string test.pi" | debconf-set-selections


# Postfix install 
RUN apt update && apt install -y postfix

COPY master.cf /etc/postfix/master.cf
COPY main.cf /etc/postfix/main.cf

# Start postfix server and leave the container running
CMD postfix start && tail -f /dev/null

# Allow SMTP port to be visible
EXPOSE 25
