resource "aws_iam_group" "content_upload" {
  name = "WebsiteDevelopers"
}

resource "aws_iam_group_policy" "content_upload" {
  name  = "WebsiteDeveloperAccess"
  group = "${aws_iam_group.content_upload.id}"

  policy = "${data.aws_iam_policy_document.content_upload.json}"
}
