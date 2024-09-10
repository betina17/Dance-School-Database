
CREATE TABLE Dancer (
    DancerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Email VARCHAR(100),
    Phone VARCHAR(15)
);


CREATE TABLE Choreographer (
    ChoreographerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Specialization VARCHAR(50),
    Email VARCHAR(100)
);
 
CREATE TABLE DanceStyle (
    StyleID INT PRIMARY KEY,
    StyleName VARCHAR(50),
    Description TEXT
);


CREATE TABLE Choreography (
    ChoreographyID INT PRIMARY KEY,
    ChoreographerID INT FOREIGN KEY REFERENCES Choreographer(ChoreographerID),
    StyleID INT FOREIGN KEY REFERENCES DanceStyle(StyleID),
    Name VARCHAR(100),
    Duration INT
);


CREATE TABLE Song (
    SongID INT PRIMARY KEY,
    Title VARCHAR(100),
    Artist VARCHAR(100),
    Duration INT
);
select* from Song

CREATE TABLE Team (
    TeamID INT PRIMARY KEY,
    Name VARCHAR(50),
    ChoreographerID INT FOREIGN KEY REFERENCES Choreographer(ChoreographerID)
);


CREATE TABLE Show (
    ShowID INT PRIMARY KEY,
    Name VARCHAR(100),
    Date DATE,
    Venue VARCHAR(100),
	Duration INT UNIQUE
);
drop table Show

CREATE TABLE RehearsalRoom (
    RoomID INT PRIMARY KEY,
    Name VARCHAR(50),
    Capacity INT
);


CREATE TABLE MonthlySubscription (
    SubscriptionID INT PRIMARY KEY,
    DancerID INT FOREIGN KEY REFERENCES Dancer(DancerID),
    Amount DECIMAL(10,2),
    StartDate DATE,
    EndDate DATE
);


CREATE TABLE Class (
    ClassID INT PRIMARY KEY,
    StyleID INT FOREIGN KEY REFERENCES DanceStyle(StyleID),
    ChoreographerID INT FOREIGN KEY REFERENCES Choreographer(ChoreographerID),
    RoomID INT FOREIGN KEY REFERENCES RehearsalRoom(RoomID),
    StartTime TIME,
    EndTime TIME
);


CREATE TABLE DancerClass (
    DancerID INT FOREIGN KEY REFERENCES Dancer(DancerID),
    ClassID INT FOREIGN KEY REFERENCES Class(ClassID),
    PRIMARY KEY (DancerID, ClassID)
);

CREATE TABLE ShowSong (
	ShowID INT FOREIGN KEY REFERENCES Show(ShowID),
	SongID INT FOREIGN KEY REFERENCES Song(SongId),
	ShowSongID INT PRIMARY KEY 

);

drop table ShowSong

DELETE FROM Choreography WHERE ChoreographyID = 1;
DELETE FROM Choreographer WHERE ChoreographerID = 1;
DELETE FROM DanceStyle WHERE StyleID = 1;
DELETE FROM Dancer WHERE DancerID = 1;

INSERT INTO Dancer (DancerID, FirstName, LastName, DateOfBirth, Email, Phone) 
VALUES 
(1, 'Alice', 'Johnson', '1995-02-15', 'alice.johnson@email.com', '555-0101'),
(2, 'Bob', 'Smith', '1998-03-22', 'bob.smith@email.com', '555-0102'),
(3, 'Carmen', 'Diaz', '1992-12-01', 'carmen.diaz@email.com', '555-0103');
INSERT INTO Dancer (DancerID, FirstName, LastName, DateOfBirth, Email, Phone) 
VALUES 
(4, 'Olivia', 'Brown', '1996-04-15', 'olivia.brown@email.com', '555-0201'),
(5, 'James', 'Wilson', '1997-05-21', 'james.wilson@email.com', '555-0202'),
(6, 'Emily', 'Davis', '1991-08-30', 'emily.davis@email.com', '555-0203'),
(7, 'Benjamin', 'Moore', '1993-09-10', 'benjamin.moore@email.com', '555-0204'),
(8, 'Sophia', 'Taylor', '1989-12-01', 'sophia.taylor@email.com', '555-0205'),
(9, 'Ethan', 'Anderson', '1995-07-19', 'ethan.anderson@email.com', '555-0206'),
(10, 'Charlotte', 'Thomas', '1992-11-22', 'charlotte.thomas@email.com', '555-0207');
--some choreographers-Alice and Bob-can be dancers too in other classes 
SELECT* FROM Dancer


