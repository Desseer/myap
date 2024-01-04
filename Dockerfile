FROM ubuntu:20.04

RUN apt-get update -y && apt-get install -y debconf apt-utils dialog fuse3

ENV PATH=/app:$PATH

RUN mkdir -p /app/data

WORKDIR /app

COPY alist /app/

RUN chmod +x /app/alist

EXPOSE 5244

COPY entrypoint.sh /app/

RUN chmod +x /app/entrypoint.sh

CMD ["./entrypoint.sh"]
