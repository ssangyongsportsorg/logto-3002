FROM ghcr.io/logto-io/logto:edge

# 不需要指定 WORKDIR，使用镜像默认的工作目录
# 创建证书目录在默认工作目录下
RUN mkdir -p ./certs

EXPOSE 3001

ENV TRUST_PROXY_HEADER=1
ENV PORT=3001

# 修改证书路径到当前目录
ENTRYPOINT ["sh", "-c", "\
    echo \"$AIVEN_CA_CERT\" > ./certs/ca.pem && \
    npm run cli db seed -- --swe && \
    npm start \
"]