FROM node:22

ENV CI=true

RUN corepack enable

WORKDIR /app

COPY . .

CMD ["bash", "ci.sh"]