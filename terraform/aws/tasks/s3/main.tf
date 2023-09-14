module "intuitve_s3_bucket" {
  source       = "../../aws/modules/s3"
  bucket_name  = var.bucket_name
  }
