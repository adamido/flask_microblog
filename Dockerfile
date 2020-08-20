# source: https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-xix-deployment-on-docker-containers

FROM ubuntu:18.04

WORKDIR /home/microblog

RUN apt-get update -y
RUN apt-get install -y make python3 python3-flask python3-pip ipython3

COPY . .

# not sure why these two are required!
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8

#
ENV FLASK_APP=microblog.py
ENV FLASK_ENV=development

RUN flask run

EXPOSE 5000