INSERT INTO Choreographer (ChoreographerID, FirstName, LastName, Specialization, Email) 
VALUES 
(1, 'Daniel', 'Roberts', 'Jazz', 'daniel.roberts@email.com'),
(2, 'Eva', 'Green', 'Modern', 'eva.green@email.com'),
(3, 'Frank', 'Stone', 'Hip Hop', 'frank.stone@email.com');
INSERT INTO Choreographer (ChoreographerID, FirstName, LastName, Specialization, Email) 
VALUES 
(4, 'Alice', 'Johnson', 'Reggae', 'alice.johnson@email.com'),
(5, 'Bob', 'Smith', 'Heels', 'bob.smith@email.com');
SELECT* FROM Choreographer

INSERT INTO DanceStyle (StyleID, StyleName, Description) 
VALUES 
(1, 'Ballet', 'A classical dance form characterized by grace and precision of movement.'),
(2, 'Hip Hop', 'A street dance style primarily performed to hip hop music.'),
(3, 'Contemporary', 'A style of expressive dance that combines elements of several dance genres.');
INSERT INTO DanceStyle (StyleID, StyleName, Description) 
VALUES 
(4, 'Heels', 'A sensual dance style performed on high heels.'),
(5, 'Salsa', 'A latino dance style that is performed in a couple'),
(6, 'Modern', 'A freestyle type of dance, where the body moves how it feels on the modern beats'),
(7, 'Reggae', 'A jamaican dance style that combines latino and hiphop moves');
SELECT* FROM DanceStyle


INSERT INTO Choreography (ChoreographyID, ChoreographerID, StyleID, Name, Duration) 
VALUES 
(1, 1, 1, 'Swan Song', 120),
(2, 2, 2, 'Street Beats', 90),
(3, 3, 3, 'Flow Motion', 75);
-- Attempts to insert a new choreography with a ChoreographerID that does not exist-999.
INSERT INTO Choreography (ChoreographyID, ChoreographerID, StyleID, Name, Duration) 
VALUES 
(4, 999, 4, 'Swan Lake', 30);
SELECT* FROM Choreography

INSERT INTO Song (SongID, Title, Artist, Duration) 
VALUES 
(1, 'Dance Away', 'The Rhythm', 210),
(2, 'Groove Tonight', 'Beat Masters', 200),
(3, 'Eternal Move', 'Soul Dancers', 230);
SELECT* FROM Song

INSERT INTO Team (TeamID, Name, ChoreographerID) 
VALUES 
(1, 'Rhythm Riders', 1),
(2, 'Groove Squad', 2),
(3, 'Motion Makers', 3);
SELECT* FROM Team

INSERT INTO Show (ShowID, Name, Date, Venue, Duration) 
VALUES 
(1, 'Dance Spectacular', '2023-08-15', 'Grand Theater', 40),
(2, 'Summer Dance Fest', '2023-08-22', 'Open Air', 30),
(3, 'Dance Gala', '2023-09-05', 'City Hall', 45);
SELECT* FROM Show


INSERT INTO RehearsalRoom (RoomID, Name, Capacity) 
VALUES 
(1, 'Studio A', 25),
(2, 'Studio B', 20),
(3, 'Studio C', 30);
SELECT* FROM RehearsalRoom

INSERT INTO MonthlySubscription (SubscriptionID, DancerID, Amount, StartDate, EndDate) 
VALUES 
(1, 1, 100.00, '2023-01-01', '2023-01-31'),
(2, 2, 100.00, '2023-02-01', '2023-02-28'),
(3, 3, 100.00, '2023-03-01', '2023-03-31');
INSERT INTO MonthlySubscription (SubscriptionID, DancerID, Amount, StartDate, EndDate) 
VALUES 
(4, 4, 120.00, '2023-04-01', '2023-04-30'),
(5, 5, 110.00, '2023-05-01', '2023-05-31'),
(6, 6, 130.00, '2023-06-01', '2023-06-30'),
(7, 7, 115.00, '2023-07-01', '2023-07-31'),
(8, 8, 125.00, '2023-08-01', '2023-08-31'),
(9, 9, 105.00, '2023-09-01', '2023-09-30'),
(10, 10, 95.00, '2023-10-01', '2023-10-31');
SELECT* FROM MonthlySubscription

