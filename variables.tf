variable "data_catalog_entry_group_iam_members" {
  description = <<EOT
Map of data_catalog_entry_group_iam_members, attributes below
Required:
    - entry_group
    - member
    - role
Optional:
    - project
    - region
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    entry_group = string
    member      = string
    role        = string
    project     = optional(string)
    region      = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

