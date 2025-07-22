# NGINX Ingress
variable "nginx_namespace" {
  description = "Namespace para o NGINX Ingress Controller"
  type        = string
  default     = "ingress-nginx"
}

variable "nginx_chart_version" {
  description = "Versão do chart Helm do NGINX Ingress Controller"
  type        = string
  default     = "4.13.0"
}

# Cert Manager
variable "cert_manager_namespace" {
  description = "Namespace para o Cert Manager"
  type        = string
  default     = "cert-manager"
}

variable "cert_manager_chart_version" {
  description = "Versão do chart Helm do Cert Manager"
  type        = string
  default     = "1.18.2"
}

# External DNS
variable "external_dns_namespace" {
  description = "Namespace para o External DNS"
  type        = string
  default     = "external-dns"
}

variable "external_dns_chart_version" {
  description = "Versão do chart Helm do External DNS"
  type        = string
  default     = "1.17.0"
}

variable "cloudflare_api_token" {
  description = "Token da API do Cloudflare"
  type        = string
  sensitive   = true
}

variable "cloudflare_email" {
  description = "Email da conta Cloudflare"
  type        = string
}

variable "domain_filters" {
  description = "Lista de domínios gerenciados pelo External DNS"
  type        = list(string)
}

variable "public_ip" {
  description = "IP público do LoadBalancer"
  type        = string
}

# External Secrets
variable "external_secrets_namespace" {
  description = "Namespace para o External Secrets"
  type        = string
  default     = "external-secrets"
}

variable "external_secrets_chart_version" {
  description = "Versão do chart Helm do External Secrets"
  type        = string
  default     = "0.18.2"
}

variable "aws_access_key_id" {
  description = "AWS Access Key ID"
  type        = string
  sensitive   = true
}

variable "aws_secret_access_key" {
  description = "AWS Secret Access Key"
  type        = string
  sensitive   = true
}

variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

# ArgoCD
variable "argocd_namespace" {
  description = "Namespace para o ArgoCD"
  type        = string
  default     = "argocd"
}

variable "argocd_chart_version" {
  description = "Versão do chart Helm do ArgoCD"
  type        = string
  default     = "8.1.3"
}

variable "argocd_domain" {
  description = "Domínio para o ArgoCD"
  type        = string
}

# CSI Driver NFS
variable "csi_nfs_namespace" {
  description = "Namespace para o CSI Driver NFS"
  type        = string
  default     = "kube-system"
}

variable "csi_nfs_chart_version" {
  description = "Versão do chart Helm do CSI Driver NFS"
  type        = string
  default     = "4.11.0"
}

variable "nfs_server" {
  description = "IP do servidor NFS"
  type        = string
}

variable "nfs_path" {
  description = "Caminho do diretório NFS"
  type        = string
  default     = "/srv/nfs-storage"
}

# Redis
variable "redis_namespace" {
  description = "Namespace para o Redis"
  type        = string
  default     = "redis"
}

variable "redis_chart_version" {
  description = "Versão do chart do Redis"
  type        = string
  default     = "21.2.12"
}

variable "redis_password" {
  description = "Password do Redis"
  type        = string
  sensitive   = true
  default     = ""
}

variable "redis_master_storage_size" {
  description = "Tamanho do storage do Redis master"
  type        = string
  default     = "8Gi"
}

# MariaDB variables
variable "mariadb_namespace" {
  description = "Namespace para o MariaDB"
  type        = string
  default     = "mariadb"
}

variable "mariadb_chart_version" {
  description = "Versão do chart do MariaDB"
  type        = string
  default     = "21.0.2"
}

variable "mariadb_root_password" {
  description = "Password root do MariaDB"
  type        = string
  sensitive   = true
  default     = ""
}

variable "mariadb_database_name" {
  description = "Nome do banco de dados a ser criado"
  type        = string
  default     = "test_db"
}

variable "mariadb_database_user" {
  description = "Usuário do banco de dados"
  type        = string
  default     = "test_user"
}

variable "mariadb_database_password" {
  description = "Password do usuário do banco de dados"
  type        = string
  sensitive   = true
  default     = ""
}

variable "mariadb_primary_storage_size" {
  description = "Tamanho do storage do MariaDB primary"
  type        = string
  default     = "20Gi"
}

# Prometheus
variable "prometheus_namespace" {
  description = "Namespace para o Prometheus"
  type        = string
  default     = "monitoring"
}

variable "prometheus_chart_version" {
  description = "Versão do chart do Prometheus"
  type        = string
  default     = "27.28.0"
}

variable "prometheus_storage_size" {
  description = "Tamanho do storage para o Prometheus"
  type        = string
  default     = "20Gi"
}