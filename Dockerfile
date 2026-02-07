FROM python:3.11-slim

LABEL org.opencontainers.image.title="Data Analysis Stack"
LABEL org.opencontainers.image.description="Generic data analysis, cloud automation, and scripting runtime"
LABEL org.opencontainers.image.source="https://github.com/javakishore-veleti/Data-Analysis-Stack"

ENV DEBIAN_FRONTEND=noninteractive
ENV SERVER_MODE=true

# -----------------------------
# Base OS utilities
# -----------------------------
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    git \
    jq \
    unzip \
    bash \
    gnupg \
    lsb-release \
    apt-transport-https \
    && rm -rf /var/lib/apt/lists/*

# -----------------------------
# Node.js 20 + TypeScript
# -----------------------------
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g typescript ts-node

# -----------------------------
# Upgrade pip
# -----------------------------
RUN pip install --no-cache-dir --upgrade pip

# -----------------------------
# AWS CLI v2
# -----------------------------
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf aws awscliv2.zip

# -----------------------------
# Azure CLI
# -----------------------------
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash

# -----------------------------
# Google Cloud SDK
# -----------------------------
RUN curl https://packages.cloud.google.com/apt/doc/apt-key.gpg \
    | gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg \
    && echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" \
    > /etc/apt/sources.list.d/google-cloud-sdk.list \
    && apt-get update \
    && apt-get install -y google-cloud-cli \
    && rm -rf /var/lib/apt/lists/*

# -----------------------------
# Working directory
# -----------------------------
WORKDIR /workspace

# -----------------------------
# Entrypoint
# -----------------------------
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]
