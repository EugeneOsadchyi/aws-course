USE aws_training;

CREATE TABLE IF NOT EXISTS users (
  id INTEGER NOT NULL AUTO_INCREMENT,
  name VARCHAR(128) NOT NULL,
  title VARCHAR(128),
  PRIMARY KEY (id)
);

INSERT INTO users
  (name, title)
  VALUES ("Eugene", "Software Engineer");

SELECT * FROM users;
