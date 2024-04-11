#!/bin/bash

base_url="https://api.pipedrive.com/v1"
endpoints=("users" "deals" "persons" "notes" "products" "organizations" "activities" "activityfields" "activitytypes" "billing" "callLogs" "channels" "currencies" "DealFields" "deals" "files" "filters" "goals" "İtemSearch" "leads" "LeadLabels" "LeadSources" "LegacyTeams" "mailbox" "meetings" "NoteFields" "notes" "OrganizationFields" "OrganizationRelationShips" "organizations" "PermissionSets" "PersonFields" "persons" "pipelines" "ProductFields" "products" "projects" "ProjectTemplates" "recents" "roles" "stages" "subscriptions" "tasks" "UserConnections" "users" "UsersSettings")

# Read API tokens from token.txt file
api_tokens=$(<token.txt)

function make_api_request() {
  local api_token=$1
  local endpoint=$2
  local url="$base_url/$endpoint?api_token=$api_token"
  curl -s -X GET "$url"
}

function print_user_info() {
  local user_data=$1
  local user_count=$(echo "$user_data" | jq '.data | length')

  if [[ $user_count -eq 0 ]]; then
    echo "User not found."
    return
  fi

  echo "User Information:"
  echo "----------------------"

  for ((i=0; i<user_count; i++)); do
    username=$(echo "$user_data" | jq -r ".data[$i].name")
    email=$(echo "$user_data" | jq -r ".data[$i].email")
    phone=$(echo "$user_data" | jq -r ".data[$i].phone")
    echo "Username: $username"
    echo "Email: $email"
    echo "Phone: $phone"

    # Print API endpoints for each user
    echo "API Endpoints:"
    for endpoint in "${endpoints[@]}"; do
      echo " - $endpoint"
    done

    echo "----------------------"
  done
}

for api_token in $api_tokens; do
  user_response_data=$(make_api_request "$api_token" "users")
  print_user_info "$user_response_data"
done
