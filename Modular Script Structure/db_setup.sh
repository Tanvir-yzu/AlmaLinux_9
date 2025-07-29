#!/bin/bash
set -e

echo "🗄️ Creating PostgreSQL database..."
sudo -u postgres psql <<EOF
CREATE DATABASE portal_db;
\q
EOF

echo "🔁 Running Django migrations..."
python manage.py migrate
