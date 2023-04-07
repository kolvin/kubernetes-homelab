help:
	@printf "Usage: make [target] [VARIABLE=value]\nTargets:\n"
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: ## Setup commit hooks
	@pre-commit install

validate: ## Validate files with pre-commit hooks
	@pre-commit run --all-files

update-helm-deps: ## Update a $chart dependencies 
	@helm dependency update charts/$(chart)

helm-dep-build: update-helm-deps ## Prepare a $chart dependencies
	@helm dependency build charts/$(chart)

helm-install: helm-dep-build ## Upgrade/Install a $chart
	@helm upgrade --install --atomic $(chart) charts/$(chart) --values charts/$(chart)/values.yaml --namespace $(namespace) --create-namespace --debug

helm-template: helm-dep-build ## Prepare and install a $chart
	@helm template $(chart) charts/$(chart) --values charts/$(chart)/values.yaml --namespace $(namespace) --create-namespace --debug

# Usage:
# make chart=directus namespace=apps helm-install
# make chart=longhorn namespace=longhorn-system helm-install
# make chart=cloudflared namespace=apps helm-template
