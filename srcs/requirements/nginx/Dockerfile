# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hohayrap <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/12 16:08:12 by hohayrap          #+#    #+#              #
#    Updated: 2023/01/12 18:38:00 by hohayrap         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM        debian:buster

LABEL       "author"="hohayrap"

RUN         apt update &&\
            apt upgrade &&\
            apt install -y nginx openssl

RUN         mkdir -p /etc/nginx/ssl

RUN         openssl req -newkey rsa:4096 -x509 -sha256 \
            -days 365 -nodes \
            -out /etc/nginx/ssl/hohayrap.pem \
            -keyout /etc/nginx/ssl/hohayrap.key \
            -subj "/C=AM/ST=Yerevan/L=Yerevan/O=42Yerevan/OU=IT/CN=localhost"

RUN         mkdir -p /run/nginx

COPY        ./conf/nginx.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT  ["nginx", "-g", "deamon off;"]
