locals {
  oidc_provider_url = replace(aws_iam_openid_connect_provider.this.url, "https://", "")
}
