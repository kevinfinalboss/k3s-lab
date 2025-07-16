variable "namespace" {
  description = "Namespace para instalar o NGINX Ingress Controller"
  type        = string
  default     = "ingress-nginx"
}

variable "chart_version" {
  description = "Versão do chart Helm"
  type        = string
  default     = "4.13.0"
}