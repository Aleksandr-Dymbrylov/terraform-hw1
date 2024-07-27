terraform {
  backend "s3" {
    bucket = "bbb.alex-aws.com"
    key    = "virginia/terraform.tfstate"
    region = "us-east-1"
  }
}


