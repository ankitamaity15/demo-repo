provider "snowflake" {
  account_name = var.snowflake_account
  user         = var.snowflake_user
  private_key  = var.snowflake_private_key
  role         = var.deployment_role
}
