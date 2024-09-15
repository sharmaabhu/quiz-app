-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 14, 2024 at 08:15 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quiz-app`
--

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(11) NOT NULL,
  `topic_id` int(11) DEFAULT NULL,
  `level` enum('Beginner','Intermediate','Professional') DEFAULT NULL,
  `question_text` text NOT NULL,
  `answer1` text NOT NULL,
  `answer2` text NOT NULL,
  `answer3` text NOT NULL,
  `answer4` text NOT NULL,
  `correct_answer` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `topic_id`, `level`, `question_text`, `answer1`, `answer2`, `answer3`, `answer4`, `correct_answer`) VALUES
(3, 1, 'Beginner', 'Who won the 2018 FIFA World Cup?', 'Argentina', 'Brazil', 'Germany', 'France', 4),
(4, 1, 'Beginner', 'How many players are there in a football team?', '12', '10', '11', '9', 3),
(5, 1, 'Beginner', 'In which sport is the term \"home run\" used?', 'Baseball', 'Football', 'Basketball', 'Tennis', 1),
(6, 1, 'Beginner', 'Which country hosted the 2016 Summer Olympics?', 'Brazil', 'Japan', 'USA', 'UK', 1),
(7, 1, 'Intermediate', 'Which country has won the most FIFA World Cup titles?', 'Italy', 'Germany', 'Argentina', 'Brazil', 4),
(8, 1, 'Intermediate', 'Which sport is associated with Wimbledon?', 'Tennis', 'Cricket', 'Golf', 'Rugby', 1),
(9, 1, 'Intermediate', 'What is the length of a marathon race?', '21 km', '26.2 miles', '42 km', '30 miles', 3),
(10, 1, 'Professional', 'Who holds the record for the most home runs in MLB history?', 'Babe Ruth', 'Hank Aaron', 'Willie Mays', 'Barry Bonds', 4),
(11, 1, 'Professional', 'Which basketball player has the most NBA championship titles?', 'Michael Jordan', 'LeBron James', 'Bill Russell', 'Kobe Bryant', 3),
(12, 1, 'Professional', 'In what year was the first modern Olympic Games held?', '1892', '1900', '1896', '1904', 3),
(13, 2, 'Beginner', 'What is the chemical symbol for water?', 'H2O', 'O2', 'CO2', 'HO', 1),
(14, 2, 'Beginner', 'How many planets are there in the solar system?', '7', '9', '8', '10', 3),
(15, 2, 'Beginner', 'What is the closest planet to the Sun?', 'Mercury', 'Venus', 'Earth', 'Mars', 1),
(16, 2, 'Beginner', 'Who is known as the father of modern physics?', 'Galileo Galilei', 'Nikola Tesla', 'Isaac Newton', 'Albert Einstein', 4),
(17, 2, 'Intermediate', 'What is the speed of light?', '300,000 miles per second', '186,000 miles per second', '200,000 miles per second', '150,000 miles per second', 2),
(18, 2, 'Intermediate', 'What is the main gas found in the air we breathe?', 'Nitrogen', 'Oxygen', 'Carbon Dioxide', 'Hydrogen', 1),
(19, 2, 'Intermediate', 'Who invented the World Wide Web?', 'Steve Jobs', 'Elon Musk', 'Bill Gates', 'Tim Berners-Lee', 4),
(20, 2, 'Professional', 'What is the heaviest naturally occurring element?', 'Lead', 'Osmium', 'Uranium', 'Plutonium', 3),
(21, 2, 'Professional', 'What is the name of the first artificial satellite launched by the Soviet Union in 1957?', 'Sputnik 1', 'Luna 2', 'Vostok 1', 'Explorer 1', 1),
(22, 2, 'Professional', 'What particle is known as the \"God Particle\"?', 'Electron', 'Neutron', 'Proton', 'Higgs boson', 4),
(23, 3, 'Beginner', 'Who painted the Mona Lisa?', 'Leonardo da Vinci', 'Vincent van Gogh', 'Claude Monet', 'Pablo Picasso', 1),
(24, 3, 'Beginner', 'Which musical instrument has 88 keys?', 'Violin', 'Flute', 'Piano', 'Guitar', 3),
(25, 3, 'Beginner', 'Who wrote the play \"Romeo and Juliet\"?', 'Charles Dickens', 'William Shakespeare', 'George Orwell', 'Mark Twain', 2),
(26, 3, 'Beginner', 'What is the capital city of France, famous for its art?', 'Berlin', 'Rome', 'Paris', 'Madrid', 3),
(27, 3, 'Intermediate', 'Which artist is known for the painting \"The Starry Night\"?', 'Vincent van Gogh', 'Paul Cezanne', 'Michelangelo', 'Salvador Dali', 1),
(28, 3, 'Intermediate', 'Which movement was Pablo Picasso associated with?', 'Impressionism', 'Cubism', 'Surrealism', 'Baroque', 2),
(29, 3, 'Intermediate', 'What is the most famous ballet performed by Pyotr Tchaikovsky?', 'Romeo and Juliet', 'Swan Lake', 'The Nutcracker', 'Sleeping Beauty', 2),
(30, 3, 'Professional', 'In which city is the Louvre Museum located?', 'Paris', 'London', 'Rome', 'New York', 1),
(31, 3, 'Professional', 'What is the title of the famous painting by Edvard Munch?', 'Guernica', 'American Gothic', 'The Persistence of Memory', 'The Scream', 4),
(32, 3, 'Professional', 'Which artist is known for creating the sculpture \"David\"?', 'Michelangelo', 'Donatello', 'Bernini', 'Rodin', 1),
(33, 4, 'Beginner', 'Who was the first president of the United States?', 'George Washington', 'Thomas Jefferson', 'Abraham Lincoln', 'John Adams', 1),
(34, 4, 'Beginner', 'Which political system involves rule by the people?', 'Monarchy', 'Theocracy', 'Dictatorship', 'Democracy', 4),
(35, 4, 'Beginner', 'What is the name of the UK’s current parliamentary building?', 'Whitehall', 'Downing Street', 'Houses of Parliament', 'Buckingham Palace', 3),
(36, 4, 'Beginner', 'In what year did World War II end?', '1945', '1939', '1950', '1960', 1),
(37, 4, 'Intermediate', 'Who was the British Prime Minister during World War II?', 'Neville Chamberlain', 'Winston Churchill', 'Tony Blair', 'Margaret Thatcher', 2),
(38, 4, 'Intermediate', 'What is the term used for a law-making body of the government?', 'Legislature', 'Judiciary', 'Executive', 'Aristocracy', 1),
(39, 4, 'Intermediate', 'What is the maximum number of terms a U.S. president can serve?', 'One', 'Two', 'Three', 'Four', 2),
(40, 4, 'Professional', 'Which country had the first female Prime Minister?', 'India', 'Germany', 'Sri Lanka', 'UK', 3),
(41, 4, 'Professional', 'In what year did the United Nations officially come into existence?', '1945', '1947', '1950', '1955', 1),
(42, 4, 'Professional', 'Which U.S. Constitutional Amendment grants the right to bear arms?', '1st Amendment', '2nd Amendment', '3rd Amendment', '4th Amendment', 2);

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `id` int(11) NOT NULL,
  `topic` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`id`, `topic`) VALUES
(1, 'Sports'),
(2, 'Science & Technology'),
(3, 'Arts'),
(4, 'Politics');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `topic_id` (`topic_id`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
