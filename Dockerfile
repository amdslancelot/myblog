FROM centos:latest
MAINTAINER Lans Hung
COPY ./buildmyblog ./
RUN ./buildmyblog
COPY ./createdb ./
RUN ./createdb
RUN cd myblog; python manage.py runserver &
CMD ["/bin/bash"]
#CMD ["python", "manage.py", "runserver"]

