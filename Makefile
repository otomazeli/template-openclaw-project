.PHONY: help install build test lint clean

help: ## Show this help message
	@echo "OpenClaw Project Template Makefile"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'

install: ## Install dependencies for the project
	@echo "Run this in your project directory:"
	@echo "  npm ci  # or yarn install"

build: ## Build the project
	@echo "Add your build command to this Makefile"
	@echo "Example: npm run build"

test: ## Run tests
	@echo "Add your test command to this Makefile"
	@echo "Example: npm test"

lint: ## Run linter
	@echo "Add your lint command to this Makefile"
	@echo "Example: npm run lint"

clean: ## Clean build artifacts
	rm -rf dist build node_modules/.cache

deploy: ## Deploy the project
	@echo "Customize this target with your deployment steps"
	@echo "Example: deploy/deploy.sh"
