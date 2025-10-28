# External DNS configs
resource "aws_iam_policy" "external_dns" {
  name        = "external-dns-policy"
  description = "Allow external-dns on K8s to manage Route 53 records"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "route53:ChangeResourceRecordSets"
        ]
        Resource = "arn:aws:route53:::hostedzone/${var.aws_r53_zone_id}"
      },
      {
        Effect = "Allow"
        Action = [
          "route53:ListHostedZones",
          "route53:ListResourceRecordSets",
          "route53:GetChange"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_user" "external_dns" {
  name = "external-dns-aks"
  path = "/automation/"
}

resource "aws_iam_user_policy_attachment" "external_dns" {
  user       = aws_iam_user.external_dns.name
  policy_arn = aws_iam_policy.external_dns.arn
}

resource "aws_iam_access_key" "external_dns" {
  user = aws_iam_user.external_dns.name
}

