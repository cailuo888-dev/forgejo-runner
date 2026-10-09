FROM ubuntu:22.04
RUN apt-get update && apt-get install -y curl python3 python3-pip \
    libnss3 libnspr4 libatk1.0-0 libatk-bridge2.0-0 libcups2 libdrm2 \
    libxkbcommon0 libxcomposite1 libxdamage1 libxfixes3 libxrandr2 \
    libgbm1 libasound2 libpango-1.0-0 libcairo2 \
    && rm -rf /var/lib/apt/lists/*
RUN curl -L https://code.forgejo.org/forgejo/runner/releases/download/v12.7.0/forgejo-runner-12.7.0-linux-amd64 -o /usr/local/bin/forgejo-runner \
    && chmod +x /usr/local/bin/forgejo-runner
RUN pip3 install --break-system-packages playwright && playwright install chromium
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
