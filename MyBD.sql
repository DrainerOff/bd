DROP DATABASE iF EXISTS my_database;
CREATE DATABASE IF NOT EXISTS my_database;
USE my_database;


CREATE TABLE Fractions
(
  Fraction_Name VARCHAR(40) NOT NULL,
  Biography VARCHAR(1000) NOT NULL,
  Is_it_negative INT NOT NULL,
  Fractions_id INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (Fractions_id)
);

CREATE TABLE Actors
(
  Acor_Full_name VARCHAR(40) NOT NULL,
  Current_age INT NOT NULL,
  Biography VARCHAR(1000) NOT NULL,
  Actors_id INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (Actors_id)
);

CREATE TABLE Film_crew_members
(
  Film_crew_members_name VARCHAR(60) NOT NULL,
  Сrew_members_аge INT NOT NULL,
  Film_crew_members_id INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (Film_crew_members_id)
);

CREATE TABLE Locations
(
  Location_Name VARCHAR(40) NOT NULL,
  Location_id INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (Location_id)
);

CREATE TABLE Types_Of_Film_crew_members
(
  Team_id INT NOT NULL,
  Role VARCHAR(40) NOT NULL,
  Film_crew_members_id INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (Team_id),
  FOREIGN KEY (Film_crew_members_id) REFERENCES Film_crew_members(Film_crew_members_id)
);

CREATE TABLE Shows
(
  Release_date DATE NOT NULL,
  Annotation VARCHAR(400) NOT NULL,
  Show_Name VARCHAR(40) NOT NULL,
  Shows_id INT NOT NULL AUTO_INCREMENT,
  Team_id INT NOT NULL,
  PRIMARY KEY (Shows_id),
  FOREIGN KEY (Team_id) REFERENCES Types_Of_Film_crew_members(Team_id)
);

CREATE TABLE Seasons
(
  Season_Number INT NOT NULL,
  Season_name VARCHAR(60) NOT NULL,
  Shows_id INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (Season_Number),
  FOREIGN KEY (Shows_id) REFERENCES Shows(Shows_id)
);

CREATE TABLE Story_arcs
(
  Story_arcs_Name VARCHAR(40) NOT NULL,
  Description VARCHAR(250) NOT NULL,
  Story_arc_id INT NOT NULL,
  Season_Number INT NOT NULL,
  PRIMARY KEY (Story_arc_id),
  FOREIGN KEY (Season_Number) REFERENCES Seasons(Season_Number)
);

CREATE TABLE Events
(
  Event_Name VARCHAR(40) NOT NULL,
  Description VARCHAR(250) NOT NULL,
  Event_id INT NOT NULL,
  Story_arc_id INT NOT NULL,
  Location_id INT NOT NULL,
  PRIMARY KEY (Event_id),
  FOREIGN KEY (Story_arc_id) REFERENCES Story_arcs(Story_arc_id),
  FOREIGN KEY (Location_id) REFERENCES Locations(Location_id)
);

CREATE TABLE Episodes
(
  Episode_Number INT NOT NULL,
  Episode_name VARCHAR(40) NOT NULL,
  Season_Number INT NOT NULL,
  PRIMARY KEY (Episode_Number),
  FOREIGN KEY (Season_Number) REFERENCES Seasons(Season_Number)
);

CREATE TABLE Characters
(
  Character_Name VARCHAR(40) NOT NULL,
  Photo_URL INT NOT NULL,
  Biography INT NOT NULL,
  Character_id INT NOT NULL AUTO_INCREMENT,
  Event_id INT NOT NULL,
  Fractions_id INT NOT NULL,
  PRIMARY KEY (Character_id),
  FOREIGN KEY (Event_id) REFERENCES Events(Event_id),
  FOREIGN KEY (Fractions_id) REFERENCES Fractions(Fractions_id)
);

CREATE TABLE Types_Of_Actors
(
  Name_of_actor_type VARCHAR(40) NOT NULL,
  Actors_id INT NOT NULL,
  Character_id INT NOT NULL,
  FOREIGN KEY (Actors_id) REFERENCES Actors(Actors_id),
  FOREIGN KEY (Character_id) REFERENCES Characters(Character_id)
);