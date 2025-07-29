#!/bin/bash
set -e

echo "📂 Setting up uWSGI configuration..."
mkdir -p uwsgi
cp examples/uwsgi.example uwsgi/uwsgi.ini
cat uwsgi/uwsgi.ini

echo "🛠️ Setting up systemd service..."
sudo cp /opt/software_portal/examples/service.example /etc/systemd/system/software_portal.service
sudo systemctl daemon-reload
sudo systemctl start software_portal.service
sudo systemctl enable software_portal.service
sudo systemctl status software_portal.service

echo "🌐 Configuring Nginx..."
cd /etc/nginx/conf.d/
sudo cp /opt/software_portal/examples/nginx.example en2bn.com.conf
sudo nginx -t
sudo systemctl restart nginx

echo "🔁 Restarting service..."
cd /opt/software_portal/
sudo systemctl restart software_portal.service

echo "✅ Deployment setup complete! 🚀"
