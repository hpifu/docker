# mysql

## 数据库初始化

将初始化脚本放到 `/docker-entrypoint-initdb.d` 目录中，数据库启动后将自动执行，
支持 `.sh`, `.sql`, `.sql.gz`

```
COPY init.sql /docker-entrypoint-initdb.d/
```

## 链接

- github: <https://github.com/docker-library/docs/tree/master/mysql#initializing-a-fresh-instance>
- docker hub: <https://hub.docker.com/_/mysql>