data "aws_ssm_parameter" "htpasswd" {
  name = "/prometheus/basic_auth/htpasswd"
  with_decryption = true
}

resource "kubernetes_secret" "basic_auth" {
  metadata {
    name      = "prometheus-basic-auth"
    namespace = var.namespace
  }

  data = {
    auth = data.aws_ssm_parameter.htpasswd.value
  }

  type = "Opaque"
}

resource "helm_release" "prometheus" {
  name       = "prometheus"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "prometheus"
  version    = var.chart_version
  namespace  = var.namespace

  values = [
    templatefile("${path.root}/../helm-values/prometheus/by-version/${var.chart_version}/values.yaml", {
      storage_size = var.storage_size
    })
  ]

  timeout = 600

  depends_on = [kubernetes_secret.basic_auth]
}