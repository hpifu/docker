FROM redis:5.0.5-alpine
COPY hop_redis_cluster /bin
RUN mkdir -p /var/redis_cluster_for_test
WORKDIR /var/redis_cluster_for_test
CMD [ "hop_redis_cluster", "start" ]

EXPOSE 7000
EXPOSE 7001
EXPOSE 7002
EXPOSE 7003
EXPOSE 7004
EXPOSE 7005
