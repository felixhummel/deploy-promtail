Deploy Promtail the easy way.


# Install Promtail
```
git clone https://github.com/felixhummel/provision.git ~/1-provision
cd ~/1-provision
./promtail
```


# Clone and Configure
```
git clone https://github.com/felixhummel/deploy-promtail /opt/promtail

cd /opt/promtail
cat <<EOF > .env
INSTANCE=$HOSTNAME
LOKI_URL=https://loki.example.com/loki/api/v1/push
LOKI_BASIC_AUTH_USERNAME=alice
LOKI_BASIC_AUTH_PASSWORD=xxxxxxxxxxxxxxx
EOF
```


# Test Pushing to Loki
```
./bin/loki-ready
./bin/run
```


# Systemd
```
cp share/promtail.service /etc/systemd/system/
systemctl daemon-reload
systemctl enable --now promtail.service

journalctl -fu promtail
```


# Customize Configuration
```
cd /opt/promtail
vi config.yml

./bin/dry-run
systemctl restart promtail.service
```


# LogCLI
- [docs](https://grafana.com/docs/loki/latest/tools/logcli/)
- [install](https://github.com/felixhummel/provision/blob/main/logcli)

usage:
```
./bin/logcli-query '{ job="varlogs", filename!~"/var/log/gitlab/.*" }'

# you can also use STDIN
./bin/logcli-query <<'EOF'
{
  job="varlogs",
  filename!~"/var/log/gitlab/.*"
}
EOF
```


# Documentation
- [configuration](https://grafana.com/docs/loki/latest/clients/promtail/configuration/)
