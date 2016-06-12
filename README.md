Ubuntu 14.4 + Nginx 1.8 + PHP5.5
========================
for production environment
----------------------------------

* PHP opcode/cache: xcache
* Additional cache: php-memcache(d)
* PHP DB support for: MySQL, PostgreSQL and MongoDB
* Exposed ports: 80

Docker compose example
------------------
```
version: "2"

services:
  ubuntu14_nginx18_php55:
    image: imaghonet/ubuntu14_nginx18_php55
    links:
      - db
      - mc
    volumes:
      - your/path/to/nginx.conf:/etc/nginx/nginx.conf  
      - your/path/to/service.conf:/etc/nginx/conf.d/service.conf
      - your/path/to/project/root:/opt/project

    db:
      image: mongo
      volumes:
        - /tmp/db:/data/db

    mc:
      image: memcached
```
