help:
	@printf "Usage: make [target] [VARIABLE=value]\nTargets:\n"
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: ## Setup commit hooks
	@pre-commit install

validate: ## Validate files with pre-commit hooks
	@pre-commit run --all-files

update-metallb: ## Prepare and install metallb
	@helm dependency build metallb
	@helm upgrade --install metallb metallb --values metallb/values.yaml --namespace metallb-system --create-namespace --wait

update-longhorn: ## Prepare and install longhorn
	@helm dependency build longhorn
	@helm upgrade --install longhorn longhorn --values longhorn/values.yaml --namespace longhorn-system --create-namespace --wait
