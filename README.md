# Webtrees Docker

The web's leading on-line collaborative genealogy application.


## Minimal docker-compose file

```
version: '3'
services:
  db:
    image: mariadb:10
  site:
    image: histrio/webtrees:latest
    ports:
      - "8080:9000"
```
