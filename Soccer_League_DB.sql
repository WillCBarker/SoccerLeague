
DROP DATABASE IF EXISTS SOCCER_LEAGUE;
CREATE DATABASE SOCCER_LEAGUE;
USE SOCCER_LEAGUE;

CREATE TABLE SEASON(
S_ID				INT 		PRIMARY KEY,
S_YEAR				DECIMAL(4,0),
S_ACTUAL_SEASON		VARCHAR(25),
S_REG_STAT			DATE		NOT NULL,
S_REG_END			DATE		NOT NULL,
S_SEASON_START		DATE		NOT NULL,
S_SEASON_END		DATE		NOT NULL
);

CREATE TABLE DIVISION(
D_EMAIL		VARCHAR(35)			PRIMARY KEY,
D_AGE		DECIMAL(2,0)		NOT NULL,
D_SEX		VARCHAR(10)			NOT NULL,
D_RANK		INT					NOT NULL,
D_PHONE		CHAR(13)			NOT NULL UNIQUE,
S_ID		INT,
FOREIGN KEY (S_ID) REFERENCES SEASON(S_ID)		
);

CREATE TABLE CLUB(
C_ABRV		VARCHAR(5)		PRIMARY KEY,
C_NAME		VARCHAR(24)		NOT NULL,
C_EMAIL		VARCHAR(35)		NOT NULL,
C_PHONE		CHAR(13)		NOT NULL
);

CREATE TABLE COACH(
CO_ID				INT				PRIMARY KEY,
CO_FIRST_NAME		VARCHAR(15)		NOT NULL,
CO_MIDDLE_NAME		VARCHAR(15),
CO_LAST_NAME		VARCHAR(15)		NOT NULL,
CO_DOB				DATE			NOT NULL,
CO_START_YEAR		DECIMAL(4,0)	NOT NULL,
CO_PHONE			CHAR(12)		NOT NULL
);

CREATE TABLE TEAM(
T_NAME			VARCHAR(20)		PRIMARY KEY,
T_BIRTH_YEAR	DECIMAL(4,0)	NOT NULL,
T_SEX			VARCHAR(10)		NOT NULL,
T_EMAIL			VARCHAR(35)		NOT NULL,
T_PHONE			CHAR(13)		NOT NULL,
C_ABRV			VARCHAR(5),
CO_ID			INT,
FOREIGN KEY (C_ABRV) REFERENCES CLUB(C_ABRV),
FOREIGN KEY (CO_ID) REFERENCES COACH(CO_ID)
);

CREATE TABLE PLAYER(
P_ID			INT				PRIMARY KEY,
P_FIRST_NAME	VARCHAR(15)		NOT NULL,
P_MIDDLE_NAME	VARCHAR(15),
P_LAST_NAME		VARCHAR(15)		NOT NULL,
P_JERSEY_NUM	INT				NOT NULL,
P_DOB			DATE			NOT NULL,
P_PARENT_EMAIL	VARCHAR(20)		NOT NULL
);
CREATE TABLE REGISTRATION(
P_ID			INT,
T_NAME			VARCHAR(20),
FOREIGN KEY (P_ID) REFERENCES PLAYER(P_ID),
FOREIGN KEY (T_NAME) REFERENCES TEAM(T_NAME)
);
CREATE TABLE ASSIGNMENT(
T_NAME 			VARCHAR(20),
D_EMAIL			VARCHAR(35),
FOREIGN KEY (T_NAME) REFERENCES TEAM(T_NAME),
FOREIGN KEY (D_EMAIL) REFERENCES DIVISION(D_EMAIL)
);

CREATE TABLE GAME(
G_CODE 		CHAR(8)				PRIMARY KEY,
G_DATE		DATE				NOT NULL,
G_LOCATION  VARCHAR(60)			NOT NULL,
G_TIME		TIME				NOT NULL,
D_EMAIL		VARCHAR(35) 		NOT NULL,
FOREIGN KEY (D_EMAIL) REFERENCES DIVISION(D_EMAIL)
);

CREATE TABLE GAME_RECORD(
T_NAME			VARCHAR(20),
G_CODE			CHAR(8),
FOREIGN KEY (T_NAME) REFERENCES TEAM(T_NAME),
FOREIGN KEY (G_CODE) REFERENCES GAME(G_CODE)
);

