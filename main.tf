/**
 * # Catosplace GitHub Ruleset Module
 * 
 * TODO: Write description here!!!
 */
resource "github_repository_ruleset" "this" {
  for_each = var.repository_rulesets != null ? var.repository_rulesets : {}

  name        = each.key
  repository  = each.value.repository_name
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

  dynamic "bypass_actors" {
    for_each = each.value.bypass_actors == null ? [] : [each.value.bypass_actors]
    content {
      actor_id    = bypass_actors.value.actor_id
      actor_type  = bypass_actors.value.actor_type
      bypass_mode = bypass_actors.value.bypass_mode
    }
  }

  rules {

  }
}