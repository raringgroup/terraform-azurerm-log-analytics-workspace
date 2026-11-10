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
##  modules/log-analytics/examples/complete/_outputs.tf
##
##  Outputs of the example. The Application Insights connection string is a
##  sensitive module output and is not re-exported here.
## ----------------------------------------------------------------------------

output "workspace_id" {
  value = module.log_analytics.workspace_id
}

output "workspace_name" {
  value = module.log_analytics.workspace_name
}

output "workspace_customer_id" {
  value = module.log_analytics.workspace_customer_id
}

output "application_insights_id" {
  value = module.log_analytics.application_insights_id
}

output "application_insights_name" {
  value = module.log_analytics.application_insights_name
}

output "application_insights_app_id" {
  value = module.log_analytics.application_insights_app_id
}
