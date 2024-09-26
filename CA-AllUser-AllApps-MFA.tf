data "azuread_client_config" "current" {}

#Policy name and state
resource "azuread_conditional_access_policy" "tfmfa01" {
  display_name = "CA-AllUsers-AllApps-MFA"
  state        = "enabledForReportingButNotEnforced"

  conditions {

    #Include all Client App Types
    client_app_types    = ["all"]

    #Apply to all Applications
    applications {
      included_applications = ["All"]
      excluded_applications = []
    }

    #Include All Users Group and All Guests
    users {
      included_users = ["All"]
        
      }
    }
  
  #Grant Controls set to enforce MFA
  grant_controls {
    operator          = "OR"
    built_in_controls = ["mfa"]
  }
}