DROP TABLE IF EXISTS shirt;

CREATE TABLE shirt (

  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  body TEXT

);

INSERT INTO shirt (title , body) VALUES ('1' , 'shirt text 1');
INSERT INTO shirt (title , body) VALUES ('2' , 'shirt text 2');
INSERT INTO shirt (title , body) VALUES ('3' , 'shirt text 3');
INSERT INTO shirt (title , body) VALUES ('4' , 'shirt text 4');
