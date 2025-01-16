# AWS variables
variable "region" {
  description = "Region in case of AWS Cluster"
  type        = string
  default     = ""
}

# Azure Variables
variable "subscription_id" {
  description = "Azure Kubernetes Service Cluster subscription id"
  sensitive   = true
  default     = ""
}
variable "tenant_id" {
  description = "Azure Kubernetes Service Cluster tenant id"
  sensitive   = true
  default     = ""
}

variable "client_id" {
  description = "Azure Kubernetes Service Cluster client id"
  sensitive   = true
  default     = ""
}

variable "client_secret" {
  description = "Azure Kubernetes Service Cluster client secret"
  sensitive   = true
  default     = ""
}

variable "rg_name" {
  description = "The Azure resource group name"
  type        = string
  default     = ""
}

variable "rg_location" {
  description = "The Azure location to be used"
  type        = string
  default     = ""
}

variable "cluster_name" {
  description = "Cluster Name"
  type        = string
  default     = ""
}

# General Google Account Information

variable "project_id" {
  description = "The ID of the project in which to create the resources"
  type        = string
  default     = ""
}

variable "gcp_region" {
  description = "The region in which to create the resources"
  default     = "us-east1"
}

variable "gke_cluster_name" {
  description = "Cluster Name"
  type        = string
}

# Helm Variables
variable "chart" {
  description = "Location of the helm chart"
  type        = string
}

variable "chartversion" {
  description = "Version of the chart to deploy. If not specified latest version will be used"
  type        = string
  default     = ""
}

variable "chartrepository" {
  description = "The repository for the chart"
  type        = string
  default     = ""
}

variable "values-files" {
  description = "List of Fully qualified values files"
  type        = list(any)
}

variable "namespace" {
  description = "Namespace for installation"
  type        = string
  default     = "flowsource"
}

variable "deploymentname" {
  description = "Name of the deployment"
  type        = string
}

variable "clustertype" {
  description = "Type of the Kubernetes cluster"
  type        = string
  default     = ""

  validation {
    condition     = contains(["eks", "aks", "gke"], var.clustertype)
    error_message = "Valid values for clustertype are eks, aks or gke"
  }
}

variable "create_namespace" {
  type        = bool
  default     = false
  description = "Create namespace if it does not exist. By default the value is false"
}