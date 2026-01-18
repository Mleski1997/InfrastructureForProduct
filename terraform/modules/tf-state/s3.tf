resource "aws_s3_bucket" "state" {
  bucket        = "${var.project_name}-tf-state-xyz-2026"
  force_destroy = false

  tags = {
    Name        = "Terraform state"
    Environment = "infra"
    Project     = var.project_name
  }
}

resource "aws_s3_bucket_versioning" "state_version" {
  bucket = aws_s3_bucket.state.id
  versioning_configuration {
    status = "Enabled"
  }
}


resource "aws_s3_bucket_server_side_encryption_configuration" "state_encryption" {
  bucket = aws_s3_bucket.state.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "state_public_access_block" {
  bucket = aws_s3_bucket.state.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

