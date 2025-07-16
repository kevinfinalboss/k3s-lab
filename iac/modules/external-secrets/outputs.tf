output "namespace" {
  description = "Namespace onde o External Secrets foi instalado"
  value       = kubernetes_namespace.external_secrets.metadata[0].name
}

output "chart_version" {
  description = "Versão do chart instalada"
  value       = helm_release.external_secrets.version
}