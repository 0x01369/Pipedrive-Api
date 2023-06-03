<?php

$api_token = "null";
$api_url = "https://api.pipedrive.com/v1/users?api_token=" . $api_token;

// Get users with API request
$response_data = file_get_contents($api_url);

// Check if the response is empty
if (empty($response_data)) {
    echo "Could not get a valid response from the API.";
    exit(1);
}

$response_data = json_decode($response_data, true);

// Operations that extract user information
$user_count = count($response_data['data']);
if ($user_count == 0) {
    echo "User not Found.";
    exit(0);
}

echo "User İnformation:";
echo "----------------------";

for ($i = 0; $i < $user_count; $i++) {
    $username = $response_data['data'][$i]['name'];
    $email = $response_data['data'][$i]['email'];

    echo "----------------------";
    echo "User name: $username";
    echo "E-Mail: $email";
    echo "----------------------";
}
?>

