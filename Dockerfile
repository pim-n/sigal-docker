FROM python:3.12-alpine

RUN apk add --no-cache \
    jpeg-dev \
    zlib-dev \
    libffi-dev \
    gcc \
    musl-dev \
    && pip install --no-cache-dir \
        sigal \
        pillow \
        jinja2-cli

WORKDIR /app

COPY entrypoint.sh /entrypoint.sh
COPY sigal.conf.template /app/sigal.conf.template

RUN chmod +x /entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]