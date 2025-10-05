-- Create the vet_clinic_db database
create database vet_clinic_db;
use vet_clinic_db;

-- Create 4 tables (Practitioners, Owners, Animals, Appointments) and populate with data

create table Practitioners (
	PractitionerID INT auto_increment primary key,
    FirstName VARCHAR(50) not null,
    LastName VARCHAR(50) not null,
    JobTitle VARCHAR(50) not null,
    Email VARCHAR(100) not null,
	Phone VARCHAR(20),
    Address VARCHAR(255),
    HireDate DATE
);

create table Owners (
	OwnerID INT auto_increment primary key,
    FirstName VARCHAR(50) not null,
    LastName VARCHAR(50) not null,
    Email VARCHAR(100) UNIQUE not null,
    Phone VARCHAR(20),
    Address VARCHAR(255)
);
    
  create table Animals (
	AnimalID INT auto_increment primary key,
    OwnerID INT not null,
    AnimalName VARCHAR(50),
    Species VARCHAR(30),
    Breed VARCHAR(50),
    DateOfBirth DATE,
    Sex VARCHAR(10),
    Weight FLOAT,
    LastVaccinationDate DATE,
    LastVisit DATE,
    FollowUpNeeded BOOLEAN default false,
    FOREIGN KEY (ownerID) REFERENCES Owners(OwnerID)
);

create table Appointments (
	AppointmentID INT auto_increment primary key,
    AnimaliD INT not null,
    PractitionerID INT not null,
    AppointmentDate DATE not null,
    Reason VARCHAR(500),
    NextDueDate DATE,
    FOREIGN KEY (AnimalID) REFERENCES Animals(AnimalID),
    FOREIGN KEY (PractitionerID) REFERENCES Practitioners(PractitionerID)
);

INSERT INTO Practitioners (FirstName, LastName, JobTitle, Email, Phone, Address, HireDate) VALUES
('Alice', 'Smith', 'Veterinarian', 'alice.smith@happypaws.com', '02079460001', '101 Main St, London', '2020-01-15'),
('Bob', 'Jones', 'Vet Nurse', 'bob.jones@happypaws.com', '02079460002', '15 Oak Rd, Manchester', '2019-06-10'),
('Clara', 'Wright', 'Veterinarian', 'clara.wright@happypaws.com', '02079460003', '7 River St, Liverpool', '2021-03-01'),
('David', 'Lee', 'Surgeon', 'david.lee@happypaws.com', '02079460004', '88 Station Rd, Birmingham', '2018-09-12'),
('Ella', 'Brown', 'Vet Nurse', 'ella.brown@happypaws.com', '02079460005', '24 Elm Ave, Leeds', '2022-04-05'),
('Frank', 'Taylor', 'Veterinarian', 'frank.taylor@happypaws.com', '02079460006', '9 Maple Ln, Bristol', '2017-11-30'),
('Grace', 'Wilson', 'Surgeon', 'grace.wilson@happypaws.com', '02079460007', '43 Forest Dr, Nottingham', '2020-08-18'),
('Hannah', 'Davis', 'Veterinarian', 'hannah.davis@happypaws.com', '02079460008', '31 Hill Top, Sheffield', '2023-02-01');

INSERT INTO Owners (FirstName, LastName, Address, Phone, Email) VALUES
('Jane', 'Baker', '10 Market St, York', '07123456780', 'jane.baker@email.com'),
('John', 'Reed', '12 Green Ln, Leeds', '07123456781', 'john.reed@email.com'),
('Sophie', 'Turner', '99 High Rd, Hull', '07123456782', 'sophie.turner@email.com'),
('Luke', 'White', '22 North St, Sheffield', '07123456783', 'luke.white@email.com'),
('Emily', 'Hill', '34 King St, Derby', '07123456784', 'emily.hill@email.com'),
('Tom', 'Grant', '56 River Way, Chester', '07123456785', 'tom.grant@email.com'),
('Amelia', 'Clark', '17 Elm St, Nottingham', '07123456786', 'amelia.clark@email.com'),
('Liam', 'Walker', '45 Park Rd, Leicester', '07123456787', 'liam.walker@email.com'),
('Ella', 'Green', '5 Oak St, Stoke', '07123456788', 'ella.green@email.com'),
('Charlie', 'Morgan', '78 Lake View, Birmingham', '07123456789', 'charlie.morgan@email.com'),
('Grace', 'Young', '13 Windmill Ln, Coventry', '07123456790', 'grace.young@email.com'),
('Noah', 'King', '6 Meadow Rd, Preston', '07123456791', 'noah.king@email.com');
    
