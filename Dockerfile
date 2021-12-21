FROM alpine:3.15

RUN apk add --update ca-certificates python3 py3-pip py3-setuptools py3-wheel py3-grpcio curl

RUN adduser -s /bin/bash -D -u 1000 -h /srv/app app && \
  mkdir -p /srv/app && \
  chown -R app.app /srv/app
USER app
WORKDIR /srv/app

ADD --chown=1000:1000 . /srv/app/
RUN pip3 install --user --no-cache-dir -r /srv/app/requirements.txt


ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH=$PYTHONPATH:/srv/app
ENV PATH=$PATH:/srv/app/.local/bin
ENV ENVIRONMENT=production

ENTRYPOINT ["/srv/app/docker-entrypoint.sh"]
CMD ["run"]
