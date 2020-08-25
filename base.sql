SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

CREATE DATABASE elern

CREATE TABLE `grade` (
  `student_id` int(11) DEFAULT NULL,
  `subiect_id` int(11) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `lession_plan` (
  `class_id` varchar(4) NOT NULL,
  `day` varchar(16) NOT NULL,
  `subiect_id` int(11) NOT NULL,
  `hour` tinyint(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT 'fake data',
  `surname` varchar(32) DEFAULT 'fake data',
  `class` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `students_details` (
  `student_id` int(11) NOT NULL,
  `city` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(15) NOT NULL,
  `email` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `subjects` (
  `id` int(11) NOT NULL,
  `subiect_name` text DEFAULT NULL,
  `teacher_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `phone_number` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `grade`
  ADD KEY `student_id` (`student_id`),
  ADD KEY `subiect_id` (`subiect_id`);

ALTER TABLE `lession_plan`
  ADD KEY `class_id` (`class_id`),
  ADD KEY `subiect_id` (`subiect_id`);

ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `students_details`
  ADD UNIQUE KEY `student_id` (`student_id`);

ALTER TABLE `subjects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_id` (`teacher_id`);

ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `subjects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `grade`
  ADD CONSTRAINT `grade_ibfk_1` FOREIGN KEY (`subiect_id`) REFERENCES `subjects` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

ALTER TABLE `subjects`
  ADD CONSTRAINT `subjects_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE SET NULL ON UPDATE NO ACTION;
COMMIT;