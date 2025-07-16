variable "namespace" {
  description = "Namespace para instalar o Cert Manager"
  type        = string
  default     = "cert-manager"
}

variable "chart_version" {
  description = "Versão do chart Helm"
  type        = string
  default     = "1.18.2"
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

variable "acme_email" {
  description = "Email para registro ACME"
  type        = string
}