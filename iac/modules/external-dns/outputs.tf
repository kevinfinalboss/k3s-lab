output "namespace" {
  description = "Namespace onde o External DNS foi instalado"
  value       = kubernetes_namespace.external_dns.metadata[0].name
}

output "chart_version" {
  description = "Versão do chart instalada"
  value       = helm_release.external_dns.version
}