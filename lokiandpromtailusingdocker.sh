#!/bin/bash

#if yoou have docker installed then only use these
wget https://raw.githubusercontent.com/grafana/loki/v2.8.0/cmd/loki/loki-localconfig.yaml -O loki-config.yaml
docker run -d --name loki -v $(pwd):/mnt/config -p 3100:3100 grafana/loki:2.8.0 --config.file=/mnt/config/loki-config.yaml

wget https://raw.githubusercontent.com/grafana/loki/v2.8.0/clients/cmd/promtail /promtail-docker-config.yaml -O promtail-config.yaml
docker run -d --name promtail -v $(pwd):/mnt/config -v /var/log:/var/log --link loki grafana/promtail:2.8.0 --config.file=/mnt/config/promtail-config.yaml
