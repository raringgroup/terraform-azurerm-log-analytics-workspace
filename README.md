# terraform-azurerm-log-analytics-workspace

Creates a Log Analytics workspace and, optionally, a workspace-based Application Insights component, both named through the Raring Group context module.

Part of the [Raring Group](https://github.com/raringgroup) Terraform module library.

## Usage

```hcl
module "log_analytics" {
  source = "git::https://github.com/raringgroup/terraform-azurerm-log-analytics-workspace.git?ref=v0.1.0"

  context = module.context.self

  application_type            = "web"
  daily_quota_gb              = -1
  enable_application_insights = true
  internet_ingestion_enabled  = true
  internet_query_enabled      = true
  location                    = azurerm_resource_group.this.location
  resource_group_name         = azurerm_resource_group.this.name
  retention_in_days           = 30
  sku                         = "PerGB2018"
}
```

Naming and tagging come from [`terraform-null-context`](https://github.com/raringgroup/terraform-null-context). Add `_context.tf` to the calling configuration and pass `context = module.context.self`.

See [`examples/`](examples/) for complete, runnable configurations.

### Terragrunt

```hcl
terraform {
  source = "git::https://github.com/raringgroup/terraform-azurerm-log-analytics-workspace.git?ref=v0.1.0"
}

dependency "resource_group" {
  config_path = "../resource-group"
}

inputs = {
  enabled     = true
  namespace   = "<namespace>"
  environment = "<environment>"
  stage       = "<stage>"
  name        = "<name>"

  application_type            = "web"
  daily_quota_gb              = -1
  enable_application_insights = true
  internet_ingestion_enabled  = true
  internet_query_enabled      = true
  location                    = dependency.resource_group.outputs.location
  resource_group_name         = dependency.resource_group.outputs.name
  retention_in_days           = 30
  sku                         = "PerGB2018"
}
```

## Design notes

The module uses `azurerm_log_analytics_workspace` and `azurerm_application_insights` directly. The workspace name is limited to 63 characters, the Azure maximum. Naming and the enabled flag come from the context module. `_context.tf` declares the root context; it and the child contexts use `git::https://github.com/raringgroup/terraform-null-context.git?ref=v0.1.0`.

## Requirements, providers, inputs, outputs

### Requirements

| Name | Version |
|------|---------|
| terraform | `>= 1.3.0` |
| azurerm | `>= 4.0.0, < 5.0.0` |

### Inputs

All inputs are required (no defaults). Context inputs (`enabled`, `namespace`, `environment`, `stage`, `name`, `attributes`, `tags`, ...) are declared in `_context.tf`.

| Name | Type | Description |
|------|------|-------------|
| resource_group_name | `string` | Resource group for both resources |
| location | `string` | Azure region |
| sku | `string` | Workspace pricing tier (e.g. `PerGB2018`) |
| retention_in_days | `number` | Days workspace data is retained |
| daily_quota_gb | `number` | Daily ingestion cap in GB; `-1` is unlimited |
| internet_ingestion_enabled | `bool` | Accept ingestion over the public internet |
| internet_query_enabled | `bool` | Allow queries over the public internet |
| enable_application_insights | `bool` | Create the Application Insights component |
| application_type | `string` | Application Insights type (e.g. `web`) |

### Outputs

| Name | Description |
|------|-------------|
| workspace_id | Workspace resource ID (null when disabled) |
| workspace_name | Workspace name (null when disabled) |
| workspace_customer_id | Workspace customer ID (GUID) (null when disabled) |
| application_insights_id | Application Insights resource ID (null when disabled) |
| application_insights_name | Application Insights name (null when disabled) |
| application_insights_app_id | Application Insights application ID (null when disabled) |
| application_insights_connection_string | Connection string (sensitive; null when disabled) |

Workspace shared keys are deliberately not output.

## Versioning

Releases follow semantic versioning and are tagged `vX.Y.Z`. Pin `?ref=` to a tag.

## Contributing

Work happens on `develop` through feature branches and pull requests. See the Raring Group gitflow standards.

## License

Apache-2.0. See [LICENSE](LICENSE) and [NOTICE](NOTICE).

`_context.tf` is derived from Cloud Posse's [terraform-null-label](https://github.com/cloudposse/terraform-null-label).
