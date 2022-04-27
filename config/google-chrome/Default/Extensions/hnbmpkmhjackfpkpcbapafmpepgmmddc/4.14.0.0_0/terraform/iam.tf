data "aws_iam_policy_document" "sts" {
  statement {
    effect = "Allow"
    actions = [
      "sts:AssumeRole",
      "sts:TagSession"
    ]
    principals {
      identifiers = ["arn:aws:iam::${module.hl.envs.org_account}:root"]
      type        = "AWS"
    }
  }
}

data "aws_iam_policy_document" "extension" {
  statement {
    effect = "Allow"
    actions = [
      "s3:PutObject",
      "s3:PutObjectAcl"
    ]
    resources = ["${data.aws_s3_bucket.extension.arn}/*"]
  }
}

resource "aws_iam_role" "extension" {
  name               = join("-", [local.project, "legacy"])
  assume_role_policy = data.aws_iam_policy_document.sts.json
  path               = "/github/"
  tags               = local.tags
}

resource "aws_iam_policy" "extension" {
  name   = join("-", [local.project, "legacy"])
  policy = data.aws_iam_policy_document.extension.json
  tags   = local.tags
}

resource "aws_iam_role_policy_attachment" "extension" {
  role       = aws_iam_role.extension.name
  policy_arn = aws_iam_policy.extension.arn
}
