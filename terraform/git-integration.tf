resource "snowflake_database" "admin" {
  name    = "${var.environment}_ADMIN_DB"
  comment = "Administrative database for ${var.environment}"
}
 
resource "snowflake_schema" "integrations" {
  database = snowflake_database.admin.name
  name     = "INTEGRATIONS"
}
 
resource "snowflake_secret_with_password" "github" {
  name        = "${var.environment}_GITHUB_SECRET"
  database    = snowflake_database.admin.name
  schema      = snowflake_schema.integrations.name
  secret_type = "PASSWORD"
  username    = "github-actions"
  password    = var.github_token
}
 
resource "snowflake_api_integration" "github" {
  name                 = "${var.environment}_GITHUB_API_INTEGRATION"
  api_provider         = "git_https"
  api_allowed_prefixes = [var.github_repository_url]
  enabled              = true
}
 
resource "snowflake_git_repository" "repository" {
  name            = "${var.environment}_GITHUB_REPO"
  database        = snowflake_database.admin.name
  schema          = snowflake_schema.integrations.name
  origin          = var.github_repository_url
  api_integration = snowflake_api_integration.github.name
  git_credentials = snowflake_secret_with_password.github.fully_qualified_name
}
