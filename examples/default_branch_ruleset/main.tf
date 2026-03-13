module "default_branch_ruleset" {

  source = "../.."

  repository_rulesets = {
    "default_branch" = {
      repository  = "TODO_REPOSITORY"
      name        = "default_branch"
      target      = "branch"
      enforcement = "active"
      conditions = {
        ref_name = {}
      }
    }
  }
}