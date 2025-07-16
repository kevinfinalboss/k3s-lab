data "kubernetes_service" "ingress_nginx" {
  depends_on = [module.nginx_ingress_controller]
  
  metadata {
    name      = "nginx-ingress-controller-controller"
    namespace = "ingress-nginx"
  }
}