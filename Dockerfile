
FROM python:3.4

RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi
RUN pip install --upgrade pip
RUN pip install Flask==0.10.1 requests==2.5.1 redis==2.10.3
RUN pip install https://github.com/unbit/uwsgi/archive/uwsgi-2.0.zip#egg=uwsgi
WORKDIR /app
COPY app /app
COPY cmd.sh /

EXPOSE 9090 9191 5000
USER uwsgi

CMD ["/cmd.sh"]
