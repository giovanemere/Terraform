resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket-best"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"

  }
}
