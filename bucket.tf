terraform {
  backend "s3" {
    bucket = "tharwat-bucket"
    key    = "myapp/terraform.tfstate"
    region = "us-east-1"
  }
}
