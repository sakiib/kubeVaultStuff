# kubevault 

- Create kind cluster: `kind create cluster --image=kindest/node:v1.18.8@sha256:f4bcc97a0ad6e7abaf3f643d890add7efe6ee4ab90baeb374b4f41a4c95567eb`

- `make push install`
- `kubectl create ns demo`
- `kubectl apply -f vs-version.yaml`
- `kubectl apply -f config.yaml`
- `kubectl get secret -n demo vault-keys -o yaml`
- `echo "cy5vUXVCMWVOVjk1UkxCcEtNaDZMUENZbFc=" | base64 -d`
- `export VAULT_TOKEN=s.oQuB1eNV95RLBpKMh6LPCYlW`
- `export VAULT_ADDR="https://127.0.0.1:8200"`
- ` kubectl port-forward -n demo service/vault 8200`
- `vault status`
- `vault auth list`
- `vault auth enable approle`
- `vault read  auth/kubernetes/role/vault-policy-controller`
- `vault policy write my-policy my-policy.hcl`
  
```  
vault write auth/kubernetes/role/vault-policy-controller \
                                                bound_service_account_names=vault \
                                                bound_service_account_namespaces=demo \
                                                policies=default,vault-policy-controller,my-policy \
                                                ttl=24h
```

- ` vault read  auth/kubernetes/role/vault-policy-controller`

```
curl \
                                                    --header "X-Vault-Token: s.oQuB1eNV95RLBpKMh6LPCYlW" \ 
                                                    --request PUT \
                                                    --data @payload.json \
                                                    https://127.0.0.1:8200/v1/auth/approle/role/dev-role -k

```

- `vault list auth/approle/role`
- `kubectl apply -f policy-approle.yaml`
- `kubectl apply -f policy-binding-approle.yaml`  