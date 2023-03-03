terraform {
  required_version = ">=0.14.9"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.27"
    }
  }

   backend "s3" {
    bucket = "frankelybucket"
    key = "global/s3/terraform.tfstate"
    region = "us-east-1"
  }

}

provider "aws"{
    version = "~>3.0"
    region = var.aws_region
}
