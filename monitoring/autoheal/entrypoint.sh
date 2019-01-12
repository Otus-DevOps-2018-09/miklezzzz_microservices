#!/bin/bash

sed -i "s/my-user/$awx_user/" /etc/autoheal/autoheal.yml
sed -i "s/my-password/$awx_password/" /etc/autoheal/autoheal.yml

/usr/bin/autoheal $@
