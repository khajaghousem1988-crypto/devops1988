provider "aws" {
 region = var.aws_region
 profile = "devops1988"
 default_tags {
    tags = {
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "Terraform"
      Owner       = "DevOps Team"
    }
 }  
}