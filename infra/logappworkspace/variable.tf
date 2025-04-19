variable "resource_group_name" {}
variable "location" {}

variable "workspace_name" {}
variable "la_sku" {
  default = "PerGB2018"
}
variable "retention_in_days" {
  default = 30
}

variable "app_insights_name" {}
variable "application_type" {
  default = "web"
}
