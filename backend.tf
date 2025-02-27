terraform {
  backend "s3" {
    bucket = "terraform-state-bucket-test-2"
    key    = "terraform.tfstate"
    /*key = "dev/terraform.tfstate"*/
    region = "us-east-1"
    encrypt = true
    dynamodb_table = "terraform-lock-workspace" 
  }
}