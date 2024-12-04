output "bucket_bucket" {
  value = aws_s3_bucket.b.bucket
}

output "bucket_arn" {
  value = aws_s3_bucket.b.arn
}

output "bucket_id" {
  value = aws_s3_bucket.b.id
}

output "bucket_bucket_prefix" {
  value = aws_s3_bucket.b.bucket_prefix
}
