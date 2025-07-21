output "namespace" {
  description = "Namespace onde o MariaDB foi instalado"
  value       = kubernetes_namespace.mariadb.metadata[0].name
}

output "chart_version" {
  description = "Versão do chart instalada"
  value       = helm_release.mariadb.version
}

output "service_name" {
  description = "Nome do service do MariaDB primary"
  value       = "mariadb"
}

output "service_port" {
  description = "Porta do service do MariaDB"
  value       = 3306
}

output "connection_string" {
  description = "String de conexão para o MariaDB"
  value       = "mariadb.${var.namespace}.svc.cluster.local:3306"
}

output "database_name" {
  description = "Nome do banco de dados criado"
  value       = var.database_name
}

output "database_user" {
  description = "Usuário do banco de dados"
  value       = var.database_user
}