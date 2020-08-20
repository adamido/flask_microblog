# source: https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-xix-deployment-on-docker-containers

FROM ubuntu:18.04

WORKDIR /home/microblog

RUN apt-get update -y
RUN apt-get install -y make python3 python3-flask python3-pip ipython3

COPY . .
