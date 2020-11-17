DROP DATABASE iF EXISTS Mihaylov_database;
CREATE DATABASE IF NOT EXISTS Mihaylov_database;
USE Mihaylov_database;

 CREATE TABLE Post_Offices
(
  Address VARCHAR(100) NOT NULL,
  Index_ INT NOT NULL,
  PRIMARY KEY (Address, Index_)
);

CREATE TABLE Couriers
(
  Name VARCHAR(100) NOT NULL,
  Age INT NOT NULL,
  courierID INT NOT NULL,
  PRIMARY KEY (courierID)
);

CREATE TABLE Rating
(
  Score INT NOT NULL,
  courierID INT NOT NULL,
  FOREIGN KEY (courierID) REFERENCES Couriers(courierID)
);

CREATE TABLE Reviews
(
  Number INT NOT NULL,
  Description VARCHAR(100) NOT NULL,
  Rating INT NOT NULL,
  reviewID INT NOT NULL,
  courierID INT NOT NULL,
  PRIMARY KEY (reviewID),
  FOREIGN KEY (courierID) REFERENCES Couriers(courierID)
);

CREATE TABLE Letters
(
  letterID INT NOT NULL,
  Address VARCHAR(100) NOT NULL,
  Index_ INT NOT NULL,
  PRIMARY KEY (letterID),
  FOREIGN KEY (Address, Index_) REFERENCES Post_Offices(Address, Index_)
);

CREATE TABLE Packages
(
  packageID INT NOT NULL,
  Size INT NOT NULL,
  Comments CHAR NOT NULL,
  Address VARCHAR(100) NOT NULL,
  Index_ INT NOT NULL,
  PRIMARY KEY (packageID),
  FOREIGN KEY (Address, Index_) REFERENCES Post_Offices(Address, Index_)
);

CREATE TABLE Countries
(
  Countries_Name VARCHAR(100) NOT NULL,
  Address VARCHAR(100) NOT NULL,
  Index_ INT NOT NULL,
  PRIMARY KEY (Countries_Name),
  FOREIGN KEY (Address, Index_) REFERENCES Post_Offices(Address, Index_)
);

CREATE TABLE Cities
(
  Cities_Name VARCHAR(100) NOT NULL,
  Countries_Name VARCHAR(100) NOT NULL,
  PRIMARY KEY (Cities_Name),
  FOREIGN KEY (Countries_Name) REFERENCES Countries(Countries_Name)
);

CREATE TABLE Comments_to_package
(
  Number INT NOT NULL,
  Description VARCHAR(100) NOT NULL,
  packageID INT NOT NULL,
  FOREIGN KEY (packageID) REFERENCES Packages(packageID)
);

CREATE TABLE Departure_information
(
  Departure_adress INT NOT NULL,
  Receiving_address INT NOT NULL,
  Type INT NOT NULL,
  Weight INT NOT NULL,
  letterID INT NOT NULL,
  packageID INT NOT NULL,
  FOREIGN KEY (letterID) REFERENCES Letters(letterID),
  FOREIGN KEY (packageID) REFERENCES Packages(packageID)
);

CREATE TABLE Users
(
  Name VARCHAR(100) NOT NULL,
  Age VARCHAR(100) NOT NULL,
  letterID INT NOT NULL,
  packageID INT NOT NULL,
  reviewID INT NOT NULL,
  PRIMARY KEY (Name),
  FOREIGN KEY (letterID) REFERENCES Letters(letterID),
  FOREIGN KEY (packageID) REFERENCES Packages(packageID),
  FOREIGN KEY (reviewID) REFERENCES Reviews(reviewID)
);

INSERT INTO post_offices (Address,Index_) VALUES ('Новолужская 7', 1);
INSERT INTO countries (Countries_Name,Address,Index_) VALUES ('Россия', 'Новолужская 7', 1);
INSERT INTO couriers (Name, Age, courierID) VALUES ('Вова Михайлов', '20', '1');
INSERT INTO letters (letterID, Address, Index_) VALUES ('1', 'Новолужская 7', '1');
INSERT INTO packages (packageID, Size, Comments, Address, Index_) VALUES ('1', '50', 'р', 'Новолужская 7', '1');
INSERT INTO reviews (Number, Description, Rating, reviewID, courierID) VALUES ('1', 'п', '5', '1', '1');
INSERT INTO users (Name, Age, letterID, packageID, reviewID) VALUES ('Ярослав Арамов', '20', '1', '1', '1');
INSERT INTO cities (Cities_Name,Countries_Name) VALUES ('Волгоград','Россия');


ALTER TABLE cities ADD COLUMN new_col varchar(100) NOT NULL ;
ALTER TABLE cities ALTER COLUMN new_col SET DEFAULT "something";
ALTER TABLE cities ADD INDEX new_index (Cities_Name);
ALTER TABLE cities RENAME INDEX new_index TO very_new_index;
ALTER TABLE cities DROP INDEX very_new_index;
ALTER TABLE cities DROP COLUMN new_col;
ALTER TABLE cities COMMENT 'комент';
ALTER TABLE packages CHANGE COLUMN Comments Comments CHAR(100) NOT NULL ;
ALTER TABLE users DROP COLUMN Name,DROP PRIMARY KEY;
ALTER TABLE users ADD COLUMN NewName VARCHAR(45) NOT NULL AFTER reviewID, ADD PRIMARY KEY (`NewName`);

RENAME TABLE users TO current_users;
RENAME TABLE rating TO points;

drop table cities,comments_to_package,countries,couriers,departure_information,
letters,packages,post_offices,points,reviews,current_users;

drop database mihaylov_database;
