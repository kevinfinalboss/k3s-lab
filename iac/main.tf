module "nginx_ingress_controller" {
  source = "./modules/nginx-ingress-controller"

  namespace     = var.nginx_namespace
  chart_version = var.nginx_chart_version
}

module "cert_manager" {
  source = "./modules/cert-manager"

  namespace           = var.cert_manager_namespace
  chart_version      = var.cert_manager_chart_version
  cloudflare_api_token = var.cloudflare_api_token
  cloudflare_email    = var.cloudflare_email
  acme_email         = var.cloudflare_email
}

module "external_dns" {
  source = "./modules/external-dns"

  namespace           = var.external_dns_namespace
  chart_version      = var.external_dns_chart_version
  cloudflare_api_token = var.cloudflare_api_token
  cloudflare_email    = var.cloudflare_email
  domain_filters      = var.domain_filters
  public_ip          = var.public_ip

  depends_on = [module.nginx_ingress_controller]
}

module "external_secrets" {
  source = "./modules/external-secrets"

  namespace         = var.external_secrets_namespace
  chart_version    = var.external_secrets_chart_version
  aws_access_key_id = var.aws_access_key_id
  aws_secret_access_key = var.aws_secret_access_key
  aws_region       = var.aws_region
}

module "argocd" {
  source = "./modules/argocd"

  namespace     = var.argocd_namespace
  chart_version = var.argocd_chart_version
  domain        = var.argocd_domain
  
  depends_on = [
    module.nginx_ingress_controller,
    module.cert_manager,
    module.external_dns
  ]
}

module "csi_driver_nfs" {
  source = "./modules/csi-driver-nfs"

  namespace     = var.csi_nfs_namespace
  chart_version = var.csi_nfs_chart_version
  nfs_server    = var.nfs_server
  nfs_path      = var.nfs_path
}

module "redis" {
  source = "./modules/redis"

  namespace           = var.redis_namespace
  chart_version       = var.redis_chart_version
  redis_password      = var.redis_password
  master_storage_size = var.redis_master_storage_size
}

module "mariadb" {
  source = "./modules/mariadb"
  namespace             = var.mariadb_namespace
  chart_version        = var.mariadb_chart_version
}

module "prometheus" {
  source = "./modules/prometheus"

  namespace     = var.prometheus_namespace
  chart_version = var.prometheus_chart_version
  storage_size  = var.prometheus_storage_size
  
  depends_on = [
    module.nginx_ingress_controller,
    module.cert_manager,
    module.external_dns
  ]
}