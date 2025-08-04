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
-- Nếu còn bảng phụ thì tương tự
SET FOREIGN_KEY_CHECKS = 1;

-- 1. Tạo Departments
INSERT INTO department (name)
VALUES ('IT'),
       ('HR'),
       ('Sales');

-- 2. Tạo Authority dựa theo AuthorityEnum (ROLE_ADMIN, ROLE_PM, ROLE_LEAD, ROLE_EMP)
INSERT INTO authority (name)
VALUES ('ROLE_ADMIN'),
       ('ROLE_PM'),
       ('ROLE_LEAD'),
       ('ROLE_EMP');

-- Lấy ID Authority để tạo AccountRole nếu cần (nếu dùng bảng join riêng) - ở đây bạn không có bảng Role riêng nên dùng List<Authority> trong Account

-- 3. Tạo 10 Account ROLE_EMPLOYEE
INSERT INTO account (username, password, status, created_time, updated_time)
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
INSERT INTO account (username, password, status, created_time, updated_time)
VALUES ('lead1', '$2a$08$l11nU8s5XrHEmTRRvxjU1OyX1SAfEJ/Y0Juk8jQrO0.yiW85up0QG', 1, NOW(), NOW()),
       ('lead2', '$2a$08$l11nU8s5XrHEmTRRvxjU1OyX1SAfEJ/Y0Juk8jQrO0.yiW85up0QG', 1, NOW(), NOW()),
       ('lead3', '$2a$08$l11nU8s5XrHEmTRRvxjU1OyX1SAfEJ/Y0Juk8jQrO0.yiW85up0QG', 1, NOW(), NOW());

-- 5. Tạo 1 Account ROLE_PM (Owner project)
INSERT INTO account (username, password, status, created_time, updated_time)
VALUES ('pm1', '$2a$08$l11nU8s5XrHEmTRRvxjU1OyX1SAfEJ/Y0Juk8jQrO0.yiW85up0QG', 1, NOW(), NOW());

-- ROLE_EMP cho 10 employee
INSERT INTO account_authorities (account_id, authority_id)
SELECT a.id, au.id
FROM account a
         JOIN authority au ON au.name = 'ROLE_EMP'
WHERE a.username IN ('employee1', 'employee2', 'employee3', 'employee4', 'employee5',
                     'employee6', 'employee7', 'employee8', 'employee9', 'employee10');

-- ROLE_LEAD cho 3 lead
INSERT INTO account_authorities (account_id, authority_id)
SELECT a.id, au.id
FROM account a
         JOIN authority au ON au.name = 'ROLE_LEAD'
WHERE a.username IN ('lead1', 'lead2', 'lead3');

-- ROLE_PM cho 1 PM
INSERT INTO account_authorities (account_id, authority_id)
SELECT a.id, au.id
FROM account a
         JOIN authority au ON au.name = 'ROLE_PM'
WHERE a.username = 'pm1';

-- 6. Tạo UserInfo liên kết Account, 10 employee + 3 lead + 1 pm, phòng ban assign đơn giản
INSERT INTO user_info (full_name, email, phone, identity, department_id, account_id)
VALUES ('Employee 1', 'employee1@example.com', '0900000001', 'ID001', 1, 1),
       ('Employee 2', 'employee2@example.com', '0900000002', 'ID002', 1, 2),
       ('Employee 3', 'employee3@example.com', '0900000003', 'ID003', 1, 3),
       ('Employee 4', 'employee4@example.com', '0900000004', 'ID004', 1, 4),
       ('Employee 5', 'employee5@example.com', '0900000005', 'ID005', 1, 5),
       ('Employee 6', 'employee6@example.com', '0900000006', 'ID006', 1, 6),
       ('Employee 7', 'employee7@example.com', '0900000007', 'ID007', 1, 7),
       ('Employee 8', 'employee8@example.com', '0900000008', 'ID008', 1, 8),
       ('Employee 9', 'employee9@example.com', '0900000009', 'ID009', 1, 9),
       ('Employee 10', 'employee10@example.com', '0900000010', 'ID010', 1, 10),
       ('Lead 1', 'lead1@example.com', '0910000001', 'ID011', 2, 11),
       ('Lead 2', 'lead2@example.com', '0910000002', 'ID012', 2, 12),
       ('Lead 3', 'lead3@example.com', '0910000003', 'ID013', 2, 13),
       ('PM 1', 'pm1@example.com', '0920000001', 'ID014', 3, 14);

-- 7. Gán ROLE_EMP cho 10 Employee (Account id 1~10), ROLE_LEAD cho 11~13, ROLE_PM cho 14
-- Tạm bỏ qua vì không có bảng join riêng giữa Account - Authority

