DROP DATABASE IF EXISTS Inputtestmanagement;
CREATE DATABASE Inputtestmanagement;

USE Inputtestmanagement;

CREATE TABLE Department(
	department_id 		INT AUTO_INCREMENT PRIMARY KEY,
    department_name 	VARCHAR(50)
);

CREATE TABLE `Position`(
	position_id 		INT AUTO_INCREMENT PRIMARY KEY,
    position_name		VARCHAR(50)
);

CREATE TABLE `Account`(
	account_id			INT AUTO_INCREMENT PRIMARY KEY,
    email 				VARCHAR(50),
    username			VARCHAR(20),
    full_name			VARCHAR(30),
    department_id		INT,
    position_id 		INT,
    create_date			DATE,
    FOREIGN KEY (department_id) REFERENCES Department(department_id) ON DELETE CASCADE,
    FOREIGN KEY (position_id) REFERENCES `Position`(position_id) ON DELETE CASCADE
);
    
CREATE TABLE `Group`(
	group_id			INT AUTO_INCREMENT PRIMARY KEY,
    group_name			VARCHAR(50),
    creator_id			INT,
    create_date			DATE
);

CREATE TABLE Groupaccount(
	group_id			INT,
    account_id			INT,
    join_date			DATE,
    PRIMARY KEY	(group_id,account_id),
    FOREIGN KEY (group_id) REFERENCES `Group`(group_id) ON DELETE CASCADE,
    FOREIGN KEY (account_id) REFERENCES `Account`(account_id) ON DELETE CASCADE
);

CREATE TABLE Typequestion(
	type_id				INT AUTO_INCREMENT PRIMARY KEY,
    type_name			VARCHAR(20)
);

CREATE TABLE Categoryquestion(
	category_id			INT AUTO_INCREMENT PRIMARY KEY,
	category_name		VARCHAR(20)
);

CREATE TABLE Question(
	question_id			INT AUTO_INCREMENT PRIMARY KEY,
    content				VARCHAR(500),
    category_id			INT,
    type_id				INT,
    creator_id			INT,
    create_date			DATE,
    FOREIGN KEY (category_id) REFERENCES Categoryquestion(category_id) ON DELETE CASCADE,
    FOREIGN KEY (type_id) REFERENCES Typequestion(type_id) ON DELETE CASCADE
);

CREATE TABLE Answer(
	answer_id			INT AUTO_INCREMENT PRIMARY KEY,
    content				VARCHAR(500),
    question_id			INT,
    is_correct			BOOLEAN,
    FOREIGN KEY (question_id) REFERENCES Question(question_id) ON DELETE CASCADE
);

CREATE TABLE Exam(
	exam_id				INT AUTO_INCREMENT PRIMARY KEY,
    `code`				VARCHAR(5),
    title				VARCHAR(20),
    category_id			INT,
    duration			TIME,
    creator_id			INT,
    create_date			DATE,
    FOREIGN KEY (category_id) REFERENCES Categoryquestion(category_id) ON DELETE CASCADE
);

CREATE TABLE Examquestion(
	exam_id				INT,
    question_id			INT,
    PRIMARY KEY (exam_id, question_id),
    FOREIGN KEY (exam_id) REFERENCES Exam(exam_id) ON DELETE CASCADE,
    FOREIGN KEY (question_id) REFERENCES Question(question_id) ON DELETE CASCADE
);

INSERT INTO Department	(department_name)
	VALUES
						('Finance'),					-- 1
                        ('IT'),							-- 2
                        ('Legal'),						-- 3
                        ('Office Administration'),		-- 4	
                        ('Production'),					-- 5	
                        ('Quality Control'),			-- 6
                        ('Business Development'),		-- 7
                        ('Client Service'),				-- 8
                        ('Sales'),						-- 9
                        ('Marketing');					-- 10
                        
