resource "helm_release" "deployment" {
  name             = var.deploymentname
  chart            = var.chart
  version          = var.chartversion != "" ? var.chartversion : null
  repository       = var.chartrepository != "" ? var.chartrepository : null
  namespace        = var.namespace
  values           = [file("${path.module}/values.yaml")]
  create_namespace = var.create_namespace
}