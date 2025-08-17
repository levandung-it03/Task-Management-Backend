-- Reset tất cả table (nếu có dữ liệu cũ)
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE `authority`;
TRUNCATE TABLE `account`;
TRUNCATE TABLE `user_info`;
TRUNCATE TABLE `department`;
TRUNCATE TABLE `project`;
TRUNCATE TABLE `project_role`;
TRUNCATE TABLE `collection`;
TRUNCATE TABLE `phase`;
TRUNCATE TABLE `task`;
TRUNCATE TABLE `task_for_users`;
SET FOREIGN_KEY_CHECKS = 1;

-- 1. Tạo Departments
INSERT IGNORE INTO department (name)
VALUES ('IT'),
       ('HR'),
       ('Sales');

-- 2. Tạo Authority dựa theo AuthorityEnum (ROLE_ADMIN, ROLE_PM, ROLE_LEAD, ROLE_EMP)
INSERT IGNORE INTO authority (name)
VALUES ('ROLE_ADMIN'),
       ('ROLE_PM'),
       ('ROLE_LEAD'),
       ('ROLE_EMP');

-- Lấy ID Authority để tạo AccountRole nếu cần (nếu dùng bảng join riêng) - ở đây bạn không có bảng Role riêng nên dùng List<Authority> trong Account

-- 3. Tạo 10 Account ROLE_EMPLOYEE
INSERT IGNORE INTO account (username, password, status, created_time, updated_time)
VALUES ('employee1', '$2a$08$l11nU8s5XrHEmTRRvxjU1OyX1SAfEJ/Y0Juk8jQrO0.yiW85up0QG', 1, NOW(), NOW()),
       ('employee2', '$2a$08$l11nU8s5XrHEmTRRvxjU1OyX1SAfEJ/Y0Juk8jQrO0.yiW85up0QG', 1, NOW(), NOW()),
       ('employee3', '$2a$08$l11nU8s5XrHEmTRRvxjU1OyX1SAfEJ/Y0Juk8jQrO0.yiW85up0QG', 1, NOW(), NOW()),
       ('employee4', '$2a$08$l11nU8s5XrHEmTRRvxjU1OyX1SAfEJ/Y0Juk8jQrO0.yiW85up0QG', 1, NOW(), NOW()),
       ('employee5', '$2a$08$l11nU8s5XrHEmTRRvxjU1OyX1SAfEJ/Y0Juk8jQrO0.yiW85up0QG', 1, NOW(), NOW()),
       ('employee6', '$2a$08$l11nU8s5XrHEmTRRvxjU1OyX1SAfEJ/Y0Juk8jQrO0.yiW85up0QG', 1, NOW(), NOW()),
       ('employee7', '$2a$08$l11nU8s5XrHEmTRRvxjU1OyX1SAfEJ/Y0Juk8jQrO0.yiW85up0QG', 1, NOW(), NOW()),
       ('employee8', '$2a$08$l11nU8s5XrHEmTRRvxjU1OyX1SAfEJ/Y0Juk8jQrO0.yiW85up0QG', 1, NOW(), NOW()),
       ('employee9', '$2a$08$l11nU8s5XrHEmTRRvxjU1OyX1SAfEJ/Y0Juk8jQrO0.yiW85up0QG', 1, NOW(), NOW()),
       ('employee10', '$2a$08$l11nU8s5XrHEmTRRvxjU1OyX1SAfEJ/Y0Juk8jQrO0.yiW85up0QG', 1, NOW(), NOW());

-- 4. Tạo 3 Account ROLE_LEAD
INSERT IGNORE INTO account (username, password, status, created_time, updated_time)
VALUES ('lead1', '$2a$08$l11nU8s5XrHEmTRRvxjU1OyX1SAfEJ/Y0Juk8jQrO0.yiW85up0QG', 1, NOW(), NOW()),
       ('lead2', '$2a$08$l11nU8s5XrHEmTRRvxjU1OyX1SAfEJ/Y0Juk8jQrO0.yiW85up0QG', 1, NOW(), NOW()),
       ('lead3', '$2a$08$l11nU8s5XrHEmTRRvxjU1OyX1SAfEJ/Y0Juk8jQrO0.yiW85up0QG', 1, NOW(), NOW());

-- 5. Tạo 1 Account ROLE_PM (Owner project)
INSERT IGNORE INTO account (username, password, status, created_time, updated_time)
VALUES ('pm1', '$2a$08$l11nU8s5XrHEmTRRvxjU1OyX1SAfEJ/Y0Juk8jQrO0.yiW85up0QG', 1, NOW(), NOW());

