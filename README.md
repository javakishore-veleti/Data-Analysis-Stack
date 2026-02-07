# 🧰 Data Analysis Stack (Docker)

A **batteries-included, language-agnostic data analysis & automation container**.

This project builds a reusable Docker image that bundles **common data, cloud, and automation tooling** into a single container that can be used:

- Interactively (shell / exec)
- In CI pipelines
- For automation frameworks (n8n, Airflow, cron jobs)
- For local data analysis
- As a base image for other stacks

The image is **not tied to AI, n8n, or any specific framework**.

---

## 🚨 Required Setup (Before You Run Anything)

### 1️⃣ GitHub Secrets (MANDATORY)

Before running GitHub Actions, configure the following repository secrets:

| Secret Name | Description |
|------------|------------|
| `DOCKERHUB_USERNAME` | Your Docker Hub username |
| `DOCKERHUB_PASSWORD` | Docker Hub access token or password |

> ⚠️ **Recommendation:** Use a Docker Hub Access Token instead of your password.

📍 GitHub → Settings → Secrets and variables → Actions → New repository secret

---

## 🏗️ What This Image Contains

### Languages & Runtimes
- Python 3.11
- Node.js + npm
- TypeScript
- Java (OpenJDK)
- .NET SDK

### Cloud & DevOps CLIs
- AWS CLI
- Azure CLI
- Git
- curl
- jq

---

## 🐳 Image Execution Modes

### Default Mode (One-off execution)
```bash
docker run --rm vavkkishoreusa/data-analysis-stack:<tag> python --version
```

### Server Mode (Long-running container)
```bash
docker run -d \
  -e SERVER_MODE=true \
  --name data-stack \
  vavkkishoreusa/data-analysis-stack:<tag>
```

Internally runs:
```bash
sleep infinity
```

---

## 🏷️ Tagging Strategy

Images are tagged using UTC timestamps:

```
YYYY-MM-DD-HH-MM-SS
```

Example:
```
2026-02-07-23-17-52
```

No automatic `latest` tagging.

---

## 🚀 GitHub Actions

### Build & Publish (Timestamp Tag)
- Builds Docker image
- Tags with timestamp
- Pushes to Docker Hub
- Does NOT create `latest`

### Promote Existing Tag to `latest`
- Manual workflow
- Retags a known image
- No rebuild required

---

## 🧪 Local Testing

```bash
docker run --rm vavkkishoreusa/data-analysis-stack:<tag> python --version
docker run --rm vavkkishoreusa/data-analysis-stack:<tag> node --version
docker run -it --rm vavkkishoreusa/data-analysis-stack:<tag> bash
```

---

## 🧩 Using as Base Image

```dockerfile
FROM vavkkishoreusa/data-analysis-stack:<tag>
COPY scripts /scripts
CMD ["python", "/scripts/run.py"]
```

---

## 🤝 Contributions

PRs welcome:
- Tooling additions
- Image optimization
- Security hardening
- Multi-arch support

---
