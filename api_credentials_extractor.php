<?php

$api_token = "null";
$base_url = "https://api.pipedrive.com/v1";
$endpoints = array("users", "deals", "persons", "notes", "products", "organizations");

function make_api_request($endpoint) {
    global $base_url, $api_token;
    $url = "$base_url/$endpoint?api_token=$api_token";
    return file_get_contents($url);
}

function print_user_info($user_data) {
    $user_data = json_decode($user_data, true);
    $user_count = count($user_data["data"]);

    if ($user_count === 0) {
        echo "User not found.\n";
        exit(0);
    }

    echo "User information:\n";
    echo "----------------------\n";

    for ($i = 0; $i < $user_count; $i++) {
        $username = $user_data["data"][$i]["name"];
        $email = $user_data["data"][$i]["email"];
        $phone = $user_data["data"][$i]["phone"];
        echo "User name: $username\n";
        echo "E-Mail: $email\n";
        echo "Phone: $phone\n";
        echo "----------------------\n";
    }
}

foreach ($endpoints as $endpoint) {
    $response_data = make_api_request($endpoint);

    if (empty($response_data)) {
        echo "Could not get a valid response from the API.\n";
        exit(1);
    }

    echo "API request result ($endpoint):\n";
    echo "----------------------\n";
    echo "$response_data\n";
    echo "----------------------\n";
}

$user_response_data = make_api_request("users");
print_user_info($user_response_data);

?>
