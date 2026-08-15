terraform {
    backend "s3" {
        bucket = "devops-1988"
        key    = "terraform.tfstate"
        region = "eu-north-1"
        dynamodb_table = "terraform-state-lock-devops1988"
        encrypt = true
    }
} 