#!/bin/sh

echo $GCP_ACCOUNT > /root/gac.json
export GOOGLE_APPLICATION_CREDENTIALS=/root/gac.json

/bin/stackdriver_exporter $@
