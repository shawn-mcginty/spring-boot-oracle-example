CREATE USER springboot IDENTIFIED BY springboot1;

GRANT CONNECT, RESOURCE TO springboot;

GRANT UNLIMITED TABLESPACE TO springboot;

CONNECT springboot/springboot1;

CREATE TABLE users (id INT PRIMARY KEY, username VARCHAR(255));

CREATE SEQUENCE seq_users_id
    START WITH 1
    INCREMENT BY 1;


-- some seed data
INSERT INTO users(id, username) VALUES(seq_users_id.nextval, 'username1');
INSERT INTO users(id, username) VALUES(seq_users_id.nextval, 'username2');
INSERT INTO users(id, username) VALUES(seq_users_id.nextval, 'username3');
INSERT INTO users(id, username) VALUES(seq_users_id.nextval, 'username4');
INSERT INTO users(id, username) VALUES(seq_users_id.nextval, 'username5');
INSERT INTO users(id, username) VALUES(seq_users_id.nextval, 'username6');
INSERT INTO users(id, username) VALUES(seq_users_id.nextval, 'username7');
INSERT INTO users(id, username) VALUES(seq_users_id.nextval, 'username8');
INSERT INTO users(id, username) VALUES(seq_users_id.nextval, 'username9');
INSERT INTO users(id, username) VALUES(seq_users_id.nextval, 'username10');