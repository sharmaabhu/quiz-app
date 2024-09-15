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

// Fetch questions from the database
$topic = isset($_GET['topic']) ? intval($_GET['topic']) : 1; // Default topic if not provided

// Query to fetch questions in the specified order
$sql = "
    (SELECT * FROM questions
    WHERE topic_id = ? AND level = 'Beginner'
    ORDER BY RAND()
    LIMIT 4)
    UNION ALL
    (SELECT * FROM questions
    WHERE topic_id = ? AND level = 'Intermediate'
    ORDER BY RAND()
    LIMIT 3)
    UNION ALL
    (SELECT * FROM questions
    WHERE topic_id = ? AND level = 'Professional'
    ORDER BY RAND()
    LIMIT 3)
";

$stmt = $conn->prepare($sql);

// Bind topic_id to the prepared statement
$stmt->bind_param('iii', $topic, $topic, $topic);

$stmt->execute();
$result = $stmt->get_result();

$questions = [];
while ($row = $result->fetch_assoc()) {
    $questions[] = $row;
}

// Close connection
$stmt->close();
$conn->close();

// Return questions as JSON
echo json_encode($questions);
?>
