output "namespace" {
  description = "Namespace onde o Cert Manager foi instalado"
  value       = kubernetes_namespace.cert_manager.metadata[0].name
}

output "chart_version" {
  description = "Versão do chart instalada"
  value       = helm_release.cert_manager.version
}

output "letsencrypt_staging_issuer" {
  description = "Nome do ClusterIssuer staging"
  value       = "letsencrypt-staging"
}

output "letsencrypt_prod_issuer" {
  description = "Nome do ClusterIssuer produção"
  value       = "letsencrypt-prod"
}