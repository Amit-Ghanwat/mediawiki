# Use the official CentOS image as base
FROM redhat/ubi8:latest


# Install necessary packages
RUN dnf -y update && \
    dnf -y install wget tar && \
    dnf -y module reset php && \
    dnf -y module enable php:7.4 && \
    dnf -y install httpd php php-mysqlnd php-gd php-xml php-mbstring php-json php-intl php-apcu && \
    dnf clean all

RUN sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf && \
    mkdir /run/php-fpm/

# Download and extract MediaWiki
RUN cd /var/www/html && \
    wget https://releases.wikimedia.org/mediawiki/1.41/mediawiki-1.41.1.tar.gz && \
    tar -zxf mediawiki-1.41.1.tar.gz && \
    ln -s mediawiki-1.41.1/ mediawiki && \
    chown -R apache:apache /var/www/html/mediawiki-1.41.1 && \
    chown -R apache:apache /var/www/html/mediawiki

# Expose port 8080
EXPOSE 8080

# Start Apache
CMD php-fpm & httpd -D FOREGROUND
