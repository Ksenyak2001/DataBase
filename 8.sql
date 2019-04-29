-- Book, Author, Illustrator
CREATE OR REPLACE VIEW BookAuthorIllustratorView AS
  SELECT
    DISTINCT book_nm, CONCAT(Author.first_nm, ' ', Author.last_nm) AS author, birth_year_dt AS birth_date_author,
    CASE
      when Archive.Illustrator.first_nm IS NOT NULL
      then CONCAT(Illustrator.first_nm, ' ', Illustrator.last_nm)
      else '-'
    END AS llustrator
  FROM
    Archive.Book JOIN
    Archive.Book_X_Author ON book.book_id = book_x_author.book_id  JOIN
    Archive.Author ON book_x_author.author_id = author.author_id JOIN
    Archive.Book_X_Illustrator ON book.book_id = book_x_illustrator.book_id JOIN
    Archive.Illustrator ON book_x_illustrator.illustrator_id = illustrator.illustrator_id
  GROUP BY
    book_nm, Author.first_nm, Author.last_nm, Illustrator.first_nm, Illustrator.last_nm, birth_year_dt
  ORDER BY
    book_nm;

SELECT
  *
FROM
  BookAuthorIllustratorView;

-- Book, Purchase, Shop, Reader
CREATE OR REPLACE VIEW BookPurchaseShopReaderView AS
  SELECT
    book_nm, cost_amt,
    CASE
      when shop_nm IS NOT NULL
      then shop_nm
      else '-'
    END AS shop,
    CASE
      when site_txt IS NOT NULL
      then site_txt
      else '-'
    END AS site,
    reader_rating,
    CASE
      when comment_txt IS NOT NULL
      then comment_txt
      else '-'
    END AS comment
  FROM
    Archive.Book JOIN
    Archive.Book_X_Purchase ON book.book_id = book_x_purchase.book_id JOIN
    Archive.Purchase ON book.book_id = purchase.book_id JOIN
    Archive.Reader ON purchase.reader_id = reader.reader_id JOIN
    Archive.Shop ON purchase.shop_id = shop.shop_id
  GROUP BY
    book_nm, cost_amt, shop_nm, reader_rating, comment_txt, site_txt
  ORDER BY
    book_nm;

SELECT
  *
FROM
  BookPurchaseShopReaderView;
