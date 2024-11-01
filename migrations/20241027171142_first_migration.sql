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

INSERT INTO masters (name, uuid, created_at, updated_at) VALUES ('Manuel', gen_random_uuid(), NOW(), NOW());
INSERT INTO cats (name, uuid, color, master_id, created_at, updated_at) VALUES ('Coco', gen_random_uuid(), 'Black & White', 1, NOW(), NOW());

-- migrate:down
DROP TABLE cats;
DROP TABLE masters;