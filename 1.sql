DROP SCHEMA IF EXISTS Archive CASCADE;
CREATE SCHEMA Archive;

DROP TABLE IF EXISTS Archive.Book;
CREATE TABLE Archive.Book(
book_id int PRIMARY KEY,
series_flg boolean,
pictures_flg boolean,
book_genre_txt varchar(50),
book_nm varchar(50),
series_nm varchar(50),
pages_cnt int,
publishing_house_txt varchar(50)
)
;
DROP TABLE IF EXISTS Archive.Author;
CREATE TABLE Archive.Author(
author_id int PRIMARY KEY,
first_nm varchar(30),
last_nm varchar(30),
birth_year_dt date,
language_txt  varchar(50)
)
;
DROP TABLE IF EXISTS Archive.Illustrator;
CREATE TABLE Archive.Illustrator(
illustrator_id int PRIMARY KEY,
first_nm varchar(30),
last_nm varchar(30),
existence_flg boolean,
material_txt  varchar(100),
style_txt varchar(50)
)
;
DROP TABLE IF EXISTS Archive.Film;
CREATE TABLE Archive.Film(
film_id int PRIMARY KEY,
book_id int,
film_nm varchar(50),
year_dt date,
genre_txt varchar(50),
main_actor_txt varchar(100),
FOREIGN KEY (book_id) REFERENCES Archive.Book(book_id)
)
;
DROP TABLE IF EXISTS Archive.Shop;
CREATE TABLE Archive.Shop(
shop_id int PRIMARY KEY,
shop_nm varchar(30),
only_online_flg boolean,
address_txt varchar(50),
site_txt varchar(100)
)
;
DROP TABLE IF EXISTS Archive.Reader;
CREATE TABLE Archive.Reader(
reader_id int PRIMARY KEY,
reader_rating real,
comment_txt  varchar(1000)
)
;
DROP TABLE IF EXISTS Archive.Purchase;
CREATE TABLE Archive.Purchase(
purchase_id int PRIMARY KEY,
book_id int,
shop_id int,
reader_id int,
cost_amt int,
order_no varchar(20),
FOREIGN KEY (book_id) REFERENCES Archive.Book(book_id),
FOREIGN KEY (shop_id) REFERENCES Archive.Shop(shop_id),
FOREIGN KEY (reader_id) REFERENCES Archive.Reader(reader_id)
)
;
DROP TABLE IF EXISTS Archive.Book_X_Author;
CREATE TABLE Archive.Book_X_Author(
book_id int,
author_id int,
PRIMARY KEY(book_id, author_id),
FOREIGN KEY (book_id) REFERENCES Archive.Book(book_id),
FOREIGN KEY (author_id) REFERENCES Archive.Author(author_id)
)
;
DROP TABLE IF EXISTS Archive.Book_X_Illustrator;
CREATE TABLE Archive.Book_X_Illustrator(
book_id int,
illustrator_id int,
PRIMARY KEY(book_id, illustrator_id),
FOREIGN KEY (book_id) REFERENCES Archive.Book(book_id),
FOREIGN KEY (illustrator_id) REFERENCES Archive.Illustrator(illustrator_id)
)
;
DROP TABLE IF EXISTS Archive.Book_X_Purchase;
CREATE TABLE Archive.Book_X_Purchase(
book_id int,
purchase_id int,
PRIMARY KEY(book_id, purchase_id),
FOREIGN KEY (book_id) REFERENCES Archive.Book(book_id),
FOREIGN KEY (purchase_id) REFERENCES Archive.Purchase(purchase_id)
)
;

-- Для сдачи продемонстрировать работу всех скриптов 
-- Смотрю, что таблички создаются

SELECT *
  FROM Archive.Book;
SELECT *
  FROM Archive.Author;
SELECT *
  FROM Archive.Illustrator;
SELECT *
  FROM Archive.Film;
SELECT *
  FROM Archive.Shop;
SELECT *
  FROM Archive.Reader;
SELECT *
  FROM Archive.Purchase;
SELECT *
  FROM Archive.Book_X_Author;
SELECT *
  FROM Archive.Book_X_Illustrator;
SELECT *
  FROM Archive.Book_X_Purchase;
