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