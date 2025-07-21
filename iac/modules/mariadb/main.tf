resource "kubernetes_namespace" "mariadb" {
  metadata {
    name = var.namespace
    labels = {
      "app.kubernetes.io/name"     = "mariadb"
      "app.kubernetes.io/instance" = "mariadb"
    }
  }
}

resource "helm_release" "mariadb" {
  name       = "mariadb"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "mariadb"
  version    = var.chart_version
  namespace  = kubernetes_namespace.mariadb.metadata[0].name

  values = [
    file("${path.root}/../helm-values/mariadb/by-version/${var.chart_version}/values.yaml")
  ]

  depends_on = [
    kubernetes_namespace.mariadb
  ]
}