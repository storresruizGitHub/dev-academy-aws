output "dev_academy_bucket_name" {
  description = "Name of the created S3 bucket for Dev Academy lab"
  value       = aws_s3_bucket.dev_academy_lab_bucket.id
}

output "dev_academy_group_name" {
  description = "Name of the created IAM group for Dev Academy"
  value       = aws_iam_group.dev_academy_lab_group.name
}
