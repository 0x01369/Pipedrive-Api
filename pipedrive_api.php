<?php

$apiToken = 'd0cace5b73600aaf0309a64ac837e72e74a4827a';
$url = 'https://companydomain.pipedrive.com/v1/deals?api_token=' . $apiToken;

// Initialize cURL session
$ch = curl_init();

// Set the URL
curl_setopt($ch, CURLOPT_URL, $url);

// Set the request type to GET
curl_setopt($ch, CURLOPT_HTTPGET, true);

// Set to return the transfer as a string
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

// Execute the request
$response = curl_exec($ch);

// Check for errors
if (curl_errno($ch)) {
    echo 'Error: ' . curl_error($ch);
} else {
    // Process and print the response
    echo $response;
}

// Close cURL session
curl_close($ch);

?>
