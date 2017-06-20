-- +micrate Up
CREATE TABLE cats (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR,
  age INT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

-- +micrate Down
DROP TABLE IF EXISTS cats;
