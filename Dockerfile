FROM svhd/logto:latest

EXPOSE 3001

ENV TRUST_PROXY_HEADER=1
ENV PORT=3001

ENTRYPOINT ["sh", "-c", "npm run cli db seed -- --swe && npm start"]
