
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
-- 2025-01-01
-- 2025-01-04
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1, 1, 121, NULL, 'Init backend project', 'Init backend project', NULL, 'HARD', 'BACKEND', 'NORMAL', FALSE, '2025-01-01', '2025-01-04', '2025-01-04', '2025-01-01 08:00:00.000000', '2025-01-01 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (1, 1, 2, 'JOINED', '2025-01-01 08:00:00.000000'),
       (2, 1, 4, 'JOINED', '2025-01-01 08:00:00.000000'),
       (3, 1, 6, 'JOINED', '2025-01-01 08:00:00.000000'),
       (4, 1, 30, 'JOINED', '2025-01-01 08:00:00.000000'),
       (5, 1, 32, 'JOINED', '2025-01-01 08:00:00.000000'),
       (6, 1, 34, 'JOINED', '2025-01-01 08:00:00.000000'),
       (7, 1, 36, 'JOINED', '2025-01-01 08:00:00.000000'),
       (8, 1, 60, 'JOINED', '2025-01-01 08:00:00.000000'),
       (9, 1, 62, 'JOINED', '2025-01-01 08:00:00.000000'),
       (10, 1, 64, 'JOINED', '2025-01-01 08:00:00.000000'),
       (11, 1, 66, 'JOINED', '2025-01-01 08:00:00.000000'),
       (12, 1, 90, 'JOINED', '2025-01-01 08:00:00.000000'),
       (13, 1, 92, 'JOINED', '2025-01-01 08:00:00.000000'),
       (14, 1, 94, 'JOINED', '2025-01-01 08:00:00.000000'),
       (15, 1, 96, 'JOINED', '2025-01-01 08:00:00.000000'),
       (16, 1, 120, 'JOINED', '2025-01-01 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 1, 'Employee 2 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-02 20:00:00.000000', '2025-01-02 20:00:00.000000', '2025-01-04 08:00:00.000000'),
       (DEFAULT, 2, 'Employee 4 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-02 20:00:00.000000', '2025-01-02 20:00:00.000000', '2025-01-04 08:00:00.000000'),
       (DEFAULT, 3, 'Employee 6 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-02 20:00:00.000000', '2025-01-02 20:00:00.000000', '2025-01-04 08:00:00.000000'),
       (DEFAULT, 4, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-02 23:36:00.000000', '2025-01-02 23:36:00.000000', '2025-01-04 08:00:00.000000'),
       (DEFAULT, 5, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-02 20:00:00.000000', '2025-01-02 20:00:00.000000', '2025-01-04 08:00:00.000000'),
       (DEFAULT, 6, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-02 20:00:00.000000', '2025-01-02 20:00:00.000000', '2025-01-04 08:00:00.000000'),
       (DEFAULT, 7, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-02 20:00:00.000000', '2025-01-02 20:00:00.000000', '2025-01-04 08:00:00.000000'),
       (DEFAULT, 8, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-02 23:36:00.000000', '2025-01-02 23:36:00.000000', '2025-01-04 08:00:00.000000'),
       (DEFAULT, 9, 'Employee 62 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-04 04:24:00.000000', '2025-01-04 04:24:00.000000', '2025-01-04 08:00:00.000000'),
       (DEFAULT, 10, 'Employee 64 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-04 04:24:00.000000', '2025-01-04 04:24:00.000000', '2025-01-04 08:00:00.000000'),
       (DEFAULT, 11, 'Employee 66 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-04 04:24:00.000000', '2025-01-04 04:24:00.000000', '2025-01-04 08:00:00.000000'),
       (DEFAULT, 12, 'Employee 90 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-04 08:00:00.000000', '2025-01-04 08:00:00.000000', '2025-01-04 08:00:00.000000'),
       (DEFAULT, 13, 'Employee 92 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-04 04:24:00.000000', '2025-01-04 04:24:00.000000', '2025-01-04 08:00:00.000000'),
       (DEFAULT, 14, 'Employee 94 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-04 04:24:00.000000', '2025-01-04 04:24:00.000000', '2025-01-04 08:00:00.000000'),
       (DEFAULT, 15, 'Employee 96 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-04 04:24:00.000000', '2025-01-04 04:24:00.000000', '2025-01-04 08:00:00.000000'),
       (DEFAULT, 16, 'Employee 120 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-04 04:24:00.000000', '2025-01-04 04:24:00.000000', '2025-01-04 08:00:00.000000');

-- 2025-01-04
-- 2025-01-11
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (2, 1, 121, NULL, 'Setup project modules', 'Setup project modules', NULL, 'HARD', 'BACKEND', 'LOW', FALSE, '2025-01-04', '2025-01-11', '2025-01-11', '2025-01-04 08:00:00.000000', '2025-01-04 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (17, 2, 2, 'JOINED', '2025-01-04 08:00:00.000000'),
       (18, 2, 4, 'JOINED', '2025-01-04 08:00:00.000000'),
       (19, 2, 6, 'JOINED', '2025-01-04 08:00:00.000000'),
       (20, 2, 30, 'JOINED', '2025-01-04 08:00:00.000000'),
       (21, 2, 32, 'JOINED', '2025-01-04 08:00:00.000000'),
       (22, 2, 34, 'JOINED', '2025-01-04 08:00:00.000000'),
       (23, 2, 36, 'JOINED', '2025-01-04 08:00:00.000000'),
       (24, 2, 60, 'JOINED', '2025-01-04 08:00:00.000000'),
       (25, 2, 62, 'JOINED', '2025-01-04 08:00:00.000000'),
       (26, 2, 64, 'JOINED', '2025-01-04 08:00:00.000000'),
       (27, 2, 66, 'JOINED', '2025-01-04 08:00:00.000000'),
       (28, 2, 92, 'JOINED', '2025-01-04 08:00:00.000000'),
       (29, 2, 94, 'JOINED', '2025-01-04 08:00:00.000000'),
       (30, 2, 96, 'JOINED', '2025-01-04 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 17, 'Employee 2 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-11 08:00:00.000000', '2025-01-11 08:00:00.000000', '2025-01-11 08:00:00.000000'),
       (DEFAULT, 18, 'Employee 4 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-11 08:00:00.000000', '2025-01-11 08:00:00.000000', '2025-01-11 08:00:00.000000'),
       (DEFAULT, 19, 'Employee 6 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-11 08:00:00.000000', '2025-01-11 08:00:00.000000', '2025-01-11 08:00:00.000000'),
       (DEFAULT, 20, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-11 08:00:00.000000', '2025-01-11 08:00:00.000000', '2025-01-11 08:00:00.000000'),
       (DEFAULT, 21, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-11 08:00:00.000000', '2025-01-11 08:00:00.000000', '2025-01-11 08:00:00.000000'),
       (DEFAULT, 22, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-11 08:00:00.000000', '2025-01-11 08:00:00.000000', '2025-01-11 08:00:00.000000'),
       (DEFAULT, 23, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-11 08:00:00.000000', '2025-01-11 08:00:00.000000', '2025-01-11 08:00:00.000000'),
       (DEFAULT, 24, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-11 08:00:00.000000', '2025-01-11 08:00:00.000000', '2025-01-11 08:00:00.000000'),
       (DEFAULT, 25, 'Employee 62 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-11 08:00:00.000000', '2025-01-11 08:00:00.000000', '2025-01-11 08:00:00.000000'),
       (DEFAULT, 26, 'Employee 64 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-11 08:00:00.000000', '2025-01-11 08:00:00.000000', '2025-01-11 08:00:00.000000'),
       (DEFAULT, 27, 'Employee 66 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-11 08:00:00.000000', '2025-01-11 08:00:00.000000', '2025-01-11 08:00:00.000000'),
       (DEFAULT, 28, 'Employee 92 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-11 08:00:00.000000', '2025-01-11 08:00:00.000000', '2025-01-11 08:00:00.000000'),
       (DEFAULT, 29, 'Employee 94 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-11 08:00:00.000000', '2025-01-11 08:00:00.000000', '2025-01-11 08:00:00.000000'),
       (DEFAULT, 30, 'Employee 96 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-11 08:00:00.000000', '2025-01-11 08:00:00.000000', '2025-01-11 08:00:00.000000');

-- 2025-01-11
-- 2025-01-17
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (3, 1, 121, NULL, 'Create user entity', 'Create user entity', NULL, 'ADVANCED', 'BACKEND', 'NORMAL', FALSE, '2025-01-11', '2025-01-17', '2025-01-17', '2025-01-11 08:00:00.000000', '2025-01-11 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (31, 3, 8, 'JOINED', '2025-01-11 08:00:00.000000'),
       (32, 3, 10, 'JOINED', '2025-01-11 08:00:00.000000'),
       (33, 3, 12, 'JOINED', '2025-01-11 08:00:00.000000'),
       (34, 3, 14, 'JOINED', '2025-01-11 08:00:00.000000'),
       (35, 3, 30, 'JOINED', '2025-01-11 08:00:00.000000'),
       (36, 3, 38, 'JOINED', '2025-01-11 08:00:00.000000'),
       (37, 3, 40, 'JOINED', '2025-01-11 08:00:00.000000'),
       (38, 3, 42, 'JOINED', '2025-01-11 08:00:00.000000'),
       (39, 3, 44, 'JOINED', '2025-01-11 08:00:00.000000'),
       (40, 3, 60, 'JOINED', '2025-01-11 08:00:00.000000'),
       (41, 3, 68, 'JOINED', '2025-01-11 08:00:00.000000'),
       (42, 3, 70, 'JOINED', '2025-01-11 08:00:00.000000'),
       (43, 3, 72, 'JOINED', '2025-01-11 08:00:00.000000'),
       (44, 3, 74, 'JOINED', '2025-01-11 08:00:00.000000'),
       (45, 3, 98, 'JOINED', '2025-01-11 08:00:00.000000'),
       (46, 3, 100, 'JOINED', '2025-01-11 08:00:00.000000'),
       (47, 3, 102, 'JOINED', '2025-01-11 08:00:00.000000'),
       (48, 3, 104, 'JOINED', '2025-01-11 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 31, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-14 08:00:00.000000', '2025-01-14 08:00:00.000000', '2025-01-17 08:00:00.000000'),
       (DEFAULT, 32, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-14 08:00:00.000000', '2025-01-14 08:00:00.000000', '2025-01-17 08:00:00.000000'),
       (DEFAULT, 33, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-14 08:00:00.000000', '2025-01-14 08:00:00.000000', '2025-01-17 08:00:00.000000'),
       (DEFAULT, 34, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-14 08:00:00.000000', '2025-01-14 08:00:00.000000', '2025-01-17 08:00:00.000000'),
       (DEFAULT, 35, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-14 08:00:00.000000', '2025-01-14 08:00:00.000000', '2025-01-17 08:00:00.000000'),
       (DEFAULT, 36, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-14 08:00:00.000000', '2025-01-14 08:00:00.000000', '2025-01-17 08:00:00.000000'),
       (DEFAULT, 37, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-14 08:00:00.000000', '2025-01-14 08:00:00.000000', '2025-01-17 08:00:00.000000'),
       (DEFAULT, 38, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-14 08:00:00.000000', '2025-01-14 08:00:00.000000', '2025-01-17 08:00:00.000000'),
       (DEFAULT, 39, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-14 08:00:00.000000', '2025-01-14 08:00:00.000000', '2025-01-17 08:00:00.000000'),
       (DEFAULT, 40, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-14 08:00:00.000000', '2025-01-14 08:00:00.000000', '2025-01-17 08:00:00.000000'),
       (DEFAULT, 41, 'Employee 68 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-17 00:48:00.000000', '2025-01-17 00:48:00.000000', '2025-01-17 08:00:00.000000'),
       (DEFAULT, 42, 'Employee 70 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-17 08:00:00.000000', '2025-01-17 08:00:00.000000', '2025-01-17 08:00:00.000000'),
       (DEFAULT, 43, 'Employee 72 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-17 08:00:00.000000', '2025-01-17 08:00:00.000000', '2025-01-17 08:00:00.000000'),
       (DEFAULT, 44, 'Employee 74 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-17 08:00:00.000000', '2025-01-17 08:00:00.000000', '2025-01-17 08:00:00.000000'),
       (DEFAULT, 45, 'Employee 98 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-17 00:48:00.000000', '2025-01-17 00:48:00.000000', '2025-01-17 08:00:00.000000'),
       (DEFAULT, 46, 'Employee 100 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-17 00:48:00.000000', '2025-01-17 00:48:00.000000', '2025-01-17 08:00:00.000000'),
       (DEFAULT, 47, 'Employee 102 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-17 00:48:00.000000', '2025-01-17 00:48:00.000000', '2025-01-17 08:00:00.000000'),
       (DEFAULT, 48, 'Employee 104 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-17 00:48:00.000000', '2025-01-17 00:48:00.000000', '2025-01-17 08:00:00.000000');

-- 2025-01-17
-- 2025-01-23
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (4, 1, 121, NULL, 'Create task entity', 'Create task entity', NULL, 'ADVANCED', 'BACKEND', 'LOW', FALSE, '2025-01-17', '2025-01-23', '2025-01-23', '2025-01-17 08:00:00.000000', '2025-01-17 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (49, 4, 8, 'JOINED', '2025-01-17 08:00:00.000000'),
       (50, 4, 10, 'JOINED', '2025-01-17 08:00:00.000000'),
       (51, 4, 12, 'JOINED', '2025-01-17 08:00:00.000000'),
       (52, 4, 14, 'JOINED', '2025-01-17 08:00:00.000000'),
       (53, 4, 30, 'JOINED', '2025-01-17 08:00:00.000000'),
       (54, 4, 38, 'JOINED', '2025-01-17 08:00:00.000000'),
       (55, 4, 40, 'JOINED', '2025-01-17 08:00:00.000000'),
       (56, 4, 42, 'JOINED', '2025-01-17 08:00:00.000000'),
       (57, 4, 44, 'JOINED', '2025-01-17 08:00:00.000000'),
       (58, 4, 60, 'JOINED', '2025-01-17 08:00:00.000000'),
       (59, 4, 68, 'JOINED', '2025-01-17 08:00:00.000000'),
       (60, 4, 70, 'JOINED', '2025-01-17 08:00:00.000000'),
       (61, 4, 72, 'JOINED', '2025-01-17 08:00:00.000000'),
       (62, 4, 74, 'JOINED', '2025-01-17 08:00:00.000000'),
       (63, 4, 98, 'JOINED', '2025-01-17 08:00:00.000000'),
       (64, 4, 100, 'JOINED', '2025-01-17 08:00:00.000000'),
       (65, 4, 102, 'JOINED', '2025-01-17 08:00:00.000000'),
       (66, 4, 104, 'JOINED', '2025-01-17 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 49, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000'),
       (DEFAULT, 50, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000'),
       (DEFAULT, 51, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000'),
       (DEFAULT, 52, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000'),
       (DEFAULT, 53, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000'),
       (DEFAULT, 54, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000'),
       (DEFAULT, 55, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000'),
       (DEFAULT, 56, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000'),
       (DEFAULT, 57, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000'),
       (DEFAULT, 58, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000'),
       (DEFAULT, 59, 'Employee 68 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000'),
       (DEFAULT, 60, 'Employee 70 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000'),
       (DEFAULT, 61, 'Employee 72 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000'),
       (DEFAULT, 62, 'Employee 74 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000'),
       (DEFAULT, 63, 'Employee 98 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000'),
       (DEFAULT, 64, 'Employee 100 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000'),
       (DEFAULT, 65, 'Employee 102 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000'),
       (DEFAULT, 66, 'Employee 104 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000');

-- 2025-01-23
-- 2025-01-28
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (5, 1, 121, NULL, 'Define task priority enum', 'Define task priority enum', NULL, 'NORMAL', 'BACKEND', 'NORMAL', FALSE, '2025-01-23', '2025-01-28', '2025-01-28', '2025-01-23 08:00:00.000000', '2025-01-23 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (67, 5, 16, 'JOINED', '2025-01-23 08:00:00.000000'),
       (68, 5, 18, 'JOINED', '2025-01-23 08:00:00.000000'),
       (69, 5, 20, 'JOINED', '2025-01-23 08:00:00.000000'),
       (70, 5, 30, 'JOINED', '2025-01-23 08:00:00.000000'),
       (71, 5, 46, 'JOINED', '2025-01-23 08:00:00.000000'),
       (72, 5, 48, 'JOINED', '2025-01-23 08:00:00.000000'),
       (73, 5, 50, 'JOINED', '2025-01-23 08:00:00.000000'),
       (74, 5, 60, 'JOINED', '2025-01-23 08:00:00.000000'),
       (75, 5, 76, 'JOINED', '2025-01-23 08:00:00.000000'),
       (76, 5, 78, 'JOINED', '2025-01-23 08:00:00.000000'),
       (77, 5, 80, 'JOINED', '2025-01-23 08:00:00.000000'),
       (78, 5, 106, 'JOINED', '2025-01-23 08:00:00.000000'),
       (79, 5, 108, 'JOINED', '2025-01-23 08:00:00.000000'),
       (80, 5, 110, 'JOINED', '2025-01-23 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 67, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-25 20:00:00.000000', '2025-01-25 20:00:00.000000', '2025-01-28 08:00:00.000000'),
       (DEFAULT, 68, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-25 20:00:00.000000', '2025-01-25 20:00:00.000000', '2025-01-28 08:00:00.000000'),
       (DEFAULT, 69, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-25 20:00:00.000000', '2025-01-25 20:00:00.000000', '2025-01-28 08:00:00.000000'),
       (DEFAULT, 70, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-27 02:00:00.000000', '2025-01-27 02:00:00.000000', '2025-01-28 08:00:00.000000'),
       (DEFAULT, 71, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-25 20:00:00.000000', '2025-01-25 20:00:00.000000', '2025-01-28 08:00:00.000000'),
       (DEFAULT, 72, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-25 20:00:00.000000', '2025-01-25 20:00:00.000000', '2025-01-28 08:00:00.000000'),
       (DEFAULT, 73, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-25 20:00:00.000000', '2025-01-25 20:00:00.000000', '2025-01-28 08:00:00.000000'),
       (DEFAULT, 74, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-27 02:00:00.000000', '2025-01-27 02:00:00.000000', '2025-01-28 08:00:00.000000'),
       (DEFAULT, 75, 'Employee 76 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-28 08:00:00.000000', '2025-01-28 08:00:00.000000', '2025-01-28 08:00:00.000000'),
       (DEFAULT, 76, 'Employee 78 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-28 08:00:00.000000', '2025-01-28 08:00:00.000000', '2025-01-28 08:00:00.000000'),
       (DEFAULT, 77, 'Employee 80 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-28 08:00:00.000000', '2025-01-28 08:00:00.000000', '2025-01-28 08:00:00.000000'),
       (DEFAULT, 78, 'Employee 106 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-28 02:00:00.000000', '2025-01-28 02:00:00.000000', '2025-01-28 08:00:00.000000'),
       (DEFAULT, 79, 'Employee 108 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-28 02:00:00.000000', '2025-01-28 02:00:00.000000', '2025-01-28 08:00:00.000000'),
       (DEFAULT, 80, 'Employee 110 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-28 02:00:00.000000', '2025-01-28 02:00:00.000000', '2025-01-28 08:00:00.000000');

-- 2025-01-28
-- 2025-02-02
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (6, 1, 121, NULL, 'Define task status enum', 'Define task status enum', NULL, 'NORMAL', 'BACKEND', 'LOW', FALSE, '2025-01-28', '2025-02-02', '2025-02-02', '2025-01-28 08:00:00.000000', '2025-01-28 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (81, 6, 16, 'JOINED', '2025-01-28 08:00:00.000000'),
       (82, 6, 18, 'JOINED', '2025-01-28 08:00:00.000000'),
       (83, 6, 20, 'JOINED', '2025-01-28 08:00:00.000000'),
       (84, 6, 46, 'JOINED', '2025-01-28 08:00:00.000000'),
       (85, 6, 48, 'JOINED', '2025-01-28 08:00:00.000000'),
       (86, 6, 50, 'JOINED', '2025-01-28 08:00:00.000000'),
       (87, 6, 76, 'JOINED', '2025-01-28 08:00:00.000000'),
       (88, 6, 78, 'JOINED', '2025-01-28 08:00:00.000000'),
       (89, 6, 80, 'JOINED', '2025-01-28 08:00:00.000000'),
       (90, 6, 106, 'JOINED', '2025-01-28 08:00:00.000000'),
       (91, 6, 108, 'JOINED', '2025-01-28 08:00:00.000000'),
       (92, 6, 110, 'JOINED', '2025-01-28 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 81, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-02 08:00:00.000000', '2025-02-02 08:00:00.000000', '2025-02-02 08:00:00.000000'),
       (DEFAULT, 82, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-02 08:00:00.000000', '2025-02-02 08:00:00.000000', '2025-02-02 08:00:00.000000'),
       (DEFAULT, 83, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-02 08:00:00.000000', '2025-02-02 08:00:00.000000', '2025-02-02 08:00:00.000000'),
       (DEFAULT, 84, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-02 08:00:00.000000', '2025-02-02 08:00:00.000000', '2025-02-02 08:00:00.000000'),
       (DEFAULT, 85, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-02 08:00:00.000000', '2025-02-02 08:00:00.000000', '2025-02-02 08:00:00.000000'),
       (DEFAULT, 86, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-02 08:00:00.000000', '2025-02-02 08:00:00.000000', '2025-02-02 08:00:00.000000'),
       (DEFAULT, 87, 'Employee 76 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-02 08:00:00.000000', '2025-02-02 08:00:00.000000', '2025-02-02 08:00:00.000000'),
       (DEFAULT, 88, 'Employee 78 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-02 08:00:00.000000', '2025-02-02 08:00:00.000000', '2025-02-02 08:00:00.000000'),
       (DEFAULT, 89, 'Employee 80 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-02 08:00:00.000000', '2025-02-02 08:00:00.000000', '2025-02-02 08:00:00.000000'),
       (DEFAULT, 90, 'Employee 106 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-02 08:00:00.000000', '2025-02-02 08:00:00.000000', '2025-02-02 08:00:00.000000'),
       (DEFAULT, 91, 'Employee 108 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-02 08:00:00.000000', '2025-02-02 08:00:00.000000', '2025-02-02 08:00:00.000000'),
       (DEFAULT, 92, 'Employee 110 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-02 08:00:00.000000', '2025-02-02 08:00:00.000000', '2025-02-02 08:00:00.000000');

-- 2025-02-02
-- 2025-02-06
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (7, 1, 121, NULL, 'Setup database config', 'Setup database config', NULL, 'LIGHT', 'BACKEND', 'NORMAL', FALSE, '2025-02-02', '2025-02-06', '2025-02-06', '2025-02-02 08:00:00.000000', '2025-02-02 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (93, 7, 22, 'JOINED', '2025-02-02 08:00:00.000000'),
       (94, 7, 24, 'JOINED', '2025-02-02 08:00:00.000000'),
       (95, 7, 26, 'JOINED', '2025-02-02 08:00:00.000000'),
       (96, 7, 28, 'JOINED', '2025-02-02 08:00:00.000000'),
       (97, 7, 30, 'JOINED', '2025-02-02 08:00:00.000000'),
       (98, 7, 52, 'JOINED', '2025-02-02 08:00:00.000000'),
       (99, 7, 54, 'JOINED', '2025-02-02 08:00:00.000000'),
       (100, 7, 56, 'JOINED', '2025-02-02 08:00:00.000000'),
       (101, 7, 58, 'JOINED', '2025-02-02 08:00:00.000000'),
       (102, 7, 60, 'JOINED', '2025-02-02 08:00:00.000000'),
       (103, 7, 82, 'JOINED', '2025-02-02 08:00:00.000000'),
       (104, 7, 84, 'JOINED', '2025-02-02 08:00:00.000000'),
       (105, 7, 86, 'JOINED', '2025-02-02 08:00:00.000000'),
       (106, 7, 88, 'JOINED', '2025-02-02 08:00:00.000000'),
       (107, 7, 112, 'JOINED', '2025-02-02 08:00:00.000000'),
       (108, 7, 114, 'JOINED', '2025-02-02 08:00:00.000000'),
       (109, 7, 116, 'JOINED', '2025-02-02 08:00:00.000000'),
       (110, 7, 118, 'JOINED', '2025-02-02 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 93, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-04 08:00:00.000000', '2025-02-04 08:00:00.000000', '2025-02-06 08:00:00.000000'),
       (DEFAULT, 94, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-04 08:00:00.000000', '2025-02-04 08:00:00.000000', '2025-02-06 08:00:00.000000'),
       (DEFAULT, 95, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-04 08:00:00.000000', '2025-02-04 08:00:00.000000', '2025-02-06 08:00:00.000000'),
       (DEFAULT, 96, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-04 08:00:00.000000', '2025-02-04 08:00:00.000000', '2025-02-06 08:00:00.000000'),
       (DEFAULT, 97, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-04 22:23:59.000000', '2025-02-04 22:23:59.000000', '2025-02-06 08:00:00.000000'),
       (DEFAULT, 98, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-04 08:00:00.000000', '2025-02-04 08:00:00.000000', '2025-02-06 08:00:00.000000'),
       (DEFAULT, 99, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-04 08:00:00.000000', '2025-02-04 08:00:00.000000', '2025-02-06 08:00:00.000000'),
       (DEFAULT, 100, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-04 08:00:00.000000', '2025-02-04 08:00:00.000000', '2025-02-06 08:00:00.000000'),
       (DEFAULT, 101, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-04 08:00:00.000000', '2025-02-04 08:00:00.000000', '2025-02-06 08:00:00.000000'),
       (DEFAULT, 102, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-04 22:23:59.000000', '2025-02-04 22:23:59.000000', '2025-02-06 08:00:00.000000'),
       (DEFAULT, 103, 'Employee 82 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-06 08:00:00.000000', '2025-02-06 08:00:00.000000', '2025-02-06 08:00:00.000000'),
       (DEFAULT, 104, 'Employee 84 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-06 08:00:00.000000', '2025-02-06 08:00:00.000000', '2025-02-06 08:00:00.000000'),
       (DEFAULT, 105, 'Employee 86 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-06 08:00:00.000000', '2025-02-06 08:00:00.000000', '2025-02-06 08:00:00.000000'),
       (DEFAULT, 106, 'Employee 88 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-06 08:00:00.000000', '2025-02-06 08:00:00.000000', '2025-02-06 08:00:00.000000'),
       (DEFAULT, 107, 'Employee 112 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-06 03:12:00.000000', '2025-02-06 03:12:00.000000', '2025-02-06 08:00:00.000000'),
       (DEFAULT, 108, 'Employee 114 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-06 03:12:00.000000', '2025-02-06 03:12:00.000000', '2025-02-06 08:00:00.000000'),
       (DEFAULT, 109, 'Employee 116 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-06 03:12:00.000000', '2025-02-06 03:12:00.000000', '2025-02-06 08:00:00.000000'),
       (DEFAULT, 110, 'Employee 118 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-06 03:12:00.000000', '2025-02-06 03:12:00.000000', '2025-02-06 08:00:00.000000');

-- 2025-02-06
-- 2025-02-10
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (8, 1, 121, NULL, 'Create JPA repositories', 'Create JPA repositories', NULL, 'LIGHT', 'BACKEND', 'LOW', FALSE, '2025-02-06', '2025-02-10', '2025-02-10', '2025-02-06 08:00:00.000000', '2025-02-06 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (111, 8, 22, 'JOINED', '2025-02-06 08:00:00.000000'),
       (112, 8, 24, 'JOINED', '2025-02-06 08:00:00.000000'),
       (113, 8, 26, 'JOINED', '2025-02-06 08:00:00.000000'),
       (114, 8, 28, 'JOINED', '2025-02-06 08:00:00.000000'),
       (115, 8, 30, 'JOINED', '2025-02-06 08:00:00.000000'),
       (116, 8, 52, 'JOINED', '2025-02-06 08:00:00.000000'),
       (117, 8, 54, 'JOINED', '2025-02-06 08:00:00.000000'),
       (118, 8, 56, 'JOINED', '2025-02-06 08:00:00.000000'),
       (119, 8, 58, 'JOINED', '2025-02-06 08:00:00.000000'),
       (120, 8, 60, 'JOINED', '2025-02-06 08:00:00.000000'),
       (121, 8, 82, 'JOINED', '2025-02-06 08:00:00.000000'),
       (122, 8, 84, 'JOINED', '2025-02-06 08:00:00.000000'),
       (123, 8, 86, 'JOINED', '2025-02-06 08:00:00.000000'),
       (124, 8, 88, 'JOINED', '2025-02-06 08:00:00.000000'),
       (125, 8, 90, 'JOINED', '2025-02-06 08:00:00.000000'),
       (126, 8, 112, 'JOINED', '2025-02-06 08:00:00.000000'),
       (127, 8, 114, 'JOINED', '2025-02-06 08:00:00.000000'),
       (128, 8, 116, 'JOINED', '2025-02-06 08:00:00.000000'),
       (129, 8, 118, 'JOINED', '2025-02-06 08:00:00.000000'),
       (130, 8, 120, 'JOINED', '2025-02-06 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 111, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000'),
       (DEFAULT, 112, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000'),
       (DEFAULT, 113, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000'),
       (DEFAULT, 114, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000'),
       (DEFAULT, 115, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000'),
       (DEFAULT, 116, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000'),
       (DEFAULT, 117, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000'),
       (DEFAULT, 118, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000'),
       (DEFAULT, 119, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000'),
       (DEFAULT, 120, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000'),
       (DEFAULT, 121, 'Employee 82 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000'),
       (DEFAULT, 122, 'Employee 84 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000'),
       (DEFAULT, 123, 'Employee 86 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000'),
       (DEFAULT, 124, 'Employee 88 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000'),
       (DEFAULT, 125, 'Employee 90 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000'),
       (DEFAULT, 126, 'Employee 112 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000'),
       (DEFAULT, 127, 'Employee 114 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000'),
       (DEFAULT, 128, 'Employee 116 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000'),
       (DEFAULT, 129, 'Employee 118 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000'),
       (DEFAULT, 130, 'Employee 120 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000');

-- 2025-02-10
-- 2025-02-13
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (9, 1, 121, NULL, 'Init frontend project', 'Init frontend project', NULL, 'HARD', 'FRONTEND', 'NORMAL', FALSE, '2025-02-10', '2025-02-13', '2025-02-13', '2025-02-10 08:00:00.000000', '2025-02-10 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (131, 9, 1, 'JOINED', '2025-02-10 08:00:00.000000'),
       (132, 9, 3, 'JOINED', '2025-02-10 08:00:00.000000'),
       (133, 9, 5, 'JOINED', '2025-02-10 08:00:00.000000'),
       (134, 9, 7, 'JOINED', '2025-02-10 08:00:00.000000'),
       (135, 9, 29, 'JOINED', '2025-02-10 08:00:00.000000'),
       (136, 9, 31, 'JOINED', '2025-02-10 08:00:00.000000'),
       (137, 9, 33, 'JOINED', '2025-02-10 08:00:00.000000'),
       (138, 9, 35, 'JOINED', '2025-02-10 08:00:00.000000'),
       (139, 9, 37, 'JOINED', '2025-02-10 08:00:00.000000'),
       (140, 9, 59, 'JOINED', '2025-02-10 08:00:00.000000'),
       (141, 9, 61, 'JOINED', '2025-02-10 08:00:00.000000'),
       (142, 9, 63, 'JOINED', '2025-02-10 08:00:00.000000'),
       (143, 9, 65, 'JOINED', '2025-02-10 08:00:00.000000'),
       (144, 9, 67, 'JOINED', '2025-02-10 08:00:00.000000'),
       (145, 9, 91, 'JOINED', '2025-02-10 08:00:00.000000'),
       (146, 9, 93, 'JOINED', '2025-02-10 08:00:00.000000'),
       (147, 9, 95, 'JOINED', '2025-02-10 08:00:00.000000'),
       (148, 9, 97, 'JOINED', '2025-02-10 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 131, 'Employee 1 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-11 20:00:00.000000', '2025-02-11 20:00:00.000000', '2025-02-13 08:00:00.000000'),
       (DEFAULT, 132, 'Employee 3 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-11 20:00:00.000000', '2025-02-11 20:00:00.000000', '2025-02-13 08:00:00.000000'),
       (DEFAULT, 133, 'Employee 5 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-11 20:00:00.000000', '2025-02-11 20:00:00.000000', '2025-02-13 08:00:00.000000'),
       (DEFAULT, 134, 'Employee 7 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-11 20:00:00.000000', '2025-02-11 20:00:00.000000', '2025-02-13 08:00:00.000000'),
       (DEFAULT, 135, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-12 14:00:00.000000', '2025-02-12 14:00:00.000000', '2025-02-13 08:00:00.000000'),
       (DEFAULT, 136, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-11 20:00:00.000000', '2025-02-11 20:00:00.000000', '2025-02-13 08:00:00.000000'),
       (DEFAULT, 137, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-11 20:00:00.000000', '2025-02-11 20:00:00.000000', '2025-02-13 08:00:00.000000'),
       (DEFAULT, 138, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-11 20:00:00.000000', '2025-02-11 20:00:00.000000', '2025-02-13 08:00:00.000000'),
       (DEFAULT, 139, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-11 20:00:00.000000', '2025-02-11 20:00:00.000000', '2025-02-13 08:00:00.000000'),
       (DEFAULT, 140, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-12 14:00:00.000000', '2025-02-12 14:00:00.000000', '2025-02-13 08:00:00.000000'),
       (DEFAULT, 141, 'Employee 61 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-13 04:24:00.000000', '2025-02-13 04:24:00.000000', '2025-02-13 08:00:00.000000'),
       (DEFAULT, 142, 'Employee 63 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-13 04:24:00.000000', '2025-02-13 04:24:00.000000', '2025-02-13 08:00:00.000000'),
       (DEFAULT, 143, 'Employee 65 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-13 04:24:00.000000', '2025-02-13 04:24:00.000000', '2025-02-13 08:00:00.000000'),
       (DEFAULT, 144, 'Employee 67 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-13 04:24:00.000000', '2025-02-13 04:24:00.000000', '2025-02-13 08:00:00.000000'),
       (DEFAULT, 145, 'Employee 91 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-13 04:24:00.000000', '2025-02-13 04:24:00.000000', '2025-02-13 08:00:00.000000'),
       (DEFAULT, 146, 'Employee 93 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-13 04:24:00.000000', '2025-02-13 04:24:00.000000', '2025-02-13 08:00:00.000000'),
       (DEFAULT, 147, 'Employee 95 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-13 04:24:00.000000', '2025-02-13 04:24:00.000000', '2025-02-13 08:00:00.000000'),
       (DEFAULT, 148, 'Employee 97 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-13 04:24:00.000000', '2025-02-13 04:24:00.000000', '2025-02-13 08:00:00.000000');

-- 2025-02-13
-- 2025-02-20
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (10, 1, 121, NULL, 'Create main layout', 'Create main layout', NULL, 'HARD', 'FRONTEND', 'LOW', FALSE, '2025-02-13', '2025-02-20', '2025-02-20', '2025-02-13 08:00:00.000000', '2025-02-13 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (149, 10, 1, 'JOINED', '2025-02-13 08:00:00.000000'),
       (150, 10, 3, 'JOINED', '2025-02-13 08:00:00.000000'),
       (151, 10, 5, 'JOINED', '2025-02-13 08:00:00.000000'),
       (152, 10, 7, 'JOINED', '2025-02-13 08:00:00.000000'),
       (153, 10, 31, 'JOINED', '2025-02-13 08:00:00.000000'),
       (154, 10, 33, 'JOINED', '2025-02-13 08:00:00.000000'),
       (155, 10, 35, 'JOINED', '2025-02-13 08:00:00.000000'),
       (156, 10, 37, 'JOINED', '2025-02-13 08:00:00.000000'),
       (157, 10, 61, 'JOINED', '2025-02-13 08:00:00.000000'),
       (158, 10, 63, 'JOINED', '2025-02-13 08:00:00.000000'),
       (159, 10, 65, 'JOINED', '2025-02-13 08:00:00.000000'),
       (160, 10, 67, 'JOINED', '2025-02-13 08:00:00.000000'),
       (161, 10, 91, 'JOINED', '2025-02-13 08:00:00.000000'),
       (162, 10, 93, 'JOINED', '2025-02-13 08:00:00.000000'),
       (163, 10, 95, 'JOINED', '2025-02-13 08:00:00.000000'),
       (164, 10, 97, 'JOINED', '2025-02-13 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 149, 'Employee 1 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-20 08:00:00.000000', '2025-02-20 08:00:00.000000', '2025-02-20 08:00:00.000000'),
       (DEFAULT, 150, 'Employee 3 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-20 08:00:00.000000', '2025-02-20 08:00:00.000000', '2025-02-20 08:00:00.000000'),
       (DEFAULT, 151, 'Employee 5 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-20 08:00:00.000000', '2025-02-20 08:00:00.000000', '2025-02-20 08:00:00.000000'),
       (DEFAULT, 152, 'Employee 7 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-20 08:00:00.000000', '2025-02-20 08:00:00.000000', '2025-02-20 08:00:00.000000'),
       (DEFAULT, 153, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-20 08:00:00.000000', '2025-02-20 08:00:00.000000', '2025-02-20 08:00:00.000000'),
       (DEFAULT, 154, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-20 08:00:00.000000', '2025-02-20 08:00:00.000000', '2025-02-20 08:00:00.000000'),
       (DEFAULT, 155, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-20 08:00:00.000000', '2025-02-20 08:00:00.000000', '2025-02-20 08:00:00.000000'),
       (DEFAULT, 156, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-20 08:00:00.000000', '2025-02-20 08:00:00.000000', '2025-02-20 08:00:00.000000'),
       (DEFAULT, 157, 'Employee 61 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-20 08:00:00.000000', '2025-02-20 08:00:00.000000', '2025-02-20 08:00:00.000000'),
       (DEFAULT, 158, 'Employee 63 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-20 08:00:00.000000', '2025-02-20 08:00:00.000000', '2025-02-20 08:00:00.000000'),
       (DEFAULT, 159, 'Employee 65 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-20 08:00:00.000000', '2025-02-20 08:00:00.000000', '2025-02-20 08:00:00.000000'),
       (DEFAULT, 160, 'Employee 67 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-20 08:00:00.000000', '2025-02-20 08:00:00.000000', '2025-02-20 08:00:00.000000'),
       (DEFAULT, 161, 'Employee 91 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-20 08:00:00.000000', '2025-02-20 08:00:00.000000', '2025-02-20 08:00:00.000000'),
       (DEFAULT, 162, 'Employee 93 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-20 08:00:00.000000', '2025-02-20 08:00:00.000000', '2025-02-20 08:00:00.000000'),
       (DEFAULT, 163, 'Employee 95 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-20 08:00:00.000000', '2025-02-20 08:00:00.000000', '2025-02-20 08:00:00.000000'),
       (DEFAULT, 164, 'Employee 97 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-20 08:00:00.000000', '2025-02-20 08:00:00.000000', '2025-02-20 08:00:00.000000');

-- 2025-02-20
-- 2025-02-26
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (11, 1, 121, NULL, 'Create login layout', 'Create login layout', NULL, 'ADVANCED', 'FRONTEND', 'NORMAL', FALSE, '2025-02-20', '2025-02-26', '2025-02-26', '2025-02-20 08:00:00.000000', '2025-02-20 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (165, 11, 9, 'JOINED', '2025-02-20 08:00:00.000000'),
       (166, 11, 11, 'JOINED', '2025-02-20 08:00:00.000000'),
       (167, 11, 13, 'JOINED', '2025-02-20 08:00:00.000000'),
       (168, 11, 29, 'JOINED', '2025-02-20 08:00:00.000000'),
       (169, 11, 39, 'JOINED', '2025-02-20 08:00:00.000000'),
       (170, 11, 41, 'JOINED', '2025-02-20 08:00:00.000000'),
       (171, 11, 43, 'JOINED', '2025-02-20 08:00:00.000000'),
       (172, 11, 59, 'JOINED', '2025-02-20 08:00:00.000000'),
       (173, 11, 69, 'JOINED', '2025-02-20 08:00:00.000000'),
       (174, 11, 71, 'JOINED', '2025-02-20 08:00:00.000000'),
       (175, 11, 73, 'JOINED', '2025-02-20 08:00:00.000000'),
       (176, 11, 99, 'JOINED', '2025-02-20 08:00:00.000000'),
       (177, 11, 101, 'JOINED', '2025-02-20 08:00:00.000000'),
       (178, 11, 103, 'JOINED', '2025-02-20 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 165, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-23 08:00:00.000000', '2025-02-23 08:00:00.000000', '2025-02-26 08:00:00.000000'),
       (DEFAULT, 166, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-23 08:00:00.000000', '2025-02-23 08:00:00.000000', '2025-02-26 08:00:00.000000'),
       (DEFAULT, 167, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-23 08:00:00.000000', '2025-02-23 08:00:00.000000', '2025-02-26 08:00:00.000000'),
       (DEFAULT, 168, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-24 05:36:00.000000', '2025-02-24 05:36:00.000000', '2025-02-26 08:00:00.000000'),
       (DEFAULT, 169, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-23 08:00:00.000000', '2025-02-23 08:00:00.000000', '2025-02-26 08:00:00.000000'),
       (DEFAULT, 170, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-23 08:00:00.000000', '2025-02-23 08:00:00.000000', '2025-02-26 08:00:00.000000'),
       (DEFAULT, 171, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-23 08:00:00.000000', '2025-02-23 08:00:00.000000', '2025-02-26 08:00:00.000000'),
       (DEFAULT, 172, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-24 05:36:00.000000', '2025-02-24 05:36:00.000000', '2025-02-26 08:00:00.000000'),
       (DEFAULT, 173, 'Employee 69 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-26 00:48:00.000000', '2025-02-26 00:48:00.000000', '2025-02-26 08:00:00.000000'),
       (DEFAULT, 174, 'Employee 71 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-26 08:00:00.000000', '2025-02-26 08:00:00.000000', '2025-02-26 08:00:00.000000'),
       (DEFAULT, 175, 'Employee 73 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-26 08:00:00.000000', '2025-02-26 08:00:00.000000', '2025-02-26 08:00:00.000000'),
       (DEFAULT, 176, 'Employee 99 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-26 00:48:00.000000', '2025-02-26 00:48:00.000000', '2025-02-26 08:00:00.000000'),
       (DEFAULT, 177, 'Employee 101 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-26 00:48:00.000000', '2025-02-26 00:48:00.000000', '2025-02-26 08:00:00.000000'),
       (DEFAULT, 178, 'Employee 103 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-26 00:48:00.000000', '2025-02-26 00:48:00.000000', '2025-02-26 08:00:00.000000');

-- 2025-02-26
-- 2025-03-04
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (12, 1, 121, NULL, 'Create register layout', 'Create register layout', NULL, 'ADVANCED', 'FRONTEND', 'LOW', FALSE, '2025-02-26', '2025-03-04', '2025-03-04', '2025-02-26 08:00:00.000000', '2025-02-26 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (179, 12, 9, 'JOINED', '2025-02-26 08:00:00.000000'),
       (180, 12, 11, 'JOINED', '2025-02-26 08:00:00.000000'),
       (181, 12, 13, 'JOINED', '2025-02-26 08:00:00.000000'),
       (182, 12, 29, 'JOINED', '2025-02-26 08:00:00.000000'),
       (183, 12, 39, 'JOINED', '2025-02-26 08:00:00.000000'),
       (184, 12, 41, 'JOINED', '2025-02-26 08:00:00.000000'),
       (185, 12, 43, 'JOINED', '2025-02-26 08:00:00.000000'),
       (186, 12, 59, 'JOINED', '2025-02-26 08:00:00.000000'),
       (187, 12, 69, 'JOINED', '2025-02-26 08:00:00.000000'),
       (188, 12, 71, 'JOINED', '2025-02-26 08:00:00.000000'),
       (189, 12, 73, 'JOINED', '2025-02-26 08:00:00.000000'),
       (190, 12, 89, 'JOINED', '2025-02-26 08:00:00.000000'),
       (191, 12, 99, 'JOINED', '2025-02-26 08:00:00.000000'),
       (192, 12, 101, 'JOINED', '2025-02-26 08:00:00.000000'),
       (193, 12, 103, 'JOINED', '2025-02-26 08:00:00.000000'),
       (194, 12, 119, 'JOINED', '2025-02-26 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 179, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-04 08:00:00.000000', '2025-03-04 08:00:00.000000', '2025-03-04 08:00:00.000000'),
       (DEFAULT, 180, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-04 08:00:00.000000', '2025-03-04 08:00:00.000000', '2025-03-04 08:00:00.000000'),
       (DEFAULT, 181, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-04 08:00:00.000000', '2025-03-04 08:00:00.000000', '2025-03-04 08:00:00.000000'),
       (DEFAULT, 182, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-04 08:00:00.000000', '2025-03-04 08:00:00.000000', '2025-03-04 08:00:00.000000'),
       (DEFAULT, 183, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-04 08:00:00.000000', '2025-03-04 08:00:00.000000', '2025-03-04 08:00:00.000000'),
       (DEFAULT, 184, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-04 08:00:00.000000', '2025-03-04 08:00:00.000000', '2025-03-04 08:00:00.000000'),
       (DEFAULT, 185, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-04 08:00:00.000000', '2025-03-04 08:00:00.000000', '2025-03-04 08:00:00.000000'),
       (DEFAULT, 186, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-04 08:00:00.000000', '2025-03-04 08:00:00.000000', '2025-03-04 08:00:00.000000'),
       (DEFAULT, 187, 'Employee 69 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-04 08:00:00.000000', '2025-03-04 08:00:00.000000', '2025-03-04 08:00:00.000000'),
       (DEFAULT, 188, 'Employee 71 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-04 08:00:00.000000', '2025-03-04 08:00:00.000000', '2025-03-04 08:00:00.000000'),
       (DEFAULT, 189, 'Employee 73 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-04 08:00:00.000000', '2025-03-04 08:00:00.000000', '2025-03-04 08:00:00.000000'),
       (DEFAULT, 190, 'Employee 89 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-04 08:00:00.000000', '2025-03-04 08:00:00.000000', '2025-03-04 08:00:00.000000'),
       (DEFAULT, 191, 'Employee 99 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-04 08:00:00.000000', '2025-03-04 08:00:00.000000', '2025-03-04 08:00:00.000000'),
       (DEFAULT, 192, 'Employee 101 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-04 08:00:00.000000', '2025-03-04 08:00:00.000000', '2025-03-04 08:00:00.000000'),
       (DEFAULT, 193, 'Employee 103 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-04 08:00:00.000000', '2025-03-04 08:00:00.000000', '2025-03-04 08:00:00.000000'),
       (DEFAULT, 194, 'Employee 119 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-04 08:00:00.000000', '2025-03-04 08:00:00.000000', '2025-03-04 08:00:00.000000');

-- 2025-03-04
-- 2025-03-09
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (13, 1, 121, NULL, 'Build app header', 'Build app header', NULL, 'NORMAL', 'FRONTEND', 'NORMAL', FALSE, '2025-03-04', '2025-03-09', '2025-03-09', '2025-03-04 08:00:00.000000', '2025-03-04 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (195, 13, 15, 'JOINED', '2025-03-04 08:00:00.000000'),
       (196, 13, 17, 'JOINED', '2025-03-04 08:00:00.000000'),
       (197, 13, 19, 'JOINED', '2025-03-04 08:00:00.000000'),
       (198, 13, 21, 'JOINED', '2025-03-04 08:00:00.000000'),
       (199, 13, 29, 'JOINED', '2025-03-04 08:00:00.000000'),
       (200, 13, 45, 'JOINED', '2025-03-04 08:00:00.000000'),
       (201, 13, 47, 'JOINED', '2025-03-04 08:00:00.000000'),
       (202, 13, 49, 'JOINED', '2025-03-04 08:00:00.000000'),
       (203, 13, 51, 'JOINED', '2025-03-04 08:00:00.000000'),
       (204, 13, 59, 'JOINED', '2025-03-04 08:00:00.000000'),
       (205, 13, 75, 'JOINED', '2025-03-04 08:00:00.000000'),
       (206, 13, 77, 'JOINED', '2025-03-04 08:00:00.000000'),
       (207, 13, 79, 'JOINED', '2025-03-04 08:00:00.000000'),
       (208, 13, 81, 'JOINED', '2025-03-04 08:00:00.000000'),
       (209, 13, 89, 'JOINED', '2025-03-04 08:00:00.000000'),
       (210, 13, 105, 'JOINED', '2025-03-04 08:00:00.000000'),
       (211, 13, 107, 'JOINED', '2025-03-04 08:00:00.000000'),
       (212, 13, 109, 'JOINED', '2025-03-04 08:00:00.000000'),
       (213, 13, 111, 'JOINED', '2025-03-04 08:00:00.000000'),
       (214, 13, 119, 'JOINED', '2025-03-04 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 195, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-06 20:00:00.000000', '2025-03-06 20:00:00.000000', '2025-03-09 08:00:00.000000'),
       (DEFAULT, 196, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-06 20:00:00.000000', '2025-03-06 20:00:00.000000', '2025-03-09 08:00:00.000000'),
       (DEFAULT, 197, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-06 20:00:00.000000', '2025-03-06 20:00:00.000000', '2025-03-09 08:00:00.000000'),
       (DEFAULT, 198, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-06 20:00:00.000000', '2025-03-06 20:00:00.000000', '2025-03-09 08:00:00.000000'),
       (DEFAULT, 199, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-07 02:00:00.000000', '2025-03-07 02:00:00.000000', '2025-03-09 08:00:00.000000'),
       (DEFAULT, 200, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-06 20:00:00.000000', '2025-03-06 20:00:00.000000', '2025-03-09 08:00:00.000000'),
       (DEFAULT, 201, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-06 20:00:00.000000', '2025-03-06 20:00:00.000000', '2025-03-09 08:00:00.000000'),
       (DEFAULT, 202, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-06 20:00:00.000000', '2025-03-06 20:00:00.000000', '2025-03-09 08:00:00.000000'),
       (DEFAULT, 203, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-06 20:00:00.000000', '2025-03-06 20:00:00.000000', '2025-03-09 08:00:00.000000'),
       (DEFAULT, 204, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-07 02:00:00.000000', '2025-03-07 02:00:00.000000', '2025-03-09 08:00:00.000000'),
       (DEFAULT, 205, 'Employee 75 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-09 08:00:00.000000', '2025-03-09 08:00:00.000000', '2025-03-09 08:00:00.000000'),
       (DEFAULT, 206, 'Employee 77 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-09 08:00:00.000000', '2025-03-09 08:00:00.000000', '2025-03-09 08:00:00.000000'),
       (DEFAULT, 207, 'Employee 79 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-09 08:00:00.000000', '2025-03-09 08:00:00.000000', '2025-03-09 08:00:00.000000'),
       (DEFAULT, 208, 'Employee 81 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-09 08:00:00.000000', '2025-03-09 08:00:00.000000', '2025-03-09 08:00:00.000000'),
       (DEFAULT, 209, 'Employee 89 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-09 08:00:00.000000', '2025-03-09 08:00:00.000000', '2025-03-09 08:00:00.000000'),
       (DEFAULT, 210, 'Employee 105 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-09 02:00:00.000000', '2025-03-09 02:00:00.000000', '2025-03-09 08:00:00.000000'),
       (DEFAULT, 211, 'Employee 107 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-09 02:00:00.000000', '2025-03-09 02:00:00.000000', '2025-03-09 08:00:00.000000'),
       (DEFAULT, 212, 'Employee 109 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-09 02:00:00.000000', '2025-03-09 02:00:00.000000', '2025-03-09 08:00:00.000000'),
       (DEFAULT, 213, 'Employee 111 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-09 02:00:00.000000', '2025-03-09 02:00:00.000000', '2025-03-09 08:00:00.000000'),
       (DEFAULT, 214, 'Employee 119 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-09 02:00:00.000000', '2025-03-09 02:00:00.000000', '2025-03-09 08:00:00.000000');

-- 2025-03-09
-- 2025-03-14
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (14, 1, 121, NULL, 'Build app footer', 'Build app footer', NULL, 'NORMAL', 'FRONTEND', 'LOW', FALSE, '2025-03-09', '2025-03-14', '2025-03-14', '2025-03-09 08:00:00.000000', '2025-03-09 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (215, 14, 15, 'JOINED', '2025-03-09 08:00:00.000000'),
       (216, 14, 17, 'JOINED', '2025-03-09 08:00:00.000000'),
       (217, 14, 19, 'JOINED', '2025-03-09 08:00:00.000000'),
       (218, 14, 21, 'JOINED', '2025-03-09 08:00:00.000000'),
       (219, 14, 29, 'JOINED', '2025-03-09 08:00:00.000000'),
       (220, 14, 45, 'JOINED', '2025-03-09 08:00:00.000000'),
       (221, 14, 47, 'JOINED', '2025-03-09 08:00:00.000000'),
       (222, 14, 49, 'JOINED', '2025-03-09 08:00:00.000000'),
       (223, 14, 51, 'JOINED', '2025-03-09 08:00:00.000000'),
       (224, 14, 59, 'JOINED', '2025-03-09 08:00:00.000000'),
       (225, 14, 75, 'JOINED', '2025-03-09 08:00:00.000000'),
       (226, 14, 77, 'JOINED', '2025-03-09 08:00:00.000000'),
       (227, 14, 79, 'JOINED', '2025-03-09 08:00:00.000000'),
       (228, 14, 81, 'JOINED', '2025-03-09 08:00:00.000000'),
       (229, 14, 105, 'JOINED', '2025-03-09 08:00:00.000000'),
       (230, 14, 107, 'JOINED', '2025-03-09 08:00:00.000000'),
       (231, 14, 109, 'JOINED', '2025-03-09 08:00:00.000000'),
       (232, 14, 111, 'JOINED', '2025-03-09 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 215, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000'),
       (DEFAULT, 216, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000'),
       (DEFAULT, 217, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000'),
       (DEFAULT, 218, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000'),
       (DEFAULT, 219, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000'),
       (DEFAULT, 220, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000'),
       (DEFAULT, 221, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000'),
       (DEFAULT, 222, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000'),
       (DEFAULT, 223, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000'),
       (DEFAULT, 224, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000'),
       (DEFAULT, 225, 'Employee 75 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000'),
       (DEFAULT, 226, 'Employee 77 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000'),
       (DEFAULT, 227, 'Employee 79 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000'),
       (DEFAULT, 228, 'Employee 81 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000'),
       (DEFAULT, 229, 'Employee 105 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000'),
       (DEFAULT, 230, 'Employee 107 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000'),
       (DEFAULT, 231, 'Employee 109 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000'),
       (DEFAULT, 232, 'Employee 111 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000');

-- 2025-03-14
-- 2025-03-18
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (15, 1, 121, NULL, 'Create navigation sidebar', 'Create navigation sidebar', NULL, 'LIGHT', 'FRONTEND', 'NORMAL', FALSE, '2025-03-14', '2025-03-18', '2025-03-18', '2025-03-14 08:00:00.000000', '2025-03-14 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (233, 15, 23, 'JOINED', '2025-03-14 08:00:00.000000'),
       (234, 15, 25, 'JOINED', '2025-03-14 08:00:00.000000'),
       (235, 15, 27, 'JOINED', '2025-03-14 08:00:00.000000'),
       (236, 15, 29, 'JOINED', '2025-03-14 08:00:00.000000'),
       (237, 15, 53, 'JOINED', '2025-03-14 08:00:00.000000'),
       (238, 15, 55, 'JOINED', '2025-03-14 08:00:00.000000'),
       (239, 15, 57, 'JOINED', '2025-03-14 08:00:00.000000'),
       (240, 15, 59, 'JOINED', '2025-03-14 08:00:00.000000'),
       (241, 15, 83, 'JOINED', '2025-03-14 08:00:00.000000'),
       (242, 15, 85, 'JOINED', '2025-03-14 08:00:00.000000'),
       (243, 15, 87, 'JOINED', '2025-03-14 08:00:00.000000'),
       (244, 15, 113, 'JOINED', '2025-03-14 08:00:00.000000'),
       (245, 15, 115, 'JOINED', '2025-03-14 08:00:00.000000'),
       (246, 15, 117, 'JOINED', '2025-03-14 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 233, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-16 08:00:00.000000', '2025-03-16 08:00:00.000000', '2025-03-18 08:00:00.000000'),
       (DEFAULT, 234, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-16 08:00:00.000000', '2025-03-16 08:00:00.000000', '2025-03-18 08:00:00.000000'),
       (DEFAULT, 235, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-16 08:00:00.000000', '2025-03-16 08:00:00.000000', '2025-03-18 08:00:00.000000'),
       (DEFAULT, 236, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-16 08:00:00.000000', '2025-03-16 08:00:00.000000', '2025-03-18 08:00:00.000000'),
       (DEFAULT, 237, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-16 08:00:00.000000', '2025-03-16 08:00:00.000000', '2025-03-18 08:00:00.000000'),
       (DEFAULT, 238, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-16 08:00:00.000000', '2025-03-16 08:00:00.000000', '2025-03-18 08:00:00.000000'),
       (DEFAULT, 239, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-16 08:00:00.000000', '2025-03-16 08:00:00.000000', '2025-03-18 08:00:00.000000'),
       (DEFAULT, 240, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-16 08:00:00.000000', '2025-03-16 08:00:00.000000', '2025-03-18 08:00:00.000000'),
       (DEFAULT, 241, 'Employee 83 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-18 08:00:00.000000', '2025-03-18 08:00:00.000000', '2025-03-18 08:00:00.000000'),
       (DEFAULT, 242, 'Employee 85 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-18 08:00:00.000000', '2025-03-18 08:00:00.000000', '2025-03-18 08:00:00.000000'),
       (DEFAULT, 243, 'Employee 87 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-18 08:00:00.000000', '2025-03-18 08:00:00.000000', '2025-03-18 08:00:00.000000'),
       (DEFAULT, 244, 'Employee 113 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-18 03:12:00.000000', '2025-03-18 03:12:00.000000', '2025-03-18 08:00:00.000000'),
       (DEFAULT, 245, 'Employee 115 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-18 03:12:00.000000', '2025-03-18 03:12:00.000000', '2025-03-18 08:00:00.000000'),
       (DEFAULT, 246, 'Employee 117 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-18 03:12:00.000000', '2025-03-18 03:12:00.000000', '2025-03-18 08:00:00.000000');

-- 2025-03-18
-- 2025-03-22
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (16, 1, 121, NULL, 'Create task form', 'Create task form', NULL, 'LIGHT', 'FRONTEND', 'LOW', FALSE, '2025-03-18', '2025-03-22', '2025-03-22', '2025-03-18 08:00:00.000000', '2025-03-18 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (247, 16, 23, 'JOINED', '2025-03-18 08:00:00.000000'),
       (248, 16, 25, 'JOINED', '2025-03-18 08:00:00.000000'),
       (249, 16, 27, 'JOINED', '2025-03-18 08:00:00.000000'),
       (250, 16, 29, 'JOINED', '2025-03-18 08:00:00.000000'),
       (251, 16, 53, 'JOINED', '2025-03-18 08:00:00.000000'),
       (252, 16, 55, 'JOINED', '2025-03-18 08:00:00.000000'),
       (253, 16, 57, 'JOINED', '2025-03-18 08:00:00.000000'),
       (254, 16, 59, 'JOINED', '2025-03-18 08:00:00.000000'),
       (255, 16, 83, 'JOINED', '2025-03-18 08:00:00.000000'),
       (256, 16, 85, 'JOINED', '2025-03-18 08:00:00.000000'),
       (257, 16, 87, 'JOINED', '2025-03-18 08:00:00.000000'),
       (258, 16, 113, 'JOINED', '2025-03-18 08:00:00.000000'),
       (259, 16, 115, 'JOINED', '2025-03-18 08:00:00.000000'),
       (260, 16, 117, 'JOINED', '2025-03-18 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 247, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-22 08:00:00.000000', '2025-03-22 08:00:00.000000', '2025-03-22 08:00:00.000000'),
       (DEFAULT, 248, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-22 08:00:00.000000', '2025-03-22 08:00:00.000000', '2025-03-22 08:00:00.000000'),
       (DEFAULT, 249, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-22 08:00:00.000000', '2025-03-22 08:00:00.000000', '2025-03-22 08:00:00.000000'),
       (DEFAULT, 250, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-22 08:00:00.000000', '2025-03-22 08:00:00.000000', '2025-03-22 08:00:00.000000'),
       (DEFAULT, 251, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-22 08:00:00.000000', '2025-03-22 08:00:00.000000', '2025-03-22 08:00:00.000000'),
       (DEFAULT, 252, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-22 08:00:00.000000', '2025-03-22 08:00:00.000000', '2025-03-22 08:00:00.000000'),
       (DEFAULT, 253, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-22 08:00:00.000000', '2025-03-22 08:00:00.000000', '2025-03-22 08:00:00.000000'),
       (DEFAULT, 254, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-22 08:00:00.000000', '2025-03-22 08:00:00.000000', '2025-03-22 08:00:00.000000'),
       (DEFAULT, 255, 'Employee 83 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-22 08:00:00.000000', '2025-03-22 08:00:00.000000', '2025-03-22 08:00:00.000000'),
       (DEFAULT, 256, 'Employee 85 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-22 08:00:00.000000', '2025-03-22 08:00:00.000000', '2025-03-22 08:00:00.000000'),
       (DEFAULT, 257, 'Employee 87 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-22 08:00:00.000000', '2025-03-22 08:00:00.000000', '2025-03-22 08:00:00.000000'),
       (DEFAULT, 258, 'Employee 113 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-22 08:00:00.000000', '2025-03-22 08:00:00.000000', '2025-03-22 08:00:00.000000'),
       (DEFAULT, 259, 'Employee 115 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-22 08:00:00.000000', '2025-03-22 08:00:00.000000', '2025-03-22 08:00:00.000000'),
       (DEFAULT, 260, 'Employee 117 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-22 08:00:00.000000', '2025-03-22 08:00:00.000000', '2025-03-22 08:00:00.000000');

-- 2025-03-22
-- 2025-03-25
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (17, 1, 121, NULL, 'Create user repository', 'Create user repository', NULL, 'HARD', 'BACKEND', 'NORMAL', FALSE, '2025-03-22', '2025-03-25', '2025-03-25', '2025-03-22 08:00:00.000000', '2025-03-22 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (261, 17, 2, 'JOINED', '2025-03-22 08:00:00.000000'),
       (262, 17, 4, 'JOINED', '2025-03-22 08:00:00.000000'),
       (263, 17, 6, 'JOINED', '2025-03-22 08:00:00.000000'),
       (264, 17, 30, 'JOINED', '2025-03-22 08:00:00.000000'),
       (265, 17, 32, 'JOINED', '2025-03-22 08:00:00.000000'),
       (266, 17, 34, 'JOINED', '2025-03-22 08:00:00.000000'),
       (267, 17, 36, 'JOINED', '2025-03-22 08:00:00.000000'),
       (268, 17, 60, 'JOINED', '2025-03-22 08:00:00.000000'),
       (269, 17, 62, 'JOINED', '2025-03-22 08:00:00.000000'),
       (270, 17, 64, 'JOINED', '2025-03-22 08:00:00.000000'),
       (271, 17, 66, 'JOINED', '2025-03-22 08:00:00.000000'),
       (272, 17, 92, 'JOINED', '2025-03-22 08:00:00.000000'),
       (273, 17, 94, 'JOINED', '2025-03-22 08:00:00.000000'),
       (274, 17, 96, 'JOINED', '2025-03-22 08:00:00.000000'),
       (275, 17, 120, 'JOINED', '2025-03-22 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 261, 'Employee 2 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-23 23:36:00.000000', '2025-03-23 23:36:00.000000', '2025-03-25 08:00:00.000000'),
       (DEFAULT, 262, 'Employee 4 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-23 23:36:00.000000', '2025-03-23 23:36:00.000000', '2025-03-25 08:00:00.000000'),
       (DEFAULT, 263, 'Employee 6 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-23 23:36:00.000000', '2025-03-23 23:36:00.000000', '2025-03-25 08:00:00.000000'),
       (DEFAULT, 264, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-24 03:12:00.000000', '2025-03-24 03:12:00.000000', '2025-03-25 08:00:00.000000'),
       (DEFAULT, 265, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-23 23:36:00.000000', '2025-03-23 23:36:00.000000', '2025-03-25 08:00:00.000000'),
       (DEFAULT, 266, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-23 23:36:00.000000', '2025-03-23 23:36:00.000000', '2025-03-25 08:00:00.000000'),
       (DEFAULT, 267, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-23 23:36:00.000000', '2025-03-23 23:36:00.000000', '2025-03-25 08:00:00.000000'),
       (DEFAULT, 268, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-24 03:12:00.000000', '2025-03-24 03:12:00.000000', '2025-03-25 08:00:00.000000'),
       (DEFAULT, 269, 'Employee 62 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-25 08:00:00.000000', '2025-03-25 08:00:00.000000', '2025-03-25 08:00:00.000000'),
       (DEFAULT, 270, 'Employee 64 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-25 08:00:00.000000', '2025-03-25 08:00:00.000000', '2025-03-25 08:00:00.000000'),
       (DEFAULT, 271, 'Employee 66 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-25 08:00:00.000000', '2025-03-25 08:00:00.000000', '2025-03-25 08:00:00.000000'),
       (DEFAULT, 272, 'Employee 92 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-25 08:00:00.000000', '2025-03-25 08:00:00.000000', '2025-03-25 08:00:00.000000'),
       (DEFAULT, 273, 'Employee 94 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-25 08:00:00.000000', '2025-03-25 08:00:00.000000', '2025-03-25 08:00:00.000000'),
       (DEFAULT, 274, 'Employee 96 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-25 08:00:00.000000', '2025-03-25 08:00:00.000000', '2025-03-25 08:00:00.000000'),
       (DEFAULT, 275, 'Employee 120 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-25 08:00:00.000000', '2025-03-25 08:00:00.000000', '2025-03-25 08:00:00.000000');

-- 2025-03-25
-- 2025-04-01
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (18, 1, 121, NULL, 'Create task repository', 'Create task repository', NULL, 'HARD', 'BACKEND', 'LOW', FALSE, '2025-03-25', '2025-04-01', '2025-04-01', '2025-03-25 08:00:00.000000', '2025-03-25 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (276, 18, 32, 'JOINED', '2025-03-25 08:00:00.000000'),
       (277, 18, 34, 'JOINED', '2025-03-25 08:00:00.000000'),
       (278, 18, 36, 'JOINED', '2025-03-25 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 276, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-01 08:00:00.000000', '2025-04-01 08:00:00.000000', '2025-04-01 08:00:00.000000'),
       (DEFAULT, 277, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-01 08:00:00.000000', '2025-04-01 08:00:00.000000', '2025-04-01 08:00:00.000000'),
       (DEFAULT, 278, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-01 08:00:00.000000', '2025-04-01 08:00:00.000000', '2025-04-01 08:00:00.000000');

-- 2025-04-01
-- 2025-04-07
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (19, 1, 121, NULL, 'Add global exception handler', 'Add global exception handler', NULL, 'ADVANCED', 'BACKEND', 'NORMAL', FALSE, '2025-04-01', '2025-04-07', '2025-04-07', '2025-04-01 08:00:00.000000', '2025-04-01 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (279, 19, 8, 'JOINED', '2025-04-01 08:00:00.000000'),
       (280, 19, 10, 'JOINED', '2025-04-01 08:00:00.000000'),
       (281, 19, 12, 'JOINED', '2025-04-01 08:00:00.000000'),
       (282, 19, 14, 'JOINED', '2025-04-01 08:00:00.000000'),
       (283, 19, 30, 'JOINED', '2025-04-01 08:00:00.000000'),
       (284, 19, 38, 'JOINED', '2025-04-01 08:00:00.000000'),
       (285, 19, 40, 'JOINED', '2025-04-01 08:00:00.000000'),
       (286, 19, 42, 'JOINED', '2025-04-01 08:00:00.000000'),
       (287, 19, 44, 'JOINED', '2025-04-01 08:00:00.000000'),
       (288, 19, 60, 'JOINED', '2025-04-01 08:00:00.000000'),
       (289, 19, 68, 'JOINED', '2025-04-01 08:00:00.000000'),
       (290, 19, 98, 'JOINED', '2025-04-01 08:00:00.000000'),
       (291, 19, 100, 'JOINED', '2025-04-01 08:00:00.000000'),
       (292, 19, 102, 'JOINED', '2025-04-01 08:00:00.000000'),
       (293, 19, 104, 'JOINED', '2025-04-01 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 279, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-04 15:12:00.000000', '2025-04-04 15:12:00.000000', '2025-04-07 08:00:00.000000'),
       (DEFAULT, 280, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-04 15:12:00.000000', '2025-04-04 15:12:00.000000', '2025-04-07 08:00:00.000000'),
       (DEFAULT, 281, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-04 15:12:00.000000', '2025-04-04 15:12:00.000000', '2025-04-07 08:00:00.000000'),
       (DEFAULT, 282, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-04 15:12:00.000000', '2025-04-04 15:12:00.000000', '2025-04-07 08:00:00.000000'),
       (DEFAULT, 283, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-06 10:24:00.000000', '2025-04-06 10:24:00.000000', '2025-04-07 08:00:00.000000'),
       (DEFAULT, 284, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-04 15:12:00.000000', '2025-04-04 15:12:00.000000', '2025-04-07 08:00:00.000000'),
       (DEFAULT, 285, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-04 15:12:00.000000', '2025-04-04 15:12:00.000000', '2025-04-07 08:00:00.000000'),
       (DEFAULT, 286, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-04 15:12:00.000000', '2025-04-04 15:12:00.000000', '2025-04-07 08:00:00.000000'),
       (DEFAULT, 287, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-04 15:12:00.000000', '2025-04-04 15:12:00.000000', '2025-04-07 08:00:00.000000'),
       (DEFAULT, 288, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-06 10:24:00.000000', '2025-04-06 10:24:00.000000', '2025-04-07 08:00:00.000000'),
       (DEFAULT, 289, 'Employee 68 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-07 08:00:00.000000', '2025-04-07 08:00:00.000000', '2025-04-07 08:00:00.000000'),
       (DEFAULT, 290, 'Employee 98 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-07 08:00:00.000000', '2025-04-07 08:00:00.000000', '2025-04-07 08:00:00.000000'),
       (DEFAULT, 291, 'Employee 100 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-07 08:00:00.000000', '2025-04-07 08:00:00.000000', '2025-04-07 08:00:00.000000'),
       (DEFAULT, 292, 'Employee 102 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-07 08:00:00.000000', '2025-04-07 08:00:00.000000', '2025-04-07 08:00:00.000000'),
       (DEFAULT, 293, 'Employee 104 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-07 08:00:00.000000', '2025-04-07 08:00:00.000000', '2025-04-07 08:00:00.000000');

-- 2025-04-07
-- 2025-04-13
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (20, 1, 121, NULL, 'Add custom error response', 'Add custom error response', NULL, 'ADVANCED', 'BACKEND', 'LOW', FALSE, '2025-04-07', '2025-04-13', '2025-04-13', '2025-04-07 08:00:00.000000', '2025-04-07 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (294, 20, 8, 'JOINED', '2025-04-07 08:00:00.000000'),
       (295, 20, 10, 'JOINED', '2025-04-07 08:00:00.000000'),
       (296, 20, 12, 'JOINED', '2025-04-07 08:00:00.000000'),
       (297, 20, 14, 'JOINED', '2025-04-07 08:00:00.000000'),
       (298, 20, 38, 'JOINED', '2025-04-07 08:00:00.000000'),
       (299, 20, 40, 'JOINED', '2025-04-07 08:00:00.000000'),
       (300, 20, 42, 'JOINED', '2025-04-07 08:00:00.000000'),
       (301, 20, 44, 'JOINED', '2025-04-07 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 294, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-13 08:00:00.000000', '2025-04-13 08:00:00.000000', '2025-04-13 08:00:00.000000'),
       (DEFAULT, 295, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-13 08:00:00.000000', '2025-04-13 08:00:00.000000', '2025-04-13 08:00:00.000000'),
       (DEFAULT, 296, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-13 08:00:00.000000', '2025-04-13 08:00:00.000000', '2025-04-13 08:00:00.000000'),
       (DEFAULT, 297, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-13 08:00:00.000000', '2025-04-13 08:00:00.000000', '2025-04-13 08:00:00.000000'),
       (DEFAULT, 298, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-13 08:00:00.000000', '2025-04-13 08:00:00.000000', '2025-04-13 08:00:00.000000'),
       (DEFAULT, 299, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-13 08:00:00.000000', '2025-04-13 08:00:00.000000', '2025-04-13 08:00:00.000000'),
       (DEFAULT, 300, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-13 08:00:00.000000', '2025-04-13 08:00:00.000000', '2025-04-13 08:00:00.000000'),
       (DEFAULT, 301, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-13 08:00:00.000000', '2025-04-13 08:00:00.000000', '2025-04-13 08:00:00.000000');

-- 2025-04-13
-- 2025-04-18
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (21, 1, 121, NULL, 'Implement user service', 'Implement user service', NULL, 'NORMAL', 'BACKEND', 'NORMAL', FALSE, '2025-04-13', '2025-04-18', '2025-04-18', '2025-04-13 08:00:00.000000', '2025-04-13 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (302, 21, 16, 'JOINED', '2025-04-13 08:00:00.000000'),
       (303, 21, 18, 'JOINED', '2025-04-13 08:00:00.000000'),
       (304, 21, 20, 'JOINED', '2025-04-13 08:00:00.000000'),
       (305, 21, 30, 'JOINED', '2025-04-13 08:00:00.000000'),
       (306, 21, 46, 'JOINED', '2025-04-13 08:00:00.000000'),
       (307, 21, 48, 'JOINED', '2025-04-13 08:00:00.000000'),
       (308, 21, 50, 'JOINED', '2025-04-13 08:00:00.000000'),
       (309, 21, 60, 'JOINED', '2025-04-13 08:00:00.000000'),
       (310, 21, 106, 'JOINED', '2025-04-13 08:00:00.000000'),
       (311, 21, 108, 'JOINED', '2025-04-13 08:00:00.000000'),
       (312, 21, 110, 'JOINED', '2025-04-13 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 302, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-16 02:00:00.000000', '2025-04-16 02:00:00.000000', '2025-04-18 08:00:00.000000'),
       (DEFAULT, 303, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-16 02:00:00.000000', '2025-04-16 02:00:00.000000', '2025-04-18 08:00:00.000000'),
       (DEFAULT, 304, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-16 02:00:00.000000', '2025-04-16 02:00:00.000000', '2025-04-18 08:00:00.000000'),
       (DEFAULT, 305, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-17 08:00:00.000000', '2025-04-17 08:00:00.000000', '2025-04-18 08:00:00.000000'),
       (DEFAULT, 306, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-16 02:00:00.000000', '2025-04-16 02:00:00.000000', '2025-04-18 08:00:00.000000'),
       (DEFAULT, 307, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-16 02:00:00.000000', '2025-04-16 02:00:00.000000', '2025-04-18 08:00:00.000000'),
       (DEFAULT, 308, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-16 02:00:00.000000', '2025-04-16 02:00:00.000000', '2025-04-18 08:00:00.000000'),
       (DEFAULT, 309, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-17 08:00:00.000000', '2025-04-17 08:00:00.000000', '2025-04-18 08:00:00.000000'),
       (DEFAULT, 310, 'Employee 106 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-18 08:00:00.000000', '2025-04-18 08:00:00.000000', '2025-04-18 08:00:00.000000'),
       (DEFAULT, 311, 'Employee 108 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-18 08:00:00.000000', '2025-04-18 08:00:00.000000', '2025-04-18 08:00:00.000000'),
       (DEFAULT, 312, 'Employee 110 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-18 08:00:00.000000', '2025-04-18 08:00:00.000000', '2025-04-18 08:00:00.000000');

-- 2025-04-18
-- 2025-04-23
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (22, 1, 121, NULL, 'Implement task service', 'Implement task service', NULL, 'NORMAL', 'BACKEND', 'LOW', FALSE, '2025-04-18', '2025-04-23', '2025-04-23', '2025-04-18 08:00:00.000000', '2025-04-18 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (313, 22, 16, 'JOINED', '2025-04-18 08:00:00.000000'),
       (314, 22, 18, 'JOINED', '2025-04-18 08:00:00.000000'),
       (315, 22, 20, 'JOINED', '2025-04-18 08:00:00.000000'),
       (316, 22, 46, 'JOINED', '2025-04-18 08:00:00.000000'),
       (317, 22, 48, 'JOINED', '2025-04-18 08:00:00.000000'),
       (318, 22, 50, 'JOINED', '2025-04-18 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 313, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-23 08:00:00.000000', '2025-04-23 08:00:00.000000', '2025-04-23 08:00:00.000000'),
       (DEFAULT, 314, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-23 08:00:00.000000', '2025-04-23 08:00:00.000000', '2025-04-23 08:00:00.000000'),
       (DEFAULT, 315, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-23 08:00:00.000000', '2025-04-23 08:00:00.000000', '2025-04-23 08:00:00.000000'),
       (DEFAULT, 316, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-23 08:00:00.000000', '2025-04-23 08:00:00.000000', '2025-04-23 08:00:00.000000'),
       (DEFAULT, 317, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-23 08:00:00.000000', '2025-04-23 08:00:00.000000', '2025-04-23 08:00:00.000000'),
       (DEFAULT, 318, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-23 08:00:00.000000', '2025-04-23 08:00:00.000000', '2025-04-23 08:00:00.000000');

-- 2025-04-23
-- 2025-04-27
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (23, 1, 121, NULL, 'Implement auth service', 'Implement auth service', NULL, 'LIGHT', 'BACKEND', 'NORMAL', FALSE, '2025-04-23', '2025-04-27', '2025-04-27', '2025-04-23 08:00:00.000000', '2025-04-23 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (319, 23, 22, 'JOINED', '2025-04-23 08:00:00.000000'),
       (320, 23, 24, 'JOINED', '2025-04-23 08:00:00.000000'),
       (321, 23, 26, 'JOINED', '2025-04-23 08:00:00.000000'),
       (322, 23, 28, 'JOINED', '2025-04-23 08:00:00.000000'),
       (323, 23, 30, 'JOINED', '2025-04-23 08:00:00.000000'),
       (324, 23, 52, 'JOINED', '2025-04-23 08:00:00.000000'),
       (325, 23, 54, 'JOINED', '2025-04-23 08:00:00.000000'),
       (326, 23, 56, 'JOINED', '2025-04-23 08:00:00.000000'),
       (327, 23, 58, 'JOINED', '2025-04-23 08:00:00.000000'),
       (328, 23, 60, 'JOINED', '2025-04-23 08:00:00.000000'),
       (329, 23, 112, 'JOINED', '2025-04-23 08:00:00.000000'),
       (330, 23, 114, 'JOINED', '2025-04-23 08:00:00.000000'),
       (331, 23, 116, 'JOINED', '2025-04-23 08:00:00.000000'),
       (332, 23, 118, 'JOINED', '2025-04-23 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 319, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-25 12:48:00.000000', '2025-04-25 12:48:00.000000', '2025-04-27 08:00:00.000000'),
       (DEFAULT, 320, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-25 12:48:00.000000', '2025-04-25 12:48:00.000000', '2025-04-27 08:00:00.000000'),
       (DEFAULT, 321, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-25 12:48:00.000000', '2025-04-25 12:48:00.000000', '2025-04-27 08:00:00.000000'),
       (DEFAULT, 322, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-25 12:48:00.000000', '2025-04-25 12:48:00.000000', '2025-04-27 08:00:00.000000'),
       (DEFAULT, 323, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-26 03:12:00.000000', '2025-04-26 03:12:00.000000', '2025-04-27 08:00:00.000000'),
       (DEFAULT, 324, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-25 12:48:00.000000', '2025-04-25 12:48:00.000000', '2025-04-27 08:00:00.000000'),
       (DEFAULT, 325, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-25 12:48:00.000000', '2025-04-25 12:48:00.000000', '2025-04-27 08:00:00.000000'),
       (DEFAULT, 326, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-25 12:48:00.000000', '2025-04-25 12:48:00.000000', '2025-04-27 08:00:00.000000'),
       (DEFAULT, 327, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-25 12:48:00.000000', '2025-04-25 12:48:00.000000', '2025-04-27 08:00:00.000000'),
       (DEFAULT, 328, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-26 03:12:00.000000', '2025-04-26 03:12:00.000000', '2025-04-27 08:00:00.000000'),
       (DEFAULT, 329, 'Employee 112 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-27 08:00:00.000000', '2025-04-27 08:00:00.000000', '2025-04-27 08:00:00.000000'),
       (DEFAULT, 330, 'Employee 114 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-27 08:00:00.000000', '2025-04-27 08:00:00.000000', '2025-04-27 08:00:00.000000'),
       (DEFAULT, 331, 'Employee 116 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-27 08:00:00.000000', '2025-04-27 08:00:00.000000', '2025-04-27 08:00:00.000000'),
       (DEFAULT, 332, 'Employee 118 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-27 08:00:00.000000', '2025-04-27 08:00:00.000000', '2025-04-27 08:00:00.000000');

-- 2025-04-27
-- 2025-05-01
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (24, 1, 121, NULL, 'Implement jwt provider', 'Implement jwt provider', NULL, 'LIGHT', 'BACKEND', 'LOW', FALSE, '2025-04-27', '2025-05-01', '2025-05-01', '2025-04-27 08:00:00.000000', '2025-04-27 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (333, 24, 22, 'JOINED', '2025-04-27 08:00:00.000000'),
       (334, 24, 24, 'JOINED', '2025-04-27 08:00:00.000000'),
       (335, 24, 26, 'JOINED', '2025-04-27 08:00:00.000000'),
       (336, 24, 28, 'JOINED', '2025-04-27 08:00:00.000000'),
       (337, 24, 30, 'JOINED', '2025-04-27 08:00:00.000000'),
       (338, 24, 52, 'JOINED', '2025-04-27 08:00:00.000000'),
       (339, 24, 54, 'JOINED', '2025-04-27 08:00:00.000000'),
       (340, 24, 56, 'JOINED', '2025-04-27 08:00:00.000000'),
       (341, 24, 58, 'JOINED', '2025-04-27 08:00:00.000000'),
       (342, 24, 60, 'JOINED', '2025-04-27 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 333, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-01 08:00:00.000000', '2025-05-01 08:00:00.000000', '2025-05-01 08:00:00.000000'),
       (DEFAULT, 334, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-01 08:00:00.000000', '2025-05-01 08:00:00.000000', '2025-05-01 08:00:00.000000'),
       (DEFAULT, 335, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-01 08:00:00.000000', '2025-05-01 08:00:00.000000', '2025-05-01 08:00:00.000000'),
       (DEFAULT, 336, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-01 08:00:00.000000', '2025-05-01 08:00:00.000000', '2025-05-01 08:00:00.000000'),
       (DEFAULT, 337, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-01 08:00:00.000000', '2025-05-01 08:00:00.000000', '2025-05-01 08:00:00.000000'),
       (DEFAULT, 338, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-01 08:00:00.000000', '2025-05-01 08:00:00.000000', '2025-05-01 08:00:00.000000'),
       (DEFAULT, 339, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-01 08:00:00.000000', '2025-05-01 08:00:00.000000', '2025-05-01 08:00:00.000000'),
       (DEFAULT, 340, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-01 08:00:00.000000', '2025-05-01 08:00:00.000000', '2025-05-01 08:00:00.000000'),
       (DEFAULT, 341, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-01 08:00:00.000000', '2025-05-01 08:00:00.000000', '2025-05-01 08:00:00.000000'),
       (DEFAULT, 342, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-01 08:00:00.000000', '2025-05-01 08:00:00.000000', '2025-05-01 08:00:00.000000');

-- 2025-05-01
-- 2025-05-04
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (25, 1, 121, NULL, 'Create task edit form', 'Create task edit form', NULL, 'HARD', 'FRONTEND', 'NORMAL', FALSE, '2025-05-01', '2025-05-04', '2025-05-04', '2025-05-01 08:00:00.000000', '2025-05-01 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (343, 25, 1, 'JOINED', '2025-05-01 08:00:00.000000'),
       (344, 25, 3, 'JOINED', '2025-05-01 08:00:00.000000'),
       (345, 25, 5, 'JOINED', '2025-05-01 08:00:00.000000'),
       (346, 25, 7, 'JOINED', '2025-05-01 08:00:00.000000'),
       (347, 25, 29, 'JOINED', '2025-05-01 08:00:00.000000'),
       (348, 25, 31, 'JOINED', '2025-05-01 08:00:00.000000'),
       (349, 25, 33, 'JOINED', '2025-05-01 08:00:00.000000'),
       (350, 25, 35, 'JOINED', '2025-05-01 08:00:00.000000'),
       (351, 25, 37, 'JOINED', '2025-05-01 08:00:00.000000'),
       (352, 25, 59, 'JOINED', '2025-05-01 08:00:00.000000'),
       (353, 25, 61, 'JOINED', '2025-05-01 08:00:00.000000'),
       (354, 25, 63, 'JOINED', '2025-05-01 08:00:00.000000'),
       (355, 25, 65, 'JOINED', '2025-05-01 08:00:00.000000'),
       (356, 25, 67, 'JOINED', '2025-05-01 08:00:00.000000'),
       (357, 25, 91, 'JOINED', '2025-05-01 08:00:00.000000'),
       (358, 25, 93, 'JOINED', '2025-05-01 08:00:00.000000'),
       (359, 25, 95, 'JOINED', '2025-05-01 08:00:00.000000'),
       (360, 25, 97, 'JOINED', '2025-05-01 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 343, 'Employee 1 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-02 23:36:00.000000', '2025-05-02 23:36:00.000000', '2025-05-04 08:00:00.000000'),
       (DEFAULT, 344, 'Employee 3 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-02 23:36:00.000000', '2025-05-02 23:36:00.000000', '2025-05-04 08:00:00.000000'),
       (DEFAULT, 345, 'Employee 5 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-02 23:36:00.000000', '2025-05-02 23:36:00.000000', '2025-05-04 08:00:00.000000'),
       (DEFAULT, 346, 'Employee 7 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-02 23:36:00.000000', '2025-05-02 23:36:00.000000', '2025-05-04 08:00:00.000000'),
       (DEFAULT, 347, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-03 17:36:00.000000', '2025-05-03 17:36:00.000000', '2025-05-04 08:00:00.000000'),
       (DEFAULT, 348, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-02 23:36:00.000000', '2025-05-02 23:36:00.000000', '2025-05-04 08:00:00.000000'),
       (DEFAULT, 349, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-02 23:36:00.000000', '2025-05-02 23:36:00.000000', '2025-05-04 08:00:00.000000'),
       (DEFAULT, 350, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-02 23:36:00.000000', '2025-05-02 23:36:00.000000', '2025-05-04 08:00:00.000000'),
       (DEFAULT, 351, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-02 23:36:00.000000', '2025-05-02 23:36:00.000000', '2025-05-04 08:00:00.000000'),
       (DEFAULT, 352, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-03 17:36:00.000000', '2025-05-03 17:36:00.000000', '2025-05-04 08:00:00.000000'),
       (DEFAULT, 353, 'Employee 61 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-04 08:00:00.000000', '2025-05-04 08:00:00.000000', '2025-05-04 08:00:00.000000'),
       (DEFAULT, 354, 'Employee 63 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-04 08:00:00.000000', '2025-05-04 08:00:00.000000', '2025-05-04 08:00:00.000000'),
       (DEFAULT, 355, 'Employee 65 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-04 08:00:00.000000', '2025-05-04 08:00:00.000000', '2025-05-04 08:00:00.000000'),
       (DEFAULT, 356, 'Employee 67 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-04 08:00:00.000000', '2025-05-04 08:00:00.000000', '2025-05-04 08:00:00.000000'),
       (DEFAULT, 357, 'Employee 91 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-04 08:00:00.000000', '2025-05-04 08:00:00.000000', '2025-05-04 08:00:00.000000'),
       (DEFAULT, 358, 'Employee 93 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-04 08:00:00.000000', '2025-05-04 08:00:00.000000', '2025-05-04 08:00:00.000000'),
       (DEFAULT, 359, 'Employee 95 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-04 08:00:00.000000', '2025-05-04 08:00:00.000000', '2025-05-04 08:00:00.000000'),
       (DEFAULT, 360, 'Employee 97 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-04 08:00:00.000000', '2025-05-04 08:00:00.000000', '2025-05-04 08:00:00.000000');

-- 2025-05-04
-- 2025-05-11
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (26, 1, 121, NULL, 'Create login form', 'Create login form', NULL, 'HARD', 'FRONTEND', 'LOW', FALSE, '2025-05-04', '2025-05-11', '2025-05-11', '2025-05-04 08:00:00.000000', '2025-05-04 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (361, 26, 31, 'JOINED', '2025-05-04 08:00:00.000000'),
       (362, 26, 33, 'JOINED', '2025-05-04 08:00:00.000000'),
       (363, 26, 35, 'JOINED', '2025-05-04 08:00:00.000000'),
       (364, 26, 37, 'JOINED', '2025-05-04 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 361, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-11 08:00:00.000000', '2025-05-11 08:00:00.000000', '2025-05-11 08:00:00.000000'),
       (DEFAULT, 362, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-11 08:00:00.000000', '2025-05-11 08:00:00.000000', '2025-05-11 08:00:00.000000'),
       (DEFAULT, 363, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-11 08:00:00.000000', '2025-05-11 08:00:00.000000', '2025-05-11 08:00:00.000000'),
       (DEFAULT, 364, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-11 08:00:00.000000', '2025-05-11 08:00:00.000000', '2025-05-11 08:00:00.000000');

-- 2025-05-11
-- 2025-05-17
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (27, 1, 121, NULL, 'Create register form', 'Create register form', NULL, 'ADVANCED', 'FRONTEND', 'NORMAL', FALSE, '2025-05-11', '2025-05-17', '2025-05-17', '2025-05-11 08:00:00.000000', '2025-05-11 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (365, 27, 9, 'JOINED', '2025-05-11 08:00:00.000000'),
       (366, 27, 11, 'JOINED', '2025-05-11 08:00:00.000000'),
       (367, 27, 13, 'JOINED', '2025-05-11 08:00:00.000000'),
       (368, 27, 29, 'JOINED', '2025-05-11 08:00:00.000000'),
       (369, 27, 39, 'JOINED', '2025-05-11 08:00:00.000000'),
       (370, 27, 41, 'JOINED', '2025-05-11 08:00:00.000000'),
       (371, 27, 43, 'JOINED', '2025-05-11 08:00:00.000000'),
       (372, 27, 59, 'JOINED', '2025-05-11 08:00:00.000000'),
       (373, 27, 69, 'JOINED', '2025-05-11 08:00:00.000000'),
       (374, 27, 99, 'JOINED', '2025-05-11 08:00:00.000000'),
       (375, 27, 101, 'JOINED', '2025-05-11 08:00:00.000000'),
       (376, 27, 103, 'JOINED', '2025-05-11 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 365, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-14 15:12:00.000000', '2025-05-14 15:12:00.000000', '2025-05-17 08:00:00.000000'),
       (DEFAULT, 366, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-14 15:12:00.000000', '2025-05-14 15:12:00.000000', '2025-05-17 08:00:00.000000'),
       (DEFAULT, 367, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-14 15:12:00.000000', '2025-05-14 15:12:00.000000', '2025-05-17 08:00:00.000000'),
       (DEFAULT, 368, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-15 12:48:00.000000', '2025-05-15 12:48:00.000000', '2025-05-17 08:00:00.000000'),
       (DEFAULT, 369, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-14 15:12:00.000000', '2025-05-14 15:12:00.000000', '2025-05-17 08:00:00.000000'),
       (DEFAULT, 370, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-14 15:12:00.000000', '2025-05-14 15:12:00.000000', '2025-05-17 08:00:00.000000'),
       (DEFAULT, 371, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-14 15:12:00.000000', '2025-05-14 15:12:00.000000', '2025-05-17 08:00:00.000000'),
       (DEFAULT, 372, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-15 12:48:00.000000', '2025-05-15 12:48:00.000000', '2025-05-17 08:00:00.000000'),
       (DEFAULT, 373, 'Employee 69 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-17 08:00:00.000000', '2025-05-17 08:00:00.000000', '2025-05-17 08:00:00.000000'),
       (DEFAULT, 374, 'Employee 99 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-17 08:00:00.000000', '2025-05-17 08:00:00.000000', '2025-05-17 08:00:00.000000'),
       (DEFAULT, 375, 'Employee 101 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-17 08:00:00.000000', '2025-05-17 08:00:00.000000', '2025-05-17 08:00:00.000000'),
       (DEFAULT, 376, 'Employee 103 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-17 08:00:00.000000', '2025-05-17 08:00:00.000000', '2025-05-17 08:00:00.000000');

-- 2025-05-17
-- 2025-05-23
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (28, 1, 121, NULL, 'Add basic form validation', 'Add basic form validation', NULL, 'ADVANCED', 'FRONTEND', 'LOW', FALSE, '2025-05-17', '2025-05-23', '2025-05-23', '2025-05-17 08:00:00.000000', '2025-05-17 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (377, 28, 9, 'JOINED', '2025-05-17 08:00:00.000000'),
       (378, 28, 11, 'JOINED', '2025-05-17 08:00:00.000000'),
       (379, 28, 13, 'JOINED', '2025-05-17 08:00:00.000000'),
       (380, 28, 29, 'JOINED', '2025-05-17 08:00:00.000000'),
       (381, 28, 39, 'JOINED', '2025-05-17 08:00:00.000000'),
       (382, 28, 41, 'JOINED', '2025-05-17 08:00:00.000000'),
       (383, 28, 43, 'JOINED', '2025-05-17 08:00:00.000000'),
       (384, 28, 59, 'JOINED', '2025-05-17 08:00:00.000000'),
       (385, 28, 69, 'JOINED', '2025-05-17 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 377, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-23 08:00:00.000000', '2025-05-23 08:00:00.000000', '2025-05-23 08:00:00.000000'),
       (DEFAULT, 378, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-23 08:00:00.000000', '2025-05-23 08:00:00.000000', '2025-05-23 08:00:00.000000'),
       (DEFAULT, 379, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-23 08:00:00.000000', '2025-05-23 08:00:00.000000', '2025-05-23 08:00:00.000000'),
       (DEFAULT, 380, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-23 08:00:00.000000', '2025-05-23 08:00:00.000000', '2025-05-23 08:00:00.000000'),
       (DEFAULT, 381, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-23 08:00:00.000000', '2025-05-23 08:00:00.000000', '2025-05-23 08:00:00.000000'),
       (DEFAULT, 382, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-23 08:00:00.000000', '2025-05-23 08:00:00.000000', '2025-05-23 08:00:00.000000'),
       (DEFAULT, 383, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-23 08:00:00.000000', '2025-05-23 08:00:00.000000', '2025-05-23 08:00:00.000000'),
       (DEFAULT, 384, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-23 08:00:00.000000', '2025-05-23 08:00:00.000000', '2025-05-23 08:00:00.000000'),
       (DEFAULT, 385, 'Employee 69 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-23 08:00:00.000000', '2025-05-23 08:00:00.000000', '2025-05-23 08:00:00.000000');

-- 2025-05-23
-- 2025-05-28
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (29, 1, 121, NULL, 'Render task list', 'Render task list', NULL, 'NORMAL', 'FRONTEND', 'NORMAL', FALSE, '2025-05-23', '2025-05-28', '2025-05-28', '2025-05-23 08:00:00.000000', '2025-05-23 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (386, 29, 15, 'JOINED', '2025-05-23 08:00:00.000000'),
       (387, 29, 17, 'JOINED', '2025-05-23 08:00:00.000000'),
       (388, 29, 19, 'JOINED', '2025-05-23 08:00:00.000000'),
       (389, 29, 21, 'JOINED', '2025-05-23 08:00:00.000000'),
       (390, 29, 29, 'JOINED', '2025-05-23 08:00:00.000000'),
       (391, 29, 45, 'JOINED', '2025-05-23 08:00:00.000000'),
       (392, 29, 47, 'JOINED', '2025-05-23 08:00:00.000000'),
       (393, 29, 49, 'JOINED', '2025-05-23 08:00:00.000000'),
       (394, 29, 51, 'JOINED', '2025-05-23 08:00:00.000000'),
       (395, 29, 59, 'JOINED', '2025-05-23 08:00:00.000000'),
       (396, 29, 105, 'JOINED', '2025-05-23 08:00:00.000000'),
       (397, 29, 107, 'JOINED', '2025-05-23 08:00:00.000000'),
       (398, 29, 109, 'JOINED', '2025-05-23 08:00:00.000000'),
       (399, 29, 111, 'JOINED', '2025-05-23 08:00:00.000000'),
       (400, 29, 119, 'JOINED', '2025-05-23 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 386, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-26 02:00:00.000000', '2025-05-26 02:00:00.000000', '2025-05-28 08:00:00.000000'),
       (DEFAULT, 387, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-26 02:00:00.000000', '2025-05-26 02:00:00.000000', '2025-05-28 08:00:00.000000'),
       (DEFAULT, 388, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-26 02:00:00.000000', '2025-05-26 02:00:00.000000', '2025-05-28 08:00:00.000000'),
       (DEFAULT, 389, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-26 02:00:00.000000', '2025-05-26 02:00:00.000000', '2025-05-28 08:00:00.000000'),
       (DEFAULT, 390, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-26 08:00:00.000000', '2025-05-26 08:00:00.000000', '2025-05-28 08:00:00.000000'),
       (DEFAULT, 391, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-26 02:00:00.000000', '2025-05-26 02:00:00.000000', '2025-05-28 08:00:00.000000'),
       (DEFAULT, 392, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-26 02:00:00.000000', '2025-05-26 02:00:00.000000', '2025-05-28 08:00:00.000000'),
       (DEFAULT, 393, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-26 02:00:00.000000', '2025-05-26 02:00:00.000000', '2025-05-28 08:00:00.000000'),
       (DEFAULT, 394, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-26 02:00:00.000000', '2025-05-26 02:00:00.000000', '2025-05-28 08:00:00.000000'),
       (DEFAULT, 395, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-26 08:00:00.000000', '2025-05-26 08:00:00.000000', '2025-05-28 08:00:00.000000'),
       (DEFAULT, 396, 'Employee 105 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-28 08:00:00.000000', '2025-05-28 08:00:00.000000', '2025-05-28 08:00:00.000000'),
       (DEFAULT, 397, 'Employee 107 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-28 08:00:00.000000', '2025-05-28 08:00:00.000000', '2025-05-28 08:00:00.000000'),
       (DEFAULT, 398, 'Employee 109 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-28 08:00:00.000000', '2025-05-28 08:00:00.000000', '2025-05-28 08:00:00.000000'),
       (DEFAULT, 399, 'Employee 111 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-28 08:00:00.000000', '2025-05-28 08:00:00.000000', '2025-05-28 08:00:00.000000'),
       (DEFAULT, 400, 'Employee 119 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-28 08:00:00.000000', '2025-05-28 08:00:00.000000', '2025-05-28 08:00:00.000000');

-- 2025-05-28
-- 2025-06-02
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (30, 1, 121, NULL, 'Render task detail', 'Render task detail', NULL, 'NORMAL', 'FRONTEND', 'LOW', FALSE, '2025-05-28', '2025-06-02', '2025-06-02', '2025-05-28 08:00:00.000000', '2025-05-28 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (401, 30, 15, 'JOINED', '2025-05-28 08:00:00.000000'),
       (402, 30, 17, 'JOINED', '2025-05-28 08:00:00.000000'),
       (403, 30, 19, 'JOINED', '2025-05-28 08:00:00.000000'),
       (404, 30, 21, 'JOINED', '2025-05-28 08:00:00.000000'),
       (405, 30, 45, 'JOINED', '2025-05-28 08:00:00.000000'),
       (406, 30, 47, 'JOINED', '2025-05-28 08:00:00.000000'),
       (407, 30, 49, 'JOINED', '2025-05-28 08:00:00.000000'),
       (408, 30, 51, 'JOINED', '2025-05-28 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 401, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-02 08:00:00.000000', '2025-06-02 08:00:00.000000', '2025-06-02 08:00:00.000000'),
       (DEFAULT, 402, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-02 08:00:00.000000', '2025-06-02 08:00:00.000000', '2025-06-02 08:00:00.000000'),
       (DEFAULT, 403, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-02 08:00:00.000000', '2025-06-02 08:00:00.000000', '2025-06-02 08:00:00.000000'),
       (DEFAULT, 404, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-02 08:00:00.000000', '2025-06-02 08:00:00.000000', '2025-06-02 08:00:00.000000'),
       (DEFAULT, 405, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-02 08:00:00.000000', '2025-06-02 08:00:00.000000', '2025-06-02 08:00:00.000000'),
       (DEFAULT, 406, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-02 08:00:00.000000', '2025-06-02 08:00:00.000000', '2025-06-02 08:00:00.000000'),
       (DEFAULT, 407, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-02 08:00:00.000000', '2025-06-02 08:00:00.000000', '2025-06-02 08:00:00.000000'),
       (DEFAULT, 408, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-02 08:00:00.000000', '2025-06-02 08:00:00.000000', '2025-06-02 08:00:00.000000');

-- 2025-06-02
-- 2025-06-06
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (31, 1, 121, NULL, 'Add create task button', 'Add create task button', NULL, 'LIGHT', 'FRONTEND', 'NORMAL', FALSE, '2025-06-02', '2025-06-06', '2025-06-06', '2025-06-02 08:00:00.000000', '2025-06-02 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (409, 31, 23, 'JOINED', '2025-06-02 08:00:00.000000'),
       (410, 31, 25, 'JOINED', '2025-06-02 08:00:00.000000'),
       (411, 31, 27, 'JOINED', '2025-06-02 08:00:00.000000'),
       (412, 31, 29, 'JOINED', '2025-06-02 08:00:00.000000'),
       (413, 31, 53, 'JOINED', '2025-06-02 08:00:00.000000'),
       (414, 31, 55, 'JOINED', '2025-06-02 08:00:00.000000'),
       (415, 31, 57, 'JOINED', '2025-06-02 08:00:00.000000'),
       (416, 31, 59, 'JOINED', '2025-06-02 08:00:00.000000'),
       (417, 31, 113, 'JOINED', '2025-06-02 08:00:00.000000'),
       (418, 31, 115, 'JOINED', '2025-06-02 08:00:00.000000'),
       (419, 31, 117, 'JOINED', '2025-06-02 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 409, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-04 12:48:00.000000', '2025-06-04 12:48:00.000000', '2025-06-06 08:00:00.000000'),
       (DEFAULT, 410, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-04 12:48:00.000000', '2025-06-04 12:48:00.000000', '2025-06-06 08:00:00.000000'),
       (DEFAULT, 411, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-04 12:48:00.000000', '2025-06-04 12:48:00.000000', '2025-06-06 08:00:00.000000'),
       (DEFAULT, 412, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-05 17:36:00.000000', '2025-06-05 17:36:00.000000', '2025-06-06 08:00:00.000000'),
       (DEFAULT, 413, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-04 12:48:00.000000', '2025-06-04 12:48:00.000000', '2025-06-06 08:00:00.000000'),
       (DEFAULT, 414, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-04 12:48:00.000000', '2025-06-04 12:48:00.000000', '2025-06-06 08:00:00.000000'),
       (DEFAULT, 415, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-04 12:48:00.000000', '2025-06-04 12:48:00.000000', '2025-06-06 08:00:00.000000'),
       (DEFAULT, 416, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-05 17:36:00.000000', '2025-06-05 17:36:00.000000', '2025-06-06 08:00:00.000000'),
       (DEFAULT, 417, 'Employee 113 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-06 08:00:00.000000', '2025-06-06 08:00:00.000000', '2025-06-06 08:00:00.000000'),
       (DEFAULT, 418, 'Employee 115 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-06 08:00:00.000000', '2025-06-06 08:00:00.000000', '2025-06-06 08:00:00.000000'),
       (DEFAULT, 419, 'Employee 117 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-06 08:00:00.000000', '2025-06-06 08:00:00.000000', '2025-06-06 08:00:00.000000');

-- 2025-06-06
-- 2025-06-10
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (32, 1, 121, NULL, 'Add delete task button', 'Add delete task button', NULL, 'LIGHT', 'FRONTEND', 'LOW', FALSE, '2025-06-06', '2025-06-10', '2025-06-10', '2025-06-06 08:00:00.000000', '2025-06-06 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (420, 32, 23, 'JOINED', '2025-06-06 08:00:00.000000'),
       (421, 32, 25, 'JOINED', '2025-06-06 08:00:00.000000'),
       (422, 32, 27, 'JOINED', '2025-06-06 08:00:00.000000'),
       (423, 32, 53, 'JOINED', '2025-06-06 08:00:00.000000'),
       (424, 32, 55, 'JOINED', '2025-06-06 08:00:00.000000'),
       (425, 32, 57, 'JOINED', '2025-06-06 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 420, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-10 08:00:00.000000', '2025-06-10 08:00:00.000000', '2025-06-10 08:00:00.000000'),
       (DEFAULT, 421, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-10 08:00:00.000000', '2025-06-10 08:00:00.000000', '2025-06-10 08:00:00.000000'),
       (DEFAULT, 422, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-10 08:00:00.000000', '2025-06-10 08:00:00.000000', '2025-06-10 08:00:00.000000'),
       (DEFAULT, 423, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-10 08:00:00.000000', '2025-06-10 08:00:00.000000', '2025-06-10 08:00:00.000000'),
       (DEFAULT, 424, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-10 08:00:00.000000', '2025-06-10 08:00:00.000000', '2025-06-10 08:00:00.000000'),
       (DEFAULT, 425, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-10 08:00:00.000000', '2025-06-10 08:00:00.000000', '2025-06-10 08:00:00.000000');

-- 2025-06-10
-- 2025-06-13
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (33, 1, 121, NULL, 'Implement jwt filter', 'Implement jwt filter', NULL, 'HARD', 'BACKEND', 'NORMAL', FALSE, '2025-06-10', '2025-06-13', '2025-06-13', '2025-06-10 08:00:00.000000', '2025-06-10 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (426, 33, 2, 'JOINED', '2025-06-10 08:00:00.000000'),
       (427, 33, 4, 'JOINED', '2025-06-10 08:00:00.000000'),
       (428, 33, 6, 'JOINED', '2025-06-10 08:00:00.000000'),
       (429, 33, 30, 'JOINED', '2025-06-10 08:00:00.000000'),
       (430, 33, 32, 'JOINED', '2025-06-10 08:00:00.000000'),
       (431, 33, 34, 'JOINED', '2025-06-10 08:00:00.000000'),
       (432, 33, 36, 'JOINED', '2025-06-10 08:00:00.000000'),
       (433, 33, 60, 'JOINED', '2025-06-10 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 426, 'Employee 2 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-12 03:12:00.000000', '2025-06-12 03:12:00.000000', '2025-06-13 08:00:00.000000'),
       (DEFAULT, 427, 'Employee 4 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-12 03:12:00.000000', '2025-06-12 03:12:00.000000', '2025-06-13 08:00:00.000000'),
       (DEFAULT, 428, 'Employee 6 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-12 03:12:00.000000', '2025-06-12 03:12:00.000000', '2025-06-13 08:00:00.000000'),
       (DEFAULT, 429, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-13 04:24:00.000000', '2025-06-13 04:24:00.000000', '2025-06-13 08:00:00.000000'),
       (DEFAULT, 430, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-12 03:12:00.000000', '2025-06-12 03:12:00.000000', '2025-06-13 08:00:00.000000'),
       (DEFAULT, 431, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-12 03:12:00.000000', '2025-06-12 03:12:00.000000', '2025-06-13 08:00:00.000000'),
       (DEFAULT, 432, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-12 03:12:00.000000', '2025-06-12 03:12:00.000000', '2025-06-13 08:00:00.000000'),
       (DEFAULT, 433, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-13 04:24:00.000000', '2025-06-13 04:24:00.000000', '2025-06-13 08:00:00.000000');

-- 2025-06-13
-- 2025-06-20
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (34, 1, 121, NULL, 'Add login endpoint', 'Add login endpoint', NULL, 'HARD', 'BACKEND', 'LOW', FALSE, '2025-06-13', '2025-06-20', '2025-06-20', '2025-06-13 08:00:00.000000', '2025-06-13 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (434, 34, 32, 'JOINED', '2025-06-13 08:00:00.000000'),
       (435, 34, 34, 'JOINED', '2025-06-13 08:00:00.000000'),
       (436, 34, 36, 'JOINED', '2025-06-13 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 434, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-20 08:00:00.000000', '2025-06-20 08:00:00.000000', '2025-06-20 08:00:00.000000'),
       (DEFAULT, 435, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-20 08:00:00.000000', '2025-06-20 08:00:00.000000', '2025-06-20 08:00:00.000000'),
       (DEFAULT, 436, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-20 08:00:00.000000', '2025-06-20 08:00:00.000000', '2025-06-20 08:00:00.000000');

-- 2025-06-20
-- 2025-06-26
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (35, 1, 121, NULL, 'Add register endpoint', 'Add register endpoint', NULL, 'ADVANCED', 'BACKEND', 'NORMAL', FALSE, '2025-06-20', '2025-06-26', '2025-06-26', '2025-06-20 08:00:00.000000', '2025-06-20 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (437, 35, 8, 'JOINED', '2025-06-20 08:00:00.000000'),
       (438, 35, 10, 'JOINED', '2025-06-20 08:00:00.000000'),
       (439, 35, 12, 'JOINED', '2025-06-20 08:00:00.000000'),
       (440, 35, 14, 'JOINED', '2025-06-20 08:00:00.000000'),
       (441, 35, 30, 'JOINED', '2025-06-20 08:00:00.000000'),
       (442, 35, 38, 'JOINED', '2025-06-20 08:00:00.000000'),
       (443, 35, 40, 'JOINED', '2025-06-20 08:00:00.000000'),
       (444, 35, 42, 'JOINED', '2025-06-20 08:00:00.000000'),
       (445, 35, 44, 'JOINED', '2025-06-20 08:00:00.000000'),
       (446, 35, 60, 'JOINED', '2025-06-20 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 437, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-23 22:24:00.000000', '2025-06-23 22:24:00.000000', '2025-06-26 08:00:00.000000'),
       (DEFAULT, 438, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-23 22:24:00.000000', '2025-06-23 22:24:00.000000', '2025-06-26 08:00:00.000000'),
       (DEFAULT, 439, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-23 22:24:00.000000', '2025-06-23 22:24:00.000000', '2025-06-26 08:00:00.000000'),
       (DEFAULT, 440, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-23 22:24:00.000000', '2025-06-23 22:24:00.000000', '2025-06-26 08:00:00.000000'),
       (DEFAULT, 441, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-25 17:36:00.000000', '2025-06-25 17:36:00.000000', '2025-06-26 08:00:00.000000'),
       (DEFAULT, 442, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-23 22:24:00.000000', '2025-06-23 22:24:00.000000', '2025-06-26 08:00:00.000000'),
       (DEFAULT, 443, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-23 22:24:00.000000', '2025-06-23 22:24:00.000000', '2025-06-26 08:00:00.000000'),
       (DEFAULT, 444, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-23 22:24:00.000000', '2025-06-23 22:24:00.000000', '2025-06-26 08:00:00.000000'),
       (DEFAULT, 445, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-23 22:24:00.000000', '2025-06-23 22:24:00.000000', '2025-06-26 08:00:00.000000'),
       (DEFAULT, 446, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-25 17:36:00.000000', '2025-06-25 17:36:00.000000', '2025-06-26 08:00:00.000000');

-- 2025-06-26
-- 2025-07-02
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (36, 1, 121, NULL, 'Add refresh token endpoint', 'Add refresh token endpoint', NULL, 'ADVANCED', 'BACKEND', 'LOW', FALSE, '2025-06-26', '2025-07-02', '2025-07-02', '2025-06-26 08:00:00.000000', '2025-06-26 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (447, 36, 38, 'JOINED', '2025-06-26 08:00:00.000000'),
       (448, 36, 40, 'JOINED', '2025-06-26 08:00:00.000000'),
       (449, 36, 42, 'JOINED', '2025-06-26 08:00:00.000000'),
       (450, 36, 44, 'JOINED', '2025-06-26 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 447, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-02 08:00:00.000000', '2025-07-02 08:00:00.000000', '2025-07-02 08:00:00.000000'),
       (DEFAULT, 448, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-02 08:00:00.000000', '2025-07-02 08:00:00.000000', '2025-07-02 08:00:00.000000'),
       (DEFAULT, 449, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-02 08:00:00.000000', '2025-07-02 08:00:00.000000', '2025-07-02 08:00:00.000000'),
       (DEFAULT, 450, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-02 08:00:00.000000', '2025-07-02 08:00:00.000000', '2025-07-02 08:00:00.000000');

-- 2025-07-02
-- 2025-07-07
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (37, 1, 121, NULL, 'Add create task endpoint', 'Add create task endpoint', NULL, 'NORMAL', 'BACKEND', 'NORMAL', FALSE, '2025-07-02', '2025-07-07', '2025-07-07', '2025-07-02 08:00:00.000000', '2025-07-02 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (451, 37, 16, 'JOINED', '2025-07-02 08:00:00.000000'),
       (452, 37, 18, 'JOINED', '2025-07-02 08:00:00.000000'),
       (453, 37, 20, 'JOINED', '2025-07-02 08:00:00.000000'),
       (454, 37, 46, 'JOINED', '2025-07-02 08:00:00.000000'),
       (455, 37, 48, 'JOINED', '2025-07-02 08:00:00.000000'),
       (456, 37, 50, 'JOINED', '2025-07-02 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 451, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-05 08:00:00.000000', '2025-07-05 08:00:00.000000', '2025-07-07 08:00:00.000000'),
       (DEFAULT, 452, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-05 08:00:00.000000', '2025-07-05 08:00:00.000000', '2025-07-07 08:00:00.000000'),
       (DEFAULT, 453, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-05 08:00:00.000000', '2025-07-05 08:00:00.000000', '2025-07-07 08:00:00.000000'),
       (DEFAULT, 454, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-05 08:00:00.000000', '2025-07-05 08:00:00.000000', '2025-07-07 08:00:00.000000'),
       (DEFAULT, 455, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-05 08:00:00.000000', '2025-07-05 08:00:00.000000', '2025-07-07 08:00:00.000000'),
       (DEFAULT, 456, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-05 08:00:00.000000', '2025-07-05 08:00:00.000000', '2025-07-07 08:00:00.000000');

-- 2025-07-07
-- 2025-07-12
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (38, 1, 121, NULL, 'Add update task endpoint', 'Add update task endpoint', NULL, 'NORMAL', 'BACKEND', 'LOW', FALSE, '2025-07-07', '2025-07-12', '2025-07-12', '2025-07-07 08:00:00.000000', '2025-07-07 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (457, 38, 46, 'JOINED', '2025-07-07 08:00:00.000000'),
       (458, 38, 48, 'JOINED', '2025-07-07 08:00:00.000000'),
       (459, 38, 50, 'JOINED', '2025-07-07 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 457, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-12 08:00:00.000000', '2025-07-12 08:00:00.000000', '2025-07-12 08:00:00.000000'),
       (DEFAULT, 458, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-12 08:00:00.000000', '2025-07-12 08:00:00.000000', '2025-07-12 08:00:00.000000'),
       (DEFAULT, 459, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-12 08:00:00.000000', '2025-07-12 08:00:00.000000', '2025-07-12 08:00:00.000000');

-- 2025-07-12
-- 2025-07-16
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (39, 1, 121, NULL, 'Add delete task endpoint', 'Add delete task endpoint', NULL, 'LIGHT', 'BACKEND', 'NORMAL', FALSE, '2025-07-12', '2025-07-16', '2025-07-16', '2025-07-12 08:00:00.000000', '2025-07-12 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (460, 39, 22, 'JOINED', '2025-07-12 08:00:00.000000'),
       (461, 39, 24, 'JOINED', '2025-07-12 08:00:00.000000'),
       (462, 39, 26, 'JOINED', '2025-07-12 08:00:00.000000'),
       (463, 39, 28, 'JOINED', '2025-07-12 08:00:00.000000'),
       (464, 39, 52, 'JOINED', '2025-07-12 08:00:00.000000'),
       (465, 39, 54, 'JOINED', '2025-07-12 08:00:00.000000'),
       (466, 39, 56, 'JOINED', '2025-07-12 08:00:00.000000'),
       (467, 39, 58, 'JOINED', '2025-07-12 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 460, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-14 17:36:00.000000', '2025-07-14 17:36:00.000000', '2025-07-16 08:00:00.000000'),
       (DEFAULT, 461, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-14 17:36:00.000000', '2025-07-14 17:36:00.000000', '2025-07-16 08:00:00.000000'),
       (DEFAULT, 462, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-14 17:36:00.000000', '2025-07-14 17:36:00.000000', '2025-07-16 08:00:00.000000'),
       (DEFAULT, 463, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-14 17:36:00.000000', '2025-07-14 17:36:00.000000', '2025-07-16 08:00:00.000000'),
       (DEFAULT, 464, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-14 17:36:00.000000', '2025-07-14 17:36:00.000000', '2025-07-16 08:00:00.000000'),
       (DEFAULT, 465, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-14 17:36:00.000000', '2025-07-14 17:36:00.000000', '2025-07-16 08:00:00.000000'),
       (DEFAULT, 466, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-14 17:36:00.000000', '2025-07-14 17:36:00.000000', '2025-07-16 08:00:00.000000'),
       (DEFAULT, 467, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-14 17:36:00.000000', '2025-07-14 17:36:00.000000', '2025-07-16 08:00:00.000000');

-- 2025-07-16
-- 2025-07-20
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (40, 1, 121, NULL, 'Add get task list endpoint', 'Add get task list endpoint', NULL, 'LIGHT', 'BACKEND', 'LOW', FALSE, '2025-07-16', '2025-07-20', '2025-07-20', '2025-07-16 08:00:00.000000', '2025-07-16 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (468, 40, 52, 'JOINED', '2025-07-16 08:00:00.000000'),
       (469, 40, 54, 'JOINED', '2025-07-16 08:00:00.000000'),
       (470, 40, 56, 'JOINED', '2025-07-16 08:00:00.000000'),
       (471, 40, 58, 'JOINED', '2025-07-16 08:00:00.000000'),
       (472, 40, 60, 'JOINED', '2025-07-16 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 468, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-20 08:00:00.000000', '2025-07-20 08:00:00.000000', '2025-07-20 08:00:00.000000'),
       (DEFAULT, 469, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-20 08:00:00.000000', '2025-07-20 08:00:00.000000', '2025-07-20 08:00:00.000000'),
       (DEFAULT, 470, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-20 08:00:00.000000', '2025-07-20 08:00:00.000000', '2025-07-20 08:00:00.000000'),
       (DEFAULT, 471, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-20 08:00:00.000000', '2025-07-20 08:00:00.000000', '2025-07-20 08:00:00.000000'),
       (DEFAULT, 472, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-20 08:00:00.000000', '2025-07-20 08:00:00.000000', '2025-07-20 08:00:00.000000');

-- 2025-07-20
-- 2025-07-23
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (41, 1, 121, NULL, 'Add edit task button', 'Add edit task button', NULL, 'HARD', 'FRONTEND', 'NORMAL', FALSE, '2025-07-20', '2025-07-23', '2025-07-23', '2025-07-20 08:00:00.000000', '2025-07-20 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (473, 41, 1, 'JOINED', '2025-07-20 08:00:00.000000'),
       (474, 41, 3, 'JOINED', '2025-07-20 08:00:00.000000'),
       (475, 41, 5, 'JOINED', '2025-07-20 08:00:00.000000'),
       (476, 41, 7, 'JOINED', '2025-07-20 08:00:00.000000'),
       (477, 41, 31, 'JOINED', '2025-07-20 08:00:00.000000'),
       (478, 41, 33, 'JOINED', '2025-07-20 08:00:00.000000'),
       (479, 41, 35, 'JOINED', '2025-07-20 08:00:00.000000'),
       (480, 41, 37, 'JOINED', '2025-07-20 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 473, 'Employee 1 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-22 03:12:00.000000', '2025-07-22 03:12:00.000000', '2025-07-23 08:00:00.000000'),
       (DEFAULT, 474, 'Employee 3 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-22 03:12:00.000000', '2025-07-22 03:12:00.000000', '2025-07-23 08:00:00.000000'),
       (DEFAULT, 475, 'Employee 5 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-22 03:12:00.000000', '2025-07-22 03:12:00.000000', '2025-07-23 08:00:00.000000'),
       (DEFAULT, 476, 'Employee 7 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-22 03:12:00.000000', '2025-07-22 03:12:00.000000', '2025-07-23 08:00:00.000000'),
       (DEFAULT, 477, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-22 03:12:00.000000', '2025-07-22 03:12:00.000000', '2025-07-23 08:00:00.000000'),
       (DEFAULT, 478, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-22 03:12:00.000000', '2025-07-22 03:12:00.000000', '2025-07-23 08:00:00.000000'),
       (DEFAULT, 479, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-22 03:12:00.000000', '2025-07-22 03:12:00.000000', '2025-07-23 08:00:00.000000'),
       (DEFAULT, 480, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-22 03:12:00.000000', '2025-07-22 03:12:00.000000', '2025-07-23 08:00:00.000000');

-- 2025-07-23
-- 2025-07-30
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (42, 1, 121, NULL, 'Add complete task button', 'Add complete task button', NULL, 'HARD', 'FRONTEND', 'LOW', FALSE, '2025-07-23', '2025-07-30', '2025-07-30', '2025-07-23 08:00:00.000000', '2025-07-23 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (481, 42, 31, 'JOINED', '2025-07-23 08:00:00.000000'),
       (482, 42, 33, 'JOINED', '2025-07-23 08:00:00.000000'),
       (483, 42, 35, 'JOINED', '2025-07-23 08:00:00.000000'),
       (484, 42, 37, 'JOINED', '2025-07-23 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 481, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-30 08:00:00.000000', '2025-07-30 08:00:00.000000', '2025-07-30 08:00:00.000000'),
       (DEFAULT, 482, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-30 08:00:00.000000', '2025-07-30 08:00:00.000000', '2025-07-30 08:00:00.000000'),
       (DEFAULT, 483, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-30 08:00:00.000000', '2025-07-30 08:00:00.000000', '2025-07-30 08:00:00.000000'),
       (DEFAULT, 484, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-30 08:00:00.000000', '2025-07-30 08:00:00.000000', '2025-07-30 08:00:00.000000');

-- 2025-07-30
-- 2025-08-05
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (43, 1, 121, NULL, 'Add restore task button', 'Add restore task button', NULL, 'ADVANCED', 'FRONTEND', 'NORMAL', FALSE, '2025-07-30', '2025-08-05', '2025-08-05', '2025-07-30 08:00:00.000000', '2025-07-30 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (485, 43, 9, 'JOINED', '2025-07-30 08:00:00.000000'),
       (486, 43, 11, 'JOINED', '2025-07-30 08:00:00.000000'),
       (487, 43, 13, 'JOINED', '2025-07-30 08:00:00.000000'),
       (488, 43, 39, 'JOINED', '2025-07-30 08:00:00.000000'),
       (489, 43, 41, 'JOINED', '2025-07-30 08:00:00.000000'),
       (490, 43, 43, 'JOINED', '2025-07-30 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 485, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-02 22:24:00.000000', '2025-08-02 22:24:00.000000', '2025-08-05 08:00:00.000000'),
       (DEFAULT, 486, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-02 22:24:00.000000', '2025-08-02 22:24:00.000000', '2025-08-05 08:00:00.000000'),
       (DEFAULT, 487, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-02 22:24:00.000000', '2025-08-02 22:24:00.000000', '2025-08-05 08:00:00.000000'),
       (DEFAULT, 488, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-02 22:24:00.000000', '2025-08-02 22:24:00.000000', '2025-08-05 08:00:00.000000'),
       (DEFAULT, 489, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-02 22:24:00.000000', '2025-08-02 22:24:00.000000', '2025-08-05 08:00:00.000000'),
       (DEFAULT, 490, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-02 22:24:00.000000', '2025-08-02 22:24:00.000000', '2025-08-05 08:00:00.000000');

-- 2025-08-05
-- 2025-08-11
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (44, 1, 121, NULL, 'Build deleted task page', 'Build deleted task page', NULL, 'ADVANCED', 'FRONTEND', 'LOW', FALSE, '2025-08-05', '2025-08-11', '2025-08-11', '2025-08-05 08:00:00.000000', '2025-08-05 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (491, 44, 39, 'JOINED', '2025-08-05 08:00:00.000000'),
       (492, 44, 41, 'JOINED', '2025-08-05 08:00:00.000000'),
       (493, 44, 43, 'JOINED', '2025-08-05 08:00:00.000000'),
       (494, 44, 59, 'JOINED', '2025-08-05 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 491, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-11 08:00:00.000000', '2025-08-11 08:00:00.000000', '2025-08-11 08:00:00.000000'),
       (DEFAULT, 492, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-11 08:00:00.000000', '2025-08-11 08:00:00.000000', '2025-08-11 08:00:00.000000'),
       (DEFAULT, 493, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-11 08:00:00.000000', '2025-08-11 08:00:00.000000', '2025-08-11 08:00:00.000000'),
       (DEFAULT, 494, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-11 08:00:00.000000', '2025-08-11 08:00:00.000000', '2025-08-11 08:00:00.000000');

-- 2025-08-11
-- 2025-08-16
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (45, 1, 121, NULL, 'Build task by status page', 'Build task by status page', NULL, 'NORMAL', 'FRONTEND', 'NORMAL', FALSE, '2025-08-11', '2025-08-16', '2025-08-16', '2025-08-11 08:00:00.000000', '2025-08-11 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (495, 45, 15, 'JOINED', '2025-08-11 08:00:00.000000'),
       (496, 45, 17, 'JOINED', '2025-08-11 08:00:00.000000'),
       (497, 45, 19, 'JOINED', '2025-08-11 08:00:00.000000'),
       (498, 45, 21, 'JOINED', '2025-08-11 08:00:00.000000'),
       (499, 45, 29, 'JOINED', '2025-08-11 08:00:00.000000'),
       (500, 45, 45, 'JOINED', '2025-08-11 08:00:00.000000'),
       (501, 45, 47, 'JOINED', '2025-08-11 08:00:00.000000'),
       (502, 45, 49, 'JOINED', '2025-08-11 08:00:00.000000'),
       (503, 45, 51, 'JOINED', '2025-08-11 08:00:00.000000'),
       (504, 45, 59, 'JOINED', '2025-08-11 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 495, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-14 08:00:00.000000', '2025-08-14 08:00:00.000000', '2025-08-16 08:00:00.000000'),
       (DEFAULT, 496, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-14 08:00:00.000000', '2025-08-14 08:00:00.000000', '2025-08-16 08:00:00.000000'),
       (DEFAULT, 497, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-14 08:00:00.000000', '2025-08-14 08:00:00.000000', '2025-08-16 08:00:00.000000'),
       (DEFAULT, 498, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-14 08:00:00.000000', '2025-08-14 08:00:00.000000', '2025-08-16 08:00:00.000000'),
       (DEFAULT, 499, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-16 02:00:00.000000', '2025-08-16 02:00:00.000000', '2025-08-16 08:00:00.000000'),
       (DEFAULT, 500, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-14 08:00:00.000000', '2025-08-14 08:00:00.000000', '2025-08-16 08:00:00.000000'),
       (DEFAULT, 501, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-14 08:00:00.000000', '2025-08-14 08:00:00.000000', '2025-08-16 08:00:00.000000'),
       (DEFAULT, 502, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-14 08:00:00.000000', '2025-08-14 08:00:00.000000', '2025-08-16 08:00:00.000000'),
       (DEFAULT, 503, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-14 08:00:00.000000', '2025-08-14 08:00:00.000000', '2025-08-16 08:00:00.000000'),
       (DEFAULT, 504, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-16 02:00:00.000000', '2025-08-16 02:00:00.000000', '2025-08-16 08:00:00.000000');

-- 2025-08-16
-- 2025-08-21
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (46, 1, 121, NULL, 'Build task by priority page', 'Build task by priority page', NULL, 'NORMAL', 'FRONTEND', 'LOW', FALSE, '2025-08-16', '2025-08-21', '2025-08-21', '2025-08-16 08:00:00.000000', '2025-08-16 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (505, 46, 45, 'JOINED', '2025-08-16 08:00:00.000000'),
       (506, 46, 47, 'JOINED', '2025-08-16 08:00:00.000000'),
       (507, 46, 49, 'JOINED', '2025-08-16 08:00:00.000000'),
       (508, 46, 51, 'JOINED', '2025-08-16 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 505, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-21 08:00:00.000000', '2025-08-21 08:00:00.000000', '2025-08-21 08:00:00.000000'),
       (DEFAULT, 506, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-21 08:00:00.000000', '2025-08-21 08:00:00.000000', '2025-08-21 08:00:00.000000'),
       (DEFAULT, 507, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-21 08:00:00.000000', '2025-08-21 08:00:00.000000', '2025-08-21 08:00:00.000000'),
       (DEFAULT, 508, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-21 08:00:00.000000', '2025-08-21 08:00:00.000000', '2025-08-21 08:00:00.000000');

-- 2025-08-21
-- 2025-08-25
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (47, 1, 121, NULL, 'Add status filter', 'Add status filter', NULL, 'LIGHT', 'FRONTEND', 'NORMAL', FALSE, '2025-08-21', '2025-08-25', '2025-08-25', '2025-08-21 08:00:00.000000', '2025-08-21 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (509, 47, 23, 'JOINED', '2025-08-21 08:00:00.000000'),
       (510, 47, 25, 'JOINED', '2025-08-21 08:00:00.000000'),
       (511, 47, 27, 'JOINED', '2025-08-21 08:00:00.000000'),
       (512, 47, 29, 'JOINED', '2025-08-21 08:00:00.000000'),
       (513, 47, 53, 'JOINED', '2025-08-21 08:00:00.000000'),
       (514, 47, 55, 'JOINED', '2025-08-21 08:00:00.000000'),
       (515, 47, 57, 'JOINED', '2025-08-21 08:00:00.000000'),
       (516, 47, 59, 'JOINED', '2025-08-21 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 509, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-23 17:36:00.000000', '2025-08-23 17:36:00.000000', '2025-08-25 08:00:00.000000'),
       (DEFAULT, 510, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-23 17:36:00.000000', '2025-08-23 17:36:00.000000', '2025-08-25 08:00:00.000000'),
       (DEFAULT, 511, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-23 17:36:00.000000', '2025-08-23 17:36:00.000000', '2025-08-25 08:00:00.000000'),
       (DEFAULT, 512, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-24 22:24:00.000000', '2025-08-24 22:24:00.000000', '2025-08-25 08:00:00.000000'),
       (DEFAULT, 513, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-23 17:36:00.000000', '2025-08-23 17:36:00.000000', '2025-08-25 08:00:00.000000'),
       (DEFAULT, 514, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-23 17:36:00.000000', '2025-08-23 17:36:00.000000', '2025-08-25 08:00:00.000000'),
       (DEFAULT, 515, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-23 17:36:00.000000', '2025-08-23 17:36:00.000000', '2025-08-25 08:00:00.000000'),
       (DEFAULT, 516, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-24 22:24:00.000000', '2025-08-24 22:24:00.000000', '2025-08-25 08:00:00.000000');

-- 2025-08-25
-- 2025-08-29
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (48, 1, 121, NULL, 'Add priority filter', 'Add priority filter', NULL, 'LIGHT', 'FRONTEND', 'LOW', FALSE, '2025-08-25', '2025-08-29', '2025-08-29', '2025-08-25 08:00:00.000000', '2025-08-25 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (517, 48, 53, 'JOINED', '2025-08-25 08:00:00.000000'),
       (518, 48, 55, 'JOINED', '2025-08-25 08:00:00.000000'),
       (519, 48, 57, 'JOINED', '2025-08-25 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 517, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-29 08:00:00.000000', '2025-08-29 08:00:00.000000', '2025-08-29 08:00:00.000000'),
       (DEFAULT, 518, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-29 08:00:00.000000', '2025-08-29 08:00:00.000000', '2025-08-29 08:00:00.000000'),
       (DEFAULT, 519, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-29 08:00:00.000000', '2025-08-29 08:00:00.000000', '2025-08-29 08:00:00.000000');

-- 2025-08-29
-- 2025-09-01
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (49, 1, 121, NULL, 'Add get task detail endpoint', 'Add get task detail endpoint', NULL, 'HARD', 'BACKEND', 'NORMAL', FALSE, '2025-08-29', '2025-09-01', '2025-09-01', '2025-08-29 08:00:00.000000', '2025-08-29 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (520, 49, 2, 'JOINED', '2025-08-29 08:00:00.000000'),
       (521, 49, 4, 'JOINED', '2025-08-29 08:00:00.000000'),
       (522, 49, 6, 'JOINED', '2025-08-29 08:00:00.000000'),
       (523, 49, 30, 'JOINED', '2025-08-29 08:00:00.000000'),
       (524, 49, 32, 'JOINED', '2025-08-29 08:00:00.000000'),
       (525, 49, 34, 'JOINED', '2025-08-29 08:00:00.000000'),
       (526, 49, 36, 'JOINED', '2025-08-29 08:00:00.000000'),
       (527, 49, 60, 'JOINED', '2025-08-29 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 520, 'Employee 2 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-31 06:48:00.000000', '2025-08-31 06:48:00.000000', '2025-09-01 08:00:00.000000'),
       (DEFAULT, 521, 'Employee 4 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-31 06:48:00.000000', '2025-08-31 06:48:00.000000', '2025-09-01 08:00:00.000000'),
       (DEFAULT, 522, 'Employee 6 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-31 06:48:00.000000', '2025-08-31 06:48:00.000000', '2025-09-01 08:00:00.000000'),
       (DEFAULT, 523, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-01 08:00:00.000000', '2025-09-01 08:00:00.000000', '2025-09-01 08:00:00.000000'),
       (DEFAULT, 524, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-31 06:48:00.000000', '2025-08-31 06:48:00.000000', '2025-09-01 08:00:00.000000'),
       (DEFAULT, 525, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-31 06:48:00.000000', '2025-08-31 06:48:00.000000', '2025-09-01 08:00:00.000000'),
       (DEFAULT, 526, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-31 06:48:00.000000', '2025-08-31 06:48:00.000000', '2025-09-01 08:00:00.000000'),
       (DEFAULT, 527, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-01 08:00:00.000000', '2025-09-01 08:00:00.000000', '2025-09-01 08:00:00.000000');

-- 2025-09-01
-- 2025-09-08
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (50, 1, 121, NULL, 'Add restore task endpoint', 'Add restore task endpoint', NULL, 'HARD', 'BACKEND', 'LOW', FALSE, '2025-09-01', '2025-09-08', '2025-09-08', '2025-09-01 08:00:00.000000', '2025-09-01 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (528, 50, 32, 'JOINED', '2025-09-01 08:00:00.000000'),
       (529, 50, 34, 'JOINED', '2025-09-01 08:00:00.000000'),
       (530, 50, 36, 'JOINED', '2025-09-01 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 528, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-08 08:00:00.000000', '2025-09-08 08:00:00.000000', '2025-09-08 08:00:00.000000'),
       (DEFAULT, 529, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-08 08:00:00.000000', '2025-09-08 08:00:00.000000', '2025-09-08 08:00:00.000000'),
       (DEFAULT, 530, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-08 08:00:00.000000', '2025-09-08 08:00:00.000000', '2025-09-08 08:00:00.000000');

-- 2025-09-08
-- 2025-09-14
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (51, 1, 121, NULL, 'Add mark complete endpoint', 'Add mark complete endpoint', NULL, 'ADVANCED', 'BACKEND', 'NORMAL', FALSE, '2025-09-08', '2025-09-14', '2025-09-14', '2025-09-08 08:00:00.000000', '2025-09-08 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (531, 51, 8, 'JOINED', '2025-09-08 08:00:00.000000'),
       (532, 51, 10, 'JOINED', '2025-09-08 08:00:00.000000'),
       (533, 51, 12, 'JOINED', '2025-09-08 08:00:00.000000'),
       (534, 51, 14, 'JOINED', '2025-09-08 08:00:00.000000'),
       (535, 51, 38, 'JOINED', '2025-09-08 08:00:00.000000'),
       (536, 51, 40, 'JOINED', '2025-09-08 08:00:00.000000'),
       (537, 51, 42, 'JOINED', '2025-09-08 08:00:00.000000'),
       (538, 51, 44, 'JOINED', '2025-09-08 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 531, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-12 05:36:00.000000', '2025-09-12 05:36:00.000000', '2025-09-14 08:00:00.000000'),
       (DEFAULT, 532, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-12 05:36:00.000000', '2025-09-12 05:36:00.000000', '2025-09-14 08:00:00.000000'),
       (DEFAULT, 533, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-12 05:36:00.000000', '2025-09-12 05:36:00.000000', '2025-09-14 08:00:00.000000'),
       (DEFAULT, 534, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-12 05:36:00.000000', '2025-09-12 05:36:00.000000', '2025-09-14 08:00:00.000000'),
       (DEFAULT, 535, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-12 05:36:00.000000', '2025-09-12 05:36:00.000000', '2025-09-14 08:00:00.000000'),
       (DEFAULT, 536, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-12 05:36:00.000000', '2025-09-12 05:36:00.000000', '2025-09-14 08:00:00.000000'),
       (DEFAULT, 537, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-12 05:36:00.000000', '2025-09-12 05:36:00.000000', '2025-09-14 08:00:00.000000'),
       (DEFAULT, 538, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-12 05:36:00.000000', '2025-09-12 05:36:00.000000', '2025-09-14 08:00:00.000000');

-- 2025-09-14
-- 2025-09-20
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (52, 1, 121, NULL, 'Add filter tasks endpoint', 'Add filter tasks endpoint', NULL, 'ADVANCED', 'BACKEND', 'LOW', FALSE, '2025-09-14', '2025-09-20', '2025-09-20', '2025-09-14 08:00:00.000000', '2025-09-14 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (539, 52, 38, 'JOINED', '2025-09-14 08:00:00.000000'),
       (540, 52, 40, 'JOINED', '2025-09-14 08:00:00.000000'),
       (541, 52, 42, 'JOINED', '2025-09-14 08:00:00.000000'),
       (542, 52, 44, 'JOINED', '2025-09-14 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 539, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-20 08:00:00.000000', '2025-09-20 08:00:00.000000', '2025-09-20 08:00:00.000000'),
       (DEFAULT, 540, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-20 08:00:00.000000', '2025-09-20 08:00:00.000000', '2025-09-20 08:00:00.000000'),
       (DEFAULT, 541, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-20 08:00:00.000000', '2025-09-20 08:00:00.000000', '2025-09-20 08:00:00.000000'),
       (DEFAULT, 542, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-20 08:00:00.000000', '2025-09-20 08:00:00.000000', '2025-09-20 08:00:00.000000');

-- 2025-09-20
-- 2025-09-25
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (53, 1, 121, NULL, 'Add search tasks endpoint', 'Add search tasks endpoint', NULL, 'NORMAL', 'BACKEND', 'NORMAL', FALSE, '2025-09-20', '2025-09-25', '2025-09-25', '2025-09-20 08:00:00.000000', '2025-09-20 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (543, 53, 16, 'JOINED', '2025-09-20 08:00:00.000000'),
       (544, 53, 18, 'JOINED', '2025-09-20 08:00:00.000000'),
       (545, 53, 20, 'JOINED', '2025-09-20 08:00:00.000000'),
       (546, 53, 46, 'JOINED', '2025-09-20 08:00:00.000000'),
       (547, 53, 48, 'JOINED', '2025-09-20 08:00:00.000000'),
       (548, 53, 50, 'JOINED', '2025-09-20 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 543, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-23 14:00:00.000000', '2025-09-23 14:00:00.000000', '2025-09-25 08:00:00.000000'),
       (DEFAULT, 544, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-23 14:00:00.000000', '2025-09-23 14:00:00.000000', '2025-09-25 08:00:00.000000'),
       (DEFAULT, 545, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-23 14:00:00.000000', '2025-09-23 14:00:00.000000', '2025-09-25 08:00:00.000000'),
       (DEFAULT, 546, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-23 14:00:00.000000', '2025-09-23 14:00:00.000000', '2025-09-25 08:00:00.000000'),
       (DEFAULT, 547, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-23 14:00:00.000000', '2025-09-23 14:00:00.000000', '2025-09-25 08:00:00.000000'),
       (DEFAULT, 548, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-23 14:00:00.000000', '2025-09-23 14:00:00.000000', '2025-09-25 08:00:00.000000');

-- 2025-09-25
-- 2025-09-30
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (54, 1, 121, NULL, 'Add sort tasks endpoint', 'Add sort tasks endpoint', NULL, 'NORMAL', 'BACKEND', 'LOW', FALSE, '2025-09-25', '2025-09-30', '2025-09-30', '2025-09-25 08:00:00.000000', '2025-09-25 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (549, 54, 46, 'JOINED', '2025-09-25 08:00:00.000000'),
       (550, 54, 48, 'JOINED', '2025-09-25 08:00:00.000000'),
       (551, 54, 50, 'JOINED', '2025-09-25 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 549, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-30 08:00:00.000000', '2025-09-30 08:00:00.000000', '2025-09-30 08:00:00.000000'),
       (DEFAULT, 550, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-30 08:00:00.000000', '2025-09-30 08:00:00.000000', '2025-09-30 08:00:00.000000'),
       (DEFAULT, 551, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-30 08:00:00.000000', '2025-09-30 08:00:00.000000', '2025-09-30 08:00:00.000000');

-- 2025-09-30
-- 2025-10-04
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (55, 1, 121, NULL, 'Implement soft delete logic', 'Implement soft delete logic', NULL, 'LIGHT', 'BACKEND', 'NORMAL', FALSE, '2025-09-30', '2025-10-04', '2025-10-04', '2025-09-30 08:00:00.000000', '2025-09-30 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (552, 55, 22, 'JOINED', '2025-09-30 08:00:00.000000'),
       (553, 55, 24, 'JOINED', '2025-09-30 08:00:00.000000'),
       (554, 55, 26, 'JOINED', '2025-09-30 08:00:00.000000'),
       (555, 55, 28, 'JOINED', '2025-09-30 08:00:00.000000'),
       (556, 55, 52, 'JOINED', '2025-09-30 08:00:00.000000'),
       (557, 55, 54, 'JOINED', '2025-09-30 08:00:00.000000'),
       (558, 55, 56, 'JOINED', '2025-09-30 08:00:00.000000'),
       (559, 55, 58, 'JOINED', '2025-09-30 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 552, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-02 22:23:59.000000', '2025-10-02 22:23:59.000000', '2025-10-04 08:00:00.000000'),
       (DEFAULT, 553, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-02 22:23:59.000000', '2025-10-02 22:23:59.000000', '2025-10-04 08:00:00.000000'),
       (DEFAULT, 554, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-02 22:23:59.000000', '2025-10-02 22:23:59.000000', '2025-10-04 08:00:00.000000'),
       (DEFAULT, 555, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-02 22:23:59.000000', '2025-10-02 22:23:59.000000', '2025-10-04 08:00:00.000000'),
       (DEFAULT, 556, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-02 22:23:59.000000', '2025-10-02 22:23:59.000000', '2025-10-04 08:00:00.000000'),
       (DEFAULT, 557, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-02 22:23:59.000000', '2025-10-02 22:23:59.000000', '2025-10-04 08:00:00.000000'),
       (DEFAULT, 558, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-02 22:23:59.000000', '2025-10-02 22:23:59.000000', '2025-10-04 08:00:00.000000'),
       (DEFAULT, 559, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-02 22:23:59.000000', '2025-10-02 22:23:59.000000', '2025-10-04 08:00:00.000000');

-- 2025-10-04
-- 2025-10-08
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (56, 1, 121, NULL, 'Add pagination support', 'Add pagination support', NULL, 'LIGHT', 'BACKEND', 'LOW', FALSE, '2025-10-04', '2025-10-08', '2025-10-08', '2025-10-04 08:00:00.000000', '2025-10-04 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (560, 56, 52, 'JOINED', '2025-10-04 08:00:00.000000'),
       (561, 56, 54, 'JOINED', '2025-10-04 08:00:00.000000'),
       (562, 56, 56, 'JOINED', '2025-10-04 08:00:00.000000'),
       (563, 56, 58, 'JOINED', '2025-10-04 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 560, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-08 08:00:00.000000', '2025-10-08 08:00:00.000000', '2025-10-08 08:00:00.000000'),
       (DEFAULT, 561, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-08 08:00:00.000000', '2025-10-08 08:00:00.000000', '2025-10-08 08:00:00.000000'),
       (DEFAULT, 562, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-08 08:00:00.000000', '2025-10-08 08:00:00.000000', '2025-10-08 08:00:00.000000'),
       (DEFAULT, 563, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-08 08:00:00.000000', '2025-10-08 08:00:00.000000', '2025-10-08 08:00:00.000000');

-- 2025-10-08
-- 2025-10-11
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (57, 1, 121, NULL, 'Add created time filter', 'Add created time filter', NULL, 'HARD', 'FRONTEND', 'NORMAL', FALSE, '2025-10-08', '2025-10-11', '2025-10-11', '2025-10-08 08:00:00.000000', '2025-10-08 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (564, 57, 1, 'JOINED', '2025-10-08 08:00:00.000000'),
       (565, 57, 3, 'JOINED', '2025-10-08 08:00:00.000000'),
       (566, 57, 5, 'JOINED', '2025-10-08 08:00:00.000000'),
       (567, 57, 7, 'JOINED', '2025-10-08 08:00:00.000000'),
       (568, 57, 31, 'JOINED', '2025-10-08 08:00:00.000000'),
       (569, 57, 33, 'JOINED', '2025-10-08 08:00:00.000000'),
       (570, 57, 35, 'JOINED', '2025-10-08 08:00:00.000000'),
       (571, 57, 37, 'JOINED', '2025-10-08 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 564, 'Employee 1 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-10 06:48:00.000000', '2025-10-10 06:48:00.000000', '2025-10-11 08:00:00.000000'),
       (DEFAULT, 565, 'Employee 3 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-10 06:48:00.000000', '2025-10-10 06:48:00.000000', '2025-10-11 08:00:00.000000'),
       (DEFAULT, 566, 'Employee 5 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-10 06:48:00.000000', '2025-10-10 06:48:00.000000', '2025-10-11 08:00:00.000000'),
       (DEFAULT, 567, 'Employee 7 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-10 06:48:00.000000', '2025-10-10 06:48:00.000000', '2025-10-11 08:00:00.000000'),
       (DEFAULT, 568, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-10 06:48:00.000000', '2025-10-10 06:48:00.000000', '2025-10-11 08:00:00.000000'),
       (DEFAULT, 569, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-10 06:48:00.000000', '2025-10-10 06:48:00.000000', '2025-10-11 08:00:00.000000'),
       (DEFAULT, 570, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-10 06:48:00.000000', '2025-10-10 06:48:00.000000', '2025-10-11 08:00:00.000000'),
       (DEFAULT, 571, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-10 06:48:00.000000', '2025-10-10 06:48:00.000000', '2025-10-11 08:00:00.000000');

-- 2025-10-11
-- 2025-10-18
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (58, 1, 121, NULL, 'Add task search bar', 'Add task search bar', NULL, 'HARD', 'FRONTEND', 'LOW', FALSE, '2025-10-11', '2025-10-18', '2025-10-18', '2025-10-11 08:00:00.000000', '2025-10-11 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (572, 58, 31, 'JOINED', '2025-10-11 08:00:00.000000'),
       (573, 58, 33, 'JOINED', '2025-10-11 08:00:00.000000'),
       (574, 58, 35, 'JOINED', '2025-10-11 08:00:00.000000'),
       (575, 58, 37, 'JOINED', '2025-10-11 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 572, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-18 08:00:00.000000', '2025-10-18 08:00:00.000000', '2025-10-18 08:00:00.000000'),
       (DEFAULT, 573, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-18 08:00:00.000000', '2025-10-18 08:00:00.000000', '2025-10-18 08:00:00.000000'),
       (DEFAULT, 574, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-18 08:00:00.000000', '2025-10-18 08:00:00.000000', '2025-10-18 08:00:00.000000'),
       (DEFAULT, 575, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-18 08:00:00.000000', '2025-10-18 08:00:00.000000', '2025-10-18 08:00:00.000000');

-- 2025-10-18
-- 2025-10-24
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (59, 1, 121, NULL, 'Sort tasks by deadline', 'Sort tasks by deadline', NULL, 'ADVANCED', 'FRONTEND', 'NORMAL', FALSE, '2025-10-18', '2025-10-24', '2025-10-24', '2025-10-18 08:00:00.000000', '2025-10-18 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (576, 59, 9, 'JOINED', '2025-10-18 08:00:00.000000'),
       (577, 59, 11, 'JOINED', '2025-10-18 08:00:00.000000'),
       (578, 59, 13, 'JOINED', '2025-10-18 08:00:00.000000'),
       (579, 59, 39, 'JOINED', '2025-10-18 08:00:00.000000'),
       (580, 59, 41, 'JOINED', '2025-10-18 08:00:00.000000'),
       (581, 59, 43, 'JOINED', '2025-10-18 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 576, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-22 05:36:00.000000', '2025-10-22 05:36:00.000000', '2025-10-24 08:00:00.000000'),
       (DEFAULT, 577, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-22 05:36:00.000000', '2025-10-22 05:36:00.000000', '2025-10-24 08:00:00.000000'),
       (DEFAULT, 578, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-22 05:36:00.000000', '2025-10-22 05:36:00.000000', '2025-10-24 08:00:00.000000'),
       (DEFAULT, 579, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-22 05:36:00.000000', '2025-10-22 05:36:00.000000', '2025-10-24 08:00:00.000000'),
       (DEFAULT, 580, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-22 05:36:00.000000', '2025-10-22 05:36:00.000000', '2025-10-24 08:00:00.000000'),
       (DEFAULT, 581, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-22 05:36:00.000000', '2025-10-22 05:36:00.000000', '2025-10-24 08:00:00.000000');

-- 2025-10-24
-- 2025-10-30
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (60, 1, 121, NULL, 'Sort tasks by priority', 'Sort tasks by priority', NULL, 'ADVANCED', 'FRONTEND', 'LOW', FALSE, '2025-10-24', '2025-10-30', '2025-10-30', '2025-10-24 08:00:00.000000', '2025-10-24 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (582, 60, 39, 'JOINED', '2025-10-24 08:00:00.000000'),
       (583, 60, 41, 'JOINED', '2025-10-24 08:00:00.000000'),
       (584, 60, 43, 'JOINED', '2025-10-24 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 582, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-30 08:00:00.000000', '2025-10-30 08:00:00.000000', '2025-10-30 08:00:00.000000'),
       (DEFAULT, 583, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-30 08:00:00.000000', '2025-10-30 08:00:00.000000', '2025-10-30 08:00:00.000000'),
       (DEFAULT, 584, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-30 08:00:00.000000', '2025-10-30 08:00:00.000000', '2025-10-30 08:00:00.000000');

-- 2025-10-30
-- 2025-11-04
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (61, 1, 121, NULL, 'Add task status badge', 'Add task status badge', NULL, 'NORMAL', 'FRONTEND', 'NORMAL', FALSE, '2025-10-30', '2025-11-04', '2025-11-04', '2025-10-30 08:00:00.000000', '2025-10-30 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (585, 61, 15, 'JOINED', '2025-10-30 08:00:00.000000'),
       (586, 61, 17, 'JOINED', '2025-10-30 08:00:00.000000'),
       (587, 61, 19, 'JOINED', '2025-10-30 08:00:00.000000'),
       (588, 61, 21, 'JOINED', '2025-10-30 08:00:00.000000'),
       (589, 61, 29, 'JOINED', '2025-10-30 08:00:00.000000'),
       (590, 61, 45, 'JOINED', '2025-10-30 08:00:00.000000'),
       (591, 61, 47, 'JOINED', '2025-10-30 08:00:00.000000'),
       (592, 61, 49, 'JOINED', '2025-10-30 08:00:00.000000'),
       (593, 61, 51, 'JOINED', '2025-10-30 08:00:00.000000'),
       (594, 61, 59, 'JOINED', '2025-10-30 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 585, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-02 14:00:00.000000', '2025-11-02 14:00:00.000000', '2025-11-04 08:00:00.000000'),
       (DEFAULT, 586, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-02 14:00:00.000000', '2025-11-02 14:00:00.000000', '2025-11-04 08:00:00.000000'),
       (DEFAULT, 587, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-02 14:00:00.000000', '2025-11-02 14:00:00.000000', '2025-11-04 08:00:00.000000'),
       (DEFAULT, 588, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-02 14:00:00.000000', '2025-11-02 14:00:00.000000', '2025-11-04 08:00:00.000000'),
       (DEFAULT, 589, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-04 08:00:00.000000', '2025-11-04 08:00:00.000000', '2025-11-04 08:00:00.000000'),
       (DEFAULT, 590, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-02 14:00:00.000000', '2025-11-02 14:00:00.000000', '2025-11-04 08:00:00.000000'),
       (DEFAULT, 591, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-02 14:00:00.000000', '2025-11-02 14:00:00.000000', '2025-11-04 08:00:00.000000'),
       (DEFAULT, 592, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-02 14:00:00.000000', '2025-11-02 14:00:00.000000', '2025-11-04 08:00:00.000000'),
       (DEFAULT, 593, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-02 14:00:00.000000', '2025-11-02 14:00:00.000000', '2025-11-04 08:00:00.000000'),
       (DEFAULT, 594, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-04 08:00:00.000000', '2025-11-04 08:00:00.000000', '2025-11-04 08:00:00.000000');

-- 2025-11-04
-- 2025-11-09
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (62, 1, 121, NULL, 'User list interface', 'User list interface', NULL, 'NORMAL', 'FRONTEND', 'LOW', FALSE, '2025-11-04', '2025-11-09', '2025-11-09', '2025-11-04 08:00:00.000000', '2025-11-04 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (595, 62, 45, 'JOINED', '2025-11-04 08:00:00.000000'),
       (596, 62, 47, 'JOINED', '2025-11-04 08:00:00.000000'),
       (597, 62, 49, 'JOINED', '2025-11-04 08:00:00.000000'),
       (598, 62, 51, 'JOINED', '2025-11-04 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 595, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-09 08:00:00.000000', '2025-11-09 08:00:00.000000', '2025-11-09 08:00:00.000000'),
       (DEFAULT, 596, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-09 08:00:00.000000', '2025-11-09 08:00:00.000000', '2025-11-09 08:00:00.000000'),
       (DEFAULT, 597, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-09 08:00:00.000000', '2025-11-09 08:00:00.000000', '2025-11-09 08:00:00.000000'),
       (DEFAULT, 598, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-09 08:00:00.000000', '2025-11-09 08:00:00.000000', '2025-11-09 08:00:00.000000');

-- 2025-11-09
-- 2025-11-13
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (63, 1, 121, NULL, 'User update interface', 'User update interface', NULL, 'LIGHT', 'FRONTEND', 'NORMAL', FALSE, '2025-11-09', '2025-11-13', '2025-11-13', '2025-11-09 08:00:00.000000', '2025-11-09 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (599, 63, 23, 'JOINED', '2025-11-09 08:00:00.000000'),
       (600, 63, 25, 'JOINED', '2025-11-09 08:00:00.000000'),
       (601, 63, 27, 'JOINED', '2025-11-09 08:00:00.000000'),
       (602, 63, 53, 'JOINED', '2025-11-09 08:00:00.000000'),
       (603, 63, 55, 'JOINED', '2025-11-09 08:00:00.000000'),
       (604, 63, 57, 'JOINED', '2025-11-09 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 599, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-11 22:23:59.000000', '2025-11-11 22:23:59.000000', '2025-11-13 08:00:00.000000'),
       (DEFAULT, 600, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-11 22:23:59.000000', '2025-11-11 22:23:59.000000', '2025-11-13 08:00:00.000000'),
       (DEFAULT, 601, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-11 22:23:59.000000', '2025-11-11 22:23:59.000000', '2025-11-13 08:00:00.000000'),
       (DEFAULT, 602, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-11 22:23:59.000000', '2025-11-11 22:23:59.000000', '2025-11-13 08:00:00.000000'),
       (DEFAULT, 603, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-11 22:23:59.000000', '2025-11-11 22:23:59.000000', '2025-11-13 08:00:00.000000'),
       (DEFAULT, 604, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-11 22:23:59.000000', '2025-11-11 22:23:59.000000', '2025-11-13 08:00:00.000000');

-- 2025-11-13
-- 2025-11-17
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (64, 1, 121, NULL, 'Password change screen', 'Password change screen', NULL, 'LIGHT', 'FRONTEND', 'LOW', FALSE, '2025-11-13', '2025-11-17', '2025-11-17', '2025-11-13 08:00:00.000000', '2025-11-13 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (605, 64, 53, 'JOINED', '2025-11-13 08:00:00.000000'),
       (606, 64, 55, 'JOINED', '2025-11-13 08:00:00.000000'),
       (607, 64, 57, 'JOINED', '2025-11-13 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 605, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-17 08:00:00.000000', '2025-11-17 08:00:00.000000', '2025-11-17 08:00:00.000000'),
       (DEFAULT, 606, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-17 08:00:00.000000', '2025-11-17 08:00:00.000000', '2025-11-17 08:00:00.000000'),
       (DEFAULT, 607, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-17 08:00:00.000000', '2025-11-17 08:00:00.000000', '2025-11-17 08:00:00.000000');

-- 2025-11-17
-- 2025-11-20
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (65, 1, 121, NULL, 'Add role based security', 'Add role based security', NULL, 'HARD', 'BACKEND', 'NORMAL', FALSE, '2025-11-17', '2025-11-20', '2025-11-20', '2025-11-17 08:00:00.000000', '2025-11-17 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (608, 65, 2, 'JOINED', '2025-11-17 08:00:00.000000'),
       (609, 65, 4, 'JOINED', '2025-11-17 08:00:00.000000'),
       (610, 65, 6, 'JOINED', '2025-11-17 08:00:00.000000'),
       (611, 65, 32, 'JOINED', '2025-11-17 08:00:00.000000'),
       (612, 65, 34, 'JOINED', '2025-11-17 08:00:00.000000'),
       (613, 65, 36, 'JOINED', '2025-11-17 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 608, 'Employee 2 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-19 10:24:00.000000', '2025-11-19 10:24:00.000000', '2025-11-20 08:00:00.000000'),
       (DEFAULT, 609, 'Employee 4 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-19 10:24:00.000000', '2025-11-19 10:24:00.000000', '2025-11-20 08:00:00.000000'),
       (DEFAULT, 610, 'Employee 6 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-19 10:24:00.000000', '2025-11-19 10:24:00.000000', '2025-11-20 08:00:00.000000'),
       (DEFAULT, 611, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-19 10:24:00.000000', '2025-11-19 10:24:00.000000', '2025-11-20 08:00:00.000000'),
       (DEFAULT, 612, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-19 10:24:00.000000', '2025-11-19 10:24:00.000000', '2025-11-20 08:00:00.000000'),
       (DEFAULT, 613, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-19 10:24:00.000000', '2025-11-19 10:24:00.000000', '2025-11-20 08:00:00.000000');

-- 2025-11-20
-- 2025-11-27
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (66, 1, 121, NULL, 'Add admin only routes', 'Add admin only routes', NULL, 'HARD', 'BACKEND', 'LOW', FALSE, '2025-11-20', '2025-11-27', '2025-11-27', '2025-11-20 08:00:00.000000', '2025-11-20 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (614, 66, 32, 'JOINED', '2025-11-20 08:00:00.000000'),
       (615, 66, 34, 'JOINED', '2025-11-20 08:00:00.000000'),
       (616, 66, 36, 'JOINED', '2025-11-20 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 614, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-27 08:00:00.000000', '2025-11-27 08:00:00.000000', '2025-11-27 08:00:00.000000'),
       (DEFAULT, 615, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-27 08:00:00.000000', '2025-11-27 08:00:00.000000', '2025-11-27 08:00:00.000000'),
       (DEFAULT, 616, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-27 08:00:00.000000', '2025-11-27 08:00:00.000000', '2025-11-27 08:00:00.000000');

-- 2025-11-27
-- 2025-12-03
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (67, 1, 121, NULL, 'Create dto for user', 'Create dto for user', NULL, 'ADVANCED', 'BACKEND', 'NORMAL', FALSE, '2025-11-27', '2025-12-03', '2025-12-03', '2025-11-27 08:00:00.000000', '2025-11-27 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (617, 67, 8, 'JOINED', '2025-11-27 08:00:00.000000'),
       (618, 67, 10, 'JOINED', '2025-11-27 08:00:00.000000'),
       (619, 67, 12, 'JOINED', '2025-11-27 08:00:00.000000'),
       (620, 67, 14, 'JOINED', '2025-11-27 08:00:00.000000'),
       (621, 67, 38, 'JOINED', '2025-11-27 08:00:00.000000'),
       (622, 67, 40, 'JOINED', '2025-11-27 08:00:00.000000'),
       (623, 67, 42, 'JOINED', '2025-11-27 08:00:00.000000'),
       (624, 67, 44, 'JOINED', '2025-11-27 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 617, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-01 12:48:00.000000', '2025-12-01 12:48:00.000000', '2025-12-03 08:00:00.000000'),
       (DEFAULT, 618, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-01 12:48:00.000000', '2025-12-01 12:48:00.000000', '2025-12-03 08:00:00.000000'),
       (DEFAULT, 619, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-01 12:48:00.000000', '2025-12-01 12:48:00.000000', '2025-12-03 08:00:00.000000'),
       (DEFAULT, 620, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-01 12:48:00.000000', '2025-12-01 12:48:00.000000', '2025-12-03 08:00:00.000000'),
       (DEFAULT, 621, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-01 12:48:00.000000', '2025-12-01 12:48:00.000000', '2025-12-03 08:00:00.000000'),
       (DEFAULT, 622, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-01 12:48:00.000000', '2025-12-01 12:48:00.000000', '2025-12-03 08:00:00.000000'),
       (DEFAULT, 623, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-01 12:48:00.000000', '2025-12-01 12:48:00.000000', '2025-12-03 08:00:00.000000'),
       (DEFAULT, 624, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-01 12:48:00.000000', '2025-12-01 12:48:00.000000', '2025-12-03 08:00:00.000000');

-- 2025-12-03
-- 2025-12-09
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (68, 1, 121, NULL, 'Create dto for task', 'Create dto for task', NULL, 'ADVANCED', 'BACKEND', 'LOW', FALSE, '2025-12-03', '2025-12-09', '2025-12-09', '2025-12-03 08:00:00.000000', '2025-12-03 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (625, 68, 38, 'JOINED', '2025-12-03 08:00:00.000000'),
       (626, 68, 40, 'JOINED', '2025-12-03 08:00:00.000000'),
       (627, 68, 42, 'JOINED', '2025-12-03 08:00:00.000000'),
       (628, 68, 44, 'JOINED', '2025-12-03 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 625, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-09 08:00:00.000000', '2025-12-09 08:00:00.000000', '2025-12-09 08:00:00.000000'),
       (DEFAULT, 626, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-09 08:00:00.000000', '2025-12-09 08:00:00.000000', '2025-12-09 08:00:00.000000'),
       (DEFAULT, 627, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-09 08:00:00.000000', '2025-12-09 08:00:00.000000', '2025-12-09 08:00:00.000000'),
       (DEFAULT, 628, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-09 08:00:00.000000', '2025-12-09 08:00:00.000000', '2025-12-09 08:00:00.000000');

-- 2025-12-09
-- 2025-12-14
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (69, 1, 121, NULL, 'Create mapper util', 'Create mapper util', NULL, 'NORMAL', 'BACKEND', 'NORMAL', FALSE, '2025-12-09', '2025-12-14', '2025-12-14', '2025-12-09 08:00:00.000000', '2025-12-09 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (629, 69, 16, 'JOINED', '2025-12-09 08:00:00.000000'),
       (630, 69, 18, 'JOINED', '2025-12-09 08:00:00.000000'),
       (631, 69, 20, 'JOINED', '2025-12-09 08:00:00.000000'),
       (632, 69, 46, 'JOINED', '2025-12-09 08:00:00.000000'),
       (633, 69, 48, 'JOINED', '2025-12-09 08:00:00.000000'),
       (634, 69, 50, 'JOINED', '2025-12-09 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 629, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-12 20:00:00.000000', '2025-12-12 20:00:00.000000', '2025-12-14 08:00:00.000000'),
       (DEFAULT, 630, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-12 20:00:00.000000', '2025-12-12 20:00:00.000000', '2025-12-14 08:00:00.000000'),
       (DEFAULT, 631, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-12 20:00:00.000000', '2025-12-12 20:00:00.000000', '2025-12-14 08:00:00.000000'),
       (DEFAULT, 632, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-12 20:00:00.000000', '2025-12-12 20:00:00.000000', '2025-12-14 08:00:00.000000'),
       (DEFAULT, 633, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-12 20:00:00.000000', '2025-12-12 20:00:00.000000', '2025-12-14 08:00:00.000000'),
       (DEFAULT, 634, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-12 20:00:00.000000', '2025-12-12 20:00:00.000000', '2025-12-14 08:00:00.000000');

-- 2025-12-14
-- 2025-12-19
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (70, 1, 121, NULL, 'Add validation annotations', 'Add validation annotations', NULL, 'NORMAL', 'BACKEND', 'LOW', FALSE, '2025-12-14', '2025-12-19', '2025-12-19', '2025-12-14 08:00:00.000000', '2025-12-14 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (635, 70, 46, 'JOINED', '2025-12-14 08:00:00.000000'),
       (636, 70, 48, 'JOINED', '2025-12-14 08:00:00.000000'),
       (637, 70, 50, 'JOINED', '2025-12-14 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 635, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-19 08:00:00.000000', '2025-12-19 08:00:00.000000', '2025-12-19 08:00:00.000000'),
       (DEFAULT, 636, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-19 08:00:00.000000', '2025-12-19 08:00:00.000000', '2025-12-19 08:00:00.000000'),
       (DEFAULT, 637, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-19 08:00:00.000000', '2025-12-19 08:00:00.000000', '2025-12-19 08:00:00.000000');

-- 2025-12-19
-- 2025-12-23
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (71, 1, 121, NULL, 'Create login request dto', 'Create login request dto', NULL, 'LIGHT', 'BACKEND', 'NORMAL', FALSE, '2025-12-19', '2025-12-23', '2025-12-23', '2025-12-19 08:00:00.000000', '2025-12-19 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (638, 71, 22, 'JOINED', '2025-12-19 08:00:00.000000'),
       (639, 71, 24, 'JOINED', '2025-12-19 08:00:00.000000'),
       (640, 71, 26, 'JOINED', '2025-12-19 08:00:00.000000'),
       (641, 71, 28, 'JOINED', '2025-12-19 08:00:00.000000'),
       (642, 71, 52, 'JOINED', '2025-12-19 08:00:00.000000'),
       (643, 71, 54, 'JOINED', '2025-12-19 08:00:00.000000'),
       (644, 71, 56, 'JOINED', '2025-12-19 08:00:00.000000'),
       (645, 71, 58, 'JOINED', '2025-12-19 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 638, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-22 03:12:00.000000', '2025-12-22 03:12:00.000000', '2025-12-23 08:00:00.000000'),
       (DEFAULT, 639, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-22 03:12:00.000000', '2025-12-22 03:12:00.000000', '2025-12-23 08:00:00.000000'),
       (DEFAULT, 640, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-22 03:12:00.000000', '2025-12-22 03:12:00.000000', '2025-12-23 08:00:00.000000'),
       (DEFAULT, 641, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-22 03:12:00.000000', '2025-12-22 03:12:00.000000', '2025-12-23 08:00:00.000000'),
       (DEFAULT, 642, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-22 03:12:00.000000', '2025-12-22 03:12:00.000000', '2025-12-23 08:00:00.000000'),
       (DEFAULT, 643, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-22 03:12:00.000000', '2025-12-22 03:12:00.000000', '2025-12-23 08:00:00.000000'),
       (DEFAULT, 644, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-22 03:12:00.000000', '2025-12-22 03:12:00.000000', '2025-12-23 08:00:00.000000'),
       (DEFAULT, 645, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-22 03:12:00.000000', '2025-12-22 03:12:00.000000', '2025-12-23 08:00:00.000000');

-- 2025-12-23
-- 2025-12-27
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (72, 1, 121, NULL, 'Create register request dto', 'Create register request dto', NULL, 'LIGHT', 'BACKEND', 'LOW', FALSE, '2025-12-23', '2025-12-27', '2025-12-27', '2025-12-23 08:00:00.000000', '2025-12-23 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (646, 72, 52, 'JOINED', '2025-12-23 08:00:00.000000'),
       (647, 72, 54, 'JOINED', '2025-12-23 08:00:00.000000'),
       (648, 72, 56, 'JOINED', '2025-12-23 08:00:00.000000'),
       (649, 72, 58, 'JOINED', '2025-12-23 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 646, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-27 08:00:00.000000', '2025-12-27 08:00:00.000000', '2025-12-27 08:00:00.000000'),
       (DEFAULT, 647, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-27 08:00:00.000000', '2025-12-27 08:00:00.000000', '2025-12-27 08:00:00.000000'),
       (DEFAULT, 648, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-27 08:00:00.000000', '2025-12-27 08:00:00.000000', '2025-12-27 08:00:00.000000'),
       (DEFAULT, 649, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-27 08:00:00.000000', '2025-12-27 08:00:00.000000', '2025-12-27 08:00:00.000000');

-- 2025-12-27
-- 2025-12-30
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (73, 1, 121, NULL, 'Profile detail screen', 'Profile detail screen', NULL, 'HARD', 'FRONTEND', 'NORMAL', FALSE, '2025-12-27', '2025-12-30', '2025-12-30', '2025-12-27 08:00:00.000000', '2025-12-27 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (650, 73, 1, 'JOINED', '2025-12-27 08:00:00.000000'),
       (651, 73, 3, 'JOINED', '2025-12-27 08:00:00.000000'),
       (652, 73, 5, 'JOINED', '2025-12-27 08:00:00.000000'),
       (653, 73, 7, 'JOINED', '2025-12-27 08:00:00.000000'),
       (654, 73, 31, 'JOINED', '2025-12-27 08:00:00.000000'),
       (655, 73, 33, 'JOINED', '2025-12-27 08:00:00.000000'),
       (656, 73, 35, 'JOINED', '2025-12-27 08:00:00.000000'),
       (657, 73, 37, 'JOINED', '2025-12-27 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 650, 'Employee 1 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-29 10:24:00.000000', '2025-12-29 10:24:00.000000', '2025-12-30 08:00:00.000000'),
       (DEFAULT, 651, 'Employee 3 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-29 10:24:00.000000', '2025-12-29 10:24:00.000000', '2025-12-30 08:00:00.000000'),
       (DEFAULT, 652, 'Employee 5 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-29 10:24:00.000000', '2025-12-29 10:24:00.000000', '2025-12-30 08:00:00.000000'),
       (DEFAULT, 653, 'Employee 7 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-29 10:24:00.000000', '2025-12-29 10:24:00.000000', '2025-12-30 08:00:00.000000'),
       (DEFAULT, 654, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-29 10:24:00.000000', '2025-12-29 10:24:00.000000', '2025-12-30 08:00:00.000000'),
       (DEFAULT, 655, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-29 10:24:00.000000', '2025-12-29 10:24:00.000000', '2025-12-30 08:00:00.000000'),
       (DEFAULT, 656, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-29 10:24:00.000000', '2025-12-29 10:24:00.000000', '2025-12-30 08:00:00.000000'),
       (DEFAULT, 657, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-29 10:24:00.000000', '2025-12-29 10:24:00.000000', '2025-12-30 08:00:00.000000');

-- 2025-12-30
-- 2026-01-06
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (74, 1, 121, NULL, 'Show error notifications', 'Show error notifications', NULL, 'HARD', 'FRONTEND', 'LOW', FALSE, '2025-12-30', '2026-01-06', '2026-01-06', '2025-12-30 08:00:00.000000', '2025-12-30 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (658, 74, 31, 'JOINED', '2025-12-30 08:00:00.000000'),
       (659, 74, 33, 'JOINED', '2025-12-30 08:00:00.000000'),
       (660, 74, 35, 'JOINED', '2025-12-30 08:00:00.000000'),
       (661, 74, 37, 'JOINED', '2025-12-30 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 658, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-06 08:00:00.000000', '2026-01-06 08:00:00.000000', '2026-01-06 08:00:00.000000'),
       (DEFAULT, 659, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-06 08:00:00.000000', '2026-01-06 08:00:00.000000', '2026-01-06 08:00:00.000000'),
       (DEFAULT, 660, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-06 08:00:00.000000', '2026-01-06 08:00:00.000000', '2026-01-06 08:00:00.000000'),
       (DEFAULT, 661, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-06 08:00:00.000000', '2026-01-06 08:00:00.000000', '2026-01-06 08:00:00.000000');

-- 2026-01-06
-- 2026-01-12
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (75, 1, 121, NULL, 'Show success notifications', 'Show success notifications', NULL, 'ADVANCED', 'FRONTEND', 'NORMAL', FALSE, '2026-01-06', '2026-01-12', '2026-01-12', '2026-01-06 08:00:00.000000', '2026-01-06 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (662, 75, 9, 'JOINED', '2026-01-06 08:00:00.000000'),
       (663, 75, 11, 'JOINED', '2026-01-06 08:00:00.000000'),
       (664, 75, 13, 'JOINED', '2026-01-06 08:00:00.000000'),
       (665, 75, 39, 'JOINED', '2026-01-06 08:00:00.000000'),
       (666, 75, 41, 'JOINED', '2026-01-06 08:00:00.000000'),
       (667, 75, 43, 'JOINED', '2026-01-06 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 662, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-10 12:48:00.000000', '2026-01-10 12:48:00.000000', '2026-01-12 08:00:00.000000'),
       (DEFAULT, 663, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-10 12:48:00.000000', '2026-01-10 12:48:00.000000', '2026-01-12 08:00:00.000000'),
       (DEFAULT, 664, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-10 12:48:00.000000', '2026-01-10 12:48:00.000000', '2026-01-12 08:00:00.000000'),
       (DEFAULT, 665, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-10 12:48:00.000000', '2026-01-10 12:48:00.000000', '2026-01-12 08:00:00.000000'),
       (DEFAULT, 666, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-10 12:48:00.000000', '2026-01-10 12:48:00.000000', '2026-01-12 08:00:00.000000'),
       (DEFAULT, 667, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-10 12:48:00.000000', '2026-01-10 12:48:00.000000', '2026-01-12 08:00:00.000000');

-- 2026-01-12
-- 2026-01-18
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (76, 1, 121, NULL, 'Create delete confirm modal', 'Create delete confirm modal', NULL, 'ADVANCED', 'FRONTEND', 'LOW', FALSE, '2026-01-12', '2026-01-18', '2026-01-18', '2026-01-12 08:00:00.000000', '2026-01-12 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (668, 76, 39, 'JOINED', '2026-01-12 08:00:00.000000'),
       (669, 76, 41, 'JOINED', '2026-01-12 08:00:00.000000'),
       (670, 76, 43, 'JOINED', '2026-01-12 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 668, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-18 08:00:00.000000', '2026-01-18 08:00:00.000000', '2026-01-18 08:00:00.000000'),
       (DEFAULT, 669, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-18 08:00:00.000000', '2026-01-18 08:00:00.000000', '2026-01-18 08:00:00.000000'),
       (DEFAULT, 670, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-18 08:00:00.000000', '2026-01-18 08:00:00.000000', '2026-01-18 08:00:00.000000');

-- 2026-01-18
-- 2026-01-23
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (77, 1, 121, NULL, 'Create quick edit modal', 'Create quick edit modal', NULL, 'NORMAL', 'FRONTEND', 'NORMAL', FALSE, '2026-01-18', '2026-01-23', '2026-01-23', '2026-01-18 08:00:00.000000', '2026-01-18 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (671, 77, 15, 'JOINED', '2026-01-18 08:00:00.000000'),
       (672, 77, 17, 'JOINED', '2026-01-18 08:00:00.000000'),
       (673, 77, 19, 'JOINED', '2026-01-18 08:00:00.000000'),
       (674, 77, 21, 'JOINED', '2026-01-18 08:00:00.000000'),
       (675, 77, 45, 'JOINED', '2026-01-18 08:00:00.000000'),
       (676, 77, 47, 'JOINED', '2026-01-18 08:00:00.000000'),
       (677, 77, 49, 'JOINED', '2026-01-18 08:00:00.000000'),
       (678, 77, 51, 'JOINED', '2026-01-18 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 671, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-21 20:00:00.000000', '2026-01-21 20:00:00.000000', '2026-01-23 08:00:00.000000'),
       (DEFAULT, 672, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-21 20:00:00.000000', '2026-01-21 20:00:00.000000', '2026-01-23 08:00:00.000000'),
       (DEFAULT, 673, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-21 20:00:00.000000', '2026-01-21 20:00:00.000000', '2026-01-23 08:00:00.000000'),
       (DEFAULT, 674, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-21 20:00:00.000000', '2026-01-21 20:00:00.000000', '2026-01-23 08:00:00.000000'),
       (DEFAULT, 675, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-21 20:00:00.000000', '2026-01-21 20:00:00.000000', '2026-01-23 08:00:00.000000'),
       (DEFAULT, 676, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-21 20:00:00.000000', '2026-01-21 20:00:00.000000', '2026-01-23 08:00:00.000000'),
       (DEFAULT, 677, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-21 20:00:00.000000', '2026-01-21 20:00:00.000000', '2026-01-23 08:00:00.000000'),
       (DEFAULT, 678, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-21 20:00:00.000000', '2026-01-21 20:00:00.000000', '2026-01-23 08:00:00.000000');

-- 2026-01-23
-- 2026-01-28
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (78, 1, 121, NULL, 'Build toast notification', 'Build toast notification', NULL, 'NORMAL', 'FRONTEND', 'LOW', FALSE, '2026-01-23', '2026-01-28', '2026-01-28', '2026-01-23 08:00:00.000000', '2026-01-23 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (679, 78, 45, 'JOINED', '2026-01-23 08:00:00.000000'),
       (680, 78, 47, 'JOINED', '2026-01-23 08:00:00.000000'),
       (681, 78, 49, 'JOINED', '2026-01-23 08:00:00.000000'),
       (682, 78, 51, 'JOINED', '2026-01-23 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 679, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-28 08:00:00.000000', '2026-01-28 08:00:00.000000', '2026-01-28 08:00:00.000000'),
       (DEFAULT, 680, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-28 08:00:00.000000', '2026-01-28 08:00:00.000000', '2026-01-28 08:00:00.000000'),
       (DEFAULT, 681, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-28 08:00:00.000000', '2026-01-28 08:00:00.000000', '2026-01-28 08:00:00.000000'),
       (DEFAULT, 682, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-28 08:00:00.000000', '2026-01-28 08:00:00.000000', '2026-01-28 08:00:00.000000');

-- 2026-01-28
-- 2026-02-01
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (79, 1, 121, NULL, 'Add loading indicator', 'Add loading indicator', NULL, 'LIGHT', 'FRONTEND', 'NORMAL', FALSE, '2026-01-28', '2026-02-01', '2026-02-01', '2026-01-28 08:00:00.000000', '2026-01-28 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (683, 79, 23, 'JOINED', '2026-01-28 08:00:00.000000'),
       (684, 79, 25, 'JOINED', '2026-01-28 08:00:00.000000'),
       (685, 79, 27, 'JOINED', '2026-01-28 08:00:00.000000'),
       (686, 79, 53, 'JOINED', '2026-01-28 08:00:00.000000'),
       (687, 79, 55, 'JOINED', '2026-01-28 08:00:00.000000'),
       (688, 79, 57, 'JOINED', '2026-01-28 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 683, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-31 03:12:00.000000', '2026-01-31 03:12:00.000000', '2026-02-01 08:00:00.000000'),
       (DEFAULT, 684, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-31 03:12:00.000000', '2026-01-31 03:12:00.000000', '2026-02-01 08:00:00.000000'),
       (DEFAULT, 685, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-31 03:12:00.000000', '2026-01-31 03:12:00.000000', '2026-02-01 08:00:00.000000'),
       (DEFAULT, 686, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-31 03:12:00.000000', '2026-01-31 03:12:00.000000', '2026-02-01 08:00:00.000000'),
       (DEFAULT, 687, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-31 03:12:00.000000', '2026-01-31 03:12:00.000000', '2026-02-01 08:00:00.000000'),
       (DEFAULT, 688, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-31 03:12:00.000000', '2026-01-31 03:12:00.000000', '2026-02-01 08:00:00.000000');

-- 2026-02-01
-- 2026-02-05
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (80, 1, 121, NULL, 'Add skeleton loading', 'Add skeleton loading', NULL, 'LIGHT', 'FRONTEND', 'LOW', FALSE, '2026-02-01', '2026-02-05', '2026-02-05', '2026-02-01 08:00:00.000000', '2026-02-01 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (689, 80, 53, 'JOINED', '2026-02-01 08:00:00.000000'),
       (690, 80, 55, 'JOINED', '2026-02-01 08:00:00.000000'),
       (691, 80, 57, 'JOINED', '2026-02-01 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 689, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-05 08:00:00.000000', '2026-02-05 08:00:00.000000', '2026-02-05 08:00:00.000000'),
       (DEFAULT, 690, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-05 08:00:00.000000', '2026-02-05 08:00:00.000000', '2026-02-05 08:00:00.000000'),
       (DEFAULT, 691, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-05 08:00:00.000000', '2026-02-05 08:00:00.000000', '2026-02-05 08:00:00.000000');

-- 2026-02-05
-- 2026-02-08
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (81, 1, 121, NULL, 'Create task request dto', 'Create task request dto', NULL, 'HARD', 'BACKEND', 'NORMAL', FALSE, '2026-02-05', '2026-02-08', '2026-02-08', '2026-02-05 08:00:00.000000', '2026-02-05 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (692, 81, 2, 'JOINED', '2026-02-05 08:00:00.000000'),
       (693, 81, 4, 'JOINED', '2026-02-05 08:00:00.000000'),
       (694, 81, 6, 'JOINED', '2026-02-05 08:00:00.000000'),
       (695, 81, 32, 'JOINED', '2026-02-05 08:00:00.000000'),
       (696, 81, 34, 'JOINED', '2026-02-05 08:00:00.000000'),
       (697, 81, 36, 'JOINED', '2026-02-05 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 692, 'Employee 2 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-07 14:00:00.000000', '2026-02-07 14:00:00.000000', '2026-02-08 08:00:00.000000'),
       (DEFAULT, 693, 'Employee 4 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-07 14:00:00.000000', '2026-02-07 14:00:00.000000', '2026-02-08 08:00:00.000000'),
       (DEFAULT, 694, 'Employee 6 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-07 14:00:00.000000', '2026-02-07 14:00:00.000000', '2026-02-08 08:00:00.000000'),
       (DEFAULT, 695, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-07 14:00:00.000000', '2026-02-07 14:00:00.000000', '2026-02-08 08:00:00.000000'),
       (DEFAULT, 696, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-07 14:00:00.000000', '2026-02-07 14:00:00.000000', '2026-02-08 08:00:00.000000'),
       (DEFAULT, 697, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-07 14:00:00.000000', '2026-02-07 14:00:00.000000', '2026-02-08 08:00:00.000000');

-- 2026-02-08
-- 2026-02-15
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (82, 1, 121, NULL, 'Create task response dto', 'Create task response dto', NULL, 'ADVANCED', 'BACKEND', 'NORMAL', FALSE, '2026-02-08', '2026-02-15', '2026-02-15', '2026-02-08 08:00:00.000000', '2026-02-08 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (698, 82, 8, 'JOINED', '2026-02-08 08:00:00.000000'),
       (699, 82, 10, 'JOINED', '2026-02-08 08:00:00.000000'),
       (700, 82, 12, 'JOINED', '2026-02-08 08:00:00.000000'),
       (701, 82, 14, 'JOINED', '2026-02-08 08:00:00.000000'),
       (702, 82, 38, 'JOINED', '2026-02-08 08:00:00.000000'),
       (703, 82, 40, 'JOINED', '2026-02-08 08:00:00.000000'),
       (704, 82, 42, 'JOINED', '2026-02-08 08:00:00.000000'),
       (705, 82, 44, 'JOINED', '2026-02-08 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 698, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-13 14:00:00.000000', '2026-02-13 14:00:00.000000', '2026-02-15 08:00:00.000000'),
       (DEFAULT, 699, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-13 14:00:00.000000', '2026-02-13 14:00:00.000000', '2026-02-15 08:00:00.000000'),
       (DEFAULT, 700, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-13 14:00:00.000000', '2026-02-13 14:00:00.000000', '2026-02-15 08:00:00.000000'),
       (DEFAULT, 701, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-13 14:00:00.000000', '2026-02-13 14:00:00.000000', '2026-02-15 08:00:00.000000'),
       (DEFAULT, 702, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-13 14:00:00.000000', '2026-02-13 14:00:00.000000', '2026-02-15 08:00:00.000000'),
       (DEFAULT, 703, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-13 14:00:00.000000', '2026-02-13 14:00:00.000000', '2026-02-15 08:00:00.000000'),
       (DEFAULT, 704, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-13 14:00:00.000000', '2026-02-13 14:00:00.000000', '2026-02-15 08:00:00.000000'),
       (DEFAULT, 705, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-13 14:00:00.000000', '2026-02-13 14:00:00.000000', '2026-02-15 08:00:00.000000');

-- 2026-02-15
-- 2026-02-21
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (83, 1, 121, NULL, 'Add swagger configuration', 'Add swagger configuration', NULL, 'NORMAL', 'BACKEND', 'NORMAL', FALSE, '2026-02-15', '2026-02-21', '2026-02-21', '2026-02-15 08:00:00.000000', '2026-02-15 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (706, 83, 16, 'JOINED', '2026-02-15 08:00:00.000000'),
       (707, 83, 18, 'JOINED', '2026-02-15 08:00:00.000000'),
       (708, 83, 20, 'JOINED', '2026-02-15 08:00:00.000000'),
       (709, 83, 46, 'JOINED', '2026-02-15 08:00:00.000000'),
       (710, 83, 48, 'JOINED', '2026-02-15 08:00:00.000000'),
       (711, 83, 50, 'JOINED', '2026-02-15 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 706, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-19 20:00:00.000000', '2026-02-19 20:00:00.000000', '2026-02-21 08:00:00.000000'),
       (DEFAULT, 707, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-19 20:00:00.000000', '2026-02-19 20:00:00.000000', '2026-02-21 08:00:00.000000'),
       (DEFAULT, 708, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-19 20:00:00.000000', '2026-02-19 20:00:00.000000', '2026-02-21 08:00:00.000000'),
       (DEFAULT, 709, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-19 20:00:00.000000', '2026-02-19 20:00:00.000000', '2026-02-21 08:00:00.000000'),
       (DEFAULT, 710, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-19 20:00:00.000000', '2026-02-19 20:00:00.000000', '2026-02-21 08:00:00.000000'),
       (DEFAULT, 711, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-19 20:00:00.000000', '2026-02-19 20:00:00.000000', '2026-02-21 08:00:00.000000');

-- 2026-02-21
-- 2026-02-26
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (84, 1, 121, NULL, 'Add cors configuration', 'Add cors configuration', NULL, 'LIGHT', 'BACKEND', 'NORMAL', FALSE, '2026-02-21', '2026-02-26', '2026-02-26', '2026-02-21 08:00:00.000000', '2026-02-21 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (712, 84, 22, 'JOINED', '2026-02-21 08:00:00.000000'),
       (713, 84, 24, 'JOINED', '2026-02-21 08:00:00.000000'),
       (714, 84, 26, 'JOINED', '2026-02-21 08:00:00.000000'),
       (715, 84, 28, 'JOINED', '2026-02-21 08:00:00.000000'),
       (716, 84, 52, 'JOINED', '2026-02-21 08:00:00.000000'),
       (717, 84, 54, 'JOINED', '2026-02-21 08:00:00.000000'),
       (718, 84, 56, 'JOINED', '2026-02-21 08:00:00.000000'),
       (719, 84, 58, 'JOINED', '2026-02-21 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 712, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-25 02:00:00.000000', '2026-02-25 02:00:00.000000', '2026-02-26 08:00:00.000000'),
       (DEFAULT, 713, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-25 02:00:00.000000', '2026-02-25 02:00:00.000000', '2026-02-26 08:00:00.000000'),
       (DEFAULT, 714, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-25 02:00:00.000000', '2026-02-25 02:00:00.000000', '2026-02-26 08:00:00.000000'),
       (DEFAULT, 715, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-25 02:00:00.000000', '2026-02-25 02:00:00.000000', '2026-02-26 08:00:00.000000'),
       (DEFAULT, 716, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-25 02:00:00.000000', '2026-02-25 02:00:00.000000', '2026-02-26 08:00:00.000000'),
       (DEFAULT, 717, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-25 02:00:00.000000', '2026-02-25 02:00:00.000000', '2026-02-26 08:00:00.000000'),
       (DEFAULT, 718, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-25 02:00:00.000000', '2026-02-25 02:00:00.000000', '2026-02-26 08:00:00.000000'),
       (DEFAULT, 719, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-25 02:00:00.000000', '2026-02-25 02:00:00.000000', '2026-02-26 08:00:00.000000');

-- 2026-02-26
-- 2026-03-02
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (85, 1, 121, NULL, 'Optimize list rendering', 'Optimize list rendering', NULL, 'HARD', 'FRONTEND', 'NORMAL', FALSE, '2026-02-26', '2026-03-02', '2026-03-02', '2026-02-26 08:00:00.000000', '2026-02-26 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (720, 85, 1, 'JOINED', '2026-02-26 08:00:00.000000'),
       (721, 85, 3, 'JOINED', '2026-02-26 08:00:00.000000'),
       (722, 85, 5, 'JOINED', '2026-02-26 08:00:00.000000'),
       (723, 85, 7, 'JOINED', '2026-02-26 08:00:00.000000'),
       (724, 85, 31, 'JOINED', '2026-02-26 08:00:00.000000'),
       (725, 85, 33, 'JOINED', '2026-02-26 08:00:00.000000'),
       (726, 85, 35, 'JOINED', '2026-02-26 08:00:00.000000'),
       (727, 85, 37, 'JOINED', '2026-02-26 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 720, 'Employee 1 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-01 08:00:00.000000', '2026-03-01 08:00:00.000000', '2026-03-02 08:00:00.000000'),
       (DEFAULT, 721, 'Employee 3 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-01 08:00:00.000000', '2026-03-01 08:00:00.000000', '2026-03-02 08:00:00.000000'),
       (DEFAULT, 722, 'Employee 5 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-01 08:00:00.000000', '2026-03-01 08:00:00.000000', '2026-03-02 08:00:00.000000'),
       (DEFAULT, 723, 'Employee 7 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-01 08:00:00.000000', '2026-03-01 08:00:00.000000', '2026-03-02 08:00:00.000000'),
       (DEFAULT, 724, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-01 08:00:00.000000', '2026-03-01 08:00:00.000000', '2026-03-02 08:00:00.000000'),
       (DEFAULT, 725, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-01 08:00:00.000000', '2026-03-01 08:00:00.000000', '2026-03-02 08:00:00.000000'),
       (DEFAULT, 726, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-01 08:00:00.000000', '2026-03-01 08:00:00.000000', '2026-03-02 08:00:00.000000'),
       (DEFAULT, 727, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-01 08:00:00.000000', '2026-03-01 08:00:00.000000', '2026-03-02 08:00:00.000000');

-- 2026-03-02
-- 2026-03-09
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (86, 1, 121, NULL, 'Memoize task components', 'Memoize task components', NULL, 'ADVANCED', 'FRONTEND', 'NORMAL', FALSE, '2026-03-02', '2026-03-09', '2026-03-09', '2026-03-02 08:00:00.000000', '2026-03-02 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (728, 86, 9, 'JOINED', '2026-03-02 08:00:00.000000'),
       (729, 86, 11, 'JOINED', '2026-03-02 08:00:00.000000'),
       (730, 86, 13, 'JOINED', '2026-03-02 08:00:00.000000'),
       (731, 86, 39, 'JOINED', '2026-03-02 08:00:00.000000'),
       (732, 86, 41, 'JOINED', '2026-03-02 08:00:00.000000'),
       (733, 86, 43, 'JOINED', '2026-03-02 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 728, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-07 14:00:00.000000', '2026-03-07 14:00:00.000000', '2026-03-09 08:00:00.000000'),
       (DEFAULT, 729, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-07 14:00:00.000000', '2026-03-07 14:00:00.000000', '2026-03-09 08:00:00.000000'),
       (DEFAULT, 730, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-07 14:00:00.000000', '2026-03-07 14:00:00.000000', '2026-03-09 08:00:00.000000'),
       (DEFAULT, 731, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-07 14:00:00.000000', '2026-03-07 14:00:00.000000', '2026-03-09 08:00:00.000000'),
       (DEFAULT, 732, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-07 14:00:00.000000', '2026-03-07 14:00:00.000000', '2026-03-09 08:00:00.000000'),
       (DEFAULT, 733, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-07 14:00:00.000000', '2026-03-07 14:00:00.000000', '2026-03-09 08:00:00.000000');

-- 2026-03-09
-- 2026-03-15
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (87, 1, 121, NULL, 'Extract TaskItem component', 'Extract TaskItem component', NULL, 'NORMAL', 'FRONTEND', 'NORMAL', FALSE, '2026-03-09', '2026-03-15', '2026-03-15', '2026-03-09 08:00:00.000000', '2026-03-09 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (734, 87, 15, 'JOINED', '2026-03-09 08:00:00.000000'),
       (735, 87, 17, 'JOINED', '2026-03-09 08:00:00.000000'),
       (736, 87, 19, 'JOINED', '2026-03-09 08:00:00.000000'),
       (737, 87, 21, 'JOINED', '2026-03-09 08:00:00.000000'),
       (738, 87, 45, 'JOINED', '2026-03-09 08:00:00.000000'),
       (739, 87, 47, 'JOINED', '2026-03-09 08:00:00.000000'),
       (740, 87, 49, 'JOINED', '2026-03-09 08:00:00.000000'),
       (741, 87, 51, 'JOINED', '2026-03-09 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 734, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-13 20:00:00.000000', '2026-03-13 20:00:00.000000', '2026-03-15 08:00:00.000000'),
       (DEFAULT, 735, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-13 20:00:00.000000', '2026-03-13 20:00:00.000000', '2026-03-15 08:00:00.000000'),
       (DEFAULT, 736, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-13 20:00:00.000000', '2026-03-13 20:00:00.000000', '2026-03-15 08:00:00.000000'),
       (DEFAULT, 737, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-13 20:00:00.000000', '2026-03-13 20:00:00.000000', '2026-03-15 08:00:00.000000'),
       (DEFAULT, 738, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-13 20:00:00.000000', '2026-03-13 20:00:00.000000', '2026-03-15 08:00:00.000000'),
       (DEFAULT, 739, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-13 20:00:00.000000', '2026-03-13 20:00:00.000000', '2026-03-15 08:00:00.000000'),
       (DEFAULT, 740, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-13 20:00:00.000000', '2026-03-13 20:00:00.000000', '2026-03-15 08:00:00.000000'),
       (DEFAULT, 741, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-13 20:00:00.000000', '2026-03-13 20:00:00.000000', '2026-03-15 08:00:00.000000');

-- 2026-03-15
-- 2026-03-20
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (88, 1, 121, NULL, 'Extract TaskCard component', 'Extract TaskCard component', NULL, 'LIGHT', 'FRONTEND', 'NORMAL', FALSE, '2026-03-15', '2026-03-20', '2026-03-20', '2026-03-15 08:00:00.000000', '2026-03-15 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (742, 88, 23, 'JOINED', '2026-03-15 08:00:00.000000'),
       (743, 88, 25, 'JOINED', '2026-03-15 08:00:00.000000'),
       (744, 88, 27, 'JOINED', '2026-03-15 08:00:00.000000'),
       (745, 88, 53, 'JOINED', '2026-03-15 08:00:00.000000'),
       (746, 88, 55, 'JOINED', '2026-03-15 08:00:00.000000'),
       (747, 88, 57, 'JOINED', '2026-03-15 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 742, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-19 02:00:00.000000', '2026-03-19 02:00:00.000000', '2026-03-20 08:00:00.000000'),
       (DEFAULT, 743, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-19 02:00:00.000000', '2026-03-19 02:00:00.000000', '2026-03-20 08:00:00.000000'),
       (DEFAULT, 744, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-19 02:00:00.000000', '2026-03-19 02:00:00.000000', '2026-03-20 08:00:00.000000'),
       (DEFAULT, 745, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-19 02:00:00.000000', '2026-03-19 02:00:00.000000', '2026-03-20 08:00:00.000000'),
       (DEFAULT, 746, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-19 02:00:00.000000', '2026-03-19 02:00:00.000000', '2026-03-20 08:00:00.000000'),
       (DEFAULT, 747, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-19 02:00:00.000000', '2026-03-19 02:00:00.000000', '2026-03-20 08:00:00.000000');

-- 2026-03-20
-- 2026-03-24
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (89, 1, 121, NULL, 'Setup object mapper config', 'Setup object mapper config', NULL, 'HARD', 'BACKEND', 'NORMAL', FALSE, '2026-03-20', '2026-03-24', '2026-03-24', '2026-03-20 08:00:00.000000', '2026-03-20 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (748, 89, 2, 'JOINED', '2026-03-20 08:00:00.000000'),
       (749, 89, 4, 'JOINED', '2026-03-20 08:00:00.000000'),
       (750, 89, 6, 'JOINED', '2026-03-20 08:00:00.000000'),
       (751, 89, 32, 'JOINED', '2026-03-20 08:00:00.000000'),
       (752, 89, 34, 'JOINED', '2026-03-20 08:00:00.000000'),
       (753, 89, 36, 'JOINED', '2026-03-20 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 748, 'Employee 2 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-23 12:48:00.000000', '2026-03-23 12:48:00.000000', '2026-03-24 08:00:00.000000'),
       (DEFAULT, 749, 'Employee 4 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-23 12:48:00.000000', '2026-03-23 12:48:00.000000', '2026-03-24 08:00:00.000000'),
       (DEFAULT, 750, 'Employee 6 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-23 12:48:00.000000', '2026-03-23 12:48:00.000000', '2026-03-24 08:00:00.000000'),
       (DEFAULT, 751, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-23 12:48:00.000000', '2026-03-23 12:48:00.000000', '2026-03-24 08:00:00.000000'),
       (DEFAULT, 752, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-23 12:48:00.000000', '2026-03-23 12:48:00.000000', '2026-03-24 08:00:00.000000'),
       (DEFAULT, 753, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-23 12:48:00.000000', '2026-03-23 12:48:00.000000', '2026-03-24 08:00:00.000000');

-- 2026-03-24
-- 2026-03-31
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (90, 1, 121, NULL, 'Add logging interceptor', 'Add logging interceptor', NULL, 'ADVANCED', 'BACKEND', 'NORMAL', FALSE, '2026-03-24', '2026-03-31', '2026-03-31', '2026-03-24 08:00:00.000000', '2026-03-24 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (754, 90, 8, 'JOINED', '2026-03-24 08:00:00.000000'),
       (755, 90, 10, 'JOINED', '2026-03-24 08:00:00.000000'),
       (756, 90, 12, 'JOINED', '2026-03-24 08:00:00.000000'),
       (757, 90, 14, 'JOINED', '2026-03-24 08:00:00.000000'),
       (758, 90, 38, 'JOINED', '2026-03-24 08:00:00.000000'),
       (759, 90, 40, 'JOINED', '2026-03-24 08:00:00.000000'),
       (760, 90, 42, 'JOINED', '2026-03-24 08:00:00.000000'),
       (761, 90, 44, 'JOINED', '2026-03-24 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 754, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-29 22:24:00.000000', '2026-03-29 22:24:00.000000', '2026-03-31 08:00:00.000000'),
       (DEFAULT, 755, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-29 22:24:00.000000', '2026-03-29 22:24:00.000000', '2026-03-31 08:00:00.000000'),
       (DEFAULT, 756, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-29 22:24:00.000000', '2026-03-29 22:24:00.000000', '2026-03-31 08:00:00.000000'),
       (DEFAULT, 757, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-29 22:24:00.000000', '2026-03-29 22:24:00.000000', '2026-03-31 08:00:00.000000'),
       (DEFAULT, 758, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-29 22:24:00.000000', '2026-03-29 22:24:00.000000', '2026-03-31 08:00:00.000000'),
       (DEFAULT, 759, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-29 22:24:00.000000', '2026-03-29 22:24:00.000000', '2026-03-31 08:00:00.000000'),
       (DEFAULT, 760, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-29 22:24:00.000000', '2026-03-29 22:24:00.000000', '2026-03-31 08:00:00.000000'),
       (DEFAULT, 761, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-03-29 22:24:00.000000', '2026-03-29 22:24:00.000000', '2026-03-31 08:00:00.000000');

-- 2026-03-31
-- 2026-04-06
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (91, 1, 121, NULL, 'Add service layer tests', 'Add service layer tests', NULL, 'NORMAL', 'BACKEND', 'NORMAL', FALSE, '2026-03-31', '2026-04-06', '2026-04-06', '2026-03-31 08:00:00.000000', '2026-03-31 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (762, 91, 16, 'JOINED', '2026-03-31 08:00:00.000000'),
       (763, 91, 18, 'JOINED', '2026-03-31 08:00:00.000000'),
       (764, 91, 20, 'JOINED', '2026-03-31 08:00:00.000000'),
       (765, 91, 46, 'JOINED', '2026-03-31 08:00:00.000000'),
       (766, 91, 48, 'JOINED', '2026-03-31 08:00:00.000000'),
       (767, 91, 50, 'JOINED', '2026-03-31 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 762, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-04-05 03:12:00.000000', '2026-04-05 03:12:00.000000', '2026-04-06 08:00:00.000000'),
       (DEFAULT, 763, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-04-05 03:12:00.000000', '2026-04-05 03:12:00.000000', '2026-04-06 08:00:00.000000'),
       (DEFAULT, 764, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-04-05 03:12:00.000000', '2026-04-05 03:12:00.000000', '2026-04-06 08:00:00.000000'),
       (DEFAULT, 765, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-04-05 03:12:00.000000', '2026-04-05 03:12:00.000000', '2026-04-06 08:00:00.000000'),
       (DEFAULT, 766, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-04-05 03:12:00.000000', '2026-04-05 03:12:00.000000', '2026-04-06 08:00:00.000000'),
       (DEFAULT, 767, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-04-05 03:12:00.000000', '2026-04-05 03:12:00.000000', '2026-04-06 08:00:00.000000');

-- 2026-04-06
-- 2026-04-11
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (92, 1, 121, NULL, 'Add repository tests', 'Add repository tests', NULL, 'LIGHT', 'BACKEND', 'NORMAL', FALSE, '2026-04-06', '2026-04-11', '2026-04-11', '2026-04-06 08:00:00.000000', '2026-04-06 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (768, 92, 22, 'JOINED', '2026-04-06 08:00:00.000000'),
       (769, 92, 24, 'JOINED', '2026-04-06 08:00:00.000000'),
       (770, 92, 26, 'JOINED', '2026-04-06 08:00:00.000000'),
       (771, 92, 28, 'JOINED', '2026-04-06 08:00:00.000000'),
       (772, 92, 52, 'JOINED', '2026-04-06 08:00:00.000000'),
       (773, 92, 54, 'JOINED', '2026-04-06 08:00:00.000000'),
       (774, 92, 56, 'JOINED', '2026-04-06 08:00:00.000000'),
       (775, 92, 58, 'JOINED', '2026-04-06 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 768, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-04-10 08:00:00.000000', '2026-04-10 08:00:00.000000', '2026-04-11 08:00:00.000000'),
       (DEFAULT, 769, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-04-10 08:00:00.000000', '2026-04-10 08:00:00.000000', '2026-04-11 08:00:00.000000'),
       (DEFAULT, 770, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-04-10 08:00:00.000000', '2026-04-10 08:00:00.000000', '2026-04-11 08:00:00.000000'),
       (DEFAULT, 771, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-04-10 08:00:00.000000', '2026-04-10 08:00:00.000000', '2026-04-11 08:00:00.000000'),
       (DEFAULT, 772, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-04-10 08:00:00.000000', '2026-04-10 08:00:00.000000', '2026-04-11 08:00:00.000000'),
       (DEFAULT, 773, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-04-10 08:00:00.000000', '2026-04-10 08:00:00.000000', '2026-04-11 08:00:00.000000'),
       (DEFAULT, 774, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-04-10 08:00:00.000000', '2026-04-10 08:00:00.000000', '2026-04-11 08:00:00.000000'),
       (DEFAULT, 775, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-04-10 08:00:00.000000', '2026-04-10 08:00:00.000000', '2026-04-11 08:00:00.000000');

-- 2026-04-11
-- 2026-04-15
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (93, 1, 121, NULL, 'Extract UserMenu component', 'Extract UserMenu component', NULL, 'HARD', 'FRONTEND', 'NORMAL', FALSE, '2026-04-11', '2026-04-15', '2026-04-15', '2026-04-11 08:00:00.000000', '2026-04-11 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (776, 93, 1, 'JOINED', '2026-04-11 08:00:00.000000'),
       (777, 93, 3, 'JOINED', '2026-04-11 08:00:00.000000'),
       (778, 93, 5, 'JOINED', '2026-04-11 08:00:00.000000'),
       (779, 93, 7, 'JOINED', '2026-04-11 08:00:00.000000'),
       (780, 93, 31, 'JOINED', '2026-04-11 08:00:00.000000'),
       (781, 93, 33, 'JOINED', '2026-04-11 08:00:00.000000'),
       (782, 93, 35, 'JOINED', '2026-04-11 08:00:00.000000'),
       (783, 93, 37, 'JOINED', '2026-04-11 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 776, 'Employee 1 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-04-14 12:48:00.000000', '2026-04-14 12:48:00.000000', '2026-04-15 08:00:00.000000'),
       (DEFAULT, 777, 'Employee 3 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-04-14 12:48:00.000000', '2026-04-14 12:48:00.000000', '2026-04-15 08:00:00.000000'),
       (DEFAULT, 778, 'Employee 5 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-04-14 12:48:00.000000', '2026-04-14 12:48:00.000000', '2026-04-15 08:00:00.000000'),
       (DEFAULT, 779, 'Employee 7 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-04-14 12:48:00.000000', '2026-04-14 12:48:00.000000', '2026-04-15 08:00:00.000000'),
       (DEFAULT, 780, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-04-14 12:48:00.000000', '2026-04-14 12:48:00.000000', '2026-04-15 08:00:00.000000'),
       (DEFAULT, 781, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-04-14 12:48:00.000000', '2026-04-14 12:48:00.000000', '2026-04-15 08:00:00.000000'),
       (DEFAULT, 782, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-04-14 12:48:00.000000', '2026-04-14 12:48:00.000000', '2026-04-15 08:00:00.000000'),
       (DEFAULT, 783, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-04-14 12:48:00.000000', '2026-04-14 12:48:00.000000', '2026-04-15 08:00:00.000000');

-- 2026-04-15
-- 2026-04-22
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (94, 1, 121, NULL, 'Create API hook', 'Create API hook', NULL, 'ADVANCED', 'FRONTEND', 'NORMAL', FALSE, '2026-04-15', '2026-04-22', '2026-04-22', '2026-04-15 08:00:00.000000', '2026-04-15 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (784, 94, 9, 'JOINED', '2026-04-15 08:00:00.000000'),
       (785, 94, 11, 'JOINED', '2026-04-15 08:00:00.000000'),
       (786, 94, 13, 'JOINED', '2026-04-15 08:00:00.000000'),
       (787, 94, 39, 'JOINED', '2026-04-15 08:00:00.000000'),
       (788, 94, 41, 'JOINED', '2026-04-15 08:00:00.000000'),
       (789, 94, 43, 'JOINED', '2026-04-15 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 784, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-04-20 22:24:00.000000', '2026-04-20 22:24:00.000000', '2026-04-22 08:00:00.000000'),
       (DEFAULT, 785, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-04-20 22:24:00.000000', '2026-04-20 22:24:00.000000', '2026-04-22 08:00:00.000000'),
       (DEFAULT, 786, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-04-20 22:24:00.000000', '2026-04-20 22:24:00.000000', '2026-04-22 08:00:00.000000'),
       (DEFAULT, 787, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-04-20 22:24:00.000000', '2026-04-20 22:24:00.000000', '2026-04-22 08:00:00.000000'),
       (DEFAULT, 788, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-04-20 22:24:00.000000', '2026-04-20 22:24:00.000000', '2026-04-22 08:00:00.000000'),
       (DEFAULT, 789, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-04-20 22:24:00.000000', '2026-04-20 22:24:00.000000', '2026-04-22 08:00:00.000000');

-- 2026-04-22
-- 2026-04-28
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (95, 1, 121, NULL, 'Create auth hook', 'Create auth hook', NULL, 'NORMAL', 'FRONTEND', 'NORMAL', FALSE, '2026-04-22', '2026-04-28', '2026-04-28', '2026-04-22 08:00:00.000000', '2026-04-22 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (790, 95, 15, 'JOINED', '2026-04-22 08:00:00.000000'),
       (791, 95, 17, 'JOINED', '2026-04-22 08:00:00.000000'),
       (792, 95, 19, 'JOINED', '2026-04-22 08:00:00.000000'),
       (793, 95, 21, 'JOINED', '2026-04-22 08:00:00.000000'),
       (794, 95, 45, 'JOINED', '2026-04-22 08:00:00.000000'),
       (795, 95, 47, 'JOINED', '2026-04-22 08:00:00.000000'),
       (796, 95, 49, 'JOINED', '2026-04-22 08:00:00.000000'),
       (797, 95, 51, 'JOINED', '2026-04-22 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 790, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-04-27 03:12:00.000000', '2026-04-27 03:12:00.000000', '2026-04-28 08:00:00.000000'),
       (DEFAULT, 791, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-04-27 03:12:00.000000', '2026-04-27 03:12:00.000000', '2026-04-28 08:00:00.000000'),
       (DEFAULT, 792, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-04-27 03:12:00.000000', '2026-04-27 03:12:00.000000', '2026-04-28 08:00:00.000000'),
       (DEFAULT, 793, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-04-27 03:12:00.000000', '2026-04-27 03:12:00.000000', '2026-04-28 08:00:00.000000'),
       (DEFAULT, 794, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-04-27 03:12:00.000000', '2026-04-27 03:12:00.000000', '2026-04-28 08:00:00.000000'),
       (DEFAULT, 795, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-04-27 03:12:00.000000', '2026-04-27 03:12:00.000000', '2026-04-28 08:00:00.000000'),
       (DEFAULT, 796, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-04-27 03:12:00.000000', '2026-04-27 03:12:00.000000', '2026-04-28 08:00:00.000000'),
       (DEFAULT, 797, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-04-27 03:12:00.000000', '2026-04-27 03:12:00.000000', '2026-04-28 08:00:00.000000');

-- 2026-04-28
-- 2026-05-03
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (96, 1, 121, NULL, 'Create form hook', 'Create form hook', NULL, 'LIGHT', 'FRONTEND', 'NORMAL', FALSE, '2026-04-28', '2026-05-03', '2026-05-03', '2026-04-28 08:00:00.000000', '2026-04-28 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (798, 96, 23, 'JOINED', '2026-04-28 08:00:00.000000'),
       (799, 96, 25, 'JOINED', '2026-04-28 08:00:00.000000'),
       (800, 96, 27, 'JOINED', '2026-04-28 08:00:00.000000'),
       (801, 96, 53, 'JOINED', '2026-04-28 08:00:00.000000'),
       (802, 96, 55, 'JOINED', '2026-04-28 08:00:00.000000'),
       (803, 96, 57, 'JOINED', '2026-04-28 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 798, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-02 08:00:00.000000', '2026-05-02 08:00:00.000000', '2026-05-03 08:00:00.000000'),
       (DEFAULT, 799, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-02 08:00:00.000000', '2026-05-02 08:00:00.000000', '2026-05-03 08:00:00.000000'),
       (DEFAULT, 800, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-02 08:00:00.000000', '2026-05-02 08:00:00.000000', '2026-05-03 08:00:00.000000'),
       (DEFAULT, 801, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-02 08:00:00.000000', '2026-05-02 08:00:00.000000', '2026-05-03 08:00:00.000000'),
       (DEFAULT, 802, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-02 08:00:00.000000', '2026-05-02 08:00:00.000000', '2026-05-03 08:00:00.000000'),
       (DEFAULT, 803, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-02 08:00:00.000000', '2026-05-02 08:00:00.000000', '2026-05-03 08:00:00.000000');

-- 2026-05-03
-- 2026-05-07
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (97, 1, 121, NULL, 'Add controller tests', 'Add controller tests', NULL, 'HARD', 'BACKEND', 'NORMAL', FALSE, '2026-05-03', '2026-05-07', '2026-05-07', '2026-05-03 08:00:00.000000', '2026-05-03 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (804, 97, 2, 'JOINED', '2026-05-03 08:00:00.000000'),
       (805, 97, 4, 'JOINED', '2026-05-03 08:00:00.000000'),
       (806, 97, 6, 'JOINED', '2026-05-03 08:00:00.000000'),
       (807, 97, 32, 'JOINED', '2026-05-03 08:00:00.000000'),
       (808, 97, 34, 'JOINED', '2026-05-03 08:00:00.000000'),
       (809, 97, 36, 'JOINED', '2026-05-03 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 804, 'Employee 2 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-06 17:36:00.000000', '2026-05-06 17:36:00.000000', '2026-05-07 08:00:00.000000'),
       (DEFAULT, 805, 'Employee 4 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-06 17:36:00.000000', '2026-05-06 17:36:00.000000', '2026-05-07 08:00:00.000000'),
       (DEFAULT, 806, 'Employee 6 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-06 17:36:00.000000', '2026-05-06 17:36:00.000000', '2026-05-07 08:00:00.000000'),
       (DEFAULT, 807, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-06 17:36:00.000000', '2026-05-06 17:36:00.000000', '2026-05-07 08:00:00.000000'),
       (DEFAULT, 808, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-06 17:36:00.000000', '2026-05-06 17:36:00.000000', '2026-05-07 08:00:00.000000'),
       (DEFAULT, 809, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-06 17:36:00.000000', '2026-05-06 17:36:00.000000', '2026-05-07 08:00:00.000000');

-- 2026-05-07
-- 2026-05-14
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (98, 1, 121, NULL, 'Integrate with redis cache', 'Integrate with redis cache', NULL, 'ADVANCED', 'BACKEND', 'NORMAL', FALSE, '2026-05-07', '2026-05-14', '2026-05-14', '2026-05-07 08:00:00.000000', '2026-05-07 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (810, 98, 8, 'JOINED', '2026-05-07 08:00:00.000000'),
       (811, 98, 10, 'JOINED', '2026-05-07 08:00:00.000000'),
       (812, 98, 12, 'JOINED', '2026-05-07 08:00:00.000000'),
       (813, 98, 14, 'JOINED', '2026-05-07 08:00:00.000000'),
       (814, 98, 38, 'JOINED', '2026-05-07 08:00:00.000000'),
       (815, 98, 40, 'JOINED', '2026-05-07 08:00:00.000000'),
       (816, 98, 42, 'JOINED', '2026-05-07 08:00:00.000000'),
       (817, 98, 44, 'JOINED', '2026-05-07 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 810, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-13 06:48:00.000000', '2026-05-13 06:48:00.000000', '2026-05-14 08:00:00.000000'),
       (DEFAULT, 811, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-13 06:48:00.000000', '2026-05-13 06:48:00.000000', '2026-05-14 08:00:00.000000'),
       (DEFAULT, 812, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-13 06:48:00.000000', '2026-05-13 06:48:00.000000', '2026-05-14 08:00:00.000000'),
       (DEFAULT, 813, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-13 06:48:00.000000', '2026-05-13 06:48:00.000000', '2026-05-14 08:00:00.000000'),
       (DEFAULT, 814, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-13 06:48:00.000000', '2026-05-13 06:48:00.000000', '2026-05-14 08:00:00.000000'),
       (DEFAULT, 815, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-13 06:48:00.000000', '2026-05-13 06:48:00.000000', '2026-05-14 08:00:00.000000'),
       (DEFAULT, 816, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-13 06:48:00.000000', '2026-05-13 06:48:00.000000', '2026-05-14 08:00:00.000000'),
       (DEFAULT, 817, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-13 06:48:00.000000', '2026-05-13 06:48:00.000000', '2026-05-14 08:00:00.000000');

-- 2026-05-14
-- 2026-05-20
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (99, 1, 121, NULL, 'Cache task list response', 'Cache task list response', NULL, 'NORMAL', 'BACKEND', 'NORMAL', FALSE, '2026-05-14', '2026-05-20', '2026-05-20', '2026-05-14 08:00:00.000000', '2026-05-14 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (818, 99, 16, 'JOINED', '2026-05-14 08:00:00.000000'),
       (819, 99, 18, 'JOINED', '2026-05-14 08:00:00.000000'),
       (820, 99, 20, 'JOINED', '2026-05-14 08:00:00.000000'),
       (821, 99, 46, 'JOINED', '2026-05-14 08:00:00.000000'),
       (822, 99, 48, 'JOINED', '2026-05-14 08:00:00.000000'),
       (823, 99, 50, 'JOINED', '2026-05-14 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 818, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-19 10:24:00.000000', '2026-05-19 10:24:00.000000', '2026-05-20 08:00:00.000000'),
       (DEFAULT, 819, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-19 10:24:00.000000', '2026-05-19 10:24:00.000000', '2026-05-20 08:00:00.000000'),
       (DEFAULT, 820, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-19 10:24:00.000000', '2026-05-19 10:24:00.000000', '2026-05-20 08:00:00.000000'),
       (DEFAULT, 821, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-19 10:24:00.000000', '2026-05-19 10:24:00.000000', '2026-05-20 08:00:00.000000'),
       (DEFAULT, 822, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-19 10:24:00.000000', '2026-05-19 10:24:00.000000', '2026-05-20 08:00:00.000000'),
       (DEFAULT, 823, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-19 10:24:00.000000', '2026-05-19 10:24:00.000000', '2026-05-20 08:00:00.000000');

-- 2026-05-20
-- 2026-05-25
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (100, 1, 121, NULL, 'Add rate limit filter', 'Add rate limit filter', NULL, 'LIGHT', 'BACKEND', 'NORMAL', FALSE, '2026-05-20', '2026-05-25', '2026-05-25', '2026-05-20 08:00:00.000000', '2026-05-20 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (824, 100, 22, 'JOINED', '2026-05-20 08:00:00.000000'),
       (825, 100, 24, 'JOINED', '2026-05-20 08:00:00.000000'),
       (826, 100, 26, 'JOINED', '2026-05-20 08:00:00.000000'),
       (827, 100, 28, 'JOINED', '2026-05-20 08:00:00.000000'),
       (828, 100, 52, 'JOINED', '2026-05-20 08:00:00.000000'),
       (829, 100, 54, 'JOINED', '2026-05-20 08:00:00.000000'),
       (830, 100, 56, 'JOINED', '2026-05-20 08:00:00.000000'),
       (831, 100, 58, 'JOINED', '2026-05-20 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 824, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-24 14:00:00.000000', '2026-05-24 14:00:00.000000', '2026-05-25 08:00:00.000000'),
       (DEFAULT, 825, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-24 14:00:00.000000', '2026-05-24 14:00:00.000000', '2026-05-25 08:00:00.000000'),
       (DEFAULT, 826, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-24 14:00:00.000000', '2026-05-24 14:00:00.000000', '2026-05-25 08:00:00.000000'),
       (DEFAULT, 827, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-24 14:00:00.000000', '2026-05-24 14:00:00.000000', '2026-05-25 08:00:00.000000'),
       (DEFAULT, 828, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-24 14:00:00.000000', '2026-05-24 14:00:00.000000', '2026-05-25 08:00:00.000000'),
       (DEFAULT, 829, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-24 14:00:00.000000', '2026-05-24 14:00:00.000000', '2026-05-25 08:00:00.000000'),
       (DEFAULT, 830, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-24 14:00:00.000000', '2026-05-24 14:00:00.000000', '2026-05-25 08:00:00.000000'),
       (DEFAULT, 831, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-24 14:00:00.000000', '2026-05-24 14:00:00.000000', '2026-05-25 08:00:00.000000');

-- 2026-05-25
-- 2026-05-29
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (101, 1, 121, NULL, 'Integrate login API', 'Integrate login API', NULL, 'HARD', 'FRONTEND', 'NORMAL', FALSE, '2026-05-25', '2026-05-29', '2026-05-29', '2026-05-25 08:00:00.000000', '2026-05-25 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (832, 101, 1, 'JOINED', '2026-05-25 08:00:00.000000'),
       (833, 101, 3, 'JOINED', '2026-05-25 08:00:00.000000'),
       (834, 101, 5, 'JOINED', '2026-05-25 08:00:00.000000'),
       (835, 101, 7, 'JOINED', '2026-05-25 08:00:00.000000'),
       (836, 101, 31, 'JOINED', '2026-05-25 08:00:00.000000'),
       (837, 101, 33, 'JOINED', '2026-05-25 08:00:00.000000'),
       (838, 101, 35, 'JOINED', '2026-05-25 08:00:00.000000'),
       (839, 101, 37, 'JOINED', '2026-05-25 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 832, 'Employee 1 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-28 17:36:00.000000', '2026-05-28 17:36:00.000000', '2026-05-29 08:00:00.000000'),
       (DEFAULT, 833, 'Employee 3 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-28 17:36:00.000000', '2026-05-28 17:36:00.000000', '2026-05-29 08:00:00.000000'),
       (DEFAULT, 834, 'Employee 5 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-28 17:36:00.000000', '2026-05-28 17:36:00.000000', '2026-05-29 08:00:00.000000'),
       (DEFAULT, 835, 'Employee 7 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-28 17:36:00.000000', '2026-05-28 17:36:00.000000', '2026-05-29 08:00:00.000000'),
       (DEFAULT, 836, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-28 17:36:00.000000', '2026-05-28 17:36:00.000000', '2026-05-29 08:00:00.000000'),
       (DEFAULT, 837, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-28 17:36:00.000000', '2026-05-28 17:36:00.000000', '2026-05-29 08:00:00.000000'),
       (DEFAULT, 838, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-28 17:36:00.000000', '2026-05-28 17:36:00.000000', '2026-05-29 08:00:00.000000'),
       (DEFAULT, 839, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-05-28 17:36:00.000000', '2026-05-28 17:36:00.000000', '2026-05-29 08:00:00.000000');

-- 2026-05-29
-- 2026-06-05
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (102, 1, 121, NULL, 'Integrate register API', 'Integrate register API', NULL, 'ADVANCED', 'FRONTEND', 'NORMAL', FALSE, '2026-05-29', '2026-06-05', '2026-06-05', '2026-05-29 08:00:00.000000', '2026-05-29 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (840, 102, 9, 'JOINED', '2026-05-29 08:00:00.000000'),
       (841, 102, 11, 'JOINED', '2026-05-29 08:00:00.000000'),
       (842, 102, 13, 'JOINED', '2026-05-29 08:00:00.000000'),
       (843, 102, 39, 'JOINED', '2026-05-29 08:00:00.000000'),
       (844, 102, 41, 'JOINED', '2026-05-29 08:00:00.000000'),
       (845, 102, 43, 'JOINED', '2026-05-29 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 840, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-06-04 06:48:00.000000', '2026-06-04 06:48:00.000000', '2026-06-05 08:00:00.000000'),
       (DEFAULT, 841, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-06-04 06:48:00.000000', '2026-06-04 06:48:00.000000', '2026-06-05 08:00:00.000000'),
       (DEFAULT, 842, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-06-04 06:48:00.000000', '2026-06-04 06:48:00.000000', '2026-06-05 08:00:00.000000'),
       (DEFAULT, 843, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-06-04 06:48:00.000000', '2026-06-04 06:48:00.000000', '2026-06-05 08:00:00.000000'),
       (DEFAULT, 844, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-06-04 06:48:00.000000', '2026-06-04 06:48:00.000000', '2026-06-05 08:00:00.000000'),
       (DEFAULT, 845, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-06-04 06:48:00.000000', '2026-06-04 06:48:00.000000', '2026-06-05 08:00:00.000000');

-- 2026-06-05
-- 2026-06-11
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (103, 1, 121, NULL, 'Integrate task API', 'Integrate task API', NULL, 'NORMAL', 'FRONTEND', 'NORMAL', FALSE, '2026-06-05', '2026-06-11', '2026-06-11', '2026-06-05 08:00:00.000000', '2026-06-05 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (846, 103, 15, 'JOINED', '2026-06-05 08:00:00.000000'),
       (847, 103, 17, 'JOINED', '2026-06-05 08:00:00.000000'),
       (848, 103, 19, 'JOINED', '2026-06-05 08:00:00.000000'),
       (849, 103, 21, 'JOINED', '2026-06-05 08:00:00.000000'),
       (850, 103, 45, 'JOINED', '2026-06-05 08:00:00.000000'),
       (851, 103, 47, 'JOINED', '2026-06-05 08:00:00.000000'),
       (852, 103, 49, 'JOINED', '2026-06-05 08:00:00.000000'),
       (853, 103, 51, 'JOINED', '2026-06-05 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 846, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-06-10 10:24:00.000000', '2026-06-10 10:24:00.000000', '2026-06-11 08:00:00.000000'),
       (DEFAULT, 847, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-06-10 10:24:00.000000', '2026-06-10 10:24:00.000000', '2026-06-11 08:00:00.000000'),
       (DEFAULT, 848, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-06-10 10:24:00.000000', '2026-06-10 10:24:00.000000', '2026-06-11 08:00:00.000000'),
       (DEFAULT, 849, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-06-10 10:24:00.000000', '2026-06-10 10:24:00.000000', '2026-06-11 08:00:00.000000'),
       (DEFAULT, 850, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-06-10 10:24:00.000000', '2026-06-10 10:24:00.000000', '2026-06-11 08:00:00.000000'),
       (DEFAULT, 851, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-06-10 10:24:00.000000', '2026-06-10 10:24:00.000000', '2026-06-11 08:00:00.000000'),
       (DEFAULT, 852, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-06-10 10:24:00.000000', '2026-06-10 10:24:00.000000', '2026-06-11 08:00:00.000000'),
       (DEFAULT, 853, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-06-10 10:24:00.000000', '2026-06-10 10:24:00.000000', '2026-06-11 08:00:00.000000');

-- 2026-06-11
-- 2026-06-16
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (104, 1, 121, NULL, 'Store token in cookie', 'Store token in cookie', NULL, 'LIGHT', 'FRONTEND', 'NORMAL', FALSE, '2026-06-11', '2026-06-16', '2026-06-16', '2026-06-11 08:00:00.000000', '2026-06-11 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (854, 104, 23, 'JOINED', '2026-06-11 08:00:00.000000'),
       (855, 104, 25, 'JOINED', '2026-06-11 08:00:00.000000'),
       (856, 104, 27, 'JOINED', '2026-06-11 08:00:00.000000'),
       (857, 104, 53, 'JOINED', '2026-06-11 08:00:00.000000'),
       (858, 104, 55, 'JOINED', '2026-06-11 08:00:00.000000'),
       (859, 104, 57, 'JOINED', '2026-06-11 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 854, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-06-15 14:00:00.000000', '2026-06-15 14:00:00.000000', '2026-06-16 08:00:00.000000'),
       (DEFAULT, 855, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-06-15 14:00:00.000000', '2026-06-15 14:00:00.000000', '2026-06-16 08:00:00.000000'),
       (DEFAULT, 856, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-06-15 14:00:00.000000', '2026-06-15 14:00:00.000000', '2026-06-16 08:00:00.000000'),
       (DEFAULT, 857, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-06-15 14:00:00.000000', '2026-06-15 14:00:00.000000', '2026-06-16 08:00:00.000000'),
       (DEFAULT, 858, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-06-15 14:00:00.000000', '2026-06-15 14:00:00.000000', '2026-06-16 08:00:00.000000'),
       (DEFAULT, 859, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-06-15 14:00:00.000000', '2026-06-15 14:00:00.000000', '2026-06-16 08:00:00.000000');

-- 2026-06-16
-- 2026-06-20
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (105, 1, 121, NULL, 'Add health check endpoint', 'Add health check endpoint', NULL, 'HARD', 'BACKEND', 'NORMAL', FALSE, '2026-06-16', '2026-06-20', '2026-06-20', '2026-06-16 08:00:00.000000', '2026-06-16 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (860, 105, 2, 'JOINED', '2026-06-16 08:00:00.000000'),
       (861, 105, 4, 'JOINED', '2026-06-16 08:00:00.000000'),
       (862, 105, 6, 'JOINED', '2026-06-16 08:00:00.000000'),
       (863, 105, 32, 'JOINED', '2026-06-16 08:00:00.000000'),
       (864, 105, 34, 'JOINED', '2026-06-16 08:00:00.000000'),
       (865, 105, 36, 'JOINED', '2026-06-16 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 860, 'Employee 2 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-06-19 22:24:00.000000', '2026-06-19 22:24:00.000000', '2026-06-20 08:00:00.000000'),
       (DEFAULT, 861, 'Employee 4 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-06-19 22:24:00.000000', '2026-06-19 22:24:00.000000', '2026-06-20 08:00:00.000000'),
       (DEFAULT, 862, 'Employee 6 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-06-19 22:24:00.000000', '2026-06-19 22:24:00.000000', '2026-06-20 08:00:00.000000'),
       (DEFAULT, 863, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-06-19 22:24:00.000000', '2026-06-19 22:24:00.000000', '2026-06-20 08:00:00.000000'),
       (DEFAULT, 864, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-06-19 22:24:00.000000', '2026-06-19 22:24:00.000000', '2026-06-20 08:00:00.000000'),
       (DEFAULT, 865, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-06-19 22:24:00.000000', '2026-06-19 22:24:00.000000', '2026-06-20 08:00:00.000000');

-- 2026-06-20
-- 2026-06-27
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (106, 1, 121, NULL, 'Add metrics endpoint', 'Add metrics endpoint', NULL, 'ADVANCED', 'BACKEND', 'NORMAL', FALSE, '2026-06-20', '2026-06-27', '2026-06-27', '2026-06-20 08:00:00.000000', '2026-06-20 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (866, 106, 8, 'JOINED', '2026-06-20 08:00:00.000000'),
       (867, 106, 10, 'JOINED', '2026-06-20 08:00:00.000000'),
       (868, 106, 12, 'JOINED', '2026-06-20 08:00:00.000000'),
       (869, 106, 14, 'JOINED', '2026-06-20 08:00:00.000000'),
       (870, 106, 38, 'JOINED', '2026-06-20 08:00:00.000000'),
       (871, 106, 40, 'JOINED', '2026-06-20 08:00:00.000000'),
       (872, 106, 42, 'JOINED', '2026-06-20 08:00:00.000000'),
       (873, 106, 44, 'JOINED', '2026-06-20 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 866, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-06-26 15:12:00.000000', '2026-06-26 15:12:00.000000', '2026-06-27 08:00:00.000000'),
       (DEFAULT, 867, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-06-26 15:12:00.000000', '2026-06-26 15:12:00.000000', '2026-06-27 08:00:00.000000'),
       (DEFAULT, 868, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-06-26 15:12:00.000000', '2026-06-26 15:12:00.000000', '2026-06-27 08:00:00.000000'),
       (DEFAULT, 869, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-06-26 15:12:00.000000', '2026-06-26 15:12:00.000000', '2026-06-27 08:00:00.000000'),
       (DEFAULT, 870, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-06-26 15:12:00.000000', '2026-06-26 15:12:00.000000', '2026-06-27 08:00:00.000000'),
       (DEFAULT, 871, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-06-26 15:12:00.000000', '2026-06-26 15:12:00.000000', '2026-06-27 08:00:00.000000'),
       (DEFAULT, 872, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-06-26 15:12:00.000000', '2026-06-26 15:12:00.000000', '2026-06-27 08:00:00.000000'),
       (DEFAULT, 873, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-06-26 15:12:00.000000', '2026-06-26 15:12:00.000000', '2026-06-27 08:00:00.000000');

-- 2026-06-27
-- 2026-07-03
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (107, 1, 121, NULL, 'Implement scheduled cleanup', 'Implement scheduled cleanup', NULL, 'NORMAL', 'BACKEND', 'NORMAL', FALSE, '2026-06-27', '2026-07-03', '2026-07-03', '2026-06-27 08:00:00.000000', '2026-06-27 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (874, 107, 16, 'JOINED', '2026-06-27 08:00:00.000000'),
       (875, 107, 18, 'JOINED', '2026-06-27 08:00:00.000000'),
       (876, 107, 20, 'JOINED', '2026-06-27 08:00:00.000000'),
       (877, 107, 46, 'JOINED', '2026-06-27 08:00:00.000000'),
       (878, 107, 48, 'JOINED', '2026-06-27 08:00:00.000000'),
       (879, 107, 50, 'JOINED', '2026-06-27 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 874, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-02 17:36:00.000000', '2026-07-02 17:36:00.000000', '2026-07-03 08:00:00.000000'),
       (DEFAULT, 875, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-02 17:36:00.000000', '2026-07-02 17:36:00.000000', '2026-07-03 08:00:00.000000'),
       (DEFAULT, 876, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-02 17:36:00.000000', '2026-07-02 17:36:00.000000', '2026-07-03 08:00:00.000000'),
       (DEFAULT, 877, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-02 17:36:00.000000', '2026-07-02 17:36:00.000000', '2026-07-03 08:00:00.000000'),
       (DEFAULT, 878, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-02 17:36:00.000000', '2026-07-02 17:36:00.000000', '2026-07-03 08:00:00.000000'),
       (DEFAULT, 879, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-02 17:36:00.000000', '2026-07-02 17:36:00.000000', '2026-07-03 08:00:00.000000');

-- 2026-07-03
-- 2026-07-08
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (108, 1, 121, NULL, 'Implement audit logs', 'Implement audit logs', NULL, 'LIGHT', 'BACKEND', 'NORMAL', FALSE, '2026-07-03', '2026-07-08', '2026-07-08', '2026-07-03 08:00:00.000000', '2026-07-03 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (880, 108, 22, 'JOINED', '2026-07-03 08:00:00.000000'),
       (881, 108, 24, 'JOINED', '2026-07-03 08:00:00.000000'),
       (882, 108, 26, 'JOINED', '2026-07-03 08:00:00.000000'),
       (883, 108, 28, 'JOINED', '2026-07-03 08:00:00.000000'),
       (884, 108, 52, 'JOINED', '2026-07-03 08:00:00.000000'),
       (885, 108, 54, 'JOINED', '2026-07-03 08:00:00.000000'),
       (886, 108, 56, 'JOINED', '2026-07-03 08:00:00.000000'),
       (887, 108, 58, 'JOINED', '2026-07-03 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 880, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-07 20:00:00.000000', '2026-07-07 20:00:00.000000', '2026-07-08 08:00:00.000000'),
       (DEFAULT, 881, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-07 20:00:00.000000', '2026-07-07 20:00:00.000000', '2026-07-08 08:00:00.000000'),
       (DEFAULT, 882, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-07 20:00:00.000000', '2026-07-07 20:00:00.000000', '2026-07-08 08:00:00.000000'),
       (DEFAULT, 883, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-07 20:00:00.000000', '2026-07-07 20:00:00.000000', '2026-07-08 08:00:00.000000'),
       (DEFAULT, 884, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-07 20:00:00.000000', '2026-07-07 20:00:00.000000', '2026-07-08 08:00:00.000000'),
       (DEFAULT, 885, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-07 20:00:00.000000', '2026-07-07 20:00:00.000000', '2026-07-08 08:00:00.000000'),
       (DEFAULT, 886, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-07 20:00:00.000000', '2026-07-07 20:00:00.000000', '2026-07-08 08:00:00.000000'),
       (DEFAULT, 887, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-07 20:00:00.000000', '2026-07-07 20:00:00.000000', '2026-07-08 08:00:00.000000');

-- 2026-07-08
-- 2026-07-12
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (109, 1, 121, NULL, 'Protect private routes', 'Protect private routes', NULL, 'HARD', 'FRONTEND', 'NORMAL', FALSE, '2026-07-08', '2026-07-12', '2026-07-12', '2026-07-08 08:00:00.000000', '2026-07-08 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (888, 109, 1, 'JOINED', '2026-07-08 08:00:00.000000'),
       (889, 109, 3, 'JOINED', '2026-07-08 08:00:00.000000'),
       (890, 109, 5, 'JOINED', '2026-07-08 08:00:00.000000'),
       (891, 109, 7, 'JOINED', '2026-07-08 08:00:00.000000'),
       (892, 109, 31, 'JOINED', '2026-07-08 08:00:00.000000'),
       (893, 109, 33, 'JOINED', '2026-07-08 08:00:00.000000'),
       (894, 109, 35, 'JOINED', '2026-07-08 08:00:00.000000'),
       (895, 109, 37, 'JOINED', '2026-07-08 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 888, 'Employee 1 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-11 22:24:00.000000', '2026-07-11 22:24:00.000000', '2026-07-12 08:00:00.000000'),
       (DEFAULT, 889, 'Employee 3 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-11 22:24:00.000000', '2026-07-11 22:24:00.000000', '2026-07-12 08:00:00.000000'),
       (DEFAULT, 890, 'Employee 5 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-11 22:24:00.000000', '2026-07-11 22:24:00.000000', '2026-07-12 08:00:00.000000'),
       (DEFAULT, 891, 'Employee 7 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-11 22:24:00.000000', '2026-07-11 22:24:00.000000', '2026-07-12 08:00:00.000000'),
       (DEFAULT, 892, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-11 22:24:00.000000', '2026-07-11 22:24:00.000000', '2026-07-12 08:00:00.000000'),
       (DEFAULT, 893, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-11 22:24:00.000000', '2026-07-11 22:24:00.000000', '2026-07-12 08:00:00.000000'),
       (DEFAULT, 894, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-11 22:24:00.000000', '2026-07-11 22:24:00.000000', '2026-07-12 08:00:00.000000'),
       (DEFAULT, 895, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-11 22:24:00.000000', '2026-07-11 22:24:00.000000', '2026-07-12 08:00:00.000000');

-- 2026-07-12
-- 2026-07-19
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (110, 1, 121, NULL, 'Redirect if unauthenticated', 'Redirect if unauthenticated', NULL, 'ADVANCED', 'FRONTEND', 'NORMAL', FALSE, '2026-07-12', '2026-07-19', '2026-07-19', '2026-07-12 08:00:00.000000', '2026-07-12 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (896, 110, 9, 'JOINED', '2026-07-12 08:00:00.000000'),
       (897, 110, 11, 'JOINED', '2026-07-12 08:00:00.000000'),
       (898, 110, 13, 'JOINED', '2026-07-12 08:00:00.000000'),
       (899, 110, 39, 'JOINED', '2026-07-12 08:00:00.000000'),
       (900, 110, 41, 'JOINED', '2026-07-12 08:00:00.000000'),
       (901, 110, 43, 'JOINED', '2026-07-12 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 896, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-18 15:12:00.000000', '2026-07-18 15:12:00.000000', '2026-07-19 08:00:00.000000'),
       (DEFAULT, 897, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-18 15:12:00.000000', '2026-07-18 15:12:00.000000', '2026-07-19 08:00:00.000000'),
       (DEFAULT, 898, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-18 15:12:00.000000', '2026-07-18 15:12:00.000000', '2026-07-19 08:00:00.000000'),
       (DEFAULT, 899, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-18 15:12:00.000000', '2026-07-18 15:12:00.000000', '2026-07-19 08:00:00.000000'),
       (DEFAULT, 900, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-18 15:12:00.000000', '2026-07-18 15:12:00.000000', '2026-07-19 08:00:00.000000'),
       (DEFAULT, 901, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-18 15:12:00.000000', '2026-07-18 15:12:00.000000', '2026-07-19 08:00:00.000000');

-- 2026-07-19
-- 2026-07-25
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (111, 1, 121, NULL, 'Create 404 page', 'Create 404 page', NULL, 'NORMAL', 'FRONTEND', 'NORMAL', FALSE, '2026-07-19', '2026-07-25', '2026-07-25', '2026-07-19 08:00:00.000000', '2026-07-19 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (902, 111, 15, 'JOINED', '2026-07-19 08:00:00.000000'),
       (903, 111, 17, 'JOINED', '2026-07-19 08:00:00.000000'),
       (904, 111, 19, 'JOINED', '2026-07-19 08:00:00.000000'),
       (905, 111, 21, 'JOINED', '2026-07-19 08:00:00.000000'),
       (906, 111, 45, 'JOINED', '2026-07-19 08:00:00.000000'),
       (907, 111, 47, 'JOINED', '2026-07-19 08:00:00.000000'),
       (908, 111, 49, 'JOINED', '2026-07-19 08:00:00.000000'),
       (909, 111, 51, 'JOINED', '2026-07-19 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 902, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-24 17:36:00.000000', '2026-07-24 17:36:00.000000', '2026-07-25 08:00:00.000000'),
       (DEFAULT, 903, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-24 17:36:00.000000', '2026-07-24 17:36:00.000000', '2026-07-25 08:00:00.000000'),
       (DEFAULT, 904, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-24 17:36:00.000000', '2026-07-24 17:36:00.000000', '2026-07-25 08:00:00.000000'),
       (DEFAULT, 905, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-24 17:36:00.000000', '2026-07-24 17:36:00.000000', '2026-07-25 08:00:00.000000'),
       (DEFAULT, 906, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-24 17:36:00.000000', '2026-07-24 17:36:00.000000', '2026-07-25 08:00:00.000000'),
       (DEFAULT, 907, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-24 17:36:00.000000', '2026-07-24 17:36:00.000000', '2026-07-25 08:00:00.000000'),
       (DEFAULT, 908, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-24 17:36:00.000000', '2026-07-24 17:36:00.000000', '2026-07-25 08:00:00.000000'),
       (DEFAULT, 909, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-24 17:36:00.000000', '2026-07-24 17:36:00.000000', '2026-07-25 08:00:00.000000');

-- 2026-07-25
-- 2026-07-30
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (112, 1, 121, NULL, 'Create 500 page', 'Create 500 page', NULL, 'LIGHT', 'FRONTEND', 'NORMAL', FALSE, '2026-07-25', '2026-07-30', '2026-07-30', '2026-07-25 08:00:00.000000', '2026-07-25 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (910, 112, 23, 'JOINED', '2026-07-25 08:00:00.000000'),
       (911, 112, 25, 'JOINED', '2026-07-25 08:00:00.000000'),
       (912, 112, 27, 'JOINED', '2026-07-25 08:00:00.000000'),
       (913, 112, 53, 'JOINED', '2026-07-25 08:00:00.000000'),
       (914, 112, 55, 'JOINED', '2026-07-25 08:00:00.000000'),
       (915, 112, 57, 'JOINED', '2026-07-25 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 910, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-29 20:00:00.000000', '2026-07-29 20:00:00.000000', '2026-07-30 08:00:00.000000'),
       (DEFAULT, 911, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-29 20:00:00.000000', '2026-07-29 20:00:00.000000', '2026-07-30 08:00:00.000000'),
       (DEFAULT, 912, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-29 20:00:00.000000', '2026-07-29 20:00:00.000000', '2026-07-30 08:00:00.000000'),
       (DEFAULT, 913, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-29 20:00:00.000000', '2026-07-29 20:00:00.000000', '2026-07-30 08:00:00.000000'),
       (DEFAULT, 914, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-29 20:00:00.000000', '2026-07-29 20:00:00.000000', '2026-07-30 08:00:00.000000'),
       (DEFAULT, 915, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-07-29 20:00:00.000000', '2026-07-29 20:00:00.000000', '2026-07-30 08:00:00.000000');

-- 2026-07-30
-- 2026-08-03
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (113, 1, 121, NULL, 'Add user activity tracking', 'Add user activity tracking', NULL, 'HARD', 'BACKEND', 'NORMAL', FALSE, '2026-07-30', '2026-08-03', '2026-08-03', '2026-07-30 08:00:00.000000', '2026-07-30 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (916, 113, 2, 'JOINED', '2026-07-30 08:00:00.000000'),
       (917, 113, 4, 'JOINED', '2026-07-30 08:00:00.000000'),
       (918, 113, 6, 'JOINED', '2026-07-30 08:00:00.000000'),
       (919, 113, 32, 'JOINED', '2026-07-30 08:00:00.000000'),
       (920, 113, 34, 'JOINED', '2026-07-30 08:00:00.000000'),
       (921, 113, 36, 'JOINED', '2026-07-30 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 916, 'Employee 2 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-03 03:12:00.000000', '2026-08-03 03:12:00.000000', '2026-08-03 08:00:00.000000'),
       (DEFAULT, 917, 'Employee 4 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-03 03:12:00.000000', '2026-08-03 03:12:00.000000', '2026-08-03 08:00:00.000000'),
       (DEFAULT, 918, 'Employee 6 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-03 03:12:00.000000', '2026-08-03 03:12:00.000000', '2026-08-03 08:00:00.000000'),
       (DEFAULT, 919, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-03 03:12:00.000000', '2026-08-03 03:12:00.000000', '2026-08-03 08:00:00.000000'),
       (DEFAULT, 920, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-03 03:12:00.000000', '2026-08-03 03:12:00.000000', '2026-08-03 08:00:00.000000'),
       (DEFAULT, 921, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-03 03:12:00.000000', '2026-08-03 03:12:00.000000', '2026-08-03 08:00:00.000000');

-- 2026-08-03
-- 2026-08-10
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (114, 1, 121, NULL, 'Refactor service layers', 'Refactor service layers', NULL, 'ADVANCED', 'BACKEND', 'NORMAL', FALSE, '2026-08-03', '2026-08-10', '2026-08-10', '2026-08-03 08:00:00.000000', '2026-08-03 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (922, 114, 8, 'JOINED', '2026-08-03 08:00:00.000000'),
       (923, 114, 10, 'JOINED', '2026-08-03 08:00:00.000000'),
       (924, 114, 12, 'JOINED', '2026-08-03 08:00:00.000000'),
       (925, 114, 14, 'JOINED', '2026-08-03 08:00:00.000000'),
       (926, 114, 38, 'JOINED', '2026-08-03 08:00:00.000000'),
       (927, 114, 40, 'JOINED', '2026-08-03 08:00:00.000000'),
       (928, 114, 42, 'JOINED', '2026-08-03 08:00:00.000000'),
       (929, 114, 44, 'JOINED', '2026-08-03 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 922, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-09 23:36:00.000000', '2026-08-09 23:36:00.000000', '2026-08-10 08:00:00.000000'),
       (DEFAULT, 923, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-09 23:36:00.000000', '2026-08-09 23:36:00.000000', '2026-08-10 08:00:00.000000'),
       (DEFAULT, 924, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-09 23:36:00.000000', '2026-08-09 23:36:00.000000', '2026-08-10 08:00:00.000000'),
       (DEFAULT, 925, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-09 23:36:00.000000', '2026-08-09 23:36:00.000000', '2026-08-10 08:00:00.000000'),
       (DEFAULT, 926, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-09 23:36:00.000000', '2026-08-09 23:36:00.000000', '2026-08-10 08:00:00.000000'),
       (DEFAULT, 927, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-09 23:36:00.000000', '2026-08-09 23:36:00.000000', '2026-08-10 08:00:00.000000'),
       (DEFAULT, 928, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-09 23:36:00.000000', '2026-08-09 23:36:00.000000', '2026-08-10 08:00:00.000000'),
       (DEFAULT, 929, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-09 23:36:00.000000', '2026-08-09 23:36:00.000000', '2026-08-10 08:00:00.000000');

-- 2026-08-10
-- 2026-08-16
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (115, 1, 121, NULL, 'Optimize database queries', 'Optimize database queries', NULL, 'NORMAL', 'BACKEND', 'NORMAL', FALSE, '2026-08-10', '2026-08-16', '2026-08-16', '2026-08-10 08:00:00.000000', '2026-08-10 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (930, 115, 16, 'JOINED', '2026-08-10 08:00:00.000000'),
       (931, 115, 18, 'JOINED', '2026-08-10 08:00:00.000000'),
       (932, 115, 20, 'JOINED', '2026-08-10 08:00:00.000000'),
       (933, 115, 46, 'JOINED', '2026-08-10 08:00:00.000000'),
       (934, 115, 48, 'JOINED', '2026-08-10 08:00:00.000000'),
       (935, 115, 50, 'JOINED', '2026-08-10 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 930, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-16 00:48:00.000000', '2026-08-16 00:48:00.000000', '2026-08-16 08:00:00.000000'),
       (DEFAULT, 931, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-16 00:48:00.000000', '2026-08-16 00:48:00.000000', '2026-08-16 08:00:00.000000'),
       (DEFAULT, 932, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-16 00:48:00.000000', '2026-08-16 00:48:00.000000', '2026-08-16 08:00:00.000000'),
       (DEFAULT, 933, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-16 00:48:00.000000', '2026-08-16 00:48:00.000000', '2026-08-16 08:00:00.000000'),
       (DEFAULT, 934, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-16 00:48:00.000000', '2026-08-16 00:48:00.000000', '2026-08-16 08:00:00.000000'),
       (DEFAULT, 935, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-16 00:48:00.000000', '2026-08-16 00:48:00.000000', '2026-08-16 08:00:00.000000');

-- 2026-08-16
-- 2026-08-21
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (116, 1, 121, NULL, 'Add transactional annotations', 'Add transactional annotations', NULL, 'LIGHT', 'BACKEND', 'NORMAL', FALSE, '2026-08-16', '2026-08-21', '2026-08-21', '2026-08-16 08:00:00.000000', '2026-08-16 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (936, 116, 22, 'JOINED', '2026-08-16 08:00:00.000000'),
       (937, 116, 24, 'JOINED', '2026-08-16 08:00:00.000000'),
       (938, 116, 26, 'JOINED', '2026-08-16 08:00:00.000000'),
       (939, 116, 28, 'JOINED', '2026-08-16 08:00:00.000000'),
       (940, 116, 52, 'JOINED', '2026-08-16 08:00:00.000000'),
       (941, 116, 54, 'JOINED', '2026-08-16 08:00:00.000000'),
       (942, 116, 56, 'JOINED', '2026-08-16 08:00:00.000000'),
       (943, 116, 58, 'JOINED', '2026-08-16 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 936, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-21 02:00:00.000000', '2026-08-21 02:00:00.000000', '2026-08-21 08:00:00.000000'),
       (DEFAULT, 937, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-21 02:00:00.000000', '2026-08-21 02:00:00.000000', '2026-08-21 08:00:00.000000'),
       (DEFAULT, 938, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-21 02:00:00.000000', '2026-08-21 02:00:00.000000', '2026-08-21 08:00:00.000000'),
       (DEFAULT, 939, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-21 02:00:00.000000', '2026-08-21 02:00:00.000000', '2026-08-21 08:00:00.000000'),
       (DEFAULT, 940, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-21 02:00:00.000000', '2026-08-21 02:00:00.000000', '2026-08-21 08:00:00.000000'),
       (DEFAULT, 941, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-21 02:00:00.000000', '2026-08-21 02:00:00.000000', '2026-08-21 08:00:00.000000'),
       (DEFAULT, 942, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-21 02:00:00.000000', '2026-08-21 02:00:00.000000', '2026-08-21 08:00:00.000000'),
       (DEFAULT, 943, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-21 02:00:00.000000', '2026-08-21 02:00:00.000000', '2026-08-21 08:00:00.000000');

-- 2026-08-21
-- 2026-08-25
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (117, 1, 121, NULL, 'Make main page responsive', 'Make main page responsive', NULL, 'HARD', 'FRONTEND', 'NORMAL', FALSE, '2026-08-21', '2026-08-25', '2026-08-25', '2026-08-21 08:00:00.000000', '2026-08-21 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (944, 117, 1, 'JOINED', '2026-08-21 08:00:00.000000'),
       (945, 117, 3, 'JOINED', '2026-08-21 08:00:00.000000'),
       (946, 117, 5, 'JOINED', '2026-08-21 08:00:00.000000'),
       (947, 117, 7, 'JOINED', '2026-08-21 08:00:00.000000'),
       (948, 117, 31, 'JOINED', '2026-08-21 08:00:00.000000'),
       (949, 117, 33, 'JOINED', '2026-08-21 08:00:00.000000'),
       (950, 117, 35, 'JOINED', '2026-08-21 08:00:00.000000'),
       (951, 117, 37, 'JOINED', '2026-08-21 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 944, 'Employee 1 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-25 03:12:00.000000', '2026-08-25 03:12:00.000000', '2026-08-25 08:00:00.000000'),
       (DEFAULT, 945, 'Employee 3 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-25 03:12:00.000000', '2026-08-25 03:12:00.000000', '2026-08-25 08:00:00.000000'),
       (DEFAULT, 946, 'Employee 5 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-25 03:12:00.000000', '2026-08-25 03:12:00.000000', '2026-08-25 08:00:00.000000'),
       (DEFAULT, 947, 'Employee 7 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-25 03:12:00.000000', '2026-08-25 03:12:00.000000', '2026-08-25 08:00:00.000000'),
       (DEFAULT, 948, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-25 03:12:00.000000', '2026-08-25 03:12:00.000000', '2026-08-25 08:00:00.000000'),
       (DEFAULT, 949, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-25 03:12:00.000000', '2026-08-25 03:12:00.000000', '2026-08-25 08:00:00.000000'),
       (DEFAULT, 950, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-25 03:12:00.000000', '2026-08-25 03:12:00.000000', '2026-08-25 08:00:00.000000'),
       (DEFAULT, 951, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-25 03:12:00.000000', '2026-08-25 03:12:00.000000', '2026-08-25 08:00:00.000000');

-- 2026-08-25
-- 2026-09-01
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (118, 1, 121, NULL, 'Make task page responsive', 'Make task page responsive', NULL, 'ADVANCED', 'FRONTEND', 'NORMAL', FALSE, '2026-08-25', '2026-09-01', '2026-09-01', '2026-08-25 08:00:00.000000', '2026-08-25 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (952, 118, 9, 'JOINED', '2026-08-25 08:00:00.000000'),
       (953, 118, 11, 'JOINED', '2026-08-25 08:00:00.000000'),
       (954, 118, 13, 'JOINED', '2026-08-25 08:00:00.000000'),
       (955, 118, 39, 'JOINED', '2026-08-25 08:00:00.000000'),
       (956, 118, 41, 'JOINED', '2026-08-25 08:00:00.000000'),
       (957, 118, 43, 'JOINED', '2026-08-25 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 952, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-31 23:36:00.000000', '2026-08-31 23:36:00.000000', '2026-09-01 08:00:00.000000'),
       (DEFAULT, 953, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-31 23:36:00.000000', '2026-08-31 23:36:00.000000', '2026-09-01 08:00:00.000000'),
       (DEFAULT, 954, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-31 23:36:00.000000', '2026-08-31 23:36:00.000000', '2026-09-01 08:00:00.000000'),
       (DEFAULT, 955, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-31 23:36:00.000000', '2026-08-31 23:36:00.000000', '2026-09-01 08:00:00.000000'),
       (DEFAULT, 956, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-31 23:36:00.000000', '2026-08-31 23:36:00.000000', '2026-09-01 08:00:00.000000'),
       (DEFAULT, 957, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-08-31 23:36:00.000000', '2026-08-31 23:36:00.000000', '2026-09-01 08:00:00.000000');

-- 2026-09-01
-- 2026-09-07
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (119, 1, 121, NULL, 'Add dark mode toggle', 'Add dark mode toggle', NULL, 'NORMAL', 'FRONTEND', 'NORMAL', FALSE, '2026-09-01', '2026-09-07', '2026-09-07', '2026-09-01 08:00:00.000000', '2026-09-01 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (958, 119, 15, 'JOINED', '2026-09-01 08:00:00.000000'),
       (959, 119, 17, 'JOINED', '2026-09-01 08:00:00.000000'),
       (960, 119, 19, 'JOINED', '2026-09-01 08:00:00.000000'),
       (961, 119, 21, 'JOINED', '2026-09-01 08:00:00.000000'),
       (962, 119, 45, 'JOINED', '2026-09-01 08:00:00.000000'),
       (963, 119, 47, 'JOINED', '2026-09-01 08:00:00.000000'),
       (964, 119, 49, 'JOINED', '2026-09-01 08:00:00.000000'),
       (965, 119, 51, 'JOINED', '2026-09-01 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 958, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-09-07 00:48:00.000000', '2026-09-07 00:48:00.000000', '2026-09-07 08:00:00.000000'),
       (DEFAULT, 959, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-09-07 00:48:00.000000', '2026-09-07 00:48:00.000000', '2026-09-07 08:00:00.000000'),
       (DEFAULT, 960, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-09-07 00:48:00.000000', '2026-09-07 00:48:00.000000', '2026-09-07 08:00:00.000000'),
       (DEFAULT, 961, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-09-07 00:48:00.000000', '2026-09-07 00:48:00.000000', '2026-09-07 08:00:00.000000'),
       (DEFAULT, 962, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-09-07 00:48:00.000000', '2026-09-07 00:48:00.000000', '2026-09-07 08:00:00.000000'),
       (DEFAULT, 963, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-09-07 00:48:00.000000', '2026-09-07 00:48:00.000000', '2026-09-07 08:00:00.000000'),
       (DEFAULT, 964, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-09-07 00:48:00.000000', '2026-09-07 00:48:00.000000', '2026-09-07 08:00:00.000000'),
       (DEFAULT, 965, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-09-07 00:48:00.000000', '2026-09-07 00:48:00.000000', '2026-09-07 08:00:00.000000');

-- 2026-09-07
-- 2026-09-12
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (120, 1, 121, NULL, 'Optimize mobile UI', 'Optimize mobile UI', NULL, 'LIGHT', 'FRONTEND', 'NORMAL', FALSE, '2026-09-07', '2026-09-12', '2026-09-12', '2026-09-07 08:00:00.000000', '2026-09-07 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (966, 120, 23, 'JOINED', '2026-09-07 08:00:00.000000'),
       (967, 120, 25, 'JOINED', '2026-09-07 08:00:00.000000'),
       (968, 120, 27, 'JOINED', '2026-09-07 08:00:00.000000'),
       (969, 120, 53, 'JOINED', '2026-09-07 08:00:00.000000'),
       (970, 120, 55, 'JOINED', '2026-09-07 08:00:00.000000'),
       (971, 120, 57, 'JOINED', '2026-09-07 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 966, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-09-12 02:00:00.000000', '2026-09-12 02:00:00.000000', '2026-09-12 08:00:00.000000'),
       (DEFAULT, 967, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-09-12 02:00:00.000000', '2026-09-12 02:00:00.000000', '2026-09-12 08:00:00.000000'),
       (DEFAULT, 968, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-09-12 02:00:00.000000', '2026-09-12 02:00:00.000000', '2026-09-12 08:00:00.000000'),
       (DEFAULT, 969, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-09-12 02:00:00.000000', '2026-09-12 02:00:00.000000', '2026-09-12 08:00:00.000000'),
       (DEFAULT, 970, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-09-12 02:00:00.000000', '2026-09-12 02:00:00.000000', '2026-09-12 08:00:00.000000'),
       (DEFAULT, 971, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-09-12 02:00:00.000000', '2026-09-12 02:00:00.000000', '2026-09-12 08:00:00.000000');

-- 2026-09-12
-- 2026-09-16
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (121, 1, 121, NULL, 'Prepare production config', 'Prepare production config', NULL, 'HARD', 'BACKEND', 'NORMAL', FALSE, '2026-09-12', '2026-09-16', '2026-09-16', '2026-09-12 08:00:00.000000', '2026-09-12 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (972, 121, 2, 'JOINED', '2026-09-12 08:00:00.000000'),
       (973, 121, 4, 'JOINED', '2026-09-12 08:00:00.000000'),
       (974, 121, 6, 'JOINED', '2026-09-12 08:00:00.000000'),
       (975, 121, 32, 'JOINED', '2026-09-12 08:00:00.000000'),
       (976, 121, 34, 'JOINED', '2026-09-12 08:00:00.000000'),
       (977, 121, 36, 'JOINED', '2026-09-12 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 972, 'Employee 2 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-09-16 08:00:00.000000', '2026-09-16 08:00:00.000000', '2026-09-16 08:00:00.000000'),
       (DEFAULT, 973, 'Employee 4 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-09-16 08:00:00.000000', '2026-09-16 08:00:00.000000', '2026-09-16 08:00:00.000000'),
       (DEFAULT, 974, 'Employee 6 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-09-16 08:00:00.000000', '2026-09-16 08:00:00.000000', '2026-09-16 08:00:00.000000'),
       (DEFAULT, 975, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-09-16 08:00:00.000000', '2026-09-16 08:00:00.000000', '2026-09-16 08:00:00.000000'),
       (DEFAULT, 976, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-09-16 08:00:00.000000', '2026-09-16 08:00:00.000000', '2026-09-16 08:00:00.000000'),
       (DEFAULT, 977, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-09-16 08:00:00.000000', '2026-09-16 08:00:00.000000', '2026-09-16 08:00:00.000000');

-- 2026-09-16
-- 2026-09-23
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (122, 1, 121, NULL, 'Dockerize backend service', 'Dockerize backend service', NULL, 'ADVANCED', 'BACKEND', 'NORMAL', FALSE, '2026-09-16', '2026-09-23', '2026-09-23', '2026-09-16 08:00:00.000000', '2026-09-16 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (978, 122, 8, 'JOINED', '2026-09-16 08:00:00.000000'),
       (979, 122, 10, 'JOINED', '2026-09-16 08:00:00.000000'),
       (980, 122, 12, 'JOINED', '2026-09-16 08:00:00.000000'),
       (981, 122, 14, 'JOINED', '2026-09-16 08:00:00.000000'),
       (982, 122, 38, 'JOINED', '2026-09-16 08:00:00.000000'),
       (983, 122, 40, 'JOINED', '2026-09-16 08:00:00.000000'),
       (984, 122, 42, 'JOINED', '2026-09-16 08:00:00.000000'),
       (985, 122, 44, 'JOINED', '2026-09-16 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 978, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-09-23 08:00:00.000000', '2026-09-23 08:00:00.000000', '2026-09-23 08:00:00.000000'),
       (DEFAULT, 979, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-09-23 08:00:00.000000', '2026-09-23 08:00:00.000000', '2026-09-23 08:00:00.000000'),
       (DEFAULT, 980, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-09-23 08:00:00.000000', '2026-09-23 08:00:00.000000', '2026-09-23 08:00:00.000000'),
       (DEFAULT, 981, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-09-23 08:00:00.000000', '2026-09-23 08:00:00.000000', '2026-09-23 08:00:00.000000'),
       (DEFAULT, 982, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-09-23 08:00:00.000000', '2026-09-23 08:00:00.000000', '2026-09-23 08:00:00.000000'),
       (DEFAULT, 983, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-09-23 08:00:00.000000', '2026-09-23 08:00:00.000000', '2026-09-23 08:00:00.000000'),
       (DEFAULT, 984, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-09-23 08:00:00.000000', '2026-09-23 08:00:00.000000', '2026-09-23 08:00:00.000000'),
       (DEFAULT, 985, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-09-23 08:00:00.000000', '2026-09-23 08:00:00.000000', '2026-09-23 08:00:00.000000');

-- 2026-09-23
-- 2026-09-29
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (123, 1, 121, NULL, 'Write deployment script', 'Write deployment script', NULL, 'NORMAL', 'BACKEND', 'NORMAL', FALSE, '2026-09-23', '2026-09-29', '2026-09-29', '2026-09-23 08:00:00.000000', '2026-09-23 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (986, 123, 16, 'JOINED', '2026-09-23 08:00:00.000000'),
       (987, 123, 18, 'JOINED', '2026-09-23 08:00:00.000000'),
       (988, 123, 20, 'JOINED', '2026-09-23 08:00:00.000000'),
       (989, 123, 46, 'JOINED', '2026-09-23 08:00:00.000000'),
       (990, 123, 48, 'JOINED', '2026-09-23 08:00:00.000000'),
       (991, 123, 50, 'JOINED', '2026-09-23 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 986, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-09-29 08:00:00.000000', '2026-09-29 08:00:00.000000', '2026-09-29 08:00:00.000000'),
       (DEFAULT, 987, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-09-29 08:00:00.000000', '2026-09-29 08:00:00.000000', '2026-09-29 08:00:00.000000'),
       (DEFAULT, 988, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-09-29 08:00:00.000000', '2026-09-29 08:00:00.000000', '2026-09-29 08:00:00.000000'),
       (DEFAULT, 989, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-09-29 08:00:00.000000', '2026-09-29 08:00:00.000000', '2026-09-29 08:00:00.000000'),
       (DEFAULT, 990, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-09-29 08:00:00.000000', '2026-09-29 08:00:00.000000', '2026-09-29 08:00:00.000000'),
       (DEFAULT, 991, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-09-29 08:00:00.000000', '2026-09-29 08:00:00.000000', '2026-09-29 08:00:00.000000');

-- 2026-09-29
-- 2026-10-04
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (124, 1, 121, NULL, 'Refactor service rest layers', 'Refactor service rest layers', NULL, 'LIGHT', 'BACKEND', 'NORMAL', FALSE, '2026-09-29', '2026-10-04', '2026-10-04', '2026-09-29 08:00:00.000000', '2026-09-29 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (992, 124, 22, 'JOINED', '2026-09-29 08:00:00.000000'),
       (993, 124, 24, 'JOINED', '2026-09-29 08:00:00.000000'),
       (994, 124, 26, 'JOINED', '2026-09-29 08:00:00.000000'),
       (995, 124, 28, 'JOINED', '2026-09-29 08:00:00.000000'),
       (996, 124, 52, 'JOINED', '2026-09-29 08:00:00.000000'),
       (997, 124, 54, 'JOINED', '2026-09-29 08:00:00.000000'),
       (998, 124, 56, 'JOINED', '2026-09-29 08:00:00.000000'),
       (999, 124, 58, 'JOINED', '2026-09-29 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 992, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-10-04 08:00:00.000000', '2026-10-04 08:00:00.000000', '2026-10-04 08:00:00.000000'),
       (DEFAULT, 993, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-10-04 08:00:00.000000', '2026-10-04 08:00:00.000000', '2026-10-04 08:00:00.000000'),
       (DEFAULT, 994, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-10-04 08:00:00.000000', '2026-10-04 08:00:00.000000', '2026-10-04 08:00:00.000000'),
       (DEFAULT, 995, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-10-04 08:00:00.000000', '2026-10-04 08:00:00.000000', '2026-10-04 08:00:00.000000'),
       (DEFAULT, 996, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-10-04 08:00:00.000000', '2026-10-04 08:00:00.000000', '2026-10-04 08:00:00.000000'),
       (DEFAULT, 997, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-10-04 08:00:00.000000', '2026-10-04 08:00:00.000000', '2026-10-04 08:00:00.000000'),
       (DEFAULT, 998, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-10-04 08:00:00.000000', '2026-10-04 08:00:00.000000', '2026-10-04 08:00:00.000000'),
       (DEFAULT, 999, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-10-04 08:00:00.000000', '2026-10-04 08:00:00.000000', '2026-10-04 08:00:00.000000');

-- 2026-10-04
-- 2026-10-08
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (125, 1, 121, NULL, 'Create shared icon set', 'Create shared icon set', NULL, 'HARD', 'FRONTEND', 'NORMAL', FALSE, '2026-10-04', '2026-10-08', '2026-10-08', '2026-10-04 08:00:00.000000', '2026-10-04 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (1000, 125, 1, 'JOINED', '2026-10-04 08:00:00.000000'),
       (1001, 125, 3, 'JOINED', '2026-10-04 08:00:00.000000'),
       (1002, 125, 5, 'JOINED', '2026-10-04 08:00:00.000000'),
       (1003, 125, 7, 'JOINED', '2026-10-04 08:00:00.000000'),
       (1004, 125, 31, 'JOINED', '2026-10-04 08:00:00.000000'),
       (1005, 125, 33, 'JOINED', '2026-10-04 08:00:00.000000'),
       (1006, 125, 35, 'JOINED', '2026-10-04 08:00:00.000000'),
       (1007, 125, 37, 'JOINED', '2026-10-04 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 1000, 'Employee 1 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-10-08 08:00:00.000000', '2026-10-08 08:00:00.000000', '2026-10-08 08:00:00.000000'),
       (DEFAULT, 1001, 'Employee 3 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-10-08 08:00:00.000000', '2026-10-08 08:00:00.000000', '2026-10-08 08:00:00.000000'),
       (DEFAULT, 1002, 'Employee 5 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-10-08 08:00:00.000000', '2026-10-08 08:00:00.000000', '2026-10-08 08:00:00.000000'),
       (DEFAULT, 1003, 'Employee 7 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-10-08 08:00:00.000000', '2026-10-08 08:00:00.000000', '2026-10-08 08:00:00.000000'),
       (DEFAULT, 1004, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-10-08 08:00:00.000000', '2026-10-08 08:00:00.000000', '2026-10-08 08:00:00.000000'),
       (DEFAULT, 1005, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-10-08 08:00:00.000000', '2026-10-08 08:00:00.000000', '2026-10-08 08:00:00.000000'),
       (DEFAULT, 1006, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-10-08 08:00:00.000000', '2026-10-08 08:00:00.000000', '2026-10-08 08:00:00.000000'),
       (DEFAULT, 1007, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-10-08 08:00:00.000000', '2026-10-08 08:00:00.000000', '2026-10-08 08:00:00.000000');

-- 2026-10-08
-- 2026-10-15
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (126, 1, 121, NULL, 'Build color theme', 'Build color theme', NULL, 'ADVANCED', 'FRONTEND', 'NORMAL', FALSE, '2026-10-08', '2026-10-15', '2026-10-15', '2026-10-08 08:00:00.000000', '2026-10-08 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (1008, 126, 9, 'JOINED', '2026-10-08 08:00:00.000000'),
       (1009, 126, 11, 'JOINED', '2026-10-08 08:00:00.000000'),
       (1010, 126, 13, 'JOINED', '2026-10-08 08:00:00.000000'),
       (1011, 126, 39, 'JOINED', '2026-10-08 08:00:00.000000'),
       (1012, 126, 41, 'JOINED', '2026-10-08 08:00:00.000000'),
       (1013, 126, 43, 'JOINED', '2026-10-08 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 1008, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-10-15 08:00:00.000000', '2026-10-15 08:00:00.000000', '2026-10-15 08:00:00.000000'),
       (DEFAULT, 1009, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-10-15 08:00:00.000000', '2026-10-15 08:00:00.000000', '2026-10-15 08:00:00.000000'),
       (DEFAULT, 1010, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-10-15 08:00:00.000000', '2026-10-15 08:00:00.000000', '2026-10-15 08:00:00.000000'),
       (DEFAULT, 1011, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-10-15 08:00:00.000000', '2026-10-15 08:00:00.000000', '2026-10-15 08:00:00.000000'),
       (DEFAULT, 1012, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-10-15 08:00:00.000000', '2026-10-15 08:00:00.000000', '2026-10-15 08:00:00.000000'),
       (DEFAULT, 1013, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-10-15 08:00:00.000000', '2026-10-15 08:00:00.000000', '2026-10-15 08:00:00.000000');

-- 2026-10-15
-- 2026-10-21
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (127, 1, 121, NULL, 'Define typography scale', 'Define typography scale', NULL, 'NORMAL', 'FRONTEND', 'NORMAL', FALSE, '2026-10-15', '2026-10-21', '2026-10-21', '2026-10-15 08:00:00.000000', '2026-10-15 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (1014, 127, 15, 'JOINED', '2026-10-15 08:00:00.000000'),
       (1015, 127, 17, 'JOINED', '2026-10-15 08:00:00.000000'),
       (1016, 127, 19, 'JOINED', '2026-10-15 08:00:00.000000'),
       (1017, 127, 21, 'JOINED', '2026-10-15 08:00:00.000000'),
       (1018, 127, 45, 'JOINED', '2026-10-15 08:00:00.000000'),
       (1019, 127, 47, 'JOINED', '2026-10-15 08:00:00.000000'),
       (1020, 127, 49, 'JOINED', '2026-10-15 08:00:00.000000'),
       (1021, 127, 51, 'JOINED', '2026-10-15 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 1014, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-10-21 08:00:00.000000', '2026-10-21 08:00:00.000000', '2026-10-21 08:00:00.000000'),
       (DEFAULT, 1015, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-10-21 08:00:00.000000', '2026-10-21 08:00:00.000000', '2026-10-21 08:00:00.000000'),
       (DEFAULT, 1016, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-10-21 08:00:00.000000', '2026-10-21 08:00:00.000000', '2026-10-21 08:00:00.000000'),
       (DEFAULT, 1017, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-10-21 08:00:00.000000', '2026-10-21 08:00:00.000000', '2026-10-21 08:00:00.000000'),
       (DEFAULT, 1018, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-10-21 08:00:00.000000', '2026-10-21 08:00:00.000000', '2026-10-21 08:00:00.000000'),
       (DEFAULT, 1019, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-10-21 08:00:00.000000', '2026-10-21 08:00:00.000000', '2026-10-21 08:00:00.000000'),
       (DEFAULT, 1020, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-10-21 08:00:00.000000', '2026-10-21 08:00:00.000000', '2026-10-21 08:00:00.000000'),
       (DEFAULT, 1021, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-10-21 08:00:00.000000', '2026-10-21 08:00:00.000000', '2026-10-21 08:00:00.000000');

-- 2026-10-21
-- 2026-10-26
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (128, 1, 121, NULL, 'Add UI tests with Cypress', 'Add UI tests with Cypress', NULL, 'LIGHT', 'FRONTEND', 'NORMAL', FALSE, '2026-10-21', '2026-10-26', '2026-10-26', '2026-10-21 08:00:00.000000', '2026-10-21 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time)
VALUES (1022, 128, 23, 'JOINED', '2026-10-21 08:00:00.000000'),
       (1023, 128, 25, 'JOINED', '2026-10-21 08:00:00.000000'),
       (1024, 128, 27, 'JOINED', '2026-10-21 08:00:00.000000'),
       (1025, 128, 53, 'JOINED', '2026-10-21 08:00:00.000000'),
       (1026, 128, 55, 'JOINED', '2026-10-21 08:00:00.000000'),
       (1027, 128, 57, 'JOINED', '2026-10-21 08:00:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 1022, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-10-26 08:00:00.000000', '2026-10-26 08:00:00.000000', '2026-10-26 08:00:00.000000'),
       (DEFAULT, 1023, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-10-26 08:00:00.000000', '2026-10-26 08:00:00.000000', '2026-10-26 08:00:00.000000'),
       (DEFAULT, 1024, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-10-26 08:00:00.000000', '2026-10-26 08:00:00.000000', '2026-10-26 08:00:00.000000'),
       (DEFAULT, 1025, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-10-26 08:00:00.000000', '2026-10-26 08:00:00.000000', '2026-10-26 08:00:00.000000'),
       (DEFAULT, 1026, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-10-26 08:00:00.000000', '2026-10-26 08:00:00.000000', '2026-10-26 08:00:00.000000'),
       (DEFAULT, 1027, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-10-26 08:00:00.000000', '2026-10-26 08:00:00.000000', '2026-10-26 08:00:00.000000');

ALTER TABLE project AUTO_INCREMENT = 2;
ALTER TABLE project_role AUTO_INCREMENT = 3;
ALTER TABLE `phase` AUTO_INCREMENT = 2;
ALTER TABLE collection AUTO_INCREMENT = 2;
ALTER TABLE task AUTO_INCREMENT = 129;
ALTER TABLE task_for_users AUTO_INCREMENT = 1028;
ALTER TABLE report AUTO_INCREMENT = 1028;

COMMIT;
