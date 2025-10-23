output "dev_academy_bucket_name" {
  description = "Name of the created S3 bucket for Dev Academy lab"
  value       = aws_s3_bucket.dev_academy_lab_bucket.id
}

output "dev_academy_group_name" {
  description = "Name of the created IAM group for Dev Academy"
  value       = aws_iam_group.dev_academy_lab_group.name
}

output "dev_academy_policy_name" {
  description = "Name of the created IAM policy for Dev Academy bucket access"
  value       = aws_iam_policy.dev_academy_bucket_policy.name
}

output "dev_academy_policy_arn" {
  description = "ARN of the created IAM policy for Dev Academy bucket access"
  value       = aws_iam_policy.dev_academy_bucket_policy.arn
}

output "dev_academy_bucket_arn" {
  description = "ARN of the created S3 bucket"
  value       = aws_s3_bucket.dev_academy_lab_bucket.arn
}
