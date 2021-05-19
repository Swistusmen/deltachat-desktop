FROM node:14.16.0-buster

RUN apt-get update

RUN apt-get install -y --no-install-recommends git gcc g++ make python wget ca-certificates

RUN mkdir /usr/local/share/ca-certificates/cacert.org

RUN wget -P /usr/local/share/ca-certificates/cacert.org http://www.cacert.org/certs/root.crt http://www.cacert.org/certs/class3.crt

RUN update-ca-certificates

RUN git clone https://github.com/deltachat/deltachat-desktop.git

WORKDIR ./deltachat-desktop

RUN npm install

RUN npm run build