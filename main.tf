resource "github_repository_ruleset" "this" {
  for_each = var.repository_rulesets != null ? var.repository_rulesets : {}

  name        = each.value.name
  repository  = each.value.repository
  target      = each.value.target
  enforcement = each.value.enforcement

  dynamic "conditions" {
    for_each = each.value.conditions == null ? [] : [each.value.conditions]
    content {
      ref_name {
        include = conditions.value.ref_name.include
        exclude = conditions.value.ref_name.exclude
      }
    }
  }

  rules {

  }
}