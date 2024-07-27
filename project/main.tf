provider "aws" {
  region = var.aws_region
}

resource "aws_s3_bucket" "my-bucket-alex" {
  bucket = var.bucketname
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.my-bucket-alex.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.my-bucket-alex.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.example,
    aws_s3_bucket_public_access_block.example,
  ]

  bucket = aws_s3_bucket.my-bucket-alex.id
  acl    = "public-read"
}

resource "aws_s3_object" "index" {
  depends_on = [aws_s3_bucket_acl.example]
  bucket = aws_s3_bucket.my-bucket-alex.id
  key    = var.index_doc
  source = var.index_doc
  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  depends_on = [aws_s3_bucket_acl.example]
  bucket = aws_s3_bucket.my-bucket-alex.id
  key    = var.error_doc
  source = var.error_doc
  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.my-bucket-alex.id
  index_document {
    suffix = var.index_doc
  }
  error_document {
    key = var.error_doc
    }
    
    depends_on = [ aws_s3_bucket_acl.example ]
  
}

resource "aws_route53_record" "www" {
  zone_id = "Z058810638W6QJ42UREE5"
  name = "bbb.alex-aws.com"
  type = "CNAME"
  ttl = 300
  records = ["${aws_s3_bucket.my-bucket-alex.bucket}.s3-website-us-east-1.amazonaws.com"]
}