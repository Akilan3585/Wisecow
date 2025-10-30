FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y fortune-mod cowsay netcat-openbsd dos2unix && \
    apt-get clean

WORKDIR /app

COPY wisecow.sh /app/wisecow.sh

RUN dos2unix /app/wisecow.sh && chmod +x /app/wisecow.sh

EXPOSE 4499

ENV PATH="/usr/games:${PATH}"

CMD ["/app/wisecow.sh"]