terraform {
  backend "gcs" {
    bucket = "microservices-tf-state-stage"
    prefix = "terraform/state"
  }
}
