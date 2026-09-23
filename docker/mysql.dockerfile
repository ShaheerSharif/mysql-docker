ARG MYSQL_VERSION="9"

FROM dhi.io/mysql:${MYSQL_VERSION}

CMD [ "mysqld" ]
