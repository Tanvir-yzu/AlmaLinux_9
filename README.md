
# AlmaLinux 9 Server Administration Guide

## 📋 Overview

This repository contains comprehensive documentation for setting up and managing AlmaLinux 9 servers with various services including PostgreSQL, MySQL, Nginx, Odoo 14, and essential system administration tasks.

## 🚀 What's Included

This documentation covers everything you need to deploy and maintain a production-ready AlmaLinux 9 server environment:

### 🗄️ Database Management
- **PostgreSQL**: Complete setup, user management, database operations, and backup procedures
- **MySQL**: Installation, configuration, and administration commands

### 🌐 Web Server & Application Deployment
- **Nginx**: Installation, configuration, and SSL certificate setup
- **Odoo 14**: Complete setup guide and module development
- **uWSGI**: Configuration for Python web applications

### 🔧 System Administration
- **User Management**: Creating users, sudo access, permissions, and security
- **Dependency Installation**: Python 3.8, Git, PostgreSQL, Nginx, and development tools
- **AWS Configuration**: Cloud deployment and configuration
- **SSL Certificates**: Installation and management
- **Database Backup**: Automated backup solutions
- **Port Management**: Network configuration and security

### 🔐 Security & Version Control
- **SSH Key Management**: Project-specific SSH keys and secure Git operations
- **Git Operations**: Branch management, cloning, and repository operations

## 📚 Documentation Structure

```
├── 📁 config/           # Configuration files
│   ├── nginx.conf       # Nginx server configuration
│   ├── uwsgi.ini        # uWSGI application server config
│   └── uwsgi.service    # Systemd service file
├── 📁 database/         # Database documentation
│   ├── postgresql.md    # PostgreSQL administration
│   └── mysql.md         # MySQL administration
├── 📁 git/             # Version control
│   └── git.md          # Git commands and workflows
├── 📁 odoo-14/         # Odoo ERP system
│   ├── setup.md        # Installation and setup
│   └── module-development.md # Custom module development
├── 📁 server/          # Server administration
│   ├── centos.md       # User management and permissions
│   ├── install-dependency.md # System dependencies
│   ├── configure-aws.md # AWS cloud configuration
│   ├── install-ssl-certificate.md # SSL setup
│   ├── database_autobackup.md # Backup automation
│   └── port.md         # Network configuration
└── 📁 ssh/            # SSH security
    └── ssh.md         # SSH key management
```

## 🛠️ Quick Start

### Prerequisites
- AlmaLinux 9.x server
- Root or sudo access
- Basic command line knowledge

### Installation Steps

1. **Update System**
   ```bash
   sudo yum update -y
   ```

2. **Install Dependencies**
   Follow the guide in [`server/install-dependency.md`](server/install-dependency.md)

3. **Configure Database**
   - For PostgreSQL: [`database/postgresql.md`](database/postgresql.md)
   - For MySQL: [`database/mysql.md`](database/mysql.md)

4. **Setup Web Server**
   Configure Nginx using [`config/nginx.conf`](config/nginx.conf)

5. **Deploy Applications**
   Follow Odoo 14 setup in [`odoo-14/setup.md`](odoo-14/setup.md)

## 🔧 Key Features

### Database Management
- ✅ PostgreSQL 13 installation and configuration
- ✅ User creation and permission management
- ✅ Database backup and restore procedures
- ✅ Performance optimization tips

### Web Server Configuration
- ✅ Nginx reverse proxy setup
- ✅ SSL/TLS certificate installation
- ✅ uWSGI application server configuration
- ✅ Load balancing and caching

### Security Features
- ✅ SSH key-based authentication
- ✅ User permission management
- ✅ Firewall configuration
- ✅ SSL certificate automation

### Development Tools
- ✅ Python 3.8 development environment
- ✅ Git version control setup
- ✅ Odoo module development framework
- ✅ Database development tools

## 📖 Usage Examples

### Create PostgreSQL Database
```bash
sudo -u postgres psql
CREATE DATABASE myapp_db;
CREATE USER myapp_user WITH ENCRYPTED PASSWORD 'secure_password';
GRANT ALL PRIVILEGES ON DATABASE myapp_db TO myapp_user;
```

### Setup Nginx Virtual Host
```bash
sudo nano /etc/nginx/conf.d/myapp.conf
sudo nginx -t
sudo systemctl reload nginx
```

### Deploy Odoo Application
```bash
venv/bin/python project_name/odoo-bin.py -c project_name/server.conf
```

## 🤝 Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues for:
- Documentation improvements
- Additional configuration examples
- Bug fixes or corrections
- New feature documentation

## 📄 License

This project is licensed under the GNU General Public License v3.0 - see the [LICENSE](LICENSE) file for details.

## 🆘 Support

If you encounter any issues or need help:
1. Check the relevant documentation section
2. Review the troubleshooting guides in each module
3. Open an issue with detailed information about your problem

## 🔗 Related Resources

- [AlmaLinux Official Documentation](https://wiki.almalinux.org/)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [Nginx Documentation](https://nginx.org/en/docs/)
- [Odoo Documentation](https://www.odoo.com/documentation/)

---

**Last Updated**: 2025-03-21

**Maintained by**: Tanvir Islam

**Version**: 1.0.0
