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
CUSTOMER=bob
INSTANCE=$HOSTNAME
LOKI_URL=https://loki.example.com/loki/api/v1/push
LOKI_BASIC_AUTH_USERNAME=alice
LOKI_BASIC_AUTH_PASSWORD=xxxxxxxxxxxxxxx
EOF
```


# Test Locally
```
cd /opt/promtail
vi config.yml

set -o allexport; source .env; set +o allexport
./bin/dry-run
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
systemctl enable promtail.service
systemctl start promtail.service
journalctl -fu promtail
```
