terraform {
  required_version = ">= 1.6.0"
 
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 2.0"
    }
  }
 
  backend "s3" {
    bucket         = "company-terraform-state"
    key            = "snowflake/platform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "company-terraform-locks"
    encrypt        = true
  }
}
