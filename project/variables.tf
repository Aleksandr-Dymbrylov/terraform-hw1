variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

variable "bucketname" {
  type        = string
  default = "bbb.alex-aws.com"
}

variable "domain_name" {
  description = "Domain name for the website"
  type        = string
  default = "alex-aws.com"
}

variable "subdomain_name" {
  description = "Subdomain name for the website"
  type        = string
  default = "bbb"
}

variable "index_doc" {
  description = "Filename of the index document"
  type        = string
  default     = "index.html"
}

variable "error_doc" {
  description = "Filename of the error document"
  type        = string
  default     = "error.html"
}