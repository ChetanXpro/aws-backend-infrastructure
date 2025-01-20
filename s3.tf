
resource "aws_s3_bucket" "app_bucket" {
  bucket = var.s3_bucket_name

  tags = {
    Name = "${var.instance_name} Bucket"
  }
}

# S3 bucket ownership controls
resource "aws_s3_bucket_ownership_controls" "app_bucket_ownership" {
  bucket = aws_s3_bucket.app_bucket.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

# Block all public access
resource "aws_s3_bucket_public_access_block" "app_bucket_public_access" {
  bucket = aws_s3_bucket.app_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

# CORS configuration if needed
resource "aws_s3_bucket_cors_configuration" "app_bucket_cors" {
  bucket = aws_s3_bucket.app_bucket.id

  cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "HEAD"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
  }
}