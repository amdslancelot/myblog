FROM centos:latest
MAINTAINER Lans Hung
COPY ./buildmyblog ./
RUN  ./buildmyblog
COPY ./createdb ./
RUN  ./createdb
RUN  a=$(hostname -I); \
     b=\"${a%%\ *}\"; \
     echo $b; \
     sed -i "s|ALLOWED_HOSTS = \[\]|ALLOWED_HOSTS = \[\\$(echo $b)\]|g" /myblog/myblog/settings.py
CMD  cd myblog; python manage.py runserver 0.0.0.0:8000
