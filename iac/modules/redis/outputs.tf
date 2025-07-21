output "namespace" {
  description = "Namespace onde o Redis foi instalado"
  value       = kubernetes_namespace.redis.metadata[0].name
}

output "chart_version" {
  description = "Versão do chart instalada"
  value       = helm_release.redis.version
}

output "service_name" {
  description = "Nome do service do Redis master"
  value       = "redis-master"
}

output "service_port" {
  description = "Porta do service do Redis"
  value       = 6379
}

output "connection_string" {
  description = "String de conexão para o Redis"
  value       = "redis-master.${var.namespace}.svc.cluster.local:6379"
}