-- Creating the tables --

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL UNIQUE,
    role ENUM('Admin', 'User') DEFAULT 'User'
);

CREATE TABLE Movies (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    release_year INT,
    director VARCHAR(100)
);

CREATE TABLE Watchlist (
    watchlist_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    movie_id INT,
    status ENUM('Watched', 'To Watch', 'Watching'),
    FOREIGN KEY (user_id) REFERENCES Users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id) ON DELETE CASCADE
);
