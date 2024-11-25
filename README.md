Movie Watchlist Vault

Welcome to the Movie Watchlist Vault, a database application built using MySQL to help manage movie watchlists easily. This program can be used for keeping track of movies you’ve already watched, planning to watch, or currently watching. It’s designed to handle multiple users, streamline watchlist management, and make movie tracking easy.

This guide includes step-by-step instructions to set up and run the project on dbfiddle.uk, an online SQL testing platform.

Step 1: Go to : https://dbfiddle.uk/



Step 2: Click on MySQL and make sure the version is set to 8.0 (You should see it at the top of the screen)



Step 3: Copy the content of create_tables.sql into the dbfiddle editor.
Click Run to create the database.



Step 4:
Use the "+" button below the editor to add a new file. Paste the content of data.sql into this new window.
Click Run to populate the database with sample data.



Step 5:
Use the "+" button below the editor to add a new file. Paste the content of procedures.sql into this new window.
Click Run to define the stored procedures.



Step 6:
Create one last new file using the "+" button. In teh new windoww, run test queries to interact with the database and demonstrate its functionality.
SELECT query that checks content of tables: 

SELECT * FROM Users;
SELECT * FROM Movies;
SELECT * FROM Watchlist;



Step 7:
Identifying user_id and movie_id. You can use SELECT queries to find the corresponding user_id and movie_id:

To find a specific user’s user_id:
SELECT user_id FROM Users WHERE username = 'alice';

To find a specific movie’s movie_id:
SELECT movie_id FROM Movies WHERE title = 'Toy Story';



Step 8:
Demonstration: Adding a New User and Watchlist Entry
RUN EACH LINE OF CODE BELOW:

Adding a New User:
CALL CreateUser('new_user', 'new_user@example.com');

Adding a Movie:
CALL AddMovie('Interstellar', 'Sci-Fi', 2014, 'Christopher Nolan');

Add the Movie to the Watchlist:
CALL AddToWatchlist(4, 5, 'To Watch');

View the User’s Watchlist:
CALL GetUserWatchlist(4);



Step 9:
Demonstration: Showing movies based on a specific genre
RUN CODE CHUNK BELOW:

SELECT title, genre, release_year, director
FROM Movies
WHERE genre = 'Sci-Fi';



Step 10:
Demonstration checking if a movie is in a user's watchlist
Run chunk of code below (0 = NO & 1 = YES):

CALL IsInWatchlist(4, 4, @isIn);
SELECT @isIn AS InWatchlist;



Step 11:
Demonstration clearing a User's watchlist

Run this line to clear it:
CALL ClearUserWatchlist(4);

Run this line to verify if it has been cleared:
CALL GetUserWatchlist(4);


