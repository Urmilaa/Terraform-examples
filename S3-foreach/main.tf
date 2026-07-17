resource "aws_s3_bucket" "demo_bucket" {

  for_each = var.bucket_names

  bucket = each.value

  tags = {

    Name        = each.key
    Environment = each.key

  }

}
