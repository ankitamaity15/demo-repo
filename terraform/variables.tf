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
