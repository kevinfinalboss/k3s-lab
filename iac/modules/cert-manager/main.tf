resource "kubernetes_namespace" "cert_manager" {
  metadata {
    name = var.namespace
    labels = {
      "app.kubernetes.io/name"     = "cert-manager"
      "app.kubernetes.io/instance" = "cert-manager"
    }
  }
}

resource "kubernetes_secret" "cloudflare_api_token" {
  metadata {
    name      = "cloudflare-api-token"
    namespace = kubernetes_namespace.cert_manager.metadata[0].name
  }

  data = {
    api-token = var.cloudflare_api_token
  }

  type = "Opaque"
}

resource "helm_release" "cert_manager" {
  name       = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = var.chart_version
  namespace  = kubernetes_namespace.cert_manager.metadata[0].name

  values = [
    templatefile("${path.root}/../helm-values/cert-manager/by-version/${var.chart_version}/values.yaml", {
      cloudflare_email = var.cloudflare_email
      acme_email      = var.acme_email
    })
  ]

  depends_on = [
    kubernetes_namespace.cert_manager,
    kubernetes_secret.cloudflare_api_token
  ]
}