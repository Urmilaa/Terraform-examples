variable "aws_region" {
  description = "AWS Region"
  type        = string
}

variable "ami_id" {
  description = "Ubuntu AMI ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
}

variable "key_name" {
  description = "Name of the AWS Key Pair"
  type        = string
  default     = "terra-key-ec2"
}

variable "public_key_path" {
  description = "Path to the public key file"
  type        = string
  default     = "terra-key-ec2.pub"
}

variable "instance_name" {
  description = "EC2 Name"
  type        = string
}
