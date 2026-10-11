resource "google_data_catalog_entry_group_iam_member" "data_catalog_entry_group_iam_members" {
  for_each = var.data_catalog_entry_group_iam_members

  entry_group = each.value.entry_group
  member      = each.value.member
  role        = each.value.role
  project     = each.value.project
  region      = each.value.region

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

