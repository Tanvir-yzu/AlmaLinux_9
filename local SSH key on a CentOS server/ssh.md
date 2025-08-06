<div align="center">

# 🔐 SSH Key Authentication Setup
### *Secure Passwordless Login for CentOS/AlmaLinux Servers*

![SSH](https://img.shields.io/badge/SSH-Secure-brightgreen?style=for-the-badge&logo=openssh&logoColor=white)
![CentOS](https://img.shields.io/badge/CentOS-Compatible-blue?style=for-the-badge&logo=centos&logoColor=white)
![AlmaLinux](https://img.shields.io/badge/AlmaLinux-Supported-orange?style=for-the-badge&logo=almalinux&logoColor=white)
![Security](https://img.shields.io/badge/Security-Enhanced-red?style=for-the-badge&logo=shield&logoColor=white)

</div>

---

## 📋 Table of Contents

<details>
<summary>🗂️ Click to expand navigation</summary>

- [🎯 Overview](#-overview)
- [📋 Prerequisites](#-prerequisites)
- [🔐 Step 1: Generate SSH Key](#-step-1-generate-ssh-key-local-machine)
- [📤 Step 2: Copy Public Key to Server](#-step-2-copy-public-key-to-centos-server)
- [🔧 Step 3: Configure SSH Daemon](#-step-3-configure-ssh-daemon-centos-server)
- [✅ Step 4: Test Connection](#-step-4-test-passwordless-ssh-login)
- [🛡️ Advanced Security Configuration](#️-advanced-security-configuration)
- [🔍 Troubleshooting Guide](#-troubleshooting-guide)
- [💡 Best Practices](#-best-practices)
- [📊 Monitoring & Maintenance](#-monitoring--maintenance)

</details>

---

## 🎯 Overview

This guide provides **step-by-step instructions** for setting up **SSH key authentication** on CentOS/AlmaLinux servers, enabling secure passwordless login. SSH key authentication is **more secure** than password authentication and is essential for production environments.

### 🌟 Benefits of SSH Key Authentication:
- 🔒 **Enhanced Security** - No password brute-force attacks
- ⚡ **Faster Login** - Instant authentication without typing passwords
- 🤖 **Automation Ready** - Perfect for scripts and CI/CD pipelines
- 🔐 **Multi-Factor Ready** - Can be combined with additional security layers

---

## 📋 Prerequisites

<div align="center">

| Requirement | Local Machine | CentOS Server |
|-------------|---------------|---------------|
| **OS Support** | ✅ Windows/Linux/macOS | ✅ CentOS 7/8/9, AlmaLinux 8/9 |
| **SSH Client** | ✅ OpenSSH/PuTTY | ✅ OpenSSH Server |
| **Access Level** | ✅ User account | ✅ User account with sudo |
| **Network** | ✅ Internet/LAN access | ✅ SSH port (22) accessible |

</div>

---

## 🔐 Step 1: Generate SSH Key (Local Machine)

<details>
<summary>🔑 Key Generation Options</summary>

### **Option A: RSA Key (Recommended for Compatibility)**

```bash
# Navigate to SSH directory
cd ~/.ssh

# Generate RSA 4096-bit key
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

### **Option B: Ed25519 Key (Modern & Secure)**

```bash
# Navigate to SSH directory
cd ~/.ssh

# Generate Ed25519 key (more secure, smaller)
ssh-keygen -t ed25519 -C "your_email@example.com"
```

</details>

### 🎯 **Recommended: RSA 4096-bit Key**

```bash
# Create .ssh directory if it doesn't exist
mkdir -p ~/.ssh
cd ~/.ssh

# Generate SSH key pair
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

<div align="center">

### 📝 **Key Generation Prompts**

| Prompt | Recommendation | Example |
|--------|----------------|---------|
| **File location** | Press Enter (default) | `/home/user/.ssh/id_rsa` |
| **Passphrase** | Empty for automation, or strong passphrase | `MySecurePassphrase123!` |
| **Confirm passphrase** | Repeat above | `MySecurePassphrase123!` |

</div>

### ✅ **Verification**

```bash
# Check generated files
ls -la ~/.ssh/

# Expected output:
# -rw------- 1 user user 3243 date id_rsa      (private key)
# -rw-r--r-- 1 user user  743 date id_rsa.pub  (public key)
```

---

## 📤 Step 2: Copy Public Key to CentOS Server

<details>
<summary>🚀 Multiple Methods Available</summary>

### **Method 1: ssh-copy-id (Easiest)**
```bash
ssh-copy-id user@centos-server-ip
```

### **Method 2: Manual Copy via SSH**
```bash
cat ~/.ssh/id_rsa.pub | ssh user@centos-server-ip "mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys"
```

### **Method 3: SCP Transfer**
```bash
scp ~/.ssh/id_rsa.pub user@centos-server-ip:~/
ssh user@centos-server-ip
cat ~/id_rsa.pub >> ~/.ssh/authorized_keys
rm ~/id_rsa.pub
```

</details>

### 🎯 **Recommended Method: ssh-copy-id**

```bash
# Copy public key to server (will prompt for password)
ssh-copy-id user@centos-server-ip

# For custom SSH port
ssh-copy-id -p 2222 user@centos-server-ip

# For specific key file
ssh-copy-id -i ~/.ssh/id_rsa.pub user@centos-server-ip
```

### 🔧 **Manual Method (if ssh-copy-id unavailable)**

```bash
# Connect to server
ssh user@centos-server-ip

# Create .ssh directory with proper permissions
mkdir -p ~/.ssh
chmod 700 ~/.ssh

# Edit authorized_keys file
nano ~/.ssh/authorized_keys
```

**📋 Paste your public key content:**
```bash
# Get public key content from local machine
cat ~/.ssh/id_rsa.pub
```

**🔒 Set proper permissions:**
```bash
chmod 600 ~/.ssh/authorized_keys
exit
```

---

## 🔧 Step 3: Configure SSH Daemon (CentOS Server)

### 🛡️ **Secure SSH Configuration**

```bash
# Backup original configuration
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.backup

# Edit SSH configuration
sudo nano /etc/ssh/sshd_config
```

### 📝 **Essential SSH Settings**

<details>
<summary>🔧 Complete SSH Configuration</summary>

```ini
# SSH Server Configuration - Secure Setup

# Basic Settings
Port 22
Protocol 2
HostKey /etc/ssh/ssh_host_rsa_key
HostKey /etc/ssh/ssh_host_ecdsa_key
HostKey /etc/ssh/ssh_host_ed25519_key

# Logging
SyslogFacility AUTHPRIV
LogLevel INFO

# Authentication Settings
LoginGraceTime 60
PermitRootLogin no
StrictModes yes
MaxAuthTries 3
MaxSessions 2

# Public Key Authentication
PubkeyAuthentication yes
AuthorizedKeysFile .ssh/authorized_keys

# Disable Password Authentication (after key setup)
PasswordAuthentication no
PermitEmptyPasswords no
ChallengeResponseAuthentication no

# Connection Settings
ClientAliveInterval 300
ClientAliveCountMax 2
TCPKeepAlive yes

# Security Features
AllowAgentForwarding yes
AllowTcpForwarding yes
GatewayPorts no
X11Forwarding no
PermitTTY yes
PrintMotd yes
PrintLastLog yes
UsePAM yes

# Subsystem
Subsystem sftp /usr/libexec/openssh/sftp-server
```

</details>

### 🎯 **Minimum Required Changes**

```ini
# Enable public key authentication
PubkeyAuthentication yes
AuthorizedKeysFile .ssh/authorized_keys

# Disable password authentication (AFTER testing key login)
PasswordAuthentication no
ChallengeResponseAuthentication no

# Security improvements
PermitRootLogin no
MaxAuthTries 3
```

### 🔄 **Apply Configuration**

```bash
# Test SSH configuration syntax
sudo sshd -t

# If test passes, restart SSH service
sudo systemctl restart sshd

# Verify service is running
sudo systemctl status sshd
```

---

## ✅ Step 4: Test Passwordless SSH Login

### 🧪 **Connection Testing**

<div align="center">

| Test Type | Command | Expected Result |
|-----------|---------|-----------------|
| **Basic Test** | `ssh user@centos-server-ip` | ✅ Login without password |
| **Verbose Test** | `ssh -v user@centos-server-ip` | ✅ Debug information |
| **Specific Key** | `ssh -i ~/.ssh/id_rsa user@server-ip` | ✅ Key-specific login |

</div>

### 🎯 **Primary Test**

```bash
# Test passwordless login
ssh user@centos-server-ip

# Expected: Immediate login without password prompt
```

### 🔍 **Verbose Testing (for troubleshooting)**

```bash
# Detailed connection information
ssh -v user@centos-server-ip

# Look for these success indicators:
# "Offering public key: /home/user/.ssh/id_rsa RSA SHA256:..."
# "Server accepts key: pkalg rsa-sha2-512 blen 279"
# "Authentication succeeded (publickey)"
```

---

## 🛡️ Advanced Security Configuration

<details>
<summary>🔐 Enhanced Security Measures</summary>

### **🚫 Fail2Ban Protection**

```bash
# Install Fail2Ban
sudo dnf install epel-release -y
sudo dnf install fail2ban -y

# Configure SSH protection
sudo tee /etc/fail2ban/jail.local > /dev/null << 'EOF'
[DEFAULT]
bantime = 3600
findtime = 600
maxretry = 3

[sshd]
enabled = true
port = ssh
filter = sshd
logpath = /var/log/secure
maxretry = 3
bantime = 3600
EOF

# Start Fail2Ban
sudo systemctl enable fail2ban
sudo systemctl start fail2ban
```

### **🔥 Firewall Configuration**

```bash
# Configure firewalld
sudo firewall-cmd --permanent --add-service=ssh
sudo firewall-cmd --reload

# For custom SSH port
sudo firewall-cmd --permanent --add-port=2222/tcp
sudo firewall-cmd --reload
```

### **🔑 SSH Key Restrictions**

Add restrictions to `~/.ssh/authorized_keys`:

```bash
# Restrict by source IP
from="192.168.1.100" ssh-rsa AAAAB3NzaC1yc2E...

# Restrict commands
command="/usr/local/bin/backup.sh" ssh-rsa AAAAB3NzaC1yc2E...

# No port forwarding
no-port-forwarding,no-X11-forwarding ssh-rsa AAAAB3NzaC1yc2E...
```

</details>

---

## 🔍 Troubleshooting Guide

<details>
<summary>🚨 Common Issues & Solutions</summary>

### **❌ Permission Denied (publickey)**

**Possible Causes:**
- Incorrect file permissions
- Public key not in authorized_keys
- SSH daemon configuration issues

**Solutions:**
```bash
# Check file permissions on server
ls -la ~/.ssh/
# Should show: drwx------ for .ssh, -rw------- for authorized_keys

# Fix permissions
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys

# Verify key content
cat ~/.ssh/authorized_keys
```

### **🔐 Connection Timeout**

**Check Network & Service:**
```bash
# Test connectivity
ping centos-server-ip

# Check SSH port
nmap -p 22 centos-server-ip

# Verify SSH service
sudo systemctl status sshd
```

### **🔑 Wrong Key Being Used**

**Force Specific Key:**
```bash
# Use specific key file
ssh -i ~/.ssh/id_rsa user@centos-server-ip

# Disable SSH agent
ssh -o IdentitiesOnly=yes -i ~/.ssh/id_rsa user@centos-server-ip
```

</details>

### 🔧 **Debug Commands**

```bash
# Verbose SSH connection
ssh -vvv user@centos-server-ip

# Check SSH configuration
sudo sshd -T

# Monitor SSH logs
sudo tail -f /var/log/secure

# Test SSH config syntax
sudo sshd -t
```

---

## 💡 Best Practices

<div align="center">

### 🏆 **Security Best Practices**

| Practice | Description | Priority |
|----------|-------------|----------|
| **🔐 Strong Keys** | Use RSA 4096-bit or Ed25519 | 🔴 Critical |
| **🚫 Disable Root** | `PermitRootLogin no` | 🔴 Critical |
| **🔑 Key Rotation** | Rotate keys every 6-12 months | 🟡 Important |
| **📊 Monitor Logs** | Regular log review | 🟡 Important |
| **🛡️ Fail2Ban** | Automated intrusion prevention | 🟢 Recommended |

</div>

### 📋 **Implementation Checklist**

- [ ] ✅ SSH keys generated with strong encryption
- [ ] ✅ Public key copied to server successfully
- [ ] ✅ SSH daemon configured securely
- [ ] ✅ Password authentication disabled
- [ ] ✅ Root login disabled
- [ ] ✅ Firewall configured for SSH access
- [ ] ✅ Fail2Ban installed and configured
- [ ] ✅ Connection tested and working
- [ ] ✅ Backup access method available

---

## 📊 Monitoring & Maintenance

<details>
<summary>📈 Monitoring Scripts & Commands</summary>

### **📊 SSH Status Monitor**

```bash
#!/bin/bash
# ssh_status.sh

echo "=== SSH Server Status ==="
sudo systemctl status sshd --no-pager

echo -e "\n=== Active SSH Sessions ==="
who | grep pts

echo -e "\n=== Recent Logins ==="
last | head -5

echo -e "\n=== Failed Attempts Today ==="
sudo grep "Failed password" /var/log/secure | grep "$(date '+%b %d')" | wc -l

echo -e "\n=== Fail2Ban Status ==="
sudo fail2ban-client status sshd 2>/dev/null || echo "Fail2Ban not configured"
```

### **🔄 Key Rotation Script**

```bash
#!/bin/bash
# rotate_ssh_keys.sh

echo "Starting SSH key rotation..."

# Generate new key
ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa_new -C "$(whoami)@$(hostname)-$(date +%Y%m%d)"

# Copy new key to servers
for server in server1 server2 server3; do
    echo "Updating key on $server..."
    ssh-copy-id -i ~/.ssh/id_rsa_new.pub user@$server
done

echo "Key rotation completed. Test new keys before removing old ones."
```

</details>

---

<div align="center">

## 🎉 SSH Key Authentication Complete!

Your CentOS/AlmaLinux server is now configured for secure, passwordless SSH access.

### 🔗 **Quick Reference Commands**

```bash
# Connect to server
ssh user@centos-server-ip

# Copy files securely
scp file.txt user@centos-server-ip:~/

# Execute remote commands
ssh user@centos-server-ip "sudo systemctl status httpd"
```

---

**🔐 Security Reminder:** Regularly monitor your SSH logs and keep your systems updated!

![Success](https://img.shields.io/badge/Setup-Complete-brightgreen?style=for-the-badge)
![Secure](https://img.shields.io/badge/Connection-Secure-blue?style=for-the-badge)

</div>

---

## 📚 Additional Resources

- 📖 [OpenSSH Official Documentation](https://www.openssh.com/)
- 🛡️ [SSH Security Best Practices](https://www.ssh.com/academy/ssh/security)
- 🔧 [CentOS SSH Configuration Guide](https://wiki.centos.org/HowTos/Network/SecuringSSH)
- 🔐 [SSH Key Management](https://www.ssh.com/academy/ssh/key-management)

---

## 🆘 Need Help?

If you encounter issues or need assistance with:
- 🌐 **Custom SSH ports** or cloud provider configurations
- 🔒 **Advanced security setups** with multi-factor authentication
- 🤖 **Automation scripts** for multiple servers
- 🔧 **Troubleshooting** connection problems

Feel free to refer to the troubleshooting section or consult the additional resources above.

---

*Last updated: $(date '+%Y-%m-%d %H:%M:%S')*