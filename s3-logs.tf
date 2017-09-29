resource "aws_s3_bucket" "logs" {
  bucket = "s3-cloudfront-${lower(var.name)}-logs"
  acl    = "log-delivery-write"

  lifecycle_rule {
    id      = "s3-cloudfront-${lower(var.name)}-logs-transitions"
    enabled = true

    transition {
      days          = "${var.logs_transition_ia}"
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = "${var.logs_transition_glacier}"
      storage_class = "GLACIER"
    }

    expiration {
      days = "${var.logs_expiration}"
    }
  }

  tags = "${merge(var.tags, map("Name", format("s3-cloudfront-%s-logs", var.name)))}"
}
