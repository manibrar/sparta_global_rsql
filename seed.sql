DROP TABLE IF EXISTS SHIRTS;

CREATE TABLE SHIRTS (

  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  body TEXT

);

INSERT INTO SHIRTS (title , body) VALUES ('Extra Small' , 'shirt text 1');
INSERT INTO SHIRTS (title , body) VALUES ('Small' , 'shirt text 2');
INSERT INTO SHIRTS (title , body) VALUES ('Medium' , 'shirt text 3');
INSERT INTO SHIRTS (title , body) VALUES ('Large' , 'shirt text 4');
