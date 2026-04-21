terraform {
  backend "s3" {
    bucket         = "devops-bluegreen-tf-state-nit"
    key            = "dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock"
  }
}
