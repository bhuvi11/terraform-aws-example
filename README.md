# terraform-aws-example
Bridgecrew AWS ReadOnly Integration
Maintained by Bridgecrew.io GitHub tag (latest SemVer) Terraform Version Infrastructure Tests

Installation Options
This is a Terraform module that creates an Amazon Web Services (AWS) Read Only integration with Bridgecrew.

Starting fresh
This stack creates a role with a dedicated External ID which allows only authorized access from Bridgecrew's AWS account

Usage
Include module.readonly.tf in your existing Terraform code, and/or see example/examplea as your guide:

module "readonly" {
  source      = "bridgecrewio/bridgecrew-read-only/aws"
  version     = "v1.5.4"
  org_name    = "<your org name>"
  aws_profile = "<aws profile>"
  api_token   = var.api_token
}
The module requires that you set your Bridgecrew organisation name and the name of the AWS profile of the AWS account you want to attach Bridgecrew too.

The module expect the Bridgecrew platform API token to be supplied.

On Windows:

$env:TF_VAR_api_token="your-platform-token"
On *nix:

export TF_VAR_api_token="your-platform-token"
Or you can leave it blank to be prompted at your console.

Where do I get my Bridgecrew API token
get my API token

SSM example
In the examples folder you'll also find an example that drives this module but obtains the api_token from your AWS SSM parameter store. You'll have to add the variable there once yourself, but any future uses will obtain it without intervention.

aws ssm put-parameter --name /bridgecrew/api_token --value <your_token> --type SecureString
Secrets manager example
Also in the examples folder you'll find an example that drives this module but obtains the api_token, but this time from AWS secretsmanager.

aws secretsmanager create-secret --name /bridgecrew/api_token
aws secretsmanager put-secret-value --secret-id /bridgecrew/api_token --secret-string <your_token>
Where
This module is supported for deployment in the following AWS regions:

All US regions
eu-west-1
eu-central-1
ap-northeast-1
However, its functionality will work across all AWS regions.

Requirements
No requirements.

Providers
Name	Version
aws	3.26.0
null	3.0.0
random	3.0.1
Modules
No modules.

Resources
Name	Type
aws_iam_role.bridgecrew_account_role	resource
aws_iam_role_policy.bridgecrew_describe_policy	resource
aws_iam_role_policy_attachment.bridgecrew_cloud_formation	resource
aws_iam_role_policy_attachment.bridgecrew_security_audit	resource
null_resource.await_for_role_setup	resource
null_resource.create_bridgecrew	resource
null_resource.disconnect_bridgecrew	resource
null_resource.update_bridgecrew	resource
random_uuid.external_id	resource
aws_caller_identity.caller	data source
aws_iam_policy_document.bridgecrew_account_assume_role	data source
aws_iam_policy_document.bridgecrew_describe_policy_document	data source
aws_region.region	data source
Inputs
Name	Description	Type	Default	Required
account_alias	The alias of the account the CF is deployed in. This will be prepended to all the resources in the stack. Default is {org_name}-bc	string	""	no
api_token	This is your Bridgecrew platform Api token Set as and Environment variable TF_VAR_api_token	string	n/a	yes
aws_profile	The profile that was used to deploy this module. If the default profile / default credentials are used, seet this value to null.	string	n/a	yes
bridgecrew_account_id	The Bridgecrew AWS account ID from which scans will originate. This value should not typically be modified, but is provided here to support testing and troubleshooting, if needed.	string	"890234264427"	no
common_tags	Implements the common tags scheme	map(any)	
{
  "integration": "bridgecrew-aws-readonly",
  "module": "terraform-aws-bridgecrew-read-only"
}
no
org_name	The name of the company the integration is for. Must be alphanumeric.	string	n/a	yes
role_name	The name for the Bridgecrew read-only IAM role.	string	""	no
topic_name	The name of the SNS topic for Bridgecrew to receive notifications. This value should not typically be modified, but is provided here to support testing and troubleshooting, if needed.	string	"handle-customer-actions"	no
Outputs
Name	Description
customer_name	The customer name as defined on Bridgecrew signup
message	n/a
role	The cross-account access role for Bridgecrew
role_arn	The cross-account access role ARN for Bridgecrew
role_name	n/a
topic	The SNS endpoint that enabled the account
Related Projects
Check out these related projects.

terraform-aws-bridgecrew-remediation
Help
Got a question?

File a GitHub issue.

Contributing
Bug Reports & Feature Requests
Please use the issue tracker to report any bugs or file feature requests.

Copyrights
Copyright © 2020-2021 Bridgecrew

License
License

See LICENSE for full details.

Licensed to the Apache Software Foundation (ASF) under one or more contributor license agreements. See the NOTICE file distributed with this work for additional information regarding copyright ownership. The ASF licenses this file to you under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
