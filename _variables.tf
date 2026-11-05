## ----------------------------------------------------------------------------
## Copyright 2026 Raring Group LLC
##
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
##
##     http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.
## ----------------------------------------------------------------------------
##
##  modules/log-analytics/_variables.tf
##
##  Input variables for the Log Analytics and Application Insights module.
## ----------------------------------------------------------------------------

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group that holds the workspace and Application Insights"
}

variable "location" {
  type        = string
  description = "Azure region where the workspace and Application Insights are created"
}

variable "sku" {
  type        = string
  description = "Log Analytics workspace pricing tier (e.g. PerGB2018)"
}

variable "retention_in_days" {
  type        = number
  description = "Number of days workspace data is retained"
}

variable "daily_quota_gb" {
  type        = number
  description = "Daily ingestion cap of the workspace in GB; -1 means unlimited"
}

variable "internet_ingestion_enabled" {
  type        = bool
  description = "Whether the workspace accepts ingestion over the public internet"
}

variable "internet_query_enabled" {
  type        = bool
  description = "Whether the workspace can be queried over the public internet"
}

variable "enable_application_insights" {
  type        = bool
  description = "Whether to create a workspace-based Application Insights component"
}

variable "application_type" {
  type        = string
  description = "Application Insights application type (e.g. web, java, Node.JS, other)"
}
