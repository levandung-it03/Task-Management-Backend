
USE task_management;
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE `report`;
TRUNCATE TABLE `task_for_users`;
TRUNCATE TABLE `task`;
TRUNCATE TABLE `collection`;
TRUNCATE TABLE `phase`;
TRUNCATE TABLE `project_role`;
TRUNCATE TABLE `project`;
SET FOREIGN_KEY_CHECKS = 1;

START TRANSACTION;

INSERT INTO project (`id`, `created_time`, `description`, `due_date`, `expected_start_date`, `name`, `status`, `updated_time`, `created_by_id`)
VALUES (1, '2025-01-01 06:00:00.000000', 'Application serving daily Todo-jobs.', '2028-12-31', '2025-01-01', 'Todo App', 'IN_PROGRESS', '2025-01-01 06:00:00.000000', 124);

INSERT INTO project_role (`id`, `role`, `project_id`, `user_info_id`) VALUES (1, 'OWNER', 1, 124);
INSERT INTO project_role (`id`, `role`, `project_id`, `user_info_id`) VALUES (2, 'MEMBER', 1, 121);

INSERT INTO `phase` (`id`, `created_time`, `description`, `due_date`, `name`, `start_date`, `updated_time`, `project_id`, `created_by_id`)
VALUES (1, '2025-01-01 06:5:00.000000', 'Base Website application design, refactoring and deploying', '2027-12-31', 'Base Website', '2025-01-01', '2025-01-01 06:5:00.000000', 1, '124');

INSERT INTO collection (`id`, `created_time`, `description`, `due_date`, `name`, `start_date`, `updated_time`, `phase_id`, `created_by_id`)
VALUES (1, '2025-01-01 06:10:00.000000', 'Develop base components', '2026-12-31', 'Base Development', '2025-01-01', '2025-01-01 06:10:00.000000', '1', '124');
-- 2024-01-01
-- 2024-01-04
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1, 1, 121, NULL, 'Init backend project', 'Init backend project', NULL, 'HARD', 'BACKEND', 'NORMAL', FALSE, '2024-01-01', '2024-01-04', '2024-01-04', '2024-01-01 08:00:00.000000', '2024-01-01 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (1, 1, 2, 'JOINED', '2024-01-01 08:00:00.000000'),
       (2, 1, 4, 'JOINED', '2024-01-01 08:00:00.000000'),
       (3, 1, 6, 'JOINED', '2024-01-01 08:00:00.000000'),
       (4, 1, 30, 'JOINED', '2024-01-01 08:00:00.000000'),
       (5, 1, 32, 'JOINED', '2024-01-01 08:00:00.000000'),
       (6, 1, 34, 'JOINED', '2024-01-01 08:00:00.000000'),
       (7, 1, 36, 'JOINED', '2024-01-01 08:00:00.000000'),
       (8, 1, 60, 'JOINED', '2024-01-01 08:00:00.000000'),
       (9, 1, 62, 'JOINED', '2024-01-01 08:00:00.000000'),
       (10, 1, 64, 'JOINED', '2024-01-01 08:00:00.000000'),
       (11, 1, 66, 'JOINED', '2024-01-01 08:00:00.000000'),
       (12, 1, 90, 'JOINED', '2024-01-01 08:00:00.000000'),
       (13, 1, 92, 'JOINED', '2024-01-01 08:00:00.000000'),
       (14, 1, 94, 'JOINED', '2024-01-01 08:00:00.000000'),
       (15, 1, 96, 'JOINED', '2024-01-01 08:00:00.000000'),
       (16, 1, 120, 'JOINED', '2024-01-01 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 1, 'Employee 2 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-02 20:00:00.000000', '2024-01-02 20:00:00.000000', '2024-01-04 08:00:00.000000'),
       (DEFAULT, 2, 'Employee 4 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-02 20:00:00.000000', '2024-01-02 20:00:00.000000', '2024-01-04 08:00:00.000000'),
       (DEFAULT, 3, 'Employee 6 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-02 20:00:00.000000', '2024-01-02 20:00:00.000000', '2024-01-04 08:00:00.000000'),
       (DEFAULT, 4, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-02 23:36:00.000000', '2024-01-02 23:36:00.000000', '2024-01-04 08:00:00.000000'),
       (DEFAULT, 5, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-02 20:00:00.000000', '2024-01-02 20:00:00.000000', '2024-01-04 08:00:00.000000'),
       (DEFAULT, 6, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-02 20:00:00.000000', '2024-01-02 20:00:00.000000', '2024-01-04 08:00:00.000000'),
       (DEFAULT, 7, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-02 20:00:00.000000', '2024-01-02 20:00:00.000000', '2024-01-04 08:00:00.000000'),
       (DEFAULT, 8, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-02 23:36:00.000000', '2024-01-02 23:36:00.000000', '2024-01-04 08:00:00.000000'),
       (DEFAULT, 9, 'Employee 62 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-04 04:24:00.000000', '2024-01-04 04:24:00.000000', '2024-01-04 08:00:00.000000'),
       (DEFAULT, 10, 'Employee 64 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-04 04:24:00.000000', '2024-01-04 04:24:00.000000', '2024-01-04 08:00:00.000000'),
       (DEFAULT, 11, 'Employee 66 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-04 04:24:00.000000', '2024-01-04 04:24:00.000000', '2024-01-04 08:00:00.000000'),
       (DEFAULT, 12, 'Employee 90 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-04 08:00:00.000000', '2024-01-04 08:00:00.000000', '2024-01-04 08:00:00.000000'),
       (DEFAULT, 13, 'Employee 92 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-04 04:24:00.000000', '2024-01-04 04:24:00.000000', '2024-01-04 08:00:00.000000'),
       (DEFAULT, 14, 'Employee 94 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-04 04:24:00.000000', '2024-01-04 04:24:00.000000', '2024-01-04 08:00:00.000000'),
       (DEFAULT, 15, 'Employee 96 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-04 04:24:00.000000', '2024-01-04 04:24:00.000000', '2024-01-04 08:00:00.000000'),
       (DEFAULT, 16, 'Employee 120 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-04 04:24:00.000000', '2024-01-04 04:24:00.000000', '2024-01-04 08:00:00.000000');

-- 2024-01-04
-- 2024-01-11
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (2, 1, 121, NULL, 'Setup project modules', 'Setup project modules', NULL, 'HARD', 'BACKEND', 'LOW', FALSE, '2024-01-04', '2024-01-11', '2024-01-11', '2024-01-04 08:00:00.000000', '2024-01-04 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (17, 2, 2, 'JOINED', '2024-01-04 08:00:00.000000'),
       (18, 2, 4, 'JOINED', '2024-01-04 08:00:00.000000'),
       (19, 2, 6, 'JOINED', '2024-01-04 08:00:00.000000'),
       (20, 2, 30, 'JOINED', '2024-01-04 08:00:00.000000'),
       (21, 2, 32, 'JOINED', '2024-01-04 08:00:00.000000'),
       (22, 2, 34, 'JOINED', '2024-01-04 08:00:00.000000'),
       (23, 2, 36, 'JOINED', '2024-01-04 08:00:00.000000'),
       (24, 2, 60, 'JOINED', '2024-01-04 08:00:00.000000'),
       (25, 2, 62, 'JOINED', '2024-01-04 08:00:00.000000'),
       (26, 2, 64, 'JOINED', '2024-01-04 08:00:00.000000'),
       (27, 2, 66, 'JOINED', '2024-01-04 08:00:00.000000'),
       (28, 2, 92, 'JOINED', '2024-01-04 08:00:00.000000'),
       (29, 2, 94, 'JOINED', '2024-01-04 08:00:00.000000'),
       (30, 2, 96, 'JOINED', '2024-01-04 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 17, 'Employee 2 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-11 08:00:00.000000', '2024-01-11 08:00:00.000000', '2024-01-11 08:00:00.000000'),
       (DEFAULT, 18, 'Employee 4 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-11 08:00:00.000000', '2024-01-11 08:00:00.000000', '2024-01-11 08:00:00.000000'),
       (DEFAULT, 19, 'Employee 6 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-11 08:00:00.000000', '2024-01-11 08:00:00.000000', '2024-01-11 08:00:00.000000'),
       (DEFAULT, 20, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-11 08:00:00.000000', '2024-01-11 08:00:00.000000', '2024-01-11 08:00:00.000000'),
       (DEFAULT, 21, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-11 08:00:00.000000', '2024-01-11 08:00:00.000000', '2024-01-11 08:00:00.000000'),
       (DEFAULT, 22, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-11 08:00:00.000000', '2024-01-11 08:00:00.000000', '2024-01-11 08:00:00.000000'),
       (DEFAULT, 23, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-11 08:00:00.000000', '2024-01-11 08:00:00.000000', '2024-01-11 08:00:00.000000'),
       (DEFAULT, 24, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-11 08:00:00.000000', '2024-01-11 08:00:00.000000', '2024-01-11 08:00:00.000000'),
       (DEFAULT, 25, 'Employee 62 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-11 08:00:00.000000', '2024-01-11 08:00:00.000000', '2024-01-11 08:00:00.000000'),
       (DEFAULT, 26, 'Employee 64 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-11 08:00:00.000000', '2024-01-11 08:00:00.000000', '2024-01-11 08:00:00.000000'),
       (DEFAULT, 27, 'Employee 66 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-11 08:00:00.000000', '2024-01-11 08:00:00.000000', '2024-01-11 08:00:00.000000'),
       (DEFAULT, 28, 'Employee 92 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-11 08:00:00.000000', '2024-01-11 08:00:00.000000', '2024-01-11 08:00:00.000000'),
       (DEFAULT, 29, 'Employee 94 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-11 08:00:00.000000', '2024-01-11 08:00:00.000000', '2024-01-11 08:00:00.000000'),
       (DEFAULT, 30, 'Employee 96 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-11 08:00:00.000000', '2024-01-11 08:00:00.000000', '2024-01-11 08:00:00.000000');

-- 2024-01-11
-- 2024-01-17
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (3, 1, 121, NULL, 'Create user entity', 'Create user entity', NULL, 'ADVANCED', 'BACKEND', 'NORMAL', FALSE, '2024-01-11', '2024-01-17', '2024-01-17', '2024-01-11 08:00:00.000000', '2024-01-11 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (31, 3, 8, 'JOINED', '2024-01-11 08:00:00.000000'),
       (32, 3, 10, 'JOINED', '2024-01-11 08:00:00.000000'),
       (33, 3, 12, 'JOINED', '2024-01-11 08:00:00.000000'),
       (34, 3, 14, 'JOINED', '2024-01-11 08:00:00.000000'),
       (35, 3, 30, 'JOINED', '2024-01-11 08:00:00.000000'),
       (36, 3, 38, 'JOINED', '2024-01-11 08:00:00.000000'),
       (37, 3, 40, 'JOINED', '2024-01-11 08:00:00.000000'),
       (38, 3, 42, 'JOINED', '2024-01-11 08:00:00.000000'),
       (39, 3, 44, 'JOINED', '2024-01-11 08:00:00.000000'),
       (40, 3, 60, 'JOINED', '2024-01-11 08:00:00.000000'),
       (41, 3, 68, 'JOINED', '2024-01-11 08:00:00.000000'),
       (42, 3, 70, 'JOINED', '2024-01-11 08:00:00.000000'),
       (43, 3, 72, 'JOINED', '2024-01-11 08:00:00.000000'),
       (44, 3, 74, 'JOINED', '2024-01-11 08:00:00.000000'),
       (45, 3, 98, 'JOINED', '2024-01-11 08:00:00.000000'),
       (46, 3, 100, 'JOINED', '2024-01-11 08:00:00.000000'),
       (47, 3, 102, 'JOINED', '2024-01-11 08:00:00.000000'),
       (48, 3, 104, 'JOINED', '2024-01-11 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 31, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-14 08:00:00.000000', '2024-01-14 08:00:00.000000', '2024-01-17 08:00:00.000000'),
       (DEFAULT, 32, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-14 08:00:00.000000', '2024-01-14 08:00:00.000000', '2024-01-17 08:00:00.000000'),
       (DEFAULT, 33, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-14 08:00:00.000000', '2024-01-14 08:00:00.000000', '2024-01-17 08:00:00.000000'),
       (DEFAULT, 34, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-14 08:00:00.000000', '2024-01-14 08:00:00.000000', '2024-01-17 08:00:00.000000'),
       (DEFAULT, 35, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-14 08:00:00.000000', '2024-01-14 08:00:00.000000', '2024-01-17 08:00:00.000000'),
       (DEFAULT, 36, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-14 08:00:00.000000', '2024-01-14 08:00:00.000000', '2024-01-17 08:00:00.000000'),
       (DEFAULT, 37, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-14 08:00:00.000000', '2024-01-14 08:00:00.000000', '2024-01-17 08:00:00.000000'),
       (DEFAULT, 38, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-14 08:00:00.000000', '2024-01-14 08:00:00.000000', '2024-01-17 08:00:00.000000'),
       (DEFAULT, 39, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-14 08:00:00.000000', '2024-01-14 08:00:00.000000', '2024-01-17 08:00:00.000000'),
       (DEFAULT, 40, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-14 08:00:00.000000', '2024-01-14 08:00:00.000000', '2024-01-17 08:00:00.000000'),
       (DEFAULT, 41, 'Employee 68 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-17 00:48:00.000000', '2024-01-17 00:48:00.000000', '2024-01-17 08:00:00.000000'),
       (DEFAULT, 42, 'Employee 70 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-17 08:00:00.000000', '2024-01-17 08:00:00.000000', '2024-01-17 08:00:00.000000'),
       (DEFAULT, 43, 'Employee 72 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-17 08:00:00.000000', '2024-01-17 08:00:00.000000', '2024-01-17 08:00:00.000000'),
       (DEFAULT, 44, 'Employee 74 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-17 08:00:00.000000', '2024-01-17 08:00:00.000000', '2024-01-17 08:00:00.000000'),
       (DEFAULT, 45, 'Employee 98 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-17 00:48:00.000000', '2024-01-17 00:48:00.000000', '2024-01-17 08:00:00.000000'),
       (DEFAULT, 46, 'Employee 100 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-17 00:48:00.000000', '2024-01-17 00:48:00.000000', '2024-01-17 08:00:00.000000'),
       (DEFAULT, 47, 'Employee 102 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-17 00:48:00.000000', '2024-01-17 00:48:00.000000', '2024-01-17 08:00:00.000000'),
       (DEFAULT, 48, 'Employee 104 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-17 00:48:00.000000', '2024-01-17 00:48:00.000000', '2024-01-17 08:00:00.000000');

-- 2024-01-17
-- 2024-01-23
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (4, 1, 121, NULL, 'Create task entity', 'Create task entity', NULL, 'ADVANCED', 'BACKEND', 'LOW', FALSE, '2024-01-17', '2024-01-23', '2024-01-23', '2024-01-17 08:00:00.000000', '2024-01-17 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (49, 4, 8, 'JOINED', '2024-01-17 08:00:00.000000'),
       (50, 4, 10, 'JOINED', '2024-01-17 08:00:00.000000'),
       (51, 4, 12, 'JOINED', '2024-01-17 08:00:00.000000'),
       (52, 4, 14, 'JOINED', '2024-01-17 08:00:00.000000'),
       (53, 4, 30, 'JOINED', '2024-01-17 08:00:00.000000'),
       (54, 4, 38, 'JOINED', '2024-01-17 08:00:00.000000'),
       (55, 4, 40, 'JOINED', '2024-01-17 08:00:00.000000'),
       (56, 4, 42, 'JOINED', '2024-01-17 08:00:00.000000'),
       (57, 4, 44, 'JOINED', '2024-01-17 08:00:00.000000'),
       (58, 4, 60, 'JOINED', '2024-01-17 08:00:00.000000'),
       (59, 4, 68, 'JOINED', '2024-01-17 08:00:00.000000'),
       (60, 4, 70, 'JOINED', '2024-01-17 08:00:00.000000'),
       (61, 4, 72, 'JOINED', '2024-01-17 08:00:00.000000'),
       (62, 4, 74, 'JOINED', '2024-01-17 08:00:00.000000'),
       (63, 4, 98, 'JOINED', '2024-01-17 08:00:00.000000'),
       (64, 4, 100, 'JOINED', '2024-01-17 08:00:00.000000'),
       (65, 4, 102, 'JOINED', '2024-01-17 08:00:00.000000'),
       (66, 4, 104, 'JOINED', '2024-01-17 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 49, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000'),
       (DEFAULT, 50, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000'),
       (DEFAULT, 51, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000'),
       (DEFAULT, 52, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000'),
       (DEFAULT, 53, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000'),
       (DEFAULT, 54, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000'),
       (DEFAULT, 55, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000'),
       (DEFAULT, 56, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000'),
       (DEFAULT, 57, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000'),
       (DEFAULT, 58, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000'),
       (DEFAULT, 59, 'Employee 68 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000'),
       (DEFAULT, 60, 'Employee 70 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000'),
       (DEFAULT, 61, 'Employee 72 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000'),
       (DEFAULT, 62, 'Employee 74 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000'),
       (DEFAULT, 63, 'Employee 98 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000'),
       (DEFAULT, 64, 'Employee 100 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000'),
       (DEFAULT, 65, 'Employee 102 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000'),
       (DEFAULT, 66, 'Employee 104 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000');

-- 2024-01-23
-- 2024-01-28
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (5, 1, 121, NULL, 'Define task priority enum', 'Define task priority enum', NULL, 'NORMAL', 'BACKEND', 'NORMAL', FALSE, '2024-01-23', '2024-01-28', '2024-01-28', '2024-01-23 08:00:00.000000', '2024-01-23 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (67, 5, 16, 'JOINED', '2024-01-23 08:00:00.000000'),
       (68, 5, 18, 'JOINED', '2024-01-23 08:00:00.000000'),
       (69, 5, 20, 'JOINED', '2024-01-23 08:00:00.000000'),
       (70, 5, 30, 'JOINED', '2024-01-23 08:00:00.000000'),
       (71, 5, 46, 'JOINED', '2024-01-23 08:00:00.000000'),
       (72, 5, 48, 'JOINED', '2024-01-23 08:00:00.000000'),
       (73, 5, 50, 'JOINED', '2024-01-23 08:00:00.000000'),
       (74, 5, 60, 'JOINED', '2024-01-23 08:00:00.000000'),
       (75, 5, 76, 'JOINED', '2024-01-23 08:00:00.000000'),
       (76, 5, 78, 'JOINED', '2024-01-23 08:00:00.000000'),
       (77, 5, 80, 'JOINED', '2024-01-23 08:00:00.000000'),
       (78, 5, 106, 'JOINED', '2024-01-23 08:00:00.000000'),
       (79, 5, 108, 'JOINED', '2024-01-23 08:00:00.000000'),
       (80, 5, 110, 'JOINED', '2024-01-23 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 67, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-25 20:00:00.000000', '2024-01-25 20:00:00.000000', '2024-01-28 08:00:00.000000'),
       (DEFAULT, 68, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-25 20:00:00.000000', '2024-01-25 20:00:00.000000', '2024-01-28 08:00:00.000000'),
       (DEFAULT, 69, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-25 20:00:00.000000', '2024-01-25 20:00:00.000000', '2024-01-28 08:00:00.000000'),
       (DEFAULT, 70, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-27 02:00:00.000000', '2024-01-27 02:00:00.000000', '2024-01-28 08:00:00.000000'),
       (DEFAULT, 71, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-25 20:00:00.000000', '2024-01-25 20:00:00.000000', '2024-01-28 08:00:00.000000'),
       (DEFAULT, 72, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-25 20:00:00.000000', '2024-01-25 20:00:00.000000', '2024-01-28 08:00:00.000000'),
       (DEFAULT, 73, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-25 20:00:00.000000', '2024-01-25 20:00:00.000000', '2024-01-28 08:00:00.000000'),
       (DEFAULT, 74, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-27 02:00:00.000000', '2024-01-27 02:00:00.000000', '2024-01-28 08:00:00.000000'),
       (DEFAULT, 75, 'Employee 76 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-28 08:00:00.000000', '2024-01-28 08:00:00.000000', '2024-01-28 08:00:00.000000'),
       (DEFAULT, 76, 'Employee 78 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-28 08:00:00.000000', '2024-01-28 08:00:00.000000', '2024-01-28 08:00:00.000000'),
       (DEFAULT, 77, 'Employee 80 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-28 08:00:00.000000', '2024-01-28 08:00:00.000000', '2024-01-28 08:00:00.000000'),
       (DEFAULT, 78, 'Employee 106 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-28 02:00:00.000000', '2024-01-28 02:00:00.000000', '2024-01-28 08:00:00.000000'),
       (DEFAULT, 79, 'Employee 108 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-28 02:00:00.000000', '2024-01-28 02:00:00.000000', '2024-01-28 08:00:00.000000'),
       (DEFAULT, 80, 'Employee 110 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-28 02:00:00.000000', '2024-01-28 02:00:00.000000', '2024-01-28 08:00:00.000000');

-- 2024-01-28
-- 2024-02-02
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (6, 1, 121, NULL, 'Define task status enum', 'Define task status enum', NULL, 'NORMAL', 'BACKEND', 'LOW', FALSE, '2024-01-28', '2024-02-02', '2024-02-02', '2024-01-28 08:00:00.000000', '2024-01-28 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (81, 6, 16, 'JOINED', '2024-01-28 08:00:00.000000'),
       (82, 6, 18, 'JOINED', '2024-01-28 08:00:00.000000'),
       (83, 6, 20, 'JOINED', '2024-01-28 08:00:00.000000'),
       (84, 6, 46, 'JOINED', '2024-01-28 08:00:00.000000'),
       (85, 6, 48, 'JOINED', '2024-01-28 08:00:00.000000'),
       (86, 6, 50, 'JOINED', '2024-01-28 08:00:00.000000'),
       (87, 6, 76, 'JOINED', '2024-01-28 08:00:00.000000'),
       (88, 6, 78, 'JOINED', '2024-01-28 08:00:00.000000'),
       (89, 6, 80, 'JOINED', '2024-01-28 08:00:00.000000'),
       (90, 6, 106, 'JOINED', '2024-01-28 08:00:00.000000'),
       (91, 6, 108, 'JOINED', '2024-01-28 08:00:00.000000'),
       (92, 6, 110, 'JOINED', '2024-01-28 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 81, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-02 08:00:00.000000', '2024-02-02 08:00:00.000000', '2024-02-02 08:00:00.000000'),
       (DEFAULT, 82, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-02 08:00:00.000000', '2024-02-02 08:00:00.000000', '2024-02-02 08:00:00.000000'),
       (DEFAULT, 83, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-02 08:00:00.000000', '2024-02-02 08:00:00.000000', '2024-02-02 08:00:00.000000'),
       (DEFAULT, 84, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-02 08:00:00.000000', '2024-02-02 08:00:00.000000', '2024-02-02 08:00:00.000000'),
       (DEFAULT, 85, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-02 08:00:00.000000', '2024-02-02 08:00:00.000000', '2024-02-02 08:00:00.000000'),
       (DEFAULT, 86, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-02 08:00:00.000000', '2024-02-02 08:00:00.000000', '2024-02-02 08:00:00.000000'),
       (DEFAULT, 87, 'Employee 76 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-02 08:00:00.000000', '2024-02-02 08:00:00.000000', '2024-02-02 08:00:00.000000'),
       (DEFAULT, 88, 'Employee 78 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-02 08:00:00.000000', '2024-02-02 08:00:00.000000', '2024-02-02 08:00:00.000000'),
       (DEFAULT, 89, 'Employee 80 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-02 08:00:00.000000', '2024-02-02 08:00:00.000000', '2024-02-02 08:00:00.000000'),
       (DEFAULT, 90, 'Employee 106 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-02 08:00:00.000000', '2024-02-02 08:00:00.000000', '2024-02-02 08:00:00.000000'),
       (DEFAULT, 91, 'Employee 108 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-02 08:00:00.000000', '2024-02-02 08:00:00.000000', '2024-02-02 08:00:00.000000'),
       (DEFAULT, 92, 'Employee 110 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-02 08:00:00.000000', '2024-02-02 08:00:00.000000', '2024-02-02 08:00:00.000000');

-- 2024-02-02
-- 2024-02-06
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (7, 1, 121, NULL, 'Setup database config', 'Setup database config', NULL, 'LIGHT', 'BACKEND', 'NORMAL', FALSE, '2024-02-02', '2024-02-06', '2024-02-06', '2024-02-02 08:00:00.000000', '2024-02-02 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (93, 7, 22, 'JOINED', '2024-02-02 08:00:00.000000'),
       (94, 7, 24, 'JOINED', '2024-02-02 08:00:00.000000'),
       (95, 7, 26, 'JOINED', '2024-02-02 08:00:00.000000'),
       (96, 7, 28, 'JOINED', '2024-02-02 08:00:00.000000'),
       (97, 7, 30, 'JOINED', '2024-02-02 08:00:00.000000'),
       (98, 7, 52, 'JOINED', '2024-02-02 08:00:00.000000'),
       (99, 7, 54, 'JOINED', '2024-02-02 08:00:00.000000'),
       (100, 7, 56, 'JOINED', '2024-02-02 08:00:00.000000'),
       (101, 7, 58, 'JOINED', '2024-02-02 08:00:00.000000'),
       (102, 7, 60, 'JOINED', '2024-02-02 08:00:00.000000'),
       (103, 7, 82, 'JOINED', '2024-02-02 08:00:00.000000'),
       (104, 7, 84, 'JOINED', '2024-02-02 08:00:00.000000'),
       (105, 7, 86, 'JOINED', '2024-02-02 08:00:00.000000'),
       (106, 7, 88, 'JOINED', '2024-02-02 08:00:00.000000'),
       (107, 7, 112, 'JOINED', '2024-02-02 08:00:00.000000'),
       (108, 7, 114, 'JOINED', '2024-02-02 08:00:00.000000'),
       (109, 7, 116, 'JOINED', '2024-02-02 08:00:00.000000'),
       (110, 7, 118, 'JOINED', '2024-02-02 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 93, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-04 08:00:00.000000', '2024-02-04 08:00:00.000000', '2024-02-06 08:00:00.000000'),
       (DEFAULT, 94, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-04 08:00:00.000000', '2024-02-04 08:00:00.000000', '2024-02-06 08:00:00.000000'),
       (DEFAULT, 95, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-04 08:00:00.000000', '2024-02-04 08:00:00.000000', '2024-02-06 08:00:00.000000'),
       (DEFAULT, 96, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-04 08:00:00.000000', '2024-02-04 08:00:00.000000', '2024-02-06 08:00:00.000000'),
       (DEFAULT, 97, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-04 22:23:59.000000', '2024-02-04 22:23:59.000000', '2024-02-06 08:00:00.000000'),
       (DEFAULT, 98, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-04 08:00:00.000000', '2024-02-04 08:00:00.000000', '2024-02-06 08:00:00.000000'),
       (DEFAULT, 99, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-04 08:00:00.000000', '2024-02-04 08:00:00.000000', '2024-02-06 08:00:00.000000'),
       (DEFAULT, 100, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-04 08:00:00.000000', '2024-02-04 08:00:00.000000', '2024-02-06 08:00:00.000000'),
       (DEFAULT, 101, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-04 08:00:00.000000', '2024-02-04 08:00:00.000000', '2024-02-06 08:00:00.000000'),
       (DEFAULT, 102, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-04 22:23:59.000000', '2024-02-04 22:23:59.000000', '2024-02-06 08:00:00.000000'),
       (DEFAULT, 103, 'Employee 82 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-06 08:00:00.000000', '2024-02-06 08:00:00.000000', '2024-02-06 08:00:00.000000'),
       (DEFAULT, 104, 'Employee 84 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-06 08:00:00.000000', '2024-02-06 08:00:00.000000', '2024-02-06 08:00:00.000000'),
       (DEFAULT, 105, 'Employee 86 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-06 08:00:00.000000', '2024-02-06 08:00:00.000000', '2024-02-06 08:00:00.000000'),
       (DEFAULT, 106, 'Employee 88 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-06 08:00:00.000000', '2024-02-06 08:00:00.000000', '2024-02-06 08:00:00.000000'),
       (DEFAULT, 107, 'Employee 112 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-06 03:12:00.000000', '2024-02-06 03:12:00.000000', '2024-02-06 08:00:00.000000'),
       (DEFAULT, 108, 'Employee 114 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-06 03:12:00.000000', '2024-02-06 03:12:00.000000', '2024-02-06 08:00:00.000000'),
       (DEFAULT, 109, 'Employee 116 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-06 03:12:00.000000', '2024-02-06 03:12:00.000000', '2024-02-06 08:00:00.000000'),
       (DEFAULT, 110, 'Employee 118 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-06 03:12:00.000000', '2024-02-06 03:12:00.000000', '2024-02-06 08:00:00.000000');

-- 2024-02-06
-- 2024-02-10
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (8, 1, 121, NULL, 'Create JPA repositories', 'Create JPA repositories', NULL, 'LIGHT', 'BACKEND', 'LOW', FALSE, '2024-02-06', '2024-02-10', '2024-02-10', '2024-02-06 08:00:00.000000', '2024-02-06 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (111, 8, 22, 'JOINED', '2024-02-06 08:00:00.000000'),
       (112, 8, 24, 'JOINED', '2024-02-06 08:00:00.000000'),
       (113, 8, 26, 'JOINED', '2024-02-06 08:00:00.000000'),
       (114, 8, 28, 'JOINED', '2024-02-06 08:00:00.000000'),
       (115, 8, 30, 'JOINED', '2024-02-06 08:00:00.000000'),
       (116, 8, 52, 'JOINED', '2024-02-06 08:00:00.000000'),
       (117, 8, 54, 'JOINED', '2024-02-06 08:00:00.000000'),
       (118, 8, 56, 'JOINED', '2024-02-06 08:00:00.000000'),
       (119, 8, 58, 'JOINED', '2024-02-06 08:00:00.000000'),
       (120, 8, 60, 'JOINED', '2024-02-06 08:00:00.000000'),
       (121, 8, 82, 'JOINED', '2024-02-06 08:00:00.000000'),
       (122, 8, 84, 'JOINED', '2024-02-06 08:00:00.000000'),
       (123, 8, 86, 'JOINED', '2024-02-06 08:00:00.000000'),
       (124, 8, 88, 'JOINED', '2024-02-06 08:00:00.000000'),
       (125, 8, 90, 'JOINED', '2024-02-06 08:00:00.000000'),
       (126, 8, 112, 'JOINED', '2024-02-06 08:00:00.000000'),
       (127, 8, 114, 'JOINED', '2024-02-06 08:00:00.000000'),
       (128, 8, 116, 'JOINED', '2024-02-06 08:00:00.000000'),
       (129, 8, 118, 'JOINED', '2024-02-06 08:00:00.000000'),
       (130, 8, 120, 'JOINED', '2024-02-06 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 111, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000'),
       (DEFAULT, 112, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000'),
       (DEFAULT, 113, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000'),
       (DEFAULT, 114, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000'),
       (DEFAULT, 115, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000'),
       (DEFAULT, 116, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000'),
       (DEFAULT, 117, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000'),
       (DEFAULT, 118, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000'),
       (DEFAULT, 119, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000'),
       (DEFAULT, 120, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000'),
       (DEFAULT, 121, 'Employee 82 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000'),
       (DEFAULT, 122, 'Employee 84 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000'),
       (DEFAULT, 123, 'Employee 86 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000'),
       (DEFAULT, 124, 'Employee 88 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000'),
       (DEFAULT, 125, 'Employee 90 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000'),
       (DEFAULT, 126, 'Employee 112 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000'),
       (DEFAULT, 127, 'Employee 114 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000'),
       (DEFAULT, 128, 'Employee 116 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000'),
       (DEFAULT, 129, 'Employee 118 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000'),
       (DEFAULT, 130, 'Employee 120 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000');

-- 2024-02-10
-- 2024-02-13
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (9, 1, 121, NULL, 'Init frontend project', 'Init frontend project', NULL, 'HARD', 'FRONTEND', 'NORMAL', FALSE, '2024-02-10', '2024-02-13', '2024-02-13', '2024-02-10 08:00:00.000000', '2024-02-10 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (131, 9, 1, 'JOINED', '2024-02-10 08:00:00.000000'),
       (132, 9, 3, 'JOINED', '2024-02-10 08:00:00.000000'),
       (133, 9, 5, 'JOINED', '2024-02-10 08:00:00.000000'),
       (134, 9, 7, 'JOINED', '2024-02-10 08:00:00.000000'),
       (135, 9, 29, 'JOINED', '2024-02-10 08:00:00.000000'),
       (136, 9, 31, 'JOINED', '2024-02-10 08:00:00.000000'),
       (137, 9, 33, 'JOINED', '2024-02-10 08:00:00.000000'),
       (138, 9, 35, 'JOINED', '2024-02-10 08:00:00.000000'),
       (139, 9, 37, 'JOINED', '2024-02-10 08:00:00.000000'),
       (140, 9, 59, 'JOINED', '2024-02-10 08:00:00.000000'),
       (141, 9, 61, 'JOINED', '2024-02-10 08:00:00.000000'),
       (142, 9, 63, 'JOINED', '2024-02-10 08:00:00.000000'),
       (143, 9, 65, 'JOINED', '2024-02-10 08:00:00.000000'),
       (144, 9, 67, 'JOINED', '2024-02-10 08:00:00.000000'),
       (145, 9, 91, 'JOINED', '2024-02-10 08:00:00.000000'),
       (146, 9, 93, 'JOINED', '2024-02-10 08:00:00.000000'),
       (147, 9, 95, 'JOINED', '2024-02-10 08:00:00.000000'),
       (148, 9, 97, 'JOINED', '2024-02-10 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 131, 'Employee 1 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-11 20:00:00.000000', '2024-02-11 20:00:00.000000', '2024-02-13 08:00:00.000000'),
       (DEFAULT, 132, 'Employee 3 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-11 20:00:00.000000', '2024-02-11 20:00:00.000000', '2024-02-13 08:00:00.000000'),
       (DEFAULT, 133, 'Employee 5 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-11 20:00:00.000000', '2024-02-11 20:00:00.000000', '2024-02-13 08:00:00.000000'),
       (DEFAULT, 134, 'Employee 7 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-11 20:00:00.000000', '2024-02-11 20:00:00.000000', '2024-02-13 08:00:00.000000'),
       (DEFAULT, 135, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-12 14:00:00.000000', '2024-02-12 14:00:00.000000', '2024-02-13 08:00:00.000000'),
       (DEFAULT, 136, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-11 20:00:00.000000', '2024-02-11 20:00:00.000000', '2024-02-13 08:00:00.000000'),
       (DEFAULT, 137, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-11 20:00:00.000000', '2024-02-11 20:00:00.000000', '2024-02-13 08:00:00.000000'),
       (DEFAULT, 138, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-11 20:00:00.000000', '2024-02-11 20:00:00.000000', '2024-02-13 08:00:00.000000'),
       (DEFAULT, 139, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-11 20:00:00.000000', '2024-02-11 20:00:00.000000', '2024-02-13 08:00:00.000000'),
       (DEFAULT, 140, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-12 14:00:00.000000', '2024-02-12 14:00:00.000000', '2024-02-13 08:00:00.000000'),
       (DEFAULT, 141, 'Employee 61 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-13 04:24:00.000000', '2024-02-13 04:24:00.000000', '2024-02-13 08:00:00.000000'),
       (DEFAULT, 142, 'Employee 63 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-13 04:24:00.000000', '2024-02-13 04:24:00.000000', '2024-02-13 08:00:00.000000'),
       (DEFAULT, 143, 'Employee 65 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-13 04:24:00.000000', '2024-02-13 04:24:00.000000', '2024-02-13 08:00:00.000000'),
       (DEFAULT, 144, 'Employee 67 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-13 04:24:00.000000', '2024-02-13 04:24:00.000000', '2024-02-13 08:00:00.000000'),
       (DEFAULT, 145, 'Employee 91 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-13 04:24:00.000000', '2024-02-13 04:24:00.000000', '2024-02-13 08:00:00.000000'),
       (DEFAULT, 146, 'Employee 93 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-13 04:24:00.000000', '2024-02-13 04:24:00.000000', '2024-02-13 08:00:00.000000'),
       (DEFAULT, 147, 'Employee 95 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-13 04:24:00.000000', '2024-02-13 04:24:00.000000', '2024-02-13 08:00:00.000000'),
       (DEFAULT, 148, 'Employee 97 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-13 04:24:00.000000', '2024-02-13 04:24:00.000000', '2024-02-13 08:00:00.000000');

-- 2024-02-13
-- 2024-02-20
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (10, 1, 121, NULL, 'Create main layout', 'Create main layout', NULL, 'HARD', 'FRONTEND', 'LOW', FALSE, '2024-02-13', '2024-02-20', '2024-02-20', '2024-02-13 08:00:00.000000', '2024-02-13 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (149, 10, 1, 'JOINED', '2024-02-13 08:00:00.000000'),
       (150, 10, 3, 'JOINED', '2024-02-13 08:00:00.000000'),
       (151, 10, 5, 'JOINED', '2024-02-13 08:00:00.000000'),
       (152, 10, 7, 'JOINED', '2024-02-13 08:00:00.000000'),
       (153, 10, 31, 'JOINED', '2024-02-13 08:00:00.000000'),
       (154, 10, 33, 'JOINED', '2024-02-13 08:00:00.000000'),
       (155, 10, 35, 'JOINED', '2024-02-13 08:00:00.000000'),
       (156, 10, 37, 'JOINED', '2024-02-13 08:00:00.000000'),
       (157, 10, 61, 'JOINED', '2024-02-13 08:00:00.000000'),
       (158, 10, 63, 'JOINED', '2024-02-13 08:00:00.000000'),
       (159, 10, 65, 'JOINED', '2024-02-13 08:00:00.000000'),
       (160, 10, 67, 'JOINED', '2024-02-13 08:00:00.000000'),
       (161, 10, 91, 'JOINED', '2024-02-13 08:00:00.000000'),
       (162, 10, 93, 'JOINED', '2024-02-13 08:00:00.000000'),
       (163, 10, 95, 'JOINED', '2024-02-13 08:00:00.000000'),
       (164, 10, 97, 'JOINED', '2024-02-13 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 149, 'Employee 1 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-20 08:00:00.000000', '2024-02-20 08:00:00.000000', '2024-02-20 08:00:00.000000'),
       (DEFAULT, 150, 'Employee 3 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-20 08:00:00.000000', '2024-02-20 08:00:00.000000', '2024-02-20 08:00:00.000000'),
       (DEFAULT, 151, 'Employee 5 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-20 08:00:00.000000', '2024-02-20 08:00:00.000000', '2024-02-20 08:00:00.000000'),
       (DEFAULT, 152, 'Employee 7 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-20 08:00:00.000000', '2024-02-20 08:00:00.000000', '2024-02-20 08:00:00.000000'),
       (DEFAULT, 153, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-20 08:00:00.000000', '2024-02-20 08:00:00.000000', '2024-02-20 08:00:00.000000'),
       (DEFAULT, 154, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-20 08:00:00.000000', '2024-02-20 08:00:00.000000', '2024-02-20 08:00:00.000000'),
       (DEFAULT, 155, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-20 08:00:00.000000', '2024-02-20 08:00:00.000000', '2024-02-20 08:00:00.000000'),
       (DEFAULT, 156, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-20 08:00:00.000000', '2024-02-20 08:00:00.000000', '2024-02-20 08:00:00.000000'),
       (DEFAULT, 157, 'Employee 61 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-20 08:00:00.000000', '2024-02-20 08:00:00.000000', '2024-02-20 08:00:00.000000'),
       (DEFAULT, 158, 'Employee 63 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-20 08:00:00.000000', '2024-02-20 08:00:00.000000', '2024-02-20 08:00:00.000000'),
       (DEFAULT, 159, 'Employee 65 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-20 08:00:00.000000', '2024-02-20 08:00:00.000000', '2024-02-20 08:00:00.000000'),
       (DEFAULT, 160, 'Employee 67 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-20 08:00:00.000000', '2024-02-20 08:00:00.000000', '2024-02-20 08:00:00.000000'),
       (DEFAULT, 161, 'Employee 91 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-20 08:00:00.000000', '2024-02-20 08:00:00.000000', '2024-02-20 08:00:00.000000'),
       (DEFAULT, 162, 'Employee 93 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-20 08:00:00.000000', '2024-02-20 08:00:00.000000', '2024-02-20 08:00:00.000000'),
       (DEFAULT, 163, 'Employee 95 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-20 08:00:00.000000', '2024-02-20 08:00:00.000000', '2024-02-20 08:00:00.000000'),
       (DEFAULT, 164, 'Employee 97 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-20 08:00:00.000000', '2024-02-20 08:00:00.000000', '2024-02-20 08:00:00.000000');

-- 2024-02-20
-- 2024-02-26
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (11, 1, 121, NULL, 'Create login layout', 'Create login layout', NULL, 'ADVANCED', 'FRONTEND', 'NORMAL', FALSE, '2024-02-20', '2024-02-26', '2024-02-26', '2024-02-20 08:00:00.000000', '2024-02-20 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (165, 11, 9, 'JOINED', '2024-02-20 08:00:00.000000'),
       (166, 11, 11, 'JOINED', '2024-02-20 08:00:00.000000'),
       (167, 11, 13, 'JOINED', '2024-02-20 08:00:00.000000'),
       (168, 11, 29, 'JOINED', '2024-02-20 08:00:00.000000'),
       (169, 11, 39, 'JOINED', '2024-02-20 08:00:00.000000'),
       (170, 11, 41, 'JOINED', '2024-02-20 08:00:00.000000'),
       (171, 11, 43, 'JOINED', '2024-02-20 08:00:00.000000'),
       (172, 11, 59, 'JOINED', '2024-02-20 08:00:00.000000'),
       (173, 11, 69, 'JOINED', '2024-02-20 08:00:00.000000'),
       (174, 11, 71, 'JOINED', '2024-02-20 08:00:00.000000'),
       (175, 11, 73, 'JOINED', '2024-02-20 08:00:00.000000'),
       (176, 11, 99, 'JOINED', '2024-02-20 08:00:00.000000'),
       (177, 11, 101, 'JOINED', '2024-02-20 08:00:00.000000'),
       (178, 11, 103, 'JOINED', '2024-02-20 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 165, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-23 08:00:00.000000', '2024-02-23 08:00:00.000000', '2024-02-26 08:00:00.000000'),
       (DEFAULT, 166, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-23 08:00:00.000000', '2024-02-23 08:00:00.000000', '2024-02-26 08:00:00.000000'),
       (DEFAULT, 167, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-23 08:00:00.000000', '2024-02-23 08:00:00.000000', '2024-02-26 08:00:00.000000'),
       (DEFAULT, 168, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-24 05:36:00.000000', '2024-02-24 05:36:00.000000', '2024-02-26 08:00:00.000000'),
       (DEFAULT, 169, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-23 08:00:00.000000', '2024-02-23 08:00:00.000000', '2024-02-26 08:00:00.000000'),
       (DEFAULT, 170, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-23 08:00:00.000000', '2024-02-23 08:00:00.000000', '2024-02-26 08:00:00.000000'),
       (DEFAULT, 171, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-23 08:00:00.000000', '2024-02-23 08:00:00.000000', '2024-02-26 08:00:00.000000'),
       (DEFAULT, 172, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-24 05:36:00.000000', '2024-02-24 05:36:00.000000', '2024-02-26 08:00:00.000000'),
       (DEFAULT, 173, 'Employee 69 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-26 00:48:00.000000', '2024-02-26 00:48:00.000000', '2024-02-26 08:00:00.000000'),
       (DEFAULT, 174, 'Employee 71 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-26 08:00:00.000000', '2024-02-26 08:00:00.000000', '2024-02-26 08:00:00.000000'),
       (DEFAULT, 175, 'Employee 73 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-26 08:00:00.000000', '2024-02-26 08:00:00.000000', '2024-02-26 08:00:00.000000'),
       (DEFAULT, 176, 'Employee 99 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-26 00:48:00.000000', '2024-02-26 00:48:00.000000', '2024-02-26 08:00:00.000000'),
       (DEFAULT, 177, 'Employee 101 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-26 00:48:00.000000', '2024-02-26 00:48:00.000000', '2024-02-26 08:00:00.000000'),
       (DEFAULT, 178, 'Employee 103 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-26 00:48:00.000000', '2024-02-26 00:48:00.000000', '2024-02-26 08:00:00.000000');

-- 2024-02-26
-- 2024-03-03
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (12, 1, 121, NULL, 'Create register layout', 'Create register layout', NULL, 'ADVANCED', 'FRONTEND', 'LOW', FALSE, '2024-02-26', '2024-03-03', '2024-03-03', '2024-02-26 08:00:00.000000', '2024-02-26 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (179, 12, 9, 'JOINED', '2024-02-26 08:00:00.000000'),
       (180, 12, 11, 'JOINED', '2024-02-26 08:00:00.000000'),
       (181, 12, 13, 'JOINED', '2024-02-26 08:00:00.000000'),
       (182, 12, 29, 'JOINED', '2024-02-26 08:00:00.000000'),
       (183, 12, 39, 'JOINED', '2024-02-26 08:00:00.000000'),
       (184, 12, 41, 'JOINED', '2024-02-26 08:00:00.000000'),
       (185, 12, 43, 'JOINED', '2024-02-26 08:00:00.000000'),
       (186, 12, 59, 'JOINED', '2024-02-26 08:00:00.000000'),
       (187, 12, 69, 'JOINED', '2024-02-26 08:00:00.000000'),
       (188, 12, 71, 'JOINED', '2024-02-26 08:00:00.000000'),
       (189, 12, 73, 'JOINED', '2024-02-26 08:00:00.000000'),
       (190, 12, 89, 'JOINED', '2024-02-26 08:00:00.000000'),
       (191, 12, 99, 'JOINED', '2024-02-26 08:00:00.000000'),
       (192, 12, 101, 'JOINED', '2024-02-26 08:00:00.000000'),
       (193, 12, 103, 'JOINED', '2024-02-26 08:00:00.000000'),
       (194, 12, 119, 'JOINED', '2024-02-26 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 179, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-03 08:00:00.000000', '2024-03-03 08:00:00.000000', '2024-03-03 08:00:00.000000'),
       (DEFAULT, 180, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-03 08:00:00.000000', '2024-03-03 08:00:00.000000', '2024-03-03 08:00:00.000000'),
       (DEFAULT, 181, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-03 08:00:00.000000', '2024-03-03 08:00:00.000000', '2024-03-03 08:00:00.000000'),
       (DEFAULT, 182, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-03 08:00:00.000000', '2024-03-03 08:00:00.000000', '2024-03-03 08:00:00.000000'),
       (DEFAULT, 183, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-03 08:00:00.000000', '2024-03-03 08:00:00.000000', '2024-03-03 08:00:00.000000'),
       (DEFAULT, 184, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-03 08:00:00.000000', '2024-03-03 08:00:00.000000', '2024-03-03 08:00:00.000000'),
       (DEFAULT, 185, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-03 08:00:00.000000', '2024-03-03 08:00:00.000000', '2024-03-03 08:00:00.000000'),
       (DEFAULT, 186, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-03 08:00:00.000000', '2024-03-03 08:00:00.000000', '2024-03-03 08:00:00.000000'),
       (DEFAULT, 187, 'Employee 69 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-03 08:00:00.000000', '2024-03-03 08:00:00.000000', '2024-03-03 08:00:00.000000'),
       (DEFAULT, 188, 'Employee 71 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-03 08:00:00.000000', '2024-03-03 08:00:00.000000', '2024-03-03 08:00:00.000000'),
       (DEFAULT, 189, 'Employee 73 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-03 08:00:00.000000', '2024-03-03 08:00:00.000000', '2024-03-03 08:00:00.000000'),
       (DEFAULT, 190, 'Employee 89 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-03 08:00:00.000000', '2024-03-03 08:00:00.000000', '2024-03-03 08:00:00.000000'),
       (DEFAULT, 191, 'Employee 99 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-03 08:00:00.000000', '2024-03-03 08:00:00.000000', '2024-03-03 08:00:00.000000'),
       (DEFAULT, 192, 'Employee 101 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-03 08:00:00.000000', '2024-03-03 08:00:00.000000', '2024-03-03 08:00:00.000000'),
       (DEFAULT, 193, 'Employee 103 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-03 08:00:00.000000', '2024-03-03 08:00:00.000000', '2024-03-03 08:00:00.000000'),
       (DEFAULT, 194, 'Employee 119 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-03 08:00:00.000000', '2024-03-03 08:00:00.000000', '2024-03-03 08:00:00.000000');

-- 2024-03-03
-- 2024-03-08
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (13, 1, 121, NULL, 'Build app header', 'Build app header', NULL, 'NORMAL', 'FRONTEND', 'NORMAL', FALSE, '2024-03-03', '2024-03-08', '2024-03-08', '2024-03-03 08:00:00.000000', '2024-03-03 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (195, 13, 15, 'JOINED', '2024-03-03 08:00:00.000000'),
       (196, 13, 17, 'JOINED', '2024-03-03 08:00:00.000000'),
       (197, 13, 19, 'JOINED', '2024-03-03 08:00:00.000000'),
       (198, 13, 21, 'JOINED', '2024-03-03 08:00:00.000000'),
       (199, 13, 29, 'JOINED', '2024-03-03 08:00:00.000000'),
       (200, 13, 45, 'JOINED', '2024-03-03 08:00:00.000000'),
       (201, 13, 47, 'JOINED', '2024-03-03 08:00:00.000000'),
       (202, 13, 49, 'JOINED', '2024-03-03 08:00:00.000000'),
       (203, 13, 51, 'JOINED', '2024-03-03 08:00:00.000000'),
       (204, 13, 59, 'JOINED', '2024-03-03 08:00:00.000000'),
       (205, 13, 75, 'JOINED', '2024-03-03 08:00:00.000000'),
       (206, 13, 77, 'JOINED', '2024-03-03 08:00:00.000000'),
       (207, 13, 79, 'JOINED', '2024-03-03 08:00:00.000000'),
       (208, 13, 81, 'JOINED', '2024-03-03 08:00:00.000000'),
       (209, 13, 89, 'JOINED', '2024-03-03 08:00:00.000000'),
       (210, 13, 105, 'JOINED', '2024-03-03 08:00:00.000000'),
       (211, 13, 107, 'JOINED', '2024-03-03 08:00:00.000000'),
       (212, 13, 109, 'JOINED', '2024-03-03 08:00:00.000000'),
       (213, 13, 111, 'JOINED', '2024-03-03 08:00:00.000000'),
       (214, 13, 119, 'JOINED', '2024-03-03 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 195, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-05 20:00:00.000000', '2024-03-05 20:00:00.000000', '2024-03-08 08:00:00.000000'),
       (DEFAULT, 196, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-05 20:00:00.000000', '2024-03-05 20:00:00.000000', '2024-03-08 08:00:00.000000'),
       (DEFAULT, 197, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-05 20:00:00.000000', '2024-03-05 20:00:00.000000', '2024-03-08 08:00:00.000000'),
       (DEFAULT, 198, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-05 20:00:00.000000', '2024-03-05 20:00:00.000000', '2024-03-08 08:00:00.000000'),
       (DEFAULT, 199, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-06 02:00:00.000000', '2024-03-06 02:00:00.000000', '2024-03-08 08:00:00.000000'),
       (DEFAULT, 200, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-05 20:00:00.000000', '2024-03-05 20:00:00.000000', '2024-03-08 08:00:00.000000'),
       (DEFAULT, 201, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-05 20:00:00.000000', '2024-03-05 20:00:00.000000', '2024-03-08 08:00:00.000000'),
       (DEFAULT, 202, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-05 20:00:00.000000', '2024-03-05 20:00:00.000000', '2024-03-08 08:00:00.000000'),
       (DEFAULT, 203, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-05 20:00:00.000000', '2024-03-05 20:00:00.000000', '2024-03-08 08:00:00.000000'),
       (DEFAULT, 204, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-06 02:00:00.000000', '2024-03-06 02:00:00.000000', '2024-03-08 08:00:00.000000'),
       (DEFAULT, 205, 'Employee 75 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-08 08:00:00.000000', '2024-03-08 08:00:00.000000', '2024-03-08 08:00:00.000000'),
       (DEFAULT, 206, 'Employee 77 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-08 08:00:00.000000', '2024-03-08 08:00:00.000000', '2024-03-08 08:00:00.000000'),
       (DEFAULT, 207, 'Employee 79 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-08 08:00:00.000000', '2024-03-08 08:00:00.000000', '2024-03-08 08:00:00.000000'),
       (DEFAULT, 208, 'Employee 81 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-08 08:00:00.000000', '2024-03-08 08:00:00.000000', '2024-03-08 08:00:00.000000'),
       (DEFAULT, 209, 'Employee 89 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-08 08:00:00.000000', '2024-03-08 08:00:00.000000', '2024-03-08 08:00:00.000000'),
       (DEFAULT, 210, 'Employee 105 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-08 02:00:00.000000', '2024-03-08 02:00:00.000000', '2024-03-08 08:00:00.000000'),
       (DEFAULT, 211, 'Employee 107 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-08 02:00:00.000000', '2024-03-08 02:00:00.000000', '2024-03-08 08:00:00.000000'),
       (DEFAULT, 212, 'Employee 109 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-08 02:00:00.000000', '2024-03-08 02:00:00.000000', '2024-03-08 08:00:00.000000'),
       (DEFAULT, 213, 'Employee 111 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-08 02:00:00.000000', '2024-03-08 02:00:00.000000', '2024-03-08 08:00:00.000000'),
       (DEFAULT, 214, 'Employee 119 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-08 02:00:00.000000', '2024-03-08 02:00:00.000000', '2024-03-08 08:00:00.000000');

-- 2024-03-08
-- 2024-03-13
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (14, 1, 121, NULL, 'Build app footer', 'Build app footer', NULL, 'NORMAL', 'FRONTEND', 'LOW', FALSE, '2024-03-08', '2024-03-13', '2024-03-13', '2024-03-08 08:00:00.000000', '2024-03-08 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (215, 14, 15, 'JOINED', '2024-03-08 08:00:00.000000'),
       (216, 14, 17, 'JOINED', '2024-03-08 08:00:00.000000'),
       (217, 14, 19, 'JOINED', '2024-03-08 08:00:00.000000'),
       (218, 14, 21, 'JOINED', '2024-03-08 08:00:00.000000'),
       (219, 14, 29, 'JOINED', '2024-03-08 08:00:00.000000'),
       (220, 14, 45, 'JOINED', '2024-03-08 08:00:00.000000'),
       (221, 14, 47, 'JOINED', '2024-03-08 08:00:00.000000'),
       (222, 14, 49, 'JOINED', '2024-03-08 08:00:00.000000'),
       (223, 14, 51, 'JOINED', '2024-03-08 08:00:00.000000'),
       (224, 14, 59, 'JOINED', '2024-03-08 08:00:00.000000'),
       (225, 14, 75, 'JOINED', '2024-03-08 08:00:00.000000'),
       (226, 14, 77, 'JOINED', '2024-03-08 08:00:00.000000'),
       (227, 14, 79, 'JOINED', '2024-03-08 08:00:00.000000'),
       (228, 14, 81, 'JOINED', '2024-03-08 08:00:00.000000'),
       (229, 14, 105, 'JOINED', '2024-03-08 08:00:00.000000'),
       (230, 14, 107, 'JOINED', '2024-03-08 08:00:00.000000'),
       (231, 14, 109, 'JOINED', '2024-03-08 08:00:00.000000'),
       (232, 14, 111, 'JOINED', '2024-03-08 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 215, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000'),
       (DEFAULT, 216, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000'),
       (DEFAULT, 217, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000'),
       (DEFAULT, 218, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000'),
       (DEFAULT, 219, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000'),
       (DEFAULT, 220, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000'),
       (DEFAULT, 221, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000'),
       (DEFAULT, 222, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000'),
       (DEFAULT, 223, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000'),
       (DEFAULT, 224, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000'),
       (DEFAULT, 225, 'Employee 75 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000'),
       (DEFAULT, 226, 'Employee 77 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000'),
       (DEFAULT, 227, 'Employee 79 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000'),
       (DEFAULT, 228, 'Employee 81 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000'),
       (DEFAULT, 229, 'Employee 105 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000'),
       (DEFAULT, 230, 'Employee 107 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000'),
       (DEFAULT, 231, 'Employee 109 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000'),
       (DEFAULT, 232, 'Employee 111 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000');

-- 2024-03-13
-- 2024-03-17
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (15, 1, 121, NULL, 'Create navigation sidebar', 'Create navigation sidebar', NULL, 'LIGHT', 'FRONTEND', 'NORMAL', FALSE, '2024-03-13', '2024-03-17', '2024-03-17', '2024-03-13 08:00:00.000000', '2024-03-13 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (233, 15, 23, 'JOINED', '2024-03-13 08:00:00.000000'),
       (234, 15, 25, 'JOINED', '2024-03-13 08:00:00.000000'),
       (235, 15, 27, 'JOINED', '2024-03-13 08:00:00.000000'),
       (236, 15, 29, 'JOINED', '2024-03-13 08:00:00.000000'),
       (237, 15, 53, 'JOINED', '2024-03-13 08:00:00.000000'),
       (238, 15, 55, 'JOINED', '2024-03-13 08:00:00.000000'),
       (239, 15, 57, 'JOINED', '2024-03-13 08:00:00.000000'),
       (240, 15, 59, 'JOINED', '2024-03-13 08:00:00.000000'),
       (241, 15, 83, 'JOINED', '2024-03-13 08:00:00.000000'),
       (242, 15, 85, 'JOINED', '2024-03-13 08:00:00.000000'),
       (243, 15, 87, 'JOINED', '2024-03-13 08:00:00.000000'),
       (244, 15, 113, 'JOINED', '2024-03-13 08:00:00.000000'),
       (245, 15, 115, 'JOINED', '2024-03-13 08:00:00.000000'),
       (246, 15, 117, 'JOINED', '2024-03-13 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 233, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-15 08:00:00.000000', '2024-03-15 08:00:00.000000', '2024-03-17 08:00:00.000000'),
       (DEFAULT, 234, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-15 08:00:00.000000', '2024-03-15 08:00:00.000000', '2024-03-17 08:00:00.000000'),
       (DEFAULT, 235, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-15 08:00:00.000000', '2024-03-15 08:00:00.000000', '2024-03-17 08:00:00.000000'),
       (DEFAULT, 236, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-15 08:00:00.000000', '2024-03-15 08:00:00.000000', '2024-03-17 08:00:00.000000'),
       (DEFAULT, 237, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-15 08:00:00.000000', '2024-03-15 08:00:00.000000', '2024-03-17 08:00:00.000000'),
       (DEFAULT, 238, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-15 08:00:00.000000', '2024-03-15 08:00:00.000000', '2024-03-17 08:00:00.000000'),
       (DEFAULT, 239, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-15 08:00:00.000000', '2024-03-15 08:00:00.000000', '2024-03-17 08:00:00.000000'),
       (DEFAULT, 240, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-15 08:00:00.000000', '2024-03-15 08:00:00.000000', '2024-03-17 08:00:00.000000'),
       (DEFAULT, 241, 'Employee 83 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-17 08:00:00.000000', '2024-03-17 08:00:00.000000', '2024-03-17 08:00:00.000000'),
       (DEFAULT, 242, 'Employee 85 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-17 08:00:00.000000', '2024-03-17 08:00:00.000000', '2024-03-17 08:00:00.000000'),
       (DEFAULT, 243, 'Employee 87 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-17 08:00:00.000000', '2024-03-17 08:00:00.000000', '2024-03-17 08:00:00.000000'),
       (DEFAULT, 244, 'Employee 113 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-17 03:12:00.000000', '2024-03-17 03:12:00.000000', '2024-03-17 08:00:00.000000'),
       (DEFAULT, 245, 'Employee 115 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-17 03:12:00.000000', '2024-03-17 03:12:00.000000', '2024-03-17 08:00:00.000000'),
       (DEFAULT, 246, 'Employee 117 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-17 03:12:00.000000', '2024-03-17 03:12:00.000000', '2024-03-17 08:00:00.000000');

-- 2024-03-17
-- 2024-03-21
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (16, 1, 121, NULL, 'Create task form', 'Create task form', NULL, 'LIGHT', 'FRONTEND', 'LOW', FALSE, '2024-03-17', '2024-03-21', '2024-03-21', '2024-03-17 08:00:00.000000', '2024-03-17 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (247, 16, 23, 'JOINED', '2024-03-17 08:00:00.000000'),
       (248, 16, 25, 'JOINED', '2024-03-17 08:00:00.000000'),
       (249, 16, 27, 'JOINED', '2024-03-17 08:00:00.000000'),
       (250, 16, 29, 'JOINED', '2024-03-17 08:00:00.000000'),
       (251, 16, 53, 'JOINED', '2024-03-17 08:00:00.000000'),
       (252, 16, 55, 'JOINED', '2024-03-17 08:00:00.000000'),
       (253, 16, 57, 'JOINED', '2024-03-17 08:00:00.000000'),
       (254, 16, 59, 'JOINED', '2024-03-17 08:00:00.000000'),
       (255, 16, 83, 'JOINED', '2024-03-17 08:00:00.000000'),
       (256, 16, 85, 'JOINED', '2024-03-17 08:00:00.000000'),
       (257, 16, 87, 'JOINED', '2024-03-17 08:00:00.000000'),
       (258, 16, 113, 'JOINED', '2024-03-17 08:00:00.000000'),
       (259, 16, 115, 'JOINED', '2024-03-17 08:00:00.000000'),
       (260, 16, 117, 'JOINED', '2024-03-17 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 247, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-21 08:00:00.000000', '2024-03-21 08:00:00.000000', '2024-03-21 08:00:00.000000'),
       (DEFAULT, 248, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-21 08:00:00.000000', '2024-03-21 08:00:00.000000', '2024-03-21 08:00:00.000000'),
       (DEFAULT, 249, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-21 08:00:00.000000', '2024-03-21 08:00:00.000000', '2024-03-21 08:00:00.000000'),
       (DEFAULT, 250, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-21 08:00:00.000000', '2024-03-21 08:00:00.000000', '2024-03-21 08:00:00.000000'),
       (DEFAULT, 251, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-21 08:00:00.000000', '2024-03-21 08:00:00.000000', '2024-03-21 08:00:00.000000'),
       (DEFAULT, 252, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-21 08:00:00.000000', '2024-03-21 08:00:00.000000', '2024-03-21 08:00:00.000000'),
       (DEFAULT, 253, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-21 08:00:00.000000', '2024-03-21 08:00:00.000000', '2024-03-21 08:00:00.000000'),
       (DEFAULT, 254, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-21 08:00:00.000000', '2024-03-21 08:00:00.000000', '2024-03-21 08:00:00.000000'),
       (DEFAULT, 255, 'Employee 83 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-21 08:00:00.000000', '2024-03-21 08:00:00.000000', '2024-03-21 08:00:00.000000'),
       (DEFAULT, 256, 'Employee 85 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-21 08:00:00.000000', '2024-03-21 08:00:00.000000', '2024-03-21 08:00:00.000000'),
       (DEFAULT, 257, 'Employee 87 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-21 08:00:00.000000', '2024-03-21 08:00:00.000000', '2024-03-21 08:00:00.000000'),
       (DEFAULT, 258, 'Employee 113 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-21 08:00:00.000000', '2024-03-21 08:00:00.000000', '2024-03-21 08:00:00.000000'),
       (DEFAULT, 259, 'Employee 115 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-21 08:00:00.000000', '2024-03-21 08:00:00.000000', '2024-03-21 08:00:00.000000'),
       (DEFAULT, 260, 'Employee 117 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-21 08:00:00.000000', '2024-03-21 08:00:00.000000', '2024-03-21 08:00:00.000000');

-- 2024-03-21
-- 2024-03-24
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (17, 1, 121, NULL, 'Create user repository', 'Create user repository', NULL, 'HARD', 'BACKEND', 'NORMAL', FALSE, '2024-03-21', '2024-03-24', '2024-03-24', '2024-03-21 08:00:00.000000', '2024-03-21 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (261, 17, 2, 'JOINED', '2024-03-21 08:00:00.000000'),
       (262, 17, 4, 'JOINED', '2024-03-21 08:00:00.000000'),
       (263, 17, 6, 'JOINED', '2024-03-21 08:00:00.000000'),
       (264, 17, 30, 'JOINED', '2024-03-21 08:00:00.000000'),
       (265, 17, 32, 'JOINED', '2024-03-21 08:00:00.000000'),
       (266, 17, 34, 'JOINED', '2024-03-21 08:00:00.000000'),
       (267, 17, 36, 'JOINED', '2024-03-21 08:00:00.000000'),
       (268, 17, 60, 'JOINED', '2024-03-21 08:00:00.000000'),
       (269, 17, 62, 'JOINED', '2024-03-21 08:00:00.000000'),
       (270, 17, 64, 'JOINED', '2024-03-21 08:00:00.000000'),
       (271, 17, 66, 'JOINED', '2024-03-21 08:00:00.000000'),
       (272, 17, 92, 'JOINED', '2024-03-21 08:00:00.000000'),
       (273, 17, 94, 'JOINED', '2024-03-21 08:00:00.000000'),
       (274, 17, 96, 'JOINED', '2024-03-21 08:00:00.000000'),
       (275, 17, 120, 'JOINED', '2024-03-21 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 261, 'Employee 2 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-22 23:36:00.000000', '2024-03-22 23:36:00.000000', '2024-03-24 08:00:00.000000'),
       (DEFAULT, 262, 'Employee 4 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-22 23:36:00.000000', '2024-03-22 23:36:00.000000', '2024-03-24 08:00:00.000000'),
       (DEFAULT, 263, 'Employee 6 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-22 23:36:00.000000', '2024-03-22 23:36:00.000000', '2024-03-24 08:00:00.000000'),
       (DEFAULT, 264, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-23 03:12:00.000000', '2024-03-23 03:12:00.000000', '2024-03-24 08:00:00.000000'),
       (DEFAULT, 265, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-22 23:36:00.000000', '2024-03-22 23:36:00.000000', '2024-03-24 08:00:00.000000'),
       (DEFAULT, 266, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-22 23:36:00.000000', '2024-03-22 23:36:00.000000', '2024-03-24 08:00:00.000000'),
       (DEFAULT, 267, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-22 23:36:00.000000', '2024-03-22 23:36:00.000000', '2024-03-24 08:00:00.000000'),
       (DEFAULT, 268, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-23 03:12:00.000000', '2024-03-23 03:12:00.000000', '2024-03-24 08:00:00.000000'),
       (DEFAULT, 269, 'Employee 62 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-24 08:00:00.000000', '2024-03-24 08:00:00.000000', '2024-03-24 08:00:00.000000'),
       (DEFAULT, 270, 'Employee 64 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-24 08:00:00.000000', '2024-03-24 08:00:00.000000', '2024-03-24 08:00:00.000000'),
       (DEFAULT, 271, 'Employee 66 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-24 08:00:00.000000', '2024-03-24 08:00:00.000000', '2024-03-24 08:00:00.000000'),
       (DEFAULT, 272, 'Employee 92 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-24 08:00:00.000000', '2024-03-24 08:00:00.000000', '2024-03-24 08:00:00.000000'),
       (DEFAULT, 273, 'Employee 94 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-24 08:00:00.000000', '2024-03-24 08:00:00.000000', '2024-03-24 08:00:00.000000'),
       (DEFAULT, 274, 'Employee 96 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-24 08:00:00.000000', '2024-03-24 08:00:00.000000', '2024-03-24 08:00:00.000000'),
       (DEFAULT, 275, 'Employee 120 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-24 08:00:00.000000', '2024-03-24 08:00:00.000000', '2024-03-24 08:00:00.000000');

-- 2024-03-24
-- 2024-03-31
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (18, 1, 121, NULL, 'Create task repository', 'Create task repository', NULL, 'HARD', 'BACKEND', 'LOW', FALSE, '2024-03-24', '2024-03-31', '2024-03-31', '2024-03-24 08:00:00.000000', '2024-03-24 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (276, 18, 32, 'JOINED', '2024-03-24 08:00:00.000000'),
       (277, 18, 34, 'JOINED', '2024-03-24 08:00:00.000000'),
       (278, 18, 36, 'JOINED', '2024-03-24 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 276, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-31 08:00:00.000000', '2024-03-31 08:00:00.000000', '2024-03-31 08:00:00.000000'),
       (DEFAULT, 277, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-31 08:00:00.000000', '2024-03-31 08:00:00.000000', '2024-03-31 08:00:00.000000'),
       (DEFAULT, 278, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-31 08:00:00.000000', '2024-03-31 08:00:00.000000', '2024-03-31 08:00:00.000000');

-- 2024-03-31
-- 2024-04-06
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (19, 1, 121, NULL, 'Add global exception handler', 'Add global exception handler', NULL, 'ADVANCED', 'BACKEND', 'NORMAL', FALSE, '2024-03-31', '2024-04-06', '2024-04-06', '2024-03-31 08:00:00.000000', '2024-03-31 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (279, 19, 8, 'JOINED', '2024-03-31 08:00:00.000000'),
       (280, 19, 10, 'JOINED', '2024-03-31 08:00:00.000000'),
       (281, 19, 12, 'JOINED', '2024-03-31 08:00:00.000000'),
       (282, 19, 14, 'JOINED', '2024-03-31 08:00:00.000000'),
       (283, 19, 30, 'JOINED', '2024-03-31 08:00:00.000000'),
       (284, 19, 38, 'JOINED', '2024-03-31 08:00:00.000000'),
       (285, 19, 40, 'JOINED', '2024-03-31 08:00:00.000000'),
       (286, 19, 42, 'JOINED', '2024-03-31 08:00:00.000000'),
       (287, 19, 44, 'JOINED', '2024-03-31 08:00:00.000000'),
       (288, 19, 60, 'JOINED', '2024-03-31 08:00:00.000000'),
       (289, 19, 68, 'JOINED', '2024-03-31 08:00:00.000000'),
       (290, 19, 98, 'JOINED', '2024-03-31 08:00:00.000000'),
       (291, 19, 100, 'JOINED', '2024-03-31 08:00:00.000000'),
       (292, 19, 102, 'JOINED', '2024-03-31 08:00:00.000000'),
       (293, 19, 104, 'JOINED', '2024-03-31 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 279, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-03 15:12:00.000000', '2024-04-03 15:12:00.000000', '2024-04-06 08:00:00.000000'),
       (DEFAULT, 280, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-03 15:12:00.000000', '2024-04-03 15:12:00.000000', '2024-04-06 08:00:00.000000'),
       (DEFAULT, 281, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-03 15:12:00.000000', '2024-04-03 15:12:00.000000', '2024-04-06 08:00:00.000000'),
       (DEFAULT, 282, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-03 15:12:00.000000', '2024-04-03 15:12:00.000000', '2024-04-06 08:00:00.000000'),
       (DEFAULT, 283, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-05 10:24:00.000000', '2024-04-05 10:24:00.000000', '2024-04-06 08:00:00.000000'),
       (DEFAULT, 284, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-03 15:12:00.000000', '2024-04-03 15:12:00.000000', '2024-04-06 08:00:00.000000'),
       (DEFAULT, 285, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-03 15:12:00.000000', '2024-04-03 15:12:00.000000', '2024-04-06 08:00:00.000000'),
       (DEFAULT, 286, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-03 15:12:00.000000', '2024-04-03 15:12:00.000000', '2024-04-06 08:00:00.000000'),
       (DEFAULT, 287, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-03 15:12:00.000000', '2024-04-03 15:12:00.000000', '2024-04-06 08:00:00.000000'),
       (DEFAULT, 288, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-05 10:24:00.000000', '2024-04-05 10:24:00.000000', '2024-04-06 08:00:00.000000'),
       (DEFAULT, 289, 'Employee 68 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-06 08:00:00.000000', '2024-04-06 08:00:00.000000', '2024-04-06 08:00:00.000000'),
       (DEFAULT, 290, 'Employee 98 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-06 08:00:00.000000', '2024-04-06 08:00:00.000000', '2024-04-06 08:00:00.000000'),
       (DEFAULT, 291, 'Employee 100 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-06 08:00:00.000000', '2024-04-06 08:00:00.000000', '2024-04-06 08:00:00.000000'),
       (DEFAULT, 292, 'Employee 102 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-06 08:00:00.000000', '2024-04-06 08:00:00.000000', '2024-04-06 08:00:00.000000'),
       (DEFAULT, 293, 'Employee 104 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-06 08:00:00.000000', '2024-04-06 08:00:00.000000', '2024-04-06 08:00:00.000000');

-- 2024-04-06
-- 2024-04-12
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (20, 1, 121, NULL, 'Add custom error response', 'Add custom error response', NULL, 'ADVANCED', 'BACKEND', 'LOW', FALSE, '2024-04-06', '2024-04-12', '2024-04-12', '2024-04-06 08:00:00.000000', '2024-04-06 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (294, 20, 8, 'JOINED', '2024-04-06 08:00:00.000000'),
       (295, 20, 10, 'JOINED', '2024-04-06 08:00:00.000000'),
       (296, 20, 12, 'JOINED', '2024-04-06 08:00:00.000000'),
       (297, 20, 14, 'JOINED', '2024-04-06 08:00:00.000000'),
       (298, 20, 38, 'JOINED', '2024-04-06 08:00:00.000000'),
       (299, 20, 40, 'JOINED', '2024-04-06 08:00:00.000000'),
       (300, 20, 42, 'JOINED', '2024-04-06 08:00:00.000000'),
       (301, 20, 44, 'JOINED', '2024-04-06 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 294, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-12 08:00:00.000000', '2024-04-12 08:00:00.000000', '2024-04-12 08:00:00.000000'),
       (DEFAULT, 295, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-12 08:00:00.000000', '2024-04-12 08:00:00.000000', '2024-04-12 08:00:00.000000'),
       (DEFAULT, 296, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-12 08:00:00.000000', '2024-04-12 08:00:00.000000', '2024-04-12 08:00:00.000000'),
       (DEFAULT, 297, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-12 08:00:00.000000', '2024-04-12 08:00:00.000000', '2024-04-12 08:00:00.000000'),
       (DEFAULT, 298, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-12 08:00:00.000000', '2024-04-12 08:00:00.000000', '2024-04-12 08:00:00.000000'),
       (DEFAULT, 299, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-12 08:00:00.000000', '2024-04-12 08:00:00.000000', '2024-04-12 08:00:00.000000'),
       (DEFAULT, 300, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-12 08:00:00.000000', '2024-04-12 08:00:00.000000', '2024-04-12 08:00:00.000000'),
       (DEFAULT, 301, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-12 08:00:00.000000', '2024-04-12 08:00:00.000000', '2024-04-12 08:00:00.000000');

-- 2024-04-12
-- 2024-04-17
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (21, 1, 121, NULL, 'Implement user service', 'Implement user service', NULL, 'NORMAL', 'BACKEND', 'NORMAL', FALSE, '2024-04-12', '2024-04-17', '2024-04-17', '2024-04-12 08:00:00.000000', '2024-04-12 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (302, 21, 16, 'JOINED', '2024-04-12 08:00:00.000000'),
       (303, 21, 18, 'JOINED', '2024-04-12 08:00:00.000000'),
       (304, 21, 20, 'JOINED', '2024-04-12 08:00:00.000000'),
       (305, 21, 30, 'JOINED', '2024-04-12 08:00:00.000000'),
       (306, 21, 46, 'JOINED', '2024-04-12 08:00:00.000000'),
       (307, 21, 48, 'JOINED', '2024-04-12 08:00:00.000000'),
       (308, 21, 50, 'JOINED', '2024-04-12 08:00:00.000000'),
       (309, 21, 60, 'JOINED', '2024-04-12 08:00:00.000000'),
       (310, 21, 106, 'JOINED', '2024-04-12 08:00:00.000000'),
       (311, 21, 108, 'JOINED', '2024-04-12 08:00:00.000000'),
       (312, 21, 110, 'JOINED', '2024-04-12 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 302, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-15 02:00:00.000000', '2024-04-15 02:00:00.000000', '2024-04-17 08:00:00.000000'),
       (DEFAULT, 303, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-15 02:00:00.000000', '2024-04-15 02:00:00.000000', '2024-04-17 08:00:00.000000'),
       (DEFAULT, 304, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-15 02:00:00.000000', '2024-04-15 02:00:00.000000', '2024-04-17 08:00:00.000000'),
       (DEFAULT, 305, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-16 08:00:00.000000', '2024-04-16 08:00:00.000000', '2024-04-17 08:00:00.000000'),
       (DEFAULT, 306, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-15 02:00:00.000000', '2024-04-15 02:00:00.000000', '2024-04-17 08:00:00.000000'),
       (DEFAULT, 307, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-15 02:00:00.000000', '2024-04-15 02:00:00.000000', '2024-04-17 08:00:00.000000'),
       (DEFAULT, 308, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-15 02:00:00.000000', '2024-04-15 02:00:00.000000', '2024-04-17 08:00:00.000000'),
       (DEFAULT, 309, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-16 08:00:00.000000', '2024-04-16 08:00:00.000000', '2024-04-17 08:00:00.000000'),
       (DEFAULT, 310, 'Employee 106 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-17 08:00:00.000000', '2024-04-17 08:00:00.000000', '2024-04-17 08:00:00.000000'),
       (DEFAULT, 311, 'Employee 108 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-17 08:00:00.000000', '2024-04-17 08:00:00.000000', '2024-04-17 08:00:00.000000'),
       (DEFAULT, 312, 'Employee 110 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-17 08:00:00.000000', '2024-04-17 08:00:00.000000', '2024-04-17 08:00:00.000000');

-- 2024-04-17
-- 2024-04-22
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (22, 1, 121, NULL, 'Implement task service', 'Implement task service', NULL, 'NORMAL', 'BACKEND', 'LOW', FALSE, '2024-04-17', '2024-04-22', '2024-04-22', '2024-04-17 08:00:00.000000', '2024-04-17 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (313, 22, 16, 'JOINED', '2024-04-17 08:00:00.000000'),
       (314, 22, 18, 'JOINED', '2024-04-17 08:00:00.000000'),
       (315, 22, 20, 'JOINED', '2024-04-17 08:00:00.000000'),
       (316, 22, 46, 'JOINED', '2024-04-17 08:00:00.000000'),
       (317, 22, 48, 'JOINED', '2024-04-17 08:00:00.000000'),
       (318, 22, 50, 'JOINED', '2024-04-17 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 313, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-22 08:00:00.000000', '2024-04-22 08:00:00.000000', '2024-04-22 08:00:00.000000'),
       (DEFAULT, 314, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-22 08:00:00.000000', '2024-04-22 08:00:00.000000', '2024-04-22 08:00:00.000000'),
       (DEFAULT, 315, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-22 08:00:00.000000', '2024-04-22 08:00:00.000000', '2024-04-22 08:00:00.000000'),
       (DEFAULT, 316, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-22 08:00:00.000000', '2024-04-22 08:00:00.000000', '2024-04-22 08:00:00.000000'),
       (DEFAULT, 317, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-22 08:00:00.000000', '2024-04-22 08:00:00.000000', '2024-04-22 08:00:00.000000'),
       (DEFAULT, 318, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-22 08:00:00.000000', '2024-04-22 08:00:00.000000', '2024-04-22 08:00:00.000000');

-- 2024-04-22
-- 2024-04-26
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (23, 1, 121, NULL, 'Implement auth service', 'Implement auth service', NULL, 'LIGHT', 'BACKEND', 'NORMAL', FALSE, '2024-04-22', '2024-04-26', '2024-04-26', '2024-04-22 08:00:00.000000', '2024-04-22 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (319, 23, 22, 'JOINED', '2024-04-22 08:00:00.000000'),
       (320, 23, 24, 'JOINED', '2024-04-22 08:00:00.000000'),
       (321, 23, 26, 'JOINED', '2024-04-22 08:00:00.000000'),
       (322, 23, 28, 'JOINED', '2024-04-22 08:00:00.000000'),
       (323, 23, 30, 'JOINED', '2024-04-22 08:00:00.000000'),
       (324, 23, 52, 'JOINED', '2024-04-22 08:00:00.000000'),
       (325, 23, 54, 'JOINED', '2024-04-22 08:00:00.000000'),
       (326, 23, 56, 'JOINED', '2024-04-22 08:00:00.000000'),
       (327, 23, 58, 'JOINED', '2024-04-22 08:00:00.000000'),
       (328, 23, 60, 'JOINED', '2024-04-22 08:00:00.000000'),
       (329, 23, 112, 'JOINED', '2024-04-22 08:00:00.000000'),
       (330, 23, 114, 'JOINED', '2024-04-22 08:00:00.000000'),
       (331, 23, 116, 'JOINED', '2024-04-22 08:00:00.000000'),
       (332, 23, 118, 'JOINED', '2024-04-22 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 319, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-24 12:48:00.000000', '2024-04-24 12:48:00.000000', '2024-04-26 08:00:00.000000'),
       (DEFAULT, 320, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-24 12:48:00.000000', '2024-04-24 12:48:00.000000', '2024-04-26 08:00:00.000000'),
       (DEFAULT, 321, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-24 12:48:00.000000', '2024-04-24 12:48:00.000000', '2024-04-26 08:00:00.000000'),
       (DEFAULT, 322, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-24 12:48:00.000000', '2024-04-24 12:48:00.000000', '2024-04-26 08:00:00.000000'),
       (DEFAULT, 323, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-25 03:12:00.000000', '2024-04-25 03:12:00.000000', '2024-04-26 08:00:00.000000'),
       (DEFAULT, 324, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-24 12:48:00.000000', '2024-04-24 12:48:00.000000', '2024-04-26 08:00:00.000000'),
       (DEFAULT, 325, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-24 12:48:00.000000', '2024-04-24 12:48:00.000000', '2024-04-26 08:00:00.000000'),
       (DEFAULT, 326, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-24 12:48:00.000000', '2024-04-24 12:48:00.000000', '2024-04-26 08:00:00.000000'),
       (DEFAULT, 327, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-24 12:48:00.000000', '2024-04-24 12:48:00.000000', '2024-04-26 08:00:00.000000'),
       (DEFAULT, 328, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-25 03:12:00.000000', '2024-04-25 03:12:00.000000', '2024-04-26 08:00:00.000000'),
       (DEFAULT, 329, 'Employee 112 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-26 08:00:00.000000', '2024-04-26 08:00:00.000000', '2024-04-26 08:00:00.000000'),
       (DEFAULT, 330, 'Employee 114 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-26 08:00:00.000000', '2024-04-26 08:00:00.000000', '2024-04-26 08:00:00.000000'),
       (DEFAULT, 331, 'Employee 116 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-26 08:00:00.000000', '2024-04-26 08:00:00.000000', '2024-04-26 08:00:00.000000'),
       (DEFAULT, 332, 'Employee 118 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-26 08:00:00.000000', '2024-04-26 08:00:00.000000', '2024-04-26 08:00:00.000000');

-- 2024-04-26
-- 2024-04-30
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (24, 1, 121, NULL, 'Implement jwt provider', 'Implement jwt provider', NULL, 'LIGHT', 'BACKEND', 'LOW', FALSE, '2024-04-26', '2024-04-30', '2024-04-30', '2024-04-26 08:00:00.000000', '2024-04-26 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (333, 24, 22, 'JOINED', '2024-04-26 08:00:00.000000'),
       (334, 24, 24, 'JOINED', '2024-04-26 08:00:00.000000'),
       (335, 24, 26, 'JOINED', '2024-04-26 08:00:00.000000'),
       (336, 24, 28, 'JOINED', '2024-04-26 08:00:00.000000'),
       (337, 24, 30, 'JOINED', '2024-04-26 08:00:00.000000'),
       (338, 24, 52, 'JOINED', '2024-04-26 08:00:00.000000'),
       (339, 24, 54, 'JOINED', '2024-04-26 08:00:00.000000'),
       (340, 24, 56, 'JOINED', '2024-04-26 08:00:00.000000'),
       (341, 24, 58, 'JOINED', '2024-04-26 08:00:00.000000'),
       (342, 24, 60, 'JOINED', '2024-04-26 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 333, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-30 08:00:00.000000', '2024-04-30 08:00:00.000000', '2024-04-30 08:00:00.000000'),
       (DEFAULT, 334, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-30 08:00:00.000000', '2024-04-30 08:00:00.000000', '2024-04-30 08:00:00.000000'),
       (DEFAULT, 335, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-30 08:00:00.000000', '2024-04-30 08:00:00.000000', '2024-04-30 08:00:00.000000'),
       (DEFAULT, 336, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-30 08:00:00.000000', '2024-04-30 08:00:00.000000', '2024-04-30 08:00:00.000000'),
       (DEFAULT, 337, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-30 08:00:00.000000', '2024-04-30 08:00:00.000000', '2024-04-30 08:00:00.000000'),
       (DEFAULT, 338, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-30 08:00:00.000000', '2024-04-30 08:00:00.000000', '2024-04-30 08:00:00.000000'),
       (DEFAULT, 339, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-30 08:00:00.000000', '2024-04-30 08:00:00.000000', '2024-04-30 08:00:00.000000'),
       (DEFAULT, 340, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-30 08:00:00.000000', '2024-04-30 08:00:00.000000', '2024-04-30 08:00:00.000000'),
       (DEFAULT, 341, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-30 08:00:00.000000', '2024-04-30 08:00:00.000000', '2024-04-30 08:00:00.000000'),
       (DEFAULT, 342, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-30 08:00:00.000000', '2024-04-30 08:00:00.000000', '2024-04-30 08:00:00.000000');

-- 2024-04-30
-- 2024-05-03
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (25, 1, 121, NULL, 'Create task edit form', 'Create task edit form', NULL, 'HARD', 'FRONTEND', 'NORMAL', FALSE, '2024-04-30', '2024-05-03', '2024-05-03', '2024-04-30 08:00:00.000000', '2024-04-30 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (343, 25, 1, 'JOINED', '2024-04-30 08:00:00.000000'),
       (344, 25, 3, 'JOINED', '2024-04-30 08:00:00.000000'),
       (345, 25, 5, 'JOINED', '2024-04-30 08:00:00.000000'),
       (346, 25, 7, 'JOINED', '2024-04-30 08:00:00.000000'),
       (347, 25, 29, 'JOINED', '2024-04-30 08:00:00.000000'),
       (348, 25, 31, 'JOINED', '2024-04-30 08:00:00.000000'),
       (349, 25, 33, 'JOINED', '2024-04-30 08:00:00.000000'),
       (350, 25, 35, 'JOINED', '2024-04-30 08:00:00.000000'),
       (351, 25, 37, 'JOINED', '2024-04-30 08:00:00.000000'),
       (352, 25, 59, 'JOINED', '2024-04-30 08:00:00.000000'),
       (353, 25, 61, 'JOINED', '2024-04-30 08:00:00.000000'),
       (354, 25, 63, 'JOINED', '2024-04-30 08:00:00.000000'),
       (355, 25, 65, 'JOINED', '2024-04-30 08:00:00.000000'),
       (356, 25, 67, 'JOINED', '2024-04-30 08:00:00.000000'),
       (357, 25, 91, 'JOINED', '2024-04-30 08:00:00.000000'),
       (358, 25, 93, 'JOINED', '2024-04-30 08:00:00.000000'),
       (359, 25, 95, 'JOINED', '2024-04-30 08:00:00.000000'),
       (360, 25, 97, 'JOINED', '2024-04-30 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 343, 'Employee 1 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-01 23:36:00.000000', '2024-05-01 23:36:00.000000', '2024-05-03 08:00:00.000000'),
       (DEFAULT, 344, 'Employee 3 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-01 23:36:00.000000', '2024-05-01 23:36:00.000000', '2024-05-03 08:00:00.000000'),
       (DEFAULT, 345, 'Employee 5 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-01 23:36:00.000000', '2024-05-01 23:36:00.000000', '2024-05-03 08:00:00.000000'),
       (DEFAULT, 346, 'Employee 7 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-01 23:36:00.000000', '2024-05-01 23:36:00.000000', '2024-05-03 08:00:00.000000'),
       (DEFAULT, 347, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-02 17:36:00.000000', '2024-05-02 17:36:00.000000', '2024-05-03 08:00:00.000000'),
       (DEFAULT, 348, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-01 23:36:00.000000', '2024-05-01 23:36:00.000000', '2024-05-03 08:00:00.000000'),
       (DEFAULT, 349, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-01 23:36:00.000000', '2024-05-01 23:36:00.000000', '2024-05-03 08:00:00.000000'),
       (DEFAULT, 350, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-01 23:36:00.000000', '2024-05-01 23:36:00.000000', '2024-05-03 08:00:00.000000'),
       (DEFAULT, 351, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-01 23:36:00.000000', '2024-05-01 23:36:00.000000', '2024-05-03 08:00:00.000000'),
       (DEFAULT, 352, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-02 17:36:00.000000', '2024-05-02 17:36:00.000000', '2024-05-03 08:00:00.000000'),
       (DEFAULT, 353, 'Employee 61 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-03 08:00:00.000000', '2024-05-03 08:00:00.000000', '2024-05-03 08:00:00.000000'),
       (DEFAULT, 354, 'Employee 63 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-03 08:00:00.000000', '2024-05-03 08:00:00.000000', '2024-05-03 08:00:00.000000'),
       (DEFAULT, 355, 'Employee 65 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-03 08:00:00.000000', '2024-05-03 08:00:00.000000', '2024-05-03 08:00:00.000000'),
       (DEFAULT, 356, 'Employee 67 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-03 08:00:00.000000', '2024-05-03 08:00:00.000000', '2024-05-03 08:00:00.000000'),
       (DEFAULT, 357, 'Employee 91 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-03 08:00:00.000000', '2024-05-03 08:00:00.000000', '2024-05-03 08:00:00.000000'),
       (DEFAULT, 358, 'Employee 93 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-03 08:00:00.000000', '2024-05-03 08:00:00.000000', '2024-05-03 08:00:00.000000'),
       (DEFAULT, 359, 'Employee 95 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-03 08:00:00.000000', '2024-05-03 08:00:00.000000', '2024-05-03 08:00:00.000000'),
       (DEFAULT, 360, 'Employee 97 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-03 08:00:00.000000', '2024-05-03 08:00:00.000000', '2024-05-03 08:00:00.000000');

-- 2024-05-03
-- 2024-05-10
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (26, 1, 121, NULL, 'Create login form', 'Create login form', NULL, 'HARD', 'FRONTEND', 'LOW', FALSE, '2024-05-03', '2024-05-10', '2024-05-10', '2024-05-03 08:00:00.000000', '2024-05-03 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (361, 26, 31, 'JOINED', '2024-05-03 08:00:00.000000'),
       (362, 26, 33, 'JOINED', '2024-05-03 08:00:00.000000'),
       (363, 26, 35, 'JOINED', '2024-05-03 08:00:00.000000'),
       (364, 26, 37, 'JOINED', '2024-05-03 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 361, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-10 08:00:00.000000', '2024-05-10 08:00:00.000000', '2024-05-10 08:00:00.000000'),
       (DEFAULT, 362, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-10 08:00:00.000000', '2024-05-10 08:00:00.000000', '2024-05-10 08:00:00.000000'),
       (DEFAULT, 363, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-10 08:00:00.000000', '2024-05-10 08:00:00.000000', '2024-05-10 08:00:00.000000'),
       (DEFAULT, 364, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-10 08:00:00.000000', '2024-05-10 08:00:00.000000', '2024-05-10 08:00:00.000000');

-- 2024-05-10
-- 2024-05-16
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (27, 1, 121, NULL, 'Create register form', 'Create register form', NULL, 'ADVANCED', 'FRONTEND', 'NORMAL', FALSE, '2024-05-10', '2024-05-16', '2024-05-16', '2024-05-10 08:00:00.000000', '2024-05-10 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (365, 27, 9, 'JOINED', '2024-05-10 08:00:00.000000'),
       (366, 27, 11, 'JOINED', '2024-05-10 08:00:00.000000'),
       (367, 27, 13, 'JOINED', '2024-05-10 08:00:00.000000'),
       (368, 27, 29, 'JOINED', '2024-05-10 08:00:00.000000'),
       (369, 27, 39, 'JOINED', '2024-05-10 08:00:00.000000'),
       (370, 27, 41, 'JOINED', '2024-05-10 08:00:00.000000'),
       (371, 27, 43, 'JOINED', '2024-05-10 08:00:00.000000'),
       (372, 27, 59, 'JOINED', '2024-05-10 08:00:00.000000'),
       (373, 27, 69, 'JOINED', '2024-05-10 08:00:00.000000'),
       (374, 27, 99, 'JOINED', '2024-05-10 08:00:00.000000'),
       (375, 27, 101, 'JOINED', '2024-05-10 08:00:00.000000'),
       (376, 27, 103, 'JOINED', '2024-05-10 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 365, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-13 15:12:00.000000', '2024-05-13 15:12:00.000000', '2024-05-16 08:00:00.000000'),
       (DEFAULT, 366, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-13 15:12:00.000000', '2024-05-13 15:12:00.000000', '2024-05-16 08:00:00.000000'),
       (DEFAULT, 367, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-13 15:12:00.000000', '2024-05-13 15:12:00.000000', '2024-05-16 08:00:00.000000'),
       (DEFAULT, 368, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-14 12:48:00.000000', '2024-05-14 12:48:00.000000', '2024-05-16 08:00:00.000000'),
       (DEFAULT, 369, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-13 15:12:00.000000', '2024-05-13 15:12:00.000000', '2024-05-16 08:00:00.000000'),
       (DEFAULT, 370, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-13 15:12:00.000000', '2024-05-13 15:12:00.000000', '2024-05-16 08:00:00.000000'),
       (DEFAULT, 371, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-13 15:12:00.000000', '2024-05-13 15:12:00.000000', '2024-05-16 08:00:00.000000'),
       (DEFAULT, 372, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-14 12:48:00.000000', '2024-05-14 12:48:00.000000', '2024-05-16 08:00:00.000000'),
       (DEFAULT, 373, 'Employee 69 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-16 08:00:00.000000', '2024-05-16 08:00:00.000000', '2024-05-16 08:00:00.000000'),
       (DEFAULT, 374, 'Employee 99 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-16 08:00:00.000000', '2024-05-16 08:00:00.000000', '2024-05-16 08:00:00.000000'),
       (DEFAULT, 375, 'Employee 101 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-16 08:00:00.000000', '2024-05-16 08:00:00.000000', '2024-05-16 08:00:00.000000'),
       (DEFAULT, 376, 'Employee 103 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-16 08:00:00.000000', '2024-05-16 08:00:00.000000', '2024-05-16 08:00:00.000000');

-- 2024-05-16
-- 2024-05-22
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (28, 1, 121, NULL, 'Add basic form validation', 'Add basic form validation', NULL, 'ADVANCED', 'FRONTEND', 'LOW', FALSE, '2024-05-16', '2024-05-22', '2024-05-22', '2024-05-16 08:00:00.000000', '2024-05-16 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (377, 28, 9, 'JOINED', '2024-05-16 08:00:00.000000'),
       (378, 28, 11, 'JOINED', '2024-05-16 08:00:00.000000'),
       (379, 28, 13, 'JOINED', '2024-05-16 08:00:00.000000'),
       (380, 28, 29, 'JOINED', '2024-05-16 08:00:00.000000'),
       (381, 28, 39, 'JOINED', '2024-05-16 08:00:00.000000'),
       (382, 28, 41, 'JOINED', '2024-05-16 08:00:00.000000'),
       (383, 28, 43, 'JOINED', '2024-05-16 08:00:00.000000'),
       (384, 28, 59, 'JOINED', '2024-05-16 08:00:00.000000'),
       (385, 28, 69, 'JOINED', '2024-05-16 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 377, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-22 08:00:00.000000', '2024-05-22 08:00:00.000000', '2024-05-22 08:00:00.000000'),
       (DEFAULT, 378, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-22 08:00:00.000000', '2024-05-22 08:00:00.000000', '2024-05-22 08:00:00.000000'),
       (DEFAULT, 379, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-22 08:00:00.000000', '2024-05-22 08:00:00.000000', '2024-05-22 08:00:00.000000'),
       (DEFAULT, 380, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-22 08:00:00.000000', '2024-05-22 08:00:00.000000', '2024-05-22 08:00:00.000000'),
       (DEFAULT, 381, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-22 08:00:00.000000', '2024-05-22 08:00:00.000000', '2024-05-22 08:00:00.000000'),
       (DEFAULT, 382, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-22 08:00:00.000000', '2024-05-22 08:00:00.000000', '2024-05-22 08:00:00.000000'),
       (DEFAULT, 383, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-22 08:00:00.000000', '2024-05-22 08:00:00.000000', '2024-05-22 08:00:00.000000'),
       (DEFAULT, 384, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-22 08:00:00.000000', '2024-05-22 08:00:00.000000', '2024-05-22 08:00:00.000000'),
       (DEFAULT, 385, 'Employee 69 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-22 08:00:00.000000', '2024-05-22 08:00:00.000000', '2024-05-22 08:00:00.000000');

-- 2024-05-22
-- 2024-05-27
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (29, 1, 121, NULL, 'Render task list', 'Render task list', NULL, 'NORMAL', 'FRONTEND', 'NORMAL', FALSE, '2024-05-22', '2024-05-27', '2024-05-27', '2024-05-22 08:00:00.000000', '2024-05-22 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (386, 29, 15, 'JOINED', '2024-05-22 08:00:00.000000'),
       (387, 29, 17, 'JOINED', '2024-05-22 08:00:00.000000'),
       (388, 29, 19, 'JOINED', '2024-05-22 08:00:00.000000'),
       (389, 29, 21, 'JOINED', '2024-05-22 08:00:00.000000'),
       (390, 29, 29, 'JOINED', '2024-05-22 08:00:00.000000'),
       (391, 29, 45, 'JOINED', '2024-05-22 08:00:00.000000'),
       (392, 29, 47, 'JOINED', '2024-05-22 08:00:00.000000'),
       (393, 29, 49, 'JOINED', '2024-05-22 08:00:00.000000'),
       (394, 29, 51, 'JOINED', '2024-05-22 08:00:00.000000'),
       (395, 29, 59, 'JOINED', '2024-05-22 08:00:00.000000'),
       (396, 29, 105, 'JOINED', '2024-05-22 08:00:00.000000'),
       (397, 29, 107, 'JOINED', '2024-05-22 08:00:00.000000'),
       (398, 29, 109, 'JOINED', '2024-05-22 08:00:00.000000'),
       (399, 29, 111, 'JOINED', '2024-05-22 08:00:00.000000'),
       (400, 29, 119, 'JOINED', '2024-05-22 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 386, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-25 02:00:00.000000', '2024-05-25 02:00:00.000000', '2024-05-27 08:00:00.000000'),
       (DEFAULT, 387, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-25 02:00:00.000000', '2024-05-25 02:00:00.000000', '2024-05-27 08:00:00.000000'),
       (DEFAULT, 388, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-25 02:00:00.000000', '2024-05-25 02:00:00.000000', '2024-05-27 08:00:00.000000'),
       (DEFAULT, 389, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-25 02:00:00.000000', '2024-05-25 02:00:00.000000', '2024-05-27 08:00:00.000000'),
       (DEFAULT, 390, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-25 08:00:00.000000', '2024-05-25 08:00:00.000000', '2024-05-27 08:00:00.000000'),
       (DEFAULT, 391, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-25 02:00:00.000000', '2024-05-25 02:00:00.000000', '2024-05-27 08:00:00.000000'),
       (DEFAULT, 392, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-25 02:00:00.000000', '2024-05-25 02:00:00.000000', '2024-05-27 08:00:00.000000'),
       (DEFAULT, 393, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-25 02:00:00.000000', '2024-05-25 02:00:00.000000', '2024-05-27 08:00:00.000000'),
       (DEFAULT, 394, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-25 02:00:00.000000', '2024-05-25 02:00:00.000000', '2024-05-27 08:00:00.000000'),
       (DEFAULT, 395, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-25 08:00:00.000000', '2024-05-25 08:00:00.000000', '2024-05-27 08:00:00.000000'),
       (DEFAULT, 396, 'Employee 105 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-27 08:00:00.000000', '2024-05-27 08:00:00.000000', '2024-05-27 08:00:00.000000'),
       (DEFAULT, 397, 'Employee 107 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-27 08:00:00.000000', '2024-05-27 08:00:00.000000', '2024-05-27 08:00:00.000000'),
       (DEFAULT, 398, 'Employee 109 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-27 08:00:00.000000', '2024-05-27 08:00:00.000000', '2024-05-27 08:00:00.000000'),
       (DEFAULT, 399, 'Employee 111 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-27 08:00:00.000000', '2024-05-27 08:00:00.000000', '2024-05-27 08:00:00.000000'),
       (DEFAULT, 400, 'Employee 119 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-27 08:00:00.000000', '2024-05-27 08:00:00.000000', '2024-05-27 08:00:00.000000');

-- 2024-05-27
-- 2024-06-01
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (30, 1, 121, NULL, 'Render task detail', 'Render task detail', NULL, 'NORMAL', 'FRONTEND', 'LOW', FALSE, '2024-05-27', '2024-06-01', '2024-06-01', '2024-05-27 08:00:00.000000', '2024-05-27 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (401, 30, 15, 'JOINED', '2024-05-27 08:00:00.000000'),
       (402, 30, 17, 'JOINED', '2024-05-27 08:00:00.000000'),
       (403, 30, 19, 'JOINED', '2024-05-27 08:00:00.000000'),
       (404, 30, 21, 'JOINED', '2024-05-27 08:00:00.000000'),
       (405, 30, 45, 'JOINED', '2024-05-27 08:00:00.000000'),
       (406, 30, 47, 'JOINED', '2024-05-27 08:00:00.000000'),
       (407, 30, 49, 'JOINED', '2024-05-27 08:00:00.000000'),
       (408, 30, 51, 'JOINED', '2024-05-27 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 401, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-01 08:00:00.000000', '2024-06-01 08:00:00.000000', '2024-06-01 08:00:00.000000'),
       (DEFAULT, 402, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-01 08:00:00.000000', '2024-06-01 08:00:00.000000', '2024-06-01 08:00:00.000000'),
       (DEFAULT, 403, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-01 08:00:00.000000', '2024-06-01 08:00:00.000000', '2024-06-01 08:00:00.000000'),
       (DEFAULT, 404, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-01 08:00:00.000000', '2024-06-01 08:00:00.000000', '2024-06-01 08:00:00.000000'),
       (DEFAULT, 405, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-01 08:00:00.000000', '2024-06-01 08:00:00.000000', '2024-06-01 08:00:00.000000'),
       (DEFAULT, 406, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-01 08:00:00.000000', '2024-06-01 08:00:00.000000', '2024-06-01 08:00:00.000000'),
       (DEFAULT, 407, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-01 08:00:00.000000', '2024-06-01 08:00:00.000000', '2024-06-01 08:00:00.000000'),
       (DEFAULT, 408, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-01 08:00:00.000000', '2024-06-01 08:00:00.000000', '2024-06-01 08:00:00.000000');

-- 2024-06-01
-- 2024-06-05
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (31, 1, 121, NULL, 'Add create task button', 'Add create task button', NULL, 'LIGHT', 'FRONTEND', 'NORMAL', FALSE, '2024-06-01', '2024-06-05', '2024-06-05', '2024-06-01 08:00:00.000000', '2024-06-01 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (409, 31, 23, 'JOINED', '2024-06-01 08:00:00.000000'),
       (410, 31, 25, 'JOINED', '2024-06-01 08:00:00.000000'),
       (411, 31, 27, 'JOINED', '2024-06-01 08:00:00.000000'),
       (412, 31, 29, 'JOINED', '2024-06-01 08:00:00.000000'),
       (413, 31, 53, 'JOINED', '2024-06-01 08:00:00.000000'),
       (414, 31, 55, 'JOINED', '2024-06-01 08:00:00.000000'),
       (415, 31, 57, 'JOINED', '2024-06-01 08:00:00.000000'),
       (416, 31, 59, 'JOINED', '2024-06-01 08:00:00.000000'),
       (417, 31, 113, 'JOINED', '2024-06-01 08:00:00.000000'),
       (418, 31, 115, 'JOINED', '2024-06-01 08:00:00.000000'),
       (419, 31, 117, 'JOINED', '2024-06-01 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 409, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-03 12:48:00.000000', '2024-06-03 12:48:00.000000', '2024-06-05 08:00:00.000000'),
       (DEFAULT, 410, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-03 12:48:00.000000', '2024-06-03 12:48:00.000000', '2024-06-05 08:00:00.000000'),
       (DEFAULT, 411, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-03 12:48:00.000000', '2024-06-03 12:48:00.000000', '2024-06-05 08:00:00.000000'),
       (DEFAULT, 412, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-04 17:36:00.000000', '2024-06-04 17:36:00.000000', '2024-06-05 08:00:00.000000'),
       (DEFAULT, 413, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-03 12:48:00.000000', '2024-06-03 12:48:00.000000', '2024-06-05 08:00:00.000000'),
       (DEFAULT, 414, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-03 12:48:00.000000', '2024-06-03 12:48:00.000000', '2024-06-05 08:00:00.000000'),
       (DEFAULT, 415, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-03 12:48:00.000000', '2024-06-03 12:48:00.000000', '2024-06-05 08:00:00.000000'),
       (DEFAULT, 416, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-04 17:36:00.000000', '2024-06-04 17:36:00.000000', '2024-06-05 08:00:00.000000'),
       (DEFAULT, 417, 'Employee 113 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-05 08:00:00.000000', '2024-06-05 08:00:00.000000', '2024-06-05 08:00:00.000000'),
       (DEFAULT, 418, 'Employee 115 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-05 08:00:00.000000', '2024-06-05 08:00:00.000000', '2024-06-05 08:00:00.000000'),
       (DEFAULT, 419, 'Employee 117 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-05 08:00:00.000000', '2024-06-05 08:00:00.000000', '2024-06-05 08:00:00.000000');

-- 2024-06-05
-- 2024-06-09
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (32, 1, 121, NULL, 'Add delete task button', 'Add delete task button', NULL, 'LIGHT', 'FRONTEND', 'LOW', FALSE, '2024-06-05', '2024-06-09', '2024-06-09', '2024-06-05 08:00:00.000000', '2024-06-05 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (420, 32, 23, 'JOINED', '2024-06-05 08:00:00.000000'),
       (421, 32, 25, 'JOINED', '2024-06-05 08:00:00.000000'),
       (422, 32, 27, 'JOINED', '2024-06-05 08:00:00.000000'),
       (423, 32, 53, 'JOINED', '2024-06-05 08:00:00.000000'),
       (424, 32, 55, 'JOINED', '2024-06-05 08:00:00.000000'),
       (425, 32, 57, 'JOINED', '2024-06-05 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 420, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-09 08:00:00.000000', '2024-06-09 08:00:00.000000', '2024-06-09 08:00:00.000000'),
       (DEFAULT, 421, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-09 08:00:00.000000', '2024-06-09 08:00:00.000000', '2024-06-09 08:00:00.000000'),
       (DEFAULT, 422, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-09 08:00:00.000000', '2024-06-09 08:00:00.000000', '2024-06-09 08:00:00.000000'),
       (DEFAULT, 423, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-09 08:00:00.000000', '2024-06-09 08:00:00.000000', '2024-06-09 08:00:00.000000'),
       (DEFAULT, 424, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-09 08:00:00.000000', '2024-06-09 08:00:00.000000', '2024-06-09 08:00:00.000000'),
       (DEFAULT, 425, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-09 08:00:00.000000', '2024-06-09 08:00:00.000000', '2024-06-09 08:00:00.000000');

-- 2024-06-09
-- 2024-06-12
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (33, 1, 121, NULL, 'Implement jwt filter', 'Implement jwt filter', NULL, 'HARD', 'BACKEND', 'NORMAL', FALSE, '2024-06-09', '2024-06-12', '2024-06-12', '2024-06-09 08:00:00.000000', '2024-06-09 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (426, 33, 2, 'JOINED', '2024-06-09 08:00:00.000000'),
       (427, 33, 4, 'JOINED', '2024-06-09 08:00:00.000000'),
       (428, 33, 6, 'JOINED', '2024-06-09 08:00:00.000000'),
       (429, 33, 30, 'JOINED', '2024-06-09 08:00:00.000000'),
       (430, 33, 32, 'JOINED', '2024-06-09 08:00:00.000000'),
       (431, 33, 34, 'JOINED', '2024-06-09 08:00:00.000000'),
       (432, 33, 36, 'JOINED', '2024-06-09 08:00:00.000000'),
       (433, 33, 60, 'JOINED', '2024-06-09 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 426, 'Employee 2 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-11 03:12:00.000000', '2024-06-11 03:12:00.000000', '2024-06-12 08:00:00.000000'),
       (DEFAULT, 427, 'Employee 4 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-11 03:12:00.000000', '2024-06-11 03:12:00.000000', '2024-06-12 08:00:00.000000'),
       (DEFAULT, 428, 'Employee 6 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-11 03:12:00.000000', '2024-06-11 03:12:00.000000', '2024-06-12 08:00:00.000000'),
       (DEFAULT, 429, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-12 04:24:00.000000', '2024-06-12 04:24:00.000000', '2024-06-12 08:00:00.000000'),
       (DEFAULT, 430, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-11 03:12:00.000000', '2024-06-11 03:12:00.000000', '2024-06-12 08:00:00.000000'),
       (DEFAULT, 431, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-11 03:12:00.000000', '2024-06-11 03:12:00.000000', '2024-06-12 08:00:00.000000'),
       (DEFAULT, 432, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-11 03:12:00.000000', '2024-06-11 03:12:00.000000', '2024-06-12 08:00:00.000000'),
       (DEFAULT, 433, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-12 04:24:00.000000', '2024-06-12 04:24:00.000000', '2024-06-12 08:00:00.000000');

-- 2024-06-12
-- 2024-06-19
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (34, 1, 121, NULL, 'Add login endpoint', 'Add login endpoint', NULL, 'HARD', 'BACKEND', 'LOW', FALSE, '2024-06-12', '2024-06-19', '2024-06-19', '2024-06-12 08:00:00.000000', '2024-06-12 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (434, 34, 32, 'JOINED', '2024-06-12 08:00:00.000000'),
       (435, 34, 34, 'JOINED', '2024-06-12 08:00:00.000000'),
       (436, 34, 36, 'JOINED', '2024-06-12 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 434, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-19 08:00:00.000000', '2024-06-19 08:00:00.000000', '2024-06-19 08:00:00.000000'),
       (DEFAULT, 435, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-19 08:00:00.000000', '2024-06-19 08:00:00.000000', '2024-06-19 08:00:00.000000'),
       (DEFAULT, 436, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-19 08:00:00.000000', '2024-06-19 08:00:00.000000', '2024-06-19 08:00:00.000000');

-- 2024-06-19
-- 2024-06-25
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (35, 1, 121, NULL, 'Add register endpoint', 'Add register endpoint', NULL, 'ADVANCED', 'BACKEND', 'NORMAL', FALSE, '2024-06-19', '2024-06-25', '2024-06-25', '2024-06-19 08:00:00.000000', '2024-06-19 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (437, 35, 8, 'JOINED', '2024-06-19 08:00:00.000000'),
       (438, 35, 10, 'JOINED', '2024-06-19 08:00:00.000000'),
       (439, 35, 12, 'JOINED', '2024-06-19 08:00:00.000000'),
       (440, 35, 14, 'JOINED', '2024-06-19 08:00:00.000000'),
       (441, 35, 30, 'JOINED', '2024-06-19 08:00:00.000000'),
       (442, 35, 38, 'JOINED', '2024-06-19 08:00:00.000000'),
       (443, 35, 40, 'JOINED', '2024-06-19 08:00:00.000000'),
       (444, 35, 42, 'JOINED', '2024-06-19 08:00:00.000000'),
       (445, 35, 44, 'JOINED', '2024-06-19 08:00:00.000000'),
       (446, 35, 60, 'JOINED', '2024-06-19 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 437, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-22 22:24:00.000000', '2024-06-22 22:24:00.000000', '2024-06-25 08:00:00.000000'),
       (DEFAULT, 438, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-22 22:24:00.000000', '2024-06-22 22:24:00.000000', '2024-06-25 08:00:00.000000'),
       (DEFAULT, 439, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-22 22:24:00.000000', '2024-06-22 22:24:00.000000', '2024-06-25 08:00:00.000000'),
       (DEFAULT, 440, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-22 22:24:00.000000', '2024-06-22 22:24:00.000000', '2024-06-25 08:00:00.000000'),
       (DEFAULT, 441, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-24 17:36:00.000000', '2024-06-24 17:36:00.000000', '2024-06-25 08:00:00.000000'),
       (DEFAULT, 442, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-22 22:24:00.000000', '2024-06-22 22:24:00.000000', '2024-06-25 08:00:00.000000'),
       (DEFAULT, 443, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-22 22:24:00.000000', '2024-06-22 22:24:00.000000', '2024-06-25 08:00:00.000000'),
       (DEFAULT, 444, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-22 22:24:00.000000', '2024-06-22 22:24:00.000000', '2024-06-25 08:00:00.000000'),
       (DEFAULT, 445, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-22 22:24:00.000000', '2024-06-22 22:24:00.000000', '2024-06-25 08:00:00.000000'),
       (DEFAULT, 446, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-24 17:36:00.000000', '2024-06-24 17:36:00.000000', '2024-06-25 08:00:00.000000');

-- 2024-06-25
-- 2024-07-01
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (36, 1, 121, NULL, 'Add refresh token endpoint', 'Add refresh token endpoint', NULL, 'ADVANCED', 'BACKEND', 'LOW', FALSE, '2024-06-25', '2024-07-01', '2024-07-01', '2024-06-25 08:00:00.000000', '2024-06-25 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (447, 36, 38, 'JOINED', '2024-06-25 08:00:00.000000'),
       (448, 36, 40, 'JOINED', '2024-06-25 08:00:00.000000'),
       (449, 36, 42, 'JOINED', '2024-06-25 08:00:00.000000'),
       (450, 36, 44, 'JOINED', '2024-06-25 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 447, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-01 08:00:00.000000', '2024-07-01 08:00:00.000000', '2024-07-01 08:00:00.000000'),
       (DEFAULT, 448, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-01 08:00:00.000000', '2024-07-01 08:00:00.000000', '2024-07-01 08:00:00.000000'),
       (DEFAULT, 449, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-01 08:00:00.000000', '2024-07-01 08:00:00.000000', '2024-07-01 08:00:00.000000'),
       (DEFAULT, 450, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-01 08:00:00.000000', '2024-07-01 08:00:00.000000', '2024-07-01 08:00:00.000000');

-- 2024-07-01
-- 2024-07-06
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (37, 1, 121, NULL, 'Add create task endpoint', 'Add create task endpoint', NULL, 'NORMAL', 'BACKEND', 'NORMAL', FALSE, '2024-07-01', '2024-07-06', '2024-07-06', '2024-07-01 08:00:00.000000', '2024-07-01 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (451, 37, 16, 'JOINED', '2024-07-01 08:00:00.000000'),
       (452, 37, 18, 'JOINED', '2024-07-01 08:00:00.000000'),
       (453, 37, 20, 'JOINED', '2024-07-01 08:00:00.000000'),
       (454, 37, 46, 'JOINED', '2024-07-01 08:00:00.000000'),
       (455, 37, 48, 'JOINED', '2024-07-01 08:00:00.000000'),
       (456, 37, 50, 'JOINED', '2024-07-01 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 451, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-04 08:00:00.000000', '2024-07-04 08:00:00.000000', '2024-07-06 08:00:00.000000'),
       (DEFAULT, 452, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-04 08:00:00.000000', '2024-07-04 08:00:00.000000', '2024-07-06 08:00:00.000000'),
       (DEFAULT, 453, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-04 08:00:00.000000', '2024-07-04 08:00:00.000000', '2024-07-06 08:00:00.000000'),
       (DEFAULT, 454, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-04 08:00:00.000000', '2024-07-04 08:00:00.000000', '2024-07-06 08:00:00.000000'),
       (DEFAULT, 455, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-04 08:00:00.000000', '2024-07-04 08:00:00.000000', '2024-07-06 08:00:00.000000'),
       (DEFAULT, 456, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-04 08:00:00.000000', '2024-07-04 08:00:00.000000', '2024-07-06 08:00:00.000000');

-- 2024-07-06
-- 2024-07-11
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (38, 1, 121, NULL, 'Add update task endpoint', 'Add update task endpoint', NULL, 'NORMAL', 'BACKEND', 'LOW', FALSE, '2024-07-06', '2024-07-11', '2024-07-11', '2024-07-06 08:00:00.000000', '2024-07-06 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (457, 38, 46, 'JOINED', '2024-07-06 08:00:00.000000'),
       (458, 38, 48, 'JOINED', '2024-07-06 08:00:00.000000'),
       (459, 38, 50, 'JOINED', '2024-07-06 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 457, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-11 08:00:00.000000', '2024-07-11 08:00:00.000000', '2024-07-11 08:00:00.000000'),
       (DEFAULT, 458, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-11 08:00:00.000000', '2024-07-11 08:00:00.000000', '2024-07-11 08:00:00.000000'),
       (DEFAULT, 459, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-11 08:00:00.000000', '2024-07-11 08:00:00.000000', '2024-07-11 08:00:00.000000');

-- 2024-07-11
-- 2024-07-15
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (39, 1, 121, NULL, 'Add delete task endpoint', 'Add delete task endpoint', NULL, 'LIGHT', 'BACKEND', 'NORMAL', FALSE, '2024-07-11', '2024-07-15', '2024-07-15', '2024-07-11 08:00:00.000000', '2024-07-11 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (460, 39, 22, 'JOINED', '2024-07-11 08:00:00.000000'),
       (461, 39, 24, 'JOINED', '2024-07-11 08:00:00.000000'),
       (462, 39, 26, 'JOINED', '2024-07-11 08:00:00.000000'),
       (463, 39, 28, 'JOINED', '2024-07-11 08:00:00.000000'),
       (464, 39, 52, 'JOINED', '2024-07-11 08:00:00.000000'),
       (465, 39, 54, 'JOINED', '2024-07-11 08:00:00.000000'),
       (466, 39, 56, 'JOINED', '2024-07-11 08:00:00.000000'),
       (467, 39, 58, 'JOINED', '2024-07-11 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 460, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-13 17:36:00.000000', '2024-07-13 17:36:00.000000', '2024-07-15 08:00:00.000000'),
       (DEFAULT, 461, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-13 17:36:00.000000', '2024-07-13 17:36:00.000000', '2024-07-15 08:00:00.000000'),
       (DEFAULT, 462, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-13 17:36:00.000000', '2024-07-13 17:36:00.000000', '2024-07-15 08:00:00.000000'),
       (DEFAULT, 463, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-13 17:36:00.000000', '2024-07-13 17:36:00.000000', '2024-07-15 08:00:00.000000'),
       (DEFAULT, 464, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-13 17:36:00.000000', '2024-07-13 17:36:00.000000', '2024-07-15 08:00:00.000000'),
       (DEFAULT, 465, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-13 17:36:00.000000', '2024-07-13 17:36:00.000000', '2024-07-15 08:00:00.000000'),
       (DEFAULT, 466, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-13 17:36:00.000000', '2024-07-13 17:36:00.000000', '2024-07-15 08:00:00.000000'),
       (DEFAULT, 467, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-13 17:36:00.000000', '2024-07-13 17:36:00.000000', '2024-07-15 08:00:00.000000');

-- 2024-07-15
-- 2024-07-19
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (40, 1, 121, NULL, 'Add get task list endpoint', 'Add get task list endpoint', NULL, 'LIGHT', 'BACKEND', 'LOW', FALSE, '2024-07-15', '2024-07-19', '2024-07-19', '2024-07-15 08:00:00.000000', '2024-07-15 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (468, 40, 52, 'JOINED', '2024-07-15 08:00:00.000000'),
       (469, 40, 54, 'JOINED', '2024-07-15 08:00:00.000000'),
       (470, 40, 56, 'JOINED', '2024-07-15 08:00:00.000000'),
       (471, 40, 58, 'JOINED', '2024-07-15 08:00:00.000000'),
       (472, 40, 60, 'JOINED', '2024-07-15 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 468, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-19 08:00:00.000000', '2024-07-19 08:00:00.000000', '2024-07-19 08:00:00.000000'),
       (DEFAULT, 469, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-19 08:00:00.000000', '2024-07-19 08:00:00.000000', '2024-07-19 08:00:00.000000'),
       (DEFAULT, 470, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-19 08:00:00.000000', '2024-07-19 08:00:00.000000', '2024-07-19 08:00:00.000000'),
       (DEFAULT, 471, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-19 08:00:00.000000', '2024-07-19 08:00:00.000000', '2024-07-19 08:00:00.000000'),
       (DEFAULT, 472, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-19 08:00:00.000000', '2024-07-19 08:00:00.000000', '2024-07-19 08:00:00.000000');

-- 2024-07-19
-- 2024-07-22
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (41, 1, 121, NULL, 'Add edit task button', 'Add edit task button', NULL, 'HARD', 'FRONTEND', 'NORMAL', FALSE, '2024-07-19', '2024-07-22', '2024-07-22', '2024-07-19 08:00:00.000000', '2024-07-19 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (473, 41, 1, 'JOINED', '2024-07-19 08:00:00.000000'),
       (474, 41, 3, 'JOINED', '2024-07-19 08:00:00.000000'),
       (475, 41, 5, 'JOINED', '2024-07-19 08:00:00.000000'),
       (476, 41, 7, 'JOINED', '2024-07-19 08:00:00.000000'),
       (477, 41, 31, 'JOINED', '2024-07-19 08:00:00.000000'),
       (478, 41, 33, 'JOINED', '2024-07-19 08:00:00.000000'),
       (479, 41, 35, 'JOINED', '2024-07-19 08:00:00.000000'),
       (480, 41, 37, 'JOINED', '2024-07-19 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 473, 'Employee 1 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-21 03:12:00.000000', '2024-07-21 03:12:00.000000', '2024-07-22 08:00:00.000000'),
       (DEFAULT, 474, 'Employee 3 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-21 03:12:00.000000', '2024-07-21 03:12:00.000000', '2024-07-22 08:00:00.000000'),
       (DEFAULT, 475, 'Employee 5 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-21 03:12:00.000000', '2024-07-21 03:12:00.000000', '2024-07-22 08:00:00.000000'),
       (DEFAULT, 476, 'Employee 7 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-21 03:12:00.000000', '2024-07-21 03:12:00.000000', '2024-07-22 08:00:00.000000'),
       (DEFAULT, 477, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-21 03:12:00.000000', '2024-07-21 03:12:00.000000', '2024-07-22 08:00:00.000000'),
       (DEFAULT, 478, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-21 03:12:00.000000', '2024-07-21 03:12:00.000000', '2024-07-22 08:00:00.000000'),
       (DEFAULT, 479, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-21 03:12:00.000000', '2024-07-21 03:12:00.000000', '2024-07-22 08:00:00.000000'),
       (DEFAULT, 480, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-21 03:12:00.000000', '2024-07-21 03:12:00.000000', '2024-07-22 08:00:00.000000');

-- 2024-07-22
-- 2024-07-29
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (42, 1, 121, NULL, 'Add complete task button', 'Add complete task button', NULL, 'HARD', 'FRONTEND', 'LOW', FALSE, '2024-07-22', '2024-07-29', '2024-07-29', '2024-07-22 08:00:00.000000', '2024-07-22 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (481, 42, 31, 'JOINED', '2024-07-22 08:00:00.000000'),
       (482, 42, 33, 'JOINED', '2024-07-22 08:00:00.000000'),
       (483, 42, 35, 'JOINED', '2024-07-22 08:00:00.000000'),
       (484, 42, 37, 'JOINED', '2024-07-22 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 481, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-29 08:00:00.000000', '2024-07-29 08:00:00.000000', '2024-07-29 08:00:00.000000'),
       (DEFAULT, 482, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-29 08:00:00.000000', '2024-07-29 08:00:00.000000', '2024-07-29 08:00:00.000000'),
       (DEFAULT, 483, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-29 08:00:00.000000', '2024-07-29 08:00:00.000000', '2024-07-29 08:00:00.000000'),
       (DEFAULT, 484, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-29 08:00:00.000000', '2024-07-29 08:00:00.000000', '2024-07-29 08:00:00.000000');

-- 2024-07-29
-- 2024-08-04
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (43, 1, 121, NULL, 'Add restore task button', 'Add restore task button', NULL, 'ADVANCED', 'FRONTEND', 'NORMAL', FALSE, '2024-07-29', '2024-08-04', '2024-08-04', '2024-07-29 08:00:00.000000', '2024-07-29 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (485, 43, 9, 'JOINED', '2024-07-29 08:00:00.000000'),
       (486, 43, 11, 'JOINED', '2024-07-29 08:00:00.000000'),
       (487, 43, 13, 'JOINED', '2024-07-29 08:00:00.000000'),
       (488, 43, 39, 'JOINED', '2024-07-29 08:00:00.000000'),
       (489, 43, 41, 'JOINED', '2024-07-29 08:00:00.000000'),
       (490, 43, 43, 'JOINED', '2024-07-29 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 485, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-01 22:24:00.000000', '2024-08-01 22:24:00.000000', '2024-08-04 08:00:00.000000'),
       (DEFAULT, 486, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-01 22:24:00.000000', '2024-08-01 22:24:00.000000', '2024-08-04 08:00:00.000000'),
       (DEFAULT, 487, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-01 22:24:00.000000', '2024-08-01 22:24:00.000000', '2024-08-04 08:00:00.000000'),
       (DEFAULT, 488, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-01 22:24:00.000000', '2024-08-01 22:24:00.000000', '2024-08-04 08:00:00.000000'),
       (DEFAULT, 489, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-01 22:24:00.000000', '2024-08-01 22:24:00.000000', '2024-08-04 08:00:00.000000'),
       (DEFAULT, 490, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-01 22:24:00.000000', '2024-08-01 22:24:00.000000', '2024-08-04 08:00:00.000000');

-- 2024-08-04
-- 2024-08-10
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (44, 1, 121, NULL, 'Build deleted task page', 'Build deleted task page', NULL, 'ADVANCED', 'FRONTEND', 'LOW', FALSE, '2024-08-04', '2024-08-10', '2024-08-10', '2024-08-04 08:00:00.000000', '2024-08-04 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (491, 44, 39, 'JOINED', '2024-08-04 08:00:00.000000'),
       (492, 44, 41, 'JOINED', '2024-08-04 08:00:00.000000'),
       (493, 44, 43, 'JOINED', '2024-08-04 08:00:00.000000'),
       (494, 44, 59, 'JOINED', '2024-08-04 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 491, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-10 08:00:00.000000', '2024-08-10 08:00:00.000000', '2024-08-10 08:00:00.000000'),
       (DEFAULT, 492, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-10 08:00:00.000000', '2024-08-10 08:00:00.000000', '2024-08-10 08:00:00.000000'),
       (DEFAULT, 493, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-10 08:00:00.000000', '2024-08-10 08:00:00.000000', '2024-08-10 08:00:00.000000'),
       (DEFAULT, 494, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-10 08:00:00.000000', '2024-08-10 08:00:00.000000', '2024-08-10 08:00:00.000000');

-- 2024-08-10
-- 2024-08-15
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (45, 1, 121, NULL, 'Build task by status page', 'Build task by status page', NULL, 'NORMAL', 'FRONTEND', 'NORMAL', FALSE, '2024-08-10', '2024-08-15', '2024-08-15', '2024-08-10 08:00:00.000000', '2024-08-10 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (495, 45, 15, 'JOINED', '2024-08-10 08:00:00.000000'),
       (496, 45, 17, 'JOINED', '2024-08-10 08:00:00.000000'),
       (497, 45, 19, 'JOINED', '2024-08-10 08:00:00.000000'),
       (498, 45, 21, 'JOINED', '2024-08-10 08:00:00.000000'),
       (499, 45, 29, 'JOINED', '2024-08-10 08:00:00.000000'),
       (500, 45, 45, 'JOINED', '2024-08-10 08:00:00.000000'),
       (501, 45, 47, 'JOINED', '2024-08-10 08:00:00.000000'),
       (502, 45, 49, 'JOINED', '2024-08-10 08:00:00.000000'),
       (503, 45, 51, 'JOINED', '2024-08-10 08:00:00.000000'),
       (504, 45, 59, 'JOINED', '2024-08-10 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 495, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-13 08:00:00.000000', '2024-08-13 08:00:00.000000', '2024-08-15 08:00:00.000000'),
       (DEFAULT, 496, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-13 08:00:00.000000', '2024-08-13 08:00:00.000000', '2024-08-15 08:00:00.000000'),
       (DEFAULT, 497, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-13 08:00:00.000000', '2024-08-13 08:00:00.000000', '2024-08-15 08:00:00.000000'),
       (DEFAULT, 498, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-13 08:00:00.000000', '2024-08-13 08:00:00.000000', '2024-08-15 08:00:00.000000'),
       (DEFAULT, 499, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-15 02:00:00.000000', '2024-08-15 02:00:00.000000', '2024-08-15 08:00:00.000000'),
       (DEFAULT, 500, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-13 08:00:00.000000', '2024-08-13 08:00:00.000000', '2024-08-15 08:00:00.000000'),
       (DEFAULT, 501, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-13 08:00:00.000000', '2024-08-13 08:00:00.000000', '2024-08-15 08:00:00.000000'),
       (DEFAULT, 502, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-13 08:00:00.000000', '2024-08-13 08:00:00.000000', '2024-08-15 08:00:00.000000'),
       (DEFAULT, 503, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-13 08:00:00.000000', '2024-08-13 08:00:00.000000', '2024-08-15 08:00:00.000000'),
       (DEFAULT, 504, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-15 02:00:00.000000', '2024-08-15 02:00:00.000000', '2024-08-15 08:00:00.000000');

-- 2024-08-15
-- 2024-08-20
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (46, 1, 121, NULL, 'Build task by priority page', 'Build task by priority page', NULL, 'NORMAL', 'FRONTEND', 'LOW', FALSE, '2024-08-15', '2024-08-20', '2024-08-20', '2024-08-15 08:00:00.000000', '2024-08-15 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (505, 46, 45, 'JOINED', '2024-08-15 08:00:00.000000'),
       (506, 46, 47, 'JOINED', '2024-08-15 08:00:00.000000'),
       (507, 46, 49, 'JOINED', '2024-08-15 08:00:00.000000'),
       (508, 46, 51, 'JOINED', '2024-08-15 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 505, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-20 08:00:00.000000', '2024-08-20 08:00:00.000000', '2024-08-20 08:00:00.000000'),
       (DEFAULT, 506, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-20 08:00:00.000000', '2024-08-20 08:00:00.000000', '2024-08-20 08:00:00.000000'),
       (DEFAULT, 507, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-20 08:00:00.000000', '2024-08-20 08:00:00.000000', '2024-08-20 08:00:00.000000'),
       (DEFAULT, 508, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-20 08:00:00.000000', '2024-08-20 08:00:00.000000', '2024-08-20 08:00:00.000000');

-- 2024-08-20
-- 2024-08-24
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (47, 1, 121, NULL, 'Add status filter', 'Add status filter', NULL, 'LIGHT', 'FRONTEND', 'NORMAL', FALSE, '2024-08-20', '2024-08-24', '2024-08-24', '2024-08-20 08:00:00.000000', '2024-08-20 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (509, 47, 23, 'JOINED', '2024-08-20 08:00:00.000000'),
       (510, 47, 25, 'JOINED', '2024-08-20 08:00:00.000000'),
       (511, 47, 27, 'JOINED', '2024-08-20 08:00:00.000000'),
       (512, 47, 29, 'JOINED', '2024-08-20 08:00:00.000000'),
       (513, 47, 53, 'JOINED', '2024-08-20 08:00:00.000000'),
       (514, 47, 55, 'JOINED', '2024-08-20 08:00:00.000000'),
       (515, 47, 57, 'JOINED', '2024-08-20 08:00:00.000000'),
       (516, 47, 59, 'JOINED', '2024-08-20 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 509, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-22 17:36:00.000000', '2024-08-22 17:36:00.000000', '2024-08-24 08:00:00.000000'),
       (DEFAULT, 510, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-22 17:36:00.000000', '2024-08-22 17:36:00.000000', '2024-08-24 08:00:00.000000'),
       (DEFAULT, 511, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-22 17:36:00.000000', '2024-08-22 17:36:00.000000', '2024-08-24 08:00:00.000000'),
       (DEFAULT, 512, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-23 22:24:00.000000', '2024-08-23 22:24:00.000000', '2024-08-24 08:00:00.000000'),
       (DEFAULT, 513, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-22 17:36:00.000000', '2024-08-22 17:36:00.000000', '2024-08-24 08:00:00.000000'),
       (DEFAULT, 514, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-22 17:36:00.000000', '2024-08-22 17:36:00.000000', '2024-08-24 08:00:00.000000'),
       (DEFAULT, 515, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-22 17:36:00.000000', '2024-08-22 17:36:00.000000', '2024-08-24 08:00:00.000000'),
       (DEFAULT, 516, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-23 22:24:00.000000', '2024-08-23 22:24:00.000000', '2024-08-24 08:00:00.000000');

-- 2024-08-24
-- 2024-08-28
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (48, 1, 121, NULL, 'Add priority filter', 'Add priority filter', NULL, 'LIGHT', 'FRONTEND', 'LOW', FALSE, '2024-08-24', '2024-08-28', '2024-08-28', '2024-08-24 08:00:00.000000', '2024-08-24 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (517, 48, 53, 'JOINED', '2024-08-24 08:00:00.000000'),
       (518, 48, 55, 'JOINED', '2024-08-24 08:00:00.000000'),
       (519, 48, 57, 'JOINED', '2024-08-24 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 517, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-28 08:00:00.000000', '2024-08-28 08:00:00.000000', '2024-08-28 08:00:00.000000'),
       (DEFAULT, 518, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-28 08:00:00.000000', '2024-08-28 08:00:00.000000', '2024-08-28 08:00:00.000000'),
       (DEFAULT, 519, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-28 08:00:00.000000', '2024-08-28 08:00:00.000000', '2024-08-28 08:00:00.000000');

-- 2024-08-28
-- 2024-08-31
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (49, 1, 121, NULL, 'Add get task detail endpoint', 'Add get task detail endpoint', NULL, 'HARD', 'BACKEND', 'NORMAL', FALSE, '2024-08-28', '2024-08-31', '2024-08-31', '2024-08-28 08:00:00.000000', '2024-08-28 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (520, 49, 2, 'JOINED', '2024-08-28 08:00:00.000000'),
       (521, 49, 4, 'JOINED', '2024-08-28 08:00:00.000000'),
       (522, 49, 6, 'JOINED', '2024-08-28 08:00:00.000000'),
       (523, 49, 30, 'JOINED', '2024-08-28 08:00:00.000000'),
       (524, 49, 32, 'JOINED', '2024-08-28 08:00:00.000000'),
       (525, 49, 34, 'JOINED', '2024-08-28 08:00:00.000000'),
       (526, 49, 36, 'JOINED', '2024-08-28 08:00:00.000000'),
       (527, 49, 60, 'JOINED', '2024-08-28 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 520, 'Employee 2 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-30 06:48:00.000000', '2024-08-30 06:48:00.000000', '2024-08-31 08:00:00.000000'),
       (DEFAULT, 521, 'Employee 4 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-30 06:48:00.000000', '2024-08-30 06:48:00.000000', '2024-08-31 08:00:00.000000'),
       (DEFAULT, 522, 'Employee 6 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-30 06:48:00.000000', '2024-08-30 06:48:00.000000', '2024-08-31 08:00:00.000000'),
       (DEFAULT, 523, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-31 08:00:00.000000', '2024-08-31 08:00:00.000000', '2024-08-31 08:00:00.000000'),
       (DEFAULT, 524, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-30 06:48:00.000000', '2024-08-30 06:48:00.000000', '2024-08-31 08:00:00.000000'),
       (DEFAULT, 525, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-30 06:48:00.000000', '2024-08-30 06:48:00.000000', '2024-08-31 08:00:00.000000'),
       (DEFAULT, 526, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-30 06:48:00.000000', '2024-08-30 06:48:00.000000', '2024-08-31 08:00:00.000000'),
       (DEFAULT, 527, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-31 08:00:00.000000', '2024-08-31 08:00:00.000000', '2024-08-31 08:00:00.000000');

-- 2024-08-31
-- 2024-09-07
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (50, 1, 121, NULL, 'Add restore task endpoint', 'Add restore task endpoint', NULL, 'HARD', 'BACKEND', 'LOW', FALSE, '2024-08-31', '2024-09-07', '2024-09-07', '2024-08-31 08:00:00.000000', '2024-08-31 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (528, 50, 32, 'JOINED', '2024-08-31 08:00:00.000000'),
       (529, 50, 34, 'JOINED', '2024-08-31 08:00:00.000000'),
       (530, 50, 36, 'JOINED', '2024-08-31 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 528, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-07 08:00:00.000000', '2024-09-07 08:00:00.000000', '2024-09-07 08:00:00.000000'),
       (DEFAULT, 529, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-07 08:00:00.000000', '2024-09-07 08:00:00.000000', '2024-09-07 08:00:00.000000'),
       (DEFAULT, 530, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-07 08:00:00.000000', '2024-09-07 08:00:00.000000', '2024-09-07 08:00:00.000000');

-- 2024-09-07
-- 2024-09-13
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (51, 1, 121, NULL, 'Add mark complete endpoint', 'Add mark complete endpoint', NULL, 'ADVANCED', 'BACKEND', 'NORMAL', FALSE, '2024-09-07', '2024-09-13', '2024-09-13', '2024-09-07 08:00:00.000000', '2024-09-07 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (531, 51, 8, 'JOINED', '2024-09-07 08:00:00.000000'),
       (532, 51, 10, 'JOINED', '2024-09-07 08:00:00.000000'),
       (533, 51, 12, 'JOINED', '2024-09-07 08:00:00.000000'),
       (534, 51, 14, 'JOINED', '2024-09-07 08:00:00.000000'),
       (535, 51, 38, 'JOINED', '2024-09-07 08:00:00.000000'),
       (536, 51, 40, 'JOINED', '2024-09-07 08:00:00.000000'),
       (537, 51, 42, 'JOINED', '2024-09-07 08:00:00.000000'),
       (538, 51, 44, 'JOINED', '2024-09-07 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 531, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-11 05:36:00.000000', '2024-09-11 05:36:00.000000', '2024-09-13 08:00:00.000000'),
       (DEFAULT, 532, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-11 05:36:00.000000', '2024-09-11 05:36:00.000000', '2024-09-13 08:00:00.000000'),
       (DEFAULT, 533, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-11 05:36:00.000000', '2024-09-11 05:36:00.000000', '2024-09-13 08:00:00.000000'),
       (DEFAULT, 534, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-11 05:36:00.000000', '2024-09-11 05:36:00.000000', '2024-09-13 08:00:00.000000'),
       (DEFAULT, 535, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-11 05:36:00.000000', '2024-09-11 05:36:00.000000', '2024-09-13 08:00:00.000000'),
       (DEFAULT, 536, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-11 05:36:00.000000', '2024-09-11 05:36:00.000000', '2024-09-13 08:00:00.000000'),
       (DEFAULT, 537, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-11 05:36:00.000000', '2024-09-11 05:36:00.000000', '2024-09-13 08:00:00.000000'),
       (DEFAULT, 538, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-11 05:36:00.000000', '2024-09-11 05:36:00.000000', '2024-09-13 08:00:00.000000');

-- 2024-09-13
-- 2024-09-19
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (52, 1, 121, NULL, 'Add filter tasks endpoint', 'Add filter tasks endpoint', NULL, 'ADVANCED', 'BACKEND', 'LOW', FALSE, '2024-09-13', '2024-09-19', '2024-09-19', '2024-09-13 08:00:00.000000', '2024-09-13 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (539, 52, 38, 'JOINED', '2024-09-13 08:00:00.000000'),
       (540, 52, 40, 'JOINED', '2024-09-13 08:00:00.000000'),
       (541, 52, 42, 'JOINED', '2024-09-13 08:00:00.000000'),
       (542, 52, 44, 'JOINED', '2024-09-13 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 539, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-19 08:00:00.000000', '2024-09-19 08:00:00.000000', '2024-09-19 08:00:00.000000'),
       (DEFAULT, 540, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-19 08:00:00.000000', '2024-09-19 08:00:00.000000', '2024-09-19 08:00:00.000000'),
       (DEFAULT, 541, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-19 08:00:00.000000', '2024-09-19 08:00:00.000000', '2024-09-19 08:00:00.000000'),
       (DEFAULT, 542, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-19 08:00:00.000000', '2024-09-19 08:00:00.000000', '2024-09-19 08:00:00.000000');

-- 2024-09-19
-- 2024-09-24
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (53, 1, 121, NULL, 'Add search tasks endpoint', 'Add search tasks endpoint', NULL, 'NORMAL', 'BACKEND', 'NORMAL', FALSE, '2024-09-19', '2024-09-24', '2024-09-24', '2024-09-19 08:00:00.000000', '2024-09-19 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (543, 53, 16, 'JOINED', '2024-09-19 08:00:00.000000'),
       (544, 53, 18, 'JOINED', '2024-09-19 08:00:00.000000'),
       (545, 53, 20, 'JOINED', '2024-09-19 08:00:00.000000'),
       (546, 53, 46, 'JOINED', '2024-09-19 08:00:00.000000'),
       (547, 53, 48, 'JOINED', '2024-09-19 08:00:00.000000'),
       (548, 53, 50, 'JOINED', '2024-09-19 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 543, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-22 14:00:00.000000', '2024-09-22 14:00:00.000000', '2024-09-24 08:00:00.000000'),
       (DEFAULT, 544, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-22 14:00:00.000000', '2024-09-22 14:00:00.000000', '2024-09-24 08:00:00.000000'),
       (DEFAULT, 545, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-22 14:00:00.000000', '2024-09-22 14:00:00.000000', '2024-09-24 08:00:00.000000'),
       (DEFAULT, 546, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-22 14:00:00.000000', '2024-09-22 14:00:00.000000', '2024-09-24 08:00:00.000000'),
       (DEFAULT, 547, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-22 14:00:00.000000', '2024-09-22 14:00:00.000000', '2024-09-24 08:00:00.000000'),
       (DEFAULT, 548, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-22 14:00:00.000000', '2024-09-22 14:00:00.000000', '2024-09-24 08:00:00.000000');

-- 2024-09-24
-- 2024-09-29
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (54, 1, 121, NULL, 'Add sort tasks endpoint', 'Add sort tasks endpoint', NULL, 'NORMAL', 'BACKEND', 'LOW', FALSE, '2024-09-24', '2024-09-29', '2024-09-29', '2024-09-24 08:00:00.000000', '2024-09-24 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (549, 54, 46, 'JOINED', '2024-09-24 08:00:00.000000'),
       (550, 54, 48, 'JOINED', '2024-09-24 08:00:00.000000'),
       (551, 54, 50, 'JOINED', '2024-09-24 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 549, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-29 08:00:00.000000', '2024-09-29 08:00:00.000000', '2024-09-29 08:00:00.000000'),
       (DEFAULT, 550, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-29 08:00:00.000000', '2024-09-29 08:00:00.000000', '2024-09-29 08:00:00.000000'),
       (DEFAULT, 551, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-29 08:00:00.000000', '2024-09-29 08:00:00.000000', '2024-09-29 08:00:00.000000');

-- 2024-09-29
-- 2024-10-03
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (55, 1, 121, NULL, 'Implement soft delete logic', 'Implement soft delete logic', NULL, 'LIGHT', 'BACKEND', 'NORMAL', FALSE, '2024-09-29', '2024-10-03', '2024-10-03', '2024-09-29 08:00:00.000000', '2024-09-29 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (552, 55, 22, 'JOINED', '2024-09-29 08:00:00.000000'),
       (553, 55, 24, 'JOINED', '2024-09-29 08:00:00.000000'),
       (554, 55, 26, 'JOINED', '2024-09-29 08:00:00.000000'),
       (555, 55, 28, 'JOINED', '2024-09-29 08:00:00.000000'),
       (556, 55, 52, 'JOINED', '2024-09-29 08:00:00.000000'),
       (557, 55, 54, 'JOINED', '2024-09-29 08:00:00.000000'),
       (558, 55, 56, 'JOINED', '2024-09-29 08:00:00.000000'),
       (559, 55, 58, 'JOINED', '2024-09-29 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 552, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-01 22:23:59.000000', '2024-10-01 22:23:59.000000', '2024-10-03 08:00:00.000000'),
       (DEFAULT, 553, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-01 22:23:59.000000', '2024-10-01 22:23:59.000000', '2024-10-03 08:00:00.000000'),
       (DEFAULT, 554, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-01 22:23:59.000000', '2024-10-01 22:23:59.000000', '2024-10-03 08:00:00.000000'),
       (DEFAULT, 555, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-01 22:23:59.000000', '2024-10-01 22:23:59.000000', '2024-10-03 08:00:00.000000'),
       (DEFAULT, 556, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-01 22:23:59.000000', '2024-10-01 22:23:59.000000', '2024-10-03 08:00:00.000000'),
       (DEFAULT, 557, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-01 22:23:59.000000', '2024-10-01 22:23:59.000000', '2024-10-03 08:00:00.000000'),
       (DEFAULT, 558, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-01 22:23:59.000000', '2024-10-01 22:23:59.000000', '2024-10-03 08:00:00.000000'),
       (DEFAULT, 559, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-01 22:23:59.000000', '2024-10-01 22:23:59.000000', '2024-10-03 08:00:00.000000');

-- 2024-10-03
-- 2024-10-07
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (56, 1, 121, NULL, 'Add pagination support', 'Add pagination support', NULL, 'LIGHT', 'BACKEND', 'LOW', FALSE, '2024-10-03', '2024-10-07', '2024-10-07', '2024-10-03 08:00:00.000000', '2024-10-03 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (560, 56, 52, 'JOINED', '2024-10-03 08:00:00.000000'),
       (561, 56, 54, 'JOINED', '2024-10-03 08:00:00.000000'),
       (562, 56, 56, 'JOINED', '2024-10-03 08:00:00.000000'),
       (563, 56, 58, 'JOINED', '2024-10-03 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 560, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-07 08:00:00.000000', '2024-10-07 08:00:00.000000', '2024-10-07 08:00:00.000000'),
       (DEFAULT, 561, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-07 08:00:00.000000', '2024-10-07 08:00:00.000000', '2024-10-07 08:00:00.000000'),
       (DEFAULT, 562, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-07 08:00:00.000000', '2024-10-07 08:00:00.000000', '2024-10-07 08:00:00.000000'),
       (DEFAULT, 563, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-07 08:00:00.000000', '2024-10-07 08:00:00.000000', '2024-10-07 08:00:00.000000');

-- 2024-10-07
-- 2024-10-10
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (57, 1, 121, NULL, 'Add created time filter', 'Add created time filter', NULL, 'HARD', 'FRONTEND', 'NORMAL', FALSE, '2024-10-07', '2024-10-10', '2024-10-10', '2024-10-07 08:00:00.000000', '2024-10-07 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (564, 57, 1, 'JOINED', '2024-10-07 08:00:00.000000'),
       (565, 57, 3, 'JOINED', '2024-10-07 08:00:00.000000'),
       (566, 57, 5, 'JOINED', '2024-10-07 08:00:00.000000'),
       (567, 57, 7, 'JOINED', '2024-10-07 08:00:00.000000'),
       (568, 57, 31, 'JOINED', '2024-10-07 08:00:00.000000'),
       (569, 57, 33, 'JOINED', '2024-10-07 08:00:00.000000'),
       (570, 57, 35, 'JOINED', '2024-10-07 08:00:00.000000'),
       (571, 57, 37, 'JOINED', '2024-10-07 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 564, 'Employee 1 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-09 06:48:00.000000', '2024-10-09 06:48:00.000000', '2024-10-10 08:00:00.000000'),
       (DEFAULT, 565, 'Employee 3 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-09 06:48:00.000000', '2024-10-09 06:48:00.000000', '2024-10-10 08:00:00.000000'),
       (DEFAULT, 566, 'Employee 5 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-09 06:48:00.000000', '2024-10-09 06:48:00.000000', '2024-10-10 08:00:00.000000'),
       (DEFAULT, 567, 'Employee 7 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-09 06:48:00.000000', '2024-10-09 06:48:00.000000', '2024-10-10 08:00:00.000000'),
       (DEFAULT, 568, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-09 06:48:00.000000', '2024-10-09 06:48:00.000000', '2024-10-10 08:00:00.000000'),
       (DEFAULT, 569, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-09 06:48:00.000000', '2024-10-09 06:48:00.000000', '2024-10-10 08:00:00.000000'),
       (DEFAULT, 570, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-09 06:48:00.000000', '2024-10-09 06:48:00.000000', '2024-10-10 08:00:00.000000'),
       (DEFAULT, 571, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-09 06:48:00.000000', '2024-10-09 06:48:00.000000', '2024-10-10 08:00:00.000000');

-- 2024-10-10
-- 2024-10-17
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (58, 1, 121, NULL, 'Add task search bar', 'Add task search bar', NULL, 'HARD', 'FRONTEND', 'LOW', FALSE, '2024-10-10', '2024-10-17', '2024-10-17', '2024-10-10 08:00:00.000000', '2024-10-10 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (572, 58, 31, 'JOINED', '2024-10-10 08:00:00.000000'),
       (573, 58, 33, 'JOINED', '2024-10-10 08:00:00.000000'),
       (574, 58, 35, 'JOINED', '2024-10-10 08:00:00.000000'),
       (575, 58, 37, 'JOINED', '2024-10-10 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 572, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-17 08:00:00.000000', '2024-10-17 08:00:00.000000', '2024-10-17 08:00:00.000000'),
       (DEFAULT, 573, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-17 08:00:00.000000', '2024-10-17 08:00:00.000000', '2024-10-17 08:00:00.000000'),
       (DEFAULT, 574, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-17 08:00:00.000000', '2024-10-17 08:00:00.000000', '2024-10-17 08:00:00.000000'),
       (DEFAULT, 575, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-17 08:00:00.000000', '2024-10-17 08:00:00.000000', '2024-10-17 08:00:00.000000');

-- 2024-10-17
-- 2024-10-23
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (59, 1, 121, NULL, 'Sort tasks by deadline', 'Sort tasks by deadline', NULL, 'ADVANCED', 'FRONTEND', 'NORMAL', FALSE, '2024-10-17', '2024-10-23', '2024-10-23', '2024-10-17 08:00:00.000000', '2024-10-17 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (576, 59, 9, 'JOINED', '2024-10-17 08:00:00.000000'),
       (577, 59, 11, 'JOINED', '2024-10-17 08:00:00.000000'),
       (578, 59, 13, 'JOINED', '2024-10-17 08:00:00.000000'),
       (579, 59, 39, 'JOINED', '2024-10-17 08:00:00.000000'),
       (580, 59, 41, 'JOINED', '2024-10-17 08:00:00.000000'),
       (581, 59, 43, 'JOINED', '2024-10-17 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 576, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-21 05:36:00.000000', '2024-10-21 05:36:00.000000', '2024-10-23 08:00:00.000000'),
       (DEFAULT, 577, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-21 05:36:00.000000', '2024-10-21 05:36:00.000000', '2024-10-23 08:00:00.000000'),
       (DEFAULT, 578, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-21 05:36:00.000000', '2024-10-21 05:36:00.000000', '2024-10-23 08:00:00.000000'),
       (DEFAULT, 579, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-21 05:36:00.000000', '2024-10-21 05:36:00.000000', '2024-10-23 08:00:00.000000'),
       (DEFAULT, 580, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-21 05:36:00.000000', '2024-10-21 05:36:00.000000', '2024-10-23 08:00:00.000000'),
       (DEFAULT, 581, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-21 05:36:00.000000', '2024-10-21 05:36:00.000000', '2024-10-23 08:00:00.000000');

-- 2024-10-23
-- 2024-10-29
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (60, 1, 121, NULL, 'Sort tasks by priority', 'Sort tasks by priority', NULL, 'ADVANCED', 'FRONTEND', 'LOW', FALSE, '2024-10-23', '2024-10-29', '2024-10-29', '2024-10-23 08:00:00.000000', '2024-10-23 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (582, 60, 39, 'JOINED', '2024-10-23 08:00:00.000000'),
       (583, 60, 41, 'JOINED', '2024-10-23 08:00:00.000000'),
       (584, 60, 43, 'JOINED', '2024-10-23 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 582, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-29 08:00:00.000000', '2024-10-29 08:00:00.000000', '2024-10-29 08:00:00.000000'),
       (DEFAULT, 583, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-29 08:00:00.000000', '2024-10-29 08:00:00.000000', '2024-10-29 08:00:00.000000'),
       (DEFAULT, 584, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-29 08:00:00.000000', '2024-10-29 08:00:00.000000', '2024-10-29 08:00:00.000000');

-- 2024-10-29
-- 2024-11-03
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (61, 1, 121, NULL, 'Add task status badge', 'Add task status badge', NULL, 'NORMAL', 'FRONTEND', 'NORMAL', FALSE, '2024-10-29', '2024-11-03', '2024-11-03', '2024-10-29 08:00:00.000000', '2024-10-29 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (585, 61, 15, 'JOINED', '2024-10-29 08:00:00.000000'),
       (586, 61, 17, 'JOINED', '2024-10-29 08:00:00.000000'),
       (587, 61, 19, 'JOINED', '2024-10-29 08:00:00.000000'),
       (588, 61, 21, 'JOINED', '2024-10-29 08:00:00.000000'),
       (589, 61, 29, 'JOINED', '2024-10-29 08:00:00.000000'),
       (590, 61, 45, 'JOINED', '2024-10-29 08:00:00.000000'),
       (591, 61, 47, 'JOINED', '2024-10-29 08:00:00.000000'),
       (592, 61, 49, 'JOINED', '2024-10-29 08:00:00.000000'),
       (593, 61, 51, 'JOINED', '2024-10-29 08:00:00.000000'),
       (594, 61, 59, 'JOINED', '2024-10-29 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 585, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-01 14:00:00.000000', '2024-11-01 14:00:00.000000', '2024-11-03 08:00:00.000000'),
       (DEFAULT, 586, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-01 14:00:00.000000', '2024-11-01 14:00:00.000000', '2024-11-03 08:00:00.000000'),
       (DEFAULT, 587, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-01 14:00:00.000000', '2024-11-01 14:00:00.000000', '2024-11-03 08:00:00.000000'),
       (DEFAULT, 588, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-01 14:00:00.000000', '2024-11-01 14:00:00.000000', '2024-11-03 08:00:00.000000'),
       (DEFAULT, 589, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-03 08:00:00.000000', '2024-11-03 08:00:00.000000', '2024-11-03 08:00:00.000000'),
       (DEFAULT, 590, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-01 14:00:00.000000', '2024-11-01 14:00:00.000000', '2024-11-03 08:00:00.000000'),
       (DEFAULT, 591, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-01 14:00:00.000000', '2024-11-01 14:00:00.000000', '2024-11-03 08:00:00.000000'),
       (DEFAULT, 592, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-01 14:00:00.000000', '2024-11-01 14:00:00.000000', '2024-11-03 08:00:00.000000'),
       (DEFAULT, 593, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-01 14:00:00.000000', '2024-11-01 14:00:00.000000', '2024-11-03 08:00:00.000000'),
       (DEFAULT, 594, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-03 08:00:00.000000', '2024-11-03 08:00:00.000000', '2024-11-03 08:00:00.000000');

-- 2024-11-03
-- 2024-11-08
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (62, 1, 121, NULL, 'User list interface', 'User list interface', NULL, 'NORMAL', 'FRONTEND', 'LOW', FALSE, '2024-11-03', '2024-11-08', '2024-11-08', '2024-11-03 08:00:00.000000', '2024-11-03 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (595, 62, 45, 'JOINED', '2024-11-03 08:00:00.000000'),
       (596, 62, 47, 'JOINED', '2024-11-03 08:00:00.000000'),
       (597, 62, 49, 'JOINED', '2024-11-03 08:00:00.000000'),
       (598, 62, 51, 'JOINED', '2024-11-03 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 595, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-08 08:00:00.000000', '2024-11-08 08:00:00.000000', '2024-11-08 08:00:00.000000'),
       (DEFAULT, 596, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-08 08:00:00.000000', '2024-11-08 08:00:00.000000', '2024-11-08 08:00:00.000000'),
       (DEFAULT, 597, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-08 08:00:00.000000', '2024-11-08 08:00:00.000000', '2024-11-08 08:00:00.000000'),
       (DEFAULT, 598, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-08 08:00:00.000000', '2024-11-08 08:00:00.000000', '2024-11-08 08:00:00.000000');

-- 2024-11-08
-- 2024-11-12
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (63, 1, 121, NULL, 'User update interface', 'User update interface', NULL, 'LIGHT', 'FRONTEND', 'NORMAL', FALSE, '2024-11-08', '2024-11-12', '2024-11-12', '2024-11-08 08:00:00.000000', '2024-11-08 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (599, 63, 23, 'JOINED', '2024-11-08 08:00:00.000000'),
       (600, 63, 25, 'JOINED', '2024-11-08 08:00:00.000000'),
       (601, 63, 27, 'JOINED', '2024-11-08 08:00:00.000000'),
       (602, 63, 53, 'JOINED', '2024-11-08 08:00:00.000000'),
       (603, 63, 55, 'JOINED', '2024-11-08 08:00:00.000000'),
       (604, 63, 57, 'JOINED', '2024-11-08 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 599, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-10 22:23:59.000000', '2024-11-10 22:23:59.000000', '2024-11-12 08:00:00.000000'),
       (DEFAULT, 600, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-10 22:23:59.000000', '2024-11-10 22:23:59.000000', '2024-11-12 08:00:00.000000'),
       (DEFAULT, 601, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-10 22:23:59.000000', '2024-11-10 22:23:59.000000', '2024-11-12 08:00:00.000000'),
       (DEFAULT, 602, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-10 22:23:59.000000', '2024-11-10 22:23:59.000000', '2024-11-12 08:00:00.000000'),
       (DEFAULT, 603, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-10 22:23:59.000000', '2024-11-10 22:23:59.000000', '2024-11-12 08:00:00.000000'),
       (DEFAULT, 604, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-10 22:23:59.000000', '2024-11-10 22:23:59.000000', '2024-11-12 08:00:00.000000');

-- 2024-11-12
-- 2024-11-16
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (64, 1, 121, NULL, 'Password change screen', 'Password change screen', NULL, 'LIGHT', 'FRONTEND', 'LOW', FALSE, '2024-11-12', '2024-11-16', '2024-11-16', '2024-11-12 08:00:00.000000', '2024-11-12 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (605, 64, 53, 'JOINED', '2024-11-12 08:00:00.000000'),
       (606, 64, 55, 'JOINED', '2024-11-12 08:00:00.000000'),
       (607, 64, 57, 'JOINED', '2024-11-12 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 605, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-16 08:00:00.000000', '2024-11-16 08:00:00.000000', '2024-11-16 08:00:00.000000'),
       (DEFAULT, 606, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-16 08:00:00.000000', '2024-11-16 08:00:00.000000', '2024-11-16 08:00:00.000000'),
       (DEFAULT, 607, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-16 08:00:00.000000', '2024-11-16 08:00:00.000000', '2024-11-16 08:00:00.000000');

-- 2024-11-16
-- 2024-11-19
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (65, 1, 121, NULL, 'Add role based security', 'Add role based security', NULL, 'HARD', 'BACKEND', 'NORMAL', FALSE, '2024-11-16', '2024-11-19', '2024-11-19', '2024-11-16 08:00:00.000000', '2024-11-16 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (608, 65, 2, 'JOINED', '2024-11-16 08:00:00.000000'),
       (609, 65, 4, 'JOINED', '2024-11-16 08:00:00.000000'),
       (610, 65, 6, 'JOINED', '2024-11-16 08:00:00.000000'),
       (611, 65, 32, 'JOINED', '2024-11-16 08:00:00.000000'),
       (612, 65, 34, 'JOINED', '2024-11-16 08:00:00.000000'),
       (613, 65, 36, 'JOINED', '2024-11-16 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 608, 'Employee 2 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-18 10:24:00.000000', '2024-11-18 10:24:00.000000', '2024-11-19 08:00:00.000000'),
       (DEFAULT, 609, 'Employee 4 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-18 10:24:00.000000', '2024-11-18 10:24:00.000000', '2024-11-19 08:00:00.000000'),
       (DEFAULT, 610, 'Employee 6 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-18 10:24:00.000000', '2024-11-18 10:24:00.000000', '2024-11-19 08:00:00.000000'),
       (DEFAULT, 611, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-18 10:24:00.000000', '2024-11-18 10:24:00.000000', '2024-11-19 08:00:00.000000'),
       (DEFAULT, 612, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-18 10:24:00.000000', '2024-11-18 10:24:00.000000', '2024-11-19 08:00:00.000000'),
       (DEFAULT, 613, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-18 10:24:00.000000', '2024-11-18 10:24:00.000000', '2024-11-19 08:00:00.000000');

-- 2024-11-19
-- 2024-11-26
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (66, 1, 121, NULL, 'Add admin only routes', 'Add admin only routes', NULL, 'HARD', 'BACKEND', 'LOW', FALSE, '2024-11-19', '2024-11-26', '2024-11-26', '2024-11-19 08:00:00.000000', '2024-11-19 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (614, 66, 32, 'JOINED', '2024-11-19 08:00:00.000000'),
       (615, 66, 34, 'JOINED', '2024-11-19 08:00:00.000000'),
       (616, 66, 36, 'JOINED', '2024-11-19 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 614, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-26 08:00:00.000000', '2024-11-26 08:00:00.000000', '2024-11-26 08:00:00.000000'),
       (DEFAULT, 615, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-26 08:00:00.000000', '2024-11-26 08:00:00.000000', '2024-11-26 08:00:00.000000'),
       (DEFAULT, 616, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-26 08:00:00.000000', '2024-11-26 08:00:00.000000', '2024-11-26 08:00:00.000000');

-- 2024-11-26
-- 2024-12-02
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (67, 1, 121, NULL, 'Create dto for user', 'Create dto for user', NULL, 'ADVANCED', 'BACKEND', 'NORMAL', FALSE, '2024-11-26', '2024-12-02', '2024-12-02', '2024-11-26 08:00:00.000000', '2024-11-26 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (617, 67, 8, 'JOINED', '2024-11-26 08:00:00.000000'),
       (618, 67, 10, 'JOINED', '2024-11-26 08:00:00.000000'),
       (619, 67, 12, 'JOINED', '2024-11-26 08:00:00.000000'),
       (620, 67, 14, 'JOINED', '2024-11-26 08:00:00.000000'),
       (621, 67, 38, 'JOINED', '2024-11-26 08:00:00.000000'),
       (622, 67, 40, 'JOINED', '2024-11-26 08:00:00.000000'),
       (623, 67, 42, 'JOINED', '2024-11-26 08:00:00.000000'),
       (624, 67, 44, 'JOINED', '2024-11-26 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 617, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-30 12:48:00.000000', '2024-11-30 12:48:00.000000', '2024-12-02 08:00:00.000000'),
       (DEFAULT, 618, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-30 12:48:00.000000', '2024-11-30 12:48:00.000000', '2024-12-02 08:00:00.000000'),
       (DEFAULT, 619, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-30 12:48:00.000000', '2024-11-30 12:48:00.000000', '2024-12-02 08:00:00.000000'),
       (DEFAULT, 620, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-30 12:48:00.000000', '2024-11-30 12:48:00.000000', '2024-12-02 08:00:00.000000'),
       (DEFAULT, 621, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-30 12:48:00.000000', '2024-11-30 12:48:00.000000', '2024-12-02 08:00:00.000000'),
       (DEFAULT, 622, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-30 12:48:00.000000', '2024-11-30 12:48:00.000000', '2024-12-02 08:00:00.000000'),
       (DEFAULT, 623, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-30 12:48:00.000000', '2024-11-30 12:48:00.000000', '2024-12-02 08:00:00.000000'),
       (DEFAULT, 624, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-30 12:48:00.000000', '2024-11-30 12:48:00.000000', '2024-12-02 08:00:00.000000');

-- 2024-12-02
-- 2024-12-08
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (68, 1, 121, NULL, 'Create dto for task', 'Create dto for task', NULL, 'ADVANCED', 'BACKEND', 'LOW', FALSE, '2024-12-02', '2024-12-08', '2024-12-08', '2024-12-02 08:00:00.000000', '2024-12-02 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (625, 68, 38, 'JOINED', '2024-12-02 08:00:00.000000'),
       (626, 68, 40, 'JOINED', '2024-12-02 08:00:00.000000'),
       (627, 68, 42, 'JOINED', '2024-12-02 08:00:00.000000'),
       (628, 68, 44, 'JOINED', '2024-12-02 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 625, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-08 08:00:00.000000', '2024-12-08 08:00:00.000000', '2024-12-08 08:00:00.000000'),
       (DEFAULT, 626, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-08 08:00:00.000000', '2024-12-08 08:00:00.000000', '2024-12-08 08:00:00.000000'),
       (DEFAULT, 627, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-08 08:00:00.000000', '2024-12-08 08:00:00.000000', '2024-12-08 08:00:00.000000'),
       (DEFAULT, 628, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-08 08:00:00.000000', '2024-12-08 08:00:00.000000', '2024-12-08 08:00:00.000000');

-- 2024-12-08
-- 2024-12-13
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (69, 1, 121, NULL, 'Create mapper util', 'Create mapper util', NULL, 'NORMAL', 'BACKEND', 'NORMAL', FALSE, '2024-12-08', '2024-12-13', '2024-12-13', '2024-12-08 08:00:00.000000', '2024-12-08 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (629, 69, 16, 'JOINED', '2024-12-08 08:00:00.000000'),
       (630, 69, 18, 'JOINED', '2024-12-08 08:00:00.000000'),
       (631, 69, 20, 'JOINED', '2024-12-08 08:00:00.000000'),
       (632, 69, 46, 'JOINED', '2024-12-08 08:00:00.000000'),
       (633, 69, 48, 'JOINED', '2024-12-08 08:00:00.000000'),
       (634, 69, 50, 'JOINED', '2024-12-08 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 629, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-11 20:00:00.000000', '2024-12-11 20:00:00.000000', '2024-12-13 08:00:00.000000'),
       (DEFAULT, 630, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-11 20:00:00.000000', '2024-12-11 20:00:00.000000', '2024-12-13 08:00:00.000000'),
       (DEFAULT, 631, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-11 20:00:00.000000', '2024-12-11 20:00:00.000000', '2024-12-13 08:00:00.000000'),
       (DEFAULT, 632, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-11 20:00:00.000000', '2024-12-11 20:00:00.000000', '2024-12-13 08:00:00.000000'),
       (DEFAULT, 633, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-11 20:00:00.000000', '2024-12-11 20:00:00.000000', '2024-12-13 08:00:00.000000'),
       (DEFAULT, 634, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-11 20:00:00.000000', '2024-12-11 20:00:00.000000', '2024-12-13 08:00:00.000000');

-- 2024-12-13
-- 2024-12-18
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (70, 1, 121, NULL, 'Add validation annotations', 'Add validation annotations', NULL, 'NORMAL', 'BACKEND', 'LOW', FALSE, '2024-12-13', '2024-12-18', '2024-12-18', '2024-12-13 08:00:00.000000', '2024-12-13 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (635, 70, 46, 'JOINED', '2024-12-13 08:00:00.000000'),
       (636, 70, 48, 'JOINED', '2024-12-13 08:00:00.000000'),
       (637, 70, 50, 'JOINED', '2024-12-13 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 635, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-18 08:00:00.000000', '2024-12-18 08:00:00.000000', '2024-12-18 08:00:00.000000'),
       (DEFAULT, 636, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-18 08:00:00.000000', '2024-12-18 08:00:00.000000', '2024-12-18 08:00:00.000000'),
       (DEFAULT, 637, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-18 08:00:00.000000', '2024-12-18 08:00:00.000000', '2024-12-18 08:00:00.000000');

-- 2024-12-18
-- 2024-12-22
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (71, 1, 121, NULL, 'Create login request dto', 'Create login request dto', NULL, 'LIGHT', 'BACKEND', 'NORMAL', FALSE, '2024-12-18', '2024-12-22', '2024-12-22', '2024-12-18 08:00:00.000000', '2024-12-18 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (638, 71, 22, 'JOINED', '2024-12-18 08:00:00.000000'),
       (639, 71, 24, 'JOINED', '2024-12-18 08:00:00.000000'),
       (640, 71, 26, 'JOINED', '2024-12-18 08:00:00.000000'),
       (641, 71, 28, 'JOINED', '2024-12-18 08:00:00.000000'),
       (642, 71, 52, 'JOINED', '2024-12-18 08:00:00.000000'),
       (643, 71, 54, 'JOINED', '2024-12-18 08:00:00.000000'),
       (644, 71, 56, 'JOINED', '2024-12-18 08:00:00.000000'),
       (645, 71, 58, 'JOINED', '2024-12-18 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 638, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-21 03:12:00.000000', '2024-12-21 03:12:00.000000', '2024-12-22 08:00:00.000000'),
       (DEFAULT, 639, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-21 03:12:00.000000', '2024-12-21 03:12:00.000000', '2024-12-22 08:00:00.000000'),
       (DEFAULT, 640, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-21 03:12:00.000000', '2024-12-21 03:12:00.000000', '2024-12-22 08:00:00.000000'),
       (DEFAULT, 641, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-21 03:12:00.000000', '2024-12-21 03:12:00.000000', '2024-12-22 08:00:00.000000'),
       (DEFAULT, 642, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-21 03:12:00.000000', '2024-12-21 03:12:00.000000', '2024-12-22 08:00:00.000000'),
       (DEFAULT, 643, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-21 03:12:00.000000', '2024-12-21 03:12:00.000000', '2024-12-22 08:00:00.000000'),
       (DEFAULT, 644, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-21 03:12:00.000000', '2024-12-21 03:12:00.000000', '2024-12-22 08:00:00.000000'),
       (DEFAULT, 645, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-21 03:12:00.000000', '2024-12-21 03:12:00.000000', '2024-12-22 08:00:00.000000');

-- 2024-12-22
-- 2024-12-26
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (72, 1, 121, NULL, 'Create register request dto', 'Create register request dto', NULL, 'LIGHT', 'BACKEND', 'LOW', FALSE, '2024-12-22', '2024-12-26', '2024-12-26', '2024-12-22 08:00:00.000000', '2024-12-22 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (646, 72, 52, 'JOINED', '2024-12-22 08:00:00.000000'),
       (647, 72, 54, 'JOINED', '2024-12-22 08:00:00.000000'),
       (648, 72, 56, 'JOINED', '2024-12-22 08:00:00.000000'),
       (649, 72, 58, 'JOINED', '2024-12-22 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 646, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-26 08:00:00.000000', '2024-12-26 08:00:00.000000', '2024-12-26 08:00:00.000000'),
       (DEFAULT, 647, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-26 08:00:00.000000', '2024-12-26 08:00:00.000000', '2024-12-26 08:00:00.000000'),
       (DEFAULT, 648, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-26 08:00:00.000000', '2024-12-26 08:00:00.000000', '2024-12-26 08:00:00.000000'),
       (DEFAULT, 649, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-26 08:00:00.000000', '2024-12-26 08:00:00.000000', '2024-12-26 08:00:00.000000');

-- 2024-12-26
-- 2024-12-29
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (73, 1, 121, NULL, 'Profile detail screen', 'Profile detail screen', NULL, 'HARD', 'FRONTEND', 'NORMAL', FALSE, '2024-12-26', '2024-12-29', '2024-12-29', '2024-12-26 08:00:00.000000', '2024-12-26 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (650, 73, 1, 'JOINED', '2024-12-26 08:00:00.000000'),
       (651, 73, 3, 'JOINED', '2024-12-26 08:00:00.000000'),
       (652, 73, 5, 'JOINED', '2024-12-26 08:00:00.000000'),
       (653, 73, 7, 'JOINED', '2024-12-26 08:00:00.000000'),
       (654, 73, 31, 'JOINED', '2024-12-26 08:00:00.000000'),
       (655, 73, 33, 'JOINED', '2024-12-26 08:00:00.000000'),
       (656, 73, 35, 'JOINED', '2024-12-26 08:00:00.000000'),
       (657, 73, 37, 'JOINED', '2024-12-26 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 650, 'Employee 1 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-28 10:24:00.000000', '2024-12-28 10:24:00.000000', '2024-12-29 08:00:00.000000'),
       (DEFAULT, 651, 'Employee 3 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-28 10:24:00.000000', '2024-12-28 10:24:00.000000', '2024-12-29 08:00:00.000000'),
       (DEFAULT, 652, 'Employee 5 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-28 10:24:00.000000', '2024-12-28 10:24:00.000000', '2024-12-29 08:00:00.000000'),
       (DEFAULT, 653, 'Employee 7 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-28 10:24:00.000000', '2024-12-28 10:24:00.000000', '2024-12-29 08:00:00.000000'),
       (DEFAULT, 654, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-28 10:24:00.000000', '2024-12-28 10:24:00.000000', '2024-12-29 08:00:00.000000'),
       (DEFAULT, 655, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-28 10:24:00.000000', '2024-12-28 10:24:00.000000', '2024-12-29 08:00:00.000000'),
       (DEFAULT, 656, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-28 10:24:00.000000', '2024-12-28 10:24:00.000000', '2024-12-29 08:00:00.000000'),
       (DEFAULT, 657, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-28 10:24:00.000000', '2024-12-28 10:24:00.000000', '2024-12-29 08:00:00.000000');

-- 2024-12-29
-- 2025-01-05
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (74, 1, 121, NULL, 'Show error notifications', 'Show error notifications', NULL, 'HARD', 'FRONTEND', 'LOW', FALSE, '2024-12-29', '2025-01-05', '2025-01-05', '2024-12-29 08:00:00.000000', '2024-12-29 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (658, 74, 31, 'JOINED', '2024-12-29 08:00:00.000000'),
       (659, 74, 33, 'JOINED', '2024-12-29 08:00:00.000000'),
       (660, 74, 35, 'JOINED', '2024-12-29 08:00:00.000000'),
       (661, 74, 37, 'JOINED', '2024-12-29 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 658, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-05 08:00:00.000000', '2025-01-05 08:00:00.000000', '2025-01-05 08:00:00.000000'),
       (DEFAULT, 659, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-05 08:00:00.000000', '2025-01-05 08:00:00.000000', '2025-01-05 08:00:00.000000'),
       (DEFAULT, 660, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-05 08:00:00.000000', '2025-01-05 08:00:00.000000', '2025-01-05 08:00:00.000000'),
       (DEFAULT, 661, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-05 08:00:00.000000', '2025-01-05 08:00:00.000000', '2025-01-05 08:00:00.000000');

-- 2025-01-05
-- 2025-01-11
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (75, 1, 121, NULL, 'Show success notifications', 'Show success notifications', NULL, 'ADVANCED', 'FRONTEND', 'NORMAL', FALSE, '2025-01-05', '2025-01-11', '2025-01-11', '2025-01-05 08:00:00.000000', '2025-01-05 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (662, 75, 9, 'JOINED', '2025-01-05 08:00:00.000000'),
       (663, 75, 11, 'JOINED', '2025-01-05 08:00:00.000000'),
       (664, 75, 13, 'JOINED', '2025-01-05 08:00:00.000000'),
       (665, 75, 39, 'JOINED', '2025-01-05 08:00:00.000000'),
       (666, 75, 41, 'JOINED', '2025-01-05 08:00:00.000000'),
       (667, 75, 43, 'JOINED', '2025-01-05 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 662, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-09 12:48:00.000000', '2025-01-09 12:48:00.000000', '2025-01-11 08:00:00.000000'),
       (DEFAULT, 663, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-09 12:48:00.000000', '2025-01-09 12:48:00.000000', '2025-01-11 08:00:00.000000'),
       (DEFAULT, 664, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-09 12:48:00.000000', '2025-01-09 12:48:00.000000', '2025-01-11 08:00:00.000000'),
       (DEFAULT, 665, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-09 12:48:00.000000', '2025-01-09 12:48:00.000000', '2025-01-11 08:00:00.000000'),
       (DEFAULT, 666, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-09 12:48:00.000000', '2025-01-09 12:48:00.000000', '2025-01-11 08:00:00.000000'),
       (DEFAULT, 667, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-09 12:48:00.000000', '2025-01-09 12:48:00.000000', '2025-01-11 08:00:00.000000');

-- 2025-01-11
-- 2025-01-17
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (76, 1, 121, NULL, 'Create delete confirm modal', 'Create delete confirm modal', NULL, 'ADVANCED', 'FRONTEND', 'LOW', FALSE, '2025-01-11', '2025-01-17', '2025-01-17', '2025-01-11 08:00:00.000000', '2025-01-11 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (668, 76, 39, 'JOINED', '2025-01-11 08:00:00.000000'),
       (669, 76, 41, 'JOINED', '2025-01-11 08:00:00.000000'),
       (670, 76, 43, 'JOINED', '2025-01-11 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 668, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-17 08:00:00.000000', '2025-01-17 08:00:00.000000', '2025-01-17 08:00:00.000000'),
       (DEFAULT, 669, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-17 08:00:00.000000', '2025-01-17 08:00:00.000000', '2025-01-17 08:00:00.000000'),
       (DEFAULT, 670, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-17 08:00:00.000000', '2025-01-17 08:00:00.000000', '2025-01-17 08:00:00.000000');

-- 2025-01-17
-- 2025-01-22
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (77, 1, 121, NULL, 'Create quick edit modal', 'Create quick edit modal', NULL, 'NORMAL', 'FRONTEND', 'NORMAL', FALSE, '2025-01-17', '2025-01-22', '2025-01-22', '2025-01-17 08:00:00.000000', '2025-01-17 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (671, 77, 15, 'JOINED', '2025-01-17 08:00:00.000000'),
       (672, 77, 17, 'JOINED', '2025-01-17 08:00:00.000000'),
       (673, 77, 19, 'JOINED', '2025-01-17 08:00:00.000000'),
       (674, 77, 21, 'JOINED', '2025-01-17 08:00:00.000000'),
       (675, 77, 45, 'JOINED', '2025-01-17 08:00:00.000000'),
       (676, 77, 47, 'JOINED', '2025-01-17 08:00:00.000000'),
       (677, 77, 49, 'JOINED', '2025-01-17 08:00:00.000000'),
       (678, 77, 51, 'JOINED', '2025-01-17 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 671, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-20 20:00:00.000000', '2025-01-20 20:00:00.000000', '2025-01-22 08:00:00.000000'),
       (DEFAULT, 672, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-20 20:00:00.000000', '2025-01-20 20:00:00.000000', '2025-01-22 08:00:00.000000'),
       (DEFAULT, 673, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-20 20:00:00.000000', '2025-01-20 20:00:00.000000', '2025-01-22 08:00:00.000000'),
       (DEFAULT, 674, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-20 20:00:00.000000', '2025-01-20 20:00:00.000000', '2025-01-22 08:00:00.000000'),
       (DEFAULT, 675, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-20 20:00:00.000000', '2025-01-20 20:00:00.000000', '2025-01-22 08:00:00.000000'),
       (DEFAULT, 676, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-20 20:00:00.000000', '2025-01-20 20:00:00.000000', '2025-01-22 08:00:00.000000'),
       (DEFAULT, 677, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-20 20:00:00.000000', '2025-01-20 20:00:00.000000', '2025-01-22 08:00:00.000000'),
       (DEFAULT, 678, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-20 20:00:00.000000', '2025-01-20 20:00:00.000000', '2025-01-22 08:00:00.000000');

-- 2025-01-22
-- 2025-01-27
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (78, 1, 121, NULL, 'Build toast notification', 'Build toast notification', NULL, 'NORMAL', 'FRONTEND', 'LOW', FALSE, '2025-01-22', '2025-01-27', '2025-01-27', '2025-01-22 08:00:00.000000', '2025-01-22 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (679, 78, 45, 'JOINED', '2025-01-22 08:00:00.000000'),
       (680, 78, 47, 'JOINED', '2025-01-22 08:00:00.000000'),
       (681, 78, 49, 'JOINED', '2025-01-22 08:00:00.000000'),
       (682, 78, 51, 'JOINED', '2025-01-22 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 679, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-27 08:00:00.000000', '2025-01-27 08:00:00.000000', '2025-01-27 08:00:00.000000'),
       (DEFAULT, 680, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-27 08:00:00.000000', '2025-01-27 08:00:00.000000', '2025-01-27 08:00:00.000000'),
       (DEFAULT, 681, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-27 08:00:00.000000', '2025-01-27 08:00:00.000000', '2025-01-27 08:00:00.000000'),
       (DEFAULT, 682, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-27 08:00:00.000000', '2025-01-27 08:00:00.000000', '2025-01-27 08:00:00.000000');

-- 2025-01-27
-- 2025-01-31
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (79, 1, 121, NULL, 'Add loading indicator', 'Add loading indicator', NULL, 'LIGHT', 'FRONTEND', 'NORMAL', FALSE, '2025-01-27', '2025-01-31', '2025-01-31', '2025-01-27 08:00:00.000000', '2025-01-27 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (683, 79, 23, 'JOINED', '2025-01-27 08:00:00.000000'),
       (684, 79, 25, 'JOINED', '2025-01-27 08:00:00.000000'),
       (685, 79, 27, 'JOINED', '2025-01-27 08:00:00.000000'),
       (686, 79, 53, 'JOINED', '2025-01-27 08:00:00.000000'),
       (687, 79, 55, 'JOINED', '2025-01-27 08:00:00.000000'),
       (688, 79, 57, 'JOINED', '2025-01-27 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 683, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-30 03:12:00.000000', '2025-01-30 03:12:00.000000', '2025-01-31 08:00:00.000000'),
       (DEFAULT, 684, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-30 03:12:00.000000', '2025-01-30 03:12:00.000000', '2025-01-31 08:00:00.000000'),
       (DEFAULT, 685, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-30 03:12:00.000000', '2025-01-30 03:12:00.000000', '2025-01-31 08:00:00.000000'),
       (DEFAULT, 686, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-30 03:12:00.000000', '2025-01-30 03:12:00.000000', '2025-01-31 08:00:00.000000'),
       (DEFAULT, 687, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-30 03:12:00.000000', '2025-01-30 03:12:00.000000', '2025-01-31 08:00:00.000000'),
       (DEFAULT, 688, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-30 03:12:00.000000', '2025-01-30 03:12:00.000000', '2025-01-31 08:00:00.000000');

-- 2025-01-31
-- 2025-02-04
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (80, 1, 121, NULL, 'Add skeleton loading', 'Add skeleton loading', NULL, 'LIGHT', 'FRONTEND', 'LOW', FALSE, '2025-01-31', '2025-02-04', '2025-02-04', '2025-01-31 08:00:00.000000', '2025-01-31 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (689, 80, 53, 'JOINED', '2025-01-31 08:00:00.000000'),
       (690, 80, 55, 'JOINED', '2025-01-31 08:00:00.000000'),
       (691, 80, 57, 'JOINED', '2025-01-31 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 689, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-04 08:00:00.000000', '2025-02-04 08:00:00.000000', '2025-02-04 08:00:00.000000'),
       (DEFAULT, 690, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-04 08:00:00.000000', '2025-02-04 08:00:00.000000', '2025-02-04 08:00:00.000000'),
       (DEFAULT, 691, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-04 08:00:00.000000', '2025-02-04 08:00:00.000000', '2025-02-04 08:00:00.000000');

-- 2025-02-04
-- 2025-02-07
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (81, 1, 121, NULL, 'Create task request dto', 'Create task request dto', NULL, 'HARD', 'BACKEND', 'NORMAL', FALSE, '2025-02-04', '2025-02-07', '2025-02-07', '2025-02-04 08:00:00.000000', '2025-02-04 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (692, 81, 2, 'JOINED', '2025-02-04 08:00:00.000000'),
       (693, 81, 4, 'JOINED', '2025-02-04 08:00:00.000000'),
       (694, 81, 6, 'JOINED', '2025-02-04 08:00:00.000000'),
       (695, 81, 32, 'JOINED', '2025-02-04 08:00:00.000000'),
       (696, 81, 34, 'JOINED', '2025-02-04 08:00:00.000000'),
       (697, 81, 36, 'JOINED', '2025-02-04 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 692, 'Employee 2 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-06 14:00:00.000000', '2025-02-06 14:00:00.000000', '2025-02-07 08:00:00.000000'),
       (DEFAULT, 693, 'Employee 4 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-06 14:00:00.000000', '2025-02-06 14:00:00.000000', '2025-02-07 08:00:00.000000'),
       (DEFAULT, 694, 'Employee 6 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-06 14:00:00.000000', '2025-02-06 14:00:00.000000', '2025-02-07 08:00:00.000000'),
       (DEFAULT, 695, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-06 14:00:00.000000', '2025-02-06 14:00:00.000000', '2025-02-07 08:00:00.000000'),
       (DEFAULT, 696, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-06 14:00:00.000000', '2025-02-06 14:00:00.000000', '2025-02-07 08:00:00.000000'),
       (DEFAULT, 697, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-06 14:00:00.000000', '2025-02-06 14:00:00.000000', '2025-02-07 08:00:00.000000');

-- 2025-02-07
-- 2025-02-14
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (82, 1, 121, NULL, 'Create task response dto', 'Create task response dto', NULL, 'ADVANCED', 'BACKEND', 'NORMAL', FALSE, '2025-02-07', '2025-02-14', '2025-02-14', '2025-02-07 08:00:00.000000', '2025-02-07 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (698, 82, 8, 'JOINED', '2025-02-07 08:00:00.000000'),
       (699, 82, 10, 'JOINED', '2025-02-07 08:00:00.000000'),
       (700, 82, 12, 'JOINED', '2025-02-07 08:00:00.000000'),
       (701, 82, 14, 'JOINED', '2025-02-07 08:00:00.000000'),
       (702, 82, 38, 'JOINED', '2025-02-07 08:00:00.000000'),
       (703, 82, 40, 'JOINED', '2025-02-07 08:00:00.000000'),
       (704, 82, 42, 'JOINED', '2025-02-07 08:00:00.000000'),
       (705, 82, 44, 'JOINED', '2025-02-07 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 698, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-12 14:00:00.000000', '2025-02-12 14:00:00.000000', '2025-02-14 08:00:00.000000'),
       (DEFAULT, 699, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-12 14:00:00.000000', '2025-02-12 14:00:00.000000', '2025-02-14 08:00:00.000000'),
       (DEFAULT, 700, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-12 14:00:00.000000', '2025-02-12 14:00:00.000000', '2025-02-14 08:00:00.000000'),
       (DEFAULT, 701, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-12 14:00:00.000000', '2025-02-12 14:00:00.000000', '2025-02-14 08:00:00.000000'),
       (DEFAULT, 702, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-12 14:00:00.000000', '2025-02-12 14:00:00.000000', '2025-02-14 08:00:00.000000'),
       (DEFAULT, 703, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-12 14:00:00.000000', '2025-02-12 14:00:00.000000', '2025-02-14 08:00:00.000000'),
       (DEFAULT, 704, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-12 14:00:00.000000', '2025-02-12 14:00:00.000000', '2025-02-14 08:00:00.000000'),
       (DEFAULT, 705, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-12 14:00:00.000000', '2025-02-12 14:00:00.000000', '2025-02-14 08:00:00.000000');

-- 2025-02-14
-- 2025-02-20
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (83, 1, 121, NULL, 'Add swagger configuration', 'Add swagger configuration', NULL, 'NORMAL', 'BACKEND', 'NORMAL', FALSE, '2025-02-14', '2025-02-20', '2025-02-20', '2025-02-14 08:00:00.000000', '2025-02-14 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (706, 83, 16, 'JOINED', '2025-02-14 08:00:00.000000'),
       (707, 83, 18, 'JOINED', '2025-02-14 08:00:00.000000'),
       (708, 83, 20, 'JOINED', '2025-02-14 08:00:00.000000'),
       (709, 83, 46, 'JOINED', '2025-02-14 08:00:00.000000'),
       (710, 83, 48, 'JOINED', '2025-02-14 08:00:00.000000'),
       (711, 83, 50, 'JOINED', '2025-02-14 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 706, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-18 20:00:00.000000', '2025-02-18 20:00:00.000000', '2025-02-20 08:00:00.000000'),
       (DEFAULT, 707, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-18 20:00:00.000000', '2025-02-18 20:00:00.000000', '2025-02-20 08:00:00.000000'),
       (DEFAULT, 708, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-18 20:00:00.000000', '2025-02-18 20:00:00.000000', '2025-02-20 08:00:00.000000'),
       (DEFAULT, 709, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-18 20:00:00.000000', '2025-02-18 20:00:00.000000', '2025-02-20 08:00:00.000000'),
       (DEFAULT, 710, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-18 20:00:00.000000', '2025-02-18 20:00:00.000000', '2025-02-20 08:00:00.000000'),
       (DEFAULT, 711, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-18 20:00:00.000000', '2025-02-18 20:00:00.000000', '2025-02-20 08:00:00.000000');

-- 2025-02-20
-- 2025-02-25
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (84, 1, 121, NULL, 'Add cors configuration', 'Add cors configuration', NULL, 'LIGHT', 'BACKEND', 'NORMAL', FALSE, '2025-02-20', '2025-02-25', '2025-02-25', '2025-02-20 08:00:00.000000', '2025-02-20 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (712, 84, 22, 'JOINED', '2025-02-20 08:00:00.000000'),
       (713, 84, 24, 'JOINED', '2025-02-20 08:00:00.000000'),
       (714, 84, 26, 'JOINED', '2025-02-20 08:00:00.000000'),
       (715, 84, 28, 'JOINED', '2025-02-20 08:00:00.000000'),
       (716, 84, 52, 'JOINED', '2025-02-20 08:00:00.000000'),
       (717, 84, 54, 'JOINED', '2025-02-20 08:00:00.000000'),
       (718, 84, 56, 'JOINED', '2025-02-20 08:00:00.000000'),
       (719, 84, 58, 'JOINED', '2025-02-20 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 712, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-24 02:00:00.000000', '2025-02-24 02:00:00.000000', '2025-02-25 08:00:00.000000'),
       (DEFAULT, 713, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-24 02:00:00.000000', '2025-02-24 02:00:00.000000', '2025-02-25 08:00:00.000000'),
       (DEFAULT, 714, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-24 02:00:00.000000', '2025-02-24 02:00:00.000000', '2025-02-25 08:00:00.000000'),
       (DEFAULT, 715, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-24 02:00:00.000000', '2025-02-24 02:00:00.000000', '2025-02-25 08:00:00.000000'),
       (DEFAULT, 716, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-24 02:00:00.000000', '2025-02-24 02:00:00.000000', '2025-02-25 08:00:00.000000'),
       (DEFAULT, 717, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-24 02:00:00.000000', '2025-02-24 02:00:00.000000', '2025-02-25 08:00:00.000000'),
       (DEFAULT, 718, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-24 02:00:00.000000', '2025-02-24 02:00:00.000000', '2025-02-25 08:00:00.000000'),
       (DEFAULT, 719, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-24 02:00:00.000000', '2025-02-24 02:00:00.000000', '2025-02-25 08:00:00.000000');

-- 2025-02-25
-- 2025-03-01
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (85, 1, 121, NULL, 'Optimize list rendering', 'Optimize list rendering', NULL, 'HARD', 'FRONTEND', 'NORMAL', FALSE, '2025-02-25', '2025-03-01', '2025-03-01', '2025-02-25 08:00:00.000000', '2025-02-25 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (720, 85, 1, 'JOINED', '2025-02-25 08:00:00.000000'),
       (721, 85, 3, 'JOINED', '2025-02-25 08:00:00.000000'),
       (722, 85, 5, 'JOINED', '2025-02-25 08:00:00.000000'),
       (723, 85, 7, 'JOINED', '2025-02-25 08:00:00.000000'),
       (724, 85, 31, 'JOINED', '2025-02-25 08:00:00.000000'),
       (725, 85, 33, 'JOINED', '2025-02-25 08:00:00.000000'),
       (726, 85, 35, 'JOINED', '2025-02-25 08:00:00.000000'),
       (727, 85, 37, 'JOINED', '2025-02-25 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 720, 'Employee 1 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-28 08:00:00.000000', '2025-02-28 08:00:00.000000', '2025-03-01 08:00:00.000000'),
       (DEFAULT, 721, 'Employee 3 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-28 08:00:00.000000', '2025-02-28 08:00:00.000000', '2025-03-01 08:00:00.000000'),
       (DEFAULT, 722, 'Employee 5 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-28 08:00:00.000000', '2025-02-28 08:00:00.000000', '2025-03-01 08:00:00.000000'),
       (DEFAULT, 723, 'Employee 7 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-28 08:00:00.000000', '2025-02-28 08:00:00.000000', '2025-03-01 08:00:00.000000'),
       (DEFAULT, 724, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-28 08:00:00.000000', '2025-02-28 08:00:00.000000', '2025-03-01 08:00:00.000000'),
       (DEFAULT, 725, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-28 08:00:00.000000', '2025-02-28 08:00:00.000000', '2025-03-01 08:00:00.000000'),
       (DEFAULT, 726, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-28 08:00:00.000000', '2025-02-28 08:00:00.000000', '2025-03-01 08:00:00.000000'),
       (DEFAULT, 727, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-28 08:00:00.000000', '2025-02-28 08:00:00.000000', '2025-03-01 08:00:00.000000');

-- 2025-03-01
-- 2025-03-08
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (86, 1, 121, NULL, 'Memoize task components', 'Memoize task components', NULL, 'ADVANCED', 'FRONTEND', 'NORMAL', FALSE, '2025-03-01', '2025-03-08', '2025-03-08', '2025-03-01 08:00:00.000000', '2025-03-01 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (728, 86, 9, 'JOINED', '2025-03-01 08:00:00.000000'),
       (729, 86, 11, 'JOINED', '2025-03-01 08:00:00.000000'),
       (730, 86, 13, 'JOINED', '2025-03-01 08:00:00.000000'),
       (731, 86, 39, 'JOINED', '2025-03-01 08:00:00.000000'),
       (732, 86, 41, 'JOINED', '2025-03-01 08:00:00.000000'),
       (733, 86, 43, 'JOINED', '2025-03-01 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 728, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-06 14:00:00.000000', '2025-03-06 14:00:00.000000', '2025-03-08 08:00:00.000000'),
       (DEFAULT, 729, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-06 14:00:00.000000', '2025-03-06 14:00:00.000000', '2025-03-08 08:00:00.000000'),
       (DEFAULT, 730, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-06 14:00:00.000000', '2025-03-06 14:00:00.000000', '2025-03-08 08:00:00.000000'),
       (DEFAULT, 731, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-06 14:00:00.000000', '2025-03-06 14:00:00.000000', '2025-03-08 08:00:00.000000'),
       (DEFAULT, 732, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-06 14:00:00.000000', '2025-03-06 14:00:00.000000', '2025-03-08 08:00:00.000000'),
       (DEFAULT, 733, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-06 14:00:00.000000', '2025-03-06 14:00:00.000000', '2025-03-08 08:00:00.000000');

-- 2025-03-08
-- 2025-03-14
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (87, 1, 121, NULL, 'Extract TaskItem component', 'Extract TaskItem component', NULL, 'NORMAL', 'FRONTEND', 'NORMAL', FALSE, '2025-03-08', '2025-03-14', '2025-03-14', '2025-03-08 08:00:00.000000', '2025-03-08 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (734, 87, 15, 'JOINED', '2025-03-08 08:00:00.000000'),
       (735, 87, 17, 'JOINED', '2025-03-08 08:00:00.000000'),
       (736, 87, 19, 'JOINED', '2025-03-08 08:00:00.000000'),
       (737, 87, 21, 'JOINED', '2025-03-08 08:00:00.000000'),
       (738, 87, 45, 'JOINED', '2025-03-08 08:00:00.000000'),
       (739, 87, 47, 'JOINED', '2025-03-08 08:00:00.000000'),
       (740, 87, 49, 'JOINED', '2025-03-08 08:00:00.000000'),
       (741, 87, 51, 'JOINED', '2025-03-08 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 734, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-12 20:00:00.000000', '2025-03-12 20:00:00.000000', '2025-03-14 08:00:00.000000'),
       (DEFAULT, 735, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-12 20:00:00.000000', '2025-03-12 20:00:00.000000', '2025-03-14 08:00:00.000000'),
       (DEFAULT, 736, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-12 20:00:00.000000', '2025-03-12 20:00:00.000000', '2025-03-14 08:00:00.000000'),
       (DEFAULT, 737, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-12 20:00:00.000000', '2025-03-12 20:00:00.000000', '2025-03-14 08:00:00.000000'),
       (DEFAULT, 738, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-12 20:00:00.000000', '2025-03-12 20:00:00.000000', '2025-03-14 08:00:00.000000'),
       (DEFAULT, 739, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-12 20:00:00.000000', '2025-03-12 20:00:00.000000', '2025-03-14 08:00:00.000000'),
       (DEFAULT, 740, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-12 20:00:00.000000', '2025-03-12 20:00:00.000000', '2025-03-14 08:00:00.000000'),
       (DEFAULT, 741, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-12 20:00:00.000000', '2025-03-12 20:00:00.000000', '2025-03-14 08:00:00.000000');

-- 2025-03-14
-- 2025-03-19
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (88, 1, 121, NULL, 'Extract TaskCard component', 'Extract TaskCard component', NULL, 'LIGHT', 'FRONTEND', 'NORMAL', FALSE, '2025-03-14', '2025-03-19', '2025-03-19', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (742, 88, 23, 'JOINED', '2025-03-14 08:00:00.000000'),
       (743, 88, 25, 'JOINED', '2025-03-14 08:00:00.000000'),
       (744, 88, 27, 'JOINED', '2025-03-14 08:00:00.000000'),
       (745, 88, 53, 'JOINED', '2025-03-14 08:00:00.000000'),
       (746, 88, 55, 'JOINED', '2025-03-14 08:00:00.000000'),
       (747, 88, 57, 'JOINED', '2025-03-14 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 742, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-18 02:00:00.000000', '2025-03-18 02:00:00.000000', '2025-03-19 08:00:00.000000'),
       (DEFAULT, 743, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-18 02:00:00.000000', '2025-03-18 02:00:00.000000', '2025-03-19 08:00:00.000000'),
       (DEFAULT, 744, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-18 02:00:00.000000', '2025-03-18 02:00:00.000000', '2025-03-19 08:00:00.000000'),
       (DEFAULT, 745, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-18 02:00:00.000000', '2025-03-18 02:00:00.000000', '2025-03-19 08:00:00.000000'),
       (DEFAULT, 746, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-18 02:00:00.000000', '2025-03-18 02:00:00.000000', '2025-03-19 08:00:00.000000'),
       (DEFAULT, 747, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-18 02:00:00.000000', '2025-03-18 02:00:00.000000', '2025-03-19 08:00:00.000000');

-- 2025-03-19
-- 2025-03-23
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (89, 1, 121, NULL, 'Setup object mapper config', 'Setup object mapper config', NULL, 'HARD', 'BACKEND', 'NORMAL', FALSE, '2025-03-19', '2025-03-23', '2025-03-23', '2025-03-19 08:00:00.000000', '2025-03-19 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (748, 89, 2, 'JOINED', '2025-03-19 08:00:00.000000'),
       (749, 89, 4, 'JOINED', '2025-03-19 08:00:00.000000'),
       (750, 89, 6, 'JOINED', '2025-03-19 08:00:00.000000'),
       (751, 89, 32, 'JOINED', '2025-03-19 08:00:00.000000'),
       (752, 89, 34, 'JOINED', '2025-03-19 08:00:00.000000'),
       (753, 89, 36, 'JOINED', '2025-03-19 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 748, 'Employee 2 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-22 12:48:00.000000', '2025-03-22 12:48:00.000000', '2025-03-23 08:00:00.000000'),
       (DEFAULT, 749, 'Employee 4 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-22 12:48:00.000000', '2025-03-22 12:48:00.000000', '2025-03-23 08:00:00.000000'),
       (DEFAULT, 750, 'Employee 6 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-22 12:48:00.000000', '2025-03-22 12:48:00.000000', '2025-03-23 08:00:00.000000'),
       (DEFAULT, 751, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-22 12:48:00.000000', '2025-03-22 12:48:00.000000', '2025-03-23 08:00:00.000000'),
       (DEFAULT, 752, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-22 12:48:00.000000', '2025-03-22 12:48:00.000000', '2025-03-23 08:00:00.000000'),
       (DEFAULT, 753, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-22 12:48:00.000000', '2025-03-22 12:48:00.000000', '2025-03-23 08:00:00.000000');

-- 2025-03-23
-- 2025-03-30
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (90, 1, 121, NULL, 'Add logging interceptor', 'Add logging interceptor', NULL, 'ADVANCED', 'BACKEND', 'NORMAL', FALSE, '2025-03-23', '2025-03-30', '2025-03-30', '2025-03-23 08:00:00.000000', '2025-03-23 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (754, 90, 8, 'JOINED', '2025-03-23 08:00:00.000000'),
       (755, 90, 10, 'JOINED', '2025-03-23 08:00:00.000000'),
       (756, 90, 12, 'JOINED', '2025-03-23 08:00:00.000000'),
       (757, 90, 14, 'JOINED', '2025-03-23 08:00:00.000000'),
       (758, 90, 38, 'JOINED', '2025-03-23 08:00:00.000000'),
       (759, 90, 40, 'JOINED', '2025-03-23 08:00:00.000000'),
       (760, 90, 42, 'JOINED', '2025-03-23 08:00:00.000000'),
       (761, 90, 44, 'JOINED', '2025-03-23 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 754, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-28 22:24:00.000000', '2025-03-28 22:24:00.000000', '2025-03-30 08:00:00.000000'),
       (DEFAULT, 755, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-28 22:24:00.000000', '2025-03-28 22:24:00.000000', '2025-03-30 08:00:00.000000'),
       (DEFAULT, 756, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-28 22:24:00.000000', '2025-03-28 22:24:00.000000', '2025-03-30 08:00:00.000000'),
       (DEFAULT, 757, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-28 22:24:00.000000', '2025-03-28 22:24:00.000000', '2025-03-30 08:00:00.000000'),
       (DEFAULT, 758, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-28 22:24:00.000000', '2025-03-28 22:24:00.000000', '2025-03-30 08:00:00.000000'),
       (DEFAULT, 759, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-28 22:24:00.000000', '2025-03-28 22:24:00.000000', '2025-03-30 08:00:00.000000'),
       (DEFAULT, 760, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-28 22:24:00.000000', '2025-03-28 22:24:00.000000', '2025-03-30 08:00:00.000000'),
       (DEFAULT, 761, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-28 22:24:00.000000', '2025-03-28 22:24:00.000000', '2025-03-30 08:00:00.000000');

-- 2025-03-30
-- 2025-04-05
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (91, 1, 121, NULL, 'Add service layer tests', 'Add service layer tests', NULL, 'NORMAL', 'BACKEND', 'NORMAL', FALSE, '2025-03-30', '2025-04-05', '2025-04-05', '2025-03-30 08:00:00.000000', '2025-03-30 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (762, 91, 16, 'JOINED', '2025-03-30 08:00:00.000000'),
       (763, 91, 18, 'JOINED', '2025-03-30 08:00:00.000000'),
       (764, 91, 20, 'JOINED', '2025-03-30 08:00:00.000000'),
       (765, 91, 46, 'JOINED', '2025-03-30 08:00:00.000000'),
       (766, 91, 48, 'JOINED', '2025-03-30 08:00:00.000000'),
       (767, 91, 50, 'JOINED', '2025-03-30 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 762, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-04 03:12:00.000000', '2025-04-04 03:12:00.000000', '2025-04-05 08:00:00.000000'),
       (DEFAULT, 763, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-04 03:12:00.000000', '2025-04-04 03:12:00.000000', '2025-04-05 08:00:00.000000'),
       (DEFAULT, 764, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-04 03:12:00.000000', '2025-04-04 03:12:00.000000', '2025-04-05 08:00:00.000000'),
       (DEFAULT, 765, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-04 03:12:00.000000', '2025-04-04 03:12:00.000000', '2025-04-05 08:00:00.000000'),
       (DEFAULT, 766, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-04 03:12:00.000000', '2025-04-04 03:12:00.000000', '2025-04-05 08:00:00.000000'),
       (DEFAULT, 767, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-04 03:12:00.000000', '2025-04-04 03:12:00.000000', '2025-04-05 08:00:00.000000');

-- 2025-04-05
-- 2025-04-10
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (92, 1, 121, NULL, 'Add repository tests', 'Add repository tests', NULL, 'LIGHT', 'BACKEND', 'NORMAL', FALSE, '2025-04-05', '2025-04-10', '2025-04-10', '2025-04-05 08:00:00.000000', '2025-04-05 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (768, 92, 22, 'JOINED', '2025-04-05 08:00:00.000000'),
       (769, 92, 24, 'JOINED', '2025-04-05 08:00:00.000000'),
       (770, 92, 26, 'JOINED', '2025-04-05 08:00:00.000000'),
       (771, 92, 28, 'JOINED', '2025-04-05 08:00:00.000000'),
       (772, 92, 52, 'JOINED', '2025-04-05 08:00:00.000000'),
       (773, 92, 54, 'JOINED', '2025-04-05 08:00:00.000000'),
       (774, 92, 56, 'JOINED', '2025-04-05 08:00:00.000000'),
       (775, 92, 58, 'JOINED', '2025-04-05 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 768, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-09 08:00:00.000000', '2025-04-09 08:00:00.000000', '2025-04-10 08:00:00.000000'),
       (DEFAULT, 769, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-09 08:00:00.000000', '2025-04-09 08:00:00.000000', '2025-04-10 08:00:00.000000'),
       (DEFAULT, 770, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-09 08:00:00.000000', '2025-04-09 08:00:00.000000', '2025-04-10 08:00:00.000000'),
       (DEFAULT, 771, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-09 08:00:00.000000', '2025-04-09 08:00:00.000000', '2025-04-10 08:00:00.000000'),
       (DEFAULT, 772, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-09 08:00:00.000000', '2025-04-09 08:00:00.000000', '2025-04-10 08:00:00.000000'),
       (DEFAULT, 773, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-09 08:00:00.000000', '2025-04-09 08:00:00.000000', '2025-04-10 08:00:00.000000'),
       (DEFAULT, 774, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-09 08:00:00.000000', '2025-04-09 08:00:00.000000', '2025-04-10 08:00:00.000000'),
       (DEFAULT, 775, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-09 08:00:00.000000', '2025-04-09 08:00:00.000000', '2025-04-10 08:00:00.000000');

-- 2025-04-10
-- 2025-04-14
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (93, 1, 121, NULL, 'Extract UserMenu component', 'Extract UserMenu component', NULL, 'HARD', 'FRONTEND', 'NORMAL', FALSE, '2025-04-10', '2025-04-14', '2025-04-14', '2025-04-10 08:00:00.000000', '2025-04-10 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (776, 93, 1, 'JOINED', '2025-04-10 08:00:00.000000'),
       (777, 93, 3, 'JOINED', '2025-04-10 08:00:00.000000'),
       (778, 93, 5, 'JOINED', '2025-04-10 08:00:00.000000'),
       (779, 93, 7, 'JOINED', '2025-04-10 08:00:00.000000'),
       (780, 93, 31, 'JOINED', '2025-04-10 08:00:00.000000'),
       (781, 93, 33, 'JOINED', '2025-04-10 08:00:00.000000'),
       (782, 93, 35, 'JOINED', '2025-04-10 08:00:00.000000'),
       (783, 93, 37, 'JOINED', '2025-04-10 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 776, 'Employee 1 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-13 12:48:00.000000', '2025-04-13 12:48:00.000000', '2025-04-14 08:00:00.000000'),
       (DEFAULT, 777, 'Employee 3 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-13 12:48:00.000000', '2025-04-13 12:48:00.000000', '2025-04-14 08:00:00.000000'),
       (DEFAULT, 778, 'Employee 5 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-13 12:48:00.000000', '2025-04-13 12:48:00.000000', '2025-04-14 08:00:00.000000'),
       (DEFAULT, 779, 'Employee 7 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-13 12:48:00.000000', '2025-04-13 12:48:00.000000', '2025-04-14 08:00:00.000000'),
       (DEFAULT, 780, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-13 12:48:00.000000', '2025-04-13 12:48:00.000000', '2025-04-14 08:00:00.000000'),
       (DEFAULT, 781, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-13 12:48:00.000000', '2025-04-13 12:48:00.000000', '2025-04-14 08:00:00.000000'),
       (DEFAULT, 782, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-13 12:48:00.000000', '2025-04-13 12:48:00.000000', '2025-04-14 08:00:00.000000'),
       (DEFAULT, 783, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-13 12:48:00.000000', '2025-04-13 12:48:00.000000', '2025-04-14 08:00:00.000000');

-- 2025-04-14
-- 2025-04-21
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (94, 1, 121, NULL, 'Create API hook', 'Create API hook', NULL, 'ADVANCED', 'FRONTEND', 'NORMAL', FALSE, '2025-04-14', '2025-04-21', '2025-04-21', '2025-04-14 08:00:00.000000', '2025-04-14 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (784, 94, 9, 'JOINED', '2025-04-14 08:00:00.000000'),
       (785, 94, 11, 'JOINED', '2025-04-14 08:00:00.000000'),
       (786, 94, 13, 'JOINED', '2025-04-14 08:00:00.000000'),
       (787, 94, 39, 'JOINED', '2025-04-14 08:00:00.000000'),
       (788, 94, 41, 'JOINED', '2025-04-14 08:00:00.000000'),
       (789, 94, 43, 'JOINED', '2025-04-14 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 784, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-19 22:24:00.000000', '2025-04-19 22:24:00.000000', '2025-04-21 08:00:00.000000'),
       (DEFAULT, 785, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-19 22:24:00.000000', '2025-04-19 22:24:00.000000', '2025-04-21 08:00:00.000000'),
       (DEFAULT, 786, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-19 22:24:00.000000', '2025-04-19 22:24:00.000000', '2025-04-21 08:00:00.000000'),
       (DEFAULT, 787, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-19 22:24:00.000000', '2025-04-19 22:24:00.000000', '2025-04-21 08:00:00.000000'),
       (DEFAULT, 788, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-19 22:24:00.000000', '2025-04-19 22:24:00.000000', '2025-04-21 08:00:00.000000'),
       (DEFAULT, 789, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-19 22:24:00.000000', '2025-04-19 22:24:00.000000', '2025-04-21 08:00:00.000000');

-- 2025-04-21
-- 2025-04-27
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (95, 1, 121, NULL, 'Create auth hook', 'Create auth hook', NULL, 'NORMAL', 'FRONTEND', 'NORMAL', FALSE, '2025-04-21', '2025-04-27', '2025-04-27', '2025-04-21 08:00:00.000000', '2025-04-21 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (790, 95, 15, 'JOINED', '2025-04-21 08:00:00.000000'),
       (791, 95, 17, 'JOINED', '2025-04-21 08:00:00.000000'),
       (792, 95, 19, 'JOINED', '2025-04-21 08:00:00.000000'),
       (793, 95, 21, 'JOINED', '2025-04-21 08:00:00.000000'),
       (794, 95, 45, 'JOINED', '2025-04-21 08:00:00.000000'),
       (795, 95, 47, 'JOINED', '2025-04-21 08:00:00.000000'),
       (796, 95, 49, 'JOINED', '2025-04-21 08:00:00.000000'),
       (797, 95, 51, 'JOINED', '2025-04-21 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 790, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-26 03:12:00.000000', '2025-04-26 03:12:00.000000', '2025-04-27 08:00:00.000000'),
       (DEFAULT, 791, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-26 03:12:00.000000', '2025-04-26 03:12:00.000000', '2025-04-27 08:00:00.000000'),
       (DEFAULT, 792, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-26 03:12:00.000000', '2025-04-26 03:12:00.000000', '2025-04-27 08:00:00.000000'),
       (DEFAULT, 793, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-26 03:12:00.000000', '2025-04-26 03:12:00.000000', '2025-04-27 08:00:00.000000'),
       (DEFAULT, 794, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-26 03:12:00.000000', '2025-04-26 03:12:00.000000', '2025-04-27 08:00:00.000000'),
       (DEFAULT, 795, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-26 03:12:00.000000', '2025-04-26 03:12:00.000000', '2025-04-27 08:00:00.000000'),
       (DEFAULT, 796, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-26 03:12:00.000000', '2025-04-26 03:12:00.000000', '2025-04-27 08:00:00.000000'),
       (DEFAULT, 797, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-26 03:12:00.000000', '2025-04-26 03:12:00.000000', '2025-04-27 08:00:00.000000');

-- 2025-04-27
-- 2025-05-02
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (96, 1, 121, NULL, 'Create form hook', 'Create form hook', NULL, 'LIGHT', 'FRONTEND', 'NORMAL', FALSE, '2025-04-27', '2025-05-02', '2025-05-02', '2025-04-27 08:00:00.000000', '2025-04-27 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (798, 96, 23, 'JOINED', '2025-04-27 08:00:00.000000'),
       (799, 96, 25, 'JOINED', '2025-04-27 08:00:00.000000'),
       (800, 96, 27, 'JOINED', '2025-04-27 08:00:00.000000'),
       (801, 96, 53, 'JOINED', '2025-04-27 08:00:00.000000'),
       (802, 96, 55, 'JOINED', '2025-04-27 08:00:00.000000'),
       (803, 96, 57, 'JOINED', '2025-04-27 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 798, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-01 08:00:00.000000', '2025-05-01 08:00:00.000000', '2025-05-02 08:00:00.000000'),
       (DEFAULT, 799, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-01 08:00:00.000000', '2025-05-01 08:00:00.000000', '2025-05-02 08:00:00.000000'),
       (DEFAULT, 800, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-01 08:00:00.000000', '2025-05-01 08:00:00.000000', '2025-05-02 08:00:00.000000'),
       (DEFAULT, 801, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-01 08:00:00.000000', '2025-05-01 08:00:00.000000', '2025-05-02 08:00:00.000000'),
       (DEFAULT, 802, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-01 08:00:00.000000', '2025-05-01 08:00:00.000000', '2025-05-02 08:00:00.000000'),
       (DEFAULT, 803, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-01 08:00:00.000000', '2025-05-01 08:00:00.000000', '2025-05-02 08:00:00.000000');

-- 2025-05-02
-- 2025-05-06
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (97, 1, 121, NULL, 'Add controller tests', 'Add controller tests', NULL, 'HARD', 'BACKEND', 'NORMAL', FALSE, '2025-05-02', '2025-05-06', '2025-05-06', '2025-05-02 08:00:00.000000', '2025-05-02 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (804, 97, 2, 'JOINED', '2025-05-02 08:00:00.000000'),
       (805, 97, 4, 'JOINED', '2025-05-02 08:00:00.000000'),
       (806, 97, 6, 'JOINED', '2025-05-02 08:00:00.000000'),
       (807, 97, 32, 'JOINED', '2025-05-02 08:00:00.000000'),
       (808, 97, 34, 'JOINED', '2025-05-02 08:00:00.000000'),
       (809, 97, 36, 'JOINED', '2025-05-02 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 804, 'Employee 2 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-05 17:36:00.000000', '2025-05-05 17:36:00.000000', '2025-05-06 08:00:00.000000'),
       (DEFAULT, 805, 'Employee 4 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-05 17:36:00.000000', '2025-05-05 17:36:00.000000', '2025-05-06 08:00:00.000000'),
       (DEFAULT, 806, 'Employee 6 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-05 17:36:00.000000', '2025-05-05 17:36:00.000000', '2025-05-06 08:00:00.000000'),
       (DEFAULT, 807, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-05 17:36:00.000000', '2025-05-05 17:36:00.000000', '2025-05-06 08:00:00.000000'),
       (DEFAULT, 808, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-05 17:36:00.000000', '2025-05-05 17:36:00.000000', '2025-05-06 08:00:00.000000'),
       (DEFAULT, 809, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-05 17:36:00.000000', '2025-05-05 17:36:00.000000', '2025-05-06 08:00:00.000000');

-- 2025-05-06
-- 2025-05-13
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (98, 1, 121, NULL, 'Integrate with redis cache', 'Integrate with redis cache', NULL, 'ADVANCED', 'BACKEND', 'NORMAL', FALSE, '2025-05-06', '2025-05-13', '2025-05-13', '2025-05-06 08:00:00.000000', '2025-05-06 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (810, 98, 8, 'JOINED', '2025-05-06 08:00:00.000000'),
       (811, 98, 10, 'JOINED', '2025-05-06 08:00:00.000000'),
       (812, 98, 12, 'JOINED', '2025-05-06 08:00:00.000000'),
       (813, 98, 14, 'JOINED', '2025-05-06 08:00:00.000000'),
       (814, 98, 38, 'JOINED', '2025-05-06 08:00:00.000000'),
       (815, 98, 40, 'JOINED', '2025-05-06 08:00:00.000000'),
       (816, 98, 42, 'JOINED', '2025-05-06 08:00:00.000000'),
       (817, 98, 44, 'JOINED', '2025-05-06 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 810, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-12 06:48:00.000000', '2025-05-12 06:48:00.000000', '2025-05-13 08:00:00.000000'),
       (DEFAULT, 811, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-12 06:48:00.000000', '2025-05-12 06:48:00.000000', '2025-05-13 08:00:00.000000'),
       (DEFAULT, 812, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-12 06:48:00.000000', '2025-05-12 06:48:00.000000', '2025-05-13 08:00:00.000000'),
       (DEFAULT, 813, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-12 06:48:00.000000', '2025-05-12 06:48:00.000000', '2025-05-13 08:00:00.000000'),
       (DEFAULT, 814, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-12 06:48:00.000000', '2025-05-12 06:48:00.000000', '2025-05-13 08:00:00.000000'),
       (DEFAULT, 815, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-12 06:48:00.000000', '2025-05-12 06:48:00.000000', '2025-05-13 08:00:00.000000'),
       (DEFAULT, 816, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-12 06:48:00.000000', '2025-05-12 06:48:00.000000', '2025-05-13 08:00:00.000000'),
       (DEFAULT, 817, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-12 06:48:00.000000', '2025-05-12 06:48:00.000000', '2025-05-13 08:00:00.000000');

-- 2025-05-13
-- 2025-05-19
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (99, 1, 121, NULL, 'Cache task list response', 'Cache task list response', NULL, 'NORMAL', 'BACKEND', 'NORMAL', FALSE, '2025-05-13', '2025-05-19', '2025-05-19', '2025-05-13 08:00:00.000000', '2025-05-13 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (818, 99, 16, 'JOINED', '2025-05-13 08:00:00.000000'),
       (819, 99, 18, 'JOINED', '2025-05-13 08:00:00.000000'),
       (820, 99, 20, 'JOINED', '2025-05-13 08:00:00.000000'),
       (821, 99, 46, 'JOINED', '2025-05-13 08:00:00.000000'),
       (822, 99, 48, 'JOINED', '2025-05-13 08:00:00.000000'),
       (823, 99, 50, 'JOINED', '2025-05-13 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 818, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-18 10:24:00.000000', '2025-05-18 10:24:00.000000', '2025-05-19 08:00:00.000000'),
       (DEFAULT, 819, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-18 10:24:00.000000', '2025-05-18 10:24:00.000000', '2025-05-19 08:00:00.000000'),
       (DEFAULT, 820, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-18 10:24:00.000000', '2025-05-18 10:24:00.000000', '2025-05-19 08:00:00.000000'),
       (DEFAULT, 821, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-18 10:24:00.000000', '2025-05-18 10:24:00.000000', '2025-05-19 08:00:00.000000'),
       (DEFAULT, 822, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-18 10:24:00.000000', '2025-05-18 10:24:00.000000', '2025-05-19 08:00:00.000000'),
       (DEFAULT, 823, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-18 10:24:00.000000', '2025-05-18 10:24:00.000000', '2025-05-19 08:00:00.000000');

-- 2025-05-19
-- 2025-05-24
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (100, 1, 121, NULL, 'Add rate limit filter', 'Add rate limit filter', NULL, 'LIGHT', 'BACKEND', 'NORMAL', FALSE, '2025-05-19', '2025-05-24', '2025-05-24', '2025-05-19 08:00:00.000000', '2025-05-19 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (824, 100, 22, 'JOINED', '2025-05-19 08:00:00.000000'),
       (825, 100, 24, 'JOINED', '2025-05-19 08:00:00.000000'),
       (826, 100, 26, 'JOINED', '2025-05-19 08:00:00.000000'),
       (827, 100, 28, 'JOINED', '2025-05-19 08:00:00.000000'),
       (828, 100, 52, 'JOINED', '2025-05-19 08:00:00.000000'),
       (829, 100, 54, 'JOINED', '2025-05-19 08:00:00.000000'),
       (830, 100, 56, 'JOINED', '2025-05-19 08:00:00.000000'),
       (831, 100, 58, 'JOINED', '2025-05-19 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 824, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-23 14:00:00.000000', '2025-05-23 14:00:00.000000', '2025-05-24 08:00:00.000000'),
       (DEFAULT, 825, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-23 14:00:00.000000', '2025-05-23 14:00:00.000000', '2025-05-24 08:00:00.000000'),
       (DEFAULT, 826, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-23 14:00:00.000000', '2025-05-23 14:00:00.000000', '2025-05-24 08:00:00.000000'),
       (DEFAULT, 827, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-23 14:00:00.000000', '2025-05-23 14:00:00.000000', '2025-05-24 08:00:00.000000'),
       (DEFAULT, 828, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-23 14:00:00.000000', '2025-05-23 14:00:00.000000', '2025-05-24 08:00:00.000000'),
       (DEFAULT, 829, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-23 14:00:00.000000', '2025-05-23 14:00:00.000000', '2025-05-24 08:00:00.000000'),
       (DEFAULT, 830, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-23 14:00:00.000000', '2025-05-23 14:00:00.000000', '2025-05-24 08:00:00.000000'),
       (DEFAULT, 831, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-23 14:00:00.000000', '2025-05-23 14:00:00.000000', '2025-05-24 08:00:00.000000');

-- 2025-05-24
-- 2025-05-28
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (101, 1, 121, NULL, 'Integrate login API', 'Integrate login API', NULL, 'HARD', 'FRONTEND', 'NORMAL', FALSE, '2025-05-24', '2025-05-28', '2025-05-28', '2025-05-24 08:00:00.000000', '2025-05-24 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (832, 101, 1, 'JOINED', '2025-05-24 08:00:00.000000'),
       (833, 101, 3, 'JOINED', '2025-05-24 08:00:00.000000'),
       (834, 101, 5, 'JOINED', '2025-05-24 08:00:00.000000'),
       (835, 101, 7, 'JOINED', '2025-05-24 08:00:00.000000'),
       (836, 101, 31, 'JOINED', '2025-05-24 08:00:00.000000'),
       (837, 101, 33, 'JOINED', '2025-05-24 08:00:00.000000'),
       (838, 101, 35, 'JOINED', '2025-05-24 08:00:00.000000'),
       (839, 101, 37, 'JOINED', '2025-05-24 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 832, 'Employee 1 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-27 17:36:00.000000', '2025-05-27 17:36:00.000000', '2025-05-28 08:00:00.000000'),
       (DEFAULT, 833, 'Employee 3 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-27 17:36:00.000000', '2025-05-27 17:36:00.000000', '2025-05-28 08:00:00.000000'),
       (DEFAULT, 834, 'Employee 5 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-27 17:36:00.000000', '2025-05-27 17:36:00.000000', '2025-05-28 08:00:00.000000'),
       (DEFAULT, 835, 'Employee 7 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-27 17:36:00.000000', '2025-05-27 17:36:00.000000', '2025-05-28 08:00:00.000000'),
       (DEFAULT, 836, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-27 17:36:00.000000', '2025-05-27 17:36:00.000000', '2025-05-28 08:00:00.000000'),
       (DEFAULT, 837, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-27 17:36:00.000000', '2025-05-27 17:36:00.000000', '2025-05-28 08:00:00.000000'),
       (DEFAULT, 838, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-27 17:36:00.000000', '2025-05-27 17:36:00.000000', '2025-05-28 08:00:00.000000'),
       (DEFAULT, 839, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-27 17:36:00.000000', '2025-05-27 17:36:00.000000', '2025-05-28 08:00:00.000000');

-- 2025-05-28
-- 2025-06-04
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (102, 1, 121, NULL, 'Integrate register API', 'Integrate register API', NULL, 'ADVANCED', 'FRONTEND', 'NORMAL', FALSE, '2025-05-28', '2025-06-04', '2025-06-04', '2025-05-28 08:00:00.000000', '2025-05-28 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (840, 102, 9, 'JOINED', '2025-05-28 08:00:00.000000'),
       (841, 102, 11, 'JOINED', '2025-05-28 08:00:00.000000'),
       (842, 102, 13, 'JOINED', '2025-05-28 08:00:00.000000'),
       (843, 102, 39, 'JOINED', '2025-05-28 08:00:00.000000'),
       (844, 102, 41, 'JOINED', '2025-05-28 08:00:00.000000'),
       (845, 102, 43, 'JOINED', '2025-05-28 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 840, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-03 06:48:00.000000', '2025-06-03 06:48:00.000000', '2025-06-04 08:00:00.000000'),
       (DEFAULT, 841, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-03 06:48:00.000000', '2025-06-03 06:48:00.000000', '2025-06-04 08:00:00.000000'),
       (DEFAULT, 842, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-03 06:48:00.000000', '2025-06-03 06:48:00.000000', '2025-06-04 08:00:00.000000'),
       (DEFAULT, 843, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-03 06:48:00.000000', '2025-06-03 06:48:00.000000', '2025-06-04 08:00:00.000000'),
       (DEFAULT, 844, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-03 06:48:00.000000', '2025-06-03 06:48:00.000000', '2025-06-04 08:00:00.000000'),
       (DEFAULT, 845, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-03 06:48:00.000000', '2025-06-03 06:48:00.000000', '2025-06-04 08:00:00.000000');

-- 2025-06-04
-- 2025-06-10
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (103, 1, 121, NULL, 'Integrate task API', 'Integrate task API', NULL, 'NORMAL', 'FRONTEND', 'NORMAL', FALSE, '2025-06-04', '2025-06-10', '2025-06-10', '2025-06-04 08:00:00.000000', '2025-06-04 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (846, 103, 15, 'JOINED', '2025-06-04 08:00:00.000000'),
       (847, 103, 17, 'JOINED', '2025-06-04 08:00:00.000000'),
       (848, 103, 19, 'JOINED', '2025-06-04 08:00:00.000000'),
       (849, 103, 21, 'JOINED', '2025-06-04 08:00:00.000000'),
       (850, 103, 45, 'JOINED', '2025-06-04 08:00:00.000000'),
       (851, 103, 47, 'JOINED', '2025-06-04 08:00:00.000000'),
       (852, 103, 49, 'JOINED', '2025-06-04 08:00:00.000000'),
       (853, 103, 51, 'JOINED', '2025-06-04 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 846, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-09 10:24:00.000000', '2025-06-09 10:24:00.000000', '2025-06-10 08:00:00.000000'),
       (DEFAULT, 847, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-09 10:24:00.000000', '2025-06-09 10:24:00.000000', '2025-06-10 08:00:00.000000'),
       (DEFAULT, 848, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-09 10:24:00.000000', '2025-06-09 10:24:00.000000', '2025-06-10 08:00:00.000000'),
       (DEFAULT, 849, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-09 10:24:00.000000', '2025-06-09 10:24:00.000000', '2025-06-10 08:00:00.000000'),
       (DEFAULT, 850, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-09 10:24:00.000000', '2025-06-09 10:24:00.000000', '2025-06-10 08:00:00.000000'),
       (DEFAULT, 851, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-09 10:24:00.000000', '2025-06-09 10:24:00.000000', '2025-06-10 08:00:00.000000'),
       (DEFAULT, 852, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-09 10:24:00.000000', '2025-06-09 10:24:00.000000', '2025-06-10 08:00:00.000000'),
       (DEFAULT, 853, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-09 10:24:00.000000', '2025-06-09 10:24:00.000000', '2025-06-10 08:00:00.000000');

-- 2025-06-10
-- 2025-06-15
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (104, 1, 121, NULL, 'Store token in cookie', 'Store token in cookie', NULL, 'LIGHT', 'FRONTEND', 'NORMAL', FALSE, '2025-06-10', '2025-06-15', '2025-06-15', '2025-06-10 08:00:00.000000', '2025-06-10 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (854, 104, 23, 'JOINED', '2025-06-10 08:00:00.000000'),
       (855, 104, 25, 'JOINED', '2025-06-10 08:00:00.000000'),
       (856, 104, 27, 'JOINED', '2025-06-10 08:00:00.000000'),
       (857, 104, 53, 'JOINED', '2025-06-10 08:00:00.000000'),
       (858, 104, 55, 'JOINED', '2025-06-10 08:00:00.000000'),
       (859, 104, 57, 'JOINED', '2025-06-10 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 854, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-14 14:00:00.000000', '2025-06-14 14:00:00.000000', '2025-06-15 08:00:00.000000'),
       (DEFAULT, 855, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-14 14:00:00.000000', '2025-06-14 14:00:00.000000', '2025-06-15 08:00:00.000000'),
       (DEFAULT, 856, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-14 14:00:00.000000', '2025-06-14 14:00:00.000000', '2025-06-15 08:00:00.000000'),
       (DEFAULT, 857, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-14 14:00:00.000000', '2025-06-14 14:00:00.000000', '2025-06-15 08:00:00.000000'),
       (DEFAULT, 858, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-14 14:00:00.000000', '2025-06-14 14:00:00.000000', '2025-06-15 08:00:00.000000'),
       (DEFAULT, 859, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-14 14:00:00.000000', '2025-06-14 14:00:00.000000', '2025-06-15 08:00:00.000000');

-- 2025-06-15
-- 2025-06-19
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (105, 1, 121, NULL, 'Add health check endpoint', 'Add health check endpoint', NULL, 'HARD', 'BACKEND', 'NORMAL', FALSE, '2025-06-15', '2025-06-19', '2025-06-19', '2025-06-15 08:00:00.000000', '2025-06-15 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (860, 105, 2, 'JOINED', '2025-06-15 08:00:00.000000'),
       (861, 105, 4, 'JOINED', '2025-06-15 08:00:00.000000'),
       (862, 105, 6, 'JOINED', '2025-06-15 08:00:00.000000'),
       (863, 105, 32, 'JOINED', '2025-06-15 08:00:00.000000'),
       (864, 105, 34, 'JOINED', '2025-06-15 08:00:00.000000'),
       (865, 105, 36, 'JOINED', '2025-06-15 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 860, 'Employee 2 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-18 22:24:00.000000', '2025-06-18 22:24:00.000000', '2025-06-19 08:00:00.000000'),
       (DEFAULT, 861, 'Employee 4 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-18 22:24:00.000000', '2025-06-18 22:24:00.000000', '2025-06-19 08:00:00.000000'),
       (DEFAULT, 862, 'Employee 6 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-18 22:24:00.000000', '2025-06-18 22:24:00.000000', '2025-06-19 08:00:00.000000'),
       (DEFAULT, 863, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-18 22:24:00.000000', '2025-06-18 22:24:00.000000', '2025-06-19 08:00:00.000000'),
       (DEFAULT, 864, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-18 22:24:00.000000', '2025-06-18 22:24:00.000000', '2025-06-19 08:00:00.000000'),
       (DEFAULT, 865, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-18 22:24:00.000000', '2025-06-18 22:24:00.000000', '2025-06-19 08:00:00.000000');

-- 2025-06-19
-- 2025-06-26
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (106, 1, 121, NULL, 'Add metrics endpoint', 'Add metrics endpoint', NULL, 'ADVANCED', 'BACKEND', 'NORMAL', FALSE, '2025-06-19', '2025-06-26', '2025-06-26', '2025-06-19 08:00:00.000000', '2025-06-19 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (866, 106, 8, 'JOINED', '2025-06-19 08:00:00.000000'),
       (867, 106, 10, 'JOINED', '2025-06-19 08:00:00.000000'),
       (868, 106, 12, 'JOINED', '2025-06-19 08:00:00.000000'),
       (869, 106, 14, 'JOINED', '2025-06-19 08:00:00.000000'),
       (870, 106, 38, 'JOINED', '2025-06-19 08:00:00.000000'),
       (871, 106, 40, 'JOINED', '2025-06-19 08:00:00.000000'),
       (872, 106, 42, 'JOINED', '2025-06-19 08:00:00.000000'),
       (873, 106, 44, 'JOINED', '2025-06-19 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 866, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-25 15:12:00.000000', '2025-06-25 15:12:00.000000', '2025-06-26 08:00:00.000000'),
       (DEFAULT, 867, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-25 15:12:00.000000', '2025-06-25 15:12:00.000000', '2025-06-26 08:00:00.000000'),
       (DEFAULT, 868, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-25 15:12:00.000000', '2025-06-25 15:12:00.000000', '2025-06-26 08:00:00.000000'),
       (DEFAULT, 869, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-25 15:12:00.000000', '2025-06-25 15:12:00.000000', '2025-06-26 08:00:00.000000'),
       (DEFAULT, 870, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-25 15:12:00.000000', '2025-06-25 15:12:00.000000', '2025-06-26 08:00:00.000000'),
       (DEFAULT, 871, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-25 15:12:00.000000', '2025-06-25 15:12:00.000000', '2025-06-26 08:00:00.000000'),
       (DEFAULT, 872, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-25 15:12:00.000000', '2025-06-25 15:12:00.000000', '2025-06-26 08:00:00.000000'),
       (DEFAULT, 873, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-25 15:12:00.000000', '2025-06-25 15:12:00.000000', '2025-06-26 08:00:00.000000');

-- 2025-06-26
-- 2025-07-02
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (107, 1, 121, NULL, 'Implement scheduled cleanup', 'Implement scheduled cleanup', NULL, 'NORMAL', 'BACKEND', 'NORMAL', FALSE, '2025-06-26', '2025-07-02', '2025-07-02', '2025-06-26 08:00:00.000000', '2025-06-26 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (874, 107, 16, 'JOINED', '2025-06-26 08:00:00.000000'),
       (875, 107, 18, 'JOINED', '2025-06-26 08:00:00.000000'),
       (876, 107, 20, 'JOINED', '2025-06-26 08:00:00.000000'),
       (877, 107, 46, 'JOINED', '2025-06-26 08:00:00.000000'),
       (878, 107, 48, 'JOINED', '2025-06-26 08:00:00.000000'),
       (879, 107, 50, 'JOINED', '2025-06-26 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 874, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-01 17:36:00.000000', '2025-07-01 17:36:00.000000', '2025-07-02 08:00:00.000000'),
       (DEFAULT, 875, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-01 17:36:00.000000', '2025-07-01 17:36:00.000000', '2025-07-02 08:00:00.000000'),
       (DEFAULT, 876, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-01 17:36:00.000000', '2025-07-01 17:36:00.000000', '2025-07-02 08:00:00.000000'),
       (DEFAULT, 877, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-01 17:36:00.000000', '2025-07-01 17:36:00.000000', '2025-07-02 08:00:00.000000'),
       (DEFAULT, 878, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-01 17:36:00.000000', '2025-07-01 17:36:00.000000', '2025-07-02 08:00:00.000000'),
       (DEFAULT, 879, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-01 17:36:00.000000', '2025-07-01 17:36:00.000000', '2025-07-02 08:00:00.000000');

-- 2025-07-02
-- 2025-07-07
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (108, 1, 121, NULL, 'Implement audit logs', 'Implement audit logs', NULL, 'LIGHT', 'BACKEND', 'NORMAL', FALSE, '2025-07-02', '2025-07-07', '2025-07-07', '2025-07-02 08:00:00.000000', '2025-07-02 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (880, 108, 22, 'JOINED', '2025-07-02 08:00:00.000000'),
       (881, 108, 24, 'JOINED', '2025-07-02 08:00:00.000000'),
       (882, 108, 26, 'JOINED', '2025-07-02 08:00:00.000000'),
       (883, 108, 28, 'JOINED', '2025-07-02 08:00:00.000000'),
       (884, 108, 52, 'JOINED', '2025-07-02 08:00:00.000000'),
       (885, 108, 54, 'JOINED', '2025-07-02 08:00:00.000000'),
       (886, 108, 56, 'JOINED', '2025-07-02 08:00:00.000000'),
       (887, 108, 58, 'JOINED', '2025-07-02 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 880, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-06 20:00:00.000000', '2025-07-06 20:00:00.000000', '2025-07-07 08:00:00.000000'),
       (DEFAULT, 881, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-06 20:00:00.000000', '2025-07-06 20:00:00.000000', '2025-07-07 08:00:00.000000'),
       (DEFAULT, 882, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-06 20:00:00.000000', '2025-07-06 20:00:00.000000', '2025-07-07 08:00:00.000000'),
       (DEFAULT, 883, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-06 20:00:00.000000', '2025-07-06 20:00:00.000000', '2025-07-07 08:00:00.000000'),
       (DEFAULT, 884, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-06 20:00:00.000000', '2025-07-06 20:00:00.000000', '2025-07-07 08:00:00.000000'),
       (DEFAULT, 885, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-06 20:00:00.000000', '2025-07-06 20:00:00.000000', '2025-07-07 08:00:00.000000'),
       (DEFAULT, 886, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-06 20:00:00.000000', '2025-07-06 20:00:00.000000', '2025-07-07 08:00:00.000000'),
       (DEFAULT, 887, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-06 20:00:00.000000', '2025-07-06 20:00:00.000000', '2025-07-07 08:00:00.000000');

-- 2025-07-07
-- 2025-07-11
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (109, 1, 121, NULL, 'Protect private routes', 'Protect private routes', NULL, 'HARD', 'FRONTEND', 'NORMAL', FALSE, '2025-07-07', '2025-07-11', '2025-07-11', '2025-07-07 08:00:00.000000', '2025-07-07 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (888, 109, 1, 'JOINED', '2025-07-07 08:00:00.000000'),
       (889, 109, 3, 'JOINED', '2025-07-07 08:00:00.000000'),
       (890, 109, 5, 'JOINED', '2025-07-07 08:00:00.000000'),
       (891, 109, 7, 'JOINED', '2025-07-07 08:00:00.000000'),
       (892, 109, 31, 'JOINED', '2025-07-07 08:00:00.000000'),
       (893, 109, 33, 'JOINED', '2025-07-07 08:00:00.000000'),
       (894, 109, 35, 'JOINED', '2025-07-07 08:00:00.000000'),
       (895, 109, 37, 'JOINED', '2025-07-07 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 888, 'Employee 1 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-10 22:24:00.000000', '2025-07-10 22:24:00.000000', '2025-07-11 08:00:00.000000'),
       (DEFAULT, 889, 'Employee 3 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-10 22:24:00.000000', '2025-07-10 22:24:00.000000', '2025-07-11 08:00:00.000000'),
       (DEFAULT, 890, 'Employee 5 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-10 22:24:00.000000', '2025-07-10 22:24:00.000000', '2025-07-11 08:00:00.000000'),
       (DEFAULT, 891, 'Employee 7 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-10 22:24:00.000000', '2025-07-10 22:24:00.000000', '2025-07-11 08:00:00.000000'),
       (DEFAULT, 892, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-10 22:24:00.000000', '2025-07-10 22:24:00.000000', '2025-07-11 08:00:00.000000'),
       (DEFAULT, 893, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-10 22:24:00.000000', '2025-07-10 22:24:00.000000', '2025-07-11 08:00:00.000000'),
       (DEFAULT, 894, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-10 22:24:00.000000', '2025-07-10 22:24:00.000000', '2025-07-11 08:00:00.000000'),
       (DEFAULT, 895, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-10 22:24:00.000000', '2025-07-10 22:24:00.000000', '2025-07-11 08:00:00.000000');

-- 2025-07-11
-- 2025-07-18
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (110, 1, 121, NULL, 'Redirect if unauthenticated', 'Redirect if unauthenticated', NULL, 'ADVANCED', 'FRONTEND', 'NORMAL', FALSE, '2025-07-11', '2025-07-18', '2025-07-18', '2025-07-11 08:00:00.000000', '2025-07-11 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (896, 110, 9, 'JOINED', '2025-07-11 08:00:00.000000'),
       (897, 110, 11, 'JOINED', '2025-07-11 08:00:00.000000'),
       (898, 110, 13, 'JOINED', '2025-07-11 08:00:00.000000'),
       (899, 110, 39, 'JOINED', '2025-07-11 08:00:00.000000'),
       (900, 110, 41, 'JOINED', '2025-07-11 08:00:00.000000'),
       (901, 110, 43, 'JOINED', '2025-07-11 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 896, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-17 15:12:00.000000', '2025-07-17 15:12:00.000000', '2025-07-18 08:00:00.000000'),
       (DEFAULT, 897, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-17 15:12:00.000000', '2025-07-17 15:12:00.000000', '2025-07-18 08:00:00.000000'),
       (DEFAULT, 898, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-17 15:12:00.000000', '2025-07-17 15:12:00.000000', '2025-07-18 08:00:00.000000'),
       (DEFAULT, 899, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-17 15:12:00.000000', '2025-07-17 15:12:00.000000', '2025-07-18 08:00:00.000000'),
       (DEFAULT, 900, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-17 15:12:00.000000', '2025-07-17 15:12:00.000000', '2025-07-18 08:00:00.000000'),
       (DEFAULT, 901, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-17 15:12:00.000000', '2025-07-17 15:12:00.000000', '2025-07-18 08:00:00.000000');

-- 2025-07-18
-- 2025-07-24
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (111, 1, 121, NULL, 'Create 404 page', 'Create 404 page', NULL, 'NORMAL', 'FRONTEND', 'NORMAL', FALSE, '2025-07-18', '2025-07-24', '2025-07-24', '2025-07-18 08:00:00.000000', '2025-07-18 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (902, 111, 15, 'JOINED', '2025-07-18 08:00:00.000000'),
       (903, 111, 17, 'JOINED', '2025-07-18 08:00:00.000000'),
       (904, 111, 19, 'JOINED', '2025-07-18 08:00:00.000000'),
       (905, 111, 21, 'JOINED', '2025-07-18 08:00:00.000000'),
       (906, 111, 45, 'JOINED', '2025-07-18 08:00:00.000000'),
       (907, 111, 47, 'JOINED', '2025-07-18 08:00:00.000000'),
       (908, 111, 49, 'JOINED', '2025-07-18 08:00:00.000000'),
       (909, 111, 51, 'JOINED', '2025-07-18 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 902, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-23 17:36:00.000000', '2025-07-23 17:36:00.000000', '2025-07-24 08:00:00.000000'),
       (DEFAULT, 903, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-23 17:36:00.000000', '2025-07-23 17:36:00.000000', '2025-07-24 08:00:00.000000'),
       (DEFAULT, 904, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-23 17:36:00.000000', '2025-07-23 17:36:00.000000', '2025-07-24 08:00:00.000000'),
       (DEFAULT, 905, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-23 17:36:00.000000', '2025-07-23 17:36:00.000000', '2025-07-24 08:00:00.000000'),
       (DEFAULT, 906, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-23 17:36:00.000000', '2025-07-23 17:36:00.000000', '2025-07-24 08:00:00.000000'),
       (DEFAULT, 907, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-23 17:36:00.000000', '2025-07-23 17:36:00.000000', '2025-07-24 08:00:00.000000'),
       (DEFAULT, 908, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-23 17:36:00.000000', '2025-07-23 17:36:00.000000', '2025-07-24 08:00:00.000000'),
       (DEFAULT, 909, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-23 17:36:00.000000', '2025-07-23 17:36:00.000000', '2025-07-24 08:00:00.000000');

-- 2025-07-24
-- 2025-07-29
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (112, 1, 121, NULL, 'Create 500 page', 'Create 500 page', NULL, 'LIGHT', 'FRONTEND', 'NORMAL', FALSE, '2025-07-24', '2025-07-29', '2025-07-29', '2025-07-24 08:00:00.000000', '2025-07-24 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (910, 112, 23, 'JOINED', '2025-07-24 08:00:00.000000'),
       (911, 112, 25, 'JOINED', '2025-07-24 08:00:00.000000'),
       (912, 112, 27, 'JOINED', '2025-07-24 08:00:00.000000'),
       (913, 112, 53, 'JOINED', '2025-07-24 08:00:00.000000'),
       (914, 112, 55, 'JOINED', '2025-07-24 08:00:00.000000'),
       (915, 112, 57, 'JOINED', '2025-07-24 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 910, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-28 20:00:00.000000', '2025-07-28 20:00:00.000000', '2025-07-29 08:00:00.000000'),
       (DEFAULT, 911, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-28 20:00:00.000000', '2025-07-28 20:00:00.000000', '2025-07-29 08:00:00.000000'),
       (DEFAULT, 912, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-28 20:00:00.000000', '2025-07-28 20:00:00.000000', '2025-07-29 08:00:00.000000'),
       (DEFAULT, 913, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-28 20:00:00.000000', '2025-07-28 20:00:00.000000', '2025-07-29 08:00:00.000000'),
       (DEFAULT, 914, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-28 20:00:00.000000', '2025-07-28 20:00:00.000000', '2025-07-29 08:00:00.000000'),
       (DEFAULT, 915, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-28 20:00:00.000000', '2025-07-28 20:00:00.000000', '2025-07-29 08:00:00.000000');

-- 2025-07-29
-- 2025-08-02
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (113, 1, 121, NULL, 'Add user activity tracking', 'Add user activity tracking', NULL, 'HARD', 'BACKEND', 'NORMAL', FALSE, '2025-07-29', '2025-08-02', '2025-08-02', '2025-07-29 08:00:00.000000', '2025-07-29 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (916, 113, 2, 'JOINED', '2025-07-29 08:00:00.000000'),
       (917, 113, 4, 'JOINED', '2025-07-29 08:00:00.000000'),
       (918, 113, 6, 'JOINED', '2025-07-29 08:00:00.000000'),
       (919, 113, 32, 'JOINED', '2025-07-29 08:00:00.000000'),
       (920, 113, 34, 'JOINED', '2025-07-29 08:00:00.000000'),
       (921, 113, 36, 'JOINED', '2025-07-29 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 916, 'Employee 2 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-02 03:12:00.000000', '2025-08-02 03:12:00.000000', '2025-08-02 08:00:00.000000'),
       (DEFAULT, 917, 'Employee 4 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-02 03:12:00.000000', '2025-08-02 03:12:00.000000', '2025-08-02 08:00:00.000000'),
       (DEFAULT, 918, 'Employee 6 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-02 03:12:00.000000', '2025-08-02 03:12:00.000000', '2025-08-02 08:00:00.000000'),
       (DEFAULT, 919, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-02 03:12:00.000000', '2025-08-02 03:12:00.000000', '2025-08-02 08:00:00.000000'),
       (DEFAULT, 920, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-02 03:12:00.000000', '2025-08-02 03:12:00.000000', '2025-08-02 08:00:00.000000'),
       (DEFAULT, 921, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-02 03:12:00.000000', '2025-08-02 03:12:00.000000', '2025-08-02 08:00:00.000000');

-- 2025-08-02
-- 2025-08-09
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (114, 1, 121, NULL, 'Refactor service layers', 'Refactor service layers', NULL, 'ADVANCED', 'BACKEND', 'NORMAL', FALSE, '2025-08-02', '2025-08-09', '2025-08-09', '2025-08-02 08:00:00.000000', '2025-08-02 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (922, 114, 8, 'JOINED', '2025-08-02 08:00:00.000000'),
       (923, 114, 10, 'JOINED', '2025-08-02 08:00:00.000000'),
       (924, 114, 12, 'JOINED', '2025-08-02 08:00:00.000000'),
       (925, 114, 14, 'JOINED', '2025-08-02 08:00:00.000000'),
       (926, 114, 38, 'JOINED', '2025-08-02 08:00:00.000000'),
       (927, 114, 40, 'JOINED', '2025-08-02 08:00:00.000000'),
       (928, 114, 42, 'JOINED', '2025-08-02 08:00:00.000000'),
       (929, 114, 44, 'JOINED', '2025-08-02 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 922, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-08 23:36:00.000000', '2025-08-08 23:36:00.000000', '2025-08-09 08:00:00.000000'),
       (DEFAULT, 923, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-08 23:36:00.000000', '2025-08-08 23:36:00.000000', '2025-08-09 08:00:00.000000'),
       (DEFAULT, 924, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-08 23:36:00.000000', '2025-08-08 23:36:00.000000', '2025-08-09 08:00:00.000000'),
       (DEFAULT, 925, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-08 23:36:00.000000', '2025-08-08 23:36:00.000000', '2025-08-09 08:00:00.000000'),
       (DEFAULT, 926, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-08 23:36:00.000000', '2025-08-08 23:36:00.000000', '2025-08-09 08:00:00.000000'),
       (DEFAULT, 927, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-08 23:36:00.000000', '2025-08-08 23:36:00.000000', '2025-08-09 08:00:00.000000'),
       (DEFAULT, 928, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-08 23:36:00.000000', '2025-08-08 23:36:00.000000', '2025-08-09 08:00:00.000000'),
       (DEFAULT, 929, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-08 23:36:00.000000', '2025-08-08 23:36:00.000000', '2025-08-09 08:00:00.000000');

-- 2025-08-09
-- 2025-08-15
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (115, 1, 121, NULL, 'Optimize database queries', 'Optimize database queries', NULL, 'NORMAL', 'BACKEND', 'NORMAL', FALSE, '2025-08-09', '2025-08-15', '2025-08-15', '2025-08-09 08:00:00.000000', '2025-08-09 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (930, 115, 16, 'JOINED', '2025-08-09 08:00:00.000000'),
       (931, 115, 18, 'JOINED', '2025-08-09 08:00:00.000000'),
       (932, 115, 20, 'JOINED', '2025-08-09 08:00:00.000000'),
       (933, 115, 46, 'JOINED', '2025-08-09 08:00:00.000000'),
       (934, 115, 48, 'JOINED', '2025-08-09 08:00:00.000000'),
       (935, 115, 50, 'JOINED', '2025-08-09 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 930, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-15 00:48:00.000000', '2025-08-15 00:48:00.000000', '2025-08-15 08:00:00.000000'),
       (DEFAULT, 931, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-15 00:48:00.000000', '2025-08-15 00:48:00.000000', '2025-08-15 08:00:00.000000'),
       (DEFAULT, 932, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-15 00:48:00.000000', '2025-08-15 00:48:00.000000', '2025-08-15 08:00:00.000000'),
       (DEFAULT, 933, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-15 00:48:00.000000', '2025-08-15 00:48:00.000000', '2025-08-15 08:00:00.000000'),
       (DEFAULT, 934, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-15 00:48:00.000000', '2025-08-15 00:48:00.000000', '2025-08-15 08:00:00.000000'),
       (DEFAULT, 935, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-15 00:48:00.000000', '2025-08-15 00:48:00.000000', '2025-08-15 08:00:00.000000');

-- 2025-08-15
-- 2025-08-20
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (116, 1, 121, NULL, 'Add transactional annotations', 'Add transactional annotations', NULL, 'LIGHT', 'BACKEND', 'NORMAL', FALSE, '2025-08-15', '2025-08-20', '2025-08-20', '2025-08-15 08:00:00.000000', '2025-08-15 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (936, 116, 22, 'JOINED', '2025-08-15 08:00:00.000000'),
       (937, 116, 24, 'JOINED', '2025-08-15 08:00:00.000000'),
       (938, 116, 26, 'JOINED', '2025-08-15 08:00:00.000000'),
       (939, 116, 28, 'JOINED', '2025-08-15 08:00:00.000000'),
       (940, 116, 52, 'JOINED', '2025-08-15 08:00:00.000000'),
       (941, 116, 54, 'JOINED', '2025-08-15 08:00:00.000000'),
       (942, 116, 56, 'JOINED', '2025-08-15 08:00:00.000000'),
       (943, 116, 58, 'JOINED', '2025-08-15 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 936, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-20 02:00:00.000000', '2025-08-20 02:00:00.000000', '2025-08-20 08:00:00.000000'),
       (DEFAULT, 937, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-20 02:00:00.000000', '2025-08-20 02:00:00.000000', '2025-08-20 08:00:00.000000'),
       (DEFAULT, 938, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-20 02:00:00.000000', '2025-08-20 02:00:00.000000', '2025-08-20 08:00:00.000000'),
       (DEFAULT, 939, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-20 02:00:00.000000', '2025-08-20 02:00:00.000000', '2025-08-20 08:00:00.000000'),
       (DEFAULT, 940, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-20 02:00:00.000000', '2025-08-20 02:00:00.000000', '2025-08-20 08:00:00.000000'),
       (DEFAULT, 941, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-20 02:00:00.000000', '2025-08-20 02:00:00.000000', '2025-08-20 08:00:00.000000'),
       (DEFAULT, 942, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-20 02:00:00.000000', '2025-08-20 02:00:00.000000', '2025-08-20 08:00:00.000000'),
       (DEFAULT, 943, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-20 02:00:00.000000', '2025-08-20 02:00:00.000000', '2025-08-20 08:00:00.000000');

-- 2025-08-20
-- 2025-08-24
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (117, 1, 121, NULL, 'Make main page responsive', 'Make main page responsive', NULL, 'HARD', 'FRONTEND', 'NORMAL', FALSE, '2025-08-20', '2025-08-24', '2025-08-24', '2025-08-20 08:00:00.000000', '2025-08-20 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (944, 117, 1, 'JOINED', '2025-08-20 08:00:00.000000'),
       (945, 117, 3, 'JOINED', '2025-08-20 08:00:00.000000'),
       (946, 117, 5, 'JOINED', '2025-08-20 08:00:00.000000'),
       (947, 117, 7, 'JOINED', '2025-08-20 08:00:00.000000'),
       (948, 117, 31, 'JOINED', '2025-08-20 08:00:00.000000'),
       (949, 117, 33, 'JOINED', '2025-08-20 08:00:00.000000'),
       (950, 117, 35, 'JOINED', '2025-08-20 08:00:00.000000'),
       (951, 117, 37, 'JOINED', '2025-08-20 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 944, 'Employee 1 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-24 03:12:00.000000', '2025-08-24 03:12:00.000000', '2025-08-24 08:00:00.000000'),
       (DEFAULT, 945, 'Employee 3 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-24 03:12:00.000000', '2025-08-24 03:12:00.000000', '2025-08-24 08:00:00.000000'),
       (DEFAULT, 946, 'Employee 5 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-24 03:12:00.000000', '2025-08-24 03:12:00.000000', '2025-08-24 08:00:00.000000'),
       (DEFAULT, 947, 'Employee 7 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-24 03:12:00.000000', '2025-08-24 03:12:00.000000', '2025-08-24 08:00:00.000000'),
       (DEFAULT, 948, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-24 03:12:00.000000', '2025-08-24 03:12:00.000000', '2025-08-24 08:00:00.000000'),
       (DEFAULT, 949, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-24 03:12:00.000000', '2025-08-24 03:12:00.000000', '2025-08-24 08:00:00.000000'),
       (DEFAULT, 950, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-24 03:12:00.000000', '2025-08-24 03:12:00.000000', '2025-08-24 08:00:00.000000'),
       (DEFAULT, 951, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-24 03:12:00.000000', '2025-08-24 03:12:00.000000', '2025-08-24 08:00:00.000000');

-- 2025-08-24
-- 2025-08-31
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (118, 1, 121, NULL, 'Make task page responsive', 'Make task page responsive', NULL, 'ADVANCED', 'FRONTEND', 'NORMAL', FALSE, '2025-08-24', '2025-08-31', '2025-08-31', '2025-08-24 08:00:00.000000', '2025-08-24 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (952, 118, 9, 'JOINED', '2025-08-24 08:00:00.000000'),
       (953, 118, 11, 'JOINED', '2025-08-24 08:00:00.000000'),
       (954, 118, 13, 'JOINED', '2025-08-24 08:00:00.000000'),
       (955, 118, 39, 'JOINED', '2025-08-24 08:00:00.000000'),
       (956, 118, 41, 'JOINED', '2025-08-24 08:00:00.000000'),
       (957, 118, 43, 'JOINED', '2025-08-24 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 952, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-30 23:36:00.000000', '2025-08-30 23:36:00.000000', '2025-08-31 08:00:00.000000'),
       (DEFAULT, 953, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-30 23:36:00.000000', '2025-08-30 23:36:00.000000', '2025-08-31 08:00:00.000000'),
       (DEFAULT, 954, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-30 23:36:00.000000', '2025-08-30 23:36:00.000000', '2025-08-31 08:00:00.000000'),
       (DEFAULT, 955, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-30 23:36:00.000000', '2025-08-30 23:36:00.000000', '2025-08-31 08:00:00.000000'),
       (DEFAULT, 956, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-30 23:36:00.000000', '2025-08-30 23:36:00.000000', '2025-08-31 08:00:00.000000'),
       (DEFAULT, 957, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-30 23:36:00.000000', '2025-08-30 23:36:00.000000', '2025-08-31 08:00:00.000000');

-- 2025-08-31
-- 2025-09-06
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (119, 1, 121, NULL, 'Add dark mode toggle', 'Add dark mode toggle', NULL, 'NORMAL', 'FRONTEND', 'NORMAL', FALSE, '2025-08-31', '2025-09-06', '2025-09-06', '2025-08-31 08:00:00.000000', '2025-08-31 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (958, 119, 15, 'JOINED', '2025-08-31 08:00:00.000000'),
       (959, 119, 17, 'JOINED', '2025-08-31 08:00:00.000000'),
       (960, 119, 19, 'JOINED', '2025-08-31 08:00:00.000000'),
       (961, 119, 21, 'JOINED', '2025-08-31 08:00:00.000000'),
       (962, 119, 45, 'JOINED', '2025-08-31 08:00:00.000000'),
       (963, 119, 47, 'JOINED', '2025-08-31 08:00:00.000000'),
       (964, 119, 49, 'JOINED', '2025-08-31 08:00:00.000000'),
       (965, 119, 51, 'JOINED', '2025-08-31 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 958, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-06 00:48:00.000000', '2025-09-06 00:48:00.000000', '2025-09-06 08:00:00.000000'),
       (DEFAULT, 959, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-06 00:48:00.000000', '2025-09-06 00:48:00.000000', '2025-09-06 08:00:00.000000'),
       (DEFAULT, 960, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-06 00:48:00.000000', '2025-09-06 00:48:00.000000', '2025-09-06 08:00:00.000000'),
       (DEFAULT, 961, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-06 00:48:00.000000', '2025-09-06 00:48:00.000000', '2025-09-06 08:00:00.000000'),
       (DEFAULT, 962, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-06 00:48:00.000000', '2025-09-06 00:48:00.000000', '2025-09-06 08:00:00.000000'),
       (DEFAULT, 963, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-06 00:48:00.000000', '2025-09-06 00:48:00.000000', '2025-09-06 08:00:00.000000'),
       (DEFAULT, 964, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-06 00:48:00.000000', '2025-09-06 00:48:00.000000', '2025-09-06 08:00:00.000000'),
       (DEFAULT, 965, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-06 00:48:00.000000', '2025-09-06 00:48:00.000000', '2025-09-06 08:00:00.000000');

-- 2025-09-06
-- 2025-09-11
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (120, 1, 121, NULL, 'Optimize mobile UI', 'Optimize mobile UI', NULL, 'LIGHT', 'FRONTEND', 'NORMAL', FALSE, '2025-09-06', '2025-09-11', '2025-09-11', '2025-09-06 08:00:00.000000', '2025-09-06 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (966, 120, 23, 'JOINED', '2025-09-06 08:00:00.000000'),
       (967, 120, 25, 'JOINED', '2025-09-06 08:00:00.000000'),
       (968, 120, 27, 'JOINED', '2025-09-06 08:00:00.000000'),
       (969, 120, 53, 'JOINED', '2025-09-06 08:00:00.000000'),
       (970, 120, 55, 'JOINED', '2025-09-06 08:00:00.000000'),
       (971, 120, 57, 'JOINED', '2025-09-06 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 966, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-11 02:00:00.000000', '2025-09-11 02:00:00.000000', '2025-09-11 08:00:00.000000'),
       (DEFAULT, 967, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-11 02:00:00.000000', '2025-09-11 02:00:00.000000', '2025-09-11 08:00:00.000000'),
       (DEFAULT, 968, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-11 02:00:00.000000', '2025-09-11 02:00:00.000000', '2025-09-11 08:00:00.000000'),
       (DEFAULT, 969, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-11 02:00:00.000000', '2025-09-11 02:00:00.000000', '2025-09-11 08:00:00.000000'),
       (DEFAULT, 970, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-11 02:00:00.000000', '2025-09-11 02:00:00.000000', '2025-09-11 08:00:00.000000'),
       (DEFAULT, 971, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-11 02:00:00.000000', '2025-09-11 02:00:00.000000', '2025-09-11 08:00:00.000000');

-- 2025-09-11
-- 2025-09-15
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (121, 1, 121, NULL, 'Prepare production config', 'Prepare production config', NULL, 'HARD', 'BACKEND', 'NORMAL', FALSE, '2025-09-11', '2025-09-15', '2025-09-15', '2025-09-11 08:00:00.000000', '2025-09-11 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (972, 121, 2, 'JOINED', '2025-09-11 08:00:00.000000'),
       (973, 121, 4, 'JOINED', '2025-09-11 08:00:00.000000'),
       (974, 121, 6, 'JOINED', '2025-09-11 08:00:00.000000'),
       (975, 121, 32, 'JOINED', '2025-09-11 08:00:00.000000'),
       (976, 121, 34, 'JOINED', '2025-09-11 08:00:00.000000'),
       (977, 121, 36, 'JOINED', '2025-09-11 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 972, 'Employee 2 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-15 08:00:00.000000', '2025-09-15 08:00:00.000000', '2025-09-15 08:00:00.000000'),
       (DEFAULT, 973, 'Employee 4 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-15 08:00:00.000000', '2025-09-15 08:00:00.000000', '2025-09-15 08:00:00.000000'),
       (DEFAULT, 974, 'Employee 6 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-15 08:00:00.000000', '2025-09-15 08:00:00.000000', '2025-09-15 08:00:00.000000'),
       (DEFAULT, 975, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-15 08:00:00.000000', '2025-09-15 08:00:00.000000', '2025-09-15 08:00:00.000000'),
       (DEFAULT, 976, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-15 08:00:00.000000', '2025-09-15 08:00:00.000000', '2025-09-15 08:00:00.000000'),
       (DEFAULT, 977, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-15 08:00:00.000000', '2025-09-15 08:00:00.000000', '2025-09-15 08:00:00.000000');

-- 2025-09-15
-- 2025-09-22
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (122, 1, 121, NULL, 'Dockerize backend service', 'Dockerize backend service', NULL, 'ADVANCED', 'BACKEND', 'NORMAL', FALSE, '2025-09-15', '2025-09-22', '2025-09-22', '2025-09-15 08:00:00.000000', '2025-09-15 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (978, 122, 8, 'JOINED', '2025-09-15 08:00:00.000000'),
       (979, 122, 10, 'JOINED', '2025-09-15 08:00:00.000000'),
       (980, 122, 12, 'JOINED', '2025-09-15 08:00:00.000000'),
       (981, 122, 14, 'JOINED', '2025-09-15 08:00:00.000000'),
       (982, 122, 38, 'JOINED', '2025-09-15 08:00:00.000000'),
       (983, 122, 40, 'JOINED', '2025-09-15 08:00:00.000000'),
       (984, 122, 42, 'JOINED', '2025-09-15 08:00:00.000000'),
       (985, 122, 44, 'JOINED', '2025-09-15 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 978, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-22 08:00:00.000000', '2025-09-22 08:00:00.000000', '2025-09-22 08:00:00.000000'),
       (DEFAULT, 979, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-22 08:00:00.000000', '2025-09-22 08:00:00.000000', '2025-09-22 08:00:00.000000'),
       (DEFAULT, 980, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-22 08:00:00.000000', '2025-09-22 08:00:00.000000', '2025-09-22 08:00:00.000000'),
       (DEFAULT, 981, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-22 08:00:00.000000', '2025-09-22 08:00:00.000000', '2025-09-22 08:00:00.000000'),
       (DEFAULT, 982, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-22 08:00:00.000000', '2025-09-22 08:00:00.000000', '2025-09-22 08:00:00.000000'),
       (DEFAULT, 983, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-22 08:00:00.000000', '2025-09-22 08:00:00.000000', '2025-09-22 08:00:00.000000'),
       (DEFAULT, 984, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-22 08:00:00.000000', '2025-09-22 08:00:00.000000', '2025-09-22 08:00:00.000000'),
       (DEFAULT, 985, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-22 08:00:00.000000', '2025-09-22 08:00:00.000000', '2025-09-22 08:00:00.000000');

-- 2025-09-22
-- 2025-09-28
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (123, 1, 121, NULL, 'Write deployment script', 'Write deployment script', NULL, 'NORMAL', 'BACKEND', 'NORMAL', FALSE, '2025-09-22', '2025-09-28', '2025-09-28', '2025-09-22 08:00:00.000000', '2025-09-22 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (986, 123, 16, 'JOINED', '2025-09-22 08:00:00.000000'),
       (987, 123, 18, 'JOINED', '2025-09-22 08:00:00.000000'),
       (988, 123, 20, 'JOINED', '2025-09-22 08:00:00.000000'),
       (989, 123, 46, 'JOINED', '2025-09-22 08:00:00.000000'),
       (990, 123, 48, 'JOINED', '2025-09-22 08:00:00.000000'),
       (991, 123, 50, 'JOINED', '2025-09-22 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 986, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-28 08:00:00.000000', '2025-09-28 08:00:00.000000', '2025-09-28 08:00:00.000000'),
       (DEFAULT, 987, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-28 08:00:00.000000', '2025-09-28 08:00:00.000000', '2025-09-28 08:00:00.000000'),
       (DEFAULT, 988, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-28 08:00:00.000000', '2025-09-28 08:00:00.000000', '2025-09-28 08:00:00.000000'),
       (DEFAULT, 989, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-28 08:00:00.000000', '2025-09-28 08:00:00.000000', '2025-09-28 08:00:00.000000'),
       (DEFAULT, 990, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-28 08:00:00.000000', '2025-09-28 08:00:00.000000', '2025-09-28 08:00:00.000000'),
       (DEFAULT, 991, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-28 08:00:00.000000', '2025-09-28 08:00:00.000000', '2025-09-28 08:00:00.000000');

-- 2025-09-28
-- 2025-10-03
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (124, 1, 121, NULL, 'Refactor service rest layers', 'Refactor service rest layers', NULL, 'LIGHT', 'BACKEND', 'NORMAL', FALSE, '2025-09-28', '2025-10-03', '2025-10-03', '2025-09-28 08:00:00.000000', '2025-09-28 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (992, 124, 22, 'JOINED', '2025-09-28 08:00:00.000000'),
       (993, 124, 24, 'JOINED', '2025-09-28 08:00:00.000000'),
       (994, 124, 26, 'JOINED', '2025-09-28 08:00:00.000000'),
       (995, 124, 28, 'JOINED', '2025-09-28 08:00:00.000000'),
       (996, 124, 52, 'JOINED', '2025-09-28 08:00:00.000000'),
       (997, 124, 54, 'JOINED', '2025-09-28 08:00:00.000000'),
       (998, 124, 56, 'JOINED', '2025-09-28 08:00:00.000000'),
       (999, 124, 58, 'JOINED', '2025-09-28 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 992, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-03 08:00:00.000000', '2025-10-03 08:00:00.000000', '2025-10-03 08:00:00.000000'),
       (DEFAULT, 993, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-03 08:00:00.000000', '2025-10-03 08:00:00.000000', '2025-10-03 08:00:00.000000'),
       (DEFAULT, 994, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-03 08:00:00.000000', '2025-10-03 08:00:00.000000', '2025-10-03 08:00:00.000000'),
       (DEFAULT, 995, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-03 08:00:00.000000', '2025-10-03 08:00:00.000000', '2025-10-03 08:00:00.000000'),
       (DEFAULT, 996, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-03 08:00:00.000000', '2025-10-03 08:00:00.000000', '2025-10-03 08:00:00.000000'),
       (DEFAULT, 997, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-03 08:00:00.000000', '2025-10-03 08:00:00.000000', '2025-10-03 08:00:00.000000'),
       (DEFAULT, 998, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-03 08:00:00.000000', '2025-10-03 08:00:00.000000', '2025-10-03 08:00:00.000000'),
       (DEFAULT, 999, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-03 08:00:00.000000', '2025-10-03 08:00:00.000000', '2025-10-03 08:00:00.000000');

-- 2025-10-03
-- 2025-10-07
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (125, 1, 121, NULL, 'Create shared icon set', 'Create shared icon set', NULL, 'HARD', 'FRONTEND', 'NORMAL', FALSE, '2025-10-03', '2025-10-07', '2025-10-07', '2025-10-03 08:00:00.000000', '2025-10-03 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (1000, 125, 1, 'JOINED', '2025-10-03 08:00:00.000000'),
       (1001, 125, 3, 'JOINED', '2025-10-03 08:00:00.000000'),
       (1002, 125, 5, 'JOINED', '2025-10-03 08:00:00.000000'),
       (1003, 125, 7, 'JOINED', '2025-10-03 08:00:00.000000'),
       (1004, 125, 31, 'JOINED', '2025-10-03 08:00:00.000000'),
       (1005, 125, 33, 'JOINED', '2025-10-03 08:00:00.000000'),
       (1006, 125, 35, 'JOINED', '2025-10-03 08:00:00.000000'),
       (1007, 125, 37, 'JOINED', '2025-10-03 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 1000, 'Employee 1 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-07 08:00:00.000000', '2025-10-07 08:00:00.000000', '2025-10-07 08:00:00.000000'),
       (DEFAULT, 1001, 'Employee 3 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-07 08:00:00.000000', '2025-10-07 08:00:00.000000', '2025-10-07 08:00:00.000000'),
       (DEFAULT, 1002, 'Employee 5 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-07 08:00:00.000000', '2025-10-07 08:00:00.000000', '2025-10-07 08:00:00.000000'),
       (DEFAULT, 1003, 'Employee 7 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-07 08:00:00.000000', '2025-10-07 08:00:00.000000', '2025-10-07 08:00:00.000000'),
       (DEFAULT, 1004, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-07 08:00:00.000000', '2025-10-07 08:00:00.000000', '2025-10-07 08:00:00.000000'),
       (DEFAULT, 1005, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-07 08:00:00.000000', '2025-10-07 08:00:00.000000', '2025-10-07 08:00:00.000000'),
       (DEFAULT, 1006, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-07 08:00:00.000000', '2025-10-07 08:00:00.000000', '2025-10-07 08:00:00.000000'),
       (DEFAULT, 1007, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-07 08:00:00.000000', '2025-10-07 08:00:00.000000', '2025-10-07 08:00:00.000000');

-- 2025-10-07
-- 2025-10-14
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (126, 1, 121, NULL, 'Build color theme', 'Build color theme', NULL, 'ADVANCED', 'FRONTEND', 'NORMAL', FALSE, '2025-10-07', '2025-10-14', '2025-10-14', '2025-10-07 08:00:00.000000', '2025-10-07 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (1008, 126, 9, 'JOINED', '2025-10-07 08:00:00.000000'),
       (1009, 126, 11, 'JOINED', '2025-10-07 08:00:00.000000'),
       (1010, 126, 13, 'JOINED', '2025-10-07 08:00:00.000000'),
       (1011, 126, 39, 'JOINED', '2025-10-07 08:00:00.000000'),
       (1012, 126, 41, 'JOINED', '2025-10-07 08:00:00.000000'),
       (1013, 126, 43, 'JOINED', '2025-10-07 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 1008, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-14 08:00:00.000000', '2025-10-14 08:00:00.000000', '2025-10-14 08:00:00.000000'),
       (DEFAULT, 1009, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-14 08:00:00.000000', '2025-10-14 08:00:00.000000', '2025-10-14 08:00:00.000000'),
       (DEFAULT, 1010, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-14 08:00:00.000000', '2025-10-14 08:00:00.000000', '2025-10-14 08:00:00.000000'),
       (DEFAULT, 1011, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-14 08:00:00.000000', '2025-10-14 08:00:00.000000', '2025-10-14 08:00:00.000000'),
       (DEFAULT, 1012, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-14 08:00:00.000000', '2025-10-14 08:00:00.000000', '2025-10-14 08:00:00.000000'),
       (DEFAULT, 1013, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-14 08:00:00.000000', '2025-10-14 08:00:00.000000', '2025-10-14 08:00:00.000000');

-- 2025-10-14
-- 2025-10-20
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (127, 1, 121, NULL, 'Define typography scale', 'Define typography scale', NULL, 'NORMAL', 'FRONTEND', 'NORMAL', FALSE, '2025-10-14', '2025-10-20', '2025-10-20', '2025-10-14 08:00:00.000000', '2025-10-14 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (1014, 127, 15, 'JOINED', '2025-10-14 08:00:00.000000'),
       (1015, 127, 17, 'JOINED', '2025-10-14 08:00:00.000000'),
       (1016, 127, 19, 'JOINED', '2025-10-14 08:00:00.000000'),
       (1017, 127, 21, 'JOINED', '2025-10-14 08:00:00.000000'),
       (1018, 127, 45, 'JOINED', '2025-10-14 08:00:00.000000'),
       (1019, 127, 47, 'JOINED', '2025-10-14 08:00:00.000000'),
       (1020, 127, 49, 'JOINED', '2025-10-14 08:00:00.000000'),
       (1021, 127, 51, 'JOINED', '2025-10-14 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 1014, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-20 08:00:00.000000', '2025-10-20 08:00:00.000000', '2025-10-20 08:00:00.000000'),
       (DEFAULT, 1015, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-20 08:00:00.000000', '2025-10-20 08:00:00.000000', '2025-10-20 08:00:00.000000'),
       (DEFAULT, 1016, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-20 08:00:00.000000', '2025-10-20 08:00:00.000000', '2025-10-20 08:00:00.000000'),
       (DEFAULT, 1017, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-20 08:00:00.000000', '2025-10-20 08:00:00.000000', '2025-10-20 08:00:00.000000'),
       (DEFAULT, 1018, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-20 08:00:00.000000', '2025-10-20 08:00:00.000000', '2025-10-20 08:00:00.000000'),
       (DEFAULT, 1019, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-20 08:00:00.000000', '2025-10-20 08:00:00.000000', '2025-10-20 08:00:00.000000'),
       (DEFAULT, 1020, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-20 08:00:00.000000', '2025-10-20 08:00:00.000000', '2025-10-20 08:00:00.000000'),
       (DEFAULT, 1021, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-20 08:00:00.000000', '2025-10-20 08:00:00.000000', '2025-10-20 08:00:00.000000');

-- 2025-10-20
-- 2025-10-25
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (128, 1, 121, NULL, 'Add UI tests with Cypress', 'Add UI tests with Cypress', NULL, 'LIGHT', 'FRONTEND', 'NORMAL', FALSE, '2025-10-20', '2025-10-25', '2025-10-25', '2025-10-20 08:00:00.000000', '2025-10-20 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (1022, 128, 23, 'JOINED', '2025-10-20 08:00:00.000000'),
       (1023, 128, 25, 'JOINED', '2025-10-20 08:00:00.000000'),
       (1024, 128, 27, 'JOINED', '2025-10-20 08:00:00.000000'),
       (1025, 128, 53, 'JOINED', '2025-10-20 08:00:00.000000'),
       (1026, 128, 55, 'JOINED', '2025-10-20 08:00:00.000000'),
       (1027, 128, 57, 'JOINED', '2025-10-20 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 1022, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-25 08:00:00.000000', '2025-10-25 08:00:00.000000', '2025-10-25 08:00:00.000000'),
       (DEFAULT, 1023, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-25 08:00:00.000000', '2025-10-25 08:00:00.000000', '2025-10-25 08:00:00.000000'),
       (DEFAULT, 1024, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-25 08:00:00.000000', '2025-10-25 08:00:00.000000', '2025-10-25 08:00:00.000000'),
       (DEFAULT, 1025, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-25 08:00:00.000000', '2025-10-25 08:00:00.000000', '2025-10-25 08:00:00.000000'),
       (DEFAULT, 1026, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-25 08:00:00.000000', '2025-10-25 08:00:00.000000', '2025-10-25 08:00:00.000000'),
       (DEFAULT, 1027, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-25 08:00:00.000000', '2025-10-25 08:00:00.000000', '2025-10-25 08:00:00.000000');

ALTER TABLE project AUTO_INCREMENT = 2;
ALTER TABLE project_role AUTO_INCREMENT = 3;
ALTER TABLE `phase` AUTO_INCREMENT = 2;
ALTER TABLE collection AUTO_INCREMENT = 2;
ALTER TABLE task AUTO_INCREMENT = 129;
ALTER TABLE task_for_users AUTO_INCREMENT = 1028;INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
                                                 VALUES (1, 1, FRONTEND, HARD, URGENT, 1, 0.5, 1, 1),
                                                        (2, 1, FRONTEND, HARD, URGENT, 1, 0.45, 1, 1),
                                                        (3, 1, FRONTEND, HARD, URGENT, 1, 0.4, 1, 1),
                                                        (4, 1, FRONTEND, HARD, URGENT, 1, 0.35, 1, 1),
                                                        (5, 1, FRONTEND, HARD, URGENT, 1, 0.3, 1, 1),
                                                        (6, 1, FRONTEND, HARD, URGENT, 1, 0.25, 1, 1),
                                                        (7, 1, FRONTEND, HARD, URGENT, 1, 0.2, 1, 1),
                                                        (8, 1, FRONTEND, HARD, URGENT, 1, 0.15, 1, 1),
                                                        (9, 1, FRONTEND, HARD, URGENT, 1, 0.1, 1, 1),
                                                        (10, 1, FRONTEND, HARD, URGENT, 1, 0.05, 1, 1),
                                                        (11, 1, FRONTEND, HARD, URGENT, 1, 0, 1, 1),
                                                        (12, 2, BACKEND, HARD, URGENT, 1, 0.5, 1, 1),
                                                        (13, 2, BACKEND, HARD, URGENT, 1, 0.45, 1, 1),
                                                        (14, 2, BACKEND, HARD, URGENT, 1, 0.4, 1, 1),
                                                        (15, 2, BACKEND, HARD, URGENT, 1, 0.35, 1, 1),
                                                        (16, 2, BACKEND, HARD, URGENT, 1, 0.3, 1, 1),
                                                        (17, 2, BACKEND, ADVANCED, URGENT, 1, 0.25, 1, 1),
                                                        (18, 2, BACKEND, ADVANCED, URGENT, 1, 0.2, 1, 1),
                                                        (19, 2, BACKEND, ADVANCED, URGENT, 1, 0.15, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (20, 2, BACKEND, ADVANCED, URGENT, 1, 0.1, 1, 1),
       (21, 2, BACKEND, ADVANCED, URGENT, 1, 0.05, 1, 1),
       (22, 2, BACKEND, ADVANCED, URGENT, 1, 0, 1, 1),
       (23, 3, FRONTEND, ADVANCED, URGENT, 1, 0.5, 1, 1),
       (24, 3, FRONTEND, ADVANCED, URGENT, 1, 0.45, 1, 1),
       (25, 3, FRONTEND, ADVANCED, URGENT, 1, 0.4, 1, 1),
       (26, 3, FRONTEND, ADVANCED, URGENT, 1, 0.35, 1, 1),
       (27, 3, FRONTEND, ADVANCED, URGENT, 1, 0.3, 1, 1),
       (28, 3, FRONTEND, ADVANCED, URGENT, 1, 0.25, 1, 1),
       (29, 3, FRONTEND, ADVANCED, URGENT, 1, 0.2, 1, 1),
       (30, 3, FRONTEND, ADVANCED, URGENT, 1, 0.15, 1, 1),
       (31, 3, FRONTEND, ADVANCED, URGENT, 1, 0.1, 1, 1),
       (32, 3, FRONTEND, ADVANCED, URGENT, 1, 0.05, 1, 1),
       (33, 3, FRONTEND, ADVANCED, URGENT, 1, 0, 1, 1),
       (34, 4, BACKEND, ADVANCED, URGENT, 1, 0.5, 1, 1),
       (35, 4, BACKEND, ADVANCED, URGENT, 1, 0.45, 1, 1),
       (36, 4, BACKEND, ADVANCED, URGENT, 1, 0.4, 1, 1),
       (37, 4, BACKEND, ADVANCED, URGENT, 1, 0.35, 1, 1),
       (38, 4, BACKEND, ADVANCED, URGENT, 1, 0.3, 1, 1),
       (39, 4, BACKEND, NORMAL, URGENT, 1, 0.25, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (40, 4, BACKEND, NORMAL, URGENT, 1, 0.2, 1, 1),
       (41, 4, BACKEND, NORMAL, URGENT, 1, 0.15, 1, 1),
       (42, 4, BACKEND, NORMAL, URGENT, 1, 0.1, 1, 1),
       (43, 4, BACKEND, NORMAL, URGENT, 1, 0.05, 1, 1),
       (44, 4, BACKEND, NORMAL, URGENT, 1, 0, 1, 1),
       (45, 5, FRONTEND, NORMAL, URGENT, 1, 0.5, 1, 1),
       (46, 5, FRONTEND, NORMAL, URGENT, 1, 0.45, 1, 1),
       (47, 5, FRONTEND, NORMAL, URGENT, 1, 0.4, 1, 1),
       (48, 5, FRONTEND, NORMAL, URGENT, 1, 0.35, 1, 1),
       (49, 5, FRONTEND, NORMAL, URGENT, 1, 0.3, 1, 1),
       (50, 5, FRONTEND, NORMAL, URGENT, 1, 0.25, 1, 1),
       (51, 5, FRONTEND, NORMAL, URGENT, 1, 0.2, 1, 1),
       (52, 5, FRONTEND, NORMAL, URGENT, 1, 0.15, 1, 1),
       (53, 5, FRONTEND, NORMAL, URGENT, 1, 0.1, 1, 1),
       (54, 5, FRONTEND, NORMAL, URGENT, 1, 0.05, 1, 1),
       (55, 5, FRONTEND, NORMAL, URGENT, 1, 0, 1, 1),
       (56, 6, BACKEND, NORMAL, URGENT, 1, 0.5, 1, 1),
       (57, 6, BACKEND, NORMAL, URGENT, 1, 0.45, 1, 1),
       (58, 6, BACKEND, NORMAL, URGENT, 1, 0.4, 1, 1),
       (59, 6, BACKEND, NORMAL, URGENT, 1, 0.35, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (60, 6, BACKEND, NORMAL, URGENT, 1, 0.3, 1, 1),
       (61, 6, BACKEND, LIGHT, URGENT, 1, 0.25, 1, 1),
       (62, 6, BACKEND, LIGHT, URGENT, 1, 0.2, 1, 1),
       (63, 6, BACKEND, LIGHT, URGENT, 1, 0.15, 1, 1),
       (64, 6, BACKEND, LIGHT, URGENT, 1, 0.1, 1, 1),
       (65, 6, BACKEND, LIGHT, URGENT, 1, 0.05, 1, 1),
       (66, 6, BACKEND, LIGHT, URGENT, 1, 0, 1, 1),
       (67, 7, FRONTEND, LIGHT, URGENT, 1, 0.5, 1, 1),
       (68, 7, FRONTEND, LIGHT, URGENT, 1, 0.45, 1, 1),
       (69, 7, FRONTEND, LIGHT, URGENT, 1, 0.4, 1, 1),
       (70, 7, FRONTEND, LIGHT, URGENT, 1, 0.35, 1, 1),
       (71, 7, FRONTEND, LIGHT, URGENT, 1, 0.3, 1, 1),
       (72, 7, FRONTEND, LIGHT, URGENT, 1, 0.25, 1, 1),
       (73, 7, FRONTEND, LIGHT, URGENT, 1, 0.2, 1, 1),
       (74, 7, FRONTEND, LIGHT, URGENT, 1, 0.15, 1, 1),
       (75, 7, FRONTEND, LIGHT, URGENT, 1, 0.1, 1, 1),
       (76, 7, FRONTEND, LIGHT, URGENT, 1, 0.05, 1, 1),
       (77, 7, FRONTEND, LIGHT, URGENT, 1, 0, 1, 1),
       (78, 8, BACKEND, HARD, HIGH, 1, 0.5, 1, 1),
       (79, 8, BACKEND, HARD, HIGH, 1, 0.45, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (80, 8, BACKEND, HARD, HIGH, 1, 0.4, 1, 1),
       (81, 8, BACKEND, HARD, HIGH, 1, 0.35, 1, 1),
       (82, 8, BACKEND, HARD, HIGH, 1, 0.3, 1, 1),
       (83, 8, BACKEND, HARD, HIGH, 1, 0.25, 1, 1),
       (84, 8, BACKEND, HARD, HIGH, 1, 0.2, 1, 1),
       (85, 8, BACKEND, HARD, HIGH, 1, 0.15, 1, 1),
       (86, 8, BACKEND, HARD, HIGH, 1, 0.1, 1, 1),
       (87, 8, BACKEND, HARD, HIGH, 1, 0.05, 1, 1),
       (88, 8, BACKEND, HARD, HIGH, 1, 0, 1, 1),
       (89, 9, FRONTEND, HARD, HIGH, 1, 0.5, 1, 1),
       (90, 9, FRONTEND, HARD, HIGH, 1, 0.45, 1, 1),
       (91, 9, FRONTEND, HARD, HIGH, 1, 0.4, 1, 1),
       (92, 9, FRONTEND, HARD, HIGH, 1, 0.35, 1, 1),
       (93, 9, FRONTEND, HARD, HIGH, 1, 0.3, 1, 1),
       (94, 9, FRONTEND, ADVANCED, HIGH, 1, 0.25, 1, 1),
       (95, 9, FRONTEND, ADVANCED, HIGH, 1, 0.2, 1, 1),
       (96, 9, FRONTEND, ADVANCED, HIGH, 1, 0.15, 1, 1),
       (97, 9, FRONTEND, ADVANCED, HIGH, 1, 0.1, 1, 1),
       (98, 9, FRONTEND, ADVANCED, HIGH, 1, 0.05, 1, 1),
       (99, 9, FRONTEND, ADVANCED, HIGH, 1, 0, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (100, 10, BACKEND, ADVANCED, HIGH, 1, 0.5, 1, 1),
       (101, 10, BACKEND, ADVANCED, HIGH, 1, 0.45, 1, 1),
       (102, 10, BACKEND, ADVANCED, HIGH, 1, 0.4, 1, 1),
       (103, 10, BACKEND, ADVANCED, HIGH, 1, 0.35, 1, 1),
       (104, 10, BACKEND, ADVANCED, HIGH, 1, 0.3, 1, 1),
       (105, 10, BACKEND, ADVANCED, HIGH, 1, 0.25, 1, 1),
       (106, 10, BACKEND, ADVANCED, HIGH, 1, 0.2, 1, 1),
       (107, 10, BACKEND, ADVANCED, HIGH, 1, 0.15, 1, 1),
       (108, 10, BACKEND, ADVANCED, HIGH, 1, 0.1, 1, 1),
       (109, 10, BACKEND, ADVANCED, HIGH, 1, 0.05, 1, 1),
       (110, 10, BACKEND, ADVANCED, HIGH, 1, 0, 1, 1),
       (111, 11, FRONTEND, ADVANCED, HIGH, 1, 0.5, 1, 1),
       (112, 11, FRONTEND, ADVANCED, HIGH, 1, 0.45, 1, 1),
       (113, 11, FRONTEND, ADVANCED, HIGH, 1, 0.4, 1, 1),
       (114, 11, FRONTEND, ADVANCED, HIGH, 1, 0.35, 1, 1),
       (115, 11, FRONTEND, ADVANCED, HIGH, 1, 0.3, 1, 1),
       (116, 11, FRONTEND, NORMAL, HIGH, 1, 0.25, 1, 1),
       (117, 11, FRONTEND, NORMAL, HIGH, 1, 0.2, 1, 1),
       (118, 11, FRONTEND, NORMAL, HIGH, 1, 0.15, 1, 1),
       (119, 11, FRONTEND, NORMAL, HIGH, 1, 0.1, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (120, 11, FRONTEND, NORMAL, HIGH, 1, 0.05, 1, 1),
       (121, 11, FRONTEND, NORMAL, HIGH, 1, 0, 1, 1),
       (122, 12, BACKEND, NORMAL, HIGH, 1, 0.5, 1, 1),
       (123, 12, BACKEND, NORMAL, HIGH, 1, 0.45, 1, 1),
       (124, 12, BACKEND, NORMAL, HIGH, 1, 0.4, 1, 1),
       (125, 12, BACKEND, NORMAL, HIGH, 1, 0.35, 1, 1),
       (126, 12, BACKEND, NORMAL, HIGH, 1, 0.3, 1, 1),
       (127, 12, BACKEND, NORMAL, HIGH, 1, 0.25, 1, 1),
       (128, 12, BACKEND, NORMAL, HIGH, 1, 0.2, 1, 1),
       (129, 12, BACKEND, NORMAL, HIGH, 1, 0.15, 1, 1),
       (130, 12, BACKEND, NORMAL, HIGH, 1, 0.1, 1, 1),
       (131, 12, BACKEND, NORMAL, HIGH, 1, 0.05, 1, 1),
       (132, 12, BACKEND, NORMAL, HIGH, 1, 0, 1, 1),
       (133, 13, FRONTEND, NORMAL, HIGH, 1, 0.5, 1, 1),
       (134, 13, FRONTEND, NORMAL, HIGH, 1, 0.45, 1, 1),
       (135, 13, FRONTEND, NORMAL, HIGH, 1, 0.4, 1, 1),
       (136, 13, FRONTEND, NORMAL, HIGH, 1, 0.35, 1, 1),
       (137, 13, FRONTEND, NORMAL, HIGH, 1, 0.3, 1, 1),
       (138, 13, FRONTEND, LIGHT, HIGH, 1, 0.25, 1, 1),
       (139, 13, FRONTEND, LIGHT, HIGH, 1, 0.2, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (140, 13, FRONTEND, LIGHT, HIGH, 1, 0.15, 1, 1),
       (141, 13, FRONTEND, LIGHT, HIGH, 1, 0.1, 1, 1),
       (142, 13, FRONTEND, LIGHT, HIGH, 1, 0.05, 1, 1),
       (143, 13, FRONTEND, LIGHT, HIGH, 1, 0, 1, 1),
       (144, 14, BACKEND, LIGHT, HIGH, 1, 0.5, 1, 1),
       (145, 14, BACKEND, LIGHT, HIGH, 1, 0.45, 1, 1),
       (146, 14, BACKEND, LIGHT, HIGH, 1, 0.4, 1, 1),
       (147, 14, BACKEND, LIGHT, HIGH, 1, 0.35, 1, 1),
       (148, 14, BACKEND, LIGHT, HIGH, 1, 0.3, 1, 1),
       (149, 14, BACKEND, LIGHT, HIGH, 1, 0.25, 1, 1),
       (150, 14, BACKEND, LIGHT, HIGH, 1, 0.2, 1, 1),
       (151, 14, BACKEND, LIGHT, HIGH, 1, 0.15, 1, 1),
       (152, 14, BACKEND, LIGHT, HIGH, 1, 0.1, 1, 1),
       (153, 14, BACKEND, LIGHT, HIGH, 1, 0.05, 1, 1),
       (154, 14, BACKEND, LIGHT, HIGH, 1, 0, 1, 1),
       (155, 15, FRONTEND, HARD, NORMAL, 1, 0.5, 1, 1),
       (156, 15, FRONTEND, HARD, NORMAL, 1, 0.45, 1, 1),
       (157, 15, FRONTEND, HARD, NORMAL, 1, 0.4, 1, 1),
       (158, 15, FRONTEND, HARD, NORMAL, 1, 0.35, 1, 1),
       (159, 15, FRONTEND, HARD, NORMAL, 1, 0.3, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (160, 15, FRONTEND, HARD, NORMAL, 1, 0.25, 1, 1),
       (161, 15, FRONTEND, HARD, NORMAL, 1, 0.2, 1, 1),
       (162, 15, FRONTEND, HARD, NORMAL, 1, 0.15, 1, 1),
       (163, 15, FRONTEND, HARD, NORMAL, 1, 0.1, 1, 1),
       (164, 15, FRONTEND, HARD, NORMAL, 1, 0.05, 1, 1),
       (165, 15, FRONTEND, HARD, NORMAL, 1, 0, 1, 1),
       (166, 16, BACKEND, HARD, NORMAL, 1, 0.5, 1, 1),
       (167, 16, BACKEND, HARD, NORMAL, 1, 0.45, 1, 1),
       (168, 16, BACKEND, HARD, NORMAL, 1, 0.4, 1, 1),
       (169, 16, BACKEND, HARD, NORMAL, 1, 0.35, 1, 1),
       (170, 16, BACKEND, HARD, NORMAL, 1, 0.3, 1, 1),
       (171, 16, BACKEND, ADVANCED, NORMAL, 1, 0.25, 1, 1),
       (172, 16, BACKEND, ADVANCED, NORMAL, 1, 0.2, 1, 1),
       (173, 16, BACKEND, ADVANCED, NORMAL, 1, 0.15, 1, 1),
       (174, 16, BACKEND, ADVANCED, NORMAL, 1, 0.1, 1, 1),
       (175, 16, BACKEND, ADVANCED, NORMAL, 1, 0.05, 1, 1),
       (176, 16, BACKEND, ADVANCED, NORMAL, 1, 0, 1, 1),
       (177, 17, FRONTEND, ADVANCED, NORMAL, 1, 0.5, 1, 1),
       (178, 17, FRONTEND, ADVANCED, NORMAL, 1, 0.45, 1, 1),
       (179, 17, FRONTEND, ADVANCED, NORMAL, 1, 0.4, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (180, 17, FRONTEND, ADVANCED, NORMAL, 1, 0.35, 1, 1),
       (181, 17, FRONTEND, ADVANCED, NORMAL, 1, 0.3, 1, 1),
       (182, 17, FRONTEND, ADVANCED, NORMAL, 1, 0.25, 1, 1),
       (183, 17, FRONTEND, ADVANCED, NORMAL, 1, 0.2, 1, 1),
       (184, 17, FRONTEND, ADVANCED, NORMAL, 1, 0.15, 1, 1),
       (185, 17, FRONTEND, ADVANCED, NORMAL, 1, 0.1, 1, 1),
       (186, 17, FRONTEND, ADVANCED, NORMAL, 1, 0.05, 1, 1),
       (187, 17, FRONTEND, ADVANCED, NORMAL, 1, 0, 1, 1),
       (188, 18, BACKEND, ADVANCED, NORMAL, 1, 0.5, 1, 1),
       (189, 18, BACKEND, ADVANCED, NORMAL, 1, 0.45, 1, 1),
       (190, 18, BACKEND, ADVANCED, NORMAL, 1, 0.4, 1, 1),
       (191, 18, BACKEND, ADVANCED, NORMAL, 1, 0.35, 1, 1),
       (192, 18, BACKEND, ADVANCED, NORMAL, 1, 0.3, 1, 1),
       (193, 18, BACKEND, NORMAL, NORMAL, 1, 0.25, 1, 1),
       (194, 18, BACKEND, NORMAL, NORMAL, 1, 0.2, 1, 1),
       (195, 18, BACKEND, NORMAL, NORMAL, 1, 0.15, 1, 1),
       (196, 18, BACKEND, NORMAL, NORMAL, 1, 0.1, 1, 1),
       (197, 18, BACKEND, NORMAL, NORMAL, 1, 0.05, 1, 1),
       (198, 18, BACKEND, NORMAL, NORMAL, 1, 0, 1, 1),
       (199, 19, FRONTEND, NORMAL, NORMAL, 1, 0.5, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (200, 19, FRONTEND, NORMAL, NORMAL, 1, 0.45, 1, 1),
       (201, 19, FRONTEND, NORMAL, NORMAL, 1, 0.4, 1, 1),
       (202, 19, FRONTEND, NORMAL, NORMAL, 1, 0.35, 1, 1),
       (203, 19, FRONTEND, NORMAL, NORMAL, 1, 0.3, 1, 1),
       (204, 19, FRONTEND, NORMAL, NORMAL, 1, 0.25, 1, 1),
       (205, 19, FRONTEND, NORMAL, NORMAL, 1, 0.2, 1, 1),
       (206, 19, FRONTEND, NORMAL, NORMAL, 1, 0.15, 1, 1),
       (207, 19, FRONTEND, NORMAL, NORMAL, 1, 0.1, 1, 1),
       (208, 19, FRONTEND, NORMAL, NORMAL, 1, 0.05, 1, 1),
       (209, 19, FRONTEND, NORMAL, NORMAL, 1, 0, 1, 1),
       (210, 20, BACKEND, NORMAL, NORMAL, 1, 0.5, 1, 1),
       (211, 20, BACKEND, NORMAL, NORMAL, 1, 0.45, 1, 1),
       (212, 20, BACKEND, NORMAL, NORMAL, 1, 0.4, 1, 1),
       (213, 20, BACKEND, NORMAL, NORMAL, 1, 0.35, 1, 1),
       (214, 20, BACKEND, NORMAL, NORMAL, 1, 0.3, 1, 1),
       (215, 20, BACKEND, LIGHT, NORMAL, 1, 0.25, 1, 1),
       (216, 20, BACKEND, LIGHT, NORMAL, 1, 0.2, 1, 1),
       (217, 20, BACKEND, LIGHT, NORMAL, 1, 0.15, 1, 1),
       (218, 20, BACKEND, LIGHT, NORMAL, 1, 0.1, 1, 1),
       (219, 20, BACKEND, LIGHT, NORMAL, 1, 0.05, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (220, 20, BACKEND, LIGHT, NORMAL, 1, 0, 1, 1),
       (221, 21, FRONTEND, LIGHT, NORMAL, 1, 0.5, 1, 1),
       (222, 21, FRONTEND, LIGHT, NORMAL, 1, 0.45, 1, 1),
       (223, 21, FRONTEND, LIGHT, NORMAL, 1, 0.4, 1, 1),
       (224, 21, FRONTEND, LIGHT, NORMAL, 1, 0.35, 1, 1),
       (225, 21, FRONTEND, LIGHT, NORMAL, 1, 0.3, 1, 1),
       (226, 21, FRONTEND, LIGHT, NORMAL, 1, 0.25, 1, 1),
       (227, 21, FRONTEND, LIGHT, NORMAL, 1, 0.2, 1, 1),
       (228, 21, FRONTEND, LIGHT, NORMAL, 1, 0.15, 1, 1),
       (229, 21, FRONTEND, LIGHT, NORMAL, 1, 0.1, 1, 1),
       (230, 21, FRONTEND, LIGHT, NORMAL, 1, 0.05, 1, 1),
       (231, 21, FRONTEND, LIGHT, NORMAL, 1, 0, 1, 1),
       (232, 22, BACKEND, HARD, LOW, 1, 0.5, 1, 1),
       (233, 22, BACKEND, HARD, LOW, 1, 0.45, 1, 1),
       (234, 22, BACKEND, HARD, LOW, 1, 0.4, 1, 1),
       (235, 22, BACKEND, HARD, LOW, 1, 0.35, 1, 1),
       (236, 22, BACKEND, HARD, LOW, 1, 0.3, 1, 1),
       (237, 22, BACKEND, HARD, LOW, 1, 0.25, 1, 1),
       (238, 22, BACKEND, HARD, LOW, 1, 0.2, 1, 1),
       (239, 22, BACKEND, HARD, LOW, 1, 0.15, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (240, 22, BACKEND, HARD, LOW, 1, 0.1, 1, 1),
       (241, 22, BACKEND, HARD, LOW, 1, 0.05, 1, 1),
       (242, 22, BACKEND, HARD, LOW, 1, 0, 1, 1),
       (243, 23, FRONTEND, HARD, LOW, 1, 0.5, 1, 1),
       (244, 23, FRONTEND, HARD, LOW, 1, 0.45, 1, 1),
       (245, 23, FRONTEND, HARD, LOW, 1, 0.4, 1, 1),
       (246, 23, FRONTEND, HARD, LOW, 1, 0.35, 1, 1),
       (247, 23, FRONTEND, HARD, LOW, 1, 0.3, 1, 1),
       (248, 23, FRONTEND, ADVANCED, LOW, 1, 0.25, 1, 1),
       (249, 23, FRONTEND, ADVANCED, LOW, 1, 0.2, 1, 1),
       (250, 23, FRONTEND, ADVANCED, LOW, 1, 0.15, 1, 1),
       (251, 23, FRONTEND, ADVANCED, LOW, 1, 0.1, 1, 1),
       (252, 23, FRONTEND, ADVANCED, LOW, 1, 0.05, 1, 1),
       (253, 23, FRONTEND, ADVANCED, LOW, 1, 0, 1, 1),
       (254, 24, BACKEND, ADVANCED, LOW, 1, 0.5, 1, 1),
       (255, 24, BACKEND, ADVANCED, LOW, 1, 0.45, 1, 1),
       (256, 24, BACKEND, ADVANCED, LOW, 1, 0.4, 1, 1),
       (257, 24, BACKEND, ADVANCED, LOW, 1, 0.35, 1, 1),
       (258, 24, BACKEND, ADVANCED, LOW, 1, 0.3, 1, 1),
       (259, 24, BACKEND, ADVANCED, LOW, 1, 0.25, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (260, 24, BACKEND, ADVANCED, LOW, 1, 0.2, 1, 1),
       (261, 24, BACKEND, ADVANCED, LOW, 1, 0.15, 1, 1),
       (262, 24, BACKEND, ADVANCED, LOW, 1, 0.1, 1, 1),
       (263, 24, BACKEND, ADVANCED, LOW, 1, 0.05, 1, 1),
       (264, 24, BACKEND, ADVANCED, LOW, 1, 0, 1, 1),
       (265, 25, FRONTEND, ADVANCED, LOW, 1, 0.5, 1, 1),
       (266, 25, FRONTEND, ADVANCED, LOW, 1, 0.45, 1, 1),
       (267, 25, FRONTEND, ADVANCED, LOW, 1, 0.4, 1, 1),
       (268, 25, FRONTEND, ADVANCED, LOW, 1, 0.35, 1, 1),
       (269, 25, FRONTEND, ADVANCED, LOW, 1, 0.3, 1, 1),
       (270, 25, FRONTEND, NORMAL, LOW, 1, 0.25, 1, 1),
       (271, 25, FRONTEND, NORMAL, LOW, 1, 0.2, 1, 1),
       (272, 25, FRONTEND, NORMAL, LOW, 1, 0.15, 1, 1),
       (273, 25, FRONTEND, NORMAL, LOW, 1, 0.1, 1, 1),
       (274, 25, FRONTEND, NORMAL, LOW, 1, 0.05, 1, 1),
       (275, 25, FRONTEND, NORMAL, LOW, 1, 0, 1, 1),
       (276, 26, BACKEND, NORMAL, LOW, 1, 0.5, 1, 1),
       (277, 26, BACKEND, NORMAL, LOW, 1, 0.45, 1, 1),
       (278, 26, BACKEND, NORMAL, LOW, 1, 0.4, 1, 1),
       (279, 26, BACKEND, NORMAL, LOW, 1, 0.35, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (280, 26, BACKEND, NORMAL, LOW, 1, 0.3, 1, 1),
       (281, 26, BACKEND, NORMAL, LOW, 1, 0.25, 1, 1),
       (282, 26, BACKEND, NORMAL, LOW, 1, 0.2, 1, 1),
       (283, 26, BACKEND, NORMAL, LOW, 1, 0.15, 1, 1),
       (284, 26, BACKEND, NORMAL, LOW, 1, 0.1, 1, 1),
       (285, 26, BACKEND, NORMAL, LOW, 1, 0.05, 1, 1),
       (286, 26, BACKEND, NORMAL, LOW, 1, 0, 1, 1),
       (287, 27, FRONTEND, NORMAL, LOW, 1, 0.5, 1, 1),
       (288, 27, FRONTEND, NORMAL, LOW, 1, 0.45, 1, 1),
       (289, 27, FRONTEND, NORMAL, LOW, 1, 0.4, 1, 1),
       (290, 27, FRONTEND, NORMAL, LOW, 1, 0.35, 1, 1),
       (291, 27, FRONTEND, NORMAL, LOW, 1, 0.3, 1, 1),
       (292, 27, FRONTEND, LIGHT, LOW, 1, 0.25, 1, 1),
       (293, 27, FRONTEND, LIGHT, LOW, 1, 0.2, 1, 1),
       (294, 27, FRONTEND, LIGHT, LOW, 1, 0.15, 1, 1),
       (295, 27, FRONTEND, LIGHT, LOW, 1, 0.1, 1, 1),
       (296, 27, FRONTEND, LIGHT, LOW, 1, 0.05, 1, 1),
       (297, 27, FRONTEND, LIGHT, LOW, 1, 0, 1, 1),
       (298, 28, BACKEND, LIGHT, LOW, 1, 0.5, 1, 1),
       (299, 28, BACKEND, LIGHT, LOW, 1, 0.45, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (300, 28, BACKEND, LIGHT, LOW, 1, 0.4, 1, 1),
       (301, 28, BACKEND, LIGHT, LOW, 1, 0.35, 1, 1),
       (302, 28, BACKEND, LIGHT, LOW, 1, 0.3, 1, 1),
       (303, 28, BACKEND, LIGHT, LOW, 1, 0.25, 1, 1),
       (304, 28, BACKEND, LIGHT, LOW, 1, 0.2, 1, 1),
       (305, 28, BACKEND, LIGHT, LOW, 1, 0.15, 1, 1),
       (306, 28, BACKEND, LIGHT, LOW, 1, 0.1, 1, 1),
       (307, 28, BACKEND, LIGHT, LOW, 1, 0.05, 1, 1),
       (308, 28, BACKEND, LIGHT, LOW, 1, 0, 1, 1),
       (309, 29, FRONTEND, HARD, LOW, 1, 0.5, 1, 1),
       (310, 29, FRONTEND, ADVANCED, NORMAL, 1, 0.45, 1, 1),
       (311, 29, FRONTEND, ADVANCED, NORMAL, 1, 0.4, 1, 1),
       (312, 29, FRONTEND, NORMAL, HIGH, 1, 0.35, 1, 1),
       (313, 29, FRONTEND, NORMAL, HIGH, 1, 0.3, 1, 1),
       (314, 29, FRONTEND, LIGHT, URGENT, 1, 0.25, 1, 1),
       (315, 29, FRONTEND, LIGHT, URGENT, 1, 0.2, 1, 1),
       (316, 29, FRONTEND, HARD, LOW, 1, 0.15, 1, 1),
       (317, 29, FRONTEND, HARD, LOW, 1, 0.1, 1, 1),
       (318, 29, FRONTEND, ADVANCED, NORMAL, 1, 0.05, 1, 1),
       (319, 29, FRONTEND, ADVANCED, NORMAL, 1, 0, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (320, 30, BACKEND, NORMAL, HIGH, 1, 0.5, 1, 1),
       (321, 30, BACKEND, LIGHT, URGENT, 1, 0.45, 1, 1),
       (322, 30, BACKEND, LIGHT, URGENT, 1, 0.4, 1, 1),
       (323, 30, BACKEND, HARD, LOW, 1, 0.35, 1, 1),
       (324, 30, BACKEND, HARD, LOW, 1, 0.3, 1, 1),
       (325, 30, BACKEND, ADVANCED, NORMAL, 1, 0.25, 1, 1),
       (326, 30, BACKEND, ADVANCED, NORMAL, 1, 0.2, 1, 1),
       (327, 30, BACKEND, NORMAL, HIGH, 1, 0.15, 1, 1),
       (328, 30, BACKEND, NORMAL, HIGH, 1, 0.1, 1, 1),
       (329, 30, BACKEND, LIGHT, URGENT, 1, 0.05, 1, 1),
       (330, 30, BACKEND, LIGHT, URGENT, 1, 0, 1, 1),
       (331, 31, FRONTEND, HARD, URGENT, 1, 0.5, 1, 1),
       (332, 31, FRONTEND, HARD, URGENT, 1, 0.45, 1, 1),
       (333, 31, FRONTEND, HARD, URGENT, 1, 0.4, 1, 1),
       (334, 31, FRONTEND, HARD, URGENT, 1, 0.35, 1, 1),
       (335, 31, FRONTEND, HARD, URGENT, 1, 0.3, 1, 1),
       (336, 31, FRONTEND, HARD, URGENT, 1, 0.25, 1, 1),
       (337, 31, FRONTEND, HARD, URGENT, 1, 0.2, 1, 1),
       (338, 31, FRONTEND, HARD, URGENT, 1, 0.15, 1, 1),
       (339, 31, FRONTEND, HARD, URGENT, 1, 0.1, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (340, 31, FRONTEND, HARD, URGENT, 1, 0.05, 1, 1),
       (341, 31, FRONTEND, HARD, URGENT, 1, 0, 1, 1),
       (342, 32, BACKEND, HARD, URGENT, 1, 0.5, 1, 1),
       (343, 32, BACKEND, HARD, URGENT, 1, 0.45, 1, 1),
       (344, 32, BACKEND, HARD, URGENT, 1, 0.4, 1, 1),
       (345, 32, BACKEND, HARD, URGENT, 1, 0.35, 1, 1),
       (346, 32, BACKEND, HARD, URGENT, 1, 0.3, 1, 1),
       (347, 32, BACKEND, ADVANCED, URGENT, 1, 0.25, 1, 1),
       (348, 32, BACKEND, ADVANCED, URGENT, 1, 0.2, 1, 1),
       (349, 32, BACKEND, ADVANCED, URGENT, 1, 0.15, 1, 1),
       (350, 32, BACKEND, ADVANCED, URGENT, 1, 0.1, 1, 1),
       (351, 32, BACKEND, ADVANCED, URGENT, 1, 0.05, 1, 1),
       (352, 32, BACKEND, ADVANCED, URGENT, 1, 0, 1, 1),
       (353, 33, FRONTEND, ADVANCED, URGENT, 1, 0.5, 1, 1),
       (354, 33, FRONTEND, ADVANCED, URGENT, 1, 0.45, 1, 1),
       (355, 33, FRONTEND, ADVANCED, URGENT, 1, 0.4, 1, 1),
       (356, 33, FRONTEND, ADVANCED, URGENT, 1, 0.35, 1, 1),
       (357, 33, FRONTEND, ADVANCED, URGENT, 1, 0.3, 1, 1),
       (358, 33, FRONTEND, ADVANCED, URGENT, 1, 0.25, 1, 1),
       (359, 33, FRONTEND, ADVANCED, URGENT, 1, 0.2, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (360, 33, FRONTEND, ADVANCED, URGENT, 1, 0.15, 1, 1),
       (361, 33, FRONTEND, ADVANCED, URGENT, 1, 0.1, 1, 1),
       (362, 33, FRONTEND, ADVANCED, URGENT, 1, 0.05, 1, 1),
       (363, 33, FRONTEND, ADVANCED, URGENT, 1, 0, 1, 1),
       (364, 34, BACKEND, ADVANCED, URGENT, 1, 0.5, 1, 1),
       (365, 34, BACKEND, ADVANCED, URGENT, 1, 0.45, 1, 1),
       (366, 34, BACKEND, ADVANCED, URGENT, 1, 0.4, 1, 1),
       (367, 34, BACKEND, ADVANCED, URGENT, 1, 0.35, 1, 1),
       (368, 34, BACKEND, ADVANCED, URGENT, 1, 0.3, 1, 1),
       (369, 34, BACKEND, NORMAL, URGENT, 1, 0.25, 1, 1),
       (370, 34, BACKEND, NORMAL, URGENT, 1, 0.2, 1, 1),
       (371, 34, BACKEND, NORMAL, URGENT, 1, 0.15, 1, 1),
       (372, 34, BACKEND, NORMAL, URGENT, 1, 0.1, 1, 1),
       (373, 34, BACKEND, NORMAL, URGENT, 1, 0.05, 1, 1),
       (374, 34, BACKEND, NORMAL, URGENT, 1, 0, 1, 1),
       (375, 35, FRONTEND, NORMAL, URGENT, 1, 0.5, 1, 1),
       (376, 35, FRONTEND, NORMAL, URGENT, 1, 0.45, 1, 1),
       (377, 35, FRONTEND, NORMAL, URGENT, 1, 0.4, 1, 1),
       (378, 35, FRONTEND, NORMAL, URGENT, 1, 0.35, 1, 1),
       (379, 35, FRONTEND, NORMAL, URGENT, 1, 0.3, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (380, 35, FRONTEND, NORMAL, URGENT, 1, 0.25, 1, 1),
       (381, 35, FRONTEND, NORMAL, URGENT, 1, 0.2, 1, 1),
       (382, 35, FRONTEND, NORMAL, URGENT, 1, 0.15, 1, 1),
       (383, 35, FRONTEND, NORMAL, URGENT, 1, 0.1, 1, 1),
       (384, 35, FRONTEND, NORMAL, URGENT, 1, 0.05, 1, 1),
       (385, 35, FRONTEND, NORMAL, URGENT, 1, 0, 1, 1),
       (386, 36, BACKEND, NORMAL, URGENT, 1, 0.5, 1, 1),
       (387, 36, BACKEND, NORMAL, URGENT, 1, 0.45, 1, 1),
       (388, 36, BACKEND, NORMAL, URGENT, 1, 0.4, 1, 1),
       (389, 36, BACKEND, NORMAL, URGENT, 1, 0.35, 1, 1),
       (390, 36, BACKEND, NORMAL, URGENT, 1, 0.3, 1, 1),
       (391, 36, BACKEND, LIGHT, URGENT, 1, 0.25, 1, 1),
       (392, 36, BACKEND, LIGHT, URGENT, 1, 0.2, 1, 1),
       (393, 36, BACKEND, LIGHT, URGENT, 1, 0.15, 1, 1),
       (394, 36, BACKEND, LIGHT, URGENT, 1, 0.1, 1, 1),
       (395, 36, BACKEND, LIGHT, URGENT, 1, 0.05, 1, 1),
       (396, 36, BACKEND, LIGHT, URGENT, 1, 0, 1, 1),
       (397, 37, FRONTEND, LIGHT, URGENT, 1, 0.5, 1, 1),
       (398, 37, FRONTEND, LIGHT, URGENT, 1, 0.45, 1, 1),
       (399, 37, FRONTEND, LIGHT, URGENT, 1, 0.4, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (400, 37, FRONTEND, LIGHT, URGENT, 1, 0.35, 1, 1),
       (401, 37, FRONTEND, LIGHT, URGENT, 1, 0.3, 1, 1),
       (402, 37, FRONTEND, LIGHT, URGENT, 1, 0.25, 1, 1),
       (403, 37, FRONTEND, LIGHT, URGENT, 1, 0.2, 1, 1),
       (404, 37, FRONTEND, LIGHT, URGENT, 1, 0.15, 1, 1),
       (405, 37, FRONTEND, LIGHT, URGENT, 1, 0.1, 1, 1),
       (406, 37, FRONTEND, LIGHT, URGENT, 1, 0.05, 1, 1),
       (407, 37, FRONTEND, LIGHT, URGENT, 1, 0, 1, 1),
       (408, 38, BACKEND, HARD, HIGH, 1, 0.5, 1, 1),
       (409, 38, BACKEND, HARD, HIGH, 1, 0.45, 1, 1),
       (410, 38, BACKEND, HARD, HIGH, 1, 0.4, 1, 1),
       (411, 38, BACKEND, HARD, HIGH, 1, 0.35, 1, 1),
       (412, 38, BACKEND, HARD, HIGH, 1, 0.3, 1, 1),
       (413, 38, BACKEND, HARD, HIGH, 1, 0.25, 1, 1),
       (414, 38, BACKEND, HARD, HIGH, 1, 0.2, 1, 1),
       (415, 38, BACKEND, HARD, HIGH, 1, 0.15, 1, 1),
       (416, 38, BACKEND, HARD, HIGH, 1, 0.1, 1, 1),
       (417, 38, BACKEND, HARD, HIGH, 1, 0.05, 1, 1),
       (418, 38, BACKEND, HARD, HIGH, 1, 0, 1, 1),
       (419, 39, FRONTEND, HARD, HIGH, 1, 0.5, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (420, 39, FRONTEND, HARD, HIGH, 1, 0.45, 1, 1),
       (421, 39, FRONTEND, HARD, HIGH, 1, 0.4, 1, 1),
       (422, 39, FRONTEND, HARD, HIGH, 1, 0.35, 1, 1),
       (423, 39, FRONTEND, HARD, HIGH, 1, 0.3, 1, 1),
       (424, 39, FRONTEND, ADVANCED, HIGH, 1, 0.25, 1, 1),
       (425, 39, FRONTEND, ADVANCED, HIGH, 1, 0.2, 1, 1),
       (426, 39, FRONTEND, ADVANCED, HIGH, 1, 0.15, 1, 1),
       (427, 39, FRONTEND, ADVANCED, HIGH, 1, 0.1, 1, 1),
       (428, 39, FRONTEND, ADVANCED, HIGH, 1, 0.05, 1, 1),
       (429, 39, FRONTEND, ADVANCED, HIGH, 1, 0, 1, 1),
       (430, 40, BACKEND, ADVANCED, HIGH, 1, 0.5, 1, 1),
       (431, 40, BACKEND, ADVANCED, HIGH, 1, 0.45, 1, 1),
       (432, 40, BACKEND, ADVANCED, HIGH, 1, 0.4, 1, 1),
       (433, 40, BACKEND, ADVANCED, HIGH, 1, 0.35, 1, 1),
       (434, 40, BACKEND, ADVANCED, HIGH, 1, 0.3, 1, 1),
       (435, 40, BACKEND, ADVANCED, HIGH, 1, 0.25, 1, 1),
       (436, 40, BACKEND, ADVANCED, HIGH, 1, 0.2, 1, 1),
       (437, 40, BACKEND, ADVANCED, HIGH, 1, 0.15, 1, 1),
       (438, 40, BACKEND, ADVANCED, HIGH, 1, 0.1, 1, 1),
       (439, 40, BACKEND, ADVANCED, HIGH, 1, 0.05, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (440, 40, BACKEND, ADVANCED, HIGH, 1, 0, 1, 1),
       (441, 41, FRONTEND, ADVANCED, HIGH, 1, 0.5, 1, 1),
       (442, 41, FRONTEND, ADVANCED, HIGH, 1, 0.45, 1, 1),
       (443, 41, FRONTEND, ADVANCED, HIGH, 1, 0.4, 1, 1),
       (444, 41, FRONTEND, ADVANCED, HIGH, 1, 0.35, 1, 1),
       (445, 41, FRONTEND, ADVANCED, HIGH, 1, 0.3, 1, 1),
       (446, 41, FRONTEND, NORMAL, HIGH, 1, 0.25, 1, 1),
       (447, 41, FRONTEND, NORMAL, HIGH, 1, 0.2, 1, 1),
       (448, 41, FRONTEND, NORMAL, HIGH, 1, 0.15, 1, 1),
       (449, 41, FRONTEND, NORMAL, HIGH, 1, 0.1, 1, 1),
       (450, 41, FRONTEND, NORMAL, HIGH, 1, 0.05, 1, 1),
       (451, 41, FRONTEND, NORMAL, HIGH, 1, 0, 1, 1),
       (452, 42, BACKEND, NORMAL, HIGH, 1, 0.5, 1, 1),
       (453, 42, BACKEND, NORMAL, HIGH, 1, 0.45, 1, 1),
       (454, 42, BACKEND, NORMAL, HIGH, 1, 0.4, 1, 1),
       (455, 42, BACKEND, NORMAL, HIGH, 1, 0.35, 1, 1),
       (456, 42, BACKEND, NORMAL, HIGH, 1, 0.3, 1, 1),
       (457, 42, BACKEND, NORMAL, HIGH, 1, 0.25, 1, 1),
       (458, 42, BACKEND, NORMAL, HIGH, 1, 0.2, 1, 1),
       (459, 42, BACKEND, NORMAL, HIGH, 1, 0.15, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (460, 42, BACKEND, NORMAL, HIGH, 1, 0.1, 1, 1),
       (461, 42, BACKEND, NORMAL, HIGH, 1, 0.05, 1, 1),
       (462, 42, BACKEND, NORMAL, HIGH, 1, 0, 1, 1),
       (463, 43, FRONTEND, NORMAL, HIGH, 1, 0.5, 1, 1),
       (464, 43, FRONTEND, NORMAL, HIGH, 1, 0.45, 1, 1),
       (465, 43, FRONTEND, NORMAL, HIGH, 1, 0.4, 1, 1),
       (466, 43, FRONTEND, NORMAL, HIGH, 1, 0.35, 1, 1),
       (467, 43, FRONTEND, NORMAL, HIGH, 1, 0.3, 1, 1),
       (468, 43, FRONTEND, LIGHT, HIGH, 1, 0.25, 1, 1),
       (469, 43, FRONTEND, LIGHT, HIGH, 1, 0.2, 1, 1),
       (470, 43, FRONTEND, LIGHT, HIGH, 1, 0.15, 1, 1),
       (471, 43, FRONTEND, LIGHT, HIGH, 1, 0.1, 1, 1),
       (472, 43, FRONTEND, LIGHT, HIGH, 1, 0.05, 1, 1),
       (473, 43, FRONTEND, LIGHT, HIGH, 1, 0, 1, 1),
       (474, 44, BACKEND, LIGHT, HIGH, 1, 0.5, 1, 1),
       (475, 44, BACKEND, LIGHT, HIGH, 1, 0.45, 1, 1),
       (476, 44, BACKEND, LIGHT, HIGH, 1, 0.4, 1, 1),
       (477, 44, BACKEND, LIGHT, HIGH, 1, 0.35, 1, 1),
       (478, 44, BACKEND, LIGHT, HIGH, 1, 0.3, 1, 1),
       (479, 44, BACKEND, LIGHT, HIGH, 1, 0.25, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (480, 44, BACKEND, LIGHT, HIGH, 1, 0.2, 1, 1),
       (481, 44, BACKEND, LIGHT, HIGH, 1, 0.15, 1, 1),
       (482, 44, BACKEND, LIGHT, HIGH, 1, 0.1, 1, 1),
       (483, 44, BACKEND, LIGHT, HIGH, 1, 0.05, 1, 1),
       (484, 44, BACKEND, LIGHT, HIGH, 1, 0, 1, 1),
       (485, 45, FRONTEND, HARD, NORMAL, 1, 0.5, 1, 1),
       (486, 45, FRONTEND, HARD, NORMAL, 1, 0.45, 1, 1),
       (487, 45, FRONTEND, HARD, NORMAL, 1, 0.4, 1, 1),
       (488, 45, FRONTEND, HARD, NORMAL, 1, 0.35, 1, 1),
       (489, 45, FRONTEND, HARD, NORMAL, 1, 0.3, 1, 1),
       (490, 45, FRONTEND, HARD, NORMAL, 1, 0.25, 1, 1),
       (491, 45, FRONTEND, HARD, NORMAL, 1, 0.2, 1, 1),
       (492, 45, FRONTEND, HARD, NORMAL, 1, 0.15, 1, 1),
       (493, 45, FRONTEND, HARD, NORMAL, 1, 0.1, 1, 1),
       (494, 45, FRONTEND, HARD, NORMAL, 1, 0.05, 1, 1),
       (495, 45, FRONTEND, HARD, NORMAL, 1, 0, 1, 1),
       (496, 46, BACKEND, HARD, NORMAL, 1, 0.5, 1, 1),
       (497, 46, BACKEND, HARD, NORMAL, 1, 0.45, 1, 1),
       (498, 46, BACKEND, HARD, NORMAL, 1, 0.4, 1, 1),
       (499, 46, BACKEND, HARD, NORMAL, 1, 0.35, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (500, 46, BACKEND, HARD, NORMAL, 1, 0.3, 1, 1),
       (501, 46, BACKEND, ADVANCED, NORMAL, 1, 0.25, 1, 1),
       (502, 46, BACKEND, ADVANCED, NORMAL, 1, 0.2, 1, 1),
       (503, 46, BACKEND, ADVANCED, NORMAL, 1, 0.15, 1, 1),
       (504, 46, BACKEND, ADVANCED, NORMAL, 1, 0.1, 1, 1),
       (505, 46, BACKEND, ADVANCED, NORMAL, 1, 0.05, 1, 1),
       (506, 46, BACKEND, ADVANCED, NORMAL, 1, 0, 1, 1),
       (507, 47, FRONTEND, ADVANCED, NORMAL, 1, 0.5, 1, 1),
       (508, 47, FRONTEND, ADVANCED, NORMAL, 1, 0.45, 1, 1),
       (509, 47, FRONTEND, ADVANCED, NORMAL, 1, 0.4, 1, 1),
       (510, 47, FRONTEND, ADVANCED, NORMAL, 1, 0.35, 1, 1),
       (511, 47, FRONTEND, ADVANCED, NORMAL, 1, 0.3, 1, 1),
       (512, 47, FRONTEND, ADVANCED, NORMAL, 1, 0.25, 1, 1),
       (513, 47, FRONTEND, ADVANCED, NORMAL, 1, 0.2, 1, 1),
       (514, 47, FRONTEND, ADVANCED, NORMAL, 1, 0.15, 1, 1),
       (515, 47, FRONTEND, ADVANCED, NORMAL, 1, 0.1, 1, 1),
       (516, 47, FRONTEND, ADVANCED, NORMAL, 1, 0.05, 1, 1),
       (517, 47, FRONTEND, ADVANCED, NORMAL, 1, 0, 1, 1),
       (518, 48, BACKEND, ADVANCED, NORMAL, 1, 0.5, 1, 1),
       (519, 48, BACKEND, ADVANCED, NORMAL, 1, 0.45, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (520, 48, BACKEND, ADVANCED, NORMAL, 1, 0.4, 1, 1),
       (521, 48, BACKEND, ADVANCED, NORMAL, 1, 0.35, 1, 1),
       (522, 48, BACKEND, ADVANCED, NORMAL, 1, 0.3, 1, 1),
       (523, 48, BACKEND, NORMAL, NORMAL, 1, 0.25, 1, 1),
       (524, 48, BACKEND, NORMAL, NORMAL, 1, 0.2, 1, 1),
       (525, 48, BACKEND, NORMAL, NORMAL, 1, 0.15, 1, 1),
       (526, 48, BACKEND, NORMAL, NORMAL, 1, 0.1, 1, 1),
       (527, 48, BACKEND, NORMAL, NORMAL, 1, 0.05, 1, 1),
       (528, 48, BACKEND, NORMAL, NORMAL, 1, 0, 1, 1),
       (529, 49, FRONTEND, NORMAL, NORMAL, 1, 0.5, 1, 1),
       (530, 49, FRONTEND, NORMAL, NORMAL, 1, 0.45, 1, 1),
       (531, 49, FRONTEND, NORMAL, NORMAL, 1, 0.4, 1, 1),
       (532, 49, FRONTEND, NORMAL, NORMAL, 1, 0.35, 1, 1),
       (533, 49, FRONTEND, NORMAL, NORMAL, 1, 0.3, 1, 1),
       (534, 49, FRONTEND, NORMAL, NORMAL, 1, 0.25, 1, 1),
       (535, 49, FRONTEND, NORMAL, NORMAL, 1, 0.2, 1, 1),
       (536, 49, FRONTEND, NORMAL, NORMAL, 1, 0.15, 1, 1),
       (537, 49, FRONTEND, NORMAL, NORMAL, 1, 0.1, 1, 1),
       (538, 49, FRONTEND, NORMAL, NORMAL, 1, 0.05, 1, 1),
       (539, 49, FRONTEND, NORMAL, NORMAL, 1, 0, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (540, 50, BACKEND, NORMAL, NORMAL, 1, 0.5, 1, 1),
       (541, 50, BACKEND, NORMAL, NORMAL, 1, 0.45, 1, 1),
       (542, 50, BACKEND, NORMAL, NORMAL, 1, 0.4, 1, 1),
       (543, 50, BACKEND, NORMAL, NORMAL, 1, 0.35, 1, 1),
       (544, 50, BACKEND, NORMAL, NORMAL, 1, 0.3, 1, 1),
       (545, 50, BACKEND, LIGHT, NORMAL, 1, 0.25, 1, 1),
       (546, 50, BACKEND, LIGHT, NORMAL, 1, 0.2, 1, 1),
       (547, 50, BACKEND, LIGHT, NORMAL, 1, 0.15, 1, 1),
       (548, 50, BACKEND, LIGHT, NORMAL, 1, 0.1, 1, 1),
       (549, 50, BACKEND, LIGHT, NORMAL, 1, 0.05, 1, 1),
       (550, 50, BACKEND, LIGHT, NORMAL, 1, 0, 1, 1),
       (551, 51, FRONTEND, LIGHT, NORMAL, 1, 0.5, 1, 1),
       (552, 51, FRONTEND, LIGHT, NORMAL, 1, 0.45, 1, 1),
       (553, 51, FRONTEND, LIGHT, NORMAL, 1, 0.4, 1, 1),
       (554, 51, FRONTEND, LIGHT, NORMAL, 1, 0.35, 1, 1),
       (555, 51, FRONTEND, LIGHT, NORMAL, 1, 0.3, 1, 1),
       (556, 51, FRONTEND, LIGHT, NORMAL, 1, 0.25, 1, 1),
       (557, 51, FRONTEND, LIGHT, NORMAL, 1, 0.2, 1, 1),
       (558, 51, FRONTEND, LIGHT, NORMAL, 1, 0.15, 1, 1),
       (559, 51, FRONTEND, LIGHT, NORMAL, 1, 0.1, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (560, 51, FRONTEND, LIGHT, NORMAL, 1, 0.05, 1, 1),
       (561, 51, FRONTEND, LIGHT, NORMAL, 1, 0, 1, 1),
       (562, 52, BACKEND, HARD, LOW, 1, 0.5, 1, 1),
       (563, 52, BACKEND, HARD, LOW, 1, 0.45, 1, 1),
       (564, 52, BACKEND, HARD, LOW, 1, 0.4, 1, 1),
       (565, 52, BACKEND, HARD, LOW, 1, 0.35, 1, 1),
       (566, 52, BACKEND, HARD, LOW, 1, 0.3, 1, 1),
       (567, 52, BACKEND, HARD, LOW, 1, 0.25, 1, 1),
       (568, 52, BACKEND, HARD, LOW, 1, 0.2, 1, 1),
       (569, 52, BACKEND, HARD, LOW, 1, 0.15, 1, 1),
       (570, 52, BACKEND, HARD, LOW, 1, 0.1, 1, 1),
       (571, 52, BACKEND, HARD, LOW, 1, 0.05, 1, 1),
       (572, 52, BACKEND, HARD, LOW, 1, 0, 1, 1),
       (573, 53, FRONTEND, HARD, LOW, 1, 0.5, 1, 1),
       (574, 53, FRONTEND, HARD, LOW, 1, 0.45, 1, 1),
       (575, 53, FRONTEND, HARD, LOW, 1, 0.4, 1, 1),
       (576, 53, FRONTEND, HARD, LOW, 1, 0.35, 1, 1),
       (577, 53, FRONTEND, HARD, LOW, 1, 0.3, 1, 1),
       (578, 53, FRONTEND, ADVANCED, LOW, 1, 0.25, 1, 1),
       (579, 53, FRONTEND, ADVANCED, LOW, 1, 0.2, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (580, 53, FRONTEND, ADVANCED, LOW, 1, 0.15, 1, 1),
       (581, 53, FRONTEND, ADVANCED, LOW, 1, 0.1, 1, 1),
       (582, 53, FRONTEND, ADVANCED, LOW, 1, 0.05, 1, 1),
       (583, 53, FRONTEND, ADVANCED, LOW, 1, 0, 1, 1),
       (584, 54, BACKEND, ADVANCED, LOW, 1, 0.5, 1, 1),
       (585, 54, BACKEND, ADVANCED, LOW, 1, 0.45, 1, 1),
       (586, 54, BACKEND, ADVANCED, LOW, 1, 0.4, 1, 1),
       (587, 54, BACKEND, ADVANCED, LOW, 1, 0.35, 1, 1),
       (588, 54, BACKEND, ADVANCED, LOW, 1, 0.3, 1, 1),
       (589, 54, BACKEND, ADVANCED, LOW, 1, 0.25, 1, 1),
       (590, 54, BACKEND, ADVANCED, LOW, 1, 0.2, 1, 1),
       (591, 54, BACKEND, ADVANCED, LOW, 1, 0.15, 1, 1),
       (592, 54, BACKEND, ADVANCED, LOW, 1, 0.1, 1, 1),
       (593, 54, BACKEND, ADVANCED, LOW, 1, 0.05, 1, 1),
       (594, 54, BACKEND, ADVANCED, LOW, 1, 0, 1, 1),
       (595, 55, FRONTEND, ADVANCED, LOW, 1, 0.5, 1, 1),
       (596, 55, FRONTEND, ADVANCED, LOW, 1, 0.45, 1, 1),
       (597, 55, FRONTEND, ADVANCED, LOW, 1, 0.4, 1, 1),
       (598, 55, FRONTEND, ADVANCED, LOW, 1, 0.35, 1, 1),
       (599, 55, FRONTEND, ADVANCED, LOW, 1, 0.3, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (600, 55, FRONTEND, NORMAL, LOW, 1, 0.25, 1, 1),
       (601, 55, FRONTEND, NORMAL, LOW, 1, 0.2, 1, 1),
       (602, 55, FRONTEND, NORMAL, LOW, 1, 0.15, 1, 1),
       (603, 55, FRONTEND, NORMAL, LOW, 1, 0.1, 1, 1),
       (604, 55, FRONTEND, NORMAL, LOW, 1, 0.05, 1, 1),
       (605, 55, FRONTEND, NORMAL, LOW, 1, 0, 1, 1),
       (606, 56, BACKEND, NORMAL, LOW, 1, 0.5, 1, 1),
       (607, 56, BACKEND, NORMAL, LOW, 1, 0.45, 1, 1),
       (608, 56, BACKEND, NORMAL, LOW, 1, 0.4, 1, 1),
       (609, 56, BACKEND, NORMAL, LOW, 1, 0.35, 1, 1),
       (610, 56, BACKEND, NORMAL, LOW, 1, 0.3, 1, 1),
       (611, 56, BACKEND, NORMAL, LOW, 1, 0.25, 1, 1),
       (612, 56, BACKEND, NORMAL, LOW, 1, 0.2, 1, 1),
       (613, 56, BACKEND, NORMAL, LOW, 1, 0.15, 1, 1),
       (614, 56, BACKEND, NORMAL, LOW, 1, 0.1, 1, 1),
       (615, 56, BACKEND, NORMAL, LOW, 1, 0.05, 1, 1),
       (616, 56, BACKEND, NORMAL, LOW, 1, 0, 1, 1),
       (617, 57, FRONTEND, NORMAL, LOW, 1, 0.5, 1, 1),
       (618, 57, FRONTEND, NORMAL, LOW, 1, 0.45, 1, 1),
       (619, 57, FRONTEND, NORMAL, LOW, 1, 0.4, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (620, 57, FRONTEND, NORMAL, LOW, 1, 0.35, 1, 1),
       (621, 57, FRONTEND, NORMAL, LOW, 1, 0.3, 1, 1),
       (622, 57, FRONTEND, LIGHT, LOW, 1, 0.25, 1, 1),
       (623, 57, FRONTEND, LIGHT, LOW, 1, 0.2, 1, 1),
       (624, 57, FRONTEND, LIGHT, LOW, 1, 0.15, 1, 1),
       (625, 57, FRONTEND, LIGHT, LOW, 1, 0.1, 1, 1),
       (626, 57, FRONTEND, LIGHT, LOW, 1, 0.05, 1, 1),
       (627, 57, FRONTEND, LIGHT, LOW, 1, 0, 1, 1),
       (628, 58, BACKEND, LIGHT, LOW, 1, 0.5, 1, 1),
       (629, 58, BACKEND, LIGHT, LOW, 1, 0.45, 1, 1),
       (630, 58, BACKEND, LIGHT, LOW, 1, 0.4, 1, 1),
       (631, 58, BACKEND, LIGHT, LOW, 1, 0.35, 1, 1),
       (632, 58, BACKEND, LIGHT, LOW, 1, 0.3, 1, 1),
       (633, 58, BACKEND, LIGHT, LOW, 1, 0.25, 1, 1),
       (634, 58, BACKEND, LIGHT, LOW, 1, 0.2, 1, 1),
       (635, 58, BACKEND, LIGHT, LOW, 1, 0.15, 1, 1),
       (636, 58, BACKEND, LIGHT, LOW, 1, 0.1, 1, 1),
       (637, 58, BACKEND, LIGHT, LOW, 1, 0.05, 1, 1),
       (638, 58, BACKEND, LIGHT, LOW, 1, 0, 1, 1),
       (639, 59, FRONTEND, HARD, LOW, 1, 0.5, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (640, 59, FRONTEND, ADVANCED, NORMAL, 1, 0.45, 1, 1),
       (641, 59, FRONTEND, ADVANCED, NORMAL, 1, 0.4, 1, 1),
       (642, 59, FRONTEND, NORMAL, HIGH, 1, 0.35, 1, 1),
       (643, 59, FRONTEND, NORMAL, HIGH, 1, 0.3, 1, 1),
       (644, 59, FRONTEND, LIGHT, URGENT, 1, 0.25, 1, 1),
       (645, 59, FRONTEND, LIGHT, URGENT, 1, 0.2, 1, 1),
       (646, 59, FRONTEND, HARD, LOW, 1, 0.15, 1, 1),
       (647, 59, FRONTEND, HARD, LOW, 1, 0.1, 1, 1),
       (648, 59, FRONTEND, ADVANCED, NORMAL, 1, 0.05, 1, 1),
       (649, 59, FRONTEND, ADVANCED, NORMAL, 1, 0, 1, 1),
       (650, 60, BACKEND, NORMAL, HIGH, 1, 0.5, 1, 1),
       (651, 60, BACKEND, LIGHT, URGENT, 1, 0.45, 1, 1),
       (652, 60, BACKEND, LIGHT, URGENT, 1, 0.4, 1, 1),
       (653, 60, BACKEND, HARD, LOW, 1, 0.35, 1, 1),
       (654, 60, BACKEND, HARD, LOW, 1, 0.3, 1, 1),
       (655, 60, BACKEND, ADVANCED, NORMAL, 1, 0.25, 1, 1),
       (656, 60, BACKEND, ADVANCED, NORMAL, 1, 0.2, 1, 1),
       (657, 60, BACKEND, NORMAL, HIGH, 1, 0.15, 1, 1),
       (658, 60, BACKEND, NORMAL, HIGH, 1, 0.1, 1, 1),
       (659, 60, BACKEND, LIGHT, URGENT, 1, 0.05, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (660, 60, BACKEND, LIGHT, URGENT, 1, 0, 1, 1),
       (661, 1, FRONTEND, HARD, URGENT, 0, 0, 0.95, 1),
       (662, 2, BACKEND, HARD, URGENT, 0, 0, 0.95, 1),
       (663, 3, FRONTEND, ADVANCED, URGENT, 0, 0, 0.95, 1),
       (664, 4, BACKEND, ADVANCED, URGENT, 0, 0, 0.95, 1),
       (665, 5, FRONTEND, NORMAL, URGENT, 0, 0, 0.95, 1),
       (666, 6, BACKEND, NORMAL, URGENT, 0, 0, 0.95, 1),
       (667, 7, FRONTEND, LIGHT, URGENT, 0, 0, 0.95, 1),
       (668, 8, BACKEND, HARD, HIGH, 0, 0, 0.95, 1),
       (669, 8, BACKEND, HARD, HIGH, 0, 0, 1, 1),
       (670, 9, FRONTEND, HARD, HIGH, 0, 0, 0.95, 1),
       (671, 9, FRONTEND, HARD, HIGH, 0, 0, 1, 1),
       (672, 10, BACKEND, ADVANCED, HIGH, 0, 0, 0.95, 1),
       (673, 10, BACKEND, ADVANCED, HIGH, 0, 0, 1, 1),
       (674, 11, FRONTEND, ADVANCED, HIGH, 0, 0, 0.95, 1),
       (675, 11, FRONTEND, ADVANCED, HIGH, 0, 0, 1, 1),
       (676, 12, BACKEND, NORMAL, HIGH, 0, 0, 0.95, 1),
       (677, 12, BACKEND, NORMAL, HIGH, 0, 0, 1, 1),
       (678, 13, FRONTEND, NORMAL, HIGH, 0, 0, 0.95, 1),
       (679, 13, FRONTEND, NORMAL, HIGH, 0, 0, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (680, 14, BACKEND, LIGHT, HIGH, 0, 0, 0.95, 1),
       (681, 14, BACKEND, LIGHT, HIGH, 0, 0, 1, 1),
       (682, 15, FRONTEND, HARD, NORMAL, 0, 0, 0.95, 1),
       (683, 15, FRONTEND, HARD, NORMAL, 0, 0, 1, 1),
       (684, 16, BACKEND, HARD, NORMAL, 0, 0, 0.95, 1),
       (685, 16, BACKEND, HARD, NORMAL, 0, 0, 1, 1),
       (686, 17, FRONTEND, ADVANCED, NORMAL, 0, 0, 0.95, 1),
       (687, 17, FRONTEND, ADVANCED, NORMAL, 0, 0, 1, 1),
       (688, 18, BACKEND, ADVANCED, NORMAL, 0, 0, 0.95, 1),
       (689, 18, BACKEND, ADVANCED, NORMAL, 0, 0, 1, 1),
       (690, 19, FRONTEND, NORMAL, NORMAL, 0, 0, 0.95, 1),
       (691, 19, FRONTEND, NORMAL, NORMAL, 0, 0, 1, 1),
       (692, 20, BACKEND, NORMAL, NORMAL, 0, 0, 0.95, 1),
       (693, 20, BACKEND, NORMAL, NORMAL, 0, 0, 1, 1),
       (694, 21, FRONTEND, LIGHT, NORMAL, 0, 0, 0.95, 1),
       (695, 21, FRONTEND, LIGHT, NORMAL, 0, 0, 1, 1),
       (696, 22, BACKEND, HARD, LOW, 0, 0, 0.95, 1),
       (697, 22, BACKEND, HARD, LOW, 0, 0, 1, 1),
       (698, 23, FRONTEND, HARD, LOW, 0, 0, 0.95, 1),
       (699, 23, FRONTEND, HARD, LOW, 0, 0, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (700, 24, BACKEND, ADVANCED, LOW, 0, 0, 0.95, 1),
       (701, 24, BACKEND, ADVANCED, LOW, 0, 0, 1, 1),
       (702, 25, FRONTEND, ADVANCED, LOW, 0, 0, 0.95, 1),
       (703, 25, FRONTEND, ADVANCED, LOW, 0, 0, 1, 1),
       (704, 26, BACKEND, NORMAL, LOW, 0, 0, 0.95, 1),
       (705, 26, BACKEND, NORMAL, LOW, 0, 0, 1, 1),
       (706, 27, FRONTEND, NORMAL, LOW, 0, 0, 0.95, 1),
       (707, 27, FRONTEND, NORMAL, LOW, 0, 0, 1, 1),
       (708, 28, BACKEND, LIGHT, LOW, 0, 0, 0.95, 1),
       (709, 28, BACKEND, LIGHT, LOW, 0, 0, 1, 1),
       (710, 29, FRONTEND, HARD, LOW, 0, 0, 0.95, 1),
       (711, 29, FRONTEND, ADVANCED, NORMAL, 0, 0, 0.95, 1),
       (712, 29, FRONTEND, NORMAL, HIGH, 0, 0, 0.95, 1),
       (713, 29, FRONTEND, NORMAL, HIGH, 0, 0, 1, 1),
       (714, 30, BACKEND, NORMAL, HIGH, 0, 0, 0.95, 1),
       (715, 30, BACKEND, LIGHT, URGENT, 0, 0, 0.95, 1),
       (716, 30, BACKEND, HARD, LOW, 0, 0, 0.95, 1),
       (717, 30, BACKEND, HARD, LOW, 0, 0, 1, 1),
       (718, 31, FRONTEND, HARD, URGENT, 0, 0, 0.5, 1),
       (719, 31, FRONTEND, HARD, URGENT, 0, 0, 0.6, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (720, 31, FRONTEND, HARD, URGENT, 0, 0, 0.7, 1),
       (721, 31, FRONTEND, HARD, URGENT, 0, 0, 0.95, 1),
       (722, 31, FRONTEND, HARD, URGENT, 0, 0, 1, 1),
       (723, 32, BACKEND, HARD, URGENT, 0, 0, 0.5, 1),
       (724, 32, BACKEND, HARD, URGENT, 0, 0, 0.6, 1),
       (725, 32, BACKEND, HARD, URGENT, 0, 0, 0.7, 1),
       (726, 32, BACKEND, HARD, URGENT, 0, 0, 0.95, 1),
       (727, 32, BACKEND, HARD, URGENT, 0, 0, 1, 1),
       (728, 33, FRONTEND, ADVANCED, URGENT, 0, 0, 0.5, 1),
       (729, 33, FRONTEND, ADVANCED, URGENT, 0, 0, 0.6, 1),
       (730, 33, FRONTEND, ADVANCED, URGENT, 0, 0, 0.7, 1),
       (731, 33, FRONTEND, ADVANCED, URGENT, 0, 0, 0.95, 1),
       (732, 33, FRONTEND, ADVANCED, URGENT, 0, 0, 1, 1),
       (733, 34, BACKEND, ADVANCED, URGENT, 0, 0, 0.5, 1),
       (734, 34, BACKEND, ADVANCED, URGENT, 0, 0, 0.6, 1),
       (735, 34, BACKEND, ADVANCED, URGENT, 0, 0, 0.7, 1),
       (736, 34, BACKEND, ADVANCED, URGENT, 0, 0, 0.95, 1),
       (737, 34, BACKEND, ADVANCED, URGENT, 0, 0, 1, 1),
       (738, 35, FRONTEND, NORMAL, URGENT, 0, 0, 0.5, 1),
       (739, 35, FRONTEND, NORMAL, URGENT, 0, 0, 0.6, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (740, 35, FRONTEND, NORMAL, URGENT, 0, 0, 0.7, 1),
       (741, 35, FRONTEND, NORMAL, URGENT, 0, 0, 0.95, 1),
       (742, 35, FRONTEND, NORMAL, URGENT, 0, 0, 1, 1),
       (743, 36, BACKEND, NORMAL, URGENT, 0, 0, 0.5, 1),
       (744, 36, BACKEND, NORMAL, URGENT, 0, 0, 0.6, 1),
       (745, 36, BACKEND, NORMAL, URGENT, 0, 0, 0.7, 1),
       (746, 36, BACKEND, NORMAL, URGENT, 0, 0, 0.95, 1),
       (747, 36, BACKEND, NORMAL, URGENT, 0, 0, 1, 1),
       (748, 37, FRONTEND, LIGHT, URGENT, 0, 0, 0.5, 1),
       (749, 37, FRONTEND, LIGHT, URGENT, 0, 0, 0.6, 1),
       (750, 37, FRONTEND, LIGHT, URGENT, 0, 0, 0.7, 1),
       (751, 37, FRONTEND, LIGHT, URGENT, 0, 0, 0.95, 1),
       (752, 37, FRONTEND, LIGHT, URGENT, 0, 0, 1, 1),
       (753, 38, BACKEND, HARD, HIGH, 0, 0, 0.5, 1),
       (754, 38, BACKEND, HARD, HIGH, 0, 0, 0.6, 1),
       (755, 38, BACKEND, HARD, HIGH, 0, 0, 0.7, 1),
       (756, 38, BACKEND, HARD, HIGH, 0, 0, 0.95, 1),
       (757, 38, BACKEND, HARD, HIGH, 0, 0, 1, 1),
       (758, 39, FRONTEND, HARD, HIGH, 0, 0, 0.5, 1),
       (759, 39, FRONTEND, HARD, HIGH, 0, 0, 0.6, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (760, 39, FRONTEND, HARD, HIGH, 0, 0, 0.7, 1),
       (761, 39, FRONTEND, HARD, HIGH, 0, 0, 0.95, 1),
       (762, 39, FRONTEND, HARD, HIGH, 0, 0, 1, 1),
       (763, 40, BACKEND, ADVANCED, HIGH, 0, 0, 0.5, 1),
       (764, 40, BACKEND, ADVANCED, HIGH, 0, 0, 0.6, 1),
       (765, 40, BACKEND, ADVANCED, HIGH, 0, 0, 0.7, 1),
       (766, 40, BACKEND, ADVANCED, HIGH, 0, 0, 0.95, 1),
       (767, 40, BACKEND, ADVANCED, HIGH, 0, 0, 1, 1),
       (768, 41, FRONTEND, ADVANCED, HIGH, 0, 0, 0.5, 1),
       (769, 41, FRONTEND, ADVANCED, HIGH, 0, 0, 0.6, 1),
       (770, 41, FRONTEND, ADVANCED, HIGH, 0, 0, 0.7, 1),
       (771, 41, FRONTEND, ADVANCED, HIGH, 0, 0, 0.95, 1),
       (772, 41, FRONTEND, ADVANCED, HIGH, 0, 0, 1, 1),
       (773, 42, BACKEND, NORMAL, HIGH, 0, 0, 0.5, 1),
       (774, 42, BACKEND, NORMAL, HIGH, 0, 0, 0.6, 1),
       (775, 42, BACKEND, NORMAL, HIGH, 0, 0, 0.7, 1),
       (776, 42, BACKEND, NORMAL, HIGH, 0, 0, 0.95, 1),
       (777, 42, BACKEND, NORMAL, HIGH, 0, 0, 1, 1),
       (778, 43, FRONTEND, NORMAL, HIGH, 0, 0, 0.5, 1),
       (779, 43, FRONTEND, NORMAL, HIGH, 0, 0, 0.6, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (780, 43, FRONTEND, NORMAL, HIGH, 0, 0, 0.7, 1),
       (781, 43, FRONTEND, NORMAL, HIGH, 0, 0, 0.95, 1),
       (782, 43, FRONTEND, NORMAL, HIGH, 0, 0, 1, 1),
       (783, 44, BACKEND, LIGHT, HIGH, 0, 0, 0.5, 1),
       (784, 44, BACKEND, LIGHT, HIGH, 0, 0, 0.6, 1),
       (785, 44, BACKEND, LIGHT, HIGH, 0, 0, 0.7, 1),
       (786, 44, BACKEND, LIGHT, HIGH, 0, 0, 0.95, 1),
       (787, 44, BACKEND, LIGHT, HIGH, 0, 0, 1, 1),
       (788, 45, FRONTEND, HARD, NORMAL, 0, 0, 0.5, 1),
       (789, 45, FRONTEND, HARD, NORMAL, 0, 0, 0.6, 1),
       (790, 45, FRONTEND, HARD, NORMAL, 0, 0, 0.7, 1),
       (791, 45, FRONTEND, HARD, NORMAL, 0, 0, 0.95, 1),
       (792, 45, FRONTEND, HARD, NORMAL, 0, 0, 1, 1),
       (793, 46, BACKEND, HARD, NORMAL, 0, 0, 0.5, 1),
       (794, 46, BACKEND, HARD, NORMAL, 0, 0, 0.6, 1),
       (795, 46, BACKEND, HARD, NORMAL, 0, 0, 0.7, 1),
       (796, 46, BACKEND, HARD, NORMAL, 0, 0, 0.95, 1),
       (797, 46, BACKEND, HARD, NORMAL, 0, 0, 1, 1),
       (798, 47, FRONTEND, ADVANCED, NORMAL, 0, 0, 0.5, 1),
       (799, 47, FRONTEND, ADVANCED, NORMAL, 0, 0, 0.6, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (800, 47, FRONTEND, ADVANCED, NORMAL, 0, 0, 0.7, 1),
       (801, 47, FRONTEND, ADVANCED, NORMAL, 0, 0, 0.95, 1),
       (802, 47, FRONTEND, ADVANCED, NORMAL, 0, 0, 1, 1),
       (803, 48, BACKEND, ADVANCED, NORMAL, 0, 0, 0.5, 1),
       (804, 48, BACKEND, ADVANCED, NORMAL, 0, 0, 0.6, 1),
       (805, 48, BACKEND, ADVANCED, NORMAL, 0, 0, 0.7, 1),
       (806, 48, BACKEND, ADVANCED, NORMAL, 0, 0, 0.95, 1),
       (807, 48, BACKEND, ADVANCED, NORMAL, 0, 0, 1, 1),
       (808, 49, FRONTEND, NORMAL, NORMAL, 0, 0, 0.5, 1),
       (809, 49, FRONTEND, NORMAL, NORMAL, 0, 0, 0.6, 1),
       (810, 49, FRONTEND, NORMAL, NORMAL, 0, 0, 0.7, 1),
       (811, 49, FRONTEND, NORMAL, NORMAL, 0, 0, 0.95, 1),
       (812, 49, FRONTEND, NORMAL, NORMAL, 0, 0, 1, 1),
       (813, 50, BACKEND, NORMAL, NORMAL, 0, 0, 0.5, 1),
       (814, 50, BACKEND, NORMAL, NORMAL, 0, 0, 0.6, 1),
       (815, 50, BACKEND, NORMAL, NORMAL, 0, 0, 0.7, 1),
       (816, 50, BACKEND, NORMAL, NORMAL, 0, 0, 0.95, 1),
       (817, 50, BACKEND, NORMAL, NORMAL, 0, 0, 1, 1),
       (818, 51, FRONTEND, LIGHT, NORMAL, 0, 0, 0.5, 1),
       (819, 51, FRONTEND, LIGHT, NORMAL, 0, 0, 0.6, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (820, 51, FRONTEND, LIGHT, NORMAL, 0, 0, 0.7, 1),
       (821, 51, FRONTEND, LIGHT, NORMAL, 0, 0, 0.95, 1),
       (822, 51, FRONTEND, LIGHT, NORMAL, 0, 0, 1, 1),
       (823, 52, BACKEND, HARD, LOW, 0, 0, 0.5, 1),
       (824, 52, BACKEND, HARD, LOW, 0, 0, 0.6, 1),
       (825, 52, BACKEND, HARD, LOW, 0, 0, 0.7, 1),
       (826, 52, BACKEND, HARD, LOW, 0, 0, 0.95, 1),
       (827, 52, BACKEND, HARD, LOW, 0, 0, 1, 1),
       (828, 53, FRONTEND, HARD, LOW, 0, 0, 0.5, 1),
       (829, 53, FRONTEND, HARD, LOW, 0, 0, 0.6, 1),
       (830, 53, FRONTEND, HARD, LOW, 0, 0, 0.7, 1),
       (831, 53, FRONTEND, HARD, LOW, 0, 0, 0.95, 1),
       (832, 53, FRONTEND, HARD, LOW, 0, 0, 1, 1),
       (833, 54, BACKEND, ADVANCED, LOW, 0, 0, 0.5, 1),
       (834, 54, BACKEND, ADVANCED, LOW, 0, 0, 0.6, 1),
       (835, 54, BACKEND, ADVANCED, LOW, 0, 0, 0.7, 1),
       (836, 54, BACKEND, ADVANCED, LOW, 0, 0, 0.95, 1),
       (837, 54, BACKEND, ADVANCED, LOW, 0, 0, 1, 1),
       (838, 55, FRONTEND, ADVANCED, LOW, 0, 0, 0.5, 1),
       (839, 55, FRONTEND, ADVANCED, LOW, 0, 0, 0.6, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (840, 55, FRONTEND, ADVANCED, LOW, 0, 0, 0.7, 1),
       (841, 55, FRONTEND, ADVANCED, LOW, 0, 0, 0.95, 1),
       (842, 55, FRONTEND, ADVANCED, LOW, 0, 0, 1, 1),
       (843, 56, BACKEND, NORMAL, LOW, 0, 0, 0.5, 1),
       (844, 56, BACKEND, NORMAL, LOW, 0, 0, 0.6, 1),
       (845, 56, BACKEND, NORMAL, LOW, 0, 0, 0.7, 1),
       (846, 56, BACKEND, NORMAL, LOW, 0, 0, 0.95, 1),
       (847, 56, BACKEND, NORMAL, LOW, 0, 0, 1, 1),
       (848, 57, FRONTEND, NORMAL, LOW, 0, 0, 0.5, 1),
       (849, 57, FRONTEND, NORMAL, LOW, 0, 0, 0.6, 1),
       (850, 57, FRONTEND, NORMAL, LOW, 0, 0, 0.7, 1),
       (851, 57, FRONTEND, NORMAL, LOW, 0, 0, 0.95, 1),
       (852, 57, FRONTEND, NORMAL, LOW, 0, 0, 1, 1),
       (853, 58, BACKEND, LIGHT, LOW, 0, 0, 0.5, 1),
       (854, 58, BACKEND, LIGHT, LOW, 0, 0, 0.6, 1),
       (855, 58, BACKEND, LIGHT, LOW, 0, 0, 0.7, 1),
       (856, 58, BACKEND, LIGHT, LOW, 0, 0, 0.95, 1),
       (857, 58, BACKEND, LIGHT, LOW, 0, 0, 1, 1),
       (858, 59, FRONTEND, HARD, LOW, 0, 0, 0.5, 1),
       (859, 59, FRONTEND, ADVANCED, NORMAL, 0, 0, 0.6, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (860, 59, FRONTEND, NORMAL, HIGH, 0, 0, 0.7, 1),
       (861, 59, FRONTEND, NORMAL, HIGH, 0, 0, 0.95, 1),
       (862, 59, FRONTEND, NORMAL, HIGH, 0, 0, 1, 1),
       (863, 60, BACKEND, NORMAL, HIGH, 0, 0, 0.5, 1),
       (864, 60, BACKEND, LIGHT, URGENT, 0, 0, 0.6, 1),
       (865, 60, BACKEND, HARD, LOW, 0, 0, 0.7, 1),
       (866, 60, BACKEND, HARD, LOW, 0, 0, 0.95, 1),
       (867, 60, BACKEND, HARD, LOW, 0, 0, 1, 1),
       (868, 61, FRONTEND, HARD, URGENT, 1, 0.05, 1, 1),
       (869, 61, FRONTEND, HARD, URGENT, 1, 0, 1, 1),
       (870, 62, BACKEND, ADVANCED, URGENT, 1, 0.05, 1, 1),
       (871, 62, BACKEND, ADVANCED, URGENT, 1, 0, 1, 1),
       (872, 63, FRONTEND, ADVANCED, URGENT, 1, 0.05, 1, 1),
       (873, 63, FRONTEND, ADVANCED, URGENT, 1, 0, 1, 1),
       (874, 64, BACKEND, NORMAL, URGENT, 1, 0.05, 1, 1),
       (875, 64, BACKEND, NORMAL, URGENT, 1, 0, 1, 1),
       (876, 65, FRONTEND, NORMAL, URGENT, 1, 0.05, 1, 1),
       (877, 65, FRONTEND, NORMAL, URGENT, 1, 0, 1, 1),
       (878, 66, BACKEND, LIGHT, URGENT, 1, 0.05, 1, 1),
       (879, 66, BACKEND, LIGHT, URGENT, 1, 0, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (880, 67, FRONTEND, LIGHT, URGENT, 1, 0.05, 1, 1),
       (881, 67, FRONTEND, LIGHT, URGENT, 1, 0, 1, 1),
       (882, 68, BACKEND, HARD, HIGH, 1, 0.05, 1, 1),
       (883, 68, BACKEND, HARD, HIGH, 1, 0, 1, 1),
       (884, 69, FRONTEND, ADVANCED, HIGH, 1, 0.05, 1, 1),
       (885, 69, FRONTEND, ADVANCED, HIGH, 1, 0, 1, 1),
       (886, 70, BACKEND, ADVANCED, HIGH, 1, 0, 1, 1),
       (887, 71, FRONTEND, NORMAL, HIGH, 1, 0, 1, 1),
       (888, 72, BACKEND, NORMAL, HIGH, 1, 0, 1, 1),
       (889, 73, FRONTEND, LIGHT, HIGH, 1, 0, 1, 1),
       (890, 74, BACKEND, LIGHT, HIGH, 1, 0, 1, 1),
       (891, 75, FRONTEND, HARD, NORMAL, 1, 0, 1, 1),
       (892, 76, BACKEND, ADVANCED, NORMAL, 1, 0, 1, 1),
       (893, 77, FRONTEND, ADVANCED, NORMAL, 1, 0, 1, 1),
       (894, 78, BACKEND, NORMAL, NORMAL, 1, 0, 1, 1),
       (895, 79, FRONTEND, NORMAL, NORMAL, 1, 0, 1, 1),
       (896, 80, BACKEND, LIGHT, NORMAL, 1, 0, 1, 1),
       (897, 81, FRONTEND, LIGHT, NORMAL, 1, 0, 1, 1),
       (898, 82, BACKEND, HARD, LOW, 1, 0, 1, 1),
       (899, 83, FRONTEND, ADVANCED, LOW, 1, 0, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (900, 84, BACKEND, ADVANCED, LOW, 1, 0, 1, 1),
       (901, 85, FRONTEND, NORMAL, LOW, 1, 0, 1, 1),
       (902, 86, BACKEND, NORMAL, LOW, 1, 0, 1, 1),
       (903, 87, FRONTEND, LIGHT, LOW, 1, 0, 1, 1),
       (904, 88, BACKEND, LIGHT, LOW, 1, 0, 1, 1),
       (905, 89, FRONTEND, ADVANCED, NORMAL, 1, 0, 1, 1),
       (906, 90, BACKEND, LIGHT, URGENT, 1, 0, 1, 1),
       (907, 91, FRONTEND, HARD, URGENT, 1, 0.05, 1, 1),
       (908, 91, FRONTEND, HARD, URGENT, 1, 0, 1, 1),
       (909, 92, BACKEND, ADVANCED, URGENT, 1, 0.05, 1, 1),
       (910, 92, BACKEND, ADVANCED, URGENT, 1, 0, 1, 1),
       (911, 93, FRONTEND, ADVANCED, URGENT, 1, 0.05, 1, 1),
       (912, 93, FRONTEND, ADVANCED, URGENT, 1, 0, 1, 1),
       (913, 94, BACKEND, NORMAL, URGENT, 1, 0.05, 1, 1),
       (914, 94, BACKEND, NORMAL, URGENT, 1, 0, 1, 1),
       (915, 95, FRONTEND, NORMAL, URGENT, 1, 0.05, 1, 1),
       (916, 95, FRONTEND, NORMAL, URGENT, 1, 0, 1, 1),
       (917, 96, BACKEND, LIGHT, URGENT, 1, 0.05, 1, 1),
       (918, 96, BACKEND, LIGHT, URGENT, 1, 0, 1, 1),
       (919, 97, FRONTEND, LIGHT, URGENT, 1, 0.05, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (920, 97, FRONTEND, LIGHT, URGENT, 1, 0, 1, 1),
       (921, 98, BACKEND, HARD, HIGH, 1, 0.05, 1, 1),
       (922, 98, BACKEND, HARD, HIGH, 1, 0, 1, 1),
       (923, 99, FRONTEND, ADVANCED, HIGH, 1, 0.05, 1, 1),
       (924, 99, FRONTEND, ADVANCED, HIGH, 1, 0, 1, 1),
       (925, 100, BACKEND, ADVANCED, HIGH, 1, 0.05, 1, 1),
       (926, 100, BACKEND, ADVANCED, HIGH, 1, 0, 1, 1),
       (927, 101, FRONTEND, NORMAL, HIGH, 1, 0.05, 1, 1),
       (928, 101, FRONTEND, NORMAL, HIGH, 1, 0, 1, 1),
       (929, 102, BACKEND, NORMAL, HIGH, 1, 0.05, 1, 1),
       (930, 102, BACKEND, NORMAL, HIGH, 1, 0, 1, 1),
       (931, 103, FRONTEND, LIGHT, HIGH, 1, 0.05, 1, 1),
       (932, 103, FRONTEND, LIGHT, HIGH, 1, 0, 1, 1),
       (933, 104, BACKEND, LIGHT, HIGH, 1, 0.05, 1, 1),
       (934, 104, BACKEND, LIGHT, HIGH, 1, 0, 1, 1),
       (935, 105, FRONTEND, HARD, NORMAL, 1, 0.05, 1, 1),
       (936, 105, FRONTEND, HARD, NORMAL, 1, 0, 1, 1),
       (937, 106, BACKEND, ADVANCED, NORMAL, 1, 0.05, 1, 1),
       (938, 106, BACKEND, ADVANCED, NORMAL, 1, 0, 1, 1),
       (939, 107, FRONTEND, ADVANCED, NORMAL, 1, 0.05, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (940, 107, FRONTEND, ADVANCED, NORMAL, 1, 0, 1, 1),
       (941, 108, BACKEND, NORMAL, NORMAL, 1, 0.05, 1, 1),
       (942, 108, BACKEND, NORMAL, NORMAL, 1, 0, 1, 1),
       (943, 109, FRONTEND, NORMAL, NORMAL, 1, 0.05, 1, 1),
       (944, 109, FRONTEND, NORMAL, NORMAL, 1, 0, 1, 1),
       (945, 110, BACKEND, LIGHT, NORMAL, 1, 0.05, 1, 1),
       (946, 110, BACKEND, LIGHT, NORMAL, 1, 0, 1, 1),
       (947, 111, FRONTEND, LIGHT, NORMAL, 1, 0.05, 1, 1),
       (948, 111, FRONTEND, LIGHT, NORMAL, 1, 0, 1, 1),
       (949, 112, BACKEND, HARD, LOW, 1, 0.05, 1, 1),
       (950, 112, BACKEND, HARD, LOW, 1, 0, 1, 1),
       (951, 113, FRONTEND, ADVANCED, LOW, 1, 0.05, 1, 1),
       (952, 113, FRONTEND, ADVANCED, LOW, 1, 0, 1, 1),
       (953, 114, BACKEND, ADVANCED, LOW, 1, 0.05, 1, 1),
       (954, 114, BACKEND, ADVANCED, LOW, 1, 0, 1, 1),
       (955, 115, FRONTEND, NORMAL, LOW, 1, 0.05, 1, 1),
       (956, 115, FRONTEND, NORMAL, LOW, 1, 0, 1, 1),
       (957, 116, BACKEND, NORMAL, LOW, 1, 0.05, 1, 1),
       (958, 116, BACKEND, NORMAL, LOW, 1, 0, 1, 1),
       (959, 117, FRONTEND, LIGHT, LOW, 1, 0.05, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (960, 117, FRONTEND, LIGHT, LOW, 1, 0, 1, 1),
       (961, 118, BACKEND, LIGHT, LOW, 1, 0.05, 1, 1),
       (962, 118, BACKEND, LIGHT, LOW, 1, 0, 1, 1),
       (963, 119, FRONTEND, ADVANCED, NORMAL, 1, 0.05, 1, 1),
       (964, 119, FRONTEND, ADVANCED, NORMAL, 1, 0, 1, 1),
       (965, 120, BACKEND, LIGHT, URGENT, 1, 0.05, 1, 1),
       (966, 120, BACKEND, LIGHT, URGENT, 1, 0, 1, 1),
       (967, 61, FRONTEND, HARD, URGENT, 0, 0, 0.95, 1),
       (968, 62, BACKEND, HARD, URGENT, 0, 0, 0.95, 1),
       (969, 63, FRONTEND, ADVANCED, URGENT, 0, 0, 0.95, 1),
       (970, 64, BACKEND, ADVANCED, URGENT, 0, 0, 0.95, 1),
       (971, 65, FRONTEND, NORMAL, URGENT, 0, 0, 0.95, 1),
       (972, 66, BACKEND, NORMAL, URGENT, 0, 0, 0.95, 1),
       (973, 67, FRONTEND, LIGHT, URGENT, 0, 0, 0.95, 1),
       (974, 68, BACKEND, HARD, HIGH, 0, 0, 0.95, 1),
       (975, 69, FRONTEND, HARD, HIGH, 0, 0, 0.95, 1),
       (976, 69, FRONTEND, HARD, HIGH, 0, 0, 1, 1),
       (977, 70, BACKEND, ADVANCED, HIGH, 0, 0, 1, 1),
       (978, 71, FRONTEND, ADVANCED, HIGH, 0, 0, 1, 1),
       (979, 72, BACKEND, NORMAL, HIGH, 0, 0, 1, 1);
INSERT INTO `task_management`.`interf_task_user` (`record_id`, `user_id`,`domain`, `level`, `priority`, `is_on_time`, `free_time_rto`, `punct_score`, `was_sent`)
VALUES (980, 73, FRONTEND, NORMAL, HIGH, 0, 0, 1, 1),
       (981, 74, BACKEND, LIGHT, HIGH, 0, 0, 1, 1),
       (982, 75, FRONTEND, HARD, NORMAL, 0, 0, 1, 1),
       (983, 76, BACKEND, HARD, NORMAL, 0, 0, 1, 1),
       (984, 77, FRONTEND, ADVANCED, NORMAL, 0, 0, 1, 1),
       (985, 78, BACKEND, ADVANCED, NORMAL, 0, 0, 1, 1),
       (986, 79, FRONTEND, NORMAL, NORMAL, 0, 0, 1, 1),
       (987, 80, BACKEND, NORMAL, NORMAL, 0, 0, 1, 1),