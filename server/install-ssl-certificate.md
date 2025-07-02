
# 🔒 SSL Certificate Installation Guide

## 📋 Overview
This guide provides step-by-step instructions for installing SSL/TLS certificates on AlmaLinux 9 using Let's Encrypt and Certbot. SSL certificates ensure secure HTTPS connections for your web applications.

## 🎯 Prerequisites
- AlmaLinux 9.x server
- Nginx web server installed and running
- Domain name pointing to your server
- Root or sudo access
- Ports 80 and 443 open in firewall

## 🚀 Quick Start

### Method 1: Certbot via Snap (Recommended)

#### 📦 Step 1: Install Snapd Package Manager
```bash
sudo yum install snapd
```

#### ⚡ Step 2: Enable and Start Snapd Service
```bash
sudo systemctl enable --now snapd.socket
```

#### 🔗 Step 3: Create Snap Symbolic Link
```bash
sudo ln -s /var/lib/snapd/snap /snap
```

**⏳ Wait**: Allow a few minutes for snap to initialize properly.

#### 🔄 Step 4: Install and Update Snap Core
```bash
sudo snap install core
```

```bash
sudo snap refresh core
```

#### 🛠️ Step 5: Install Certbot
```bash
sudo snap install --classic certbot
```

#### 🔗 Step 6: Create Certbot Symbolic Link
```bash
sudo ln -s /snap/bin/certbot /usr/bin/certbot
```

#### 🎉 Step 7: Obtain SSL Certificate
```bash
sudo certbot --nginx
```

**📝 Interactive Process**: Follow the prompts to:
- Enter your email address
- Agree to terms of service
- Select domains for certificate
- Choose redirect option (recommended: redirect HTTP to HTTPS)

---

## 🔧 Alternative Installation Methods

### Method 2: Certbot via EPEL Repository

```bash
# Install EPEL repository
sudo yum install epel-release

# Install Certbot and Nginx plugin
sudo yum install certbot python3-certbot-nginx

# Obtain certificate
sudo certbot --nginx
```

### Method 3: Manual Certificate Installation

```bash
# Generate certificate only (manual DNS verification)
sudo certbot certonly --manual -d yourdomain.com -d www.yourdomain.com

# Manual Nginx configuration required
```

---

## ⚙️ Post-Installation Configuration

### Verify Certificate Installation
```bash
# Check certificate status
sudo certbot certificates

# Test certificate renewal
sudo certbot renew --dry-run

# Check Nginx configuration
sudo nginx -t
```

### Automatic Renewal Setup
```bash
# Check if renewal timer is active
sudo systemctl status snap.certbot.renew.timer

# Enable automatic renewal (if not already active)
sudo systemctl enable snap.certbot.renew.timer
sudo systemctl start snap.certbot.renew.timer
```

### Manual Renewal
```bash
# Renew all certificates
sudo certbot renew

# Renew specific certificate
sudo certbot renew --cert-name yourdomain.com

# Force renewal (for testing)
sudo certbot renew --force-renewal
```

---

## 🔥 Firewall Configuration

### Configure Firewall for HTTPS
```bash
# Allow HTTP and HTTPS traffic
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https

# Reload firewall rules
sudo firewall-cmd --reload

# Verify firewall status
sudo firewall-cmd --list-all
```

### SELinux Configuration (if applicable)
```bash
# Allow Nginx to make network connections
sudo setsebool -P httpd_can_network_connect 1

# Check SELinux status
sudo getenforce
```

---

## 📋 Nginx SSL Configuration Example

### Sample Nginx Virtual Host with SSL
```nginx
server {
    listen 80;
    server_name yourdomain.com www.yourdomain.com;
    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl http2;
    server_name yourdomain.com www.yourdomain.com;

    # SSL Certificate Configuration
    ssl_certificate /etc/letsencrypt/live/yourdomain.com/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/yourdomain.com/privkey.pem;
    
    # SSL Security Settings
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_ciphers ECDHE-RSA-AES256-GCM-SHA512:DHE-RSA-AES256-GCM-SHA512:ECDHE-RSA-AES256-GCM-SHA384:DHE-RSA-AES256-GCM-SHA384;
    ssl_prefer_server_ciphers off;
    ssl_session_cache shared:SSL:10m;
    ssl_session_timeout 10m;
    
    # Security Headers
    add_header Strict-Transport-Security "max-age=31536000; includeSubDomains" always;
    add_header X-Frame-Options DENY;
    add_header X-Content-Type-Options nosniff;
    add_header X-XSS-Protection "1; mode=block";
    
    # Document Root
    root /var/www/html;
    index index.html index.htm index.php;
    
    location / {
        try_files $uri $uri/ =404;
    }
}
```

---

## ✅ Verification and Testing

