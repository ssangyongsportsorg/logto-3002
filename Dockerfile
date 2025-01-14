FROM ghcr.io/logto-io/logto:edge

WORKDIR /app

# 创建证书目录
RUN mkdir -p /app/certs

EXPOSE 3001

ENV TRUST_PROXY_HEADER=1
ENV PORT=3001

# 使用多行命令来处理证书和启动应用
ENTRYPOINT ["sh", "-c", "\
    echo \"$AIVEN_CA_CERT\" > /app/certs/ca.pem && \
    npm run cli db seed -- --swe && \
    npm start \
"]