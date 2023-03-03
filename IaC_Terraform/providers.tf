terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.1.0"
    }
  }

   backend "s3" {
    bucket = "frankelybucket"
    key = "global/s3/terraform.tfstate"
    region = "us-east-1"
  }

}
