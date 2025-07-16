resource "kubernetes_namespace" "external_secrets" {
  metadata {
    name = var.namespace
    labels = {
      "app.kubernetes.io/name"     = "external-secrets"
      "app.kubernetes.io/instance" = "external-secrets"
    }
  }
}

resource "kubernetes_secret" "aws_credentials" {
  metadata {
    name      = "aws-credentials"
    namespace = kubernetes_namespace.external_secrets.metadata[0].name
  }

  data = {
    access-key-id     = var.aws_access_key_id
    secret-access-key = var.aws_secret_access_key
  }

  type = "Opaque"
}

resource "helm_release" "external_secrets" {
  name       = "external-secrets"
  repository = "https://charts.external-secrets.io"
  chart      = "external-secrets"
  version    = var.chart_version
  namespace  = kubernetes_namespace.external_secrets.metadata[0].name

  values = [
    file("${path.root}/../helm-values/external-secrets/by-version/${var.chart_version}/values.yaml")
  ]

  depends_on = [
    kubernetes_namespace.external_secrets,
    kubernetes_secret.aws_credentials
  ]
}