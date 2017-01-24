FROM verdel/alpine-base:latest
MAINTAINER Vadim Aleksandrov <valeksandrov@me.com>

ENV MYSQL_USER=mysql \
    MYSQL_DATA_DIR=/var/lib/mysql \
    MYSQL_RUN_DIR=/run/mysqld \
    MYSQL_LOG_DIR=/var/log/mysql

# Install mysql-server and mysql-client
RUN apk --update add \
    bash \
    mysql \
    mysql-client \ 
    # Clean up
    && rm -rf \
    /usr/share/man \
    /tmp/* \
    /var/cache/apk/* \
    ${MYSQL_DATA_DIR}

# Copy init scripts
COPY rootfs /

# Export volumes directory
VOLUME ["${MYSQL_DATA_DIR}", "${MYSQL_RUN_DIR}"]

# Export ports
EXPOSE 3306/tcp
