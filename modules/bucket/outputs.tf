output "arn" {
  description = "ARN of the application bucket."
  value       = aws_s3_bucket.this.arn
}
