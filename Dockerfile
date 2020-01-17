FROM python:3.6
#RUN adduser -D testuser #alpine image
RUN useradd -m testuser -s /bin/bash

WORKDIR /home/testapp

COPY requirements.txt requirements.txt
RUN python -m venv venv
# for alpine image
#RUN apk add --no-cache --virtual .build-deps \   #
#    gcc \
#    python3-dev \
#    musl-dev \
#    postgresql-dev \
#    && venv/bin/pip install --no-cache-dir psycopg2 \
#    && apk del --no-cache .build-deps \
#    &&  venv/bin/pip install -r requirements.txt

RUN venv/bin/pip install psycopg2-binary \
    &&  venv/bin/pip install -r requirements.txt\
     && venv/bin/pip install gunicorn pymysql

COPY app app
COPY migrations migrations
COPY application.py config.py boot.sh ./
RUN chmod a+x boot.sh

ENV FLASK_APP application.py

RUN chown -R testuser:testuser ./
USER testuser

EXPOSE 5000
ENTRYPOINT ["./boot.sh"]
