resource "kubernetes_storage_class" "this" {
  metadata {
    name = "ebs-csi"
  }
  storage_provisioner = "ebs.csi.aws.com"
}

# An example usage
resource "kubernetes_persistent_volume_claim" "this" {
  metadata {
    name = "nginx-pvc"
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "3Gi"
      }
    }
    storage_class_name = kubernetes_storage_class.this.metadata[0].name
  }
}

resource "kubernetes_pod" "test" {
  metadata {
    name = "nginx"
  }
  spec {
    container {
      name = "nginx"
      image = "nginx:latest"
      volume_mount {
        name = "temp"
        mount_path = "/test"
      }
    }
    volume {
      name = "temp"
      persistent_volume_claim {
        claim_name = kubernetes_persistent_volume_claim.this.metadata[0].name
      }
    }
  }
}
