.PHONY: dev

dev:
	kustomize build ./deployments/kustomize
