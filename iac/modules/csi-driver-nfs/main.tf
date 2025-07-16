resource "helm_release" "csi_driver_nfs" {
  name       = "csi-driver-nfs"
  repository = "https://raw.githubusercontent.com/kubernetes-csi/csi-driver-nfs/master/charts"
  chart      = "csi-driver-nfs"
  version    = var.chart_version
  namespace  = var.namespace

  values = [
    templatefile("${path.root}/../helm-values/csi-driver-nfs/by-version/${var.chart_version}/values.yaml", {
      nfs_server = var.nfs_server
      nfs_path   = var.nfs_path
    })
  ]

  timeout = 300
}