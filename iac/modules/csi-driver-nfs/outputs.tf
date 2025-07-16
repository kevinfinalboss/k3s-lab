output "namespace" {
  description = "Namespace onde o CSI Driver NFS foi instalado"
  value       = var.namespace
}

output "chart_version" {
  description = "Versão do chart instalada"
  value       = helm_release.csi_driver_nfs.version
}

output "nfs_server" {
  description = "Servidor NFS configurado"
  value       = var.nfs_server
}

output "nfs_path" {
  description = "Caminho NFS configurado"
  value       = var.nfs_path
}