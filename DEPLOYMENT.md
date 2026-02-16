# Deployment Guide

This guide covers deploying __PROJECT_NAME__ to production.

## Options

### 1. Encore Cloud (Recommended for Encore projects)

```bash
# Login to Encore
encore auth login

# Create app
encore app create __project-name__

# Deploy
git push encore master
encore deploy --env=production
```

### 2. Docker

Build and run with Docker Compose:

```bash
docker-compose -f deploy/docker/docker-compose.yml up -d
```

### 3. VPS / Manual

Use the provided `deploy/deploy.sh` script:

```bash
# 1. Prepare server (Ubuntu/Debian)
# Install Node.js, PostgreSQL, nginx

# 2. Copy deploy/.env.example to .env and fill values

# 3. Run deploy script
./deploy/deploy.sh user@your-server-ip .env.production
```

---

## Environment Variables

See `.env.example` for required variables. Key ones:

- `DATABASE_URL` – PostgreSQL connection
- `PIN_PEPPER` – Secret for PIN hashing (if applicable)
- `CLERK_SECRET_KEY` – Clerk authentication (if used)
- `FRONTEND_URL` – Public URL of the frontend

---

## Database Migrations

Encore projects auto-migrate on deploy. For others:

```bash
npx encore db push
# or
npx prisma migrate deploy
```

---

## SSL/TLS

Use Let's Encrypt:

```bash
sudo certbot --nginx -d yourdomain.com
```

For Encore Cloud, SSL is automatic.

---

## Health Checks

- Backend health: `GET /health`
- Frontend: Served by nginx

---

## Monitoring

- Check logs: `sudo journalctl -u your-service -f`
- Nginx logs: `/var/log/nginx/access.log` and `error.log`

---

## Rollback

### Encore Cloud
```bash
encore rollback --to=previous
```

### Docker
```bash
docker-compose -f deploy/docker/docker-compose.yml down
docker-compose -f deploy/docker/docker-compose.yml up -d <previous-image-tag>
```

### VPS
Stop service, restore backup, restart.

---

## Updating

1. Pull latest code
2. Rebuild if needed: `npm run build`
3. Run migrations if schema changed
4. Restart service

---

## Support

- Issues: https://github.com/your-org/__PROJECT_NAME__/issues
- Docs: See `docs/` folder
