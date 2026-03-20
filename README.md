<!-- BEGIN_TF_DOCS -->
# Catosplace GitHub Ruleset Module

TODO: Write description here!!!

## Providers

| Name | Version |
|------|---------|
| <a name="provider_github"></a> [github](#provider\_github) | ~> 6.11.1 |

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_github"></a> [github](#requirement\_github) | ~> 6.11.1 |

## Example

```hcl
module "default_branch_ruleset" {

  source = "../.."

  repository_rulesets = {
    "default_branch_ruleset" = {
      repository_name = "TODO_REPOSITORY"
      target          = "branch"
      enforcement     = "active"
      conditions = {
        ref_name = {}
      }
    }
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_repository_rulesets"></a> [repository\_rulesets](#input\_repository\_rulesets) | A map of repository ruleset configurations | <pre>map(object({<br/>    repository_name = string<br/>    target          = string<br/>    enforcement     = string<br/>    conditions = optional(object({<br/>      ref_name = object({<br/>        include = optional(list(string), [])<br/>        exclude = optional(list(string), [])<br/>      })<br/>    }))<br/>    bypass_actors = optional(object({<br/>      actor_id    = optional(number)<br/>      actor_type  = string<br/>      bypass_mode = optional(string)<br/>    }))<br/>  }))</pre> | `{}` | no |

## Outputs

No outputs.

## Terraform Docs

This repository uses [terraform-docs](https://terraform-docs.io/) to generate module documentation. We use a custom `.terraform-docs.yml` configuration to include a header from `main.tf`, an examples section and a footer from `docs/footer.md`.

To regenerate the documentation use the basic `terraform-docs` command.

```bash
terraform-docs .
```

## ADRs

This repository uses Architecture Decision Records (ADRs) to document important technical and architectural decisions.

- ADR index: [docs/adr/index.md](docs/adr/index.md)
- New ADRs should be created with `adr`
- After creating or updating ADRs, regenerate the index
<!-- END_TF_DOCS -->