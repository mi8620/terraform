provider "aws" {
  region = var.region
}

# S3 Bucket
resource "aws_s3_bucket" "terraform_state" {
  bucket        = var.bucket_name
  force_destroy = true

  tags = {
    Name        = "Terraform State Bucket"
    Environment = var.environment
  }
}

# Enable Versioning (separate resource)
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

# Enable Server-Side Encryption (separate resource)
resource "aws_s3_bucket_server_side_encryption_configuration" "encryption" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# DynamoDB Lock Table
resource "aws_dynamodb_table" "terraform_locks" {
  name         = var.lock_table
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "Terraform Lock Table"
    Environment = var.environment
  }
}