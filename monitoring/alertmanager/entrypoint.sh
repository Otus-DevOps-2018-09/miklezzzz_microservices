#!/bin/sh

sed -i "s/SMTP_TO/$SMTP_TO/" /etc/alertmanager/config.yml
sed -i "s/SMTP_SMARTHOST/$SMTP_SMARTHOST/" /etc/alertmanager/config.yml
sed -i "s/SMTP_AUTH_USERNAME/$SMTP_AUTH_USERNAME/g" /etc/alertmanager/config.yml
sed -i "s/SMTP_AUTH_PASSWORD/$SMTP_AUTH_PASSWORD/g" /etc/alertmanager/config.yml

/bin/alertmanager $@
