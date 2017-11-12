data "aws_iam_policy_document" "content_upload" {
  statement {
    sid    = "AllowS3WebsiteWriteAccessCurrentUser"
    effect = "Allow"

    principals {
      type = "AWS"

      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/$${aws:username}",
      ]
    }

    actions = [
      "s3:DeleteObject",
      "s3:DeleteObjectTagging",
      "s3:Get*",
      "s3:PutObject",
      "s3:PutObjectAcl",
      "s3:PutObjectTagging",
      "s3:RestoreObject",
    ]

    resources = [
      "arn:aws:s3:::${module.website.s3_bucket_name}/*",
    ]
  }

  statement {
    sid    = "AllowS3WebsiteBucketAccessCurrentUser"
    effect = "Allow"

    principals {
      type = "AWS"

      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:user/$${aws:username}",
      ]
    }

    actions = [
      "s3:ListBucket",
      "s3:ListBucketVersions",
    ]

    resources = [
      "arn:aws:s3:::${module.website.s3_bucket_name}",
    ]
  }
}
