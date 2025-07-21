variable "namespace" {
  description = "Namespace para instalar o MariaDB"
  type        = string
  default     = "mariadb"
}

variable "chart_version" {
  description = "Versão do chart Helm do MariaDB"
  type        = string
  default     = "21.0.2"
}

variable "root_password" {
  description = "Password root para o MariaDB"
  type        = string
  sensitive   = true
  default     = ""
}

variable "database_name" {
  description = "Nome do banco de dados a ser criado"
  type        = string
  default     = "test_db"
}

variable "database_user" {
  description = "Usuário do banco de dados"
  type        = string
  default     = "test_user"
}

variable "database_password" {
  description = "Password do usuário do banco de dados"
  type        = string
  sensitive   = true
  default     = ""
}

variable "storage_class" {
  description = "Storage class para os volumes do MariaDB"
  type        = string
  default     = "local-path"
}

variable "primary_storage_size" {
  description = "Tamanho do storage do MariaDB primary"
  type        = string
  default     = "20Gi"
}