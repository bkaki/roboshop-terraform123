terraform {
  backend "s3" {
    bucket = "terraform-b31"
    key    = "roboshop/dev/terraform.tfstate"
    region = "us-east-1"
  }
}