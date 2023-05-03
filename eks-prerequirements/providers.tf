provider "aws" {
  region  = "eu-central-1"
  profile = "cc-devops-18"
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "arn:aws:eks:eu-central-1:085504592630:cluster/test"
}
