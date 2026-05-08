FROM jenkins/jenkins:lts

USER root

# install node
RUN apt-get update && apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs

# install pnpm
RUN npm install -g pnpm

# install docker CLI（可选）
RUN apt-get install -y docker.io

USER jenkins