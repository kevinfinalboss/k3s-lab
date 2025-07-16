output "namespace" {
  description = "Namespace onde o NGINX Ingress foi instalado"
  value       = kubernetes_namespace.ingress_nginx.metadata[0].name
}

output "chart_version" {
  description = "Versão do chart instalada"
  value       = helm_release.nginx_ingress_controller.version
}