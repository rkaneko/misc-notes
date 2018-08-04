Terraform notes
===

 Configuration files describe to Terraform the components needed to run a single application or your entire datacenter. (Reference [What is Terraform?](https://www.terraform.io/intro/index.html#what-is-terraform-))

 Terraform can manage following components.

- low-level components
  - compute instances
  - storage
  - networking
- high-level components
  - DNS entries
  - SaaS features

 Terraform provides a flexible abstraction of resources and providers. This allows us to represent configuration for physical hardware, virtual machines, and containers, to email and DNS providers.

 Terraform **separates the planning phase from the execution phase** explicitly.  This feature can decrease operators' anxiety to execute the plan to the production infrastructure.

 Using **terraform graph**, the plan can be visualized to show dependent ordering.

 Terraform provides **a high level syntax for describing how cloud resources and services should be created, provisioned, and combined**.

 Terraform uses [hcl (HashiCorp configuration language)](https://github.com/hashicorp/hcl) which is both human and machine friendly for use with CLI tools especially targeted towards DevOps tools, servers.


## [vs. Other](https://www.terraform.io/intro/vs/index.html)

### vs. Chef, Puppet

 Terraform focuses on the higher-level abstraction of the datacenter and associated services, without sacrificing the ability to use configuration management tools (e.g. Chef, Ansible).

### vs. CloudFormation, Heat, etc

- Cloud agnostic unified syntax
- Can provide configuration which needs combined infrastructure using multiple providers and services
- **Separates planning phase from the execution phase**
  - **Generate action plan before executing**
  - This feature can decrease operators' anxiety to apply the plan to the production infrastructure and provide confidence to change
- Visualize dependencies ordering using terraform graph


By running terraform plan, the current state is refreshed and the configuration is consulted to **generate an action plan**. The plan includes all actions to be taken: which resources will be created, desctroyed or modified. **It can be inspected by operators to ensure it is exactly what s expected**.


### vs. Boto, Fog, etc

- is not intended to give low-level **programmatic** access to providers, but instead provides **a high level syntax for describing how cloud resources and services shoud be created, provisioned, and combined**.

- plugin-based model to support providers and provisioners

## [Multi-Tier Applications](https://www.terraform.io/intro/use-cases.html#multi-tier-applications)

 N-tier architecture pattern is commonly used in the world.

e.g.

- Database tier
- API servers
- Canching servers
- Routing servers

 Using terraform

- can describe each tier as a collection of resources
- can handle automatically dependencies between each tier

e.g.

 Terraform will ensure the database tier is available before the web servers are started and that the load balancers are aware f the web nodes.

## [Self-Service Clusters](https://www.terraform.io/intro/use-cases.html#self-service-clusters)

 It becomes very challenging for a centralized operations team to manage a large and growing infrastructure.
 Instead it becomes more attractive to make "self-serve" infrastructure, **allowing product teams to manage their own infrastructure using tooling provided vy the central operations team**.

## [Disposable Environments](https://www.terraform.io/intro/use-cases.html#disposable-environments)

 Terraform can help tame the difficulty of maitaining parallel environments (production and staging), and makes it practical to elastically create and destroy them.

## [Software Defined Networking](https://www.terraform.io/intro/use-cases.html#software-defined-networking)

 Software Defined Networking (SDN) provides more control to operators and developers and allows the network to better support the applications running on top.
 Most SDN implementations have a **control layer** and **infrastructure layer**.

 Terraform provides interface with the control layers of SDN implementations e.g. AWS VPC and can **version and change networking configuration**.

---
## [Workspaces]()

This was called `environment` in Terraform 0.9, however was changed to `workspace` considering comunity feedback.

Use-cases are following

- `production`, `staging`, `development`

## [Resource Configuration](https://www.terraform.io/docs/configuration/resources.html)

- The `resource` means a component of your infrastructure.
- Low level components
  - physical servers
  - virtual machines
  - containers
- High level components
  - email provider
  - DNS record
  - database provider

### Meta-parameters

- `count`
  - Partial resources (e.g. `aws_instance`) support this meta-parameters.
  - `${count.index}` means loop index.
  - (On 2018/08/02 situation) version <= 0.11 doesn't support `count` in `module`. [#953](https://github.com/hashicorp/terraform/issues/953)
  - Using `count` and map type variables, we can express loop-ish resource handling.
  - If `count = 0`, the resource will not be created.
  - In terraform, boolean value is converted to 0 or 1.
  - https://blog.gruntwork.io/terraform-tips-tricks-loops-if-statements-and-gotchas-f739bbae55f9
- `lifecycle`
  - If you don't want to destory some resources, add `prevent_destroy = true`. e.g. `aws_route53`.

## [Data Sources](https://www.terraform.io/docs/configuration/data-sources.html)

- Use too define information outside of Terraform, or defined by another separate Terraform configuration(not including module).
  - e.g. Predefined AWS EC2 instance

## Tips



## FAQ

- Q: How do we use `terraform plan` option `-target` for modules?
- A: Consider [Resource Addressing](https://www.terraform.io/docs/internals/resource-addressing.html).

```bash
$ tree -d
.
`-- modules
    |-- acm
    |-- acm_validation
    |-- route53
    `-- s3

# show the plan for acm module
$ terraform plan -target=module.acm

$ cat modules/acm
resource "aws_acm_certificate" "cert" {
  domain_name       = "${var.domain_name}"
  validation_method = "DNS"
}

# show the plan for acm module 'cert' resource
$ terraform plan -target=module.acm.aws_acm_certificate.cert
```

- Q: How do we use `terraform output` option `-module` for modules?
- A: Just use the module name of the target.

```bash
$ terraform output -module=s3
```