INSERT INTO `Position`	(position_name)
	VALUES
						('Computer Engineeer'),			-- 1
                        ('IT Specialist'),				-- 2
                        ('Department Head'),			-- 3
                        ('Plant Manager'),				-- 4
                        ('Finance Director'),			-- 5
                        ('Managing Director'),			-- 6
                        ('Intership'),					-- 7
                        ('Salesman'),					-- 8
                        ('Consultants'),				-- 9
                        ('Customers Service');			-- 10
                        
INSERT INTO `Account` 	(email,				username,		full_name,		department_id,		position_id,		create_date)
	VALUES	
						('cd1@gmail.com',	'candidate1',	'Nguyen Van A',			8,				10,				'2020-03-26'),
                        ('cd2@gmail.com',	'candidate2',	'Hoang Duc B',			2,				2,				'2020-03-26'),
                        ('cd3@gmail.com',	'candidate3',	'Tran Tuan C',			1,				3,				'2020-03-26'),
                        ('cd4@gmail.com',	'candidate4',	'Vu Thi D',				3,				1,				'2020-03-26'),
                        ('cd5@gmail.com',	'candidate5',	'Pham Thu E',			10,				4,				'2020-03-26'),
                        ('cd6@gmail.com',	'candidate6',	'Vo Van F',				4,				6,				'2020-03-26'),
                        ('cd7@gmail.com',	'candidate7',	'Phan Phuoc G',			9,				9,				'2020-03-26'),
                        ('cd8@gmail.com',	'candidate8',	'Nguyen Hoang H',		1,				5,				'2020-03-26'),
                        ('cd9@gmail.com',	'candidate9',	'Ngo Lan I',			9,				8,				'2020-03-26'),
                        ('cd10@gmail.com',	'candidate10',	'Mai Ngoc K',			9,				8,				'2020-03-26');
                        
INSERT INTO `Group`		(group_name,	creator_id,		create_date)
	VALUES
						('A1',			1,				'2020-01-11'),
                        ('B2',			2,				'2020-02-26'),
                        ('AB',			3,				'2019-12-11'),
                        ('12BH',		3,				'2020-01-31'),
                        ('GLHF',		1,				'2020-03-01'),
                        ('SV',			1,				'2020-02-01'),
                        ('AFF',			2,				'2019-10-21'),
                        ('MSI',			2,				'2020-03-26'),
                        ('HO',			3,				'2019-11-20'),
                        ('PS',			1,				'2020-03-26');
                        
INSERT INTO Groupaccount	(group_id, account_id, join_date)
	VALUES	
                            (1,			2,			'2020-03-29'),
                            (2,			3,			'2020-03-25'),
                            (5,			1,			'2020-03-25'),
                            (3,			9,			'2020-03-25'),
                            (2,			5,			'2020-03-25'),
                            (7,			2,			'2020-03-25'),
                            (10,		4,			'2020-03-25'),
                            (2,			6,			'2020-03-25'),
                            (4,			2,			'2020-03-25'),
                            (8,			3,			'2020-03-25');
                            
INSERT INTO Typequestion	(type_name)
	VALUES
							('Essay'),
                            ('Multiple-Choice'),
                            ('True or Fail'),
                            ('Yes or No');
                            
INSERT INTO Categoryquestion	(category_name)
	VALUES
								('Java'),
                                ('.NET'),
                                ('SQL'),
                                ('Postman'),
                                ('Ruby');
							
INSERT INTO	Question	(content,							category_id,	type_id,	creator_id,		create_date)
	VALUES	
						('SQL là từ viết tắt của:',			3,				2,			1,				'2020-03-01');
                        
INSERT INTO Answer	(content,								question_id,	is_correct)
	VALUES
					('Structured Query Language',			1,				1);
				

/* INSERT INTO Exam	(`code`,	title,	category_id,	duration,	creator_id,		create_date)
	VALUES
					();
                    
INSERT INTO Examquestion	(exam_id,	question_id)
	VALUES
							(); */
                            
                        

                        
                        
                        
                        
                        
                        
					

                        

