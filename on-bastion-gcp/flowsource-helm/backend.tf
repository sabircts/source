terraform {
  backend "gcs" {
    # bucket should be the same as var.backend_bucket_name
    bucket = "fstest-gke-terraform-state"
    prefix = "terraform-states/fstest/flowsource-app"
  }
}