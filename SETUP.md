# Project Setup

This document describes how to set up the __PROJECT_NAME__ project for development.

## Prerequisites

- Node.js 20+ (or your backend runtime if not Node)
- PostgreSQL 14+ (if using database)
- Encore CLI (if using Encore backend)
- Git

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/your-org/__PROJECT_NAME__.git
   cd __PROJECT_NAME__
   ```

2. Install dependencies:
   ```bash
   npm ci
   # or
   yarn install
   ```

3. Set up environment variables:
   ```bash
   cp .env.example .env
   # Edit .env with your configuration
   ```

4. Initialize the database:
   ```bash
   # For Encore projects:
   npx encore db push

   # For other ORMs:
   # npx prisma migrate dev
   # or
   # knex migrate:latest
   ```

5. Start the development server:
   ```bash
   npm run dev
   ```

The app should be available at http://localhost:3000 (or your configured port).

---

## Project Structure

```
project/
├── src/           # Source code
├── public/        # Static assets
├── test/          # Test files
├── docs/          # Additional documentation
└── deploy/        # Deployment scripts
```

---

## Available Scripts

- `npm run dev` – Start development server
- `npm run build` – Build for production
- `npm start` – Start production server
- `npm test` – Run tests
- `npm run lint` – Lint code

---

## IDE Configuration

We recommend:
- VS Code with the following extensions:
  - TypeScript ESLint
  - Prettier
  - GitLens

Settings are in `.vscode/` folder.

---

## Troubleshooting

**Port already in use:**
Change the port in your `.env` file (e.g., `PORT=3001`).

**Database connection error:**
Ensure PostgreSQL is running and your `DATABASE_URL` is correct.

**Build fails:**
Clear cache: `rm -rf node_modules/.cache` and reinstall dependencies.

---

## Next Steps

- Read the main README.md
- Check DEPLOYMENT.md for production setup
- Review TESTING.md for test guidelines
