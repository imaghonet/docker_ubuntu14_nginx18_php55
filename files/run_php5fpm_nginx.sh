#!/bin/bash
# @Author: oz
# @Date:   2016-04-14 16:37:57
# @Last Modified by:   omitrowski
# @Last Modified time: 2016-04-14 16:50:26

/usr/sbin/php5-fpm && /usr/sbin/nginx

while true; do
	if [ $(pidof php5-fpm | wc -w) -gt 0 ] && [ $(pidof nginx | wc -w) -gt 0  ]; then
		sleep 2
	else
		exit 1
	fi
done