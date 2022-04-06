CREATE TABLE IF NOT EXISTS nano_blob
(
    id   SERIAL PRIMARY KEY,
    key  VARCHAR UNIQUE NOT NULL,
    blob TEXT DEFAULT ''
);