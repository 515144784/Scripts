#
# EXAMPLE VARIABLES

# Service-Now App ID
variable "app_id" {
  type        = string
  description = "The Service-Now App ID"
  nullable    = false
}

# Application name as it appears in the project name
variable "app_name" {
  type        = string
  description = "The application name as it appears as part of the project name"
  nullable    = false
}
