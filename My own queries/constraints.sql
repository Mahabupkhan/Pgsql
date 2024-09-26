--Constraints
CREATE TABLE web_links(
	link_id SERIAL PRIMARY KEY,
	link_address VARCHAR(100)
);
SELECT * FROM web_links;

INSERT INTO web_links(link_address,link_target,is_enable) VALUES('www.netflix.com','Netflix','Y');

ALTER TABLE web_links add link_target VARCHAR(30);

--How to add constraints (We have to mention the constraint name)
ALTER TABLE web_links ADD CONSTRAINT unique_web_url UNIQUE (link_address);

ALTER TABLE web_links ADD is_enable VARCHAR(2)

--The below query makes the is_enable column only accepts 'Y' and 'N'
ALTER TABLE web_links ADD CHECK(is_enable IN('Y','N'));