INSERT IGNORE INTO account (username, password, status, created_time, updated_time)
VALUES ('admin', '$2a$08$l11nU8s5XrHEmTRRvxjU1OyX1SAfEJ/Y0Juk8jQrO0.yiW85up0QG', 1, NOW(), NOW());

-- ROLE_EMP cho 10 employee
INSERT IGNORE INTO account_authorities (account_id, authority_id)
SELECT a.id, au.id
FROM account a
         JOIN authority au ON au.name = 'ROLE_EMP'
WHERE a.username IN ('employee1', 'employee2', 'employee3', 'employee4', 'employee5',
                     'employee6', 'employee7', 'employee8', 'employee9', 'employee10');

-- ROLE_LEAD cho 3 lead
INSERT IGNORE INTO account_authorities (account_id, authority_id)
SELECT a.id, au.id
FROM account a
         JOIN authority au ON au.name = 'ROLE_LEAD'
WHERE a.username IN ('lead1', 'lead2', 'lead3');

-- ROLE_PM cho 1 PM
INSERT IGNORE INTO account_authorities (account_id, authority_id)
SELECT a.id, au.id
FROM account a
         JOIN authority au ON au.name = 'ROLE_PM'
WHERE a.username = 'pm1';

INSERT IGNORE INTO account_authorities (account_id, authority_id)
SELECT a.id, au.id
FROM account a
         JOIN authority au ON au.name = 'ROLE_ADMIN'
WHERE a.username = 'admin';

-- 6. Tạo UserInfo liên kết Account, 10 employee + 3 lead + 1 pm, phòng ban assign đơn giản
INSERT IGNORE INTO user_info (full_name, email, phone, identity, department_id, account_id)
VALUES ('Employee 1', 'employee1@example.com', '0900000001', '001', 1, 1),
       ('Employee 2', 'employee2@example.com', '0900000002', '002', 1, 2),
       ('Employee 3', 'employee3@example.com', '0900000003', '003', 1, 3),
       ('Employee 4', 'employee4@example.com', '0900000004', '004', 1, 4),
       ('Employee 5', 'employee5@example.com', '0900000005', '005', 1, 5),
       ('Employee 6', 'employee6@example.com', '0900000006', '006', 1, 6),
       ('Employee 7', 'employee7@example.com', '0900000007', '007', 1, 7),
       ('Employee 8', 'employee8@example.com', '0900000008', '008', 1, 8),
       ('Employee 9', 'employee9@example.com', '0900000009', '009', 1, 9),
       ('Employee 10', 'employee10@example.com', '0900000010', '010', 1, 10),
       ('Lead 1', 'levandung.it03@gmail.com', '0910000001', '011', 2, 11),
       ('Lead 2', 'lead2@example.com', '0910000002', '012', 2, 12),
       ('Lead 3', 'lead3@example.com', '0910000003', '013', 2, 13),
       ('PM 1', 'pm1@example.com', '0920000001', '014', 3, 14),
       ('ADMIN', 'admin@example.com', '0920000001', '014', 3, 15);

-- Tạo các Groups
INSERT IGNORE INTO `group` (created_by_id, name, active, created_time, updated_time)
VALUES
    (14, 'Group Alpha', 1, NOW(), NOW()),
    (14, 'Group Beta', 1, NOW(), NOW());

INSERT IGNORE INTO group_has_users (joined_user_info_id, group_id, role, involved_time, active)
VALUES
    (14, 1, 'ADMIN', NOW(), 1),
    (13, 1, 'MEMBER', NOW(), 1),
    (12, 1, 'MEMBER', NOW(), 1),
    (11, 1, 'MEMBER', NOW(), 1),
    (14, 2, 'ADMIN', NOW(), 1),
    (10, 2, 'MEMBER', NOW(), 1),
    (9, 2, 'MEMBER', NOW(), 1),
    (8, 2, 'MEMBER', NOW(), 1);

-- Kiểm tra lại AUTO_INCREMENT các bảng để tránh lỗi
ALTER TABLE authority
    AUTO_INCREMENT = 5;
ALTER TABLE account
    AUTO_INCREMENT = 15;
ALTER TABLE user_info
    AUTO_INCREMENT = 15;
ALTER TABLE department
    AUTO_INCREMENT = 4;
ALTER TABLE `group`
    AUTO_INCREMENT = 3;
ALTER TABLE group_has_users
    AUTO_INCREMENT = 9;

-- COMMIT nếu cần
