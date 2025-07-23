output "namespace" {
  description = "Namespace onde o Grafana foi instalado"
  value       = var.namespace
}

output "chart_version" {
  description = "Versão do chart instalada"
  value       = helm_release.grafana.version
}