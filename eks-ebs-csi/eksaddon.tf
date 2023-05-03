resource "aws_eks_addon" "this" {
  cluster_name = var.eks_cluster_name
  addon_name   = "aws-ebs-csi-driver"
  service_account_role_arn = aws_iam_role.this.arn
}
