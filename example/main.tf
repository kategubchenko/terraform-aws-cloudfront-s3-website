provider "aws" {
  region = "us-east-1"
}


module "cloudfront_s3_website_without_domain" {
  source             = "../"
  domain_name        = "test-application-1232" // Any random identifier for s3 bucket name
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
