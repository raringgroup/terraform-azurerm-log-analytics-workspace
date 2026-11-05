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
##  modules/log-analytics/_outputs.tf
##
##  Output values for the Log Analytics and Application Insights module.
## ----------------------------------------------------------------------------

output "workspace_id" {
  description = "Log Analytics workspace resource ID (null when disabled)"
  value       = try(azurerm_log_analytics_workspace.this[0].id, null)
}

output "workspace_name" {
  description = "Log Analytics workspace name (null when disabled)"
  value       = try(azurerm_log_analytics_workspace.this[0].name, null)
}

output "workspace_customer_id" {
  description = "Log Analytics workspace customer ID (GUID) (null when disabled)"
  value       = try(azurerm_log_analytics_workspace.this[0].workspace_id, null)
}

output "application_insights_id" {
  description = "Application Insights resource ID (null when disabled)"
  value       = try(azurerm_application_insights.this[0].id, null)
}

output "application_insights_name" {
  description = "Application Insights name (null when disabled)"
  value       = try(azurerm_application_insights.this[0].name, null)
}

output "application_insights_app_id" {
  description = "Application Insights application ID (null when disabled)"
  value       = try(azurerm_application_insights.this[0].app_id, null)
}

output "application_insights_connection_string" {
  description = "Application Insights connection string (null when disabled)"
  value       = try(azurerm_application_insights.this[0].connection_string, null)
  sensitive   = true
}
