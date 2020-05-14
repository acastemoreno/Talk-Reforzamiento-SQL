require 'pg'

conn = PG.connect(dbname: 'reforzamiento-sql', host: "localhost",
  user: "amiguito", password: "123456789")

conn.exec('
  CREATE TABLE IF NOT EXISTS "User"(
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(25) NOT NULL,
    "email" VARCHAR(25) NOT NULL,
    "role" VARCHAR(20) NOT NULL,
    "rate" INTEGER CHECK (rate >= 0)
  );
')

conn.exec('
  CREATE TABLE IF NOT EXISTS "Project"(
    "id" SERIAL PRIMARY KEY ,
    "name" VARCHAR(25) NOT NULL UNIQUE,
    "category" VARCHAR(25) NOT NULL,
    "start" DATE NOT NULL,
    "end" DATE NOT NULL,
    "closed" BOOLEAN NOT NULL DEFAULT false
  );
')

conn.exec('
  CREATE TABLE IF NOT EXISTS "User-Project"(
    "id" SERIAL PRIMARY KEY,
    "user_id" INTEGER REFERENCES "User"(id) NOT NULL,
    "project_id" INTEGER REFERENCES "Project"(id) NOT NULL,
    "total_budget" INTEGER CHECK (total_budget >= 0) NOT NULL
  );
')

conn.exec('
  CREATE TABLE IF NOT EXISTS "Daily-Log"(
    "id" SERIAL PRIMARY KEY,
    "project-member_id" INTEGER REFERENCES "User-Project"(id),
    "date" DATE NOT NULL,
    "hours" INTEGER CHECK (hours >= 0) NOT NULL
  );
')