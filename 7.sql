-- Book
CREATE OR REPLACE VIEW BookView AS
  SELECT
     series_flg, pictures_flg, book_genre_txt, book_nm, series_nm, pages_cnt, '***********' AS publishing_house_txt
  FROM
    Archive.Book;

SELECT
  *
FROM
  BookView;

-- Author
CREATE OR REPLACE VIEW AuthorView AS
  SELECT
    first_nm, last_nm, '********' AS language_txt
  FROM
    Archive.Author;

SELECT
  *
FROM
  AuthorView;

-- Illustrator
CREATE OR REPLACE VIEW IllustratorView AS
  SELECT
    first_nm, last_nm, material_txt, '********' AS style_txt
  FROM
    Archive.Illustrator
  WHERE
    first_nm IS NOT NULL;

SELECT
  *
FROM
  IllustratorView;

-- Film
CREATE OR REPLACE VIEW FilmView AS
  SELECT
    film_nm, genre_txt, main_actor_txt, '**** ** **' AS year_dt
  FROM
    Archive.Film;

SELECT
  *
FROM
  FilmView;

-- Shop
CREATE OR REPLACE VIEW ShopView AS
  SELECT
    shop_nm, only_online_flg, 'https://********.ru' AS site_txt
  FROM
    Archive.Shop
  WHERE
    shop_nm IS NOT NULL;

SELECT
  *
FROM
  ShopView;

-- Reader
CREATE OR REPLACE VIEW ReaderView AS
  SELECT
    reader_rating,
    CASE
      when comment_txt IS NOT NULL
      then comment_txt
      else '-'
    END AS comment_txt
  FROM
    Archive.Reader;

SELECT
  *
FROM
  ReaderView;

-- Purchase
CREATE OR REPLACE VIEW PurchaseView AS
  SELECT
    cost_amt, '********' AS order_no
  FROM
    Archive.Purchase;

SELECT
  *
FROM
  PurchaseView;

-- Book_X_Author
CREATE OR REPLACE VIEW BookAuthorView AS
  SELECT
    book_id, '**' AS author_id
  FROM
    Archive.Book_X_Author;

SELECT
  *
FROM
  BookAuthorView;

-- Book_X_Illustrator
CREATE OR REPLACE VIEW BookIllustratorView AS
  SELECT
    book_id, '**' AS illustrator_id
  FROM
    Archive.Book_X_Illustrator;

SELECT
  *
FROM BookIllustratorView;

-- Book_X_Purchase
CREATE OR REPLACE VIEW BookPurchaseView AS
  SELECT
    book_id, '**' AS purchase_id
  FROM
    Archive.Book_X_Purchase
  ORDER BY
    book_id;

SELECT
  *
FROM BookPurchaseView;

