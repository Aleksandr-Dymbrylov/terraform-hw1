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
  bucket = aws_s3_bucket.my-bucket-alex.id
  key    = "index.html"
  source = "index.html"
  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.my-bucket-alex.id
  key    = "error.html"
  source = "error.html"
  acl = "public-read"
  content_type = "text/html"
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.my-bucket-alex.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
    }
    
    depends_on = [ aws_s3_bucket_acl.example ]
  
}

resource "aws_route53_zone" "primary" {
  name = "alex-aws.com"
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.primary.zone_id
  name = "my-bucket-alex.alex-aws.com"
  type = "CNAME"
  ttl = 300
  records = [ aws_s3_bucket.my-bucket-alex.website_endpoint ]
}