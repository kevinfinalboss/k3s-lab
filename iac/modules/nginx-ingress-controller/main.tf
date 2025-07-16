resource "kubernetes_namespace" "ingress_nginx" {
  metadata {
    name = var.namespace
    labels = {
      "app.kubernetes.io/name"     = "ingress-nginx"
      "app.kubernetes.io/instance" = "ingress-nginx"
    }
  }
}

resource "helm_release" "nginx_ingress_controller" {
  name       = "nginx-ingress-controller"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = var.chart_version
  namespace  = kubernetes_namespace.ingress_nginx.metadata[0].name

  values = [
    file("${path.root}/../helm-values/nginx-ingress-controller/by-version/${var.chart_version}/values.yaml")
  ]

  depends_on = [kubernetes_namespace.ingress_nginx]
}