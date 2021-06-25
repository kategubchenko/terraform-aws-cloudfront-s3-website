provider "aws" {
  region = "eu-west-1"
}


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.45.0"
    }
  }
}


module "cloudfront_s3_website_without_domain" {
  source             = "../"
  domain_name        = "ape-application" // Any random identifier for s3 bucket name
  use_default_domain = true
  upload_sample_file = true
  tags               = var.tags
}

variable "tags" {
  default = {
    owner       = "a.penchuk@scalr.com"
    application = "sample"
  }
}

output "mod2_domain" {
  value = module.cloudfront_s3_website_without_domain.cloudfront_domain_name
}
