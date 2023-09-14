provider "aws" {
  region = var.region
}

terraform {
  backend "s3" {
    bucket         = var.bucket
    region         = var.region
    }
}
