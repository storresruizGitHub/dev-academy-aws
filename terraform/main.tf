# S3 Bucket
resource "aws_s3_bucket" "my_bucket" {
  bucket = "lab-${data.aws_caller_identity.current.account_id}-personal"

  tags = {
    Name        = "DevAcademyLabBucket"
    Environment = var.environment
  }
}

# IAM Group
resource "aws_iam_group" "my_group" {
  name = "DevAcademyLabGroup"
}

# IAM Policy Document
data "aws_iam_policy_document" "bucket_policy" {
  statement {
    effect = "Allow"
    actions = [
      "s3:ListBucket"
    ]
    resources = [
      aws_s3_bucket.my_bucket.arn
    ]
  }

  statement {
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:PutObject"
    ]
    resources = [
      "${aws_s3_bucket.my_bucket.arn}/*"
    ]
  }
}

# IAM Policy
resource "aws_iam_policy" "my_policy" {
  name   = "DevAcademyBucketAccess"
  policy = data.aws_iam_policy_document.bucket_policy.json
}

# Attach Policy to Group
resource "aws_iam_group_policy_attachment" "policy_attachment" {
  group      = aws_iam_group.my_group.name
  policy_arn = aws_iam_policy.my_policy.arn
}

# Data source to get current AWS account ID
data "aws_caller_identity" "current" {}
