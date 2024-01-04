FROM ubuntu:20.04

RUN apt-get update -y && apt-get install -y debconf apt-utils dialog fuse3

ENV PATH=/app:$PATH

RUN mkdir -p /app/data

WORKDIR /app

COPY alist /app/

RUN chmod +x /app/alist

COPY rclone.tar.gz /tmp/

RUN cd /tmp/ && tar -zxvf rclone.tar.gz && rm rclone.tar.gz && mv rclone /usr/local/bin/ && chmod +x /usr/local/bin/rclone

COPY rclone.conf /app/

EXPOSE 5244

COPY entrypoint.sh /app/

RUN chmod +x /app/entrypoint.sh

CMD ["./entrypoint.sh"]
