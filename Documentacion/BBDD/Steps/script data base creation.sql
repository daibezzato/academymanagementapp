CREATE TABLE IF NOT EXISTS  `group` (
    `idGroup` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(75) COLLATE utf8mb4_UNICODE_CI NOT NULL,
    `description` VARCHAR(128) COLLATE utf8mb4_UNICODE_CI DEFAULT NULL,
    primary key ( `idGroup`)
);

CREATE TABLE IF NOT EXISTS `action` (
  `idAction` int NOT NULL auto_increment,
  `name`  varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` Varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isDeleted` Bool NOT NULL default false,
   primary key ( `idAction`),
   UNIQUE KEY `name_UNIQUE` (`name`)
);

CREATE TABLE IF NOT EXISTS `security_access` (
  `idGroup` int,
  `idAction` int
);

CREATE TABLE IF NOT EXISTS `career` (
  `idCareer` int not null auto_increment,
  `careerName` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(128) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resolution` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_deleted` bool NOT NULL DEFAULT false,
   PRIMARY KEY (`idCareer`),
   UNIQUE KEY `name_UNIQUE` (`careerName`)
);

CREATE TABLE IF NOT EXISTS `user` (
  `idUser` int not null auto_increment,
  `username` Varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salt`  varchar(75),
  `passwordHash` Varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `isDeleted` bool NOT NULL DEFAULT false,
   PRIMARY KEY (`idUser`),
   UNIQUE KEY `username_UNIQUE` (`username`)
);

CREATE TABLE IF NOT EXISTS `student_subject` (
  `idStudSubj` int not null auto_increment,
  `idUser` int,
  `idSubject` int,
  `idPeriod` int,
  `score` int,
  PRIMARY KEY (`idStudSubj`)
);

CREATE TABLE IF NOT EXISTS `subject_professor` (
  `idSubjectProfessor` int not null auto_increment,
  `idUser` INT,
  `idSubject` INT,
   PRIMARY KEY (`idSubjectProfessor`)
);

CREATE TABLE IF NOT EXISTS `subject` (
  `idSubject` int not null auto_increment,
  `idCareer` int,
  `subjectName` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idSubject`),
  UNIQUE KEY `name_UNIQUE` (`subjectName`)
);

CREATE TABLE IF NOT EXISTS `attendance` (
  `idAttendance` int not null auto_increment,
  `IdStudent` INT,
  `idSubject` INT,
  `date` date,
  `attendance` Boolean NOT NULL DEFAULT false,
   PRIMARY KEY (`idAttendance`),
   UNIQUE KEY `name_UNIQUE` (`idAttendance`)
);

CREATE TABLE IF NOT EXISTS `period` (
  `idPeriod` int auto_increment NOT NULL,
  `description` Varchar(128),
  `startDate` date,
  `endDate` date,
   PRIMARY KEY (`idPeriod`)
);

CREATE TABLE IF NOT EXISTS `user_group` (
  `idGroup` int not null,
  `idUser` int not null
);

CREATE TABLE IF NOT EXISTS `user_information` (
  `idUser` int NOT NULL,
  `name` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `surname` varchar(75) COLLATE utf8mb4_unicode_ci NOT NULL,
  `documentType` ENUM('DNI', 'LE', 'LI', 'CE'),
  `documentNumber` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthDate` Date,
  `civilState` ENUM('S', 'C', 'V', 'D'),
  `email` VARCHAR(75),
   PRIMARY KEY (`idUser`),
   UNIQUE KEY `document_UNIQUE` (`documentNumber`),
   UNIQUE KEY `mail_UNIQUE` (`email`),
   UNIQUE KEY `user_id_UNIQUE` (`idUser`)
);