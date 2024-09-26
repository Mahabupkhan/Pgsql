CREATE TABLE media_files (
    id SERIAL PRIMARY KEY,
    name TEXT,                -- File name
    file_type TEXT,           -- File type (e.g., 'video', 'image', 'audio')
    media_data BYTEA          -- Column to store the binary data (BLOB)
);
INSERT INTO media_files (name, file_type, media_data)
VALUES ('My Video', 'image', pg_read_binary_file('E:\Fried rice\IMG_20240817_162812.jpg'));

SELECT * FROM media_files;

DO $$
DECLARE
    video_data BYTEA;
BEGIN
    -- Fetch the media data (binary file) from the database
    SELECT media_data INTO video_data
    FROM media_files
    WHERE name = 'My Video';

    -- Write the binary data to a file
    PERFORM pg_write_file('E:\', video_data);
END $$;
