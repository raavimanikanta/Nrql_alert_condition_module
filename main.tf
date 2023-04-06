resource "newrelic_nrql_alert_condition" "foo" {
  # for_each={for i,data in var.condition_name_querydata: i => data}    // {for i, v in var.tenants:  i => v}
  for_each=var.Nrql_alert_condition_data
  type                         = each.value.type
  account_id                   = each.value.Account_id
  name                         = each.value.name
  policy_id                    = var.policy_id
  description                  = each.value.description
#   enabled                      = true
  runbook_url                  = each.value.runbook_url
  violation_time_limit_seconds = each.value.violation_time_limit_seconds
  aggregation_method           = each.value.aggregation_method
  aggregation_delay            = each.value.aggregation_delay
  slide_by                     = each.value.slide_by

  # baseline type only
  baseline_direction = each.vaue.baseline_direction

  nrql {
    Nrql=each.value.query
    # query = "SELECT percentile(duration, 95) FROM Transaction WHERE appName = 'FoodMe'"
  }

  critical {
    operator              = each.value.critical_operator
    threshold             = each.value.critical_threshold
    threshold_duration    = each.value.critical_threshold_duration
    threshold_occurrences = each.value.crirtical_threshold_occurrences
  }

  warning {
    operator              = each.value.warning_operator
    threshold             = each.value.warning_threshold
    threshold_duration    = each.value.warning_threshold_duration
    threshold_occurrences = each.value.warning_threshold_occurences
  }
}