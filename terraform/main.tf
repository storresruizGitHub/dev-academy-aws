# Data source para obtener el ID de la cuenta actual
data "aws_caller_identity" "current" {}

# S3 Bucket simplificado
resource "aws_s3_bucket" "dev_academy_lab_bucket" {
  bucket = "lab-${data.aws_caller_identity.current.account_id}-personal"

  tags = {
    Name = "DevAcademyLabBucket"
  }
}

# IAM Group
resource "aws_iam_group" "dev_academy_lab_group" {
  name = "DevAcademyLabGroup"
}

# Usar política AWS gestionada en lugar de crear una personalizada
resource "aws_iam_group_policy_attachment" "s3_access" {
  group      = aws_iam_group.dev_academy_lab_group.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}
