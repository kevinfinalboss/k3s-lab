output "namespace" {
  description = "Namespace onde o Prometheus foi instalado"
  value       = var.namespace
}

output "chart_version" {
  description = "Versão do chart instalada"
  value       = helm_release.prometheus.version
}

output "storage_size" {
  description = "Tamanho do storage configurado"
  value       = var.storage_size
}