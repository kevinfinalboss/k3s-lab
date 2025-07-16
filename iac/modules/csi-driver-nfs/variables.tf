variable "namespace" {
  description = "Namespace para instalar o CSI Driver NFS"
  type        = string
  default     = "kube-system"
}

variable "chart_version" {
  description = "Versão do chart Helm"
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
}