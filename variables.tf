variable "repository_rulesets" {
  description = "A map of repository ruleset configurations"
  type = map(object({
    repository  = string
    name        = string
    target      = string
    enforcement = string
    conditions = optional(object({
      ref_name = object({
        include = optional(list(string), [])
        exclude = optional(list(string), [])
      })
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

  validation {
    condition = alltrue([
      for ruleset in var.repository_rulesets :
      contains(["branch", "tag"], ruleset.target) ?
      ruleset.conditions != null : 
      true
    ])
    error_message = "Conditions is required for `branch` and `tag` targets"
  }

  validation {
    condition = alltrue([
      for ruleset in var.repository_rulesets :
      contains(["push"], ruleset.target) ?
      ruleset.conditions == null : 
      true
    ])
    error_message = "Conditions should not be set for `push` targets"
  }
}