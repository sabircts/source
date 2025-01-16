terraform {
  required_version = "~> 1.3"
}

data "google_container_cluster" "gke_cluster" {
  count    = var.clustertype == "gke" ? 1 : 0
  name     = var.gke_cluster_name
  location = var.region
  project  = var.project_id
}

data "google_client_config" "current" {
  count = var.clustertype == "gke" ? 1 : 0
}

locals {
  kubeconfig = {
    cluster_ca_certificate = var.clustertype == "gke" ? data.google_container_cluster.gke_cluster[0].master_auth[0].cluster_ca_certificate : null
    host                   = var.clustertype == "gke" ? "https://${data.google_container_cluster.gke_cluster[0].endpoint}" : null
    token                  = var.clustertype == "gke" ? data.google_client_config.current[0].access_token : null
  }
}

provider "google" {
  region  = var.gcp_region
  project = var.project_id
}

provider "kubernetes" {
}

module "helm" {
  source = "./modules/helm-install"

  project_id       = var.project_id
  gke_cluster_name = var.gke_cluster_name
  chart            = var.chart
  deploymentname   = var.deploymentname
  chartversion     = var.chartversion
  chartrepository  = var.chartrepository
  values-files     = var.values-files
  namespace        = var.namespace

  kubeconfig = local.kubeconfig

  clustertype      = var.clustertype
  create_namespace = var.create_namespace
}

output "status" {
  value = module.helm.status
}

output "chart_details" {
  value = module.helm.chart_details
}