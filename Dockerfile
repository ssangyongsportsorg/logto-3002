FROM ghcr.io/logto-io/logto:edge

EXPOSE 3001

# Create directory for CA certificate
RUN mkdir -p /etc/ssl/certs/aiven

# Copy CA certificate into container
# 請將 ca.pem 放在與 Dockerfile 相同目錄
COPY ca.pem /etc/ssl/certs/aiven/

ENV TRUST_PROXY_HEADER=1
ENV PORT=3001
# 設定 SSL 憑證路徑
ENV NODE_EXTRA_CA_CERTS=/etc/ssl/certs/aiven/ca.pem

ENTRYPOINT ["sh", "-c", "npm run cli db seed -- --swe && npm start"]
