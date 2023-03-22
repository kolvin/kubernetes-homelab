help:
	@printf "Usage: make [target] [VARIABLE=value]\nTargets:\n"
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: ## Setup commit hooks
	@pre-commit install

validate: ## Validate files with pre-commit hooks
	@pre-commit run --all-files

update-helm-deps:
	@helm dependency update charts/$(chart)

helm-update: ## Prepare and install a $chart
	@helm dependency build charts/$(chart)
	@helm upgrade --install --atomic $(chart) charts/$(chart) --values charts/$(chart)/values.yaml --namespace $(namespace) --create-namespace

# Usage:
# make chart=directus namespace=apps helm-update
# make chart=longhorn namespace=longhorn-system helm-update