INSERT INTO SEASON VALUES
	(401, 2019, 'Spring', '2015-03-12', '2015-03-20', '2015-03-25', '2015-04-29'),
    (402, 2017, 'Summer', '2015-09-27', '2015-10-04', '2015-10-10', '2015-11-27'),
    (403, 2018, 'Fall', '2016-04-12', '2016-04-18', '2016-05-03', '2016-06-20'),
    (404, 2020, 'Fall', '2018-01-01', '2018-01-05', '2019-01-10', '2019-02-26'),
    (405, 2020, 'Spring', '2020-07-01', '2020-07-09', '2020-07-15', '2020-08-29'),
    (406, 2021, 'Fall', '2021-08-15', '2021-08-25', '2021-09-01', '2021-10-31')
    ;
    
INSERT INTO DIVISION VALUES
	('DU11B@sqlmail.com', 11, 'boys', '2', '(959) 4323857', 406),
    ('DU8@sqlmail.com', 8, 'girls', '3', '(959) 2938475', 402),
    ('DO18@sqlmail.com', 19, 'boys', '4', '(959) 2049383', 403),
    ('DU11G@sqlmail.com', 11, 'girls', '1', '(959) 4755754', 404),
    ('DO15@sqlmail.com', 15, 'boys', '5', '(959) 1938272', 406)
    ;
    
    INSERT INTO GAME VALUES
    ('10000000', '2021-09-05', 'VCU Soccer field', '13:00:00', 'DU11B@sqlmail.com'), /* Blue v Violet*/
    ('10000001', '2021-09-08', 'GMU soccer field', '14:30:00', 'DU11B@sqlmail.com'), /* Blue v Yellow*/
    ('10000002', '2021-10-07', 'Fairfax soccer complex', '11:45:00', 'DU11B@sqlmail.com'), /*Violet v Yellow*/
    ('10000003', '2021-09-25', 'VCU Soccer field', '11:30:00', 'DO15@sqlmail.com'), /* Green v Red*/
    ('10000004', '2021-10-05', 'GMU soccer field', '15:00:00', 'DO15@sqlmail.com'), /*Orange v Red*/
    ('10000005', '2021-10-09', 'Warhill High School field', '10:55:00', 'DO15@sqlmail.com') /*Orange v Green*/
    ;
INSERT INTO CLUB VALUES
	('BRS', 'Bears', 'Bears@sqlmail.com', '(959) 0382093'),
    ('EGLS', 'Eagles', 'Eagles@sqlmail.com', '(959) 2343388'),
    ('TGRS', 'Tigers', 'Tigers@sqlmail.com', '(959) 5558834'),
    ('LNS', 'Lions', 'Lions@sqlmail.com', '(959) 1123290')
;
INSERT INTO COACH VALUES
	(300, 'Stan', null, 'Johnson', '1975-06-06', 2020, 101-225-9595),
    (301, 'Roger', null, 'Sterling', '1968-08-19', 2020, 101-333-2536),
    (302, 'Dean', null, 'York', '1982-12-03', 2013, 111-995-1233),
    (303, 'Scott', null, 'Matthews', '1964-01-11', 2009, 101-565-8778),
    (304, 'Raul', null, 'Philips', '1979-10-26', 2017, 757-884-8009),
    (305, 'John', null, 'Doe', '1966-11-23', 2006, 742-114-0099)
    ;
INSERT INTO TEAM VALUES
	('Blue', 2009, 'boys', 'BlueTeam@mail.com', '(959) 8787999','BRS', 300),
    ('Yellow', 2009, 'boys', 'YellowTeam@mail.com', '(667) 3244540','LNS', 301),
    ('Green', 2004, 'boys', 'GreenTeam@mail.com', '(959) 3456321','TGRS', 302),
    ('Violet', 2009, 'boys', 'VioletTeam@mail.com', '(667) 1113323','TGRS', 303),
    ('Orange', 2004, 'boys', 'OrangeTeam@mail.com', '(667) 1123290','LNS', 304),
	('Red', 2004, 'boys', 'RedTeam@mail.com', '(667) 3448475','BRS', 305)
;
INSERT INTO ASSIGNMENT VALUES
	('Blue', 'DU11B@sqlmail.com'),
    ('Yellow', 'DU11B@sqlmail.com'),
    ('Green', 'DO15@sqlmail.com'),
    ('Violet', 'DU11B@sqlmail.com'),
    ('Orange', 'DO15@sqlmail.com'),
    ('Red', 'DO15@sqlmail.com')
