#!/bin/bash

api_token="null"
api_url="https://api.pipedrive.com/v1/users?api_token=$api_token"

# API request fetching users
response_data=$(curl -s -X GET "$api_url")

# Checking if the response is empty
if [[ -z "$response_data" ]]; then
    echo "Could not get a valid response from the API."
    exit 1
fi

# Operations that extract user information
user_count=$(echo "$response_data" | jq '.data | length')
if [[ $user_count -eq 0 ]]; then
    echo "User not found."
    exit 0
fi

echo "User information:"
echo "----------------------"

for i in $(seq 0 $(expr $user_count - 1)); do
    username=$(echo "$response_data" | jq -r ".data[$i].name")
    email=$(echo "$response_data" | jq -r ".data[$i].email")

    echo "User name: $username"
    echo "E-Mail: $email"
    echo "----------------------"
done

