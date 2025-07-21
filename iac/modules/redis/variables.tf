variable "namespace" {
  description = "Namespace para instalar o Redis"
  type        = string
  default     = "redis"
}

variable "chart_version" {
  description = "Versão do chart Helm do Redis"
  type        = string
  default     = "21.2.12"
}

variable "redis_password" {
  description = "Password para o Redis"
  type        = string
  sensitive   = true
  default     = ""
}

variable "storage_class" {
  description = "Storage class para os volumes do Redis"
  type        = string
  default     = "local-path"
}

variable "master_storage_size" {
  description = "Tamanho do storage do Redis master"
  type        = string
  default     = "8Gi"
}