FROM python:3.11-slim

LABEL org.opencontainers.image.title="Data Analysis Stack"
LABEL org.opencontainers.image.description="Generic data analysis and automation runtime"
LABEL org.opencontainers.image.source="https://github.com/javakishore-veleti/Data-Analysis-Stack"

ENV DEBIAN_FRONTEND=noninteractive

# Install base OS tools
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    git \
    jq \
    unzip \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js 20 LTS
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
 && apt-get install -y nodejs

# Upgrade pip
RUN pip install --no-cache-dir --upgrade pip

# Create a neutral working directory
WORKDIR /workspace

# Keep container alive for interactive / exec use
CMD ["sleep", "infinity"]
