-- +micrate Up
CREATE TABLE dogs (
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR,
  color VARCHAR,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

-- +micrate Down
DROP TABLE IF EXISTS dogs;
