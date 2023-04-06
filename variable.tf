variable "Nrql_alert_condition_data" {
     type =map(object({
     type                        =string
     name                        =string 
     description                 =string
     runbook_url                 =string
     violation_time_limit_seconds=number
     aggregation_method          =string
     slide_by                    =number
     baseline_direction          =number
     query                       =string
     critical_operator           =string
     critical_threshold          =number
     critical_threshold_duration=number
     crirtical_threshold_occurrences=string
     warning_operator            =string
     warning_threshold           =number
     warning_threshold_duration  =number
     warning_threshold_occurrences=string
     }))
}

variable "policy_id" {
  type=string
}