# SAMPLE DYNAMIC AND STATIC LOAD BALANCE

This repository demonstrates the implementation of static/manual load balancing on Nginx alongside dynamic load balancing scaled using docker-compose.

It features two Docker configuration approaches, making it ideal for learning:
1. **Ubuntu-based Image (`Dockerfile`):** Installs Node.js manually inside an `ubuntu:24.04` container.
2. **Official Node Image (`Dockerfile.nodejs`):** Uses a pre-packaged lightweight runtime container (`node:18-slim`).

# Requirements
- Docker
- Docker Compose

# Deployment

### Option A: Using the Ubuntu-based Stack (Default)
1. Clone this repository.
2. Modify the `NODENUMBER` environment variables in `docker-compose.yml` to identify the containers.
3. Build and launch the services:
   ```bash
   docker-compose up -d
   ```
4. Scale the dynamic app service:
   ```bash
   docker-compose up -d --scale auto-app=[num_scale]
   ```

### Option B: Using the Official Node-based Stack
1. Clone this repository.
2. Modify the `NODENUMBER` environment variables in `docker-compose.nodejs.yml` to identify the containers.
3. Build and launch the services:
   ```bash
   docker-compose -f docker-compose.nodejs.yml up -d
   ```
4. Scale the dynamic app service:
   ```bash
   docker-compose -f docker-compose.nodejs.yml up -d --scale auto-app=[num_scale]
   ```

# Verification
Check the status of the running containers:
```bash
docker-compose ps
```
Access the services via your browser or curl by defining the server names configured in the Nginx upstream config files (`/etc/nginx/conf.d`):
* **Manual Upstream:** `manual-upstream.tlabdemo.com` (maps to static `app1` and `app2` instances)
* **Automatic Upstream:** `auto-upstream.tlabdemo.com` (maps to dynamically scaled `auto-app` instances)

For example, testing via curl:
```bash
curl -H "Host: manual-upstream.tlabdemo.com" http://localhost:8080
curl -H "Host: auto-upstream.tlabdemo.com" http://localhost:8080
```

# License
[MIT](https://opensource.org/licenses/MIT)
Copyright (c) 2019 Alfin Hidayat

