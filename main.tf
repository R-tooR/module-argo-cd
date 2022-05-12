provider "kubernetes" {
#  load_config_file       = false
  cluster_ca_certificate = base64decode(var.kubernetes_cluster_cert_data)
  host                   = var.kubernetes_cluster_endpoint

#  exec {
#    api_version = "client.authentication.k8s.io/v1alpha1"
#    command     = "az login"
#  }
}

provider "helm" {
  kubernetes {
#    load_config_file       = false
    cluster_ca_certificate = base64decode(var.kubernetes_cluster_cert_data)
    host                   = var.kubernetes_cluster_endpoint

#    exec {
#      api_version = "client.authentication.k8s.io/v1alpha1"
#      command     = "az login"
#    }
  }
}

resource "kubernetes_namespace" "example" {
  metadata {
    name = "argo"
  }
}
resource "helm_release" "argocd" {
  chart      = "argo-cd"
  name       = "msur"
  repository = "https://argoproj.github.io/argo-helm"
  namespace  = "argo"
}

