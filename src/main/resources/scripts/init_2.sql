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
VALUES ('employee1', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee2', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee3', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee4', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee5', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee6', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee7', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee8', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee9', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee10', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW());

-- 4. Tạo 3 Account ROLE_LEAD
INSERT IGNORE INTO account (username, password, status, created_time, updated_time)
VALUES ('lead1', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('lead2', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('lead3', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW());

-- 5. Tạo 1 Account ROLE_PM (Owner project)
INSERT IGNORE INTO account (username, password, status, created_time, updated_time)
VALUES ('pm1', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW());

INSERT IGNORE INTO account (username, password, status, created_time, updated_time)
VALUES ('admin', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW());

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
       ('Lead 1', 'levandung.it03@gmail.com', '0910000001', 'ID011', 2, 11),
       ('Lead 2', 'lead2@example.com', '0910000002', 'ID012', 2, 12),
       ('Lead 3', 'lead3@example.com', '0910000003', 'ID013', 2, 13),
       ('PM 1', 'pm1@example.com', '0920000001', 'ID014', 3, 14),
       ('ADMIN', 'admin@example.com', '0920000001', 'ID014', 3, 15);

-- 7. Gán ROLE_EMP cho 10 Employee (Account id 1~10), ROLE_LEAD cho 11~13, ROLE_PM cho 14
-- Tạm bỏ qua vì không có bảng join riêng giữa Account - Authority

-- 8. Tạo Project do PM tạo (Owner)
INSERT IGNORE INTO project
(created_by_id, name, description, expected_start_date, start_date, due_date, status, created_time, updated_time)
VALUES (14, 'Project 1', 'Sample Project', CURDATE(), CURDATE(), DATE_ADD(CURDATE(), INTERVAL 30 DAY), "IN_PROGRESS", NOW(), NOW());

-- Lấy ID Project mới tạo giả sử là 1

-- 9. Tạo ProjectRole: PM là OWNER, 2 LEAD là MEMBER trên project 1
INSERT IGNORE INTO project_role (user_info_id, project_id, role)
VALUES (14, 1, 'OWNER'),
       (11, 1, 'MEMBER'),
       (12, 1, 'MEMBER');

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

-- 11. Tạo Phase thuộc project 1, do LEAD tạo
INSERT IGNORE INTO phase
(created_by_id, project_id, name, description, start_date, due_date, created_time, updated_time)
VALUES (14, 1, 'Phase 1', 'Phase description', CURDATE(), DATE_ADD(CURDATE(), INTERVAL 10 DAY), NOW(), NOW());


-- 10. Tạo Collection thuộc project (cần userInfoCreated chỉ là LEAD hoặc PM đã thuộc project)
INSERT IGNORE INTO collection
(created_by_id, phase_id, name, description, start_date, due_date, created_time, updated_time)
VALUES (14, 1, 'Collection 1', 'Description collection', CURDATE(), DATE_ADD(CURDATE(), INTERVAL 15 DAY), NOW(), NOW());

-- Giả sử Phase id = 1

-- 12. Update Collection để assign phase_id
UPDATE collection
SET phase_id = 1
WHERE id = 1;

-- 13. Tạo Root Task trong Collection, do LEAD tạo (owner)
INSERT IGNORE INTO task
(collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked,
 start_date, deadline, created_time, updated_time)
VALUES (1, 11, NULL, 'Root Task 1', 'Root task description', 'Format 1', 'NORMAL', 'BACKEND', 'HIGH', 0, CURDATE(),
        DATE_ADD(CURDATE(), INTERVAL 7 DAY), NOW(), NOW());

-- Giả sử Task id = 1 (Root Task)

-- 14. Tạo 2 Sub-Tasks (con của Root Task)
INSERT IGNORE INTO task
(collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked,
 start_date, deadline, created_time, updated_time)
VALUES (1, 11, 1, 'Sub Task 1', 'Sub task 1 desc', 'Format Sub1', 'NORMAL', 'BACKEND', 'HIGH', 0, CURDATE(),
        DATE_ADD(CURDATE(), INTERVAL 3 DAY), NOW(), NOW()),
       (1, 11, 1, 'Sub Task 2', 'Sub task 2 desc', 'Format Sub2', 'ADVANCED', 'FRONTEND', 'NORMAL', 0, CURDATE(),
        DATE_ADD(CURDATE(), INTERVAL 4 DAY), NOW(), NOW());

-- Sub Task id giả sử là 2 và 3

-- 15. Tạo TaskForUsers cho Sub-Task 1: gán 2 nhân viên
INSERT IGNORE INTO task_for_users (assigned_to_id, task_id, user_task_status, updated_time)
VALUES (1, 2, 'JOINED', NOW()), -- Employee 1
       (2, 2, 'JOINED', NOW());
-- Employee 2

-- Tạo TaskForUsers cho Sub-Task 2: gán 2 nhân viên khác
INSERT IGNORE INTO task_for_users (assigned_to_id, task_id, user_task_status, updated_time)
VALUES (3, 3, 'JOINED', NOW()), -- Employee 3
       (4, 3, 'JOINED', NOW());
-- Employee 4

INSERT IGNORE INTO report (id, created_by_id, title, content, rejected_reason, report_status, reviewed_time, created_time, updated_time)
VALUES
    (1, 1, 'Report 1', 'This is report 1', NULL, 'APPROVED', '2025-08-05 23:30:00', '2025-08-05 23:00:00', '2025-08-05 23:30:00'),
    (2, 2, 'Report 2', 'This is report 2', NULL, 'WAITING', NULL, '2025-08-05 23:10:00', '2025-08-05 23:10:00'),
    (3, 3, 'Report 3', 'This is report 3', 'Incomplete data', 'REJECTED', '2025-08-05 23:15:00', '2025-08-05 23:00:00', '2025-08-05 23:15:00'),
    (4, 4, 'Report 4', 'This is report 4', NULL, 'APPROVED', '2025-08-21 23:20:00', '2025-08-20 22:59:00', '2025-08-20 23:20:00');

INSERT IGNORE INTO comment_of_report (id, created_by_id, report_id, replied_comment_id, comment, created_time)
VALUES
    -- Comments for Report 1
    (1, 2, 1, NULL, 'I reviewed this report. Looks good.', '2025-08-05 23:35:00'),
    (2, 1, 1, 1, 'Thanks for checking!', '2025-08-05 23:36:00'),

    -- Comments for Report 3
    (3, 4, 3, NULL, 'The data is not clear.', '2025-08-05 23:17:00'),
    (4, 3, 3, 3, 'Okay, I will fix and resubmit.', '2025-08-05 23:18:00');

-- Giả sử hiện Root Task mới sẽ có id = 4 và 5 (sau các insert trước đó)

-- Root Task A: Hoàn thành đúng hạn
INSERT IGNORE INTO task
(collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked,
 start_date, deadline, end_date, created_time, updated_time)
VALUES (1, 11, NULL, 'Root Task On-Time', 'Root task completed on time', 'Format OT', 'NORMAL', 'BACKEND', 'HIGH', 0,
        CURDATE(), DATE_ADD(CURDATE(), INTERVAL 5 DAY), DATE_ADD(CURDATE(), INTERVAL 4 DAY), NOW(), NOW());

-- Gán 2 employee trực tiếp vào Root Task A
INSERT IGNORE INTO task_for_users (assigned_to_id, task_id, user_task_status, updated_time)
VALUES (5, 4, 'JOINED', NOW()),
       (6, 4, 'JOINED', NOW());

-- Report cho Root Task A (deadline giả sử = 2025-08-25 00:00:00)
-- Cả 2 nộp trước deadline
INSERT IGNORE INTO report (id, created_by_id, title, content, rejected_reason, report_status, reviewed_time, created_time, updated_time)
VALUES
    (5, 5, 'Report OT 1', 'On time report 1', NULL, 'APPROVED', '2025-08-24 22:00:00', '2025-08-24 21:30:00', '2025-08-24 22:00:00'),
    (6, 6, 'Report OT 2', 'On time report 2', NULL, 'APPROVED', '2025-08-24 21:00:00', '2025-08-24 20:30:00', '2025-08-24 21:00:00');


-- Root Task B: Hoàn thành trễ
INSERT IGNORE INTO task
(collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked,
 start_date, deadline, end_date, created_time, updated_time)
VALUES (1, 11, NULL, 'Root Task Late', 'Root task completed late', 'Format LT', 'NORMAL', 'FRONTEND', 'HIGH', 0,
        CURDATE(), DATE_ADD(CURDATE(), INTERVAL 5 DAY), DATE_ADD(CURDATE(), INTERVAL 6 DAY), NOW(), NOW());

-- Gán 2 employee trực tiếp vào Root Task B
INSERT IGNORE INTO task_for_users (assigned_to_id, task_id, user_task_status, updated_time)
VALUES (7, 5, 'JOINED', NOW()),
       (8, 5, 'JOINED', NOW());

-- Report cho Root Task B (deadline giả sử = 2025-08-25 00:00:00)
-- Cả 2 nộp trễ (>= deadline)
INSERT IGNORE INTO report (id, created_by_id, title, content, rejected_reason, report_status, reviewed_time, created_time, updated_time)
VALUES
    (7, 7, 'Report LT 1', 'Late report 1', NULL, 'APPROVED', '2025-08-25 01:00:00', '2025-08-25 00:30:00', '2025-08-25 01:00:00'),
    (8, 8, 'Report LT 2', 'Late report 2', NULL, 'APPROVED', '2025-08-26 10:00:00', '2025-08-26 09:00:00', '2025-08-26 10:00:00');

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
