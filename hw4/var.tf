variable "region" {
  description = "AWS region"
  type        = string
}

variable "key_name" {
  description = "Name of the key pair"
  type        = string
}

variable "ports" {
  description = "Ports to allow"
  type        = list(number)
  default     = [22, 80, 443]
}

variable "availability_zone" {
  description = "Availability zone"
  type        = string
}

variable "instance_type" {
  description = "Type of instance"
  type        = string
}

variable "ami_id" {
  description = "AMI ID"
  type        = string
}

variable "instance_count" {
  description = "Number of instances"
  type        = number
}