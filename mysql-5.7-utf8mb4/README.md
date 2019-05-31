# Usage

```bash
docker run -d \
    --name mysql \
    -p 3306:3306 \
    -v ~/docker/mysql/data:/var/lib/mysql
    -e MYSQL_ROOT_PASSWORD=123456 \
    --innodb-buffer-pool-size=1G
    mysql:5.7-utf8mb4\
```

```yaml
version: "3"
services:
  mysql:
    image: mysql:5.7-utf8mb4
    environment:
      MYSQL_ROOT_PASSWORD: 123456
    command:
      - --innodb-buffer-pool-size=1G
    ports:
      - "3306:3306"
    volumes:
      - ~/docker/mysql/data:/var/lib/mysql
    networks:
      - app_host

networks:
  app_host:
    external: true
```