#!/bin/sh
# Sets up the short link site on the Pi and keeps it running on port 8081.
set -e
D=/root/shortsite
U=https://raw.githubusercontent.com/Greenisus1/short-link-site/main
mkdir -p $D
wget -q -O $D/index.html $U/1-index.html
wget -q -O $D/go.html $U/2-go.html
wget -q -O $D/logo.png $U/3-logo.png
wget -q -O $D/favicon.png $U/4-favicon.png
wget -q -O $D/apple-touch-icon.png $U/5-apple-touch-icon.png
cat > /etc/systemd/system/shortsite.service <<UNIT
[Unit]
Description=Short link site
After=network.target

[Service]
ExecStart=/usr/bin/python3 -m http.server 8081 --directory $D
Restart=always

[Install]
WantedBy=multi-user.target
UNIT
systemctl daemon-reload
systemctl enable --now shortsite
sleep 1
ls -la $D
systemctl is-active shortsite
echo Done. Site is on http://localhost:8081
