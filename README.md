## EKS EBS CSI driver workshop
Materials for the EKS EBS CSI driver workshop
### Intro
There are two terraform modules in the repository:
 - `eks-prerequirements` creates the cluster role and the node role in case it is required (eg. manual creation of EKS cluster)
 - `eks-ebs-csi` creates the required resources to allow EBS CSI driver for an existing EKS cluster
   - Enables the EBS CSI driver plugin in the cluster, see `eksaddon.tf`
   - Creates an OIDC provider, see `oidc.tf`
   - Creates a role for the EBS CSI driver, see `iam.tf`
   - Creates a storage class and an example pod, see `kubernetes.tf`

### eks-ebs-csi
Make sure you update the cluster name in the `terraform.tfvars` and that you configure your AWS provider correctly in `providers.tf`
