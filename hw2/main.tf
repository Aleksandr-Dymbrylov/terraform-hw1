provider aws {
  region = "us-east-1"
}

resource "aws_key_pair" "deployer" {
  key_name   = "Bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_s3_bucket" "bucket1" {
  bucket = "kaizen-alex"
}

resource "aws_s3_bucket" "bucket2" {
  bucket_prefix = "kaizen-"
}

resource "aws_s3_bucket" "imported-bucket1" {
  bucket = "aws-bucket1987"
}
resource "aws_s3_bucket" "imported-bucket2" {
  bucket = "aws-bucket1988"
}
# terraform import aws_s3_bucket.imported-bucket1 aws-bucket1987
# terraform import aws_s3_bucket.imported-bucket2 aws-bucket1988