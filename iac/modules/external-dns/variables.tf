variable "namespace" {
  description = "Namespace para instalar o External DNS"
  type        = string
  default     = "external-dns"
}

variable "chart_version" {
  description = "Versão do chart Helm"
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
  description = "Lista de domínios"
  type        = list(string)
}

variable "public_ip" {
  description = "IP público do LoadBalancer"
  type        = string
}