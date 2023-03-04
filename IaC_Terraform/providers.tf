terraform {
  required_providers {
    aws = {
      version = "4.0.0"
      source  = "hashicorp/aws"
    }
  }
  
  required_version = "1.3.7"

   backend "s3" {
    bucket = "frankelybucket"
    key = "global/s3/terraform.tfstate"
    region = "us-east-1"
  }

}

provider "aws"{
    region = var.aws_region
}
