FROM forgejo/runner:3.6.3
USER root
RUN apt-get update && apt-get install -y python3 python3-pip \
    libnss3 libnspr4 libatk1.0-0 libatk-bridge2.0-0 libcups2 libdrm2 \
    libxkbcommon0 libxcomposite1 libxdamage1 libxfixes3 libxrandr2 \
    libgbm1 libasound2 libpango-1.0-0 libcairo2 \
    && rm -rf /var/lib/apt/lists/*
RUN pip3 install --break-system-packages playwright && playwright install chromium --with-deps
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
USER forgejo-runner
ENTRYPOINT ["/entrypoint.sh"]
