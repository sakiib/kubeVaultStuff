path "auth/approle/role" {
        capabilities = ["read", "list"]
}

path "auth/approle/role/*" {
        capabilities = ["create", "update", "read", "delete", "list"]
}
