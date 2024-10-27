-- migrate:up
CREATE EXTENSION IF NOT EXISTS pgcrypto;

CREATE TABLE masters (
    id SERIAL PRIMARY KEY,
    uuid uuid NOT NULL,
    name VARCHAR(200) NOT NULL,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

CREATE TABLE cats (
    id SERIAL PRIMARY KEY,
    uuid uuid NOT NULL,
    name VARCHAR(200) NOT NULL,
    color VARCHAR(40) NOT NULL,
    master_id int REFERENCES masters(id),
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL
);

INSERT INTO masters (name, uuid, created_at, updated_at) VALUES ('Manuel', '783c5862-3b41-4a94-9a44-0ea1b0d7fbd9', NOW(), NOW());
INSERT INTO cats (name, uuid, color, master_id, created_at, updated_at) VALUES ('Coco', 'cfd4d2ea-263b-4d2c-b7f7-0ba6799749b5', 'Black & White', 1, NOW(), NOW());

-- migrate:down
DROP TABLE cats;
DROP TABLE masters;