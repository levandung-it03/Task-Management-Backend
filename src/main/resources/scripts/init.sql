-- === Step 1: Insert authorities ===
INSERT INTO authority (name)
VALUES ('ROLE_ADMIN'),
       ('ROLE_PM'),
       ('ROLE_LEAD'),
       ('ROLE_EMP');

-- === Step 2: Insert accounts ===
-- Replace {ENCODED_PASSWORD} with actual encoded values if needed
INSERT INTO account (username, password, status, created_time, updated_time)
VALUES ('admin@gmail.com', '{ENCODED_PASSWORD}', 1, NOW(), NOW()),
       ('pm@gmail.com', '{ENCODED_PASSWORD}', 1, NOW(), NOW()),
       ('lead@gmail.com', '{ENCODED_PASSWORD}', 1, NOW(), NOW()),
       ('emp@gmail.com', '{ENCODED_PASSWORD}', 1, NOW(), NOW()),
       ('thanhlongphong647@gmail.com', '{ENCODED_PASSWORD}', 1, NOW(), NOW());

-- === Step 3: Insert account-authority mapping ===
INSERT INTO account_authorities (account_id, authority_id)
SELECT a.id, au.id
FROM account a,
     authority au
WHERE a.username = 'admin@gmail.com'
  AND au.name = 'ROLE_ADMIN';

INSERT INTO account_authorities (account_id, authority_id)
SELECT a.id, au.id
FROM account a,
     authority au
WHERE a.username = 'pm@gmail.com'
  AND au.name = 'ROLE_PM';

INSERT INTO account_authorities (account_id, authority_id)
SELECT a.id, au.id
FROM account a,
     authority au
WHERE a.username = 'lead@gmail.com'
  AND au.name = 'ROLE_LEAD';

INSERT INTO account_authorities (account_id, authority_id)
SELECT a.id, au.id
FROM account a,
     authority au
WHERE a.username IN ('emp@gmail.com', 'thanhlongphong647@gmail.com')
  AND au.name = 'ROLE_EMP';

-- === Step 4: Insert departments ===
INSERT INTO department (name)
VALUES ('IT Department'),
       ('HR Department');

-- === Step 5: Insert user_info with full data ===
INSERT INTO user_info (full_name, email, phone, department_id, account_id, date_of_birth)
VALUES ('IT Admin', 'admin@gmail.com', '0123456789',
        (SELECT id FROM department WHERE name = 'IT Department'),
        (SELECT id FROM account WHERE username = 'admin@gmail.com'),
        NULL),
``
       ('Hải PM', 'pm@gmail.com', '0123456790',
        (SELECT id FROM department WHERE name = 'IT Department'),
        (SELECT id FROM account WHERE username = 'pm@gmail.com'),
        NULL),

       ('Le Van Dung', 'lead@gmail.com', '0987654321',
        (SELECT id FROM department WHERE name = 'IT Department'),
        (SELECT id FROM account WHERE username = 'lead@gmail.com'),
        '2003-12-11'),

       ('Lê Văn Dũng', 'emp@gmail.com', '0987654322',
        (SELECT id FROM department WHERE name = 'IT Department'),
        (SELECT id FROM account WHERE username = 'emp@gmail.com'),
        '2003-12-11'),

       ('Dũng Lê Văn', 'thanhlongphong647@gmail.com', '0987654323',
        (SELECT id FROM department WHERE name = 'IT Department'),
        (SELECT id FROM account WHERE username = 'thanhlongphong647@gmail.com'),
        '2003-12-11');
