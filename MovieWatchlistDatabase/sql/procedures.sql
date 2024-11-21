-- PROCEDURES --

-- Adds Movie to a users Watchlist
DELIMITER //
CREATE PROCEDURE AddToWatchlist (
    IN userId INT,
    IN movieId INT,
    IN status VARCHAR(20)
)
BEGIN
    INSERT INTO Watchlist (user_id, movie_id, status)
    VALUES (userId, movieId, status);
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

-- Removes a movie from watchlist --
// DELIMITER ;
DELIMITER //
CREATE PROCEDURE RemoveFromWatchlist (
    IN userId INT,
    IN movieId INT
)
BEGIN
    DELETE FROM Watchlist
    WHERE user_id = userId AND movie_id = movieId;
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