-- 8. Tạo Project do PM tạo (Owner)
INSERT INTO project
(created_by_id, name, description, start_date, due_date, active, created_time, updated_time)
VALUES (14, 'Project 1', 'Sample Project', CURDATE(), DATE_ADD(CURDATE(), INTERVAL 30 DAY), 1, NOW(), NOW());

-- Lấy ID Project mới tạo giả sử là 1

-- 9. Tạo ProjectRole: PM là OWNER, 2 LEAD là MEMBER trên project 1
INSERT INTO project_role (user_info_id, project_id, role)
VALUES (14, 1, 'OWNER'),
       (11, 1, 'MEMBER'),
       (12, 1, 'MEMBER');

-- 11. Tạo Phase thuộc project 1, do LEAD tạo
INSERT INTO phase
(created_by_id, project_id, name, description, start_date, due_date, created_time, updated_time)
VALUES (11, 1, 'Phase 1', 'Phase description', CURDATE(), DATE_ADD(CURDATE(), INTERVAL 10 DAY), NOW(), NOW());


-- 10. Tạo Collection thuộc project (cần userInfoCreated chỉ là LEAD hoặc PM đã thuộc project)
INSERT INTO collection
(created_by_id, phase_id, name, description, start_date, due_date, created_time, updated_time)
VALUES (11, 1, 'Collection 1', 'Description collection', CURDATE(), DATE_ADD(CURDATE(), INTERVAL 15 DAY), NOW(), NOW());

-- Giả sử Phase id = 1

-- 12. Update Collection để assign phase_id
UPDATE collection
SET phase_id = 1
WHERE id = 1;

-- 13. Tạo Root Task trong Collection, do LEAD tạo (owner)
INSERT INTO task
(collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked,
 start_date, deadline, created_time, updated_time)
VALUES (1, 11, NULL, 'Root Task 1', 'Root task description', 'Format 1', 'NORMAL', 'BACKEND', 'HIGH', 0, CURDATE(),
        DATE_ADD(CURDATE(), INTERVAL 7 DAY), NOW(), NOW());

-- Giả sử Task id = 1 (Root Task)

-- 14. Tạo 2 Sub-Tasks (con của Root Task)
INSERT INTO task
(collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked,
 start_date, deadline, created_time, updated_time)
VALUES (1, 11, 1, 'Sub Task 1', 'Sub task 1 desc', 'Format Sub1', 'NORMAL', 'BACKEND', 'HIGH', 0, CURDATE(),
        DATE_ADD(CURDATE(), INTERVAL 3 DAY), NOW(), NOW()),
       (1, 12, 1, 'Sub Task 2', 'Sub task 2 desc', 'Format Sub2', 'ADVANCED', 'FRONTEND', 'NORMAL', 0, CURDATE(),
        DATE_ADD(CURDATE(), INTERVAL 4 DAY), NOW(), NOW());

-- Sub Task id giả sử là 2 và 3

-- 15. Tạo TaskForUsers cho Sub-Task 1: gán 2 nhân viên
INSERT INTO task_for_users (assigned_to_id, task_id, user_task_status, updated_time)
VALUES (1, 2, 'JOINED', NOW()), -- Employee 1
       (2, 2, 'JOINED', NOW());
-- Employee 2

-- Tạo TaskForUsers cho Sub-Task 2: gán 2 nhân viên khác
INSERT INTO task_for_users (assigned_to_id, task_id, user_task_status, updated_time)
VALUES (3, 3, 'JOINED', NOW()), -- Employee 3
       (4, 3, 'JOINED', NOW());
-- Employee 4

-- 16. Đảm bảo Root Task (task_id=1) không có TaskForUsers (đã rỗng theo nghiệp vụ)

-- Kiểm tra lại AUTO_INCREMENT các bảng để tránh lỗi
ALTER TABLE authority
    AUTO_INCREMENT = 5;
ALTER TABLE account
    AUTO_INCREMENT = 15;
ALTER TABLE user_info
    AUTO_INCREMENT = 15;
ALTER TABLE department
    AUTO_INCREMENT = 4;
ALTER TABLE project
    AUTO_INCREMENT = 2;
ALTER TABLE project_role
    AUTO_INCREMENT = 4;
ALTER TABLE collection
    AUTO_INCREMENT = 2;
ALTER TABLE phase
    AUTO_INCREMENT = 2;
ALTER TABLE task
    AUTO_INCREMENT = 4;
ALTER TABLE task_for_users
    AUTO_INCREMENT = 5;

-- COMMIT nếu cần
