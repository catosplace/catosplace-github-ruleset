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