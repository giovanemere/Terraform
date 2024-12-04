terraform {
  backend "s3" {
    bucket = "my-tf-test-bucket-best"
    key = "terraform.tfstate"
    region = "us-east-1"
    
  }
}
