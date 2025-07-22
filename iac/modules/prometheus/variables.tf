variable "namespace" {
  description = "Namespace para instalar o Prometheus"
  type        = string
  default     = "monitoring"
}

variable "chart_version" {
  description = "Versão do chart Helm"
  type        = string
  default     = "27.28.0"
}

variable "storage_size" {
  description = "Tamanho do storage para o Prometheus"
  type        = string
  default     = "20Gi"
}