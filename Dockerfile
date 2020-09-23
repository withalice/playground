FROM python:3.8.5-slim-buster

RUN mkdir /app
WORKDIR /app

ADD . /app/

ENV PYTHONUNBUFFERED 1
ENV LANG C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive 

ENV PORT=8888

RUN pip3 install --upgrade pip 
RUN pip3 install pipenv

RUN pipenv install --skip-lock --system

EXPOSE 8888
CMD gunicorn wsgi:application --bind 0.0.0.0:$PORT