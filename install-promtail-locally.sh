#!/bin/bash
set -euo pipefail

cd /tmp/
wget https://github.com/grafana/loki/releases/download/v2.7.1/promtail-linux-amd64.zip
aunpack promtail-linux-amd64.zip 
mv promtail-linux-amd64 ~/.local/bin/promtail
chmod +x ~/.local/bin/promtail
