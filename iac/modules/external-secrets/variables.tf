variable "namespace" {
  description = "Namespace para instalar o External Secrets"
  type        = string
  default     = "external-secrets"
}

variable "chart_version" {
  description = "Versão do chart Helm"
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