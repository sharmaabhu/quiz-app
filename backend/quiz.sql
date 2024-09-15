CREATE TABLE topics (
    id INT AUTO_INCREMENT PRIMARY KEY,
    topic VARCHAR(255) NOT NULL
);

CREATE TABLE questions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    topic_id INT,
    level ENUM('Beginner', 'Intermediate', 'Professional'),
    question_text TEXT NOT NULL,
    answer1 TEXT NOT NULL,
    answer2 TEXT NOT NULL,
    answer3 TEXT NOT NULL,
    answer4 TEXT NOT NULL,
    correct_answer INT,
    FOREIGN KEY (topic_id) REFERENCES topics(id)
);

-- Sample topics
INSERT INTO topics (topic) VALUES ('Sports'), ('Science & Technology'), ('Arts'), ('Politics');

-- Sample questions (for simplicity)
INSERT INTO questions (topic_id, level, question_text, answer1, answer2, answer3, answer4, correct_answer) 
VALUES (1, 'Beginner', 'Who won the 2018 FIFA World Cup?', 'Brazil', 'Germany', 'France', 'Argentina', 3),
       (1, 'Intermediate', 'What is the national sport of Japan?', 'Football', 'Judo', 'Sumo', 'Karate', 3);
