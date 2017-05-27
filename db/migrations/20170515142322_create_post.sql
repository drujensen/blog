-- +micrate Up
CREATE TABLE posts (
  id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255),
  body TEXT,
  published BOOL,
  created_at TIMESTAMP NULL,
  updated_at TIMESTAMP NULL
);

-- +micrate Down
DROP TABLE IF EXISTS posts;
