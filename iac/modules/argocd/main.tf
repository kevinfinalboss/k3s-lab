resource "kubernetes_namespace" "argocd" {
  metadata {
    name = var.namespace
    labels = {
      "app.kubernetes.io/name"     = "argocd"
      "app.kubernetes.io/instance" = "argocd"
    }
  }
}

resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = var.chart_version
  namespace  = kubernetes_namespace.argocd.metadata[0].name

  values = [
    templatefile("${path.root}/../helm-values/argocd/by-version/${var.chart_version}/values.yaml", {
      domain = var.domain
    })
  ]

  timeout = 600

  depends_on = [kubernetes_namespace.argocd]
}