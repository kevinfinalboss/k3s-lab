resource "kubernetes_namespace" "redis" {
  metadata {
    name = var.namespace
    labels = {
      "app.kubernetes.io/name"     = "redis"
      "app.kubernetes.io/instance" = "redis"
    }
  }
}

resource "helm_release" "redis" {
  name       = "redis"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "redis"
  version    = var.chart_version
  namespace  = kubernetes_namespace.redis.metadata[0].name

  values = [
    file("${path.root}/../helm-values/redis/by-version/${var.chart_version}/values.yaml")
  ]

  depends_on = [
    kubernetes_namespace.redis
  ]
}