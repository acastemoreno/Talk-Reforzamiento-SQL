require 'pg'

conn = PG.connect(dbname: 'reforzamiento-sql', host: "localhost",
  user: "amiguito", password: "123456789")

begin
  conn.exec(%Q(
    SELECT DISTINCT p.name AS "project_name", COUNT(u.*) AS "user_count"
    FROM "Project" as p
    JOIN "User-Project" as up ON up.project_id = p.id
    JOIN "User" as u ON u.id = up.user_id
    GROUP BY p.id
    ORDER BY "project_name" DESC
  )) do |result|
    result.each do |row|
      p row
    end
  end
rescue StandardError => e
  puts e.message
end