Create database basetest;
\c basetest

CREATE TABLE test_user (
    id BIGSERIAL PRIMARY KEY,
    nom VARCHAR(255),
    email VARCHAR(255)
);
