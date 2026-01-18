

data "aws_iam_policy_document" "allow" {
  statement {
    sid       = "s3ListBucket"
    actions   = ["s3:ListBucket"]
    effect    = "Allow"
    resources = [aws_s3_bucket.state.arn]
  }

  statement {
    sid       = "s3Object"
    actions   = ["s3:PutObject", "s3:GetObject", "s3:DeleteObject"]
    effect    = "Allow"
    resources = [aws_s3_bucket.state.arn]
  }
}

resource "aws_iam_policy" "terraform-state-policy" {
  name   = "${var.project_name}-terraform-state-policy"
  policy = data.aws_iam_policy_document.allow.json
}