INSERT INTO Animals (OwnerID, AnimalName, Species, Breed, DateOfBirth, Sex, Weight, LastVaccinationDate, LastVisit, FollowUpNeeded) VALUES
(1, 'Bella', 'Dog', 'Labrador', '2019-06-15', 'Female', 28.5, '2024-09-15', '2024-10-01', TRUE),
(2, 'Max', 'Cat', 'Siamese', '2020-01-25', 'Male', 4.2, '2025-03-15', '2025-04-10', FALSE),
(3, 'Coco', 'Rabbit', 'Lop', '2021-09-12', 'Female', 2.1, '2024-11-20', '2024-12-05', TRUE),
(4, 'Charlie', 'Dog', 'Beagle', '2018-03-19', 'Male', 13.0, '2025-02-10', '2025-03-11', FALSE),
(5, 'Daisy', 'Cat', 'British Shorthair', '2022-02-17', 'Female', 4.8, '2024-12-12', '2025-01-15', TRUE),
(6, 'Oscar', 'Dog', 'Poodle', '2020-11-01', 'Male', 12.4, '2024-10-20', '2024-11-20', FALSE),
(7, 'Milo', 'Parrot', 'Macaw', '2017-05-05', 'Male', 1.1, NULL, '2025-02-07', TRUE),
(8, 'Luna', 'Cat', 'Persian', '2021-07-22', 'Female', 4.5, '2025-04-22', '2025-05-22', FALSE),
(9, 'Rocky', 'Dog', 'Boxer', '2016-11-11', 'Male', 30.0, '2024-08-10', '2024-09-12', TRUE),
(10, 'Chloe', 'Cat', 'Maine Coon', '2019-03-09', 'Female', 5.6, '2025-01-05', '2025-01-30', FALSE),
(11, 'Lily', 'Rabbit', 'Dwarf', '2023-01-01', 'Female', 1.5, '2024-12-12', '2025-02-02', TRUE),
(12, 'Jack', 'Dog', 'Border Collie', '2020-04-14', 'Male', 20.0, '2025-02-01', '2025-03-05', FALSE),
(1, 'Misty', 'Cat', 'Ragdoll', '2020-08-10', 'Female', 4.0, '2024-08-15', '2025-01-01', TRUE),
(2, 'Buddy', 'Dog', 'Golden Retriever', '2021-02-22', 'Male', 29.0, '2025-01-20', '2025-02-20', FALSE),
(5, 'Fluffy', 'Rabbit', 'Angora', '2022-05-30', 'Male', 2.8, '2024-09-10', '2024-11-01', TRUE);


INSERT INTO Appointments (AnimalID, PractitionerID, AppointmentDate, Reason, NextDueDate) VALUES
(1, 1, '2024-10-01', 'Vaccination', '2025-10-01'),
(2, 2, '2025-04-10', 'Check-up', '2025-10-10'),
(3, 3, '2024-12-05', 'Dental cleaning', '2025-06-05'),
(4, 4, '2025-03-11', 'Surgery follow-up', '2025-09-11'),
(5, 6, '2025-01-15', 'Allergy treatment', '2025-07-15'),
(6, 7, '2024-11-20', 'Neutering', NULL),
(7, 5, '2025-02-07', 'Wing trimming', '2025-08-07'),
(8, 1, '2025-05-22', 'Skin rash check', '2025-11-22');

-- Review all existing data 
select * from practitioners;
select * from animals;
select * from owners;
select * from appointments;

-- 5 queries to RETRIEVE data
-- --Number 1
-- -- -- We can use a subquery to find out animals with no appointment:
SELECT a.AnimalName, a.Species
FROM Animals a
WHERE AnimalID NOT IN (
    SELECT AnimalID
    FROM Appointments
);

