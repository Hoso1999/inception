# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hohayrap <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/12 17:51:17 by hohayrap          #+#    #+#              #
#    Updated: 2023/01/12 18:33:20 by hohayrap         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM        debian:buster

LABEL       "author"="hohayrap"

RUN         apt update &&\
            apt upgrade &&\
            apt install mariadb-server mariadb-client mariadb

COPY        ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY        ./tools/configure.sh /tmp/

RUN         chmod 766 /tmp/configure.sh; \
            chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE      3306

ENTRYPOINT  ["/tmp/configure.sh"]

CMD         ["mysqld"]
