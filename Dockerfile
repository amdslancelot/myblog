FROM centos:latest
MAINTAINER Lans Hung
COPY ./buildmyblog ./
RUN  ./buildmyblog
COPY ./createdb ./
RUN  ./createdb
RUN  a=$(hostname -I); \
#     b=\"${a%%\ *}\"; \
     b=\"138.197.218.219\"; \
     echo $b; \
     sed -i "s|ALLOWED_HOSTS = \[\]|ALLOWED_HOSTS = \[\\$(echo $b)\]|g" /myblog/myblog/settings.py
COPY ./run_my_blog /usr/sbin/
RUN chmod 755 /usr/sbin/run_my_blog
CMD ["run_my_blog"]

EXPOSE 8000