-- -- Number 2
-- -- -- We can find out the least common pet species
SELECT Species, COUNT(*) AS SpeciesCount
FROM Animals
GROUP BY Species
ORDER BY SpeciesCount ASC
LIMIT 1;

-- -- Number 3 
-- -- -- We can find the top 3 most common pet species
SELECT Species, COUNT(*) AS SpeciesCount
FROM Animals
GROUP BY Species
ORDER BY SpeciesCount DESC
LIMIT 3;

-- -- Number 4
-- -- -- We can check animals with no vaccinations on record
SELECT AnimalName, Species, OwnerID
FROM Animals
WHERE LastVaccinationDate IS NULL;

-- -- Number 5 
-- -- We can find the longest serving practitioner at Happy Paws Clinic
SELECT p.FirstName, p.LastName, p.HireDate
FROM Practitioners p
ORDER BY HireDate ASC
LIMIT 1;

-- 3 queries to INSERT data
-- -- A new client has registered with Happy Paws due to their rabbit catching an ear mites infection.
-- -- Number 1 - insert a new client
INSERT INTO Owners (FirstName, LastName, Email, Phone, Address)
VALUES ('Maya', 'Singh', 'maya.singh@email.com', '07811112222', '45 Forest Avenue, Oakford');

-- -- Number 2 - insert a new animal for the new client
INSERT INTO Animals (
  OwnerID, AnimalName, Species, Breed, DateOfBirth, Sex, Weight, LastVaccinationDate, LastVisit, FollowUpNeeded
)
VALUES (
  13, 'Clover', 'Rabbit', 'Mini Lop', '2022-04-10', 'Female', 2.3, '2023-04-15', '2024-04-15', false
);

-- -- Number 3 - insert a new appointment for the new animal/client
INSERT INTO Appointments (AnimalID, PractitionerID, AppointmentDate, Reason, NextDueDate)
VALUES (16, 5, '2025-06-14', 'Ear mites infection', '2026-06-14');


-- 2 examples of JOINS
-- -- 1
-- -- -- To find out owners who have more than one pet, we use an inner join:
SELECT o.FirstName, o.LastName, COUNT(a.AnimalID) AS NumberOfPets
FROM Owners o
JOIN Animals a ON o.OwnerID = a.OwnerID
GROUP BY o.OwnerID
HAVING COUNT(a.AnimalID) > 1;

-- -- -- We are curious which are the owners of more than one pet and what pets they have.
-- -- -- We use a combination of a subquery and join to find out.
SELECT 
  o.FirstName AS OwnerFirstName,
  o.LastName AS OwnerLastName,
  a.AnimalName,
  a.Species,
  a.Sex
FROM Owners o
JOIN Animals a ON o.OwnerID = a.OwnerID
WHERE o.OwnerID IN (
  SELECT OwnerID
  FROM Animals
  GROUP BY OwnerID
  HAVING COUNT(AnimalID) > 1
)
ORDER BY o.LastName, o.FirstName;

-- -- 2
-- -- -- Using LEFT JOIN, we can see which pets haven’t been assigned to a vet yet,
-- -- -- and which practitioner animals with appointmens have been assigned to
SELECT 
  a.AnimalName,
  a.Species,
  p.FirstName AS PractitionerFirstName,
  p.LastName AS PractitionerLastName
FROM Animals a
LEFT JOIN Appointments ap ON a.AnimalID = ap.AnimalID
LEFT JOIN Practitioners p ON ap.PractitionerID = p.PractitionerID
ORDER BY a.AnimalName;

-- We want to change the name of a column in a table to make more sense:
ALTER TABLE Appointments
RENAME COLUMN NextDueDate TO NextAppointmentDue;
SELECT * FROM Appointments;

-- 1 query to DELETE data
-- -- We have a cancelled appointment
DELETE FROM Appointments
WHERE AppointmentID = 2;
SELECT * FROM Appointments;

-- use 2 aggregate functions:
-- -- number 1 - use AVG and ROUND to find out the average weight of an animal by species
SELECT 
  Species,
  ROUND(AVG(Weight), 2) AS AverageWeight
FROM Animals
GROUP BY Species
ORDER BY AverageWeight;

-- -- number 2 - use COUNT to find out the total number of appointments
SELECT COUNT(*) AS TotalAppointments 
FROM Appointments;

