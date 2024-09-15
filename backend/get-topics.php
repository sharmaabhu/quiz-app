<?php
header('Content-Type: application/json');

// Allow from any origin
header("Access-Control-Allow-Origin: *");

// Allow specific methods (GET, POST, OPTIONS)
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");

// Allow specific headers
header("Access-Control-Allow-Headers: Content-Type, Authorization");

// Database connection parameters
$host = 'localhost'; // or your database host
$db = 'quiz-app'; // your database name
$user = 'root'; // your database username
$pass = ''; // your database password

// Create connection
$conn = new mysqli($host, $user, $pass, $db);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Fetch topics from the database
$sql = "SELECT id, topic FROM topics";
$result = $conn->query($sql);

$topics = [];
while ($row = $result->fetch_assoc()) {
    $topics[] = $row;
}

// Close connection
$conn->close();

// Return topics as JSON
echo json_encode($topics);
?>
