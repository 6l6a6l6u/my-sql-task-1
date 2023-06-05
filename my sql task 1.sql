CREATE DATABASE imdb;
USE imdb;
-- Create the Movie table
CREATE TABLE Movie (
  movie_id INT PRIMARY KEY,
  movie_name VARCHAR(255),
  release_date DATE,
  duration INT,
  -- other movie attributes
);

-- Create the Media table
CREATE TABLE Media (
  media_id INT PRIMARY KEY,
  movie_id INT,
  media_type VARCHAR(50),
  media_url VARCHAR(255),
  -- other media attributes
  FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);

-- Create the Genre table
CREATE TABLE Genre (
  genre_id INT PRIMARY KEY,
  genre_name VARCHAR(50)
);

-- Create the Movie_Genre table for the many-to-many relationship between Movie and Genre
CREATE TABLE Movie_Genre (
  movie_id INT,
  genre_id INT,
  PRIMARY KEY (movie_id, genre_id),
  FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
  FOREIGN KEY (genre_id) REFERENCES Genre(genre_id)
);

-- Create the Review table
CREATE TABLE Review (
  review_id INT PRIMARY KEY,
  movie_id INT,
  user_id INT,
  rating DECIMAL(3, 1),
  review_text TEXT,
  -- other review attributes
  FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
  FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- Create the User table
CREATE TABLE User (
  user_id INT PRIMARY KEY,
  username VARCHAR(50),
  email VARCHAR(255),
  -- other user attributes
);

-- Create the Artist table
CREATE TABLE Artist (
  artist_id INT PRIMARY KEY,
  artist_name VARCHAR(255),
  -- other artist attributes
);

-- Create the Skill table
CREATE TABLE Skill (
  skill_id INT PRIMARY KEY,
  skill_name VARCHAR(50)
);

-- Create the Artist_Skill table for the many-to-many relationship between Artist and Skill
CREATE TABLE Artist_Skill (
  artist_id INT,
  skill_id INT,
  PRIMARY KEY (artist_id, skill_id),
  FOREIGN KEY (artist_id) REFERENCES Artist(artist_id),
  FOREIGN KEY (skill_id) REFERENCES Skill(skill_id)
);

-- Create the Role table
CREATE TABLE Role (
  role_id INT PRIMARY KEY,
  role_name VARCHAR(50)
);

-- Create the Film_Credit table for the many-to-many relationship between Artist and Movie
CREATE TABLE Film_Credit (
  artist_id INT,
  movie_id INT,
  role_id INT,
  PRIMARY KEY (artist_id, movie_id, role_id),
  FOREIGN KEY (artist_id) REFERENCES Artist(artist_id),
  FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
  FOREIGN KEY (role_id) REFERENCES Role(role_id)
);
