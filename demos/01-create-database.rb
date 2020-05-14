require 'pg'

conn = PG.connect(dbname: 'postgres', host: "localhost", 
  user: "amiguito", password: "123456789")

begin
  conn.exec('CREATE DATABASE "reforzamiento-sql"')
rescue StandardError => e
  puts e.message
end