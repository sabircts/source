project_id       = "cog01hy0xaqm3kfh4mr4t3em9ex2m"
gcp_region       = "us-east1"
gke_cluster_name = "alm-flowsource-gke-cluster"
chart            = "FlowSourceCharts"
values-files     = ["./FlowSourceCharts/flowsource-values.yaml", "./FlowSourceCharts/app-config.yaml", "./FlowSourceCharts/all-configurations.yaml"]
namespace        = "flowsource"
create_namespace = "true"
deploymentname   = "flowsourcedeploy"
clustertype      = "gke"