;
INSERT INTO PLAYER VALUES
	(101,'Michael', null,  'Scott', 35, '2009-08-12', 'Scottsmom@gmail.com' ), 
    (102,'Arnold',null, 'Busch', 35, '2009-07-25', 'ArnoldsP@hotmail.com'),
    (103,'Dale', null,'Rogers', 22, '2001-01-01', 'Rogerfam@gmail.com'),
	(104,'Tag', null,'Thompson', 1, '2001-03-09', 'Thompsons@yahoo.com'),
    (105,'Jessica', null,'Philips', 0, '2012-04-22' , 'PhilipsDad@gmail.com'),
    (106,'Kristian', null,'Samson', 19, '2012-06-09', 'Samsoms@outlook.com' ),
    (107,'Aaron', null,'Williams', 33, '2004-11-24', 'Williams@mail.com'),
    (108,'Christopher',null, 'Scottsdale', 34, '2004-08-19', 'Scottsdales@mail.com'),
    (109,'Scarlett', null,'Johnson', 8, '2014-07-04', 'Johnsons@gmail.com'),
    (110,'Angelina', null,'Smith', 17, '2014-09-07', 'Smiths@outlook.com'),
    (111,'Ricky', null,'Bobby', 13, '2003-09-01', 'Bobby@outlook.com'),
    (112,'Paul', null,'Blart', 5, '2004-05-07', 'Blarts@outlook.com')
    ;
INSERT INTO REGISTRATION VALUES
	(101, 'Blue'),
    (102, 'Blue'),
    (103, 'Green'),
    (104, 'Green'),
    (105, 'Yellow'),
    (106, 'Yellow'),
    (107, 'Orange'),
    (108, 'Orange'),
    (109, 'Violet'),
    (110, 'Violet'),
    (111, 'Red'),
    (112, 'Red')
    ;
    
INSERT INTO GAME_RECORD VALUES
('Blue', '10000000' ),
('Violet', '10000000' ),
('Blue', '10000001' ),
('Yellow', '10000001' ),
('Violet','10000002' ),
('Yellow', '10000002' ),
('Green', '10000003' ),
('Red', '10000003' ),
('Orange', '10000004'),
('Red', '10000004'),
('Orange', '10000005'),
('Green', '10000005')
;
/*Checking Data
SELECT * FROM SEASON;
SELECT * FROM DIVISION;
SELECT * FROM COACH;
SELECT * FROM TEAM;
SELECT * FROM CLUB;
SELECT * FROM ASSIGNMENT;
SELECT * FROM PLAYER;
SELECT * FROM GAME;
SELECT * FROM GAME_RECORD;
SELECT * FROM REGISTRATION;
*/

/*Random queries to challenge myself & for practice */

/*Counts the amount of teams each soccer club has*/
SELECT C_NAME AS 'Club Name', COUNT(*)
FROM CLUB, TEAM WHERE CLUB.C_ABRV = TEAM.C_ABRV
GROUP BY C_NAME 
ORDER BY C_NAME;

/*Produces the division email (primary key) of each division that had a game in the 2021 fall season, counting the results*/
 SELECT DIVISION.D_EMAIL 'Division Email', COUNT(*)
 FROM TEAM 
 LEFT JOIN ASSIGNMENT ON TEAM.T_NAME = ASSIGNMENT.T_NAME
 LEFT JOIN DIVISION ON ASSIGNMENT.D_EMAIL = DIVISION.D_EMAIL
 LEFT JOIN SEASON ON DIVISION.S_ID = SEASON.S_ID
 WHERE S_YEAR = '2021' AND S_ACTUAL_SEASON = 'Fall'
 GROUP BY DIVISION.D_EMAIL
 ORDER BY DIVISION.D_EMAIL;
 
 /*Produces location of each game along with how many games each location had*/
SELECT G_LOCATION AS 'Game Location', COUNT(*)
FROM GAME
GROUP BY G_LOCATION
ORDER BY G_LOCATION;

/*Locates players with highest jersey number*/
SELECT CONCAT(P_FIRST_NAME, ' ', P_LAST_NAME) AS 'Player' FROM PLAYER WHERE P_JERSEY_NUM=(SELECT MAX(P_JERSEY_NUM) FROM PLAYER);

/*Counts the amount of coaches that coached in a fall season*/
SELECT COUNT(*) 
FROM COACH 
INNER JOIN TEAM ON COACH.CO_ID=TEAM.CO_ID 
INNER JOIN ASSIGNMENT ON TEAM.T_NAME=ASSIGNMENT.T_NAME
INNER JOIN DIVISION ON ASSIGNMENT.D_EMAIL=DIVISION.D_EMAIL 
INNER JOIN SEASON ON DIVISION.S_ID=SEASON.S_ID
WHERE S_ACTUAL_SEASON = 'Fall';



