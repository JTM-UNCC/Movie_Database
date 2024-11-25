-- 1. Adds Movie to a user's Watchlist
CREATE PROCEDURE AddToWatchlist (
    IN userId INT,
    IN movieId INT,
    IN status VARCHAR(20)
)
BEGIN
    -- Check if user exists
    IF NOT EXISTS (
        SELECT 1
        FROM Users
        WHERE user_id = userId
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'The user does not exist in the Users table.';
    -- Check if movie exists
    ELSEIF NOT EXISTS (
        SELECT 1
        FROM Movies
        WHERE movie_id = movieId
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'The movie does not exist in the Movies table.';
    ELSE
        -- Insert into Watchlist
        INSERT INTO Watchlist (user_id, movie_id, status)
        VALUES (userId, movieId, status);
    END IF;
END;

-- 2. Gets all movies on Watchlist for a user
CREATE PROCEDURE GetUserWatchlist (
    IN userId INT
)
BEGIN
    -- Check if the user exists
    IF NOT EXISTS (
        SELECT 1
        FROM Users
        WHERE user_id = userId
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'The user does not exist in the Users table.';
    ELSE
        -- Retrieve the user's watchlist
        SELECT m.title, m.genre, w.status
        FROM Watchlist w
        JOIN Movies m ON w.movie_id = m.movie_id
        WHERE w.user_id = userId;
    END IF;
END;

-- 3. Removes a movie from Watchlist
CREATE PROCEDURE RemoveFromWatchlist (
    IN userId INT,
    IN movieId INT
)
BEGIN
    -- Remove the movie from the Watchlist
    DELETE FROM Watchlist
    WHERE user_id = userId AND movie_id = movieId;
END;

-- 4. Checks if movie is in Watchlist
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

-- 5. Add a new user
CREATE PROCEDURE CreateUser (
    IN username VARCHAR(50),
    IN email VARCHAR(200)
)
BEGIN
    -- Check if user already exists --
    IF EXISTS (
        SELECT 1
        FROM Users
        WHERE Users.username = username OR Users.email = email
    ) THEN
        -- Error --
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'A user with the same username or email already exists.';
    ELSE
        -- Create new user --
        INSERT INTO Users (username, email, role)
        VALUES (username, email, 'User');
    END IF;
END;

-- 6. Add a new movie to the Movies table
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

-- 7. Clear Watchlist for user
CREATE PROCEDURE ClearUserWatchlist (
    IN userId INT
)
BEGIN
    DELETE FROM Watchlist
    WHERE user_id = userId;
END;

-- 8. Display user info
CREATE PROCEDURE GetUserInfo (
    IN userId INT
)
BEGIN
    SELECT username, email
    FROM Users
    WHERE user_id = userId;
END;

-- 9. Display user list
CREATE PROCEDURE DisplayAllUsers ()
BEGIN
    SELECT user_id, username, email
    FROM Users;
END;

-- 10. Display movie list
CREATE PROCEDURE DisplayAllMovies ()
BEGIN
    SELECT movie_id, title, genre, release_year, director
    FROM Movies;
END;
