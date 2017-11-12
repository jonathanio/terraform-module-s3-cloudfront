output "hostname" {
  description = "The URL for the Website."
  value       = "https://${var.hostname}/"
}

output "s3_bucket_name" {
  description = "The name of the S3 content bucket to upload the website content to."
  value       = "${aws_s3_bucket.content.id}"
}

output "s3_logging_name" {
  description = "The name of the S3 logging bucket that access logs will be saved to."
  value       = "${aws_s3_bucket.logs.id}"
}

output "cloudfront_distribution_id" {
  description = "The ID of the CloudFront Distribution."
  value       = "${aws_cloudfront_distribution.website.id}"
}

output "cloudfront_distribution_hostname" {
  description = "The hostname of the CloudFront Distribution (use for DNS CNAME)."
  value       = "${aws_cloudfront_distribution.website.domain_name}"
}

output "cloudfront_zone_id" {
  description = "The Zone ID of the CloudFront Distribution (use for DNS Alias)."
  value       = "${aws_cloudfront_distribution.website.hosted_zone_id}"
}
