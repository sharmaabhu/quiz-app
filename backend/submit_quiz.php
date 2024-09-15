<?php
header('Content-Type: application/json');

// Allow from any origin
header("Access-Control-Allow-Origin: *");

// Allow specific methods (GET, POST, OPTIONS)
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");

// Allow specific headers
header("Access-Control-Allow-Headers: Content-Type, Authorization");

// Handle preflight OPTIONS request
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {
    exit(0);  // Just exit the script for preflight request
}

// Check if the request method is POST
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    echo json_encode(['error' => 'Invalid request method']);
    exit();
}

// Get the POST data (the answers submitted by the user)
$data = json_decode(file_get_contents('php://input'), true);

if (!isset($data['answers']) || !is_array($data['answers'])) {
    echo json_encode(['error' => 'Invalid or missing answers']);
    exit();
}

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

$score = 0;  // Initialize the score

// Loop through each submitted answer
foreach ($data['answers'] as $questionId => $selectedAnswer) {
    // Fetch the correct answer from the database
    $sql = "SELECT correct_answer FROM questions WHERE id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param('i', $questionId);
    $stmt->execute();
    $result = $stmt->get_result();
    $row = $result->fetch_assoc();

    if ($row) {
        // Compare the selected answer with the correct answer
        if ($selectedAnswer == ($row['correct_answer'] - 1)) {
            $score++;  // Increase score if the answer is correct
        }
    }

    $stmt->close();
}

// Close the connection
$conn->close();

// Return the score as JSON
echo json_encode(['score' => $score]);

?>
