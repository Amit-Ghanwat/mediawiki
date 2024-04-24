# Use the official CentOS image as base
FROM centos:8

# Install necessary packages
RUN dnf -y update && \
    dnf -y install wget tar && \
    dnf -y install mariadb-server mariadb && \
    dnf clean all

# Copy the SQL script for initialization
COPY init.sql /docker-entrypoint-initdb.d/init.sql

# Expose port 3306
EXPOSE 3306

# Start Apache
CMD ["mariadb"]