INSERT INTO Class (ClassID, StyleID, ChoreographerID, RoomID, StartTime, EndTime) 
VALUES 
(1, 1, 1, 1, '09:00:00', '10:00:00'),
(2, 2, 2, 2, '10:00:00', '11:00:00'),
(3, 3, 3, 3, '11:00:00', '12:00:00');

SELECT* FROM Class

INSERT INTO DancerClass (DancerID, ClassID) 
VALUES 
(1, 1),
(2, 2),
(3, 3);
SELECT* FROM DancerClass


UPDATE Dancer 
SET Phone = '987-654-3210'
WHERE DancerID = 1 AND Email = 'alice.johnson@email.com';
-- Updates the phone number of the dancer with ID 1.
SELECT* FROM Dancer


UPDATE Choreographer 
SET Specialization = 'Salsa', Email = 'daniel.roberts@newemail.com' 
WHERE FirstName = 'Daniel' OR LastName = 'Doe';
-- Changes the specialization of choreographer Jane Smith and updates her email.
SELECT* FROM Choreographer

UPDATE DanceStyle 
SET Description = 'A dance style where dancers dance on pointe shoes.'
WHERE StyleName LIKE 'Ballet%';
-- Updates the description of dance styles that start with 'Ballet'.
SELECT* FROM DanceStyle

DELETE FROM Choreography 
WHERE ChoreographerID NOT IN (SELECT ChoreographerID FROM Choreographer);
-- Deletes choreography records that have a ChoreographerID not present in the Choreographer table.
--i know it doesn't put those values but I didn't want to actually delete anything from the table, just to show that I know how to write the syntax
SELECT* FROM Choreography


DELETE FROM Dancer 
WHERE DateOfBirth BETWEEN '1980-01-01' AND '1990-12-31' 
AND Email IS NOT NULL;
-- Deletes dancers born between 1980 and 1990 where the email is not null.
SELECT* FROM Dancer


SELECT FirstName, LastName FROM Dancer
UNION
SELECT FirstName, LastName FROM Choreographer;
-- Selects distinct first and last names from both Dancer and Choreographer tables. Any names that are in both tables will appear only once
--so this shows all the people that are part of the dance school

SELECT FirstName, LastName FROM Dancer 
UNION 
SELECT FirstName, LastName FROM Choreographer WHERE Specialization = 'Ballet' OR Specialization = 'Contemporary';
-- Selects distinct first and last names from Dancers  and Choreographers with specialization in Ballet or Contemporary.
--so it shows all dancers, and all choreographers with those specializations

SELECT FirstName, LastName FROM Dancer
INTERSECT
SELECT FirstName, LastName FROM Choreographer;
-- Selects names that are common between Dancer and Choreographer tables.
--so it shows all the dancers that are choreographers too

SELECT * 
FROM Choreographer
WHERE ChoreographerID IN (SELECT ChoreographerID FROM Choreography);
--shows all the choreographers that also have already created a choreography for this dance school


-- Selects choreographers who haven't created any choreography yet
SELECT ChoreographerID FROM Choreographer
EXCEPT
SELECT ChoreographerID FROM Choreography;

-- Selects dancers who are not enrolled in any class
SELECT DancerID, FirstName, LastName FROM Dancer
WHERE DancerID NOT IN (SELECT DancerID FROM DancerClass);


SELECT FirstName, LastName FROM Choreographer
WHERE ChoreographerID NOT IN (SELECT ChoreographerID FROM Team);
--lists choreographers who are not affiliated with any team.

SELECT D.FirstName, D.LastName, DS.StyleName, C.StartTime, C.EndTime
FROM Dancer D
INNER JOIN DancerClass DC ON D.DancerID = DC.DancerID
INNER JOIN Class C ON DC.ClassID = C.ClassID
INNER JOIN DanceStyle DS ON C.StyleID = DS.StyleID;
--Lists dancers with their class schedules and dance styles.

