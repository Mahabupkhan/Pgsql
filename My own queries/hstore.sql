--HStore

--Installing hstore
CREATE EXTENSION IF NOT EXISTS "hstore";

CREATE TABLE books(
	bood_id serial primary key,
	title VARCHAR(30),
	book_info hstore
);

INSERT INTO books (title,book_info)
VALUES (
	'Title',
	'
	"Publisher" =>"ABC publishers",
	"paper_cost" => "10.00",
	"e_cost" =>"5.50"
	'
),
(
	'Thirukural',
	'
		"Book id" =>"123",
		"Book cost" =>"100",
		"Author" =>"Mr thiruvalluvar"
	'
);
select book_info -> 'Author' from books where title='Thirukural'

SELECT * FROM books;






