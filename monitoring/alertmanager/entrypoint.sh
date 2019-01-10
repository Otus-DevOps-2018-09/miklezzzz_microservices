#!/bin/sh

if [ "$SMTP_TO" != "" ]; then sed -i "s/SMTP_TO/$SMTP_TO/" /etc/alertmanager/alertmanager.yml; fi
if [ "$SMTP_SMARTHOST" != "" ]; then sed -i "s/SMTP_SMARTHOST/$SMTP_SMARTHOST/" /etc/alertmanager/alertmanager.yml; fi
if [ "$SMTP_AUTH_USERNAME" != "" ]; then sed -i "s/SMTP_AUTH_USERNAME/$SMTP_AUTH_USERNAME/g" /etc/alertmanager/alertmanager.yml; fi
if [ "$SMTP_AUTH_PASSWORD" != "" ]; then sed -i "s/SMTP_AUTH_PASSWORD/$SMTP_AUTH_PASSWORD/g" /etc/alertmanager/alertmanager.yml; fi

/bin/alertmanager $@
