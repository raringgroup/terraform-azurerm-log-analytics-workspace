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
##  modules/log-analytics/examples/complete/log-analytics.tf
##
##  Creates a resource group, a Log Analytics workspace and a workspace-based
##  Application Insights component.
## ----------------------------------------------------------------------------

## Resource Group
module "resource_group" {
  source  = "../../../resource-group"
  context = module.context.self

  location = var.region
}


## Log Analytics
module "log_analytics" {
  source  = "../../"
  context = module.context.self

  application_type            = "web"
  daily_quota_gb              = -1
  enable_application_insights = true
  internet_ingestion_enabled  = true
  internet_query_enabled      = true
  location                    = module.resource_group.location
  resource_group_name         = module.resource_group.name
  retention_in_days           = 30
  sku                         = "PerGB2018"
}
