# NGINX Ingress Controller
output "nginx_ingress_namespace" {
  description = "Namespace do NGINX Ingress Controller"
  value       = module.nginx_ingress_controller.namespace
}

output "nginx_ingress_chart_version" {
  description = "Versão do chart NGINX Ingress instalada"
  value       = module.nginx_ingress_controller.chart_version
}

# Cert Manager
output "cert_manager_namespace" {
  description = "Namespace do Cert Manager"
  value       = module.cert_manager.namespace
}

output "cert_manager_chart_version" {
  description = "Versão do chart Cert Manager instalada"
  value       = module.cert_manager.chart_version
}

output "letsencrypt_staging_issuer" {
  description = "Nome do ClusterIssuer staging"
  value       = module.cert_manager.letsencrypt_staging_issuer
}

output "letsencrypt_prod_issuer" {
  description = "Nome do ClusterIssuer produção"
  value       = module.cert_manager.letsencrypt_prod_issuer
}

# External DNS
output "external_dns_namespace" {
  description = "Namespace do External DNS"
  value       = module.external_dns.namespace
}

output "external_dns_chart_version" {
  description = "Versão do chart External DNS instalada"
  value       = module.external_dns.chart_version
}

# External Secrets
output "external_secrets_namespace" {
  description = "Namespace do External Secrets"
  value       = module.external_secrets.namespace
}

output "external_secrets_chart_version" {
  description = "Versão do chart External Secrets instalada"
  value       = module.external_secrets.chart_version
}

# ArgoCD
output "argocd_namespace" {
  description = "Namespace do ArgoCD"
  value       = module.argocd.namespace
}

output "argocd_chart_version" {
  description = "Versão do chart ArgoCD instalada"
  value       = module.argocd.chart_version
}

output "argocd_url" {
  description = "URL do ArgoCD"
  value       = module.argocd.argocd_url
}

output "argocd_admin_password_command" {
  description = "Comando para obter senha do admin ArgoCD"
  value       = module.argocd.admin_password_command
}

# CSI Driver NFS
output "csi_nfs_namespace" {
  description = "Namespace do CSI Driver NFS"
  value       = module.csi_driver_nfs.namespace
}

output "csi_nfs_chart_version" {
  description = "Versão do chart CSI Driver NFS instalada"
  value       = module.csi_driver_nfs.chart_version
}

output "nfs_server" {
  description = "Servidor NFS configurado"
  value       = module.csi_driver_nfs.nfs_server
}

output "nfs_path" {
  description = "Caminho NFS configurado"
  value       = module.csi_driver_nfs.nfs_path
}

# Redis
output "redis_namespace" {
  description = "Namespace do Redis"
  value       = module.redis.namespace
}

output "redis_chart_version" {
  description = "Versão do chart Redis instalada"
  value       = module.redis.chart_version
}

output "redis_service_name" {
  description = "Nome do service do Redis"
  value       = module.redis.service_name
}

output "redis_connection_string" {
  description = "String de conexão do Redis"
  value       = module.redis.connection_string
}

# MariaDB
output "mariadb_namespace" {
  description = "Namespace do MariaDB"
  value       = module.mariadb.namespace
}

output "mariadb_chart_version" {
  description = "Versão do chart MariaDB instalada"
  value       = module.mariadb.chart_version
}

output "mariadb_service_name" {
  description = "Nome do service do MariaDB"
  value       = module.mariadb.service_name
}

output "mariadb_connection_string" {
  description = "String de conexão do MariaDB"
  value       = module.mariadb.connection_string
}

output "mariadb_database_name" {
  description = "Nome do banco de dados criado"
  value       = module.mariadb.database_name
}

output "mariadb_database_user" {
  description = "Usuário do banco de dados"
  value       = module.mariadb.database_user
}

# Summary
output "cluster_summary" {
  description = "Resumo da infraestrutura do cluster"
  value = {
    nginx_ingress = {
      namespace = module.nginx_ingress_controller.namespace
      version   = module.nginx_ingress_controller.chart_version
    }
    cert_manager = {
      namespace = module.cert_manager.namespace
      version   = module.cert_manager.chart_version
    }
    external_dns = {
      namespace = module.external_dns.namespace
      version   = module.external_dns.chart_version
    }
    external_secrets = {
      namespace = module.external_secrets.namespace
      version   = module.external_secrets.chart_version
    }
    argocd = {
      namespace = module.argocd.namespace
      version   = module.argocd.chart_version
      url       = module.argocd.argocd_url
    }
    csi_nfs = {
      namespace  = module.csi_driver_nfs.namespace
      version    = module.csi_driver_nfs.chart_version
      nfs_server = module.csi_driver_nfs.nfs_server
      nfs_path   = module.csi_driver_nfs.nfs_path
    }
    redis = {
      namespace         = module.redis.namespace
      version          = module.redis.chart_version
      service_name     = module.redis.service_name
      connection_string = module.redis.connection_string
    }
    mariadb = {
      namespace         = module.mariadb.namespace
      version          = module.mariadb.chart_version
      service_name     = module.mariadb.service_name
      connection_string = module.mariadb.connection_string
    }
  }
}