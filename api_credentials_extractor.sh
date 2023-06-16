#!/bin/bash

api_token="null"
base_url="https://api.pipedrive.com/v1"
endpoints=("users" "deals" "persons" "notes" "products" "organizations")


function make_api_request() {
  local endpoint=$1
  local url="$base_url/$endpoint?api_token=$api_token"
  curl -s -X GET "$url"
}


function print_user_info() {
  local user_data=$1
  local user_count=$(echo "$user_data" | jq '.data | length')

  if [[ $user_count -eq 0 ]]; then
    echo "User not found."
    exit 0
  fi

  echo "user information:"
  echo "----------------------"

  for i in $(seq 0 $(expr $user_count - 1)); do
    username=$(echo "$user_data" | jq -r ".data[$i].name")
    email=$(echo "$user_data" | jq -r ".data[$i].email")
    phone=$(echo "$user_data" | jq -r ".data[$i].phone")
    echo "User name: $username"
    echo "E-Mail: $email"
    echo "Phone: $phone"
    echo "----------------------"
  done
}


for endpoint in "${endpoints[@]}"; do
  response_data=$(make_api_request "$endpoint")

  if [[ -z "$response_data" ]]; then
    echo "Could not get a valid response from the API."
    exit 1
  fi

  echo "API request result ($endpoint):"
  echo "----------------------"
  echo "$response_data"
  echo "----------------------"
done


user_response_data=$(make_api_request "users")
print_user_info "$user_response_data"
