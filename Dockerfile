FROM ubuntu:22.04

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        fortune-mod \
        cowsay \
        netcat-openbsd \
        dos2unix && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY wisecow.sh /app/wisecow.sh

RUN dos2unix /app/wisecow.sh && chmod +x /app/wisecow.sh

RUN useradd -m appuser
USER appuser

EXPOSE 4499

CMD ["/app/wisecow.sh"]
