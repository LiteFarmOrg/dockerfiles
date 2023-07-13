FROM node:18.16.1-slim

RUN set e; \
    apt-get update && \
    apt-get install -y --no-install-recommends \
    chromium=114.* && \
    rm -rf /var/lib/apt/lists/*
