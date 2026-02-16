#!/bin/bash
set -e

# Generic deployment script for OpenClaw projects
# Usage: ./deploy.sh <server_user@server_ip> <env_file>

SERVER=$1
ENV_FILE=${2:-".env.production"}

if [ -z "$SERVER" ]; then
  echo "Usage: $0 <server_user@server_ip> [env_file]"
  echo "Example: $0 ubuntu@123.45.67.89 .env.production"
  exit 1
fi

echo "🚀 Deploying to $SERVER..."

# Check env file
if [ ! -f "$ENV_FILE" ]; then
  echo "❌ Environment file $ENV_FILE not found!"
  exit 1
fi

# Build project
echo "📦 Building..."
cd project
npm ci
npm run build
cd ..

# Upload
echo "📤 Uploading files..."
rsync -avz --exclude='node_modules' --exclude='dist' --exclude='.git' --exclude='*.log' ./ $SERVER:/var/www/__PROJECT_NAME__/

# Upload env
scp "$ENV_FILE" $SERVER:/var/www/__PROJECT_NAME__/project/.env

# Setup on server (customize for your stack)
echo "⚙️  Setting up on server..."
ssh $SERVER "cd /var/www/__PROJECT_NAME__/project && npm ci && npx encore db push"

# Restart service (customize)
ssh $SERVER "sudo systemctl restart __project-name__ || echo 'No systemd service configured'"

echo "✅ Deploy complete!"
