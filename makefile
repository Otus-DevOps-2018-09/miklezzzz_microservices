default: build_services build_monitoring

build_services: ./src/ui/.build_ui ./src/post-py/.build_post-py ./src/comment/.build_comment

build_monitoring: ./monitoring/alertmanager/.build_am ./monitoring/exporter_blackbox/.build_bb ./monitoring/exporter_mongod/.build_md ./monitoring/prometheus/.build_prom ./monitoring/telegraf/.build_teleg ./monitoring/grafana/.build_grafana ./monitoring/exporter_stackdrive/.build_stackdrive ./monitoring/trickster/.build_trickster ./monitoring/autoheal/.build_autoheal

./src/ui/.build_ui: ./src/ui/Dockerfile ./src/ui/*.rb ./src/ui/VERSION
	docker build -t $(USERNAME)/ui ./src/ui/ && docker push $(USERNAME)/ui && touch ./src/ui/.build_ui && echo "UI READY!"

./src/post-py/.build_post-py: ./src/post-py/Dockerfile ./src/post-py/*.py ./src/post-py/VERSION
	docker build -t $(USERNAME)/post-py ./src/post-py/ && docker push $(USERNAME)/post-py && touch ./src/post-py/.build_post-py && echo "POST-PY READY!"

./src/comment/.build_comment: ./src/comment/Dockerfile ./src/comment/*.rb ./src/comment/VERSION
	docker build -t $(USERNAME)/comment ./src/comment/ && docker push $(USERNAME)/comment && touch ./src/comment/.build_comment && echo "COMMENT READY!"

./monitoring/alertmanager/.build_am: ./monitoring/alertmanager/Dockerfile ./monitoring/alertmanager/*.yml ./monitoring/alertmanager/*.sh
	docker build -t $(USERNAME)/alertmanager ./monitoring/alertmanager/ && docker push $(USERNAME)/alertmanager && touch ./monitoring/alertmanager/.build_am && echo "ALERTMANAGER READY!"

./monitoring/exporter_blackbox/.build_bb: ./monitoring/exporter_blackbox/Dockerfile ./monitoring/exporter_blackbox/blackbox_exporter ./monitoring/exporter_blackbox/*.yml
	docker build -t $(USERNAME)/blackbox_exp ./monitoring/exporter_blackbox/ && docker push $(USERNAME)/blackbox_exp && touch ./monitoring/exporter_blackbox/.build_bb && echo "BLACKBOX READY!"

./monitoring/exporter_mongod/.build_md: ./monitoring/exporter_mongod/Dockerfile ./monitoring/exporter_mongod/mongodb_exporter
	docker build -t $(USERNAME)/mongod_exp ./monitoring/exporter_mongod/ && docker push $(USERNAME)/mongod_exp && touch ./monitoring/exporter_mongod/.build_md && echo "MONGOD EXP READY!"

./monitoring/prometheus/.build_prom: ./monitoring/prometheus/Dockerfile ./monitoring/prometheus/*.yml
	docker build -t $(USERNAME)/prometheus ./monitoring/prometheus/ && docker push $(USERNAME)/prometheus && touch ./monitoring/prometheus/.build_prom && echo "PROMETHEUS READY!"

./monitoring/telegraf/.build_teleg: ./monitoring/telegraf/Dockerfile ./monitoring/telegraf/*.conf
	 docker build -t $(USERNAME)/telegraf ./monitoring/telegraf && docker push $(USERNAME)/telegraf && touch ./monitoring/telegraf/.build_teleg && echo "TELEGRAF READY!"

./monitoring/grafana/.build_grafana: ./monitoring/grafana/Dockerfile ./monitoring/grafana/dashboards/* ./monitoring/grafana/datasources/*
	docker build -t $(USERNAME)/grafana ./monitoring/grafana && docker push $(USERNAME)/grafana && touch ./monitoring/grafana/.build_grafana && echo "GRAFANA READY!"

./monitoring/exporter_stackdrive/.build_stackdrive: ./monitoring/exporter_stackdrive/Dockerfile ./monitoring/exporter_stackdrive/entrypoint.sh ./monitoring/exporter_stackdrive/stackdriver_exporter
	docker build -t $(USERNAME)/stackdriver_exp ./monitoring/exporter_stackdrive && docker push $(USERNAME)/stackdriver_exp && touch ./monitoring/exporter_stackdrive/.build_stackdrive && echo "STACKDRIVER EXP READY!"

./monitoring/trickster/.build_trickster: ./monitoring/trickster/Dockerfile ./monitoring/trickster/*.conf
	docker build -t $(USERNAME)/trickster ./monitoring/trickster && docker push $(USERNAME)/trickster && touch ./monitoring/trickster/.build_trickster && echo "TRICKSTER READY!"

./monitoring/autoheal/.build_autoheal: ./monitoring/autoheal/Dockerfile ./monitoring/autoheal/autoheal ./monitoring/autoheal/autoheal.yml ./monitoring/autoheal/*.sh
	docker build -t $(USERNAME)/autoheal ./monitoring/autoheal && docker push $(USERNAME)/autoheal && touch ./monitoring/autoheal/.build_autoheal && echo "AUTOHEAL READY!"

./src/ui/Dockerfile:

./src/comment/Dockerfile:

./src/post-py/Dockerfile:

./monitoring/alertmanager/Dockerfile:

./monitoring/exporter_blackbox/Dockerfile: ./monitoring/exporter_blackbox/blackbox_exporter

./monitoring/exporter_mongod/Dockerfile: ./monitoring/exporter_mongod/mongodb_exporter

./monitoring/exporter_stackdrive/Dockerfile: ./monitoring/exporter_stackdrive/stackdriver_exporter

./monitoring/trickster/Dockerfile: ./monitoring/trickster/trickster.conf

./monitoring/prometheus/Dockerfile:

./monitoring/telegraf/Dockerfile:

./monitoring/autoheal/Dockerfile: ./monitoring/autoheal/autoheal.yml

./monitoring/exporter_blackbox/blackbox_exporter:

./monitoring/exporter_mongod/mongodb_exporter:

./monitoring/exporter_stackdrive/stackdriver_exporter:

./monitoring/grafana/Dockerfile:

./monitoring/trickster/trickster.conf:

./monitoring/autoheal/autoheal:
