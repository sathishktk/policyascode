terraform {
  required_version = ">= 0.12.6"
}

variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "demobucket-s3-sat"
  default = "demobucket-s3-sat"
}

variable "bucket_acl" {
  description = "ACL for S3 bucket: private, public-read, public-read-write, etc"
  default     = "private"
}

variable "kms_key_arn" {
  description = "demo kms key"
  default = "arn:aws:kms:us-east-1:869522244151:key/171f951a-b213-4019-afc0-33f79a2627d0"

}

provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl    = var.bucket_acl

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = var.kms_key_arn
        sse_algorithm     = "aws:kms"
      }
    }
  }

  
}

output "sse_algorithm" {
  value = aws_s3_bucket.bucket.server_side_encryption_configuration[0].rule[0].apply_server_side_encryption_by_default[0].sse_algorithm
}
