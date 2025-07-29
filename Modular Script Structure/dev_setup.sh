#!/bin/bash
set -e

echo "🔧 Upgrading pip and installing dependencies..."
pip install --upgrade pip
pip install -r requirements.txt

echo "⚙️ Setting up local Django settings..."
cp examples/local_settings.example software_portal/local_settings.py
nano software_portal/local_settings.py  # Optional: comment this out if you pre-configure

echo "📁 Creating log directory..."
mkdir -p logs

echo "🚀 Testing initial Django run..."
python manage.py runserver &
sleep 5
pkill -f runserver
