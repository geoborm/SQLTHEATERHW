CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL, 
	email VARCHAR(50) NOT NULL, 
	phone_number VARCHAR(12) NOT NULL
);

ALTER TABLE customer 
ADD COLUMN loyaly_member BOOLEAN DEFAULT FALSE; 

CREATE TABLE movie(
	movie_id SERIAL PRIMARY KEY,
	movie_title VARCHAR(50) NOT NULL,
	rating VARCHAR(10) NOT NULL, 
	granre VARCHAR(20) NOT NULL, 
	description VARCHAR(200)
);

ALTER TABLE movie 
RENAME granre TO genre;


CREATE TABLE theater(
	theater_id SERIAL PRIMARY KEY,
	theater INTEGER NOT NULL, 
	tickets_available INTEGER,
	tickets_sold INTEGER, 
	FOREIGN KEY(tickets_sold) REFERENCES ticket(tickets_sold)
);

CREATE TABLE ticket(
	ticket_id SERIAL PRIMARY KEY, 
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	movie_title VARCHAR(50) NOT NULL,
	FOREIGN KEY(movie_title) REFERENCES movie(movie_title)
	theater INTEGER NOT NULL,
	FOREIGN KEY(theater) REFERENCES theater(theater),
	day_time TIMESTAMP,
	quantity NUMERIC(5,2) NOT NULL,
	tickets_available INTEGER, 
	tickets_sold INTEGER
);

ALTER TABLE customer 
DROP COLUMN loyalty_member 
