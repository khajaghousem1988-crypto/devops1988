provider "aws" {
  region  = var.aws_region
  profile = "devops1988"
  # profile {
  default_tags {
    tags = {
      Project     = var.project_name
      Environment = var.environment
      ManagedBy   = "Terraform"
      Owner       = "DevOps Team"
      # region      = var.aws_region     
    }
  }
}