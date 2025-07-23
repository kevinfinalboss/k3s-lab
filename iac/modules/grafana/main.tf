data "aws_ssm_parameter" "grafana_admin_user" {
  name = "/grafana/admin/username"
  with_decryption = true
}

data "aws_ssm_parameter" "grafana_admin_password" {
  name = "/grafana/admin/password"
  with_decryption = true
}

resource "kubernetes_secret" "grafana_admin" {
  metadata {
    name      = "grafana-admin-credentials"
    namespace = var.namespace
  }

  data = {
    admin-user     = data.aws_ssm_parameter.grafana_admin_user.value
    admin-password = data.aws_ssm_parameter.grafana_admin_password.value
  }

  type = "Opaque"
}

resource "helm_release" "grafana" {
  name       = "grafana"
  repository = "https://grafana.github.io/helm-charts"
  chart      = "grafana"
  version    = var.chart_version
  namespace  = var.namespace

  values = [
    templatefile("${path.root}/../helm-values/grafana/by-version/${var.chart_version}/values.yaml", {
    })
  ]

  timeout = 600

  depends_on = [kubernetes_secret.grafana_admin]
}