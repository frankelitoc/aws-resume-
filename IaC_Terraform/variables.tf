variable "aws_region" {
    type = string
    description = "AWS Region to deploy"
    default = "us-east-1"
}

variable "site_domain" {
    type = string
    description = "Site domain"
    default = "resume.madebyfrankely.com"
}

variable "mainsite_domain" {
    type = string
    description = "Site domains"
    default = "madebyfrankely.com"
}

variable "certificate_arn" {
    type = string
    description = "Certificate ARN"
    default = "arn:aws:acm:us-east-1:320964430417:certificate/85cdc1ea-c3a2-4484-80db-be294868d18f"
}