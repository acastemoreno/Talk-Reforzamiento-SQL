require 'pg'

conn = PG.connect(dbname: 'reforzamiento-sql', host: "localhost",
  user: "amiguito", password: "123456789")


begin
  conn.exec(%Q(
    INSERT INTO "User"
    ("name", "email", "role", "rate")
    VALUES ('Renato', 'renato@codeable.pe', 'front-end developer senior', 30),
          ('Paty', 'paty@codeable.pe', 'back-end developer senior', 32),
          ('Franco', 'franco@codeable.pe', 'front-end developer junior', 15),
          ('Luis', 'luis@codeable.pe', 'back-end developer junior', 16)
    ;
  ))
rescue StandardError => e
  puts e.message
end

begin
  conn.exec(%Q(
    INSERT INTO "Project"
    ("name", "category", "start", "end", "closed")
    VALUES 
      ('Shiftme', 'Bussiness', '2020/05/13', '2020/08/11', false),
      ('Line Balancing', 'Bussiness', '2020/05/13', '2020/09/10', false),
      ('Overbooking', 'Bussiness', '2020/05/13', '2020/10/10', false),
      ('Kampu', 'Sport', '2020/05/13', '2020/06/27', false),
      ('Codeable App', 'Education', '2020/05/13', '2020/11/09', false)
    ;
  ))
rescue StandardError => e
  puts e.message
end

begin
  conn.exec(%Q(
    INSERT INTO "User-Project"
    ("user_id", "project_id", "total_budget")
    VALUES 
      (
        (SELECT id FROM "User" WHERE name = 'Paty' LIMIT 1),
        (SELECT id FROM "Project" WHERE name = 'Codeable App' LIMIT 1),
        23040
      ),
      (
        (SELECT id FROM "User" WHERE name = 'Franco' LIMIT 1),
        (SELECT id FROM "Project" WHERE name = 'Codeable App' LIMIT 1),
        16200
      ),
      (
        (SELECT id FROM "User" WHERE name = 'Luis' LIMIT 1),
        (SELECT id FROM "Project" WHERE name = 'Codeable App' LIMIT 1),
        5760
      ),
      (
        (SELECT id FROM "User" WHERE name = 'Paty' LIMIT 1),
        (SELECT id FROM "Project" WHERE name = 'Kampu' LIMIT 1),
        5760
      ),
      (
        (SELECT id FROM "User" WHERE name = 'Luis' LIMIT 1),
        (SELECT id FROM "Project" WHERE name = 'Kampu' LIMIT 1),
        2880
      ),
      (
        (SELECT id FROM "User" WHERE name = 'Renato' LIMIT 1),
        (SELECT id FROM "Project" WHERE name = 'Line Balancing' LIMIT 1),
        8640
      ),
      (
        (SELECT id FROM "User" WHERE name = 'Renato' LIMIT 1),
        (SELECT id FROM "Project" WHERE name = 'Overbooking' LIMIT 1),
        18000
      ),
      (
        (SELECT id FROM "User" WHERE name = 'Renato' LIMIT 1),
        (SELECT id FROM "Project" WHERE name = 'Shiftme' LIMIT 1),
        4320
      ),
      (
        (SELECT id FROM "User" WHERE name = 'Franco' LIMIT 1),
        (SELECT id FROM "Project" WHERE name = 'Shiftme' LIMIT 1),
        2700
      ),
      (
        (SELECT id FROM "User" WHERE name = 'Luis' LIMIT 1),
        (SELECT id FROM "Project" WHERE name = 'Shiftme' LIMIT 1),
        2700
      )
    ;
  ))
rescue StandardError => e
  puts e.message
end

