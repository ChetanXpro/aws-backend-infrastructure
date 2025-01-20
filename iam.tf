# IAM role for backend EC2 instance
resource "aws_iam_role" "backend_s3_access_role" {
  name = "${var.instance_name}-backend-s3-access-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# IAM policy for backend S3 access
resource "aws_iam_role_policy" "backend_s3_access_policy" {
  name = "${var.instance_name}-backend-s3-access-policy"
  role = aws_iam_role.backend_s3_access_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:ListBucket",
          "s3:DeleteObject"
        ]
        Resource = [
          aws_s3_bucket.app_bucket.arn,
          "${aws_s3_bucket.app_bucket.arn}/*"
        ]
      }
    ]
  })
}

# IAM instance profile for backend
resource "aws_iam_instance_profile" "backend_s3_profile" {
  name = "${var.instance_name}-backend-s3-profile"
  role = aws_iam_role.backend_s3_access_role.name
}