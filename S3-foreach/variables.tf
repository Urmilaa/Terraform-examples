variable "aws_region" {
  default = "us-east-1"
}

variable "bucket_names" {

  description = "Map of S3 bucket names"

  type = map(string)

}
