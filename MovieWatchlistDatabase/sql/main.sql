-- Creating database and running other files -- 

CREATE DATABASE IF NOT EXISTS MovieWatchlist;
USE MovieWatchlist;

SOURCE sql/create_tables.sql;
SOURCE sql/data.sql;
SOURCE sql/procedures.sql;

SELECT 'Database setup complete!';
