mock_provider "aws" {}

run "private_bucket" {
  command = plan

  variables {
    bucket_name = "stacksmith-example-policy-test"
  }

  assert {
    condition = (
      aws_s3_bucket_public_access_block.this.block_public_acls &&
      aws_s3_bucket_public_access_block.this.block_public_policy &&
      aws_s3_bucket_public_access_block.this.ignore_public_acls &&
      aws_s3_bucket_public_access_block.this.restrict_public_buckets
    )
    error_message = "Application buckets must block all forms of public access."
  }

  assert {
    condition     = !aws_s3_bucket.this.force_destroy
    error_message = "Destroy must not silently remove application objects."
  }
}
