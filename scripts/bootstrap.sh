#!/bin/bash
set -e

echo "🚀 Bootstrapping __PROJECT_NAME__..."

# Install dependencies
echo "📦 Installing dependencies..."
cd project && npm ci

# Build if needed
echo "🔨 Building..."
npm run build

# Setup database (if applicable)
if [ -f ".env" ]; then
  echo "🗄️  Setting up database..."
  npx encore db push || echo "No Encore project or database not configured"
fi

echo "✅ Setup complete!"
echo "Run: cd project && npm run dev"
