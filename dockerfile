FROM jenkins/jenkins:lts

USER root

# install packages
RUN apt-get update && apt-get install -y curl docker.io zip

# install node 22
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash - && apt-get install -y nodejs

# enable corepack ONCE
RUN corepack enable

USER jenkins