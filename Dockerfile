FROM ubuntu:14.04.2
label MAINTAINER felix@codemonauts.com
ENV HOME /root

#Install dependencies
RUN apt-get update && \
    apt-get -yq install \
    npm nodejs git python-pip
RUN npm config set strict-ssl false && npm install -g coffee-script
RUN pip install awscli

#Clone Anon-Git
COPY . /opt/anon

#Link node to nodejs
RUN ln -s /usr/bin/nodejs /usr/bin/node

WORKDIR /opt/anon
RUN npm install

CMD ./run.sh