-- 2 buil-in functions
-- -- Number 1
-- -- Calculates how many days ago each animal received its last vaccination using the DATEIFF function:
SELECT 
  AnimalName,
  LastVaccinationDate,
  DATEDIFF(CURDATE(), LastVaccinationDate) AS DaysSinceLastVaccine
FROM Animals
WHERE LastVaccinationDate IS NOT NULL;

-- -- Number 2
-- -- Creating a custom reminder for upcoming appointments using CONCAT, LOWER and DATE_FORMAT:
SELECT 
  CONCAT(
    'Happy Paws reminder: ', AnimalName, 
    ' has a vet appointment on ', date_format(NextAppointmentDue, '%d %M'),
    ' for ', lower(Reason)
  ) AS ReminderMessage
FROM Appointments
JOIN Animals ON Appointments.AnimalID = Animals.AnimalID;

-- Example of normalization
-- -- creating a new table where we store the job titles of practinioners in our clinic
-- --- -- 1. - create a new table table for Job Titles
CREATE TABLE JobTitles (
  JobTitleID INT AUTO_INCREMENT PRIMARY KEY,
  JobTitleName VARCHAR(50) NOT NULL UNIQUE
);
INSERT INTO JobTitles (JobTitleName)
VALUES 
  ('Veterinarian'),
  ('Vet Nurse'),
  ('Receptionist'),
  ('Technician');
  
-- --- -- 2. modifying table Practitioners to have column JobTitle replaced with a foreign key
ALTER TABLE Practitioners
DROP COLUMN JobTitle;

ALTER TABLE Practitioners
ADD JobTitleID INT,
ADD FOREIGN KEY (JobTitleID) REFERENCES JobTitles(JobTitleID);



-- Create a FUNCTION
-- -- Reminder Message generator
-- -- -- For the purpose of this function, we will take the animal name and appointment date
-- -- -- if the appointment date is within 48 h, a reminder message will be generated, ready to be sent to the owner

DELIMITER //

CREATE FUNCTION GenerateReminder(
  p_AnimalName VARCHAR(50),
  p_AppointmentDate DATE,
  p_Reason VARCHAR(100)
)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
  DECLARE message VARCHAR(255);

  IF DATEDIFF(p_AppointmentDate, CURDATE()) = 2 THEN
    SET message = CONCAT(
      'Happy Paws reminder: ', p_AnimalName, 
      ' has a vet appointment on ', DATE_FORMAT(p_AppointmentDate, '%d %M %Y'),
      ' for ', LOWER(p_Reason), '.'
    );
  ELSE
    SET message = NULL;
  END IF;

  RETURN message;
END //

DELIMITER ;

-- -- Example data to generate a reminder with:
-- -- (PLS update the date accordingly - date needs to be 2 days before today for this to work)
SELECT GenerateReminder('Karlie', '2025-06-15', 'skin lesion treatment');



-- Create a STORED PROCEDURE
-- -- Sproc to schedule next appointment automatically
-- -- Takes the parameters AnimalID, PractitionerID, AppointmentDate and FollowUpNeeded
-- -- automatically sets NextAppointmentDue to one year from AppointmentDate if FollowUpNeeded = False

DELIMITER //

CREATE PROCEDURE ScheduleAppointment(
  IN p_AnimalID INT,
  IN p_PractitionerID INT,
  IN p_AppointmentDate DATE,
  IN p_FollowUpNeeded BOOLEAN
)
BEGIN
  DECLARE v_NextAppointment DATE;

  IF p_FollowUpNeeded = FALSE THEN
    SET v_NextAppointment = DATE_ADD(p_AppointmentDate, INTERVAL 1 YEAR);
  ELSE
    SET v_NextAppointment = NULL;
  END IF;

  INSERT INTO Appointments (AnimalID, PractitionerID, AppointmentDate, NextAppointmentDue)
  VALUES (p_AnimalID, p_PractitionerID, p_AppointmentDate, v_NextAppointment);
END //

DELIMITER ;

-- -- Example data to call the sproc:
CALL ScheduleAppointment(5, 2, '2025-06-15', FALSE);
SELECT * FROM Appointments;