### Test SSL Certificate
```bash
# Test SSL connection
openssl s_client -connect yourdomain.com:443 -servername yourdomain.com

# Check certificate expiration
echo | openssl s_client -servername yourdomain.com -connect yourdomain.com:443 2>/dev/null | openssl x509 -noout -dates

# Online SSL test
# Visit: https://www.ssllabs.com/ssltest/
```

### Browser Testing
1. Navigate to `https://yourdomain.com`
2. Check for green padlock icon
3. Verify certificate details in browser
4. Test HTTP to HTTPS redirect

---

## 🚨 Troubleshooting

### Common Issues and Solutions

#### Certificate Generation Fails
```bash
# Check domain DNS resolution
nslookup yourdomain.com

# Verify Nginx is running
sudo systemctl status nginx

# Check Nginx configuration
sudo nginx -t

# Review Certbot logs
sudo tail -f /var/log/letsencrypt/letsencrypt.log
```

#### Renewal Issues
```bash
# Check renewal timer status
sudo systemctl status snap.certbot.renew.timer

# Manual renewal test
sudo certbot renew --dry-run

# Check certificate expiration
sudo certbot certificates
```

#### Nginx SSL Errors
```bash
# Check Nginx error logs
sudo tail -f /var/log/nginx/error.log

# Verify SSL certificate files exist
sudo ls -la /etc/letsencrypt/live/yourdomain.com/

# Test Nginx configuration
sudo nginx -t
```

### Error Messages and Solutions

| Error | Solution |
|-------|----------|
| `Domain validation failed` | Check DNS records and firewall |
| `Certificate already exists` | Use `--force-renewal` flag |
| `Nginx test failed` | Fix Nginx configuration syntax |
| `Permission denied` | Check file permissions and SELinux |

---

## 🔄 Certificate Management

### List All Certificates
```bash
sudo certbot certificates
```

### Revoke Certificate
```bash
sudo certbot revoke --cert-path /etc/letsencrypt/live/yourdomain.com/cert.pem
```

### Delete Certificate
```bash
sudo certbot delete --cert-name yourdomain.com
```

### Expand Certificate (Add Domains)
```bash
sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com -d subdomain.yourdomain.com
```

---

## 📊 Monitoring and Maintenance

### Certificate Expiration Monitoring
```bash
# Create monitoring script
cat > /usr/local/bin/ssl-check.sh << 'EOF'
#!/bin/bash
DOMAIN="yourdomain.com"
EXP_DATE=$(echo | openssl s_client -servername $DOMAIN -connect $DOMAIN:443 2>/dev/null | openssl x509 -noout -enddate | cut -d= -f2)
EXP_EPOCH=$(date -d "$EXP_DATE" +%s)
CURR_EPOCH=$(date +%s)
DAYS_LEFT=$(( ($EXP_EPOCH - $CURR_EPOCH) / 86400 ))

echo "SSL certificate for $DOMAIN expires in $DAYS_LEFT days"
if [ $DAYS_LEFT -lt 30 ]; then
    echo "WARNING: Certificate expires soon!"
fi
EOF

# Make script executable
sudo chmod +x /usr/local/bin/ssl-check.sh

# Run the script
/usr/local/bin/ssl-check.sh
```

### Automated Monitoring with Cron
```bash
# Add to crontab for daily checks
echo "0 6 * * * /usr/local/bin/ssl-check.sh" | sudo crontab -
```

---

## 🛡️ Security Best Practices

### SSL/TLS Configuration Hardening
1. **Use Strong Ciphers**: Disable weak encryption algorithms
2. **Enable HSTS**: Force HTTPS connections
3. **Implement OCSP Stapling**: Improve certificate validation
4. **Regular Updates**: Keep Certbot and Nginx updated
5. **Monitor Expiration**: Set up alerts for certificate renewal

### Additional Security Headers
```nginx
# Add to Nginx server block
add_header Content-Security-Policy "default-src 'self'; script-src 'self' 'unsafe-inline'; style-src 'self' 'unsafe-inline';";
add_header Referrer-Policy "strict-origin-when-cross-origin";
add_header Permissions-Policy "geolocation=(), microphone=(), camera=()";
```

---

## 📚 Related Documentation

- [Nginx Configuration](../config/nginx.conf)
- [Firewall Configuration](port.md)
- [Server Setup](install-dependency.md)
- [Database Security](../database/postgresql.md)

---

## 🔗 External Resources

- [Let's Encrypt Documentation](https://letsencrypt.org/docs/)
- [Certbot User Guide](https://certbot.eff.org/docs/)
- [SSL Labs SSL Test](https://www.ssllabs.com/ssltest/)
- [Mozilla SSL Configuration Generator](https://ssl-config.mozilla.org/)

---

**📅 Last Updated**: $(date +'%Y-%m-%d')

**🏷️ Version**: 2.0.0

**👥 Maintainer**: Security Team

**⚠️ Note**: Certificates expire every 90 days. Ensure automatic renewal is properly configured.

        