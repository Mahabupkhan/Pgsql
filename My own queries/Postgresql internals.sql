SELECT * FROM pg_user;

SELECT 
	datname,
	pg_size_pretty(pg_database_size(datname))
FROM pg_database
ORDER BY 2;

SELECT * FROM media_files;


DO $$
BEGIN
FOR i IN 1..10
LOOP
INSERT INTO media_files(name,file_type,media_data) VALUES ('Jameel','Image',pg_read_binary_file('E:\Fried rice\IMG_20240817_162812.jpg'));
END LOOP;
END;
$$



SELECT media_data From media_files where id > 5

















