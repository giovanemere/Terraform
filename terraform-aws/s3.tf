resource "aws_s3_bucket" "terraform-course-s3-logs" {
  bucket = "terraform-course-s3-logs"

  tags = {
    Name        = "My bucket logs"
    Environment = "Dev"

  }
}

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket-best"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"

  }
}