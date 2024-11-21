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

// DELIMITER ;