SELECT Ch.FirstName, Ch.LastName, T.Name
FROM Choreographer Ch
LEFT JOIN Team T ON Ch.ChoreographerID = T.ChoreographerID;
--Shows all choreographers and their associated team, including those without a team.

SELECT S.Title, Ch.Name
FROM Song S
RIGHT JOIN Choreography Ch ON S.Duration = Ch.Duration;
--Lists all choreographies and corresponding songs of similar duration.

SELECT D.FirstName AS DancerFirstName, D.LastName AS DancerLastName, 
       C.ClassID, C.StartTime, C.EndTime,
       Ch.FirstName AS ChoreographerFirstName, Ch.LastName AS ChoreographerLastName
FROM DancerClass DC
FULL JOIN Dancer D ON DC.DancerID = D.DancerID
FULL JOIN Class C ON DC.ClassID = C.ClassID
FULL JOIN Choreographer Ch ON C.ChoreographerID = Ch.ChoreographerID;
--lists which dancers are enrolled in which classes and which choreographers are teaching those classes


SELECT * FROM Show
WHERE Venue IN (SELECT Name FROM RehearsalRoom);
--Lists shows that are held in venues that are also rehearsal rooms.


SELECT * FROM Dancer
WHERE DancerID IN (SELECT DancerID FROM MonthlySubscription WHERE Amount IN (SELECT AVG(Amount) FROM MonthlySubscription));
--Displays dancers whose subscription amount is equal to the average subscription amount.

SELECT * FROM Choreographer Ch
WHERE EXISTS (SELECT * FROM Team T WHERE T.ChoreographerID = Ch.ChoreographerID);
--Lists choreographers who lead a team.

SELECT * FROM Dancer D
WHERE EXISTS (SELECT * FROM DancerClass DC WHERE DC.DancerID = D.DancerID AND EXISTS (SELECT * FROM Class C WHERE C.ClassID = DC.ClassID AND C.EndTime > '18:00:00'));
--Shows dancers enrolled in classes that end after 6 PM.

SELECT AVG(AverageAmount) AS OverallAverageAmount, COUNT(*) AS SubscriberCount
FROM (SELECT DancerID, AVG(Amount) AS AverageAmount 
      FROM MonthlySubscription 
      GROUP BY DancerID) AS AverageSubscriptions;


SELECT D.FirstName, D.LastName, SubscriptionInfo.AverageAmount
FROM Dancer D
INNER JOIN (SELECT DancerID, AVG(Amount) AS AverageAmount FROM MonthlySubscription GROUP BY DancerID) AS SubscriptionInfo
ON D.DancerID = SubscriptionInfo.DancerID;
--Lists dancers with their subscription amount.

SELECT StyleID, COUNT(*) AS ChoreographyCount
FROM Choreography
GROUP BY StyleID
HAVING COUNT(*) > 1;
--Lists dance styles with more than one choreography.

SELECT ChoreographerID, SUM(Duration) AS TotalDuration
FROM Choreography
GROUP BY ChoreographerID
HAVING SUM(Duration) > (SELECT AVG(Duration) FROM Choreography);
--Lists choreographers whose total choreography duration exceeds the average duration.

SELECT ChoreographerID, AVG(Duration) AS AverageDuration
FROM Choreography
GROUP BY ChoreographerID
HAVING AVG(Duration) < (SELECT MAX(Duration) FROM Choreography);
--Lists choreographers with an average choreography duration less than the maximum duration.

SELECT ChoreographerID, MIN(Duration) AS MinDuration, MAX(Duration) AS MaxDuration
FROM Choreography
GROUP BY ChoreographerID
HAVING MIN(Duration) > (SELECT AVG(Duration) FROM Choreography WHERE Duration < 60);
--Lists choreographers whose shortest choreography is longer than the average duration of all choreographies shorter than 60 minutes.

SELECT * FROM Show
WHERE ShowID = ANY (SELECT ShowID FROM Show WHERE Date IN ('2023-08-15', '2023-08-22'));
--Selects shows that occur on specific dates.

SELECT * FROM Show
WHERE ShowID = ANY (SELECT ShowID FROM Show WHERE Date NOT IN ('2023-08-15', '2023-08-22'));
--Selects shows that don't occur  specific dates.

--LAB3
USE [Dance School]
GO
--modify column
CREATE PROCEDURE alterDancerPhoneToVarchar20 AS
BEGIN
    ALTER TABLE Dancer ALTER COLUMN Phone VARCHAR(20);