begin
  conn.exec(%Q(
    INSERT INTO "Daily-Log"
    ("project-member_id", "date", "hours")
    VALUES 
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Paty' AND p.name = 'Codeable App'
          LIMIT 1
        ),
        '2020/05/13',
        4
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Paty' AND p.name = 'Codeable App'
          LIMIT 1
        ),
        '2020/05/14',
        6
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Paty' AND p.name = 'Codeable App'
          LIMIT 1
        ),
        '2020/05/15',
        8
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Paty' AND p.name = 'Codeable App'
          LIMIT 1
        ),
        '2020/05/16',
        8
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Paty' AND p.name = 'Codeable App'
          LIMIT 1
        ),
        '2020/05/17',
        8
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Franco' AND p.name = 'Codeable App'
          LIMIT 1
        ),
        '2020/05/13',
        3
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Franco' AND p.name = 'Codeable App'
          LIMIT 1
        ),
        '2020/05/14',
        6
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Franco' AND p.name = 'Codeable App'
          LIMIT 1
        ),
        '2020/05/15',
        4
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Franco' AND p.name = 'Codeable App'
          LIMIT 1
        ),
        '2020/05/16',
        4
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Franco' AND p.name = 'Codeable App'
          LIMIT 1
        ),
        '2020/05/17',
        5
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Luis' AND p.name = 'Codeable App'
          LIMIT 1
        ),
        '2020/05/13',
        4
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Luis' AND p.name = 'Codeable App'
          LIMIT 1
        ),
        '2020/05/14',
        2
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Luis' AND p.name = 'Codeable App'
          LIMIT 1
        ),
        '2020/05/15',
        5
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Luis' AND p.name = 'Codeable App'
          LIMIT 1
        ),
        '2020/05/16',
        4
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Luis' AND p.name = 'Codeable App'
          LIMIT 1
        ),
        '2020/05/17',
        4
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Paty' AND p.name = 'Kampu'
          LIMIT 1
        ),
        '2020/05/13',
        4
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Paty' AND p.name = 'Kampu'
          LIMIT 1
        ),
        '2020/05/14',
        2
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Luis' AND p.name = 'Kampu'
          LIMIT 1
        ),
        '2020/05/13',
        2
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Luis' AND p.name = 'Kampu'
          LIMIT 1
        ),
        '2020/05/14',
        2
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Renato' AND p.name = 'Line Balancing'
          LIMIT 1
        ),
        '2020/05/13',
        3
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Renato' AND p.name = 'Line Balancing'
          LIMIT 1
        ),
        '2020/05/14',
        4
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Renato' AND p.name = 'Line Balancing'
          LIMIT 1
        ),
        '2020/05/15',
        3
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Renato' AND p.name = 'Line Balancing'
          LIMIT 1
        ),
        '2020/05/16',
        4
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Renato' AND p.name = 'Line Balancing'
          LIMIT 1
        ),
        '2020/05/17',
        5
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Renato' AND p.name = 'Overbooking'
          LIMIT 1
        ),
        '2020/05/13',
        3
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Renato' AND p.name = 'Overbooking'
          LIMIT 1
        ),
        '2020/05/14',
        2
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Renato' AND p.name = 'Overbooking'
          LIMIT 1
        ),
        '2020/05/15',
        1
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Renato' AND p.name = 'Overbooking'
          LIMIT 1
        ),
        '2020/05/16',
        1
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Renato' AND p.name = 'Overbooking'
          LIMIT 1
        ),
        '2020/05/17',
        1
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Renato' AND p.name = 'Shiftme'
          LIMIT 1
        ),
        '2020/05/13',
        2
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Renato' AND p.name = 'Shiftme'
          LIMIT 1
        ),
        '2020/05/14',
        2
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Renato' AND p.name = 'Shiftme'
          LIMIT 1
        ),
        '2020/05/15',
        4
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Renato' AND p.name = 'Shiftme'
          LIMIT 1
        ),
        '2020/05/16',
        3
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Renato' AND p.name = 'Shiftme'
          LIMIT 1
        ),
        '2020/05/17',
        2
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Franco' AND p.name = 'Shiftme'
          LIMIT 1
        ),
        '2020/05/13',
        5
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Franco' AND p.name = 'Shiftme'
          LIMIT 1
        ),
        '2020/05/14',
        2
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Franco' AND p.name = 'Shiftme'
          LIMIT 1
        ),
        '2020/05/15',
        4
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Franco' AND p.name = 'Shiftme'
          LIMIT 1
        ),
        '2020/05/16',
        4
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Franco' AND p.name = 'Shiftme'
          LIMIT 1
        ),
        '2020/05/17',
        4
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Luis' AND p.name = 'Shiftme'
          LIMIT 1
        ),
        '2020/05/13',
        2
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Luis' AND p.name = 'Shiftme'
          LIMIT 1
        ),
        '2020/05/14',
        4
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Luis' AND p.name = 'Shiftme'
          LIMIT 1
        ),
        '2020/05/15',
        3
      ),
      (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Luis' AND p.name = 'Shiftme'
          LIMIT 1
        ),
        '2020/05/16',
        4
      ),
        (
        (
          SELECT up.id from "User-Project" as up
          JOIN "User" AS u ON u.id = up.user_id
          JOIN "Project" AS p ON p.id = up.project_id
          WHERE u.name = 'Luis' AND p.name = 'Shiftme'
          LIMIT 1
        ),
        '2020/05/17',
        4
      )
    ; 
  ))
rescue StandardError => e
  puts e.message
end