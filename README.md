# GCP Database & Secrets

Useful links:

| Description                                | Link                                                                                                           |
|--------------------------------------------|----------------------------------------------------------------------------------------------------------------|
| Google Provider documentation              | https://registry.terraform.io/providers/hashicorp/google/latest                                                |
| Vault Provider documentation               | https://registry.terraform.io/providers/hashicorp/vault/latest                                                 |
| Random Provider documentation              | https://registry.terraform.io/providers/hashicorp/random/latest                                                |
| GCP IAM Console                            | https://console.cloud.google.com/iam-admin/iam                                                                 |
| Create a service account key in GCP IAM    | https://cloud.google.com/iam/docs/keys-create-delete#iam-service-account-keys-create-console                   |
| Vault Auth methods                         | https://developer.hashicorp.com/vault/docs/auth                                                                |
| Vault Authentication Configuration Options | https://registry.terraform.io/providers/hashicorp/vault/latest/docs#vault-authentication-configuration-options |

## Pre-requisites

### GCP authentication

A GCP Account with the `roles/cloudsql.admin` role is required.
This example assumes that the GCP account is correctly configured
with `gcloud auth login` & `gcloud auth application-default login`.

### Vault authentication

If your vault instance is configured with GCP authentication, no further configuration is necessary.
If it's not the cas, your may need to get a vault token , or to configure another authentication mechanism using the
provider configuration.
See [Vault Auth methods](https://developer.hashicorp.com/vault/docs/auth) for information on Vault authentication,
and [Vault Authentication Configuration Options](https://registry.terraform.io/providers/hashicorp/vault/latest/docs#vault-authentication-configuration-options)
for the associated configuration on the provider

## Running the code

This code manages a network with 3 subnets, an ubuntu instance on each subnet, and a HTTP load-balancer forwarding
requests to the instances.

In order to use this code on an existing network, replace the contents of the `networks.tf` file with `datasource` blocs
for your own network configuration.

### Inputs

| Name                                                                                         | Description                                        | Type     | Default          | Required |
|----------------------------------------------------------------------------------------------|----------------------------------------------------|----------|------------------|:--------:|
| <a name="input_database_name"></a> [database\_name](#input\_database\_name)                  | the name of the database to create in the instance | `string` | n/a              |   yes    |
| <a name="input_database_tier"></a> [database\_tier](#input\_database\_tier)                  | the database tier to use                           | `string` | `"db-f1-micro"`  |    no    |
| <a name="input_database_user_name"></a> [database\_user\_name](#input\_database\_user\_name) | the name of the database user to create            | `string` | n/a              |   yes    |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name)                  | the name of the database instance to create        | `string` | n/a              |   yes    |
| <a name="input_region"></a> [region](#input\_region)                                         | the GCP region to deploy the database to           | `string` | `"europe-west9"` |    no    |

### Outputs

| Name                                                                                        | Description                  |
|---------------------------------------------------------------------------------------------|------------------------------|
| <a name="output_database_dns_name"></a> [database\_dns\_name](#output\_database\_dns\_name) | the DNS name of the instance |
