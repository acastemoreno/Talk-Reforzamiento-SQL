require 'pg'

conn = PG.connect(dbname: 'reforzamiento-sql', host: "localhost",
  user: "amiguito", password: "123456789")


begin
  conn.exec('
    ALTER TABLE IF EXISTS "User"
      ALTER COLUMN "name" TYPE VARCHAR(50),
      ALTER COLUMN "role" TYPE VARCHAR(50),
      ADD CONSTRAINT "User_name_length_check" CHECK (LENGTH("name") <= 50 ),
      ADD CONSTRAINT "User_role_length_check" CHECK (LENGTH("role") <= 50 ),
      ADD CONSTRAINT "User_email_key" UNIQUE ("email")
    ;
  ')
rescue StandardError => e
  puts e.message
end

begin
  conn.exec('
    ALTER TABLE IF EXISTS "Project"
      ADD CONSTRAINT "End_after_start_check" CHECK ("end" > "start" )
    ;
  ')
rescue StandardError => e
  puts e.message
end

begin
  conn.exec('
    ALTER TABLE IF EXISTS "User-Project"
      ADD CONSTRAINT "User-Project_unique" UNIQUE("user_id", "project_id")
    ;
  ')
rescue StandardError => e
  puts e.message
end

begin
  conn.exec('
    ALTER TABLE IF EXISTS "Daily-Log"
      ADD CONSTRAINT "UserProject-date_unique" UNIQUE("project-member_id", "date")
    ;
  ')
rescue StandardError => e
  puts e.message
end
