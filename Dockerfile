FROM ubuntu:22.04
RUN apt-get update && apt-get install -y curl ca-certificates \
    && rm -rf /var/lib/apt/lists/*
RUN curl -L https://code.forgejo.org/forgejo/runner/releases/download/v12.7.0/forgejo-runner-12.7.0-linux-amd64 -o /usr/local/bin/forgejo-runner \
    && chmod +x /usr/local/bin/forgejo-runner
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
