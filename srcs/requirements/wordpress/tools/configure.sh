#!/bin/bash

if ! grep -q $MYSQL_DATABASE "./wordpress/wp-config.php";
then
	sleep 10;

	wp core install --allow-root --path=./wordpress/ \
	   	--url=$DOMAIN_NAME \
		--title=$WP_TITLE \
		--admin_user=$WP_ADMIN_NAME \
		--admin_password=$WP_ADMIN_PASSWORD \
		--admin_email=$WP_ADMIN_EMAIL;

	wp user create --allow-root --path=./wordpress/ \
		$WP_USER_NAME \
		$WP_USER_EMAIL \
		--user_pass=$WP_USER_PASSWORD;

	wp theme activate twentytwentytwo --allow-root --path=./wordpress/;
fi

exec "$@";
