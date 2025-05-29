# PHP 8.2 + Apache + PostgreSQL + Ioncube Docker Image

This is a custom Docker image for PHP 8.2 with Apache, PostgreSQL driver support, and Ioncube Loader installed.

## 🔧 Features

- PHP 8.2
- Apache Web Server
- PostgreSQL (`pdo_pgsql` and `pgsql`) extensions
- Ioncube Loader v12.1.3
- `socat` for port forwarding (e.g., PostgreSQL tunneling)
- Apache mod_rewrite enabled

## 🐳 Usage

### 1. Clone this repository

```bash
git clone https://github.com/yourusername/php82-apache-pgsql-ioncube.git
cd php82-apache-pgsql-ioncube
