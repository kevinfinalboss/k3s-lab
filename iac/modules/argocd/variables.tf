variable "namespace" {
  description = "Namespace para instalar o ArgoCD"
  type        = string
  default     = "argocd"
}

variable "chart_version" {
  description = "Versão do chart Helm"
  type        = string
  default     = "8.1.3"
}

variable "domain" {
  description = "Domínio para acesso ao ArgoCD"
  type        = string
}