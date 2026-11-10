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
##  modules/log-analytics/log-analytics-workspace.tf
##
##  Log Analytics workspace named and tagged from the context module.
## ----------------------------------------------------------------------------

## Log Analytics Workspace Context
module "workspace_context" {
  source  = "git::https://github.com/raringgroup/terraform-null-context.git?ref=v0.1.0"
  context = module.context.self

  attributes      = ["log"]
  id_length_limit = 63
}


## Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "this" {
  count = module.workspace_context.enabled ? 1 : 0

  daily_quota_gb             = var.daily_quota_gb
  internet_ingestion_enabled = var.internet_ingestion_enabled
  internet_query_enabled     = var.internet_query_enabled
  location                   = var.location
  name                       = module.workspace_context.id
  resource_group_name        = var.resource_group_name
  retention_in_days          = var.retention_in_days
  sku                        = var.sku
  tags                       = module.workspace_context.tags
}
