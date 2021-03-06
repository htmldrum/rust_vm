-- sets the encoding of the default database template to utf8

UPDATE pg_database SET datallowconn = TRUE WHERE datname = 'template0';

\c template0
UPDATE pg_database SET datistemplate = FALSE WHERE datname = 'template1';
DROP DATABASE template1;
CREATE DATABASE template1 WITH ENCODING = 'UTF-8' LC_CTYPE = 'en_US.utf8' LC_COLLATE = 'en_US.utf8' template = template0;
UPDATE pg_database SET datistemplate = TRUE WHERE datname = 'template1';

\c template1
UPDATE pg_database SET datallowconn = FALSE WHERE datname = 'template0';