END;
GO

CREATE PROCEDURE revertDancerPhoneToVarchar15 AS
BEGIN
    ALTER TABLE Dancer ALTER COLUMN Phone VARCHAR(15);
END;
GO

--add/remove column-nationality of dancer
CREATE PROCEDURE addNationalityToDancer AS
BEGIN
    ALTER TABLE Dancer ADD Nationality VARCHAR(50);
END;
GO

CREATE PROCEDURE removeNationalityFromDancer AS
BEGIN
    ALTER TABLE Dancer DROP COLUMN Nationality;
END;
GO

--add/remove a default constraint--default email for choreographer
CREATE PROCEDURE addDefaultEmailToChoreographer AS
BEGIN
    ALTER TABLE Choreographer ADD CONSTRAINT df_Choreographer_Email DEFAULT 'noemail@provided.com' FOR Email;
END;
GO

CREATE PROCEDURE removeDefaultEmailFromChoreographer AS
BEGIN
    ALTER TABLE Choreographer DROP CONSTRAINT df_Choreographer_Email;
END;
GO

CREATE TABLE Costume
(
	id_costum INT not null,
	size INT not null,
	CONSTRAINT COSTUME_PRIMARY_KEY PRIMARY KEY(size)
)
drop table Costume
--add/remove a primary key
CREATE PROCEDURE addPrimaryKeyToCostume AS
BEGIN
	 ALTER TABLE Costume DROP CONSTRAINT COSTUME_PRIMARY_KEY;
    ALTER TABLE Costume ADD CONSTRAINT COSTUME_PRIMARY_KEY PRIMARY kEY (id_costum);
END;
GO

CREATE PROCEDURE removePrimaryKeyFromCostume AS
BEGIN
     ALTER TABLE Costume DROP CONSTRAINT COSTUME_PRIMARY_KEY;
    ALTER TABLE Costume ADD CONSTRAINT COSTUME_PRIMARY_KEY PRIMARY kEY (size);
END;
GO

drop table Costume

--add/remove a candidate key
CREATE PROCEDURE addUniqueEmailToChoreographer AS
BEGIN
    ALTER TABLE Choreographer ADD CONSTRAINT uc_Choreographer_Email UNIQUE (Email);
END;
GO

CREATE PROCEDURE removeUniqueEmailFromChoreographer AS
BEGIN
    ALTER TABLE Choreographer DROP CONSTRAINT uc_Choreographer_Email;
END;
GO

--add/remove a foreign key
CREATE PROCEDURE addForeignKeyToChoreography AS
BEGIN
    ALTER TABLE Choreography ADD CONSTRAINT fk_Choreography_Choreographer FOREIGN KEY (ChoreographerID) REFERENCES Choreographer(ChoreographerID);
END;
GO

CREATE PROCEDURE removeForeignKeyFromChoreography AS
BEGIN
    ALTER TABLE Choreography DROP CONSTRAINT fk_Choreography_Choreographer;
END;
GO

--create/drop a table
CREATE PROCEDURE createPerformanceTable AS
BEGIN
    CREATE TABLE Performance (
        PerformanceID INT PRIMARY KEY,
        ShowID INT FOREIGN KEY REFERENCES Show(ShowID),
        Date DATE,
        AudienceCount INT
    );
END;
GO

CREATE PROCEDURE dropPerformanceTable AS
BEGIN
    DROP TABLE Performance;
END;
GO

--Write a stored procedure that receives as a parameter a version number and brings the database to that version.

create table versionTable(
	crt_version int
)
drop table versionTable

insert into versionTable values(1) -- initial version



create table proceduresTable(
	initial_version int,
    final_version int,
    primary key (initial_version, final_version),
    procedure__name varchar(max)
)
drop table proceduresTable
--drop table proceduresTable
INSERT INTO proceduresTable VALUES (1, 2, 'alterDancerPhoneToVarchar20');
INSERT INTO proceduresTable VALUES (2, 1, 'revertDancerPhoneToVarchar15');

INSERT INTO proceduresTable VALUES (2, 3, 'addNationalityToDancer');
INSERT INTO proceduresTable VALUES (3, 2, 'removeNationalityFromDancer');

