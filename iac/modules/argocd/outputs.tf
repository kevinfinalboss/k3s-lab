output "namespace" {
  description = "Namespace onde o ArgoCD foi instalado"
  value       = kubernetes_namespace.argocd.metadata[0].name
}

output "chart_version" {
  description = "Versão do chart instalada"
  value       = helm_release.argocd.version
}

output "admin_password_command" {
  description = "Comando para obter senha do admin"
  value       = "kubectl -n ${kubernetes_namespace.argocd.metadata[0].name} get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d"
}

output "argocd_url" {
  description = "URL do ArgoCD"
  value       = "https://${var.domain}"
}