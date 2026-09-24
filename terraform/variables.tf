variable "snowflake_account" {
  type        = string
  description = "Snowflake account identifier"
}
 
variable "snowflake_user" {
  type        = string
  description = "Terraform service user"
}
 
variable "snowflake_private_key" {
  type      = string
  sensitive = true
}
 
variable "deployment_role" {
  type        = string
  description = "Role used by Terraform"
}
 
variable "environment" {
  type = string
 
  validation {
    condition     = contains(["DEV", "TEST", "PROD"], var.environment)
    error_message = "Environment must be DEV, TEST, or PROD."
  }
}
 
variable "git_branch" {
  type = string
}
 
variable "github_repository_url" {
  type = string
}
 
variable "github_token" {
  type      = string
  sensitive = true
}

