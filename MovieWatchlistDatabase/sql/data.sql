-- Adding some sample data to the database --

INSERT INTO Movies (title, genre, release_year, director)
VALUES 
    ('The Matrix', 'Sci-Fi', 1999, 'Lana Wachowski'),
    ('Titanic', 'Romance', 1997, 'James Cameron'),
    ('Toy Story', 'Animation', 1995, 'John Lasseter'),
    ('Avatar', 'Sci-Fi', 2009, 'James Cameron'),
    ('The Dark Knight', 'Action', 2008, 'Christopher Nolan'),
    ('The Shawshank Redemption', 'Drama', 1994, 'Frank Darabont'),
    ('The Conjuring', 'Horror', 2013, 'James Wan'),
    ('Parasite', 'Thriller', 2019, 'Bong Joon Ho');

INSERT INTO Users (username, email, role)
VALUES 
    ('admin', 'admin@example.com', 'Admin'),
    ('alice', 'alice@example.com', 'User'),
    ('bob', 'bob@example.com', 'User');

INSERT INTO Watchlist (user_id, movie_id, status)
VALUES 
    (1, 1, 'Watched'),
    (1, 2, 'To Watch'),
    (2, 3, 'Watching');
