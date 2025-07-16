terraform {
  backend "s3" {
    bucket         = "kevindev-artifacts-bucket"
    key            = "terraform/k3s-infrastructure/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}