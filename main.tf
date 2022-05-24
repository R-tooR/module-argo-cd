provider "kubernetes" {
  host                   = var.kubernetes_cluster_endpoint
  cluster_ca_certificate = base64decode(var.kubernetes_cluster_cert_data)
  client_certificate     = base64decode(var.kubernetes_client_certificate)
  client_key             = base64decode(var.kubernetes_client_key)
}

#provider "helm" {
#  kubernetes {
#    host                   = var.kubernetes_cluster_endpoint
#    cluster_ca_certificate = base64decode(var.kubernetes_cluster_cert_data)
#    client_certificate     = base64decode(var.kubernetes_client_certificate)
#    client_key             = base64decode(var.kubernetes_client_key)
#  }
#}

resource "kubernetes_namespace" "example" {
  metadata {
    name = "argo"
  }
}
#resource "helm_release" "argocd" {
#  chart      = "argo-cd"
#  name       = "msur"
#  repository = "https://argoproj.github.io/argo-helm"
#  namespace  = "default"
##  namespace  = "argo"
#}

