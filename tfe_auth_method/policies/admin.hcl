# Manage auth methods broadly across Vault
path  "auth/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}


# Create, update, and delete auth methods
path  "sys/auth/*" {
  capabilities = ["create", "update", "delete", "sudo"]
}


# List auth methods
path  "sys/auth" {
  capabilities = ["read"]
}


# Create and manage ACL policies
path  "sys/policies/acl/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}


# List ACL policies
path  "sys/policies/acl" {
  capabilities = ["list"]
}


# Create and manage secrets engines broadly across Vault
path  "sys/mounts/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}


# List enabled secrets engines
path  "sys/mounts" {
  capabilities = ["read", "list"]
}


# Manage transit secrets engine
path  "transit/*" {
  capabilities = ["create", "read", "update", "delete", "list", "sudo"]
}


# Read health checks
path  "sys/health" {
  capabilities = ["read", "sudo"]
}


# List audit devices
path  "sys/audit" {
  capabilities = ["read", "sudo"]
}


# Create and manage audit devices
path  "sys/audit/*" {
  capabilities = ["create", "read", "update", "delete", "sudo"]
}


# Create and manage groups and aliases
path  "identity/group" {
  capabilities = ["create", "read", "update", "delete"]
}


# Create and manage groups and aliases
path  "identity/group/*" {
  capabilities = ["create", "read", "update", "delete"]
}


# Allow TFC to create and manage groups and aliases"
path  "identity/group-alias" {
  capabilities = ["create", "read", "update", "delete"]
}


# Allow TFC to create and manage groups and aliases
path  "identity/group-alias/*" {
  capabilities = ["create", "read", "update", "delete"]
}