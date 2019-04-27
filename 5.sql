-- Вывод современных авторов, с комментариями про их годы жизни
SELECT
  first_nm AS name, last_nm AS surname, date_part('year', birth_year_dt) AS year,
  CASE
      when date_part('year', birth_year_dt) >= 1900 AND date_part('year', birth_year_dt) < 1950
      then 'The twentieth century author.'
      when date_part('year', birth_year_dt) > 1950
      then 'The author of the second half of the twentieth century.'
      else 'The author lived at another time.'
  END AS Comment
FROM
  Archive.Author
ORDER BY
  birth_year_dt;

-- Вывод книг дешевле средней цены книг в порядке убывания цены
SELECT
  book_nm AS book, cost_amt AS price
FROM
  Archive.Purchase JOIN
  Archive.Book ON Purchase.book_id = Book.book_id
WHERE
  cost_amt > (SELECT AVG(cost_amt)
              FROM Archive.Purchase)
GROUP BY
  book_nm, cost_amt
ORDER BY
  cost_amt DESC;

-- Вывод книг и их авторов, иллюстраторов
SELECT
  book_nm AS book, Archive.Author.first_nm AS name_author, Archive.Author.last_nm AS surname_author,
  CASE
    when Archive.Illustrator.first_nm IS NOT NULL
    then Archive.Illustrator.first_nm
    else '-'
  END AS name_illustrator,
  CASE
    when Archive.Illustrator.last_nm IS NOT NULL
    then Archive.Illustrator.last_nm
    else '-'
  END AS surname_illustrator
FROM
  Archive.Author JOIN
  Archive.Book_X_Author ON author.author_id = book_x_author.author_id JOIN
  Archive.Book ON book_x_author.book_id = book.book_id JOIN
  Archive.Book_X_Illustrator ON book.book_id = book_x_illustrator.book_id JOIN
  Archive.Illustrator ON book_x_illustrator.illustrator_id = illustrator.illustrator_id;

-- Вывод книг с читательским рейтингом больше 5.0 (половины) в порядке возрастания рейтинга
SELECT DISTINCT
  book_nm AS book, reader_rating
FROM
  Archive.Book JOIN
  Archive.Book_X_Purchase ON book.book_id = book_x_purchase.book_id JOIN
  Archive.Purchase ON book.book_id = purchase.book_id JOIN
  Archive.Reader ON purchase.reader_id = reader.reader_id
WHERE
  reader_rating > 5.0
ORDER BY
  reader_rating;

-- Вывод книг, комментариев читателей по ним, там где комментарии есть(не NULL)
SELECT DISTINCT
  book_nm AS book, comment_txt AS comment
FROM
  Archive.Book JOIN
  Archive.Book_X_Purchase ON book.book_id = book_x_purchase.book_id JOIN
  Archive.Purchase ON book.book_id = purchase.book_id JOIN
  Archive.Reader ON purchase.reader_id = reader.reader_id
WHERE
  comment_txt IS NOT NUlL;
