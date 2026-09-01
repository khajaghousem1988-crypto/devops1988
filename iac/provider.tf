provider "aws" {
  region  = var.aws_region
  # region = eu-north-1
  profile = "devops1988"
  default_tags {
    tags = {
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "Terraform"
      Owner       = "DevOps Team"
      region      = var.aws_region     
    }
  }
}