variable "repository_rulesets" {
  description = "A map of repository ruleset configurations"
  type = map(object({
    repository_name = string
    target          = string
    enforcement     = string
    conditions = optional(object({
      ref_name = object({
        include = optional(list(string), [])
        exclude = optional(list(string), [])
      })
    }))
    bypass_actors = optional(object({
      actor_id    = optional(number)
      actor_type  = string
      bypass_mode = optional(string)
    }))
  }))
  default = {}

  # Validate ruleset enforcement is set to one of 'disabled', 'active' or 'evaluate'
  validation {
    condition = alltrue([
      for ruleset in var.repository_rulesets : contains(
        ["disabled", "active", "evaluate"],
        ruleset.enforcement
      )
    ])
    error_message = "All enforements must be set to 'disabled', 'active' or 'evaluate'"
  }

  # Validate ruleset target is set to one of 'branch', 'tag' or 'push'
  validation {
    condition = alltrue([
      for ruleset in var.repository_rulesets : contains(
        ["branch", "tag", "push"],
        ruleset.target
      )
    ])
    error_message = "All targets must be set to 'branch', 'tag' or 'push'"
  }

  # Validate that a conditions block is required for branch and tag targets
  validation {
    condition = alltrue([
      for ruleset in var.repository_rulesets :
      contains(["branch", "tag"], ruleset.target) ?
      ruleset.conditions != null :
      true
    ])
    error_message = "Conditions is required for `branch` and `tag` targets"
  }

  # Validate that no conditions block should be set for push targets
  validation {
    condition = alltrue([
      for ruleset in var.repository_rulesets :
      contains(["push"], ruleset.target) ?
      ruleset.conditions == null :
      true
    ])
    error_message = "Conditions should not be set for `push` targets"
  }

  # Validate that the actor_type is set to one of: RepositoryRole, Team Integration, OrganizationAdmin or DeployKey
  validation {
    condition = alltrue([
      for ruleset in var.repository_rulesets :
      ruleset.bypass_actors == null || ruleset.bypass_actors.actor_type ==
      null ? true :
      contains(["RepositoryRole", "Team", "Integration", "OrganizationAdmin", "DeployKey"],
      ruleset.bypass_actors.actor_type)
    ])

    error_message = "actor_type should be one of: RepositoryRole, Team, Integration, OrganizationAdmin, DeployKey"
  }

  # Validate that bypass_mode is one of: always, pull_request or bypass_mode
  validation {
    condition = alltrue([
      for ruleset in var.repository_rulesets :
      ruleset.bypass_actors == null || ruleset.bypass_actors.bypass_mode == null ? true :
      contains(["always", "pull_request", "exempt"],
      ruleset.bypass_actors.bypass_mode)
    ])

    error_message = "bypass_mode should be one of: always, pull_request or exempt"
  }
}