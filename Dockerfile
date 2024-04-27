FROM ubuntu:latest

RUN apt-get update && apt-get -y install cron

ADD crontab /etc/crontab
RUN chmod 0644 /etc/crontab

ADD scripts/*.sh /
RUN chmod +x *.sh

CMD /entrypoint.sh