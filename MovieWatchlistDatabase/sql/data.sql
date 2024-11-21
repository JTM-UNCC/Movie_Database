-- Adding some sample data to the database --

INSERT INTO Movies (title, genre, release_year, director)
VALUES 
    ('The Matrix', 'Sci-Fi', 1999, 'Lana Wachowski'),
    ('Titanic', 'Romance', 1997, 'James Cameron'),
    ('Toy Story', 'Animation', 1995, 'John Lasseter');

INSERT INTO Users (username, email)
VALUES 
    ('alice', 'alice@example.com'),
    ('bob', 'bob@example.com');

INSERT INTO Watchlist (user_id, movie_id, status)
VALUES 
    (1, 1, 'Watched'),
    (1, 2, 'To Watch'),
    (2, 3, 'Watching');
