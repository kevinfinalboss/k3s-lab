variable "namespace" {
  description = "Namespace para instalar o Grafana"
  type        = string
  default     = "monitoring"
}

variable "chart_version" {
  description = "Versão do chart Helm"
  type        = string
  default     = "9.2.10"
}

variable "domain" {
  description = "Domínio para acesso ao Grafana"
  type        = string
  default     = "monitoring.kevindev.com.br"
}