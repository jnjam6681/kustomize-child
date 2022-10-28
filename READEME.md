## prepare

skaffold
```
brew install skaffold
```

kind
```
brew install kind
```

---

creat new cluster
```
kind create cluster --name kustomize-01
```

list all kubeconfig
```
kubie ctx
```

select kubeconfig
```
kubie ctx kind-kustomize-01
```

initialize skaffold
```
skaffold init
```

run dev service and port forward for test
```
skaffold dev --port-forward
```

sometime need to specify registy of image
```
skaffold dev --port-forward --default-repo [host/account]
```

don't use cache image and remove image after shutdown service [Ctrl+C]
```
skaffold dev --port-forward --default-repo [host/account] --no-prune=false --cache-artifacts=false
```
