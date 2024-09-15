<?php
require_once 'vendor/autoload.php';

header('Content-Type: application/json');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

// Google OAuth client ID (replace with your client ID)
$client_id = '255243316489-gvb9oahfi61pmfu4kcqdu8p9hiimdma4.apps.googleusercontent.com';

// Get the POST data (the Google ID token)
$data = json_decode(file_get_contents("php://input"), true);
$token = $data['idToken'];

// Verify the ID token using Google API
$client = new Google_Client(['client_id' => $client_id]);
$payload = $client->verifyIdToken($token);

if ($payload) {
    // Token is valid, retrieve user info
    $userid = $payload['sub'];
    $email = $payload['email'];
    $name = $payload['name'];
    
    // (Optional) Check if the user already exists in your database
    // Here, you can add logic to register or log in the user.
    
    // Example response
    $response = [
        'success' => true,
        'user' => [
            'id' => $userid,
            'email' => $email,
            'name' => $name,
        ]
    ];
    echo json_encode($response);
} else {
    // Invalid token
    echo json_encode([
        'success' => false,
        'message' => 'Invalid Google token.'
    ]);
}
?>
