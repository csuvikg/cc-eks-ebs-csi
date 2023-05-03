data "tls_certificate" "this" {
  url = data.aws_eks_cluster.this.identity.0.oidc.0.issuer
}

resource "aws_iam_openid_connect_provider" "this" {
  url             = data.aws_eks_cluster.this.identity[0].oidc[0].issuer
  client_id_list  = ["sts.amazonaws.com"]
  thumbprint_list = [data.tls_certificate.this.certificates[0].sha1_fingerprint]
}

resource "aws_eks_identity_provider_config" "demo" {
  cluster_name = var.eks_cluster_name
  oidc {
    client_id                     = substr(data.aws_eks_cluster.this.identity.0.oidc.0.issuer, -32, -1)
    identity_provider_config_name = "oidc"
    issuer_url                    = "https://${local.oidc_provider_url}"
  }
}
