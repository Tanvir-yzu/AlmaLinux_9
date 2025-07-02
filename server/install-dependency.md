1. Generate SSH Key
```
ssh-keygen -t rsa -b 4096
```

1. Update Dependency
```
sudo yum update -y
```

1. Install Nano Editor
```
sudo yum install -y nano
```

2. Install Git
```
sudo yum install git
```

3. Install Python3.8
```
sudo yum -y update
```
```
sudo yum -y groupinstall "Development Tools"
```
```
sudo yum -y install openssl-devel bzip2-devel libffi-devel
```
```
sudo yum -y install wget
```
```
wget https://www.python.org/ftp/python/3.8.3/Python-3.8.3.tgz
```
```
tar xvf Python-3.8.3.tgz
```
```
cd Python-3.8*/
```
```
./configure --enable-optimizations
```
```
sudo make altinstall
```

4. Install Postgresql-13
🔁 1. Remove all existing PGDG files and metadata
```
sudo dnf remove -y pgdg-redhat-repo
sudo rm -f /etc/yum.repos.d/pgdg-*.repo
sudo rm -f /etc/pki/rpm-gpg/*PGDG*
sudo dnf clean all
sudo rm -rf /var/cache/dnf

```
🔑 2. Manually import the correct GPG key for PostgreSQL 13
```
sudo rpm --import https://download.postgresql.org/pub/repos/yum/RPM-GPG-KEY-PGDG-13

```
📦 3. Reinstall the PGDG repo for EL9 (AlmaLinux 9)
```
sudo yum install sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-9-x86_64/pgdg-redhat-repo-latest.noarch.rpm
```
```
sudo yum list postgresql* -y
```
🚫 4. Disable the default PostgreSQL module
```
sudo dnf module disable postgresql
```
🔄 5. Clean and rebuild metadata cache
```
sudo dnf clean all
sudo dnf makecache --refresh

```
```
sudo dnf install -y postgresql13 postgresql13-server
```
```
sudo /usr/pgsql-13/bin/postgresql-13-setup initdb
```
```
sudo systemctl start postgresql-13.service
```
```
sudo systemctl enable postgresql-13.service
```
```
sudo systemctl status postgresql-13.service
```

5. Install Nginx
```
sudo yum install epel-release
```
```
sudo yum install nginx
```
```
sudo systemctl start nginx
```
```
sudo systemctl status nginx
```
