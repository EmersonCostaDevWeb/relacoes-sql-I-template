-- Active: 1685769806419@@127.0.0.1@3306

-- Práticas

CREATE TABLE
    users(
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        name TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL
    );

SELECT * FROM users;

CREATE TABLE
    phones(
        id TEXT UNIQUE PRIMARY KEY,
        phone_number TEXT UNIQUE NOT NULL,
        user_id TEXT NOT NULL,
        FOREIGN KEY(user_id) REFERENCES users(id)
    );

SELECT * FROM phones;

INSERT INTO users
VALUES ("U001","Fulano","fulano@email.com", "12345"), ("U002", "Cicrano",  "cicrano@email.com"),      "09876"  );

INSERT INTO phones
VALUES ("P001", "9112345", "U002"), ("P002", "9235345", "U001"), ("P003", "9789145", "U002");

DELETE FROM phones;


SELECT * FROM users INNER JOIN phones;

SELECT users.name, phones.phone_number FROM users  INNER JOIN phones;

SELECT * FROM users INNER JOIN phones ON phones.user_id = users.id;
SELECT  users.name, phones.phone_number FROM users INNER JOIN phones ON phones.user_id = users.id
WHERE users.name LIKE "Ci%";

CREATE TABLE
    licenses(
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        register_number TEXT UNIQUE NOT NULL,
        category TEXT NOT NULL
    );
DELETE FROM licenses;
DELETE FROM drivers;

 

CREATE TABLE
    drivers(
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        name TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL,
        license_id TEXT UNIQUE NOT NULL,
        FOREIGN KEY(license_id) REFERENCES licenses(id)
    );
SELECT* FROM drivers; 
SELECT * FROM licenses;
INSERT INTO licenses VALUES("L001","11111","B"),("L002","22222","A"),("L003","33333","AB");

INSERT INTO drivers VALUES
("D001","Fulano","fulano@email.com","1234","L002"),
("D002","Cicrano","cricrano@email.com","5678","L001"),
("D003","Beltrano","beltrano@email.com","9874","L003");
SELECT * FROM drivers INNER JOIN licenses ON licenses.id= licenses_id;

SELECT drivers.name, licenses.register_number, licenses.category FROM drivers INNER JOIN licenses ON licenses_id = licenses.id;

CREATE TABLE author (
  id TEXT PRIMARY KEY UNIQUE NOT NULL,
  name TEXT NOT NULL 
);

SELECT * FROM author;

CREATE TABLE books(
  id TEXT PRIMARY KEY UNIQUE NOT NULL,
  name_book TEXT UNIQUE NOT NULL,
  author_id TEXT NOT NULL, 
  FOREIGN KEY (author_id) REFERENCES author(id)
);
INSERT INTO author 
VALUES
("T001","machado de assis"),
("T002","Cecilia Meireles"),
("T003","José de Alencar");

INSERT INTO books
VALUES
("A001","o Alienista","T001"),
("A002","Dom Casmurro","T002"),
("A003","o Romances","T003"),
("A004","Capital","T004");
SELECT * FROM books;

SELECT author.id, author.name, books.name_book  FROM author  INNER JOIN books ON books.author_id = author_id;