INSERT INTO proceduresTable VALUES (3, 4, 'addDefaultEmailToChoreographer');
INSERT INTO proceduresTable VALUES (4, 3, 'removeDefaultEmailFromChoreographer');

INSERT INTO proceduresTable VALUES (4, 5, 'addPrimaryKeyToCostume');
INSERT INTO proceduresTable VALUES (5, 4, 'removePrimaryKeyFromCostume');

INSERT INTO proceduresTable VALUES (5, 6, 'addUniqueEmailToChoreographer');
INSERT INTO proceduresTable VALUES (6, 5, 'removeUniqueEmailFromChoreographer');

INSERT INTO proceduresTable VALUES (6, 7, 'addForeignKeyToChoreography');
INSERT INTO proceduresTable VALUES (7, 6, 'removeForeignKeyFromChoreography');

INSERT INTO proceduresTable VALUES (7, 8, 'createPerformanceTable');
INSERT INTO proceduresTable VALUES (8, 7, 'dropPerformanceTable');

drop table proceduresTable
--procedure to bring the database to the specified version
GO
CREATE OR ALTER PROCEDURE goToVersion1(@newVersion INT) 
AS
	DECLARE @current_version INT
	DECLARE @procedureName VARCHAR(MAX)
	SELECT @current_version = crt_version FROM versionTable

	IF (@newVersion > (SELECT MAX(final_version) FROM proceduresTable) OR @newVersion < 1)
		RAISERROR ('Bad version', 10, 1)
	ELSE
	BEGIN
		IF @newVersion = @current_version
			PRINT('You are already on this version!');
		ELSE
		BEGIN
			IF @current_version > @newVersion
			BEGIN
				WHILE @current_version > @newVersion 
					BEGIN
						SELECT @procedureName = procedure__name FROM proceduresTable WHERE initial_version = @current_version AND final_version = @current_version-1
						PRINT('Executing ' + @procedureName);
						EXEC (@procedureName)
						SET @current_version = @current_version - 1
					END
			END

			IF @current_version < @newVersion
			BEGIN
				WHILE @current_version < @newVersion 
					BEGIN
						SELECT @procedureName = procedure__name FROM proceduresTable WHERE initial_version = @current_version AND final_version = @current_version+1
						PRINT('Executing ' + @procedureName);
						EXEC (@procedureName)
						SET @current_version = @current_version + 1
					END
			END

			UPDATE versionTable SET crt_version = @newVersion
		END
	END

exec goToVersion1 1
exec goToVersion1 2
exec goToVersion1 3
exec goToVersion1 4
exec goToVersion1 5
exec goToVersion1 6
exec goToVersion1 7
exec goToVersion1 8

select * from versionTable
select* from proceduresTable

--vezi ca multe chestii ti le-a facut cat erai pe master. incearca sa vezi cum sta treaba pe DanceSchool


--clustered index scan
SELECT * FROM Show WHERE Venue LIKE '%Theater%'

--clustered index seek: a specific search on the primary key
SELECT * FROM Show WHERE ShowID = 1

--Nonclustered Index Scan: First, create a nonclustered index on Duration

CREATE NONCLUSTERED INDEX idx_Duration ON Show(Duration)

--then, we write a query that will cause a scan on this index

select Duration from Show

--Nonclustered Index Seek: Using the same index for a specific search

select Duration from Show where Duration = 45

--Key lookup: assuming we have a nonclustered index on Duration, and we query additional columns-that's when we use it


SELECT* FROM Show WHERE Duration = 40

--Write a query on table Tb with a WHERE clause of the form WHERE b2 = value and analyze its execution plan.

SELECT Duration FROM Song WHERE Duration = 200

--Create a nonclustered index that can speed up the query. Examine the execution plan again.

CREATE NONCLUSTERED INDEX idx_SongDuration ON Song(Duration);


SELECT Duration FROM Song WHERE Duration = 200

--Create a view that joins at least 2 tables. Check whether existing indexes are helpful; if not, reassess existing
--indexes / examine the cardinality of the tables.

CREATE VIEW DancerClassView AS
SELECT D.FirstName, DC.ClassID
FROM Dancer D
INNER JOIN DancerClass DC ON D.DancerID = DC.DancerID;
SELECT * FROM DancerClassView;











