-- PROCEDURES --

-- Adds Movie to a users Watchlist
DELIMITER //
CREATE PROCEDURE AddToWatchlist (
    IN userId INT,
    IN movieId INT,
    IN status VARCHAR(20)
)
BEGIN
    -- Check if the movie exists --
    IF NOT EXISTS (
        SELECT 1 
        FROM Watchlist 
        WHERE id = movieId
    ) THEN
        -- Error --
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'The movie does not exist in the Movies table. Please add it first.';
    ELSE
        -- Add to Watchlist --
        INSERT INTO Watchlist (user_id, movie_id, status)
        VALUES (userId, movieId, status);
    END IF;
END;
// DELIMITER ;

-- Gets all movies on Wacthlist for a user --
DELIMITER //
CREATE PROCEDURE GetUserWatchlist (
    IN userId INT
)
BEGIN
    SELECT m.title, m.genre, w.status
    FROM Watchlist w
    JOIN Movies m ON w.movie_id = m.id
    WHERE w.user_id = userId;
END;
// DELIMITER ;

-- Removes a movie from watchlist --
DELIMITER //
CREATE PROCEDURE RemoveFromWatchlist (
    IN userId INT,
    IN movieId INT
)
BEGIN
    -- Check if the movie exists --
    IF NOT EXISTS (
        SELECT 1 
        FROM Watchlist 
        WHERE id = movieId
    ) THEN
        -- Error --
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'The specified movie does not exist in the Movies table.';
    ELSE
        -- Remove the movie from the Watchlist
        DELETE FROM Watchlist
        WHERE user_id = userId AND movie_id = movieId;
    END IF;
END;
// DELIMITER ;

-- Checks if movie is in watchlist --
DELIMITER //
CREATE PROCEDURE IsInWatchlist (
    IN userId INT,
    IN movieId INT,
    OUT isIn BOOLEAN
)
BEGIN
    SELECT EXISTS(
        SELECT 1 
        FROM Watchlist
        WHERE user_id = userId AND movie_id = movieId
    ) INTO isIn;
END;
// DELIMITER ;

-- Add a new user --
DELIMITER //
CREATE PROCEDURE CreateUser (
    IN username VARCHAR(50),
    IN email VARCHAR(200)
)
BEGIN
    -- Check if user already exists --
    IF EXISTS (
        SELECT 1
        FROM Users
        WHERE username = username OR email = email
    ) THEN
        -- Error --
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A user with the same username or email already exists.';
    ELSE
        -- Create new user --
        INSERT INTO Users (username, email)
        VALUES (username, email);
    END IF;
END;
// DELIMITER ;

-- Add a new movie to the movies table --
DELIMITER //
CREATE PROCEDURE AddMovie (
    IN movieTitle VARCHAR(100),
    IN movieGenre VARCHAR(50),
    IN releaseYear INT,
    IN movieDirector VARCHAR(200)
)
BEGIN
    -- Check if movie already exists --
    IF EXISTS (
        SELECT 1
        FROM Movies
        WHERE title = movieTitle AND release_year = releaseYear AND director = movieDirector
    ) THEN
        -- Error --
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A movie with the same title, release year, and director already exists.';
    ELSE
        -- Create new movie --
        INSERT INTO Movies (title, genre, release_year, director)
        VALUES (movieTitle, movieGenre, releaseYear, movieDirector);
    END IF;
END;
// DELIMITER ;
