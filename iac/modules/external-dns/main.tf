resource "kubernetes_namespace" "external_dns" {
  metadata {
    name = var.namespace
    labels = {
      "app.kubernetes.io/name"     = "external-dns"
      "app.kubernetes.io/instance" = "external-dns"
    }
  }
}

resource "kubernetes_secret" "cloudflare_api_token" {
  metadata {
    name      = "cloudflare-api-token"
    namespace = kubernetes_namespace.external_dns.metadata[0].name
  }

  data = {
    cloudflare_api_token = var.cloudflare_api_token
  }

  type = "Opaque"
}

resource "helm_release" "external_dns" {
  name       = "external-dns"
  repository = "https://kubernetes-sigs.github.io/external-dns/"
  chart      = "external-dns"
  version    = var.chart_version
  namespace  = kubernetes_namespace.external_dns.metadata[0].name

  values = [
    templatefile("${path.root}/../helm-values/external-dns/by-version/${var.chart_version}/values.yaml", {
      cloudflare_email    = var.cloudflare_email
      domain_filters      = jsonencode(var.domain_filters)
      public_ip          = var.public_ip
    })
  ]

  depends_on = [
    kubernetes_namespace.external_dns,
    kubernetes_secret.cloudflare_api_token
  ]
}