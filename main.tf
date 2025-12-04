terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# -------------------------
# 1. Variable for Bucket Name
# -------------------------
variable "bucket_name" {
  type        = string
  description = "S3 bucket name provided by Jenkins"
}

# -------------------------
# 2. S3 Bucket (Dynamic Name)
# -------------------------
resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucket_name
}

# -------------------------
# 3. Versioning Configuration
# -------------------------
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.mybucket.id

  versioning_configuration {
    status = "Suspended"
  }
}

# -------------------------
# 4. Server Side Encryption (SSE)
# -------------------------
resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.mybucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
