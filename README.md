# OpenClaw Project Template

This is a template repository for starting new OpenClaw projects.

## 📁 Structure

```
.
├── project/
│   ├── src/              # Your project source code
│   ├── package.json
│   └── ...
├── scripts/              # Helper scripts
├── docs/                 # Documentation
├── .gitignore           # Excludes OpenClaw system files
├── Makefile             # Common tasks
├── README.md            # Project documentation
└── SETUP.md             # Setup instructions
```

## 🚀 Quick Start

1. Copy this template: `git clone --depth=1 https://github.com/your-org/template-openclaw-project my-project`
2. Rename `project/` to your actual project name
3. Update `package.json`, `README.md`, etc.
4. Start coding!

## 🛡️ .gitignore

This template includes a comprehensive `.gitignore` that excludes:

- OpenClaw system files (`.clawhub/`, `skills/`, `voice-inbox/`, etc.)
- Node modules, build artifacts
- Environment files
- Editor configs
- Sensitive credentials (optional)

**Important:** The workspace/ folder is ignored except for `workspace/skills/` and `workspace/.clawhub/` if you want to keep global skills. Adjust as needed.

## 📦 Included Scripts

- `scripts/bootstrap.sh` – Initial setup (install deps, build, etc.)
- `scripts/deploy.sh` – Deployment script (customizable)
- `scripts/test.sh` – Run tests

## 🧩 Customization

Before using this template:

1. Search and replace `__PROJECT_NAME__` with your actual project name
2. Update `package.json` with your dependencies
3. Modify `Makefile` targets to match your build process
4. Adjust `.gitignore` to include/exclude project-specific artifacts

## 📚 Documentation

- `SETUP.md` – Development environment setup
- `DEPLOYMENT.md` – Deployment guide (customize for your hosting)
- `TESTING.md` – Testing strategy

## 🤝 Contributing

If you improve this template, please submit a PR!

## 📄 License

MIT (or choose your own)
