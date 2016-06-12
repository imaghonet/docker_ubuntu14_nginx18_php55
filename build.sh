#!/bin/bash
# @Author: oz
# @Date:   2016-04-04 21:05:40
# @Last Modified by:   oz
# @Last Modified time: 2016-04-05 09:34:44

docker-compose down --rmi=local
docker-compose build --pull # && \
docker push imaghonet/ubuntu14_nginx18_php55:stable && \
docker tag imaghonet/ubuntu14_nginx18_php55:stable imaghonet/ubuntu14_nginx18_php55:latest # && \
docker push imaghonet/ubuntu14_nginx18_php55:latest