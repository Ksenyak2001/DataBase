
SELECT
  *
FROM
  Archive.Purchase;

SELECT
  *
FROM
  Archive.Author;

UPDATE Archive.Purchase SET shop_id = 1 WHERE order_no = 'VER94-244-BSK';
UPDATE Archive.Author SET last_nm = 'Moyes' WHERE last_nm = 'Moys';
UPDATE Archive.Author SET language_txt = 'english, russian' WHERE language_txt = 'english';

INSERT INTO Archive.Purchase VALUES(19, 1, 3, 1, 829, 'STH95hbwn46negnW');
INSERT INTO Archive.Author VALUES(8, 'Cornelia', 'Funke', '1958-12-10', 'english');

SELECT
  *
FROM
  Archive.Purchase;

SELECT
  *
FROM
  Archive.Author;

DELETE FROM Archive.Purchase WHERE purchase_id > 18;
DELETE FROM Archive.Author WHERE author_id > 7;

SELECT
  *
FROM
  Archive.Purchase;

SELECT
  *
FROM
  Archive.Author;
