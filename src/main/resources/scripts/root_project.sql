
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

-- 2024-01-01 08:00:00.000000
-- 2024-01-04
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1, 1, 121, NULL, 'Init backend project', 'Init backend project', NULL, 'HARD', 'BACKEND', 'NORMAL', FALSE, '2024-01-01', '2024-01-04', '2024-01-04', '2024-01-01 08:00:00.000000', '2024-01-01 08:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (1, 1, 2, 'JOINED', '2024-01-01 08:00:00.000000', '2024-01-03T01:42:44'),
       (2, 1, 4, 'JOINED', '2024-01-01 08:00:00.000000', '2024-01-03T02:46:05'),
       (3, 1, 6, 'JOINED', '2024-01-01 08:00:00.000000', '2024-01-03T01:21:36'),
       (4, 1, 30, 'JOINED', '2024-01-01 08:00:00.000000', '2024-01-02T05:53:09'),
       (5, 1, 32, 'JOINED', '2024-01-01 08:00:00.000000', '2024-01-02T16:41:32'),
       (6, 1, 34, 'JOINED', '2024-01-01 08:00:00.000000', '2024-01-02T15:17:03'),
       (7, 1, 36, 'JOINED', '2024-01-01 08:00:00.000000', '2024-01-02T22:27:22'),
       (8, 1, 60, 'JOINED', '2024-01-01 08:00:00.000000', '2024-01-02T11:50:20'),
       (9, 1, 62, 'JOINED', '2024-01-01 08:00:00.000000', '2023-12-31T23:16:30'),
       (10, 1, 64, 'JOINED', '2024-01-01 08:00:00.000000', '2023-12-30T18:36'),
       (11, 1, 66, 'JOINED', '2024-01-01 08:00:00.000000', '2023-12-30T12:24:49'),
       (12, 1, 90, 'JOINED', '2024-01-01 08:00:00.000000', '2023-12-30T22:49:27'),
       (13, 1, 92, 'JOINED', '2024-01-01 08:00:00.000000', '2023-12-31T20:05:53'),
       (14, 1, 94, 'JOINED', '2024-01-01 08:00:00.000000', '2023-12-31T13:59:43'),
       (15, 1, 96, 'JOINED', '2024-01-01 08:00:00.000000', '2024-01-01T01:16:53'),
       (16, 1, 120, 'JOINED', '2024-01-01 08:00:00.000000', '2023-12-31T13:34:38');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 1, 'Employee 2 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-03 04:00:00.000000', '2024-01-03 04:00:00.000000', '2024-01-03 04:20:00.000000'),
       (DEFAULT, 2, 'Employee 4 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-03 04:00:00.000000', '2024-01-03 04:00:00.000000', '2024-01-03 04:20:00.000000'),
       (DEFAULT, 3, 'Employee 6 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-03 04:00:00.000000', '2024-01-03 04:00:00.000000', '2024-01-03 04:20:00.000000'),
       (DEFAULT, 4, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-02 23:36:00.000000', '2024-01-02 23:36:00.000000', '2024-01-02 23:56:00.000000'),
       (DEFAULT, 5, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-03 04:00:00.000000', '2024-01-03 04:00:00.000000', '2024-01-03 04:20:00.000000'),
       (DEFAULT, 6, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-03 04:00:00.000000', '2024-01-03 04:00:00.000000', '2024-01-03 04:20:00.000000'),
       (DEFAULT, 7, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-03 04:00:00.000000', '2024-01-03 04:00:00.000000', '2024-01-03 04:20:00.000000'),
       (DEFAULT, 8, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-02 23:36:00.000000', '2024-01-02 23:36:00.000000', '2024-01-02 23:56:00.000000'),
       (DEFAULT, 9, 'Employee 62 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-01 12:24:00.000000', '2024-01-01 12:24:00.000000', '2024-01-01 12:44:00.000000'),
       (DEFAULT, 10, 'Employee 64 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-01 12:24:00.000000', '2024-01-01 12:24:00.000000', '2024-01-01 12:44:00.000000'),
       (DEFAULT, 11, 'Employee 66 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-01 12:24:00.000000', '2024-01-01 12:24:00.000000', '2024-01-01 12:44:00.000000'),
       (DEFAULT, 12, 'Employee 90 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-01 08:00:00.000000', '2024-01-01 08:00:00.000000', '2024-01-01 08:20:00.000000'),
       (DEFAULT, 13, 'Employee 92 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-01 12:24:00.000000', '2024-01-01 12:24:00.000000', '2024-01-01 12:44:00.000000'),
       (DEFAULT, 14, 'Employee 94 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-01 12:24:00.000000', '2024-01-01 12:24:00.000000', '2024-01-01 12:44:00.000000'),
       (DEFAULT, 15, 'Employee 96 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-01 12:24:00.000000', '2024-01-01 12:24:00.000000', '2024-01-01 12:44:00.000000'),
       (DEFAULT, 16, 'Employee 120 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-01 12:24:00.000000', '2024-01-01 12:24:00.000000', '2024-01-01 12:44:00.000000');

-- 2024-01-05 00:00:00.000000
-- 2024-01-12
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (2, 1, 121, NULL, 'Setup project modules', 'Setup project modules', NULL, 'HARD', 'BACKEND', 'LOW', FALSE, '2024-01-05', '2024-01-12', '2024-01-12', '2024-01-05 00:00:00.000000', '2024-01-05 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (17, 2, 2, 'JOINED', '2024-01-05 00:00:00.000000', '2023-12-23T05:57:08'),
       (18, 2, 4, 'JOINED', '2024-01-05 00:00:00.000000', '2023-12-27T09:47:32'),
       (19, 2, 6, 'JOINED', '2024-01-05 00:00:00.000000', '2023-12-22T18:25:56'),
       (20, 2, 30, 'JOINED', '2024-01-05 00:00:00.000000', '2023-12-21T14:47:03'),
       (21, 2, 32, 'JOINED', '2024-01-05 00:00:00.000000', '2023-12-25T03:38:53'),
       (22, 2, 34, 'JOINED', '2024-01-05 00:00:00.000000', '2023-12-24T05:22:34'),
       (23, 2, 36, 'JOINED', '2024-01-05 00:00:00.000000', '2023-12-23T21:30:15'),
       (24, 2, 60, 'JOINED', '2024-01-05 00:00:00.000000', '2023-12-23T10:22:05'),
       (25, 2, 62, 'JOINED', '2024-01-05 00:00:00.000000', '2023-12-20T17:05:17'),
       (26, 2, 64, 'JOINED', '2024-01-05 00:00:00.000000', '2023-12-21T00:46:05'),
       (27, 2, 66, 'JOINED', '2024-01-05 00:00:00.000000', '2023-12-22T06:20:10'),
       (28, 2, 92, 'JOINED', '2024-01-05 00:00:00.000000', '2023-12-23T09:24:29'),
       (29, 2, 94, 'JOINED', '2024-01-05 00:00:00.000000', '2023-12-31T00:00'),
       (30, 2, 96, 'JOINED', '2024-01-05 00:00:00.000000', '2024-01-04T00:00');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 17, 'Employee 2 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-05 00:00:00.000000', '2024-01-05 00:00:00.000000', '2024-01-05 00:20:00.000000'),
       (DEFAULT, 18, 'Employee 4 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-05 00:00:00.000000', '2024-01-05 00:00:00.000000', '2024-01-05 00:20:00.000000'),
       (DEFAULT, 19, 'Employee 6 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-05 00:00:00.000000', '2024-01-05 00:00:00.000000', '2024-01-05 00:20:00.000000'),
       (DEFAULT, 20, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-05 00:00:00.000000', '2024-01-05 00:00:00.000000', '2024-01-05 00:20:00.000000'),
       (DEFAULT, 21, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-05 00:00:00.000000', '2024-01-05 00:00:00.000000', '2024-01-05 00:20:00.000000'),
       (DEFAULT, 22, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-05 00:00:00.000000', '2024-01-05 00:00:00.000000', '2024-01-05 00:20:00.000000'),
       (DEFAULT, 23, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-05 00:00:00.000000', '2024-01-05 00:00:00.000000', '2024-01-05 00:20:00.000000'),
       (DEFAULT, 24, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-05 00:00:00.000000', '2024-01-05 00:00:00.000000', '2024-01-05 00:20:00.000000'),
       (DEFAULT, 25, 'Employee 62 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-05 00:00:00.000000', '2024-01-05 00:00:00.000000', '2024-01-05 00:20:00.000000'),
       (DEFAULT, 26, 'Employee 64 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-05 00:00:00.000000', '2024-01-05 00:00:00.000000', '2024-01-05 00:20:00.000000'),
       (DEFAULT, 27, 'Employee 66 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-05 00:00:00.000000', '2024-01-05 00:00:00.000000', '2024-01-05 00:20:00.000000'),
       (DEFAULT, 28, 'Employee 92 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-05 00:00:00.000000', '2024-01-05 00:00:00.000000', '2024-01-05 00:20:00.000000'),
       (DEFAULT, 29, 'Employee 94 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-05 00:00:00.000000', '2024-01-05 00:00:00.000000', '2024-01-05 00:20:00.000000'),
       (DEFAULT, 30, 'Employee 96 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-05 00:00:00.000000', '2024-01-05 00:00:00.000000', '2024-01-05 00:20:00.000000');

-- 2024-01-13 00:00:00.000000
-- 2024-01-19
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (3, 1, 121, NULL, 'Create user entity', 'Create user entity', NULL, 'ADVANCED', 'BACKEND', 'NORMAL', FALSE, '2024-01-13', '2024-01-19', '2024-01-19', '2024-01-13 00:00:00.000000', '2024-01-13 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (31, 3, 8, 'JOINED', '2024-01-13 00:00:00.000000', '2024-01-15T10:17:46'),
       (32, 3, 10, 'JOINED', '2024-01-13 00:00:00.000000', '2024-01-16T03:36'),
       (33, 3, 12, 'JOINED', '2024-01-13 00:00:00.000000', '2024-01-15T09:42:29'),
       (34, 3, 14, 'JOINED', '2024-01-13 00:00:00.000000', '2024-01-16T08:58:34'),
       (35, 3, 30, 'JOINED', '2024-01-13 00:00:00.000000', '2024-01-15T19:27:08'),
       (36, 3, 38, 'JOINED', '2024-01-13 00:00:00.000000', '2024-01-15T23:08:53'),
       (37, 3, 40, 'JOINED', '2024-01-13 00:00:00.000000', '2024-01-15T18:06:29'),
       (38, 3, 42, 'JOINED', '2024-01-13 00:00:00.000000', '2024-01-15T09:02:10'),
       (39, 3, 44, 'JOINED', '2024-01-13 00:00:00.000000', '2024-01-15T19:57:22'),
       (40, 3, 60, 'JOINED', '2024-01-13 00:00:00.000000', '2024-01-16T07:02:39'),
       (41, 3, 68, 'JOINED', '2024-01-13 00:00:00.000000', '2024-01-11T03:53:30'),
       (42, 3, 70, 'JOINED', '2024-01-13 00:00:00.000000', '2024-01-09T08:38:24'),
       (43, 3, 72, 'JOINED', '2024-01-13 00:00:00.000000', '2024-01-12T05:31:12'),
       (44, 3, 74, 'JOINED', '2024-01-13 00:00:00.000000', '2024-01-08T08:36:58'),
       (45, 3, 98, 'JOINED', '2024-01-13 00:00:00.000000', '2024-01-12T16:35:59'),
       (46, 3, 100, 'JOINED', '2024-01-13 00:00:00.000000', '2024-01-11T13:37:38'),
       (47, 3, 102, 'JOINED', '2024-01-13 00:00:00.000000', '2024-01-09T08:09:41'),
       (48, 3, 104, 'JOINED', '2024-01-13 00:00:00.000000', '2024-01-09T11:49:56');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 31, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-16 12:00:00.000000', '2024-01-16 12:00:00.000000', '2024-01-16 12:20:00.000000'),
       (DEFAULT, 32, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-16 12:00:00.000000', '2024-01-16 12:00:00.000000', '2024-01-16 12:20:00.000000'),
       (DEFAULT, 33, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-16 12:00:00.000000', '2024-01-16 12:00:00.000000', '2024-01-16 12:20:00.000000'),
       (DEFAULT, 34, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-16 12:00:00.000000', '2024-01-16 12:00:00.000000', '2024-01-16 12:20:00.000000'),
       (DEFAULT, 35, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-16 12:00:00.000000', '2024-01-16 12:00:00.000000', '2024-01-16 12:20:00.000000'),
       (DEFAULT, 36, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-16 12:00:00.000000', '2024-01-16 12:00:00.000000', '2024-01-16 12:20:00.000000'),
       (DEFAULT, 37, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-16 12:00:00.000000', '2024-01-16 12:00:00.000000', '2024-01-16 12:20:00.000000'),
       (DEFAULT, 38, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-16 12:00:00.000000', '2024-01-16 12:00:00.000000', '2024-01-16 12:20:00.000000'),
       (DEFAULT, 39, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-16 12:00:00.000000', '2024-01-16 12:00:00.000000', '2024-01-16 12:20:00.000000'),
       (DEFAULT, 40, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-16 12:00:00.000000', '2024-01-16 12:00:00.000000', '2024-01-16 12:20:00.000000'),
       (DEFAULT, 41, 'Employee 68 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-13 08:24:00.000000', '2024-01-13 08:24:00.000000', '2024-01-13 08:44:00.000000'),
       (DEFAULT, 42, 'Employee 70 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-13 00:00:00.000000', '2024-01-13 00:00:00.000000', '2024-01-13 00:20:00.000000'),
       (DEFAULT, 43, 'Employee 72 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-13 00:00:00.000000', '2024-01-13 00:00:00.000000', '2024-01-13 00:20:00.000000'),
       (DEFAULT, 44, 'Employee 74 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-13 00:00:00.000000', '2024-01-13 00:00:00.000000', '2024-01-13 00:20:00.000000'),
       (DEFAULT, 45, 'Employee 98 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-13 08:24:00.000000', '2024-01-13 08:24:00.000000', '2024-01-13 08:44:00.000000'),
       (DEFAULT, 46, 'Employee 100 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-13 08:24:00.000000', '2024-01-13 08:24:00.000000', '2024-01-13 08:44:00.000000'),
       (DEFAULT, 47, 'Employee 102 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-13 08:24:00.000000', '2024-01-13 08:24:00.000000', '2024-01-13 08:44:00.000000'),
       (DEFAULT, 48, 'Employee 104 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-13 08:24:00.000000', '2024-01-13 08:24:00.000000', '2024-01-13 08:44:00.000000');

-- 2024-01-20 00:00:00.000000
-- 2024-01-26
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (4, 1, 121, NULL, 'Create task entity', 'Create task entity', NULL, 'ADVANCED', 'BACKEND', 'LOW', FALSE, '2024-01-20', '2024-01-26', '2024-01-26', '2024-01-20 00:00:00.000000', '2024-01-20 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (49, 4, 8, 'JOINED', '2024-01-20 00:00:00.000000', '2024-01-06T17:08:10'),
       (50, 4, 10, 'JOINED', '2024-01-20 00:00:00.000000', '2024-01-11T02:28:20'),
       (51, 4, 12, 'JOINED', '2024-01-20 00:00:00.000000', '2024-01-12T04:20:39'),
       (52, 4, 14, 'JOINED', '2024-01-20 00:00:00.000000', '2024-01-11T13:53:46'),
       (53, 4, 30, 'JOINED', '2024-01-20 00:00:00.000000', '2024-01-12T09:33:08'),
       (54, 4, 38, 'JOINED', '2024-01-20 00:00:00.000000', '2024-01-07T09:56:10'),
       (55, 4, 40, 'JOINED', '2024-01-20 00:00:00.000000', '2024-01-07T01:42:15'),
       (56, 4, 42, 'JOINED', '2024-01-20 00:00:00.000000', '2024-01-11T19:16:20'),
       (57, 4, 44, 'JOINED', '2024-01-20 00:00:00.000000', '2024-01-12T11:24'),
       (58, 4, 60, 'JOINED', '2024-01-20 00:00:00.000000', '2024-01-10T08:49:56'),
       (59, 4, 68, 'JOINED', '2024-01-20 00:00:00.000000', '2024-01-08T02:44:10'),
       (60, 4, 70, 'JOINED', '2024-01-20 00:00:00.000000', '2024-01-10T02:16:48'),
       (61, 4, 72, 'JOINED', '2024-01-20 00:00:00.000000', '2024-01-07T08:55:41'),
       (62, 4, 74, 'JOINED', '2024-01-20 00:00:00.000000', '2024-01-09T03:46:05'),
       (63, 4, 98, 'JOINED', '2024-01-20 00:00:00.000000', '2024-01-06T12:36'),
       (64, 4, 100, 'JOINED', '2024-01-20 00:00:00.000000', '2024-01-11T03:28:48'),
       (65, 4, 102, 'JOINED', '2024-01-20 00:00:00.000000', '2024-01-12T14:15:22'),
       (66, 4, 104, 'JOINED', '2024-01-20 00:00:00.000000', '2024-01-11T10:52:20');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 49, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-20 00:00:00.000000', '2024-01-20 00:00:00.000000', '2024-01-20 00:20:00.000000'),
       (DEFAULT, 50, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-20 00:00:00.000000', '2024-01-20 00:00:00.000000', '2024-01-20 00:20:00.000000'),
       (DEFAULT, 51, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-20 00:00:00.000000', '2024-01-20 00:00:00.000000', '2024-01-20 00:20:00.000000'),
       (DEFAULT, 52, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-20 00:00:00.000000', '2024-01-20 00:00:00.000000', '2024-01-20 00:20:00.000000'),
       (DEFAULT, 53, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-20 00:00:00.000000', '2024-01-20 00:00:00.000000', '2024-01-20 00:20:00.000000'),
       (DEFAULT, 54, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-20 00:00:00.000000', '2024-01-20 00:00:00.000000', '2024-01-20 00:20:00.000000'),
       (DEFAULT, 55, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-20 00:00:00.000000', '2024-01-20 00:00:00.000000', '2024-01-20 00:20:00.000000'),
       (DEFAULT, 56, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-20 00:00:00.000000', '2024-01-20 00:00:00.000000', '2024-01-20 00:20:00.000000'),
       (DEFAULT, 57, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-20 00:00:00.000000', '2024-01-20 00:00:00.000000', '2024-01-20 00:20:00.000000'),
       (DEFAULT, 58, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-20 00:00:00.000000', '2024-01-20 00:00:00.000000', '2024-01-20 00:20:00.000000'),
       (DEFAULT, 59, 'Employee 68 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-20 00:00:00.000000', '2024-01-20 00:00:00.000000', '2024-01-20 00:20:00.000000'),
       (DEFAULT, 60, 'Employee 70 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-20 00:00:00.000000', '2024-01-20 00:00:00.000000', '2024-01-20 00:20:00.000000'),
       (DEFAULT, 61, 'Employee 72 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-20 00:00:00.000000', '2024-01-20 00:00:00.000000', '2024-01-20 00:20:00.000000'),
       (DEFAULT, 62, 'Employee 74 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-20 00:00:00.000000', '2024-01-20 00:00:00.000000', '2024-01-20 00:20:00.000000'),
       (DEFAULT, 63, 'Employee 98 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-20 00:00:00.000000', '2024-01-20 00:00:00.000000', '2024-01-20 00:20:00.000000'),
       (DEFAULT, 64, 'Employee 100 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-20 00:00:00.000000', '2024-01-20 00:00:00.000000', '2024-01-20 00:20:00.000000'),
       (DEFAULT, 65, 'Employee 102 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-20 00:00:00.000000', '2024-01-20 00:00:00.000000', '2024-01-20 00:20:00.000000'),
       (DEFAULT, 66, 'Employee 104 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-20 00:00:00.000000', '2024-01-20 00:00:00.000000', '2024-01-20 00:20:00.000000');

-- 2024-01-27 00:00:00.000000
-- 2024-02-01
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (5, 1, 121, NULL, 'Define task priority enum', 'Define task priority enum', NULL, 'NORMAL', 'BACKEND', 'NORMAL', FALSE, '2024-01-27', '2024-02-01', '2024-02-01', '2024-01-27 00:00:00.000000', '2024-01-27 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (67, 5, 16, 'JOINED', '2024-01-27 00:00:00.000000', '2024-01-29T21:07:12'),
       (68, 5, 18, 'JOINED', '2024-01-27 00:00:00.000000', '2024-01-29T18:18:44'),
       (69, 5, 20, 'JOINED', '2024-01-27 00:00:00.000000', '2024-01-29T12:50:24'),
       (70, 5, 30, 'JOINED', '2024-01-27 00:00:00.000000', '2024-01-26T18:57:36'),
       (71, 5, 46, 'JOINED', '2024-01-27 00:00:00.000000', '2024-01-29T14:42:44'),
       (72, 5, 48, 'JOINED', '2024-01-27 00:00:00.000000', '2024-01-29T11:32:39'),
       (73, 5, 50, 'JOINED', '2024-01-27 00:00:00.000000', '2024-01-29T15:34:34'),
       (74, 5, 60, 'JOINED', '2024-01-27 00:00:00.000000', '2024-01-27T15:41:46'),
       (75, 5, 76, 'JOINED', '2024-01-27 00:00:00.000000', '2024-01-25T06:14:24'),
       (76, 5, 78, 'JOINED', '2024-01-27 00:00:00.000000', '2024-01-24T14:49:56'),
       (77, 5, 80, 'JOINED', '2024-01-27 00:00:00.000000', '2024-01-25T05:48:29'),
       (78, 5, 106, 'JOINED', '2024-01-27 00:00:00.000000', '2024-01-26T10:32:36'),
       (79, 5, 108, 'JOINED', '2024-01-27 00:00:00.000000', '2024-01-26T21:12:49'),
       (80, 5, 110, 'JOINED', '2024-01-27 00:00:00.000000', '2024-01-24T08:36:41');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 67, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-30 00:00:00.000000', '2024-01-30 00:00:00.000000', '2024-01-30 00:20:00.000000'),
       (DEFAULT, 68, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-30 00:00:00.000000', '2024-01-30 00:00:00.000000', '2024-01-30 00:20:00.000000'),
       (DEFAULT, 69, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-30 00:00:00.000000', '2024-01-30 00:00:00.000000', '2024-01-30 00:20:00.000000'),
       (DEFAULT, 70, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-28 12:00:00.000000', '2024-01-28 12:00:00.000000', '2024-01-28 12:20:00.000000'),
       (DEFAULT, 71, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-30 00:00:00.000000', '2024-01-30 00:00:00.000000', '2024-01-30 00:20:00.000000'),
       (DEFAULT, 72, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-30 00:00:00.000000', '2024-01-30 00:00:00.000000', '2024-01-30 00:20:00.000000'),
       (DEFAULT, 73, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-30 00:00:00.000000', '2024-01-30 00:00:00.000000', '2024-01-30 00:20:00.000000'),
       (DEFAULT, 74, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-28 12:00:00.000000', '2024-01-28 12:00:00.000000', '2024-01-28 12:20:00.000000'),
       (DEFAULT, 75, 'Employee 76 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-27 00:00:00.000000', '2024-01-27 00:00:00.000000', '2024-01-27 00:20:00.000000'),
       (DEFAULT, 76, 'Employee 78 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-27 00:00:00.000000', '2024-01-27 00:00:00.000000', '2024-01-27 00:20:00.000000'),
       (DEFAULT, 77, 'Employee 80 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-27 00:00:00.000000', '2024-01-27 00:00:00.000000', '2024-01-27 00:20:00.000000'),
       (DEFAULT, 78, 'Employee 106 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-27 07:12:00.000000', '2024-01-27 07:12:00.000000', '2024-01-27 07:32:00.000000'),
       (DEFAULT, 79, 'Employee 108 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-27 07:12:00.000000', '2024-01-27 07:12:00.000000', '2024-01-27 07:32:00.000000'),
       (DEFAULT, 80, 'Employee 110 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-27 07:12:00.000000', '2024-01-27 07:12:00.000000', '2024-01-27 07:32:00.000000');

-- 2024-02-02 00:00:00.000000
-- 2024-02-07
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (6, 1, 121, NULL, 'Define task status enum', 'Define task status enum', NULL, 'NORMAL', 'BACKEND', 'LOW', FALSE, '2024-02-02', '2024-02-07', '2024-02-07', '2024-02-02 00:00:00.000000', '2024-02-02 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (81, 6, 16, 'JOINED', '2024-02-02 00:00:00.000000', '2024-01-26T12:20:10'),
       (82, 6, 18, 'JOINED', '2024-02-02 00:00:00.000000', '2024-01-26T20:32:39'),
       (83, 6, 20, 'JOINED', '2024-02-02 00:00:00.000000', '2024-01-23T13:37:56'),
       (84, 6, 46, 'JOINED', '2024-02-02 00:00:00.000000', '2024-01-26T12:20:10'),
       (85, 6, 48, 'JOINED', '2024-02-02 00:00:00.000000', '2024-01-24T23:11:03'),
       (86, 6, 50, 'JOINED', '2024-02-02 00:00:00.000000', '2024-01-22T16:45:08'),
       (87, 6, 76, 'JOINED', '2024-02-02 00:00:00.000000', '2024-01-26T21:41:46'),
       (88, 6, 78, 'JOINED', '2024-02-02 00:00:00.000000', '2024-01-22T19:55:12'),
       (89, 6, 80, 'JOINED', '2024-02-02 00:00:00.000000', '2024-01-21T14:24'),
       (90, 6, 106, 'JOINED', '2024-02-02 00:00:00.000000', '2024-01-26T09:36'),
       (91, 6, 108, 'JOINED', '2024-02-02 00:00:00.000000', '2024-01-26T11:11:03'),
       (92, 6, 110, 'JOINED', '2024-02-02 00:00:00.000000', '2024-01-24T03:53:17');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 81, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-02 00:00:00.000000', '2024-02-02 00:00:00.000000', '2024-02-02 00:20:00.000000'),
       (DEFAULT, 82, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-02 00:00:00.000000', '2024-02-02 00:00:00.000000', '2024-02-02 00:20:00.000000'),
       (DEFAULT, 83, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-02 00:00:00.000000', '2024-02-02 00:00:00.000000', '2024-02-02 00:20:00.000000'),
       (DEFAULT, 84, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-02 00:00:00.000000', '2024-02-02 00:00:00.000000', '2024-02-02 00:20:00.000000'),
       (DEFAULT, 85, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-02 00:00:00.000000', '2024-02-02 00:00:00.000000', '2024-02-02 00:20:00.000000'),
       (DEFAULT, 86, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-02 00:00:00.000000', '2024-02-02 00:00:00.000000', '2024-02-02 00:20:00.000000'),
       (DEFAULT, 87, 'Employee 76 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-02 00:00:00.000000', '2024-02-02 00:00:00.000000', '2024-02-02 00:20:00.000000'),
       (DEFAULT, 88, 'Employee 78 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-02 00:00:00.000000', '2024-02-02 00:00:00.000000', '2024-02-02 00:20:00.000000'),
       (DEFAULT, 89, 'Employee 80 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-02 00:00:00.000000', '2024-02-02 00:00:00.000000', '2024-02-02 00:20:00.000000'),
       (DEFAULT, 90, 'Employee 106 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-02 00:00:00.000000', '2024-02-02 00:00:00.000000', '2024-02-02 00:20:00.000000'),
       (DEFAULT, 91, 'Employee 108 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-02 00:00:00.000000', '2024-02-02 00:00:00.000000', '2024-02-02 00:20:00.000000'),
       (DEFAULT, 92, 'Employee 110 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-02 00:00:00.000000', '2024-02-02 00:00:00.000000', '2024-02-02 00:20:00.000000');

-- 2024-02-08 00:00:00.000000
-- 2024-02-12
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (7, 1, 121, NULL, 'Setup database config', 'Setup database config', NULL, 'LIGHT', 'BACKEND', 'NORMAL', FALSE, '2024-02-08', '2024-02-12', '2024-02-12', '2024-02-08 00:00:00.000000', '2024-02-08 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (93, 7, 22, 'JOINED', '2024-02-08 00:00:00.000000', '2024-02-09T16:55:12'),
       (94, 7, 24, 'JOINED', '2024-02-08 00:00:00.000000', '2024-02-10T06:50:24'),
       (95, 7, 26, 'JOINED', '2024-02-08 00:00:00.000000', '2024-02-09T21:03:36'),
       (96, 7, 28, 'JOINED', '2024-02-08 00:00:00.000000', '2024-02-10T09:03:36'),
       (97, 7, 30, 'JOINED', '2024-02-08 00:00:00.000000', '2024-02-08T05:34:27'),
       (98, 7, 52, 'JOINED', '2024-02-08 00:00:00.000000', '2024-02-10T10:26:24'),
       (99, 7, 54, 'JOINED', '2024-02-08 00:00:00.000000', '2024-02-10T07:15:36'),
       (100, 7, 56, 'JOINED', '2024-02-08 00:00:00.000000', '2024-02-10T09:36'),
       (101, 7, 58, 'JOINED', '2024-02-08 00:00:00.000000', '2024-02-09T11:56:24'),
       (102, 7, 60, 'JOINED', '2024-02-08 00:00:00.000000', '2024-02-08T07:50:10'),
       (103, 7, 82, 'JOINED', '2024-02-08 00:00:00.000000', '2024-02-05T21:28:48'),
       (104, 7, 84, 'JOINED', '2024-02-08 00:00:00.000000', '2024-02-06T23:38:24'),
       (105, 7, 86, 'JOINED', '2024-02-08 00:00:00.000000', '2024-02-07T12:43:12'),
       (106, 7, 88, 'JOINED', '2024-02-08 00:00:00.000000', '2024-02-06T20:02:24'),
       (107, 7, 112, 'JOINED', '2024-02-08 00:00:00.000000', '2024-02-06T08:51:22'),
       (108, 7, 114, 'JOINED', '2024-02-08 00:00:00.000000', '2024-02-07T01:16:20'),
       (109, 7, 116, 'JOINED', '2024-02-08 00:00:00.000000', '2024-02-07T08:54:36'),
       (110, 7, 118, 'JOINED', '2024-02-08 00:00:00.000000', '2024-02-06T15:55:27');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 93, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-10 12:00:00.000000', '2024-02-10 12:00:00.000000', '2024-02-10 12:20:00.000000'),
       (DEFAULT, 94, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-10 12:00:00.000000', '2024-02-10 12:00:00.000000', '2024-02-10 12:20:00.000000'),
       (DEFAULT, 95, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-10 12:00:00.000000', '2024-02-10 12:00:00.000000', '2024-02-10 12:20:00.000000'),
       (DEFAULT, 96, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-10 12:00:00.000000', '2024-02-10 12:00:00.000000', '2024-02-10 12:20:00.000000'),
       (DEFAULT, 97, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-09 18:00:00.000000', '2024-02-09 18:00:00.000000', '2024-02-09 18:20:00.000000'),
       (DEFAULT, 98, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-10 12:00:00.000000', '2024-02-10 12:00:00.000000', '2024-02-10 12:20:00.000000'),
       (DEFAULT, 99, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-10 12:00:00.000000', '2024-02-10 12:00:00.000000', '2024-02-10 12:20:00.000000'),
       (DEFAULT, 100, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-10 12:00:00.000000', '2024-02-10 12:00:00.000000', '2024-02-10 12:20:00.000000'),
       (DEFAULT, 101, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-10 12:00:00.000000', '2024-02-10 12:00:00.000000', '2024-02-10 12:20:00.000000'),
       (DEFAULT, 102, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-09 18:00:00.000000', '2024-02-09 18:00:00.000000', '2024-02-09 18:20:00.000000'),
       (DEFAULT, 103, 'Employee 82 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-08 00:00:00.000000', '2024-02-08 00:00:00.000000', '2024-02-08 00:20:00.000000'),
       (DEFAULT, 104, 'Employee 84 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-08 00:00:00.000000', '2024-02-08 00:00:00.000000', '2024-02-08 00:20:00.000000'),
       (DEFAULT, 105, 'Employee 86 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-08 00:00:00.000000', '2024-02-08 00:00:00.000000', '2024-02-08 00:20:00.000000'),
       (DEFAULT, 106, 'Employee 88 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-08 00:00:00.000000', '2024-02-08 00:00:00.000000', '2024-02-08 00:20:00.000000'),
       (DEFAULT, 107, 'Employee 112 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-08 06:00:00.000000', '2024-02-08 06:00:00.000000', '2024-02-08 06:20:00.000000'),
       (DEFAULT, 108, 'Employee 114 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-08 06:00:00.000000', '2024-02-08 06:00:00.000000', '2024-02-08 06:20:00.000000'),
       (DEFAULT, 109, 'Employee 116 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-08 06:00:00.000000', '2024-02-08 06:00:00.000000', '2024-02-08 06:20:00.000000'),
       (DEFAULT, 110, 'Employee 118 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-08 06:00:00.000000', '2024-02-08 06:00:00.000000', '2024-02-08 06:20:00.000000');

-- 2024-02-13 00:00:00.000000
-- 2024-02-17
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (8, 1, 121, NULL, 'Create JPA repositories', 'Create JPA repositories', NULL, 'LIGHT', 'BACKEND', 'LOW', FALSE, '2024-02-13', '2024-02-17', '2024-02-17', '2024-02-13 00:00:00.000000', '2024-02-13 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (111, 8, 22, 'JOINED', '2024-02-13 00:00:00.000000', '2024-02-07T00:00'),
       (112, 8, 24, 'JOINED', '2024-02-13 00:00:00.000000', '2024-02-04T00:07:12'),
       (113, 8, 26, 'JOINED', '2024-02-13 00:00:00.000000', '2024-02-06T17:38:24'),
       (114, 8, 28, 'JOINED', '2024-02-13 00:00:00.000000', '2024-02-03T19:48'),
       (115, 8, 30, 'JOINED', '2024-02-13 00:00:00.000000', '2024-02-04T01:55:12'),
       (116, 8, 52, 'JOINED', '2024-02-13 00:00:00.000000', '2024-02-04T14:02:24'),
       (117, 8, 54, 'JOINED', '2024-02-13 00:00:00.000000', '2024-02-04T23:02:24'),
       (118, 8, 56, 'JOINED', '2024-02-13 00:00:00.000000', '2024-02-06T10:19:12'),
       (119, 8, 58, 'JOINED', '2024-02-13 00:00:00.000000', '2024-02-12T03:14:24'),
       (120, 8, 60, 'JOINED', '2024-02-13 00:00:00.000000', '2024-02-03T14:02:24'),
       (121, 8, 82, 'JOINED', '2024-02-13 00:00:00.000000', '2024-02-03T07:04:48'),
       (122, 8, 84, 'JOINED', '2024-02-13 00:00:00.000000', '2024-02-07T02:24:01'),
       (123, 8, 86, 'JOINED', '2024-02-13 00:00:00.000000', '2024-02-05T09:07:12'),
       (124, 8, 88, 'JOINED', '2024-02-13 00:00:00.000000', '2024-02-05T23:38:24'),
       (125, 8, 90, 'JOINED', '2024-02-13 00:00:00.000000', '2024-02-06T02:24'),
       (126, 8, 112, 'JOINED', '2024-02-13 00:00:00.000000', '2024-02-05T11:02:24'),
       (127, 8, 114, 'JOINED', '2024-02-13 00:00:00.000000', '2024-02-04T09:00'),
       (128, 8, 116, 'JOINED', '2024-02-13 00:00:00.000000', '2024-02-06T06:07:12'),
       (129, 8, 118, 'JOINED', '2024-02-13 00:00:00.000000', '2024-02-07T18:50:24'),
       (130, 8, 120, 'JOINED', '2024-02-13 00:00:00.000000', '2024-02-04T22:26:24');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 111, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-13 00:00:00.000000', '2024-02-13 00:00:00.000000', '2024-02-13 00:20:00.000000'),
       (DEFAULT, 112, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-13 00:00:00.000000', '2024-02-13 00:00:00.000000', '2024-02-13 00:20:00.000000'),
       (DEFAULT, 113, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-13 00:00:00.000000', '2024-02-13 00:00:00.000000', '2024-02-13 00:20:00.000000'),
       (DEFAULT, 114, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-13 00:00:00.000000', '2024-02-13 00:00:00.000000', '2024-02-13 00:20:00.000000'),
       (DEFAULT, 115, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-13 00:00:00.000000', '2024-02-13 00:00:00.000000', '2024-02-13 00:20:00.000000'),
       (DEFAULT, 116, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-13 00:00:00.000000', '2024-02-13 00:00:00.000000', '2024-02-13 00:20:00.000000'),
       (DEFAULT, 117, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-13 00:00:00.000000', '2024-02-13 00:00:00.000000', '2024-02-13 00:20:00.000000'),
       (DEFAULT, 118, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-13 00:00:00.000000', '2024-02-13 00:00:00.000000', '2024-02-13 00:20:00.000000'),
       (DEFAULT, 119, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-13 00:00:00.000000', '2024-02-13 00:00:00.000000', '2024-02-13 00:20:00.000000'),
       (DEFAULT, 120, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-13 00:00:00.000000', '2024-02-13 00:00:00.000000', '2024-02-13 00:20:00.000000'),
       (DEFAULT, 121, 'Employee 82 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-13 00:00:00.000000', '2024-02-13 00:00:00.000000', '2024-02-13 00:20:00.000000'),
       (DEFAULT, 122, 'Employee 84 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-13 00:00:00.000000', '2024-02-13 00:00:00.000000', '2024-02-13 00:20:00.000000'),
       (DEFAULT, 123, 'Employee 86 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-13 00:00:00.000000', '2024-02-13 00:00:00.000000', '2024-02-13 00:20:00.000000'),
       (DEFAULT, 124, 'Employee 88 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-13 00:00:00.000000', '2024-02-13 00:00:00.000000', '2024-02-13 00:20:00.000000'),
       (DEFAULT, 125, 'Employee 90 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-13 00:00:00.000000', '2024-02-13 00:00:00.000000', '2024-02-13 00:20:00.000000'),
       (DEFAULT, 126, 'Employee 112 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-13 00:00:00.000000', '2024-02-13 00:00:00.000000', '2024-02-13 00:20:00.000000'),
       (DEFAULT, 127, 'Employee 114 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-13 00:00:00.000000', '2024-02-13 00:00:00.000000', '2024-02-13 00:20:00.000000'),
       (DEFAULT, 128, 'Employee 116 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-13 00:00:00.000000', '2024-02-13 00:00:00.000000', '2024-02-13 00:20:00.000000'),
       (DEFAULT, 129, 'Employee 118 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-13 00:00:00.000000', '2024-02-13 00:00:00.000000', '2024-02-13 00:20:00.000000'),
       (DEFAULT, 130, 'Employee 120 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-13 00:00:00.000000', '2024-02-13 00:00:00.000000', '2024-02-13 00:20:00.000000');

-- 2024-02-18 00:00:00.000000
-- 2024-02-21
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (9, 1, 121, NULL, 'Init frontend project', 'Init frontend project', NULL, 'HARD', 'FRONTEND', 'NORMAL', FALSE, '2024-02-18', '2024-02-21', '2024-02-21', '2024-02-18 00:00:00.000000', '2024-02-18 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (131, 9, 1, 'JOINED', '2024-02-18 00:00:00.000000', '2024-02-19T14:06:44'),
       (132, 9, 3, 'JOINED', '2024-02-18 00:00:00.000000', '2024-02-19T19:46:34'),
       (133, 9, 5, 'JOINED', '2024-02-18 00:00:00.000000', '2024-02-19T17:25:27'),
       (134, 9, 7, 'JOINED', '2024-02-18 00:00:00.000000', '2024-02-19T18:57:36'),
       (135, 9, 29, 'JOINED', '2024-02-18 00:00:00.000000', '2024-02-18T07:30:44'),
       (136, 9, 31, 'JOINED', '2024-02-18 00:00:00.000000', '2024-02-19T13:17:46'),
       (137, 9, 33, 'JOINED', '2024-02-18 00:00:00.000000', '2024-02-19T20:21:08'),
       (138, 9, 35, 'JOINED', '2024-02-18 00:00:00.000000', '2024-02-19T14:35:32'),
       (139, 9, 37, 'JOINED', '2024-02-18 00:00:00.000000', '2024-02-19T21:07:12'),
       (140, 9, 59, 'JOINED', '2024-02-18 00:00:00.000000', '2024-02-17T23:26:53'),
       (141, 9, 61, 'JOINED', '2024-02-18 00:00:00.000000', '2024-02-17T16:45:42'),
       (142, 9, 63, 'JOINED', '2024-02-18 00:00:00.000000', '2024-02-16T14:57:08'),
       (143, 9, 65, 'JOINED', '2024-02-18 00:00:00.000000', '2024-02-15T00:38:53'),
       (144, 9, 67, 'JOINED', '2024-02-18 00:00:00.000000', '2024-02-16T12:29:23'),
       (145, 9, 91, 'JOINED', '2024-02-18 00:00:00.000000', '2024-02-16T14:18:49'),
       (146, 9, 93, 'JOINED', '2024-02-18 00:00:00.000000', '2024-02-16T13:56:56'),
       (147, 9, 95, 'JOINED', '2024-02-18 00:00:00.000000', '2024-02-17T23:19:41'),
       (148, 9, 97, 'JOINED', '2024-02-18 00:00:00.000000', '2024-02-16T15:13:33');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 131, 'Employee 1 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-20 00:00:00.000000', '2024-02-20 00:00:00.000000', '2024-02-20 00:20:00.000000'),
       (DEFAULT, 132, 'Employee 3 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-20 00:00:00.000000', '2024-02-20 00:00:00.000000', '2024-02-20 00:20:00.000000'),
       (DEFAULT, 133, 'Employee 5 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-20 00:00:00.000000', '2024-02-20 00:00:00.000000', '2024-02-20 00:20:00.000000'),
       (DEFAULT, 134, 'Employee 7 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-20 00:00:00.000000', '2024-02-20 00:00:00.000000', '2024-02-20 00:20:00.000000'),
       (DEFAULT, 135, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-19 00:00:00.000000', '2024-02-19 00:00:00.000000', '2024-02-19 00:20:00.000000'),
       (DEFAULT, 136, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-20 00:00:00.000000', '2024-02-20 00:00:00.000000', '2024-02-20 00:20:00.000000'),
       (DEFAULT, 137, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-20 00:00:00.000000', '2024-02-20 00:00:00.000000', '2024-02-20 00:20:00.000000'),
       (DEFAULT, 138, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-20 00:00:00.000000', '2024-02-20 00:00:00.000000', '2024-02-20 00:20:00.000000'),
       (DEFAULT, 139, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-20 00:00:00.000000', '2024-02-20 00:00:00.000000', '2024-02-20 00:20:00.000000'),
       (DEFAULT, 140, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-19 00:00:00.000000', '2024-02-19 00:00:00.000000', '2024-02-19 00:20:00.000000'),
       (DEFAULT, 141, 'Employee 61 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-18 04:48:00.000000', '2024-02-18 04:48:00.000000', '2024-02-18 05:08:00.000000'),
       (DEFAULT, 142, 'Employee 63 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-18 04:48:00.000000', '2024-02-18 04:48:00.000000', '2024-02-18 05:08:00.000000'),
       (DEFAULT, 143, 'Employee 65 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-18 04:48:00.000000', '2024-02-18 04:48:00.000000', '2024-02-18 05:08:00.000000'),
       (DEFAULT, 144, 'Employee 67 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-18 04:48:00.000000', '2024-02-18 04:48:00.000000', '2024-02-18 05:08:00.000000'),
       (DEFAULT, 145, 'Employee 91 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-18 04:48:00.000000', '2024-02-18 04:48:00.000000', '2024-02-18 05:08:00.000000'),
       (DEFAULT, 146, 'Employee 93 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-18 04:48:00.000000', '2024-02-18 04:48:00.000000', '2024-02-18 05:08:00.000000'),
       (DEFAULT, 147, 'Employee 95 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-18 04:48:00.000000', '2024-02-18 04:48:00.000000', '2024-02-18 05:08:00.000000'),
       (DEFAULT, 148, 'Employee 97 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-18 04:48:00.000000', '2024-02-18 04:48:00.000000', '2024-02-18 05:08:00.000000');

-- 2024-02-22 00:00:00.000000
-- 2024-02-29
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (10, 1, 121, NULL, 'Create main layout', 'Create main layout', NULL, 'HARD', 'FRONTEND', 'LOW', FALSE, '2024-02-22', '2024-02-29', '2024-02-29', '2024-02-22 00:00:00.000000', '2024-02-22 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (149, 10, 1, 'JOINED', '2024-02-22 00:00:00.000000', '2024-02-11T14:47:03'),
       (150, 10, 3, 'JOINED', '2024-02-22 00:00:00.000000', '2024-02-08T09:47:32'),
       (151, 10, 5, 'JOINED', '2024-02-22 00:00:00.000000', '2024-02-11T18:25:56'),
       (152, 10, 7, 'JOINED', '2024-02-22 00:00:00.000000', '2024-02-13T11:54:15'),
       (153, 10, 31, 'JOINED', '2024-02-22 00:00:00.000000', '2024-02-09T06:43:12'),
       (154, 10, 33, 'JOINED', '2024-02-22 00:00:00.000000', '2024-02-09T00:57:36'),
       (155, 10, 35, 'JOINED', '2024-02-22 00:00:00.000000', '2024-02-12T12:28:49'),
       (156, 10, 37, 'JOINED', '2024-02-22 00:00:00.000000', '2024-02-10T02:52:48'),
       (157, 10, 61, 'JOINED', '2024-02-22 00:00:00.000000', '2024-02-10T03:27:22'),
       (158, 10, 63, 'JOINED', '2024-02-22 00:00:00.000000', '2024-02-07T06:08:39'),
       (159, 10, 65, 'JOINED', '2024-02-22 00:00:00.000000', '2024-02-09T04:24:58'),
       (160, 10, 67, 'JOINED', '2024-02-22 00:00:00.000000', '2024-02-08T19:46:34'),
       (161, 10, 91, 'JOINED', '2024-02-22 00:00:00.000000', '2024-02-13T19:00:29'),
       (162, 10, 93, 'JOINED', '2024-02-22 00:00:00.000000', '2024-02-12T03:50:24'),
       (163, 10, 95, 'JOINED', '2024-02-22 00:00:00.000000', '2024-02-13T12:51:51'),
       (164, 10, 97, 'JOINED', '2024-02-22 00:00:00.000000', '2024-02-19T10:10:34');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 149, 'Employee 1 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-22 00:00:00.000000', '2024-02-22 00:00:00.000000', '2024-02-22 00:20:00.000000'),
       (DEFAULT, 150, 'Employee 3 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-22 00:00:00.000000', '2024-02-22 00:00:00.000000', '2024-02-22 00:20:00.000000'),
       (DEFAULT, 151, 'Employee 5 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-22 00:00:00.000000', '2024-02-22 00:00:00.000000', '2024-02-22 00:20:00.000000'),
       (DEFAULT, 152, 'Employee 7 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-22 00:00:00.000000', '2024-02-22 00:00:00.000000', '2024-02-22 00:20:00.000000'),
       (DEFAULT, 153, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-22 00:00:00.000000', '2024-02-22 00:00:00.000000', '2024-02-22 00:20:00.000000'),
       (DEFAULT, 154, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-22 00:00:00.000000', '2024-02-22 00:00:00.000000', '2024-02-22 00:20:00.000000'),
       (DEFAULT, 155, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-22 00:00:00.000000', '2024-02-22 00:00:00.000000', '2024-02-22 00:20:00.000000'),
       (DEFAULT, 156, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-22 00:00:00.000000', '2024-02-22 00:00:00.000000', '2024-02-22 00:20:00.000000'),
       (DEFAULT, 157, 'Employee 61 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-22 00:00:00.000000', '2024-02-22 00:00:00.000000', '2024-02-22 00:20:00.000000'),
       (DEFAULT, 158, 'Employee 63 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-22 00:00:00.000000', '2024-02-22 00:00:00.000000', '2024-02-22 00:20:00.000000'),
       (DEFAULT, 159, 'Employee 65 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-22 00:00:00.000000', '2024-02-22 00:00:00.000000', '2024-02-22 00:20:00.000000'),
       (DEFAULT, 160, 'Employee 67 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-22 00:00:00.000000', '2024-02-22 00:00:00.000000', '2024-02-22 00:20:00.000000'),
       (DEFAULT, 161, 'Employee 91 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-22 00:00:00.000000', '2024-02-22 00:00:00.000000', '2024-02-22 00:20:00.000000'),
       (DEFAULT, 162, 'Employee 93 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-22 00:00:00.000000', '2024-02-22 00:00:00.000000', '2024-02-22 00:20:00.000000'),
       (DEFAULT, 163, 'Employee 95 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-22 00:00:00.000000', '2024-02-22 00:00:00.000000', '2024-02-22 00:20:00.000000'),
       (DEFAULT, 164, 'Employee 97 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-22 00:00:00.000000', '2024-02-22 00:00:00.000000', '2024-02-22 00:20:00.000000');

-- 2024-03-01 00:00:00.000000
-- 2024-03-07
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (11, 1, 121, NULL, 'Create login layout', 'Create login layout', NULL, 'ADVANCED', 'FRONTEND', 'NORMAL', FALSE, '2024-03-01', '2024-03-07', '2024-03-07', '2024-03-01 00:00:00.000000', '2024-03-01 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (165, 11, 9, 'JOINED', '2024-03-01 00:00:00.000000', '2024-03-03T15:55:27'),
       (166, 11, 11, 'JOINED', '2024-03-01 00:00:00.000000', '2024-03-04T08:33:22'),
       (167, 11, 13, 'JOINED', '2024-03-01 00:00:00.000000', '2024-03-03T13:19:12'),
       (168, 11, 29, 'JOINED', '2024-03-01 00:00:00.000000', '2024-03-03T02:10:24'),
       (169, 11, 39, 'JOINED', '2024-03-01 00:00:00.000000', '2024-03-03T13:09:08'),
       (170, 11, 41, 'JOINED', '2024-03-01 00:00:00.000000', '2024-03-03T11:33:22'),
       (171, 11, 43, 'JOINED', '2024-03-01 00:00:00.000000', '2024-03-03T20:52:48'),
       (172, 11, 59, 'JOINED', '2024-03-01 00:00:00.000000', '2024-03-01T21:27:13'),
       (173, 11, 69, 'JOINED', '2024-03-01 00:00:00.000000', '2024-02-27T11:46:20'),
       (174, 11, 71, 'JOINED', '2024-03-01 00:00:00.000000', '2024-02-27T12:01:27'),
       (175, 11, 73, 'JOINED', '2024-03-01 00:00:00.000000', '2024-02-28T20:26:53'),
       (176, 11, 99, 'JOINED', '2024-03-01 00:00:00.000000', '2024-02-29T05:16:05'),
       (177, 11, 101, 'JOINED', '2024-03-01 00:00:00.000000', '2024-02-27T11:17:36'),
       (178, 11, 103, 'JOINED', '2024-03-01 00:00:00.000000', '2024-02-29T09:05:55');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 165, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-04 12:00:00.000000', '2024-03-04 12:00:00.000000', '2024-03-04 12:20:00.000000'),
       (DEFAULT, 166, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-04 12:00:00.000000', '2024-03-04 12:00:00.000000', '2024-03-04 12:20:00.000000'),
       (DEFAULT, 167, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-04 12:00:00.000000', '2024-03-04 12:00:00.000000', '2024-03-04 12:20:00.000000'),
       (DEFAULT, 168, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-03 10:48:00.000000', '2024-03-03 10:48:00.000000', '2024-03-03 11:08:00.000000'),
       (DEFAULT, 169, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-04 12:00:00.000000', '2024-03-04 12:00:00.000000', '2024-03-04 12:20:00.000000'),
       (DEFAULT, 170, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-04 12:00:00.000000', '2024-03-04 12:00:00.000000', '2024-03-04 12:20:00.000000'),
       (DEFAULT, 171, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-04 12:00:00.000000', '2024-03-04 12:00:00.000000', '2024-03-04 12:20:00.000000'),
       (DEFAULT, 172, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-03 10:48:00.000000', '2024-03-03 10:48:00.000000', '2024-03-03 11:08:00.000000'),
       (DEFAULT, 173, 'Employee 69 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-01 08:24:00.000000', '2024-03-01 08:24:00.000000', '2024-03-01 08:44:00.000000'),
       (DEFAULT, 174, 'Employee 71 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-01 00:00:00.000000', '2024-03-01 00:00:00.000000', '2024-03-01 00:20:00.000000'),
       (DEFAULT, 175, 'Employee 73 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-01 00:00:00.000000', '2024-03-01 00:00:00.000000', '2024-03-01 00:20:00.000000'),
       (DEFAULT, 176, 'Employee 99 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-01 08:24:00.000000', '2024-03-01 08:24:00.000000', '2024-03-01 08:44:00.000000'),
       (DEFAULT, 177, 'Employee 101 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-01 08:24:00.000000', '2024-03-01 08:24:00.000000', '2024-03-01 08:44:00.000000'),
       (DEFAULT, 178, 'Employee 103 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-01 08:24:00.000000', '2024-03-01 08:24:00.000000', '2024-03-01 08:44:00.000000');

-- 2024-03-08 00:00:00.000000
-- 2024-03-14
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (12, 1, 121, NULL, 'Create register layout', 'Create register layout', NULL, 'ADVANCED', 'FRONTEND', 'LOW', FALSE, '2024-03-08', '2024-03-14', '2024-03-14', '2024-03-08 00:00:00.000000', '2024-03-08 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (179, 12, 9, 'JOINED', '2024-03-08 00:00:00.000000', '2024-02-28T14:54:15'),
       (180, 12, 11, 'JOINED', '2024-03-08 00:00:00.000000', '2024-02-29T11:44:10'),
       (181, 12, 13, 'JOINED', '2024-03-08 00:00:00.000000', '2024-02-27T03:37:27'),
       (182, 12, 29, 'JOINED', '2024-03-08 00:00:00.000000', '2024-02-26T21:54:44'),
       (183, 12, 39, 'JOINED', '2024-03-08 00:00:00.000000', '2024-02-29T03:50:24'),
       (184, 12, 41, 'JOINED', '2024-03-08 00:00:00.000000', '2024-02-28T09:21:36'),
       (185, 12, 43, 'JOINED', '2024-03-08 00:00:00.000000', '2024-02-28T23:48:29'),
       (186, 12, 59, 'JOINED', '2024-03-08 00:00:00.000000', '2024-02-26T01:35:03'),
       (187, 12, 69, 'JOINED', '2024-03-08 00:00:00.000000', '2024-02-28T23:08:10'),
       (188, 12, 71, 'JOINED', '2024-03-08 00:00:00.000000', '2024-02-23T21:50:24'),
       (189, 12, 73, 'JOINED', '2024-03-08 00:00:00.000000', '2024-02-26T13:10:34'),
       (190, 12, 89, 'JOINED', '2024-03-08 00:00:00.000000', '2024-02-24T00:31:41'),
       (191, 12, 99, 'JOINED', '2024-03-08 00:00:00.000000', '2024-02-28T02:48:29'),
       (192, 12, 101, 'JOINED', '2024-03-08 00:00:00.000000', '2024-02-27T11:11:03'),
       (193, 12, 103, 'JOINED', '2024-03-08 00:00:00.000000', '2024-02-24T10:56:39'),
       (194, 12, 119, 'JOINED', '2024-03-08 00:00:00.000000', '2024-02-25T08:16:48');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 179, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-08 00:00:00.000000', '2024-03-08 00:00:00.000000', '2024-03-08 00:20:00.000000'),
       (DEFAULT, 180, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-08 00:00:00.000000', '2024-03-08 00:00:00.000000', '2024-03-08 00:20:00.000000'),
       (DEFAULT, 181, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-08 00:00:00.000000', '2024-03-08 00:00:00.000000', '2024-03-08 00:20:00.000000'),
       (DEFAULT, 182, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-08 00:00:00.000000', '2024-03-08 00:00:00.000000', '2024-03-08 00:20:00.000000'),
       (DEFAULT, 183, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-08 00:00:00.000000', '2024-03-08 00:00:00.000000', '2024-03-08 00:20:00.000000'),
       (DEFAULT, 184, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-08 00:00:00.000000', '2024-03-08 00:00:00.000000', '2024-03-08 00:20:00.000000'),
       (DEFAULT, 185, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-08 00:00:00.000000', '2024-03-08 00:00:00.000000', '2024-03-08 00:20:00.000000'),
       (DEFAULT, 186, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-08 00:00:00.000000', '2024-03-08 00:00:00.000000', '2024-03-08 00:20:00.000000'),
       (DEFAULT, 187, 'Employee 69 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-08 00:00:00.000000', '2024-03-08 00:00:00.000000', '2024-03-08 00:20:00.000000'),
       (DEFAULT, 188, 'Employee 71 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-08 00:00:00.000000', '2024-03-08 00:00:00.000000', '2024-03-08 00:20:00.000000'),
       (DEFAULT, 189, 'Employee 73 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-08 00:00:00.000000', '2024-03-08 00:00:00.000000', '2024-03-08 00:20:00.000000'),
       (DEFAULT, 190, 'Employee 89 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-08 00:00:00.000000', '2024-03-08 00:00:00.000000', '2024-03-08 00:20:00.000000'),
       (DEFAULT, 191, 'Employee 99 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-08 00:00:00.000000', '2024-03-08 00:00:00.000000', '2024-03-08 00:20:00.000000'),
       (DEFAULT, 192, 'Employee 101 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-08 00:00:00.000000', '2024-03-08 00:00:00.000000', '2024-03-08 00:20:00.000000'),
       (DEFAULT, 193, 'Employee 103 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-08 00:00:00.000000', '2024-03-08 00:00:00.000000', '2024-03-08 00:20:00.000000'),
       (DEFAULT, 194, 'Employee 119 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-08 00:00:00.000000', '2024-03-08 00:00:00.000000', '2024-03-08 00:20:00.000000');

-- 2024-03-15 00:00:00.000000
-- 2024-03-20
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (13, 1, 121, NULL, 'Build app header', 'Build app header', NULL, 'NORMAL', 'FRONTEND', 'NORMAL', FALSE, '2024-03-15', '2024-03-20', '2024-03-20', '2024-03-15 00:00:00.000000', '2024-03-15 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (195, 13, 15, 'JOINED', '2024-03-15 00:00:00.000000', '2024-03-17T21:07:12'),
       (196, 13, 17, 'JOINED', '2024-03-15 00:00:00.000000', '2024-03-17T22:46:34'),
       (197, 13, 19, 'JOINED', '2024-03-15 00:00:00.000000', '2024-03-17T12:41:46'),
       (198, 13, 21, 'JOINED', '2024-03-15 00:00:00.000000', '2024-03-17T18:05:46'),
       (199, 13, 29, 'JOINED', '2024-03-15 00:00:00.000000', '2024-03-17T12:02:53'),
       (200, 13, 45, 'JOINED', '2024-03-15 00:00:00.000000', '2024-03-17T10:58:05'),
       (201, 13, 47, 'JOINED', '2024-03-15 00:00:00.000000', '2024-03-17T19:32:10'),
       (202, 13, 49, 'JOINED', '2024-03-15 00:00:00.000000', '2024-03-17T12:33:08'),
       (203, 13, 51, 'JOINED', '2024-03-15 00:00:00.000000', '2024-03-17T08:00:58'),
       (204, 13, 59, 'JOINED', '2024-03-15 00:00:00.000000', '2024-03-17T06:01:44'),
       (205, 13, 75, 'JOINED', '2024-03-15 00:00:00.000000', '2024-03-13T10:07:41'),
       (206, 13, 77, 'JOINED', '2024-03-15 00:00:00.000000', '2024-03-10T16:01:56'),
       (207, 13, 79, 'JOINED', '2024-03-15 00:00:00.000000', '2024-03-14T21:33:08'),
       (208, 13, 81, 'JOINED', '2024-03-15 00:00:00.000000', '2024-03-11T23:42:44'),
       (209, 13, 89, 'JOINED', '2024-03-15 00:00:00.000000', '2024-03-12T14:24'),
       (210, 13, 105, 'JOINED', '2024-03-15 00:00:00.000000', '2024-03-13T06:05:20'),
       (211, 13, 107, 'JOINED', '2024-03-15 00:00:00.000000', '2024-03-14T03:42:12'),
       (212, 13, 109, 'JOINED', '2024-03-15 00:00:00.000000', '2024-03-13T15:07:04'),
       (213, 13, 111, 'JOINED', '2024-03-15 00:00:00.000000', '2024-03-14T09:02:19'),
       (214, 13, 119, 'JOINED', '2024-03-15 00:00:00.000000', '2024-03-13T20:43:36');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 195, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-18 00:00:00.000000', '2024-03-18 00:00:00.000000', '2024-03-18 00:20:00.000000'),
       (DEFAULT, 196, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-18 00:00:00.000000', '2024-03-18 00:00:00.000000', '2024-03-18 00:20:00.000000'),
       (DEFAULT, 197, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-18 00:00:00.000000', '2024-03-18 00:00:00.000000', '2024-03-18 00:20:00.000000'),
       (DEFAULT, 198, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-18 00:00:00.000000', '2024-03-18 00:00:00.000000', '2024-03-18 00:20:00.000000'),
       (DEFAULT, 199, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-17 16:48:00.000000', '2024-03-17 16:48:00.000000', '2024-03-17 17:08:00.000000'),
       (DEFAULT, 200, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-18 00:00:00.000000', '2024-03-18 00:00:00.000000', '2024-03-18 00:20:00.000000'),
       (DEFAULT, 201, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-18 00:00:00.000000', '2024-03-18 00:00:00.000000', '2024-03-18 00:20:00.000000'),
       (DEFAULT, 202, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-18 00:00:00.000000', '2024-03-18 00:00:00.000000', '2024-03-18 00:20:00.000000'),
       (DEFAULT, 203, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-18 00:00:00.000000', '2024-03-18 00:00:00.000000', '2024-03-18 00:20:00.000000'),
       (DEFAULT, 204, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-17 16:48:00.000000', '2024-03-17 16:48:00.000000', '2024-03-17 17:08:00.000000'),
       (DEFAULT, 205, 'Employee 75 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-15 00:00:00.000000', '2024-03-15 00:00:00.000000', '2024-03-15 00:20:00.000000'),
       (DEFAULT, 206, 'Employee 77 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-15 00:00:00.000000', '2024-03-15 00:00:00.000000', '2024-03-15 00:20:00.000000'),
       (DEFAULT, 207, 'Employee 79 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-15 00:00:00.000000', '2024-03-15 00:00:00.000000', '2024-03-15 00:20:00.000000'),
       (DEFAULT, 208, 'Employee 81 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-15 00:00:00.000000', '2024-03-15 00:00:00.000000', '2024-03-15 00:20:00.000000'),
       (DEFAULT, 209, 'Employee 89 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-15 00:00:00.000000', '2024-03-15 00:00:00.000000', '2024-03-15 00:20:00.000000'),
       (DEFAULT, 210, 'Employee 105 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-15 07:12:00.000000', '2024-03-15 07:12:00.000000', '2024-03-15 07:32:00.000000'),
       (DEFAULT, 211, 'Employee 107 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-15 07:12:00.000000', '2024-03-15 07:12:00.000000', '2024-03-15 07:32:00.000000'),
       (DEFAULT, 212, 'Employee 109 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-15 07:12:00.000000', '2024-03-15 07:12:00.000000', '2024-03-15 07:32:00.000000'),
       (DEFAULT, 213, 'Employee 111 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-15 07:12:00.000000', '2024-03-15 07:12:00.000000', '2024-03-15 07:32:00.000000'),
       (DEFAULT, 214, 'Employee 119 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-15 07:12:00.000000', '2024-03-15 07:12:00.000000', '2024-03-15 07:32:00.000000');

-- 2024-03-21 00:00:00.000000
-- 2024-03-26
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (14, 1, 121, NULL, 'Build app footer', 'Build app footer', NULL, 'NORMAL', 'FRONTEND', 'LOW', FALSE, '2024-03-21', '2024-03-26', '2024-03-26', '2024-03-21 00:00:00.000000', '2024-03-21 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (215, 14, 15, 'JOINED', '2024-03-21 00:00:00.000000', '2024-03-11T05:42:44'),
       (216, 14, 17, 'JOINED', '2024-03-21 00:00:00.000000', '2024-03-11T13:29:17'),
       (217, 14, 19, 'JOINED', '2024-03-21 00:00:00.000000', '2024-03-10T22:56:39'),
       (218, 14, 21, 'JOINED', '2024-03-21 00:00:00.000000', '2024-03-14T01:32:10'),
       (219, 14, 29, 'JOINED', '2024-03-21 00:00:00.000000', '2024-03-13T13:00:29'),
       (220, 14, 45, 'JOINED', '2024-03-21 00:00:00.000000', '2024-03-10T07:23:32'),
       (221, 14, 47, 'JOINED', '2024-03-21 00:00:00.000000', '2024-03-14T13:29:17'),
       (222, 14, 49, 'JOINED', '2024-03-21 00:00:00.000000', '2024-03-11T04:59:32'),
       (223, 14, 51, 'JOINED', '2024-03-21 00:00:00.000000', '2024-03-10T17:02:24'),
       (224, 14, 59, 'JOINED', '2024-03-21 00:00:00.000000', '2024-03-11T10:01:56'),
       (225, 14, 75, 'JOINED', '2024-03-21 00:00:00.000000', '2024-03-14T17:13:56'),
       (226, 14, 77, 'JOINED', '2024-03-21 00:00:00.000000', '2024-03-09T11:48:29'),
       (227, 14, 79, 'JOINED', '2024-03-21 00:00:00.000000', '2024-03-11T03:41:46'),
       (228, 14, 81, 'JOINED', '2024-03-21 00:00:00.000000', '2024-03-10T12:34:34'),
       (229, 14, 105, 'JOINED', '2024-03-21 00:00:00.000000', '2024-03-10T07:58:05'),
       (230, 14, 107, 'JOINED', '2024-03-21 00:00:00.000000', '2024-03-13T00:54:44'),
       (231, 14, 109, 'JOINED', '2024-03-21 00:00:00.000000', '2024-03-10T16:45:08'),
       (232, 14, 111, 'JOINED', '2024-03-21 00:00:00.000000', '2024-03-13T01:20:39');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 215, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-21 00:00:00.000000', '2024-03-21 00:00:00.000000', '2024-03-21 00:20:00.000000'),
       (DEFAULT, 216, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-21 00:00:00.000000', '2024-03-21 00:00:00.000000', '2024-03-21 00:20:00.000000'),
       (DEFAULT, 217, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-21 00:00:00.000000', '2024-03-21 00:00:00.000000', '2024-03-21 00:20:00.000000'),
       (DEFAULT, 218, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-21 00:00:00.000000', '2024-03-21 00:00:00.000000', '2024-03-21 00:20:00.000000'),
       (DEFAULT, 219, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-21 00:00:00.000000', '2024-03-21 00:00:00.000000', '2024-03-21 00:20:00.000000'),
       (DEFAULT, 220, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-21 00:00:00.000000', '2024-03-21 00:00:00.000000', '2024-03-21 00:20:00.000000'),
       (DEFAULT, 221, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-21 00:00:00.000000', '2024-03-21 00:00:00.000000', '2024-03-21 00:20:00.000000'),
       (DEFAULT, 222, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-21 00:00:00.000000', '2024-03-21 00:00:00.000000', '2024-03-21 00:20:00.000000'),
       (DEFAULT, 223, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-21 00:00:00.000000', '2024-03-21 00:00:00.000000', '2024-03-21 00:20:00.000000'),
       (DEFAULT, 224, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-21 00:00:00.000000', '2024-03-21 00:00:00.000000', '2024-03-21 00:20:00.000000'),
       (DEFAULT, 225, 'Employee 75 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-21 00:00:00.000000', '2024-03-21 00:00:00.000000', '2024-03-21 00:20:00.000000'),
       (DEFAULT, 226, 'Employee 77 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-21 00:00:00.000000', '2024-03-21 00:00:00.000000', '2024-03-21 00:20:00.000000'),
       (DEFAULT, 227, 'Employee 79 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-21 00:00:00.000000', '2024-03-21 00:00:00.000000', '2024-03-21 00:20:00.000000'),
       (DEFAULT, 228, 'Employee 81 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-21 00:00:00.000000', '2024-03-21 00:00:00.000000', '2024-03-21 00:20:00.000000'),
       (DEFAULT, 229, 'Employee 105 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-21 00:00:00.000000', '2024-03-21 00:00:00.000000', '2024-03-21 00:20:00.000000'),
       (DEFAULT, 230, 'Employee 107 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-21 00:00:00.000000', '2024-03-21 00:00:00.000000', '2024-03-21 00:20:00.000000'),
       (DEFAULT, 231, 'Employee 109 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-21 00:00:00.000000', '2024-03-21 00:00:00.000000', '2024-03-21 00:20:00.000000'),
       (DEFAULT, 232, 'Employee 111 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-21 00:00:00.000000', '2024-03-21 00:00:00.000000', '2024-03-21 00:20:00.000000');

-- 2024-03-27 00:00:00.000000
-- 2024-03-31
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (15, 1, 121, NULL, 'Create navigation sidebar', 'Create navigation sidebar', NULL, 'LIGHT', 'FRONTEND', 'NORMAL', FALSE, '2024-03-27', '2024-03-31', '2024-03-31', '2024-03-27 00:00:00.000000', '2024-03-27 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (233, 15, 23, 'JOINED', '2024-03-27 00:00:00.000000', '2024-03-28T21:36'),
       (234, 15, 25, 'JOINED', '2024-03-27 00:00:00.000000', '2024-03-29T02:06'),
       (235, 15, 27, 'JOINED', '2024-03-27 00:00:00.000000', '2024-03-29T02:02:24'),
       (236, 15, 29, 'JOINED', '2024-03-27 00:00:00.000000', '2024-03-28T20:45:36'),
       (237, 15, 53, 'JOINED', '2024-03-27 00:00:00.000000', '2024-03-28T19:51:36'),
       (238, 15, 55, 'JOINED', '2024-03-27 00:00:00.000000', '2024-03-29T01:26:24'),
       (239, 15, 57, 'JOINED', '2024-03-27 00:00:00.000000', '2024-03-29T08:02:24'),
       (240, 15, 59, 'JOINED', '2024-03-27 00:00:00.000000', '2024-03-29T02:31:12'),
       (241, 15, 83, 'JOINED', '2024-03-27 00:00:00.000000', '2024-03-26T02:24'),
       (242, 15, 85, 'JOINED', '2024-03-27 00:00:00.000000', '2024-03-24T07:33:36'),
       (243, 15, 87, 'JOINED', '2024-03-27 00:00:00.000000', '2024-03-26T06:36'),
       (244, 15, 113, 'JOINED', '2024-03-27 00:00:00.000000', '2024-03-25T04:45:08'),
       (245, 15, 115, 'JOINED', '2024-03-27 00:00:00.000000', '2024-03-26T05:29:24'),
       (246, 15, 117, 'JOINED', '2024-03-27 00:00:00.000000', '2024-03-24T22:01:34');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 233, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-29 12:00:00.000000', '2024-03-29 12:00:00.000000', '2024-03-29 12:20:00.000000'),
       (DEFAULT, 234, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-29 12:00:00.000000', '2024-03-29 12:00:00.000000', '2024-03-29 12:20:00.000000'),
       (DEFAULT, 235, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-29 12:00:00.000000', '2024-03-29 12:00:00.000000', '2024-03-29 12:20:00.000000'),
       (DEFAULT, 236, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-29 12:00:00.000000', '2024-03-29 12:00:00.000000', '2024-03-29 12:20:00.000000'),
       (DEFAULT, 237, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-29 12:00:00.000000', '2024-03-29 12:00:00.000000', '2024-03-29 12:20:00.000000'),
       (DEFAULT, 238, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-29 12:00:00.000000', '2024-03-29 12:00:00.000000', '2024-03-29 12:20:00.000000'),
       (DEFAULT, 239, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-29 12:00:00.000000', '2024-03-29 12:00:00.000000', '2024-03-29 12:20:00.000000'),
       (DEFAULT, 240, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-29 12:00:00.000000', '2024-03-29 12:00:00.000000', '2024-03-29 12:20:00.000000'),
       (DEFAULT, 241, 'Employee 83 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-27 00:00:00.000000', '2024-03-27 00:00:00.000000', '2024-03-27 00:20:00.000000'),
       (DEFAULT, 242, 'Employee 85 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-27 00:00:00.000000', '2024-03-27 00:00:00.000000', '2024-03-27 00:20:00.000000'),
       (DEFAULT, 243, 'Employee 87 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-27 00:00:00.000000', '2024-03-27 00:00:00.000000', '2024-03-27 00:20:00.000000'),
       (DEFAULT, 244, 'Employee 113 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-27 06:00:00.000000', '2024-03-27 06:00:00.000000', '2024-03-27 06:20:00.000000'),
       (DEFAULT, 245, 'Employee 115 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-27 06:00:00.000000', '2024-03-27 06:00:00.000000', '2024-03-27 06:20:00.000000'),
       (DEFAULT, 246, 'Employee 117 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-27 06:00:00.000000', '2024-03-27 06:00:00.000000', '2024-03-27 06:20:00.000000');

-- 2024-04-01 00:00:00.000000
-- 2024-04-05
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (16, 1, 121, NULL, 'Create task form', 'Create task form', NULL, 'LIGHT', 'FRONTEND', 'LOW', FALSE, '2024-04-01', '2024-04-05', '2024-04-05', '2024-04-01 00:00:00.000000', '2024-04-01 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (247, 16, 23, 'JOINED', '2024-04-01 00:00:00.000000', '2024-03-25T00:43:12'),
       (248, 16, 25, 'JOINED', '2024-04-01 00:00:00.000000', '2024-03-26T11:16:49'),
       (249, 16, 27, 'JOINED', '2024-04-01 00:00:00.000000', '2024-03-30T12:14:24'),
       (250, 16, 29, 'JOINED', '2024-04-01 00:00:00.000000', '2024-03-25T22:33:36'),
       (251, 16, 53, 'JOINED', '2024-04-01 00:00:00.000000', '2024-03-26T14:09:36'),
       (252, 16, 55, 'JOINED', '2024-04-01 00:00:00.000000', '2024-03-23T07:04:48'),
       (253, 16, 57, 'JOINED', '2024-04-01 00:00:00.000000', '2024-03-26T15:14:25'),
       (254, 16, 59, 'JOINED', '2024-04-01 00:00:00.000000', '2024-03-24T00:57:36'),
       (255, 16, 83, 'JOINED', '2024-04-01 00:00:00.000000', '2024-03-28T22:12'),
       (256, 16, 85, 'JOINED', '2024-04-01 00:00:00.000000', '2024-03-25T21:43:12'),
       (257, 16, 87, 'JOINED', '2024-04-01 00:00:00.000000', '2024-03-26T04:40:48'),
       (258, 16, 113, 'JOINED', '2024-04-01 00:00:00.000000', '2024-03-24T06:14:24'),
       (259, 16, 115, 'JOINED', '2024-04-01 00:00:00.000000', '2024-03-26T06:00'),
       (260, 16, 117, 'JOINED', '2024-04-01 00:00:00.000000', '2024-03-23T18:07:12');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 247, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-01 00:00:00.000000', '2024-04-01 00:00:00.000000', '2024-04-01 00:20:00.000000'),
       (DEFAULT, 248, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-01 00:00:00.000000', '2024-04-01 00:00:00.000000', '2024-04-01 00:20:00.000000'),
       (DEFAULT, 249, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-01 00:00:00.000000', '2024-04-01 00:00:00.000000', '2024-04-01 00:20:00.000000'),
       (DEFAULT, 250, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-01 00:00:00.000000', '2024-04-01 00:00:00.000000', '2024-04-01 00:20:00.000000'),
       (DEFAULT, 251, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-01 00:00:00.000000', '2024-04-01 00:00:00.000000', '2024-04-01 00:20:00.000000'),
       (DEFAULT, 252, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-01 00:00:00.000000', '2024-04-01 00:00:00.000000', '2024-04-01 00:20:00.000000'),
       (DEFAULT, 253, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-01 00:00:00.000000', '2024-04-01 00:00:00.000000', '2024-04-01 00:20:00.000000'),
       (DEFAULT, 254, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-01 00:00:00.000000', '2024-04-01 00:00:00.000000', '2024-04-01 00:20:00.000000'),
       (DEFAULT, 255, 'Employee 83 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-01 00:00:00.000000', '2024-04-01 00:00:00.000000', '2024-04-01 00:20:00.000000'),
       (DEFAULT, 256, 'Employee 85 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-01 00:00:00.000000', '2024-04-01 00:00:00.000000', '2024-04-01 00:20:00.000000'),
       (DEFAULT, 257, 'Employee 87 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-01 00:00:00.000000', '2024-04-01 00:00:00.000000', '2024-04-01 00:20:00.000000'),
       (DEFAULT, 258, 'Employee 113 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-01 00:00:00.000000', '2024-04-01 00:00:00.000000', '2024-04-01 00:20:00.000000'),
       (DEFAULT, 259, 'Employee 115 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-01 00:00:00.000000', '2024-04-01 00:00:00.000000', '2024-04-01 00:20:00.000000'),
       (DEFAULT, 260, 'Employee 117 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-01 00:00:00.000000', '2024-04-01 00:00:00.000000', '2024-04-01 00:20:00.000000');

-- 2024-04-06 00:00:00.000000
-- 2024-04-09
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (17, 1, 121, NULL, 'Create user repository', 'Create user repository', NULL, 'HARD', 'BACKEND', 'NORMAL', FALSE, '2024-04-06', '2024-04-09', '2024-04-09', '2024-04-06 00:00:00.000000', '2024-04-06 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (261, 17, 2, 'JOINED', '2024-04-06 00:00:00.000000', '2024-04-07T07:12:52'),
       (262, 17, 4, 'JOINED', '2024-04-06 00:00:00.000000', '2024-04-07T15:08:04'),
       (263, 17, 6, 'JOINED', '2024-04-06 00:00:00.000000', '2024-04-07T13:04:31'),
       (264, 17, 30, 'JOINED', '2024-04-06 00:00:00.000000', '2024-04-07T02:07:53'),
       (265, 17, 32, 'JOINED', '2024-04-06 00:00:00.000000', '2024-04-07T04:40:48'),
       (266, 17, 34, 'JOINED', '2024-04-06 00:00:00.000000', '2024-04-07T10:48:18'),
       (267, 17, 36, 'JOINED', '2024-04-06 00:00:00.000000', '2024-04-07T03:56:27'),
       (268, 17, 60, 'JOINED', '2024-04-06 00:00:00.000000', '2024-04-07T02:35:32'),
       (269, 17, 62, 'JOINED', '2024-04-06 00:00:00.000000', '2024-04-05T05:39:51'),
       (270, 17, 64, 'JOINED', '2024-04-06 00:00:00.000000', '2024-04-03T08:44:10'),
       (271, 17, 66, 'JOINED', '2024-04-06 00:00:00.000000', '2024-04-04T23:31:12'),
       (272, 17, 92, 'JOINED', '2024-04-06 00:00:00.000000', '2024-04-04T17:22:34'),
       (273, 17, 94, 'JOINED', '2024-04-06 00:00:00.000000', '2024-04-03T15:38:53'),
       (274, 17, 96, 'JOINED', '2024-04-06 00:00:00.000000', '2024-04-04T04:48'),
       (275, 17, 120, 'JOINED', '2024-04-06 00:00:00.000000', '2024-04-05T09:41:46');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 261, 'Employee 2 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-07 19:12:00.000000', '2024-04-07 19:12:00.000000', '2024-04-07 19:32:00.000000'),
       (DEFAULT, 262, 'Employee 4 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-07 19:12:00.000000', '2024-04-07 19:12:00.000000', '2024-04-07 19:32:00.000000'),
       (DEFAULT, 263, 'Employee 6 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-07 19:12:00.000000', '2024-04-07 19:12:00.000000', '2024-04-07 19:32:00.000000'),
       (DEFAULT, 264, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-07 14:24:00.000000', '2024-04-07 14:24:00.000000', '2024-04-07 14:44:00.000000'),
       (DEFAULT, 265, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-07 19:12:00.000000', '2024-04-07 19:12:00.000000', '2024-04-07 19:32:00.000000'),
       (DEFAULT, 266, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-07 19:12:00.000000', '2024-04-07 19:12:00.000000', '2024-04-07 19:32:00.000000'),
       (DEFAULT, 267, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-07 19:12:00.000000', '2024-04-07 19:12:00.000000', '2024-04-07 19:32:00.000000'),
       (DEFAULT, 268, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-07 14:24:00.000000', '2024-04-07 14:24:00.000000', '2024-04-07 14:44:00.000000'),
       (DEFAULT, 269, 'Employee 62 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-06 00:00:00.000000', '2024-04-06 00:00:00.000000', '2024-04-06 00:20:00.000000'),
       (DEFAULT, 270, 'Employee 64 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-06 00:00:00.000000', '2024-04-06 00:00:00.000000', '2024-04-06 00:20:00.000000'),
       (DEFAULT, 271, 'Employee 66 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-06 00:00:00.000000', '2024-04-06 00:00:00.000000', '2024-04-06 00:20:00.000000'),
       (DEFAULT, 272, 'Employee 92 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-06 00:00:00.000000', '2024-04-06 00:00:00.000000', '2024-04-06 00:20:00.000000'),
       (DEFAULT, 273, 'Employee 94 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-06 00:00:00.000000', '2024-04-06 00:00:00.000000', '2024-04-06 00:20:00.000000'),
       (DEFAULT, 274, 'Employee 96 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-06 00:00:00.000000', '2024-04-06 00:00:00.000000', '2024-04-06 00:20:00.000000'),
       (DEFAULT, 275, 'Employee 120 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-06 00:00:00.000000', '2024-04-06 00:00:00.000000', '2024-04-06 00:20:00.000000');

-- 2024-04-10 00:00:00.000000
-- 2024-04-17
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (18, 1, 121, NULL, 'Create task repository', 'Create task repository', NULL, 'HARD', 'BACKEND', 'LOW', FALSE, '2024-04-10', '2024-04-17', '2024-04-17', '2024-04-10 00:00:00.000000', '2024-04-10 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (276, 18, 32, 'JOINED', '2024-04-10 00:00:00.000000', '2024-03-27T21:53:17'),
       (277, 18, 34, 'JOINED', '2024-04-10 00:00:00.000000', '2024-04-01T03:04:20'),
       (278, 18, 36, 'JOINED', '2024-04-10 00:00:00.000000', '2024-03-30T06:08:39');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 276, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-10 00:00:00.000000', '2024-04-10 00:00:00.000000', '2024-04-10 00:20:00.000000'),
       (DEFAULT, 277, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-10 00:00:00.000000', '2024-04-10 00:00:00.000000', '2024-04-10 00:20:00.000000'),
       (DEFAULT, 278, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-10 00:00:00.000000', '2024-04-10 00:00:00.000000', '2024-04-10 00:20:00.000000');

-- 2024-04-18 00:00:00.000000
-- 2024-04-24
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (19, 1, 121, NULL, 'Add global exception handler', 'Add global exception handler', NULL, 'ADVANCED', 'BACKEND', 'NORMAL', FALSE, '2024-04-18', '2024-04-24', '2024-04-24', '2024-04-18 00:00:00.000000', '2024-04-18 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (279, 19, 8, 'JOINED', '2024-04-18 00:00:00.000000', '2024-04-20T12:15:42'),
       (280, 19, 10, 'JOINED', '2024-04-18 00:00:00.000000', '2024-04-20T13:27:47'),
       (281, 19, 12, 'JOINED', '2024-04-18 00:00:00.000000', '2024-04-20T10:08:12'),
       (282, 19, 14, 'JOINED', '2024-04-18 00:00:00.000000', '2024-04-20T04:52:11'),
       (283, 19, 30, 'JOINED', '2024-04-18 00:00:00.000000', '2024-04-18T06:03:54'),
       (284, 19, 38, 'JOINED', '2024-04-18 00:00:00.000000', '2024-04-20T06:43:04'),
       (285, 19, 40, 'JOINED', '2024-04-18 00:00:00.000000', '2024-04-19T19:54:25'),
       (286, 19, 42, 'JOINED', '2024-04-18 00:00:00.000000', '2024-04-19T20:11:03'),
       (287, 19, 44, 'JOINED', '2024-04-18 00:00:00.000000', '2024-04-20T23:32:04'),
       (288, 19, 60, 'JOINED', '2024-04-18 00:00:00.000000', '2024-04-16T05:47:55'),
       (289, 19, 68, 'JOINED', '2024-04-18 00:00:00.000000', '2024-04-16T13:43:41'),
       (290, 19, 98, 'JOINED', '2024-04-18 00:00:00.000000', '2024-04-16T13:33:36'),
       (291, 19, 100, 'JOINED', '2024-04-18 00:00:00.000000', '2024-04-14T10:09:08'),
       (292, 19, 102, 'JOINED', '2024-04-18 00:00:00.000000', '2024-04-16T18:05:46'),
       (293, 19, 104, 'JOINED', '2024-04-18 00:00:00.000000', '2024-04-16T08:41:17');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 279, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-21 03:36:00.000000', '2024-04-21 03:36:00.000000', '2024-04-21 03:56:00.000000'),
       (DEFAULT, 280, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-21 03:36:00.000000', '2024-04-21 03:36:00.000000', '2024-04-21 03:56:00.000000'),
       (DEFAULT, 281, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-21 03:36:00.000000', '2024-04-21 03:36:00.000000', '2024-04-21 03:56:00.000000'),
       (DEFAULT, 282, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-21 03:36:00.000000', '2024-04-21 03:36:00.000000', '2024-04-21 03:56:00.000000'),
       (DEFAULT, 283, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-19 01:12:00.000000', '2024-04-19 01:12:00.000000', '2024-04-19 01:32:00.000000'),
       (DEFAULT, 284, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-21 03:36:00.000000', '2024-04-21 03:36:00.000000', '2024-04-21 03:56:00.000000'),
       (DEFAULT, 285, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-21 03:36:00.000000', '2024-04-21 03:36:00.000000', '2024-04-21 03:56:00.000000'),
       (DEFAULT, 286, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-21 03:36:00.000000', '2024-04-21 03:36:00.000000', '2024-04-21 03:56:00.000000'),
       (DEFAULT, 287, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-21 03:36:00.000000', '2024-04-21 03:36:00.000000', '2024-04-21 03:56:00.000000'),
       (DEFAULT, 288, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-19 01:12:00.000000', '2024-04-19 01:12:00.000000', '2024-04-19 01:32:00.000000'),
       (DEFAULT, 289, 'Employee 68 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-18 00:00:00.000000', '2024-04-18 00:00:00.000000', '2024-04-18 00:20:00.000000'),
       (DEFAULT, 290, 'Employee 98 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-18 00:00:00.000000', '2024-04-18 00:00:00.000000', '2024-04-18 00:20:00.000000'),
       (DEFAULT, 291, 'Employee 100 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-18 00:00:00.000000', '2024-04-18 00:00:00.000000', '2024-04-18 00:20:00.000000'),
       (DEFAULT, 292, 'Employee 102 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-18 00:00:00.000000', '2024-04-18 00:00:00.000000', '2024-04-18 00:20:00.000000'),
       (DEFAULT, 293, 'Employee 104 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-18 00:00:00.000000', '2024-04-18 00:00:00.000000', '2024-04-18 00:20:00.000000');

-- 2024-04-25 00:00:00.000000
-- 2024-05-01
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (20, 1, 121, NULL, 'Add custom error response', 'Add custom error response', NULL, 'ADVANCED', 'BACKEND', 'LOW', FALSE, '2024-04-25', '2024-05-01', '2024-05-01', '2024-04-25 00:00:00.000000', '2024-04-25 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (294, 20, 8, 'JOINED', '2024-04-25 00:00:00.000000', '2024-04-13T12:18:44'),
       (295, 20, 10, 'JOINED', '2024-04-25 00:00:00.000000', '2024-04-15T02:06:44'),
       (296, 20, 12, 'JOINED', '2024-04-25 00:00:00.000000', '2024-04-13T01:43:41'),
       (297, 20, 14, 'JOINED', '2024-04-25 00:00:00.000000', '2024-04-16T03:59:03'),
       (298, 20, 38, 'JOINED', '2024-04-25 00:00:00.000000', '2024-04-13T00:12:58'),
       (299, 20, 40, 'JOINED', '2024-04-25 00:00:00.000000', '2024-04-15T14:22:34'),
       (300, 20, 42, 'JOINED', '2024-04-25 00:00:00.000000', '2024-04-15T05:18:15'),
       (301, 20, 44, 'JOINED', '2024-04-25 00:00:00.000000', '2024-04-14T05:47:03');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 294, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-25 00:00:00.000000', '2024-04-25 00:00:00.000000', '2024-04-25 00:20:00.000000'),
       (DEFAULT, 295, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-25 00:00:00.000000', '2024-04-25 00:00:00.000000', '2024-04-25 00:20:00.000000'),
       (DEFAULT, 296, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-25 00:00:00.000000', '2024-04-25 00:00:00.000000', '2024-04-25 00:20:00.000000'),
       (DEFAULT, 297, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-25 00:00:00.000000', '2024-04-25 00:00:00.000000', '2024-04-25 00:20:00.000000'),
       (DEFAULT, 298, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-25 00:00:00.000000', '2024-04-25 00:00:00.000000', '2024-04-25 00:20:00.000000'),
       (DEFAULT, 299, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-25 00:00:00.000000', '2024-04-25 00:00:00.000000', '2024-04-25 00:20:00.000000'),
       (DEFAULT, 300, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-25 00:00:00.000000', '2024-04-25 00:00:00.000000', '2024-04-25 00:20:00.000000'),
       (DEFAULT, 301, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-25 00:00:00.000000', '2024-04-25 00:00:00.000000', '2024-04-25 00:20:00.000000');

-- 2024-05-02 00:00:00.000000
-- 2024-05-07
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (21, 1, 121, NULL, 'Implement user service', 'Implement user service', NULL, 'NORMAL', 'BACKEND', 'NORMAL', FALSE, '2024-05-02', '2024-05-07', '2024-05-07', '2024-05-02 00:00:00.000000', '2024-05-02 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (302, 21, 16, 'JOINED', '2024-05-02 00:00:00.000000', '2024-05-04T09:07:04'),
       (303, 21, 18, 'JOINED', '2024-05-02 00:00:00.000000', '2024-05-03T17:40:25'),
       (304, 21, 20, 'JOINED', '2024-05-02 00:00:00.000000', '2024-05-03T19:53:29'),
       (305, 21, 30, 'JOINED', '2024-05-02 00:00:00.000000', '2024-04-30T14:28:37'),
       (306, 21, 46, 'JOINED', '2024-05-02 00:00:00.000000', '2024-05-03T22:54:03'),
       (307, 21, 48, 'JOINED', '2024-05-02 00:00:00.000000', '2024-05-04T14:25:27'),
       (308, 21, 50, 'JOINED', '2024-05-02 00:00:00.000000', '2024-05-04T12:07:38'),
       (309, 21, 60, 'JOINED', '2024-05-02 00:00:00.000000', '2024-04-30T10:40:31'),
       (310, 21, 106, 'JOINED', '2024-05-02 00:00:00.000000', '2024-04-29T03:01:27'),
       (311, 21, 108, 'JOINED', '2024-05-02 00:00:00.000000', '2024-05-01T08:26:53'),
       (312, 21, 110, 'JOINED', '2024-05-02 00:00:00.000000', '2024-04-30T07:32:10');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 302, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-04 16:48:00.000000', '2024-05-04 16:48:00.000000', '2024-05-04 17:08:00.000000'),
       (DEFAULT, 303, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-04 16:48:00.000000', '2024-05-04 16:48:00.000000', '2024-05-04 17:08:00.000000'),
       (DEFAULT, 304, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-04 16:48:00.000000', '2024-05-04 16:48:00.000000', '2024-05-04 17:08:00.000000'),
       (DEFAULT, 305, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-03 04:48:00.000000', '2024-05-03 04:48:00.000000', '2024-05-03 05:08:00.000000'),
       (DEFAULT, 306, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-04 16:48:00.000000', '2024-05-04 16:48:00.000000', '2024-05-04 17:08:00.000000'),
       (DEFAULT, 307, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-04 16:48:00.000000', '2024-05-04 16:48:00.000000', '2024-05-04 17:08:00.000000'),
       (DEFAULT, 308, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-04 16:48:00.000000', '2024-05-04 16:48:00.000000', '2024-05-04 17:08:00.000000'),
       (DEFAULT, 309, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-03 04:48:00.000000', '2024-05-03 04:48:00.000000', '2024-05-03 05:08:00.000000'),
       (DEFAULT, 310, 'Employee 106 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-02 00:00:00.000000', '2024-05-02 00:00:00.000000', '2024-05-02 00:20:00.000000'),
       (DEFAULT, 311, 'Employee 108 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-02 00:00:00.000000', '2024-05-02 00:00:00.000000', '2024-05-02 00:20:00.000000'),
       (DEFAULT, 312, 'Employee 110 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-02 00:00:00.000000', '2024-05-02 00:00:00.000000', '2024-05-02 00:20:00.000000');

-- 2024-05-08 00:00:00.000000
-- 2024-05-13
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (22, 1, 121, NULL, 'Implement task service', 'Implement task service', NULL, 'NORMAL', 'BACKEND', 'LOW', FALSE, '2024-05-08', '2024-05-13', '2024-05-13', '2024-05-08 00:00:00.000000', '2024-05-08 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (313, 22, 16, 'JOINED', '2024-05-08 00:00:00.000000', '2024-04-30T06:23:03'),
       (314, 22, 18, 'JOINED', '2024-05-08 00:00:00.000000', '2024-04-30T12:34:34'),
       (315, 22, 20, 'JOINED', '2024-05-08 00:00:00.000000', '2024-04-26T14:24'),
       (316, 22, 46, 'JOINED', '2024-05-08 00:00:00.000000', '2024-04-27T09:50:24'),
       (317, 22, 48, 'JOINED', '2024-05-08 00:00:00.000000', '2024-05-01T13:12'),
       (318, 22, 50, 'JOINED', '2024-05-08 00:00:00.000000', '2024-04-29T00:25:56');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 313, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-08 00:00:00.000000', '2024-05-08 00:00:00.000000', '2024-05-08 00:20:00.000000'),
       (DEFAULT, 314, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-08 00:00:00.000000', '2024-05-08 00:00:00.000000', '2024-05-08 00:20:00.000000'),
       (DEFAULT, 315, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-08 00:00:00.000000', '2024-05-08 00:00:00.000000', '2024-05-08 00:20:00.000000'),
       (DEFAULT, 316, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-08 00:00:00.000000', '2024-05-08 00:00:00.000000', '2024-05-08 00:20:00.000000'),
       (DEFAULT, 317, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-08 00:00:00.000000', '2024-05-08 00:00:00.000000', '2024-05-08 00:20:00.000000'),
       (DEFAULT, 318, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-08 00:00:00.000000', '2024-05-08 00:00:00.000000', '2024-05-08 00:20:00.000000');

-- 2024-05-14 00:00:00.000000
-- 2024-05-18
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (23, 1, 121, NULL, 'Implement auth service', 'Implement auth service', NULL, 'LIGHT', 'BACKEND', 'NORMAL', FALSE, '2024-05-14', '2024-05-18', '2024-05-18', '2024-05-14 00:00:00.000000', '2024-05-14 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (319, 23, 22, 'JOINED', '2024-05-14 00:00:00.000000', '2024-05-15T11:15:22'),
       (320, 23, 24, 'JOINED', '2024-05-14 00:00:00.000000', '2024-05-15T11:03:29'),
       (321, 23, 26, 'JOINED', '2024-05-14 00:00:00.000000', '2024-05-15T10:59:32'),
       (322, 23, 28, 'JOINED', '2024-05-14 00:00:00.000000', '2024-05-15T10:47:39'),
       (323, 23, 30, 'JOINED', '2024-05-14 00:00:00.000000', '2024-05-14T20:12:29'),
       (324, 23, 52, 'JOINED', '2024-05-14 00:00:00.000000', '2024-05-15T18:30:58'),
       (325, 23, 54, 'JOINED', '2024-05-14 00:00:00.000000', '2024-05-15T13:06:15'),
       (326, 23, 56, 'JOINED', '2024-05-14 00:00:00.000000', '2024-05-15T15:12:58'),
       (327, 23, 58, 'JOINED', '2024-05-14 00:00:00.000000', '2024-05-15T18:38:53'),
       (328, 23, 60, 'JOINED', '2024-05-14 00:00:00.000000', '2024-05-14T23:44:10'),
       (329, 23, 112, 'JOINED', '2024-05-14 00:00:00.000000', '2024-05-12T03:21:36'),
       (330, 23, 114, 'JOINED', '2024-05-14 00:00:00.000000', '2024-05-12T19:55:12'),
       (331, 23, 116, 'JOINED', '2024-05-14 00:00:00.000000', '2024-05-13T05:02:24'),
       (332, 23, 118, 'JOINED', '2024-05-14 00:00:00.000000', '2024-05-12T08:24');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 319, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-16 06:00:00.000000', '2024-05-16 06:00:00.000000', '2024-05-16 06:20:00.000000'),
       (DEFAULT, 320, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-16 06:00:00.000000', '2024-05-16 06:00:00.000000', '2024-05-16 06:20:00.000000'),
       (DEFAULT, 321, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-16 06:00:00.000000', '2024-05-16 06:00:00.000000', '2024-05-16 06:20:00.000000'),
       (DEFAULT, 322, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-16 06:00:00.000000', '2024-05-16 06:00:00.000000', '2024-05-16 06:20:00.000000'),
       (DEFAULT, 323, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-15 12:00:00.000000', '2024-05-15 12:00:00.000000', '2024-05-15 12:20:00.000000'),
       (DEFAULT, 324, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-16 06:00:00.000000', '2024-05-16 06:00:00.000000', '2024-05-16 06:20:00.000000'),
       (DEFAULT, 325, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-16 06:00:00.000000', '2024-05-16 06:00:00.000000', '2024-05-16 06:20:00.000000'),
       (DEFAULT, 326, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-16 06:00:00.000000', '2024-05-16 06:00:00.000000', '2024-05-16 06:20:00.000000'),
       (DEFAULT, 327, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-16 06:00:00.000000', '2024-05-16 06:00:00.000000', '2024-05-16 06:20:00.000000'),
       (DEFAULT, 328, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-15 12:00:00.000000', '2024-05-15 12:00:00.000000', '2024-05-15 12:20:00.000000'),
       (DEFAULT, 329, 'Employee 112 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-14 00:00:00.000000', '2024-05-14 00:00:00.000000', '2024-05-14 00:20:00.000000'),
       (DEFAULT, 330, 'Employee 114 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-14 00:00:00.000000', '2024-05-14 00:00:00.000000', '2024-05-14 00:20:00.000000'),
       (DEFAULT, 331, 'Employee 116 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-14 00:00:00.000000', '2024-05-14 00:00:00.000000', '2024-05-14 00:20:00.000000'),
       (DEFAULT, 332, 'Employee 118 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-14 00:00:00.000000', '2024-05-14 00:00:00.000000', '2024-05-14 00:20:00.000000');

-- 2024-05-19 00:00:00.000000
-- 2024-05-23
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (24, 1, 121, NULL, 'Implement jwt provider', 'Implement jwt provider', NULL, 'LIGHT', 'BACKEND', 'LOW', FALSE, '2024-05-19', '2024-05-23', '2024-05-23', '2024-05-19 00:00:00.000000', '2024-05-19 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (333, 24, 22, 'JOINED', '2024-05-19 00:00:00.000000', '2024-05-10T15:43:12'),
       (334, 24, 24, 'JOINED', '2024-05-19 00:00:00.000000', '2024-05-10T18:57:36'),
       (335, 24, 26, 'JOINED', '2024-05-19 00:00:00.000000', '2024-05-10T13:12'),
       (336, 24, 28, 'JOINED', '2024-05-19 00:00:00.000000', '2024-05-13T21:14:24'),
       (337, 24, 30, 'JOINED', '2024-05-19 00:00:00.000000', '2024-05-11T09:21:36'),
       (338, 24, 52, 'JOINED', '2024-05-19 00:00:00.000000', '2024-05-13T00:00'),
       (339, 24, 54, 'JOINED', '2024-05-19 00:00:00.000000', '2024-05-12T16:26:24'),
       (340, 24, 56, 'JOINED', '2024-05-19 00:00:00.000000', '2024-05-09T18:36'),
       (341, 24, 58, 'JOINED', '2024-05-19 00:00:00.000000', '2024-05-10T21:00'),
       (342, 24, 60, 'JOINED', '2024-05-19 00:00:00.000000', '2024-05-11T11:16:48');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 333, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-19 00:00:00.000000', '2024-05-19 00:00:00.000000', '2024-05-19 00:20:00.000000'),
       (DEFAULT, 334, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-19 00:00:00.000000', '2024-05-19 00:00:00.000000', '2024-05-19 00:20:00.000000'),
       (DEFAULT, 335, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-19 00:00:00.000000', '2024-05-19 00:00:00.000000', '2024-05-19 00:20:00.000000'),
       (DEFAULT, 336, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-19 00:00:00.000000', '2024-05-19 00:00:00.000000', '2024-05-19 00:20:00.000000'),
       (DEFAULT, 337, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-19 00:00:00.000000', '2024-05-19 00:00:00.000000', '2024-05-19 00:20:00.000000'),
       (DEFAULT, 338, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-19 00:00:00.000000', '2024-05-19 00:00:00.000000', '2024-05-19 00:20:00.000000'),
       (DEFAULT, 339, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-19 00:00:00.000000', '2024-05-19 00:00:00.000000', '2024-05-19 00:20:00.000000'),
       (DEFAULT, 340, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-19 00:00:00.000000', '2024-05-19 00:00:00.000000', '2024-05-19 00:20:00.000000'),
       (DEFAULT, 341, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-19 00:00:00.000000', '2024-05-19 00:00:00.000000', '2024-05-19 00:20:00.000000'),
       (DEFAULT, 342, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-19 00:00:00.000000', '2024-05-19 00:00:00.000000', '2024-05-19 00:20:00.000000');

-- 2024-05-24 00:00:00.000000
-- 2024-05-27
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (25, 1, 121, NULL, 'Create task edit form', 'Create task edit form', NULL, 'HARD', 'FRONTEND', 'NORMAL', FALSE, '2024-05-24', '2024-05-27', '2024-05-27', '2024-05-24 00:00:00.000000', '2024-05-24 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (343, 25, 1, 'JOINED', '2024-05-24 00:00:00.000000', '2024-05-25T10:29:17'),
       (344, 25, 3, 'JOINED', '2024-05-24 00:00:00.000000', '2024-05-25T08:38:24'),
       (345, 25, 5, 'JOINED', '2024-05-24 00:00:00.000000', '2024-05-25T08:38:24'),
       (346, 25, 7, 'JOINED', '2024-05-24 00:00:00.000000', '2024-05-24T18:16:43'),
       (347, 25, 29, 'JOINED', '2024-05-24 00:00:00.000000', '2024-05-23T15:56:10'),
       (348, 25, 31, 'JOINED', '2024-05-24 00:00:00.000000', '2024-05-25T04:12:18'),
       (349, 25, 33, 'JOINED', '2024-05-24 00:00:00.000000', '2024-05-25T14:14:13'),
       (350, 25, 35, 'JOINED', '2024-05-24 00:00:00.000000', '2024-05-25T16:20:56'),
       (351, 25, 37, 'JOINED', '2024-05-24 00:00:00.000000', '2024-05-25T07:06:32'),
       (352, 25, 59, 'JOINED', '2024-05-24 00:00:00.000000', '2024-05-24T12:12:41'),
       (353, 25, 61, 'JOINED', '2024-05-24 00:00:00.000000', '2024-05-22T08:26:53'),
       (354, 25, 63, 'JOINED', '2024-05-24 00:00:00.000000', '2024-05-23T06:20:10'),
       (355, 25, 65, 'JOINED', '2024-05-24 00:00:00.000000', '2024-05-21T08:09:36'),
       (356, 25, 67, 'JOINED', '2024-05-24 00:00:00.000000', '2024-05-22T17:45:36'),
       (357, 25, 91, 'JOINED', '2024-05-24 00:00:00.000000', '2024-05-21T20:26:53'),
       (358, 25, 93, 'JOINED', '2024-05-24 00:00:00.000000', '2024-05-22T04:36:29'),
       (359, 25, 95, 'JOINED', '2024-05-24 00:00:00.000000', '2024-05-22T17:16:48'),
       (360, 25, 97, 'JOINED', '2024-05-24 00:00:00.000000', '2024-05-23T01:03:22');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 343, 'Employee 1 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-25 19:12:00.000000', '2024-05-25 19:12:00.000000', '2024-05-25 19:32:00.000000'),
       (DEFAULT, 344, 'Employee 3 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-25 19:12:00.000000', '2024-05-25 19:12:00.000000', '2024-05-25 19:32:00.000000'),
       (DEFAULT, 345, 'Employee 5 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-25 19:12:00.000000', '2024-05-25 19:12:00.000000', '2024-05-25 19:32:00.000000'),
       (DEFAULT, 346, 'Employee 7 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-25 19:12:00.000000', '2024-05-25 19:12:00.000000', '2024-05-25 19:32:00.000000'),
       (DEFAULT, 347, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-24 19:12:00.000000', '2024-05-24 19:12:00.000000', '2024-05-24 19:32:00.000000'),
       (DEFAULT, 348, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-25 19:12:00.000000', '2024-05-25 19:12:00.000000', '2024-05-25 19:32:00.000000'),
       (DEFAULT, 349, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-25 19:12:00.000000', '2024-05-25 19:12:00.000000', '2024-05-25 19:32:00.000000'),
       (DEFAULT, 350, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-25 19:12:00.000000', '2024-05-25 19:12:00.000000', '2024-05-25 19:32:00.000000'),
       (DEFAULT, 351, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-25 19:12:00.000000', '2024-05-25 19:12:00.000000', '2024-05-25 19:32:00.000000'),
       (DEFAULT, 352, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-24 19:12:00.000000', '2024-05-24 19:12:00.000000', '2024-05-24 19:32:00.000000'),
       (DEFAULT, 353, 'Employee 61 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-24 00:00:00.000000', '2024-05-24 00:00:00.000000', '2024-05-24 00:20:00.000000'),
       (DEFAULT, 354, 'Employee 63 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-24 00:00:00.000000', '2024-05-24 00:00:00.000000', '2024-05-24 00:20:00.000000'),
       (DEFAULT, 355, 'Employee 65 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-24 00:00:00.000000', '2024-05-24 00:00:00.000000', '2024-05-24 00:20:00.000000'),
       (DEFAULT, 356, 'Employee 67 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-24 00:00:00.000000', '2024-05-24 00:00:00.000000', '2024-05-24 00:20:00.000000'),
       (DEFAULT, 357, 'Employee 91 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-24 00:00:00.000000', '2024-05-24 00:00:00.000000', '2024-05-24 00:20:00.000000'),
       (DEFAULT, 358, 'Employee 93 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-24 00:00:00.000000', '2024-05-24 00:00:00.000000', '2024-05-24 00:20:00.000000'),
       (DEFAULT, 359, 'Employee 95 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-24 00:00:00.000000', '2024-05-24 00:00:00.000000', '2024-05-24 00:20:00.000000'),
       (DEFAULT, 360, 'Employee 97 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-24 00:00:00.000000', '2024-05-24 00:00:00.000000', '2024-05-24 00:20:00.000000');

-- 2024-05-28 00:00:00.000000
-- 2024-06-04
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (26, 1, 121, NULL, 'Create login form', 'Create login form', NULL, 'HARD', 'FRONTEND', 'LOW', FALSE, '2024-05-28', '2024-06-04', '2024-06-04', '2024-05-28 00:00:00.000000', '2024-05-28 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (361, 26, 31, 'JOINED', '2024-05-28 00:00:00.000000', '2024-05-14T08:49:56'),
       (362, 26, 33, 'JOINED', '2024-05-28 00:00:00.000000', '2024-05-19T10:33:36'),
       (363, 26, 35, 'JOINED', '2024-05-28 00:00:00.000000', '2024-05-13T06:54:44'),
       (364, 26, 37, 'JOINED', '2024-05-28 00:00:00.000000', '2024-05-13T07:52:20');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 361, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-28 00:00:00.000000', '2024-05-28 00:00:00.000000', '2024-05-28 00:20:00.000000'),
       (DEFAULT, 362, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-28 00:00:00.000000', '2024-05-28 00:00:00.000000', '2024-05-28 00:20:00.000000'),
       (DEFAULT, 363, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-28 00:00:00.000000', '2024-05-28 00:00:00.000000', '2024-05-28 00:20:00.000000'),
       (DEFAULT, 364, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-28 00:00:00.000000', '2024-05-28 00:00:00.000000', '2024-05-28 00:20:00.000000');

-- 2024-06-05 00:00:00.000000
-- 2024-06-11
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (27, 1, 121, NULL, 'Create register form', 'Create register form', NULL, 'ADVANCED', 'FRONTEND', 'NORMAL', FALSE, '2024-06-05', '2024-06-11', '2024-06-11', '2024-06-05 00:00:00.000000', '2024-06-05 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (365, 27, 9, 'JOINED', '2024-06-05 00:00:00.000000', '2024-06-07T16:14:06'),
       (366, 27, 11, 'JOINED', '2024-06-05 00:00:00.000000', '2024-06-07T03:34:34'),
       (367, 27, 13, 'JOINED', '2024-06-05 00:00:00.000000', '2024-06-07T17:42:48'),
       (368, 27, 29, 'JOINED', '2024-06-05 00:00:00.000000', '2024-06-05T13:21:22'),
       (369, 27, 39, 'JOINED', '2024-06-05 00:00:00.000000', '2024-06-07T21:13:28'),
       (370, 27, 41, 'JOINED', '2024-06-05 00:00:00.000000', '2024-06-08T02:51:39'),
       (371, 27, 43, 'JOINED', '2024-06-05 00:00:00.000000', '2024-06-07T08:17:19'),
       (372, 27, 59, 'JOINED', '2024-06-05 00:00:00.000000', '2024-06-06T13:41:58'),
       (373, 27, 69, 'JOINED', '2024-06-05 00:00:00.000000', '2024-06-01T05:57:08'),
       (374, 27, 99, 'JOINED', '2024-06-05 00:00:00.000000', '2024-06-03T15:04:20'),
       (375, 27, 101, 'JOINED', '2024-06-05 00:00:00.000000', '2024-06-02T22:46:34'),
       (376, 27, 103, 'JOINED', '2024-06-05 00:00:00.000000', '2024-06-03T09:31:41');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 365, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-08 03:36:00.000000', '2024-06-08 03:36:00.000000', '2024-06-08 03:56:00.000000'),
       (DEFAULT, 366, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-08 03:36:00.000000', '2024-06-08 03:36:00.000000', '2024-06-08 03:56:00.000000'),
       (DEFAULT, 367, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-08 03:36:00.000000', '2024-06-08 03:36:00.000000', '2024-06-08 03:56:00.000000'),
       (DEFAULT, 368, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-07 02:24:00.000000', '2024-06-07 02:24:00.000000', '2024-06-07 02:44:00.000000'),
       (DEFAULT, 369, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-08 03:36:00.000000', '2024-06-08 03:36:00.000000', '2024-06-08 03:56:00.000000'),
       (DEFAULT, 370, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-08 03:36:00.000000', '2024-06-08 03:36:00.000000', '2024-06-08 03:56:00.000000'),
       (DEFAULT, 371, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-08 03:36:00.000000', '2024-06-08 03:36:00.000000', '2024-06-08 03:56:00.000000'),
       (DEFAULT, 372, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-07 02:24:00.000000', '2024-06-07 02:24:00.000000', '2024-06-07 02:44:00.000000'),
       (DEFAULT, 373, 'Employee 69 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-05 00:00:00.000000', '2024-06-05 00:00:00.000000', '2024-06-05 00:20:00.000000'),
       (DEFAULT, 374, 'Employee 99 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-05 00:00:00.000000', '2024-06-05 00:00:00.000000', '2024-06-05 00:20:00.000000'),
       (DEFAULT, 375, 'Employee 101 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-05 00:00:00.000000', '2024-06-05 00:00:00.000000', '2024-06-05 00:20:00.000000'),
       (DEFAULT, 376, 'Employee 103 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-05 00:00:00.000000', '2024-06-05 00:00:00.000000', '2024-06-05 00:20:00.000000');

-- 2024-06-12 00:00:00.000000
-- 2024-06-18
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (28, 1, 121, NULL, 'Add basic form validation', 'Add basic form validation', NULL, 'ADVANCED', 'FRONTEND', 'LOW', FALSE, '2024-06-12', '2024-06-18', '2024-06-18', '2024-06-12 00:00:00.000000', '2024-06-12 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (377, 28, 9, 'JOINED', '2024-06-12 00:00:00.000000', '2024-05-30T23:42:44'),
       (378, 28, 11, 'JOINED', '2024-06-12 00:00:00.000000', '2024-06-03T17:55:41'),
       (379, 28, 13, 'JOINED', '2024-06-12 00:00:00.000000', '2024-06-02T07:29:17'),
       (380, 28, 29, 'JOINED', '2024-06-12 00:00:00.000000', '2024-05-31T22:33:36'),
       (381, 28, 39, 'JOINED', '2024-06-12 00:00:00.000000', '2024-06-04T21:59:03'),
       (382, 28, 41, 'JOINED', '2024-06-12 00:00:00.000000', '2024-05-29T14:47:03'),
       (383, 28, 43, 'JOINED', '2024-06-12 00:00:00.000000', '2024-06-03T13:43:41'),
       (384, 28, 59, 'JOINED', '2024-06-12 00:00:00.000000', '2024-05-29T09:54:44'),
       (385, 28, 69, 'JOINED', '2024-06-12 00:00:00.000000', '2024-06-01T08:58:34');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 377, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-12 00:00:00.000000', '2024-06-12 00:00:00.000000', '2024-06-12 00:20:00.000000'),
       (DEFAULT, 378, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-12 00:00:00.000000', '2024-06-12 00:00:00.000000', '2024-06-12 00:20:00.000000'),
       (DEFAULT, 379, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-12 00:00:00.000000', '2024-06-12 00:00:00.000000', '2024-06-12 00:20:00.000000'),
       (DEFAULT, 380, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-12 00:00:00.000000', '2024-06-12 00:00:00.000000', '2024-06-12 00:20:00.000000'),
       (DEFAULT, 381, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-12 00:00:00.000000', '2024-06-12 00:00:00.000000', '2024-06-12 00:20:00.000000'),
       (DEFAULT, 382, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-12 00:00:00.000000', '2024-06-12 00:00:00.000000', '2024-06-12 00:20:00.000000'),
       (DEFAULT, 383, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-12 00:00:00.000000', '2024-06-12 00:00:00.000000', '2024-06-12 00:20:00.000000'),
       (DEFAULT, 384, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-12 00:00:00.000000', '2024-06-12 00:00:00.000000', '2024-06-12 00:20:00.000000'),
       (DEFAULT, 385, 'Employee 69 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-12 00:00:00.000000', '2024-06-12 00:00:00.000000', '2024-06-12 00:20:00.000000');

-- 2024-06-19 00:00:00.000000
-- 2024-06-24
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (29, 1, 121, NULL, 'Render task list', 'Render task list', NULL, 'NORMAL', 'FRONTEND', 'NORMAL', FALSE, '2024-06-19', '2024-06-24', '2024-06-24', '2024-06-19 00:00:00.000000', '2024-06-19 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (386, 29, 15, 'JOINED', '2024-06-19 00:00:00.000000', '2024-06-20T11:44:01'),
       (387, 29, 17, 'JOINED', '2024-06-19 00:00:00.000000', '2024-06-20T18:13:41'),
       (388, 29, 19, 'JOINED', '2024-06-19 00:00:00.000000', '2024-06-21T09:40:20'),
       (389, 29, 21, 'JOINED', '2024-06-19 00:00:00.000000', '2024-06-20T18:46:57'),
       (390, 29, 29, 'JOINED', '2024-06-19 00:00:00.000000', '2024-06-20T18:28:48'),
       (391, 29, 45, 'JOINED', '2024-06-19 00:00:00.000000', '2024-06-21T12:12:24'),
       (392, 29, 47, 'JOINED', '2024-06-19 00:00:00.000000', '2024-06-20T23:03:34'),
       (393, 29, 49, 'JOINED', '2024-06-19 00:00:00.000000', '2024-06-21T03:34:25'),
       (394, 29, 51, 'JOINED', '2024-06-19 00:00:00.000000', '2024-06-21T06:44:30'),
       (395, 29, 59, 'JOINED', '2024-06-19 00:00:00.000000', '2024-06-20T09:14:07'),
       (396, 29, 105, 'JOINED', '2024-06-19 00:00:00.000000', '2024-06-16T21:10:05'),
       (397, 29, 107, 'JOINED', '2024-06-19 00:00:00.000000', '2024-06-16T02:35:32'),
       (398, 29, 109, 'JOINED', '2024-06-19 00:00:00.000000', '2024-06-16T15:59:03'),
       (399, 29, 111, 'JOINED', '2024-06-19 00:00:00.000000', '2024-06-14T00:28:48'),
       (400, 29, 119, 'JOINED', '2024-06-19 00:00:00.000000', '2024-06-16T21:18:44');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 386, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-21 16:48:00.000000', '2024-06-21 16:48:00.000000', '2024-06-21 17:08:00.000000'),
       (DEFAULT, 387, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-21 16:48:00.000000', '2024-06-21 16:48:00.000000', '2024-06-21 17:08:00.000000'),
       (DEFAULT, 388, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-21 16:48:00.000000', '2024-06-21 16:48:00.000000', '2024-06-21 17:08:00.000000'),
       (DEFAULT, 389, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-21 16:48:00.000000', '2024-06-21 16:48:00.000000', '2024-06-21 17:08:00.000000'),
       (DEFAULT, 390, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-21 09:36:00.000000', '2024-06-21 09:36:00.000000', '2024-06-21 09:56:00.000000'),
       (DEFAULT, 391, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-21 16:48:00.000000', '2024-06-21 16:48:00.000000', '2024-06-21 17:08:00.000000'),
       (DEFAULT, 392, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-21 16:48:00.000000', '2024-06-21 16:48:00.000000', '2024-06-21 17:08:00.000000'),
       (DEFAULT, 393, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-21 16:48:00.000000', '2024-06-21 16:48:00.000000', '2024-06-21 17:08:00.000000'),
       (DEFAULT, 394, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-21 16:48:00.000000', '2024-06-21 16:48:00.000000', '2024-06-21 17:08:00.000000'),
       (DEFAULT, 395, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-21 09:36:00.000000', '2024-06-21 09:36:00.000000', '2024-06-21 09:56:00.000000'),
       (DEFAULT, 396, 'Employee 105 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-19 00:00:00.000000', '2024-06-19 00:00:00.000000', '2024-06-19 00:20:00.000000'),
       (DEFAULT, 397, 'Employee 107 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-19 00:00:00.000000', '2024-06-19 00:00:00.000000', '2024-06-19 00:20:00.000000'),
       (DEFAULT, 398, 'Employee 109 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-19 00:00:00.000000', '2024-06-19 00:00:00.000000', '2024-06-19 00:20:00.000000'),
       (DEFAULT, 399, 'Employee 111 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-19 00:00:00.000000', '2024-06-19 00:00:00.000000', '2024-06-19 00:20:00.000000'),
       (DEFAULT, 400, 'Employee 119 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-19 00:00:00.000000', '2024-06-19 00:00:00.000000', '2024-06-19 00:20:00.000000');

-- 2024-06-25 00:00:00.000000
-- 2024-06-30
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (30, 1, 121, NULL, 'Render task detail', 'Render task detail', NULL, 'NORMAL', 'FRONTEND', 'LOW', FALSE, '2024-06-25', '2024-06-30', '2024-06-30', '2024-06-25 00:00:00.000000', '2024-06-25 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (401, 30, 15, 'JOINED', '2024-06-25 00:00:00.000000', '2024-06-15T12:54:44'),
       (402, 30, 17, 'JOINED', '2024-06-25 00:00:00.000000', '2024-06-15T06:43:12'),
       (403, 30, 19, 'JOINED', '2024-06-25 00:00:00.000000', '2024-06-17T04:13:27'),
       (404, 30, 21, 'JOINED', '2024-06-25 00:00:00.000000', '2024-06-14T18:54:44'),
       (405, 30, 45, 'JOINED', '2024-06-25 00:00:00.000000', '2024-06-16T04:53:46'),
       (406, 30, 47, 'JOINED', '2024-06-25 00:00:00.000000', '2024-06-18T12:28:48'),
       (407, 30, 49, 'JOINED', '2024-06-25 00:00:00.000000', '2024-06-18T21:50:24'),
       (408, 30, 51, 'JOINED', '2024-06-25 00:00:00.000000', '2024-06-14T15:53:17');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 401, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-25 00:00:00.000000', '2024-06-25 00:00:00.000000', '2024-06-25 00:20:00.000000'),
       (DEFAULT, 402, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-25 00:00:00.000000', '2024-06-25 00:00:00.000000', '2024-06-25 00:20:00.000000'),
       (DEFAULT, 403, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-25 00:00:00.000000', '2024-06-25 00:00:00.000000', '2024-06-25 00:20:00.000000'),
       (DEFAULT, 404, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-25 00:00:00.000000', '2024-06-25 00:00:00.000000', '2024-06-25 00:20:00.000000'),
       (DEFAULT, 405, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-25 00:00:00.000000', '2024-06-25 00:00:00.000000', '2024-06-25 00:20:00.000000'),
       (DEFAULT, 406, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-25 00:00:00.000000', '2024-06-25 00:00:00.000000', '2024-06-25 00:20:00.000000'),
       (DEFAULT, 407, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-25 00:00:00.000000', '2024-06-25 00:00:00.000000', '2024-06-25 00:20:00.000000'),
       (DEFAULT, 408, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-25 00:00:00.000000', '2024-06-25 00:00:00.000000', '2024-06-25 00:20:00.000000');

-- 2024-07-01 00:00:00.000000
-- 2024-07-05
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (31, 1, 121, NULL, 'Add create task button', 'Add create task button', NULL, 'LIGHT', 'FRONTEND', 'NORMAL', FALSE, '2024-07-01', '2024-07-05', '2024-07-05', '2024-07-01 00:00:00.000000', '2024-07-01 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (409, 31, 23, 'JOINED', '2024-07-01 00:00:00.000000', '2024-07-02T19:22:27'),
       (410, 31, 25, 'JOINED', '2024-07-01 00:00:00.000000', '2024-07-02T20:49:34'),
       (411, 31, 27, 'JOINED', '2024-07-01 00:00:00.000000', '2024-07-02T20:25:48'),
       (412, 31, 29, 'JOINED', '2024-07-01 00:00:00.000000', '2024-06-30T05:41:17'),
       (413, 31, 53, 'JOINED', '2024-07-01 00:00:00.000000', '2024-07-02T20:45:36'),
       (414, 31, 55, 'JOINED', '2024-07-01 00:00:00.000000', '2024-07-02T15:32:46'),
       (415, 31, 57, 'JOINED', '2024-07-01 00:00:00.000000', '2024-07-02T20:29:46'),
       (416, 31, 59, 'JOINED', '2024-07-01 00:00:00.000000', '2024-06-30T17:00:36'),
       (417, 31, 113, 'JOINED', '2024-07-01 00:00:00.000000', '2024-06-29T03:43:12'),
       (418, 31, 115, 'JOINED', '2024-07-01 00:00:00.000000', '2024-06-30T03:21:36'),
       (419, 31, 117, 'JOINED', '2024-07-01 00:00:00.000000', '2024-06-28T14:09:36');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 409, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-03 06:00:00.000000', '2024-07-03 06:00:00.000000', '2024-07-03 06:20:00.000000'),
       (DEFAULT, 410, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-03 06:00:00.000000', '2024-07-03 06:00:00.000000', '2024-07-03 06:20:00.000000'),
       (DEFAULT, 411, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-03 06:00:00.000000', '2024-07-03 06:00:00.000000', '2024-07-03 06:20:00.000000'),
       (DEFAULT, 412, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-01 18:00:00.000000', '2024-07-01 18:00:00.000000', '2024-07-01 18:20:00.000000'),
       (DEFAULT, 413, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-03 06:00:00.000000', '2024-07-03 06:00:00.000000', '2024-07-03 06:20:00.000000'),
       (DEFAULT, 414, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-03 06:00:00.000000', '2024-07-03 06:00:00.000000', '2024-07-03 06:20:00.000000'),
       (DEFAULT, 415, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-03 06:00:00.000000', '2024-07-03 06:00:00.000000', '2024-07-03 06:20:00.000000'),
       (DEFAULT, 416, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-01 18:00:00.000000', '2024-07-01 18:00:00.000000', '2024-07-01 18:20:00.000000'),
       (DEFAULT, 417, 'Employee 113 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-01 00:00:00.000000', '2024-07-01 00:00:00.000000', '2024-07-01 00:20:00.000000'),
       (DEFAULT, 418, 'Employee 115 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-01 00:00:00.000000', '2024-07-01 00:00:00.000000', '2024-07-01 00:20:00.000000'),
       (DEFAULT, 419, 'Employee 117 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-01 00:00:00.000000', '2024-07-01 00:00:00.000000', '2024-07-01 00:20:00.000000');

-- 2024-07-06 00:00:00.000000
-- 2024-07-10
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (32, 1, 121, NULL, 'Add delete task button', 'Add delete task button', NULL, 'LIGHT', 'FRONTEND', 'LOW', FALSE, '2024-07-06', '2024-07-10', '2024-07-10', '2024-07-06 00:00:00.000000', '2024-07-06 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (420, 32, 23, 'JOINED', '2024-07-06 00:00:00.000000', '2024-07-02T16:48'),
       (421, 32, 25, 'JOINED', '2024-07-06 00:00:00.000000', '2024-07-04T15:14:24'),
       (422, 32, 27, 'JOINED', '2024-07-06 00:00:00.000000', '2024-06-30T12:28:49'),
       (423, 32, 53, 'JOINED', '2024-07-06 00:00:00.000000', '2024-06-29T03:36'),
       (424, 32, 55, 'JOINED', '2024-07-06 00:00:00.000000', '2024-06-30T01:40:48'),
       (425, 32, 57, 'JOINED', '2024-07-06 00:00:00.000000', '2024-06-26T06:07:12');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 420, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-06 00:00:00.000000', '2024-07-06 00:00:00.000000', '2024-07-06 00:20:00.000000'),
       (DEFAULT, 421, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-06 00:00:00.000000', '2024-07-06 00:00:00.000000', '2024-07-06 00:20:00.000000'),
       (DEFAULT, 422, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-06 00:00:00.000000', '2024-07-06 00:00:00.000000', '2024-07-06 00:20:00.000000'),
       (DEFAULT, 423, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-06 00:00:00.000000', '2024-07-06 00:00:00.000000', '2024-07-06 00:20:00.000000'),
       (DEFAULT, 424, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-06 00:00:00.000000', '2024-07-06 00:00:00.000000', '2024-07-06 00:20:00.000000'),
       (DEFAULT, 425, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-06 00:00:00.000000', '2024-07-06 00:00:00.000000', '2024-07-06 00:20:00.000000');

-- 2024-07-11 00:00:00.000000
-- 2024-07-14
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (33, 1, 121, NULL, 'Implement jwt filter', 'Implement jwt filter', NULL, 'HARD', 'BACKEND', 'NORMAL', FALSE, '2024-07-11', '2024-07-14', '2024-07-14', '2024-07-11 00:00:00.000000', '2024-07-11 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (426, 33, 2, 'JOINED', '2024-07-11 00:00:00.000000', '2024-07-12T03:03:11'),
       (427, 33, 4, 'JOINED', '2024-07-11 00:00:00.000000', '2024-07-12T05:45:36'),
       (428, 33, 6, 'JOINED', '2024-07-11 00:00:00.000000', '2024-07-12T00:34:34'),
       (429, 33, 30, 'JOINED', '2024-07-11 00:00:00.000000', '2024-07-08T18:25:56'),
       (430, 33, 32, 'JOINED', '2024-07-11 00:00:00.000000', '2024-07-12T02:18:15'),
       (431, 33, 34, 'JOINED', '2024-07-11 00:00:00.000000', '2024-07-12T02:14:48'),
       (432, 33, 36, 'JOINED', '2024-07-11 00:00:00.000000', '2024-07-12T02:32:04'),
       (433, 33, 60, 'JOINED', '2024-07-11 00:00:00.000000', '2024-07-10T04:05:06');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 426, 'Employee 2 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-12 14:24:00.000000', '2024-07-12 14:24:00.000000', '2024-07-12 14:44:00.000000'),
       (DEFAULT, 427, 'Employee 4 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-12 14:24:00.000000', '2024-07-12 14:24:00.000000', '2024-07-12 14:44:00.000000'),
       (DEFAULT, 428, 'Employee 6 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-12 14:24:00.000000', '2024-07-12 14:24:00.000000', '2024-07-12 14:44:00.000000'),
       (DEFAULT, 429, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-11 04:48:00.000000', '2024-07-11 04:48:00.000000', '2024-07-11 05:08:00.000000'),
       (DEFAULT, 430, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-12 14:24:00.000000', '2024-07-12 14:24:00.000000', '2024-07-12 14:44:00.000000'),
       (DEFAULT, 431, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-12 14:24:00.000000', '2024-07-12 14:24:00.000000', '2024-07-12 14:44:00.000000'),
       (DEFAULT, 432, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-12 14:24:00.000000', '2024-07-12 14:24:00.000000', '2024-07-12 14:44:00.000000'),
       (DEFAULT, 433, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-11 04:48:00.000000', '2024-07-11 04:48:00.000000', '2024-07-11 05:08:00.000000');

-- 2024-07-15 00:00:00.000000
-- 2024-07-22
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (34, 1, 121, NULL, 'Add login endpoint', 'Add login endpoint', NULL, 'HARD', 'BACKEND', 'LOW', FALSE, '2024-07-15', '2024-07-22', '2024-07-22', '2024-07-15 00:00:00.000000', '2024-07-15 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (434, 34, 32, 'JOINED', '2024-07-15 00:00:00.000000', '2024-07-03T12:05:46'),
       (435, 34, 34, 'JOINED', '2024-07-15 00:00:00.000000', '2024-07-03T20:09:36'),
       (436, 34, 36, 'JOINED', '2024-07-15 00:00:00.000000', '2024-06-30T23:36:58');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 434, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-15 00:00:00.000000', '2024-07-15 00:00:00.000000', '2024-07-15 00:20:00.000000'),
       (DEFAULT, 435, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-15 00:00:00.000000', '2024-07-15 00:00:00.000000', '2024-07-15 00:20:00.000000'),
       (DEFAULT, 436, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-15 00:00:00.000000', '2024-07-15 00:00:00.000000', '2024-07-15 00:20:00.000000');

-- 2024-07-23 00:00:00.000000
-- 2024-07-29
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (35, 1, 121, NULL, 'Add register endpoint', 'Add register endpoint', NULL, 'ADVANCED', 'BACKEND', 'NORMAL', FALSE, '2024-07-23', '2024-07-29', '2024-07-29', '2024-07-23 00:00:00.000000', '2024-07-23 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (437, 35, 8, 'JOINED', '2024-07-23 00:00:00.000000', '2024-07-25T14:27:45'),
       (438, 35, 10, 'JOINED', '2024-07-23 00:00:00.000000', '2024-07-24T09:07:47'),
       (439, 35, 12, 'JOINED', '2024-07-23 00:00:00.000000', '2024-07-25T09:13:15'),
       (440, 35, 14, 'JOINED', '2024-07-23 00:00:00.000000', '2024-07-25T02:15:57'),
       (441, 35, 30, 'JOINED', '2024-07-23 00:00:00.000000', '2024-07-22T02:23:43'),
       (442, 35, 38, 'JOINED', '2024-07-23 00:00:00.000000', '2024-07-25T13:15:11'),
       (443, 35, 40, 'JOINED', '2024-07-23 00:00:00.000000', '2024-07-25T14:33:48'),
       (444, 35, 42, 'JOINED', '2024-07-23 00:00:00.000000', '2024-07-25T08:36:58'),
       (445, 35, 44, 'JOINED', '2024-07-23 00:00:00.000000', '2024-07-24T19:30:44'),
       (446, 35, 60, 'JOINED', '2024-07-23 00:00:00.000000', '2024-07-23T01:22:40');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 437, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-25 19:12:00.000000', '2024-07-25 19:12:00.000000', '2024-07-25 19:32:00.000000'),
       (DEFAULT, 438, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-25 19:12:00.000000', '2024-07-25 19:12:00.000000', '2024-07-25 19:32:00.000000'),
       (DEFAULT, 439, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-25 19:12:00.000000', '2024-07-25 19:12:00.000000', '2024-07-25 19:32:00.000000'),
       (DEFAULT, 440, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-25 19:12:00.000000', '2024-07-25 19:12:00.000000', '2024-07-25 19:32:00.000000'),
       (DEFAULT, 441, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-23 16:48:00.000000', '2024-07-23 16:48:00.000000', '2024-07-23 17:08:00.000000'),
       (DEFAULT, 442, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-25 19:12:00.000000', '2024-07-25 19:12:00.000000', '2024-07-25 19:32:00.000000'),
       (DEFAULT, 443, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-25 19:12:00.000000', '2024-07-25 19:12:00.000000', '2024-07-25 19:32:00.000000'),
       (DEFAULT, 444, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-25 19:12:00.000000', '2024-07-25 19:12:00.000000', '2024-07-25 19:32:00.000000'),
       (DEFAULT, 445, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-25 19:12:00.000000', '2024-07-25 19:12:00.000000', '2024-07-25 19:32:00.000000'),
       (DEFAULT, 446, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-23 16:48:00.000000', '2024-07-23 16:48:00.000000', '2024-07-23 17:08:00.000000');

-- 2024-07-30 00:00:00.000000
-- 2024-08-05
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (36, 1, 121, NULL, 'Add refresh token endpoint', 'Add refresh token endpoint', NULL, 'ADVANCED', 'BACKEND', 'LOW', FALSE, '2024-07-30', '2024-08-05', '2024-08-05', '2024-07-30 00:00:00.000000', '2024-07-30 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (447, 36, 38, 'JOINED', '2024-07-30 00:00:00.000000', '2024-07-18T21:53:17'),
       (448, 36, 40, 'JOINED', '2024-07-30 00:00:00.000000', '2024-07-21T11:12:29'),
       (449, 36, 42, 'JOINED', '2024-07-30 00:00:00.000000', '2024-07-18T18:31:41'),
       (450, 36, 44, 'JOINED', '2024-07-30 00:00:00.000000', '2024-07-18T09:37:27');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 447, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-30 00:00:00.000000', '2024-07-30 00:00:00.000000', '2024-07-30 00:20:00.000000'),
       (DEFAULT, 448, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-30 00:00:00.000000', '2024-07-30 00:00:00.000000', '2024-07-30 00:20:00.000000'),
       (DEFAULT, 449, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-30 00:00:00.000000', '2024-07-30 00:00:00.000000', '2024-07-30 00:20:00.000000'),
       (DEFAULT, 450, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-07-30 00:00:00.000000', '2024-07-30 00:00:00.000000', '2024-07-30 00:20:00.000000');

-- 2024-08-06 00:00:00.000000
-- 2024-08-11
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (37, 1, 121, NULL, 'Add create task endpoint', 'Add create task endpoint', NULL, 'NORMAL', 'BACKEND', 'NORMAL', FALSE, '2024-08-06', '2024-08-11', '2024-08-11', '2024-08-06 00:00:00.000000', '2024-08-06 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (451, 37, 16, 'JOINED', '2024-08-06 00:00:00.000000', '2024-08-06T17:15:05'),
       (452, 37, 18, 'JOINED', '2024-08-06 00:00:00.000000', '2024-08-06T22:52:02'),
       (453, 37, 20, 'JOINED', '2024-08-06 00:00:00.000000', '2024-08-07T11:44:27'),
       (454, 37, 46, 'JOINED', '2024-08-06 00:00:00.000000', '2024-08-07T04:29'),
       (455, 37, 48, 'JOINED', '2024-08-06 00:00:00.000000', '2024-08-08T04:19:47'),
       (456, 37, 50, 'JOINED', '2024-08-06 00:00:00.000000', '2024-08-06T23:02:24');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 451, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-08 09:36:00.000000', '2024-08-08 09:36:00.000000', '2024-08-08 09:56:00.000000'),
       (DEFAULT, 452, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-08 09:36:00.000000', '2024-08-08 09:36:00.000000', '2024-08-08 09:56:00.000000'),
       (DEFAULT, 453, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-08 09:36:00.000000', '2024-08-08 09:36:00.000000', '2024-08-08 09:56:00.000000'),
       (DEFAULT, 454, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-08 09:36:00.000000', '2024-08-08 09:36:00.000000', '2024-08-08 09:56:00.000000'),
       (DEFAULT, 455, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-08 09:36:00.000000', '2024-08-08 09:36:00.000000', '2024-08-08 09:56:00.000000'),
       (DEFAULT, 456, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-08 09:36:00.000000', '2024-08-08 09:36:00.000000', '2024-08-08 09:56:00.000000');

-- 2024-08-12 00:00:00.000000
-- 2024-08-17
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (38, 1, 121, NULL, 'Add update task endpoint', 'Add update task endpoint', NULL, 'NORMAL', 'BACKEND', 'LOW', FALSE, '2024-08-12', '2024-08-17', '2024-08-17', '2024-08-12 00:00:00.000000', '2024-08-12 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (457, 38, 46, 'JOINED', '2024-08-12 00:00:00.000000', '2024-08-04T19:03:22'),
       (458, 38, 48, 'JOINED', '2024-08-12 00:00:00.000000', '2024-08-03T07:46:34'),
       (459, 38, 50, 'JOINED', '2024-08-12 00:00:00.000000', '2024-08-02T03:41:46');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 457, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-12 00:00:00.000000', '2024-08-12 00:00:00.000000', '2024-08-12 00:20:00.000000'),
       (DEFAULT, 458, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-12 00:00:00.000000', '2024-08-12 00:00:00.000000', '2024-08-12 00:20:00.000000'),
       (DEFAULT, 459, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-12 00:00:00.000000', '2024-08-12 00:00:00.000000', '2024-08-12 00:20:00.000000');

-- 2024-08-18 00:00:00.000000
-- 2024-08-22
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (39, 1, 121, NULL, 'Add delete task endpoint', 'Add delete task endpoint', NULL, 'LIGHT', 'BACKEND', 'NORMAL', FALSE, '2024-08-18', '2024-08-22', '2024-08-22', '2024-08-18 00:00:00.000000', '2024-08-18 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (460, 39, 22, 'JOINED', '2024-08-18 00:00:00.000000', '2024-08-19T12:33:08'),
       (461, 39, 24, 'JOINED', '2024-08-18 00:00:00.000000', '2024-08-19T07:00:29'),
       (462, 39, 26, 'JOINED', '2024-08-18 00:00:00.000000', '2024-08-18T23:18:15'),
       (463, 39, 28, 'JOINED', '2024-08-18 00:00:00.000000', '2024-08-19T08:35:32'),
       (464, 39, 52, 'JOINED', '2024-08-18 00:00:00.000000', '2024-08-19T18:44:39'),
       (465, 39, 54, 'JOINED', '2024-08-18 00:00:00.000000', '2024-08-19T19:32:10'),
       (466, 39, 56, 'JOINED', '2024-08-18 00:00:00.000000', '2024-08-19T20:41:17'),
       (467, 39, 58, 'JOINED', '2024-08-18 00:00:00.000000', '2024-08-19T15:21:36');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 460, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-20 00:00:00.000000', '2024-08-20 00:00:00.000000', '2024-08-20 00:20:00.000000'),
       (DEFAULT, 461, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-20 00:00:00.000000', '2024-08-20 00:00:00.000000', '2024-08-20 00:20:00.000000'),
       (DEFAULT, 462, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-20 00:00:00.000000', '2024-08-20 00:00:00.000000', '2024-08-20 00:20:00.000000'),
       (DEFAULT, 463, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-20 00:00:00.000000', '2024-08-20 00:00:00.000000', '2024-08-20 00:20:00.000000'),
       (DEFAULT, 464, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-20 00:00:00.000000', '2024-08-20 00:00:00.000000', '2024-08-20 00:20:00.000000'),
       (DEFAULT, 465, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-20 00:00:00.000000', '2024-08-20 00:00:00.000000', '2024-08-20 00:20:00.000000'),
       (DEFAULT, 466, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-20 00:00:00.000000', '2024-08-20 00:00:00.000000', '2024-08-20 00:20:00.000000'),
       (DEFAULT, 467, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-20 00:00:00.000000', '2024-08-20 00:00:00.000000', '2024-08-20 00:20:00.000000');

-- 2024-08-23 00:00:00.000000
-- 2024-08-27
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (40, 1, 121, NULL, 'Add get task list endpoint', 'Add get task list endpoint', NULL, 'LIGHT', 'BACKEND', 'LOW', FALSE, '2024-08-23', '2024-08-27', '2024-08-27', '2024-08-23 00:00:00.000000', '2024-08-23 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (468, 40, 52, 'JOINED', '2024-08-23 00:00:00.000000', '2024-08-16T19:33:36'),
       (469, 40, 54, 'JOINED', '2024-08-23 00:00:00.000000', '2024-08-14T16:26:24'),
       (470, 40, 56, 'JOINED', '2024-08-23 00:00:00.000000', '2024-08-13T17:09:36'),
       (471, 40, 58, 'JOINED', '2024-08-23 00:00:00.000000', '2024-08-17T21:07:12'),
       (472, 40, 60, 'JOINED', '2024-08-23 00:00:00.000000', '2024-08-13T06:28:48');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 468, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-23 00:00:00.000000', '2024-08-23 00:00:00.000000', '2024-08-23 00:20:00.000000'),
       (DEFAULT, 469, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-23 00:00:00.000000', '2024-08-23 00:00:00.000000', '2024-08-23 00:20:00.000000'),
       (DEFAULT, 470, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-23 00:00:00.000000', '2024-08-23 00:00:00.000000', '2024-08-23 00:20:00.000000'),
       (DEFAULT, 471, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-23 00:00:00.000000', '2024-08-23 00:00:00.000000', '2024-08-23 00:20:00.000000'),
       (DEFAULT, 472, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-23 00:00:00.000000', '2024-08-23 00:00:00.000000', '2024-08-23 00:20:00.000000');

-- 2024-08-28 00:00:00.000000
-- 2024-08-31
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (41, 1, 121, NULL, 'Add edit task button', 'Add edit task button', NULL, 'HARD', 'FRONTEND', 'NORMAL', FALSE, '2024-08-28', '2024-08-31', '2024-08-31', '2024-08-28 00:00:00.000000', '2024-08-28 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (473, 41, 1, 'JOINED', '2024-08-28 00:00:00.000000', '2024-08-28T22:19:47'),
       (474, 41, 3, 'JOINED', '2024-08-28 00:00:00.000000', '2024-08-29T06:02:53'),
       (475, 41, 5, 'JOINED', '2024-08-28 00:00:00.000000', '2024-08-29T08:00:24'),
       (476, 41, 7, 'JOINED', '2024-08-28 00:00:00.000000', '2024-08-29T09:02:36'),
       (477, 41, 31, 'JOINED', '2024-08-28 00:00:00.000000', '2024-08-29T05:49:04'),
       (478, 41, 33, 'JOINED', '2024-08-28 00:00:00.000000', '2024-08-29T05:28:20'),
       (479, 41, 35, 'JOINED', '2024-08-28 00:00:00.000000', '2024-08-28T23:11:37'),
       (480, 41, 37, 'JOINED', '2024-08-28 00:00:00.000000', '2024-08-28T18:21:19');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 473, 'Employee 1 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-29 14:24:00.000000', '2024-08-29 14:24:00.000000', '2024-08-29 14:44:00.000000'),
       (DEFAULT, 474, 'Employee 3 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-29 14:24:00.000000', '2024-08-29 14:24:00.000000', '2024-08-29 14:44:00.000000'),
       (DEFAULT, 475, 'Employee 5 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-29 14:24:00.000000', '2024-08-29 14:24:00.000000', '2024-08-29 14:44:00.000000'),
       (DEFAULT, 476, 'Employee 7 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-29 14:24:00.000000', '2024-08-29 14:24:00.000000', '2024-08-29 14:44:00.000000'),
       (DEFAULT, 477, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-29 14:24:00.000000', '2024-08-29 14:24:00.000000', '2024-08-29 14:44:00.000000'),
       (DEFAULT, 478, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-29 14:24:00.000000', '2024-08-29 14:24:00.000000', '2024-08-29 14:44:00.000000'),
       (DEFAULT, 479, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-29 14:24:00.000000', '2024-08-29 14:24:00.000000', '2024-08-29 14:44:00.000000'),
       (DEFAULT, 480, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-08-29 14:24:00.000000', '2024-08-29 14:24:00.000000', '2024-08-29 14:44:00.000000');

-- 2024-09-01 00:00:00.000000
-- 2024-09-08
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (42, 1, 121, NULL, 'Add complete task button', 'Add complete task button', NULL, 'HARD', 'FRONTEND', 'LOW', FALSE, '2024-09-01', '2024-09-08', '2024-09-08', '2024-09-01 00:00:00.000000', '2024-09-01 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (481, 42, 31, 'JOINED', '2024-09-01 00:00:00.000000', '2024-08-23T09:47:32'),
       (482, 42, 33, 'JOINED', '2024-09-01 00:00:00.000000', '2024-08-21T17:16:48'),
       (483, 42, 35, 'JOINED', '2024-09-01 00:00:00.000000', '2024-08-18T18:25:56'),
       (484, 42, 37, 'JOINED', '2024-09-01 00:00:00.000000', '2024-08-20T23:13:56');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 481, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-01 00:00:00.000000', '2024-09-01 00:00:00.000000', '2024-09-01 00:20:00.000000'),
       (DEFAULT, 482, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-01 00:00:00.000000', '2024-09-01 00:00:00.000000', '2024-09-01 00:20:00.000000'),
       (DEFAULT, 483, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-01 00:00:00.000000', '2024-09-01 00:00:00.000000', '2024-09-01 00:20:00.000000'),
       (DEFAULT, 484, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-01 00:00:00.000000', '2024-09-01 00:00:00.000000', '2024-09-01 00:20:00.000000');

-- 2024-09-09 00:00:00.000000
-- 2024-09-15
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (43, 1, 121, NULL, 'Add restore task button', 'Add restore task button', NULL, 'ADVANCED', 'FRONTEND', 'NORMAL', FALSE, '2024-09-09', '2024-09-15', '2024-09-15', '2024-09-09 00:00:00.000000', '2024-09-09 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (485, 43, 9, 'JOINED', '2024-09-09 00:00:00.000000', '2024-09-11T02:34:05'),
       (486, 43, 11, 'JOINED', '2024-09-09 00:00:00.000000', '2024-09-11T07:12:18'),
       (487, 43, 13, 'JOINED', '2024-09-09 00:00:00.000000', '2024-09-11T15:04:02'),
       (488, 43, 39, 'JOINED', '2024-09-09 00:00:00.000000', '2024-09-10T16:53:29'),
       (489, 43, 41, 'JOINED', '2024-09-09 00:00:00.000000', '2024-09-11T02:52:14'),
       (490, 43, 43, 'JOINED', '2024-09-09 00:00:00.000000', '2024-09-10T01:58:23');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 485, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-11 19:12:00.000000', '2024-09-11 19:12:00.000000', '2024-09-11 19:32:00.000000'),
       (DEFAULT, 486, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-11 19:12:00.000000', '2024-09-11 19:12:00.000000', '2024-09-11 19:32:00.000000'),
       (DEFAULT, 487, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-11 19:12:00.000000', '2024-09-11 19:12:00.000000', '2024-09-11 19:32:00.000000'),
       (DEFAULT, 488, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-11 19:12:00.000000', '2024-09-11 19:12:00.000000', '2024-09-11 19:32:00.000000'),
       (DEFAULT, 489, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-11 19:12:00.000000', '2024-09-11 19:12:00.000000', '2024-09-11 19:32:00.000000'),
       (DEFAULT, 490, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-11 19:12:00.000000', '2024-09-11 19:12:00.000000', '2024-09-11 19:32:00.000000');

-- 2024-09-16 00:00:00.000000
-- 2024-09-22
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (44, 1, 121, NULL, 'Build deleted task page', 'Build deleted task page', NULL, 'ADVANCED', 'FRONTEND', 'LOW', FALSE, '2024-09-16', '2024-09-22', '2024-09-22', '2024-09-16 00:00:00.000000', '2024-09-16 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (491, 44, 39, 'JOINED', '2024-09-16 00:00:00.000000', '2024-09-04T02:44:10'),
       (492, 44, 41, 'JOINED', '2024-09-16 00:00:00.000000', '2024-09-05T06:27:22'),
       (493, 44, 43, 'JOINED', '2024-09-16 00:00:00.000000', '2024-09-03T00:51:51'),
       (494, 44, 59, 'JOINED', '2024-09-16 00:00:00.000000', '2024-09-06T00:25:56');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 491, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-16 00:00:00.000000', '2024-09-16 00:00:00.000000', '2024-09-16 00:20:00.000000'),
       (DEFAULT, 492, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-16 00:00:00.000000', '2024-09-16 00:00:00.000000', '2024-09-16 00:20:00.000000'),
       (DEFAULT, 493, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-16 00:00:00.000000', '2024-09-16 00:00:00.000000', '2024-09-16 00:20:00.000000'),
       (DEFAULT, 494, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-16 00:00:00.000000', '2024-09-16 00:00:00.000000', '2024-09-16 00:20:00.000000');

-- 2024-09-23 00:00:00.000000
-- 2024-09-28
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (45, 1, 121, NULL, 'Build task by status page', 'Build task by status page', NULL, 'NORMAL', 'FRONTEND', 'NORMAL', FALSE, '2024-09-23', '2024-09-28', '2024-09-28', '2024-09-23 00:00:00.000000', '2024-09-23 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (495, 45, 15, 'JOINED', '2024-09-23 00:00:00.000000', '2024-09-24T23:03:34'),
       (496, 45, 17, 'JOINED', '2024-09-23 00:00:00.000000', '2024-09-24T20:17:40'),
       (497, 45, 19, 'JOINED', '2024-09-23 00:00:00.000000', '2024-09-24T10:11:09'),
       (498, 45, 21, 'JOINED', '2024-09-23 00:00:00.000000', '2024-09-23T23:54:15'),
       (499, 45, 29, 'JOINED', '2024-09-23 00:00:00.000000', '2024-09-19T20:17:58'),
       (500, 45, 45, 'JOINED', '2024-09-23 00:00:00.000000', '2024-09-24T22:53:12'),
       (501, 45, 47, 'JOINED', '2024-09-23 00:00:00.000000', '2024-09-25T05:22'),
       (502, 45, 49, 'JOINED', '2024-09-23 00:00:00.000000', '2024-09-24T16:55:30'),
       (503, 45, 51, 'JOINED', '2024-09-23 00:00:00.000000', '2024-09-24T15:06:38'),
       (504, 45, 59, 'JOINED', '2024-09-23 00:00:00.000000', '2024-09-20T13:23:58');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 495, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-25 09:36:00.000000', '2024-09-25 09:36:00.000000', '2024-09-25 09:56:00.000000'),
       (DEFAULT, 496, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-25 09:36:00.000000', '2024-09-25 09:36:00.000000', '2024-09-25 09:56:00.000000'),
       (DEFAULT, 497, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-25 09:36:00.000000', '2024-09-25 09:36:00.000000', '2024-09-25 09:56:00.000000'),
       (DEFAULT, 498, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-25 09:36:00.000000', '2024-09-25 09:36:00.000000', '2024-09-25 09:56:00.000000'),
       (DEFAULT, 499, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-23 07:12:00.000000', '2024-09-23 07:12:00.000000', '2024-09-23 07:32:00.000000'),
       (DEFAULT, 500, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-25 09:36:00.000000', '2024-09-25 09:36:00.000000', '2024-09-25 09:56:00.000000'),
       (DEFAULT, 501, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-25 09:36:00.000000', '2024-09-25 09:36:00.000000', '2024-09-25 09:56:00.000000'),
       (DEFAULT, 502, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-25 09:36:00.000000', '2024-09-25 09:36:00.000000', '2024-09-25 09:56:00.000000'),
       (DEFAULT, 503, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-25 09:36:00.000000', '2024-09-25 09:36:00.000000', '2024-09-25 09:56:00.000000'),
       (DEFAULT, 504, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-23 07:12:00.000000', '2024-09-23 07:12:00.000000', '2024-09-23 07:32:00.000000');

-- 2024-09-29 00:00:00.000000
-- 2024-10-04
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (46, 1, 121, NULL, 'Build task by priority page', 'Build task by priority page', NULL, 'NORMAL', 'FRONTEND', 'LOW', FALSE, '2024-09-29', '2024-10-04', '2024-10-04', '2024-09-29 00:00:00.000000', '2024-09-29 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (505, 46, 45, 'JOINED', '2024-09-29 00:00:00.000000', '2024-09-18T11:25:27'),
       (506, 46, 47, 'JOINED', '2024-09-29 00:00:00.000000', '2024-09-18T09:41:46'),
       (507, 46, 49, 'JOINED', '2024-09-29 00:00:00.000000', '2024-09-18T14:00:58'),
       (508, 46, 51, 'JOINED', '2024-09-29 00:00:00.000000', '2024-09-19T06:00');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 505, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-29 00:00:00.000000', '2024-09-29 00:00:00.000000', '2024-09-29 00:20:00.000000'),
       (DEFAULT, 506, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-29 00:00:00.000000', '2024-09-29 00:00:00.000000', '2024-09-29 00:20:00.000000'),
       (DEFAULT, 507, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-29 00:00:00.000000', '2024-09-29 00:00:00.000000', '2024-09-29 00:20:00.000000'),
       (DEFAULT, 508, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-09-29 00:00:00.000000', '2024-09-29 00:00:00.000000', '2024-09-29 00:20:00.000000');

-- 2024-10-05 00:00:00.000000
-- 2024-10-09
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (47, 1, 121, NULL, 'Add status filter', 'Add status filter', NULL, 'LIGHT', 'FRONTEND', 'NORMAL', FALSE, '2024-10-05', '2024-10-09', '2024-10-09', '2024-10-05 00:00:00.000000', '2024-10-05 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (509, 47, 23, 'JOINED', '2024-10-05 00:00:00.000000', '2024-10-06T09:10:05'),
       (510, 47, 25, 'JOINED', '2024-10-05 00:00:00.000000', '2024-10-06T14:16:48'),
       (511, 47, 27, 'JOINED', '2024-10-05 00:00:00.000000', '2024-10-06T04:20:39'),
       (512, 47, 29, 'JOINED', '2024-10-05 00:00:00.000000', '2024-10-02T21:41:03'),
       (513, 47, 53, 'JOINED', '2024-10-05 00:00:00.000000', '2024-10-06T10:06:15'),
       (514, 47, 55, 'JOINED', '2024-10-05 00:00:00.000000', '2024-10-06T00:57:36'),
       (515, 47, 57, 'JOINED', '2024-10-05 00:00:00.000000', '2024-10-06T19:53:46'),
       (516, 47, 59, 'JOINED', '2024-10-05 00:00:00.000000', '2024-10-04T05:06:44');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 509, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-07 00:00:00.000000', '2024-10-07 00:00:00.000000', '2024-10-07 00:20:00.000000'),
       (DEFAULT, 510, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-07 00:00:00.000000', '2024-10-07 00:00:00.000000', '2024-10-07 00:20:00.000000'),
       (DEFAULT, 511, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-07 00:00:00.000000', '2024-10-07 00:00:00.000000', '2024-10-07 00:20:00.000000'),
       (DEFAULT, 512, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-05 12:00:00.000000', '2024-10-05 12:00:00.000000', '2024-10-05 12:20:00.000000'),
       (DEFAULT, 513, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-07 00:00:00.000000', '2024-10-07 00:00:00.000000', '2024-10-07 00:20:00.000000'),
       (DEFAULT, 514, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-07 00:00:00.000000', '2024-10-07 00:00:00.000000', '2024-10-07 00:20:00.000000'),
       (DEFAULT, 515, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-07 00:00:00.000000', '2024-10-07 00:00:00.000000', '2024-10-07 00:20:00.000000'),
       (DEFAULT, 516, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-05 12:00:00.000000', '2024-10-05 12:00:00.000000', '2024-10-05 12:20:00.000000');

-- 2024-10-10 00:00:00.000000
-- 2024-10-14
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (48, 1, 121, NULL, 'Add priority filter', 'Add priority filter', NULL, 'LIGHT', 'FRONTEND', 'LOW', FALSE, '2024-10-10', '2024-10-14', '2024-10-14', '2024-10-10 00:00:00.000000', '2024-10-10 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (517, 48, 53, 'JOINED', '2024-10-10 00:00:00.000000', '2024-10-01T20:24'),
       (518, 48, 55, 'JOINED', '2024-10-10 00:00:00.000000', '2024-10-01T15:57:36'),
       (519, 48, 57, 'JOINED', '2024-10-10 00:00:00.000000', '2024-10-01T10:26:24');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 517, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-10 00:00:00.000000', '2024-10-10 00:00:00.000000', '2024-10-10 00:20:00.000000'),
       (DEFAULT, 518, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-10 00:00:00.000000', '2024-10-10 00:00:00.000000', '2024-10-10 00:20:00.000000'),
       (DEFAULT, 519, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-10 00:00:00.000000', '2024-10-10 00:00:00.000000', '2024-10-10 00:20:00.000000');

-- 2024-10-15 00:00:00.000000
-- 2024-10-18
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (49, 1, 121, NULL, 'Add get task detail endpoint', 'Add get task detail endpoint', NULL, 'HARD', 'BACKEND', 'NORMAL', FALSE, '2024-10-15', '2024-10-18', '2024-10-18', '2024-10-15 00:00:00.000000', '2024-10-15 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (520, 49, 2, 'JOINED', '2024-10-15 00:00:00.000000', '2024-10-16T03:10:24'),
       (521, 49, 4, 'JOINED', '2024-10-15 00:00:00.000000', '2024-10-15T17:07:37'),
       (522, 49, 6, 'JOINED', '2024-10-15 00:00:00.000000', '2024-10-15T19:18:39'),
       (523, 49, 30, 'JOINED', '2024-10-15 00:00:00.000000', '2024-10-13T12:46:05'),
       (524, 49, 32, 'JOINED', '2024-10-15 00:00:00.000000', '2024-10-16T00:21:55'),
       (525, 49, 34, 'JOINED', '2024-10-15 00:00:00.000000', '2024-10-15T06:49:51'),
       (526, 49, 36, 'JOINED', '2024-10-15 00:00:00.000000', '2024-10-15T23:33:14'),
       (527, 49, 60, 'JOINED', '2024-10-15 00:00:00.000000', '2024-10-13T09:18:44');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 520, 'Employee 2 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-16 09:36:01.000000', '2024-10-16 09:36:01.000000', '2024-10-16 09:56:01.000000'),
       (DEFAULT, 521, 'Employee 4 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-16 09:36:01.000000', '2024-10-16 09:36:01.000000', '2024-10-16 09:56:01.000000'),
       (DEFAULT, 522, 'Employee 6 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-16 09:36:01.000000', '2024-10-16 09:36:01.000000', '2024-10-16 09:56:01.000000'),
       (DEFAULT, 523, 'Employee 30 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-15 00:00:00.000000', '2024-10-15 00:00:00.000000', '2024-10-15 00:20:00.000000'),
       (DEFAULT, 524, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-16 09:36:01.000000', '2024-10-16 09:36:01.000000', '2024-10-16 09:56:01.000000'),
       (DEFAULT, 525, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-16 09:36:01.000000', '2024-10-16 09:36:01.000000', '2024-10-16 09:56:01.000000'),
       (DEFAULT, 526, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-16 09:36:01.000000', '2024-10-16 09:36:01.000000', '2024-10-16 09:56:01.000000'),
       (DEFAULT, 527, 'Employee 60 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-15 00:00:00.000000', '2024-10-15 00:00:00.000000', '2024-10-15 00:20:00.000000');

-- 2024-10-19 00:00:00.000000
-- 2024-10-26
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (50, 1, 121, NULL, 'Add restore task endpoint', 'Add restore task endpoint', NULL, 'HARD', 'BACKEND', 'LOW', FALSE, '2024-10-19', '2024-10-26', '2024-10-26', '2024-10-19 00:00:00.000000', '2024-10-19 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (528, 50, 32, 'JOINED', '2024-10-19 00:00:00.000000', '2024-10-09T01:20:39'),
       (529, 50, 34, 'JOINED', '2024-10-19 00:00:00.000000', '2024-10-08T23:02:24'),
       (530, 50, 36, 'JOINED', '2024-10-19 00:00:00.000000', '2024-10-04T01:09:08');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 528, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-19 00:00:00.000000', '2024-10-19 00:00:00.000000', '2024-10-19 00:20:00.000000'),
       (DEFAULT, 529, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-19 00:00:00.000000', '2024-10-19 00:00:00.000000', '2024-10-19 00:20:00.000000'),
       (DEFAULT, 530, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-19 00:00:00.000000', '2024-10-19 00:00:00.000000', '2024-10-19 00:20:00.000000');

-- 2024-10-27 00:00:00.000000
-- 2024-11-02
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (51, 1, 121, NULL, 'Add mark complete endpoint', 'Add mark complete endpoint', NULL, 'ADVANCED', 'BACKEND', 'NORMAL', FALSE, '2024-10-27', '2024-11-02', '2024-11-02', '2024-10-27 00:00:00.000000', '2024-10-27 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (531, 51, 8, 'JOINED', '2024-10-27 00:00:00.000000', '2024-10-29T06:52:08'),
       (532, 51, 10, 'JOINED', '2024-10-27 00:00:00.000000', '2024-10-29T00:12:28'),
       (533, 51, 12, 'JOINED', '2024-10-27 00:00:00.000000', '2024-10-27T23:05:30'),
       (534, 51, 14, 'JOINED', '2024-10-27 00:00:00.000000', '2024-10-28T20:36:15'),
       (535, 51, 38, 'JOINED', '2024-10-27 00:00:00.000000', '2024-10-29T01:44:12'),
       (536, 51, 40, 'JOINED', '2024-10-27 00:00:00.000000', '2024-10-27T20:41:22'),
       (537, 51, 42, 'JOINED', '2024-10-27 00:00:00.000000', '2024-10-27T15:59:37'),
       (538, 51, 44, 'JOINED', '2024-10-27 00:00:00.000000', '2024-10-27T12:36:31');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 531, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-29 10:48:00.000000', '2024-10-29 10:48:00.000000', '2024-10-29 11:08:00.000000'),
       (DEFAULT, 532, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-29 10:48:00.000000', '2024-10-29 10:48:00.000000', '2024-10-29 11:08:00.000000'),
       (DEFAULT, 533, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-29 10:48:00.000000', '2024-10-29 10:48:00.000000', '2024-10-29 11:08:00.000000'),
       (DEFAULT, 534, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-29 10:48:00.000000', '2024-10-29 10:48:00.000000', '2024-10-29 11:08:00.000000'),
       (DEFAULT, 535, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-29 10:48:00.000000', '2024-10-29 10:48:00.000000', '2024-10-29 11:08:00.000000'),
       (DEFAULT, 536, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-29 10:48:00.000000', '2024-10-29 10:48:00.000000', '2024-10-29 11:08:00.000000'),
       (DEFAULT, 537, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-29 10:48:00.000000', '2024-10-29 10:48:00.000000', '2024-10-29 11:08:00.000000'),
       (DEFAULT, 538, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-10-29 10:48:00.000000', '2024-10-29 10:48:00.000000', '2024-10-29 11:08:00.000000');

-- 2024-11-03 00:00:00.000000
-- 2024-11-09
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (52, 1, 121, NULL, 'Add filter tasks endpoint', 'Add filter tasks endpoint', NULL, 'ADVANCED', 'BACKEND', 'LOW', FALSE, '2024-11-03', '2024-11-09', '2024-11-09', '2024-11-03 00:00:00.000000', '2024-11-03 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (539, 52, 38, 'JOINED', '2024-11-03 00:00:00.000000', '2024-10-22T11:58:34'),
       (540, 52, 40, 'JOINED', '2024-11-03 00:00:00.000000', '2024-10-22T22:23:32'),
       (541, 52, 42, 'JOINED', '2024-11-03 00:00:00.000000', '2024-10-26T04:10:34'),
       (542, 52, 44, 'JOINED', '2024-11-03 00:00:00.000000', '2024-10-26T20:48:29');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 539, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-03 00:00:00.000000', '2024-11-03 00:00:00.000000', '2024-11-03 00:20:00.000000'),
       (DEFAULT, 540, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-03 00:00:00.000000', '2024-11-03 00:00:00.000000', '2024-11-03 00:20:00.000000'),
       (DEFAULT, 541, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-03 00:00:00.000000', '2024-11-03 00:00:00.000000', '2024-11-03 00:20:00.000000'),
       (DEFAULT, 542, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-03 00:00:00.000000', '2024-11-03 00:00:00.000000', '2024-11-03 00:20:00.000000');

-- 2024-11-10 00:00:00.000000
-- 2024-11-15
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (53, 1, 121, NULL, 'Add search tasks endpoint', 'Add search tasks endpoint', NULL, 'NORMAL', 'BACKEND', 'NORMAL', FALSE, '2024-11-10', '2024-11-15', '2024-11-15', '2024-11-10 00:00:00.000000', '2024-11-10 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (543, 53, 16, 'JOINED', '2024-11-10 00:00:00.000000', '2024-11-11T22:50:36'),
       (544, 53, 18, 'JOINED', '2024-11-10 00:00:00.000000', '2024-11-11T04:18:38'),
       (545, 53, 20, 'JOINED', '2024-11-10 00:00:00.000000', '2024-11-11T10:51:45'),
       (546, 53, 46, 'JOINED', '2024-11-10 00:00:00.000000', '2024-11-11T09:27:31'),
       (547, 53, 48, 'JOINED', '2024-11-10 00:00:00.000000', '2024-11-10T16:36:38'),
       (548, 53, 50, 'JOINED', '2024-11-10 00:00:00.000000', '2024-11-11T10:01:12');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 543, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-12 02:24:00.000000', '2024-11-12 02:24:00.000000', '2024-11-12 02:44:00.000000'),
       (DEFAULT, 544, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-12 02:24:00.000000', '2024-11-12 02:24:00.000000', '2024-11-12 02:44:00.000000'),
       (DEFAULT, 545, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-12 02:24:00.000000', '2024-11-12 02:24:00.000000', '2024-11-12 02:44:00.000000'),
       (DEFAULT, 546, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-12 02:24:00.000000', '2024-11-12 02:24:00.000000', '2024-11-12 02:44:00.000000'),
       (DEFAULT, 547, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-12 02:24:00.000000', '2024-11-12 02:24:00.000000', '2024-11-12 02:44:00.000000'),
       (DEFAULT, 548, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-12 02:24:00.000000', '2024-11-12 02:24:00.000000', '2024-11-12 02:44:00.000000');

-- 2024-11-16 00:00:00.000000
-- 2024-11-21
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (54, 1, 121, NULL, 'Add sort tasks endpoint', 'Add sort tasks endpoint', NULL, 'NORMAL', 'BACKEND', 'LOW', FALSE, '2024-11-16', '2024-11-21', '2024-11-21', '2024-11-16 00:00:00.000000', '2024-11-16 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (549, 54, 46, 'JOINED', '2024-11-16 00:00:00.000000', '2024-11-04T23:45:36'),
       (550, 54, 48, 'JOINED', '2024-11-16 00:00:00.000000', '2024-11-06T05:42:44'),
       (551, 54, 50, 'JOINED', '2024-11-16 00:00:00.000000', '2024-11-05T18:02:53');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 549, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-16 00:00:00.000000', '2024-11-16 00:00:00.000000', '2024-11-16 00:20:00.000000'),
       (DEFAULT, 550, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-16 00:00:00.000000', '2024-11-16 00:00:00.000000', '2024-11-16 00:20:00.000000'),
       (DEFAULT, 551, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-16 00:00:00.000000', '2024-11-16 00:00:00.000000', '2024-11-16 00:20:00.000000');

-- 2024-11-22 00:00:00.000000
-- 2024-11-26
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (55, 1, 121, NULL, 'Implement soft delete logic', 'Implement soft delete logic', NULL, 'LIGHT', 'BACKEND', 'NORMAL', FALSE, '2024-11-22', '2024-11-26', '2024-11-26', '2024-11-22 00:00:00.000000', '2024-11-22 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (552, 55, 22, 'JOINED', '2024-11-22 00:00:00.000000', '2024-11-23T06:36:44'),
       (553, 55, 24, 'JOINED', '2024-11-22 00:00:00.000000', '2024-11-23T04:58:27'),
       (554, 55, 26, 'JOINED', '2024-11-22 00:00:00.000000', '2024-11-23T05:35:53'),
       (555, 55, 28, 'JOINED', '2024-11-22 00:00:00.000000', '2024-11-23T05:45:15'),
       (556, 55, 52, 'JOINED', '2024-11-22 00:00:00.000000', '2024-11-22T17:58:34'),
       (557, 55, 54, 'JOINED', '2024-11-22 00:00:00.000000', '2024-11-23T11:40:56'),
       (558, 55, 56, 'JOINED', '2024-11-22 00:00:00.000000', '2024-11-23T01:41:53'),
       (559, 55, 58, 'JOINED', '2024-11-22 00:00:00.000000', '2024-11-23T12:55:48');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 552, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-23 18:00:00.000000', '2024-11-23 18:00:00.000000', '2024-11-23 18:20:00.000000'),
       (DEFAULT, 553, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-23 18:00:00.000000', '2024-11-23 18:00:00.000000', '2024-11-23 18:20:00.000000'),
       (DEFAULT, 554, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-23 18:00:00.000000', '2024-11-23 18:00:00.000000', '2024-11-23 18:20:00.000000'),
       (DEFAULT, 555, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-23 18:00:00.000000', '2024-11-23 18:00:00.000000', '2024-11-23 18:20:00.000000'),
       (DEFAULT, 556, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-23 18:00:00.000000', '2024-11-23 18:00:00.000000', '2024-11-23 18:20:00.000000'),
       (DEFAULT, 557, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-23 18:00:00.000000', '2024-11-23 18:00:00.000000', '2024-11-23 18:20:00.000000'),
       (DEFAULT, 558, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-23 18:00:00.000000', '2024-11-23 18:00:00.000000', '2024-11-23 18:20:00.000000'),
       (DEFAULT, 559, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-23 18:00:00.000000', '2024-11-23 18:00:00.000000', '2024-11-23 18:20:00.000000');

-- 2024-11-27 00:00:00.000000
-- 2024-12-01
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (56, 1, 121, NULL, 'Add pagination support', 'Add pagination support', NULL, 'LIGHT', 'BACKEND', 'LOW', FALSE, '2024-11-27', '2024-12-01', '2024-12-01', '2024-11-27 00:00:00.000000', '2024-11-27 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (560, 56, 52, 'JOINED', '2024-11-27 00:00:00.000000', '2024-11-19T22:55:12'),
       (561, 56, 54, 'JOINED', '2024-11-27 00:00:00.000000', '2024-11-19T03:36'),
       (562, 56, 56, 'JOINED', '2024-11-27 00:00:00.000000', '2024-11-18T01:40:48'),
       (563, 56, 58, 'JOINED', '2024-11-27 00:00:00.000000', '2024-11-19T00:28:48');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 560, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-27 00:00:00.000000', '2024-11-27 00:00:00.000000', '2024-11-27 00:20:00.000000'),
       (DEFAULT, 561, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-27 00:00:00.000000', '2024-11-27 00:00:00.000000', '2024-11-27 00:20:00.000000'),
       (DEFAULT, 562, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-27 00:00:00.000000', '2024-11-27 00:00:00.000000', '2024-11-27 00:20:00.000000'),
       (DEFAULT, 563, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-11-27 00:00:00.000000', '2024-11-27 00:00:00.000000', '2024-11-27 00:20:00.000000');

-- 2024-12-02 00:00:00.000000
-- 2024-12-05
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (57, 1, 121, NULL, 'Add created time filter', 'Add created time filter', NULL, 'HARD', 'FRONTEND', 'NORMAL', FALSE, '2024-12-02', '2024-12-05', '2024-12-05', '2024-12-02 00:00:00.000000', '2024-12-02 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (564, 57, 1, 'JOINED', '2024-12-02 00:00:00.000000', '2024-12-03T01:51:46'),
       (565, 57, 3, 'JOINED', '2024-12-02 00:00:00.000000', '2024-12-03T00:18:10'),
       (566, 57, 5, 'JOINED', '2024-12-02 00:00:00.000000', '2024-12-02T15:04:03'),
       (567, 57, 7, 'JOINED', '2024-12-02 00:00:00.000000', '2024-12-03T03:32:51'),
       (568, 57, 31, 'JOINED', '2024-12-02 00:00:00.000000', '2024-12-02T14:52:49'),
       (569, 57, 33, 'JOINED', '2024-12-02 00:00:00.000000', '2024-12-03T00:44:23'),
       (570, 57, 35, 'JOINED', '2024-12-02 00:00:00.000000', '2024-12-02T18:15'),
       (571, 57, 37, 'JOINED', '2024-12-02 00:00:00.000000', '2024-12-02T21:59:38');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 564, 'Employee 1 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-03 09:36:01.000000', '2024-12-03 09:36:01.000000', '2024-12-03 09:56:01.000000'),
       (DEFAULT, 565, 'Employee 3 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-03 09:36:01.000000', '2024-12-03 09:36:01.000000', '2024-12-03 09:56:01.000000'),
       (DEFAULT, 566, 'Employee 5 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-03 09:36:01.000000', '2024-12-03 09:36:01.000000', '2024-12-03 09:56:01.000000'),
       (DEFAULT, 567, 'Employee 7 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-03 09:36:01.000000', '2024-12-03 09:36:01.000000', '2024-12-03 09:56:01.000000'),
       (DEFAULT, 568, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-03 09:36:01.000000', '2024-12-03 09:36:01.000000', '2024-12-03 09:56:01.000000'),
       (DEFAULT, 569, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-03 09:36:01.000000', '2024-12-03 09:36:01.000000', '2024-12-03 09:56:01.000000'),
       (DEFAULT, 570, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-03 09:36:01.000000', '2024-12-03 09:36:01.000000', '2024-12-03 09:56:01.000000'),
       (DEFAULT, 571, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-03 09:36:01.000000', '2024-12-03 09:36:01.000000', '2024-12-03 09:56:01.000000');

-- 2024-12-06 00:00:00.000000
-- 2024-12-13
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (58, 1, 121, NULL, 'Add task search bar', 'Add task search bar', NULL, 'HARD', 'FRONTEND', 'LOW', FALSE, '2024-12-06', '2024-12-13', '2024-12-13', '2024-12-06 00:00:00.000000', '2024-12-06 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (572, 58, 31, 'JOINED', '2024-12-06 00:00:00.000000', '2024-11-20T23:48:29'),
       (573, 58, 33, 'JOINED', '2024-12-06 00:00:00.000000', '2024-11-27T18:02:53'),
       (574, 58, 35, 'JOINED', '2024-12-06 00:00:00.000000', '2024-11-25T17:51:22'),
       (575, 58, 37, 'JOINED', '2024-12-06 00:00:00.000000', '2024-11-24T03:15:51');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 572, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-06 00:00:00.000000', '2024-12-06 00:00:00.000000', '2024-12-06 00:20:00.000000'),
       (DEFAULT, 573, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-06 00:00:00.000000', '2024-12-06 00:00:00.000000', '2024-12-06 00:20:00.000000'),
       (DEFAULT, 574, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-06 00:00:00.000000', '2024-12-06 00:00:00.000000', '2024-12-06 00:20:00.000000'),
       (DEFAULT, 575, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-06 00:00:00.000000', '2024-12-06 00:00:00.000000', '2024-12-06 00:20:00.000000');

-- 2024-12-14 00:00:00.000000
-- 2024-12-20
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (59, 1, 121, NULL, 'Sort tasks by deadline', 'Sort tasks by deadline', NULL, 'ADVANCED', 'FRONTEND', 'NORMAL', FALSE, '2024-12-14', '2024-12-20', '2024-12-20', '2024-12-14 00:00:00.000000', '2024-12-14 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (576, 59, 9, 'JOINED', '2024-12-14 00:00:00.000000', '2024-12-15T20:10:02'),
       (577, 59, 11, 'JOINED', '2024-12-14 00:00:00.000000', '2024-12-14T08:14:26'),
       (578, 59, 13, 'JOINED', '2024-12-14 00:00:00.000000', '2024-12-15T05:51:44'),
       (579, 59, 39, 'JOINED', '2024-12-14 00:00:00.000000', '2024-12-15T23:39:42'),
       (580, 59, 41, 'JOINED', '2024-12-14 00:00:00.000000', '2024-12-16T02:43:10'),
       (581, 59, 43, 'JOINED', '2024-12-14 00:00:00.000000', '2024-12-15T16:14:10');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 576, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-16 10:48:00.000000', '2024-12-16 10:48:00.000000', '2024-12-16 11:08:00.000000'),
       (DEFAULT, 577, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-16 10:48:00.000000', '2024-12-16 10:48:00.000000', '2024-12-16 11:08:00.000000'),
       (DEFAULT, 578, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-16 10:48:00.000000', '2024-12-16 10:48:00.000000', '2024-12-16 11:08:00.000000'),
       (DEFAULT, 579, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-16 10:48:00.000000', '2024-12-16 10:48:00.000000', '2024-12-16 11:08:00.000000'),
       (DEFAULT, 580, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-16 10:48:00.000000', '2024-12-16 10:48:00.000000', '2024-12-16 11:08:00.000000'),
       (DEFAULT, 581, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-16 10:48:00.000000', '2024-12-16 10:48:00.000000', '2024-12-16 11:08:00.000000');

-- 2024-12-21 00:00:00.000000
-- 2024-12-27
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (60, 1, 121, NULL, 'Sort tasks by priority', 'Sort tasks by priority', NULL, 'ADVANCED', 'FRONTEND', 'LOW', FALSE, '2024-12-21', '2024-12-27', '2024-12-27', '2024-12-21 00:00:00.000000', '2024-12-21 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (582, 60, 39, 'JOINED', '2024-12-21 00:00:00.000000', '2024-12-12T20:47:03'),
       (583, 60, 41, 'JOINED', '2024-12-21 00:00:00.000000', '2024-12-11T02:36:58'),
       (584, 60, 43, 'JOINED', '2024-12-21 00:00:00.000000', '2024-12-10T14:11:03');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 582, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-21 00:00:00.000000', '2024-12-21 00:00:00.000000', '2024-12-21 00:20:00.000000'),
       (DEFAULT, 583, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-21 00:00:00.000000', '2024-12-21 00:00:00.000000', '2024-12-21 00:20:00.000000'),
       (DEFAULT, 584, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-21 00:00:00.000000', '2024-12-21 00:00:00.000000', '2024-12-21 00:20:00.000000');

-- 2024-12-28 00:00:00.000000
-- 2025-01-02
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (61, 1, 121, NULL, 'Add task status badge', 'Add task status badge', NULL, 'NORMAL', 'FRONTEND', 'NORMAL', FALSE, '2024-12-28', '2025-01-02', '2025-01-02', '2024-12-28 00:00:00.000000', '2024-12-28 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (585, 61, 15, 'JOINED', '2024-12-28 00:00:00.000000', '2024-12-28T16:36:38'),
       (586, 61, 17, 'JOINED', '2024-12-28 00:00:00.000000', '2024-12-29T17:02:24'),
       (587, 61, 19, 'JOINED', '2024-12-28 00:00:00.000000', '2024-12-28T17:04:43'),
       (588, 61, 21, 'JOINED', '2024-12-28 00:00:00.000000', '2024-12-29T11:47:55'),
       (589, 61, 29, 'JOINED', '2024-12-28 00:00:00.000000', '2024-12-27T09:18:44'),
       (590, 61, 45, 'JOINED', '2024-12-28 00:00:00.000000', '2024-12-29T05:26:01'),
       (591, 61, 47, 'JOINED', '2024-12-28 00:00:00.000000', '2024-12-28T22:19:12'),
       (592, 61, 49, 'JOINED', '2024-12-28 00:00:00.000000', '2024-12-29T06:44:39'),
       (593, 61, 51, 'JOINED', '2024-12-28 00:00:00.000000', '2024-12-29T16:39:57'),
       (594, 61, 59, 'JOINED', '2024-12-28 00:00:00.000000', '2024-12-25T06:11:32');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 585, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-30 02:24:00.000000', '2024-12-30 02:24:00.000000', '2024-12-30 02:44:00.000000'),
       (DEFAULT, 586, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-30 02:24:00.000000', '2024-12-30 02:24:00.000000', '2024-12-30 02:44:00.000000'),
       (DEFAULT, 587, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-30 02:24:00.000000', '2024-12-30 02:24:00.000000', '2024-12-30 02:44:00.000000'),
       (DEFAULT, 588, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-30 02:24:00.000000', '2024-12-30 02:24:00.000000', '2024-12-30 02:44:00.000000'),
       (DEFAULT, 589, 'Employee 29 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-28 00:00:00.000000', '2024-12-28 00:00:00.000000', '2024-12-28 00:20:00.000000'),
       (DEFAULT, 590, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-30 02:24:00.000000', '2024-12-30 02:24:00.000000', '2024-12-30 02:44:00.000000'),
       (DEFAULT, 591, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-30 02:24:00.000000', '2024-12-30 02:24:00.000000', '2024-12-30 02:44:00.000000'),
       (DEFAULT, 592, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-30 02:24:00.000000', '2024-12-30 02:24:00.000000', '2024-12-30 02:44:00.000000'),
       (DEFAULT, 593, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-30 02:24:00.000000', '2024-12-30 02:24:00.000000', '2024-12-30 02:44:00.000000'),
       (DEFAULT, 594, 'Employee 59 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-12-28 00:00:00.000000', '2024-12-28 00:00:00.000000', '2024-12-28 00:20:00.000000');

-- 2025-01-03 00:00:00.000000
-- 2025-01-08
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (62, 1, 121, NULL, 'User list interface', 'User list interface', NULL, 'NORMAL', 'FRONTEND', 'LOW', FALSE, '2025-01-03', '2025-01-08', '2025-01-08', '2025-01-03 00:00:00.000000', '2025-01-03 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (595, 62, 45, 'JOINED', '2025-01-03 00:00:00.000000', '2024-12-26T21:47:32'),
       (596, 62, 47, 'JOINED', '2025-01-03 00:00:00.000000', '2024-12-22T07:37:56'),
       (597, 62, 49, 'JOINED', '2025-01-03 00:00:00.000000', '2024-12-27T13:37:56'),
       (598, 62, 51, 'JOINED', '2025-01-03 00:00:00.000000', '2024-12-24T16:13:27');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 595, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-03 00:00:00.000000', '2025-01-03 00:00:00.000000', '2025-01-03 00:20:00.000000'),
       (DEFAULT, 596, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-03 00:00:00.000000', '2025-01-03 00:00:00.000000', '2025-01-03 00:20:00.000000'),
       (DEFAULT, 597, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-03 00:00:00.000000', '2025-01-03 00:00:00.000000', '2025-01-03 00:20:00.000000'),
       (DEFAULT, 598, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-03 00:00:00.000000', '2025-01-03 00:00:00.000000', '2025-01-03 00:20:00.000000');

-- 2025-01-09 00:00:00.000000
-- 2025-01-13
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (63, 1, 121, NULL, 'User update interface', 'User update interface', NULL, 'LIGHT', 'FRONTEND', 'NORMAL', FALSE, '2025-01-09', '2025-01-13', '2025-01-13', '2025-01-09 00:00:00.000000', '2025-01-09 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (599, 63, 23, 'JOINED', '2025-01-09 00:00:00.000000', '2025-01-10T03:57:36'),
       (600, 63, 25, 'JOINED', '2025-01-09 00:00:00.000000', '2025-01-09T16:15:36'),
       (601, 63, 27, 'JOINED', '2025-01-09 00:00:00.000000', '2025-01-10T10:35:24'),
       (602, 63, 53, 'JOINED', '2025-01-09 00:00:00.000000', '2025-01-10T09:43:56'),
       (603, 63, 55, 'JOINED', '2025-01-09 00:00:00.000000', '2025-01-10T02:42:44'),
       (604, 63, 57, 'JOINED', '2025-01-09 00:00:00.000000', '2025-01-10T07:14:10');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 599, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-10 18:00:00.000000', '2025-01-10 18:00:00.000000', '2025-01-10 18:20:00.000000'),
       (DEFAULT, 600, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-10 18:00:00.000000', '2025-01-10 18:00:00.000000', '2025-01-10 18:20:00.000000'),
       (DEFAULT, 601, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-10 18:00:00.000000', '2025-01-10 18:00:00.000000', '2025-01-10 18:20:00.000000'),
       (DEFAULT, 602, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-10 18:00:00.000000', '2025-01-10 18:00:00.000000', '2025-01-10 18:20:00.000000'),
       (DEFAULT, 603, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-10 18:00:00.000000', '2025-01-10 18:00:00.000000', '2025-01-10 18:20:00.000000'),
       (DEFAULT, 604, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-10 18:00:00.000000', '2025-01-10 18:00:00.000000', '2025-01-10 18:20:00.000000');

-- 2025-01-14 00:00:00.000000
-- 2025-01-18
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (64, 1, 121, NULL, 'Password change screen', 'Password change screen', NULL, 'LIGHT', 'FRONTEND', 'LOW', FALSE, '2025-01-14', '2025-01-18', '2025-01-18', '2025-01-14 00:00:00.000000', '2025-01-14 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (605, 64, 53, 'JOINED', '2025-01-14 00:00:00.000000', '2025-01-07T16:04:48'),
       (606, 64, 55, 'JOINED', '2025-01-14 00:00:00.000000', '2025-01-06T22:04:48'),
       (607, 64, 57, 'JOINED', '2025-01-14 00:00:00.000000', '2025-01-04T21:57:36');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 605, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-14 00:00:00.000000', '2025-01-14 00:00:00.000000', '2025-01-14 00:20:00.000000'),
       (DEFAULT, 606, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-14 00:00:00.000000', '2025-01-14 00:00:00.000000', '2025-01-14 00:20:00.000000'),
       (DEFAULT, 607, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-14 00:00:00.000000', '2025-01-14 00:00:00.000000', '2025-01-14 00:20:00.000000');

-- 2025-01-19 00:00:00.000000
-- 2025-01-22
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (65, 1, 121, NULL, 'Add role based security', 'Add role based security', NULL, 'HARD', 'BACKEND', 'NORMAL', FALSE, '2025-01-19', '2025-01-22', '2025-01-22', '2025-01-19 00:00:00.000000', '2025-01-19 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (608, 65, 2, 'JOINED', '2025-01-19 00:00:00.000000', '2025-01-19T09:14:42'),
       (609, 65, 4, 'JOINED', '2025-01-19 00:00:00.000000', '2025-01-18T18:35:43'),
       (610, 65, 6, 'JOINED', '2025-01-19 00:00:00.000000', '2025-01-19T04:00:12'),
       (611, 65, 32, 'JOINED', '2025-01-19 00:00:00.000000', '2025-01-18T23:17:58'),
       (612, 65, 34, 'JOINED', '2025-01-19 00:00:00.000000', '2025-01-19T16:10'),
       (613, 65, 36, 'JOINED', '2025-01-19 00:00:00.000000', '2025-01-19T22:24:58');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 608, 'Employee 2 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-20 04:48:00.000000', '2025-01-20 04:48:00.000000', '2025-01-20 05:08:00.000000'),
       (DEFAULT, 609, 'Employee 4 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-20 04:48:00.000000', '2025-01-20 04:48:00.000000', '2025-01-20 05:08:00.000000'),
       (DEFAULT, 610, 'Employee 6 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-20 04:48:00.000000', '2025-01-20 04:48:00.000000', '2025-01-20 05:08:00.000000'),
       (DEFAULT, 611, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-20 04:48:00.000000', '2025-01-20 04:48:00.000000', '2025-01-20 05:08:00.000000'),
       (DEFAULT, 612, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-20 04:48:00.000000', '2025-01-20 04:48:00.000000', '2025-01-20 05:08:00.000000'),
       (DEFAULT, 613, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-20 04:48:00.000000', '2025-01-20 04:48:00.000000', '2025-01-20 05:08:00.000000');

-- 2025-01-23 00:00:00.000000
-- 2025-01-30
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (66, 1, 121, NULL, 'Add admin only routes', 'Add admin only routes', NULL, 'HARD', 'BACKEND', 'LOW', FALSE, '2025-01-23', '2025-01-30', '2025-01-30', '2025-01-23 00:00:00.000000', '2025-01-23 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (614, 66, 32, 'JOINED', '2025-01-23 00:00:00.000000', '2025-01-11T16:53:46'),
       (615, 66, 34, 'JOINED', '2025-01-23 00:00:00.000000', '2025-01-13T17:05:17'),
       (616, 66, 36, 'JOINED', '2025-01-23 00:00:00.000000', '2025-01-12T11:08:10');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 614, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-23 00:00:00.000000', '2025-01-23 00:00:00.000000', '2025-01-23 00:20:00.000000'),
       (DEFAULT, 615, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-23 00:00:00.000000', '2025-01-23 00:00:00.000000', '2025-01-23 00:20:00.000000'),
       (DEFAULT, 616, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-01-23 00:00:00.000000', '2025-01-23 00:00:00.000000', '2025-01-23 00:20:00.000000');

-- 2025-01-31 00:00:00.000000
-- 2025-02-06
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (67, 1, 121, NULL, 'Create dto for user', 'Create dto for user', NULL, 'ADVANCED', 'BACKEND', 'NORMAL', FALSE, '2025-01-31', '2025-02-06', '2025-02-06', '2025-01-31 00:00:00.000000', '2025-01-31 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (617, 67, 8, 'JOINED', '2025-01-31 00:00:00.000000', '2025-02-01T12:45:31'),
       (618, 67, 10, 'JOINED', '2025-01-31 00:00:00.000000', '2025-02-01T09:49:07'),
       (619, 67, 12, 'JOINED', '2025-01-31 00:00:00.000000', '2025-01-31T17:07:10'),
       (620, 67, 14, 'JOINED', '2025-01-31 00:00:00.000000', '2025-02-01T19:34:46'),
       (621, 67, 38, 'JOINED', '2025-01-31 00:00:00.000000', '2025-02-01T02:31:38'),
       (622, 67, 40, 'JOINED', '2025-01-31 00:00:00.000000', '2025-01-31T13:14:19'),
       (623, 67, 42, 'JOINED', '2025-01-31 00:00:00.000000', '2025-02-01T21:34:43'),
       (624, 67, 44, 'JOINED', '2025-01-31 00:00:00.000000', '2025-02-01T08:52:40');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 617, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-02 02:24:00.000000', '2025-02-02 02:24:00.000000', '2025-02-02 02:44:00.000000'),
       (DEFAULT, 618, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-02 02:24:00.000000', '2025-02-02 02:24:00.000000', '2025-02-02 02:44:00.000000'),
       (DEFAULT, 619, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-02 02:24:00.000000', '2025-02-02 02:24:00.000000', '2025-02-02 02:44:00.000000'),
       (DEFAULT, 620, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-02 02:24:00.000000', '2025-02-02 02:24:00.000000', '2025-02-02 02:44:00.000000'),
       (DEFAULT, 621, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-02 02:24:00.000000', '2025-02-02 02:24:00.000000', '2025-02-02 02:44:00.000000'),
       (DEFAULT, 622, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-02 02:24:00.000000', '2025-02-02 02:24:00.000000', '2025-02-02 02:44:00.000000'),
       (DEFAULT, 623, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-02 02:24:00.000000', '2025-02-02 02:24:00.000000', '2025-02-02 02:44:00.000000'),
       (DEFAULT, 624, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-02 02:24:00.000000', '2025-02-02 02:24:00.000000', '2025-02-02 02:44:00.000000');

-- 2025-02-07 00:00:00.000000
-- 2025-02-13
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (68, 1, 121, NULL, 'Create dto for task', 'Create dto for task', NULL, 'ADVANCED', 'BACKEND', 'LOW', FALSE, '2025-02-07', '2025-02-13', '2025-02-13', '2025-02-07 00:00:00.000000', '2025-02-07 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (625, 68, 38, 'JOINED', '2025-02-07 00:00:00.000000', '2025-01-26T08:47:03'),
       (626, 68, 40, 'JOINED', '2025-02-07 00:00:00.000000', '2025-01-30T13:14:53'),
       (627, 68, 42, 'JOINED', '2025-02-07 00:00:00.000000', '2025-01-30T03:50:24'),
       (628, 68, 44, 'JOINED', '2025-02-07 00:00:00.000000', '2025-01-27T09:38:53');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 625, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-07 00:00:00.000000', '2025-02-07 00:00:00.000000', '2025-02-07 00:20:00.000000'),
       (DEFAULT, 626, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-07 00:00:00.000000', '2025-02-07 00:00:00.000000', '2025-02-07 00:20:00.000000'),
       (DEFAULT, 627, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-07 00:00:00.000000', '2025-02-07 00:00:00.000000', '2025-02-07 00:20:00.000000'),
       (DEFAULT, 628, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-07 00:00:00.000000', '2025-02-07 00:00:00.000000', '2025-02-07 00:20:00.000000');

-- 2025-02-14 00:00:00.000000
-- 2025-02-19
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (69, 1, 121, NULL, 'Create mapper util', 'Create mapper util', NULL, 'NORMAL', 'BACKEND', 'NORMAL', FALSE, '2025-02-14', '2025-02-19', '2025-02-19', '2025-02-14 00:00:00.000000', '2025-02-14 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (629, 69, 16, 'JOINED', '2025-02-14 00:00:00.000000', '2025-02-15T04:29'),
       (630, 69, 18, 'JOINED', '2025-02-14 00:00:00.000000', '2025-02-14T16:47:26'),
       (631, 69, 20, 'JOINED', '2025-02-14 00:00:00.000000', '2025-02-15T10:31:53'),
       (632, 69, 46, 'JOINED', '2025-02-14 00:00:00.000000', '2025-02-13T19:49:27'),
       (633, 69, 48, 'JOINED', '2025-02-14 00:00:00.000000', '2025-02-14T21:19:36'),
       (634, 69, 50, 'JOINED', '2025-02-14 00:00:00.000000', '2025-02-14T18:12:06');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 629, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-15 19:12:00.000000', '2025-02-15 19:12:00.000000', '2025-02-15 19:32:00.000000'),
       (DEFAULT, 630, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-15 19:12:00.000000', '2025-02-15 19:12:00.000000', '2025-02-15 19:32:00.000000'),
       (DEFAULT, 631, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-15 19:12:00.000000', '2025-02-15 19:12:00.000000', '2025-02-15 19:32:00.000000'),
       (DEFAULT, 632, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-15 19:12:00.000000', '2025-02-15 19:12:00.000000', '2025-02-15 19:32:00.000000'),
       (DEFAULT, 633, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-15 19:12:00.000000', '2025-02-15 19:12:00.000000', '2025-02-15 19:32:00.000000'),
       (DEFAULT, 634, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-15 19:12:00.000000', '2025-02-15 19:12:00.000000', '2025-02-15 19:32:00.000000');

-- 2025-02-20 00:00:00.000000
-- 2025-02-25
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (70, 1, 121, NULL, 'Add validation annotations', 'Add validation annotations', NULL, 'NORMAL', 'BACKEND', 'LOW', FALSE, '2025-02-20', '2025-02-25', '2025-02-25', '2025-02-20 00:00:00.000000', '2025-02-20 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (635, 70, 46, 'JOINED', '2025-02-20 00:00:00.000000', '2025-02-10T21:15:51'),
       (636, 70, 48, 'JOINED', '2025-02-20 00:00:00.000000', '2025-02-13T21:24:29'),
       (637, 70, 50, 'JOINED', '2025-02-20 00:00:00.000000', '2025-02-12T20:12:29');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 635, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-20 00:00:00.000000', '2025-02-20 00:00:00.000000', '2025-02-20 00:20:00.000000'),
       (DEFAULT, 636, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-20 00:00:00.000000', '2025-02-20 00:00:00.000000', '2025-02-20 00:20:00.000000'),
       (DEFAULT, 637, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-20 00:00:00.000000', '2025-02-20 00:00:00.000000', '2025-02-20 00:20:00.000000');

-- 2025-02-26 00:00:00.000000
-- 2025-03-02
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (71, 1, 121, NULL, 'Create login request dto', 'Create login request dto', NULL, 'LIGHT', 'BACKEND', 'NORMAL', FALSE, '2025-02-26', '2025-03-02', '2025-03-02', '2025-02-26 00:00:00.000000', '2025-02-26 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (638, 71, 22, 'JOINED', '2025-02-26 00:00:00.000000', '2025-02-27T04:11:17'),
       (639, 71, 24, 'JOINED', '2025-02-26 00:00:00.000000', '2025-02-26T10:02:39'),
       (640, 71, 26, 'JOINED', '2025-02-26 00:00:00.000000', '2025-02-27T07:42:58'),
       (641, 71, 28, 'JOINED', '2025-02-26 00:00:00.000000', '2025-02-27T09:18:44'),
       (642, 71, 52, 'JOINED', '2025-02-26 00:00:00.000000', '2025-02-26T00:53:17'),
       (643, 71, 54, 'JOINED', '2025-02-26 00:00:00.000000', '2025-02-26T18:51:51'),
       (644, 71, 56, 'JOINED', '2025-02-26 00:00:00.000000', '2025-02-27T10:59:32'),
       (645, 71, 58, 'JOINED', '2025-02-26 00:00:00.000000', '2025-02-26T05:45:36');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 638, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-27 12:00:00.000000', '2025-02-27 12:00:00.000000', '2025-02-27 12:20:00.000000'),
       (DEFAULT, 639, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-27 12:00:00.000000', '2025-02-27 12:00:00.000000', '2025-02-27 12:20:00.000000'),
       (DEFAULT, 640, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-27 12:00:00.000000', '2025-02-27 12:00:00.000000', '2025-02-27 12:20:00.000000'),
       (DEFAULT, 641, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-27 12:00:00.000000', '2025-02-27 12:00:00.000000', '2025-02-27 12:20:00.000000'),
       (DEFAULT, 642, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-27 12:00:00.000000', '2025-02-27 12:00:00.000000', '2025-02-27 12:20:00.000000'),
       (DEFAULT, 643, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-27 12:00:00.000000', '2025-02-27 12:00:00.000000', '2025-02-27 12:20:00.000000'),
       (DEFAULT, 644, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-27 12:00:00.000000', '2025-02-27 12:00:00.000000', '2025-02-27 12:20:00.000000'),
       (DEFAULT, 645, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-02-27 12:00:00.000000', '2025-02-27 12:00:00.000000', '2025-02-27 12:20:00.000000');

-- 2025-03-03 00:00:00.000000
-- 2025-03-07
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (72, 1, 121, NULL, 'Create register request dto', 'Create register request dto', NULL, 'LIGHT', 'BACKEND', 'LOW', FALSE, '2025-03-03', '2025-03-07', '2025-03-07', '2025-03-03 00:00:00.000000', '2025-03-03 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (646, 72, 52, 'JOINED', '2025-03-03 00:00:00.000000', '2025-02-23T13:33:36'),
       (647, 72, 54, 'JOINED', '2025-03-03 00:00:00.000000', '2025-02-22T20:09:36'),
       (648, 72, 56, 'JOINED', '2025-03-03 00:00:00.000000', '2025-02-24T18:43:12'),
       (649, 72, 58, 'JOINED', '2025-03-03 00:00:00.000000', '2025-02-25T18:21:36');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 646, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-03 00:00:00.000000', '2025-03-03 00:00:00.000000', '2025-03-03 00:20:00.000000'),
       (DEFAULT, 647, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-03 00:00:00.000000', '2025-03-03 00:00:00.000000', '2025-03-03 00:20:00.000000'),
       (DEFAULT, 648, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-03 00:00:00.000000', '2025-03-03 00:00:00.000000', '2025-03-03 00:20:00.000000'),
       (DEFAULT, 649, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-03 00:00:00.000000', '2025-03-03 00:00:00.000000', '2025-03-03 00:20:00.000000');

-- 2025-03-08 00:00:00.000000
-- 2025-03-11
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (73, 1, 121, NULL, 'Profile detail screen', 'Profile detail screen', NULL, 'HARD', 'FRONTEND', 'NORMAL', FALSE, '2025-03-08', '2025-03-11', '2025-03-11', '2025-03-08 00:00:00.000000', '2025-03-08 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (650, 73, 1, 'JOINED', '2025-03-08 00:00:00.000000', '2025-03-07T22:21:31'),
       (651, 73, 3, 'JOINED', '2025-03-08 00:00:00.000000', '2025-03-08T08:58:34'),
       (652, 73, 5, 'JOINED', '2025-03-08 00:00:00.000000', '2025-03-08T03:27:57'),
       (653, 73, 7, 'JOINED', '2025-03-08 00:00:00.000000', '2025-03-08T09:50:59'),
       (654, 73, 31, 'JOINED', '2025-03-08 00:00:00.000000', '2025-03-08T09:50:59'),
       (655, 73, 33, 'JOINED', '2025-03-08 00:00:00.000000', '2025-03-08T13:48:52'),
       (656, 73, 35, 'JOINED', '2025-03-08 00:00:00.000000', '2025-03-08T17:26:36'),
       (657, 73, 37, 'JOINED', '2025-03-08 00:00:00.000000', '2025-03-08T06:25:21');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 650, 'Employee 1 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-09 04:48:00.000000', '2025-03-09 04:48:00.000000', '2025-03-09 05:08:00.000000'),
       (DEFAULT, 651, 'Employee 3 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-09 04:48:00.000000', '2025-03-09 04:48:00.000000', '2025-03-09 05:08:00.000000'),
       (DEFAULT, 652, 'Employee 5 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-09 04:48:00.000000', '2025-03-09 04:48:00.000000', '2025-03-09 05:08:00.000000'),
       (DEFAULT, 653, 'Employee 7 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-09 04:48:00.000000', '2025-03-09 04:48:00.000000', '2025-03-09 05:08:00.000000'),
       (DEFAULT, 654, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-09 04:48:00.000000', '2025-03-09 04:48:00.000000', '2025-03-09 05:08:00.000000'),
       (DEFAULT, 655, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-09 04:48:00.000000', '2025-03-09 04:48:00.000000', '2025-03-09 05:08:00.000000'),
       (DEFAULT, 656, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-09 04:48:00.000000', '2025-03-09 04:48:00.000000', '2025-03-09 05:08:00.000000'),
       (DEFAULT, 657, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-09 04:48:00.000000', '2025-03-09 04:48:00.000000', '2025-03-09 05:08:00.000000');

-- 2025-03-12 00:00:00.000000
-- 2025-03-19
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (74, 1, 121, NULL, 'Show error notifications', 'Show error notifications', NULL, 'HARD', 'FRONTEND', 'LOW', FALSE, '2025-03-12', '2025-03-19', '2025-03-19', '2025-03-12 00:00:00.000000', '2025-03-12 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (658, 74, 31, 'JOINED', '2025-03-12 00:00:00.000000', '2025-02-27T20:55:41'),
       (659, 74, 33, 'JOINED', '2025-03-12 00:00:00.000000', '2025-02-28T03:27:22'),
       (660, 74, 35, 'JOINED', '2025-03-12 00:00:00.000000', '2025-03-02T00:57:36'),
       (661, 74, 37, 'JOINED', '2025-03-12 00:00:00.000000', '2025-02-25T11:08:10');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 658, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-12 00:00:00.000000', '2025-03-12 00:00:00.000000', '2025-03-12 00:20:00.000000'),
       (DEFAULT, 659, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-12 00:00:00.000000', '2025-03-12 00:00:00.000000', '2025-03-12 00:20:00.000000'),
       (DEFAULT, 660, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-12 00:00:00.000000', '2025-03-12 00:00:00.000000', '2025-03-12 00:20:00.000000'),
       (DEFAULT, 661, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-12 00:00:00.000000', '2025-03-12 00:00:00.000000', '2025-03-12 00:20:00.000000');

-- 2025-03-20 00:00:00.000000
-- 2025-03-26
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (75, 1, 121, NULL, 'Show success notifications', 'Show success notifications', NULL, 'ADVANCED', 'FRONTEND', 'NORMAL', FALSE, '2025-03-20', '2025-03-26', '2025-03-26', '2025-03-20 00:00:00.000000', '2025-03-20 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (662, 75, 9, 'JOINED', '2025-03-20 00:00:00.000000', '2025-03-21T01:28:08'),
       (663, 75, 11, 'JOINED', '2025-03-20 00:00:00.000000', '2025-03-20T02:04'),
       (664, 75, 13, 'JOINED', '2025-03-20 00:00:00.000000', '2025-03-20T20:38:50'),
       (665, 75, 39, 'JOINED', '2025-03-20 00:00:00.000000', '2025-03-20T01:49:53'),
       (666, 75, 41, 'JOINED', '2025-03-20 00:00:00.000000', '2025-03-19T23:00:32'),
       (667, 75, 43, 'JOINED', '2025-03-20 00:00:00.000000', '2025-03-20T18:24:47');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 662, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-22 02:24:00.000000', '2025-03-22 02:24:00.000000', '2025-03-22 02:44:00.000000'),
       (DEFAULT, 663, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-22 02:24:00.000000', '2025-03-22 02:24:00.000000', '2025-03-22 02:44:00.000000'),
       (DEFAULT, 664, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-22 02:24:00.000000', '2025-03-22 02:24:00.000000', '2025-03-22 02:44:00.000000'),
       (DEFAULT, 665, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-22 02:24:00.000000', '2025-03-22 02:24:00.000000', '2025-03-22 02:44:00.000000'),
       (DEFAULT, 666, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-22 02:24:00.000000', '2025-03-22 02:24:00.000000', '2025-03-22 02:44:00.000000'),
       (DEFAULT, 667, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-22 02:24:00.000000', '2025-03-22 02:24:00.000000', '2025-03-22 02:44:00.000000');

-- 2025-03-27 00:00:00.000000
-- 2025-04-02
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (76, 1, 121, NULL, 'Create delete confirm modal', 'Create delete confirm modal', NULL, 'ADVANCED', 'FRONTEND', 'LOW', FALSE, '2025-03-27', '2025-04-02', '2025-04-02', '2025-03-27 00:00:00.000000', '2025-03-27 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (668, 76, 39, 'JOINED', '2025-03-27 00:00:00.000000', '2025-03-19T19:17:46'),
       (669, 76, 41, 'JOINED', '2025-03-27 00:00:00.000000', '2025-03-15T08:16:48'),
       (670, 76, 43, 'JOINED', '2025-03-27 00:00:00.000000', '2025-03-19T19:27:51');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 668, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-27 00:00:00.000000', '2025-03-27 00:00:00.000000', '2025-03-27 00:20:00.000000'),
       (DEFAULT, 669, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-27 00:00:00.000000', '2025-03-27 00:00:00.000000', '2025-03-27 00:20:00.000000'),
       (DEFAULT, 670, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-03-27 00:00:00.000000', '2025-03-27 00:00:00.000000', '2025-03-27 00:20:00.000000');

-- 2025-04-03 00:00:00.000000
-- 2025-04-08
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (77, 1, 121, NULL, 'Create quick edit modal', 'Create quick edit modal', NULL, 'NORMAL', 'FRONTEND', 'NORMAL', FALSE, '2025-04-03', '2025-04-08', '2025-04-08', '2025-04-03 00:00:00.000000', '2025-04-03 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (671, 77, 15, 'JOINED', '2025-04-03 00:00:00.000000', '2025-04-04T01:15:28'),
       (672, 77, 17, 'JOINED', '2025-04-03 00:00:00.000000', '2025-04-02T22:50:53'),
       (673, 77, 19, 'JOINED', '2025-04-03 00:00:00.000000', '2025-04-04T08:30:55'),
       (674, 77, 21, 'JOINED', '2025-04-03 00:00:00.000000', '2025-04-03T21:31:41'),
       (675, 77, 45, 'JOINED', '2025-04-03 00:00:00.000000', '2025-04-04T01:51:45'),
       (676, 77, 47, 'JOINED', '2025-04-03 00:00:00.000000', '2025-04-04T05:29:29'),
       (677, 77, 49, 'JOINED', '2025-04-03 00:00:00.000000', '2025-04-03T23:32:39'),
       (678, 77, 51, 'JOINED', '2025-04-03 00:00:00.000000', '2025-04-04T08:36:58');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 671, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-04 19:12:00.000000', '2025-04-04 19:12:00.000000', '2025-04-04 19:32:00.000000'),
       (DEFAULT, 672, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-04 19:12:00.000000', '2025-04-04 19:12:00.000000', '2025-04-04 19:32:00.000000'),
       (DEFAULT, 673, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-04 19:12:00.000000', '2025-04-04 19:12:00.000000', '2025-04-04 19:32:00.000000'),
       (DEFAULT, 674, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-04 19:12:00.000000', '2025-04-04 19:12:00.000000', '2025-04-04 19:32:00.000000'),
       (DEFAULT, 675, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-04 19:12:00.000000', '2025-04-04 19:12:00.000000', '2025-04-04 19:32:00.000000'),
       (DEFAULT, 676, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-04 19:12:00.000000', '2025-04-04 19:12:00.000000', '2025-04-04 19:32:00.000000'),
       (DEFAULT, 677, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-04 19:12:00.000000', '2025-04-04 19:12:00.000000', '2025-04-04 19:32:00.000000'),
       (DEFAULT, 678, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-04 19:12:00.000000', '2025-04-04 19:12:00.000000', '2025-04-04 19:32:00.000000');

-- 2025-04-09 00:00:00.000000
-- 2025-04-14
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (78, 1, 121, NULL, 'Build toast notification', 'Build toast notification', NULL, 'NORMAL', 'FRONTEND', 'LOW', FALSE, '2025-04-09', '2025-04-14', '2025-04-14', '2025-04-09 00:00:00.000000', '2025-04-09 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (679, 78, 45, 'JOINED', '2025-04-09 00:00:00.000000', '2025-03-28T23:02:24'),
       (680, 78, 47, 'JOINED', '2025-04-09 00:00:00.000000', '2025-04-01T03:04:20'),
       (681, 78, 49, 'JOINED', '2025-04-09 00:00:00.000000', '2025-03-30T15:30:15'),
       (682, 78, 51, 'JOINED', '2025-04-09 00:00:00.000000', '2025-04-02T01:23:32');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 679, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-09 00:00:00.000000', '2025-04-09 00:00:00.000000', '2025-04-09 00:20:00.000000'),
       (DEFAULT, 680, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-09 00:00:00.000000', '2025-04-09 00:00:00.000000', '2025-04-09 00:20:00.000000'),
       (DEFAULT, 681, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-09 00:00:00.000000', '2025-04-09 00:00:00.000000', '2025-04-09 00:20:00.000000'),
       (DEFAULT, 682, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-09 00:00:00.000000', '2025-04-09 00:00:00.000000', '2025-04-09 00:20:00.000000');

-- 2025-04-15 00:00:00.000000
-- 2025-04-19
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (79, 1, 121, NULL, 'Add loading indicator', 'Add loading indicator', NULL, 'LIGHT', 'FRONTEND', 'NORMAL', FALSE, '2025-04-15', '2025-04-19', '2025-04-19', '2025-04-15 00:00:00.000000', '2025-04-15 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (683, 79, 23, 'JOINED', '2025-04-15 00:00:00.000000', '2025-04-15T20:47:46'),
       (684, 79, 25, 'JOINED', '2025-04-15 00:00:00.000000', '2025-04-16T05:21:51'),
       (685, 79, 27, 'JOINED', '2025-04-15 00:00:00.000000', '2025-04-15T19:37:13'),
       (686, 79, 53, 'JOINED', '2025-04-15 00:00:00.000000', '2025-04-15T18:16:34'),
       (687, 79, 55, 'JOINED', '2025-04-15 00:00:00.000000', '2025-04-15T01:08:24'),
       (688, 79, 57, 'JOINED', '2025-04-15 00:00:00.000000', '2025-04-14T21:26:39');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 683, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-16 12:00:00.000000', '2025-04-16 12:00:00.000000', '2025-04-16 12:20:00.000000'),
       (DEFAULT, 684, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-16 12:00:00.000000', '2025-04-16 12:00:00.000000', '2025-04-16 12:20:00.000000'),
       (DEFAULT, 685, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-16 12:00:00.000000', '2025-04-16 12:00:00.000000', '2025-04-16 12:20:00.000000'),
       (DEFAULT, 686, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-16 12:00:00.000000', '2025-04-16 12:00:00.000000', '2025-04-16 12:20:00.000000'),
       (DEFAULT, 687, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-16 12:00:00.000000', '2025-04-16 12:00:00.000000', '2025-04-16 12:20:00.000000'),
       (DEFAULT, 688, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-16 12:00:00.000000', '2025-04-16 12:00:00.000000', '2025-04-16 12:20:00.000000');

-- 2025-04-20 00:00:00.000000
-- 2025-04-24
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (80, 1, 121, NULL, 'Add skeleton loading', 'Add skeleton loading', NULL, 'LIGHT', 'FRONTEND', 'LOW', FALSE, '2025-04-20', '2025-04-24', '2025-04-24', '2025-04-20 00:00:00.000000', '2025-04-20 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (689, 80, 53, 'JOINED', '2025-04-20 00:00:00.000000', '2025-04-13T17:02:24'),
       (690, 80, 55, 'JOINED', '2025-04-20 00:00:00.000000', '2025-04-16T14:38:24'),
       (691, 80, 57, 'JOINED', '2025-04-20 00:00:00.000000', '2025-04-13T19:33:36');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 689, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-20 00:00:00.000000', '2025-04-20 00:00:00.000000', '2025-04-20 00:20:00.000000'),
       (DEFAULT, 690, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-20 00:00:00.000000', '2025-04-20 00:00:00.000000', '2025-04-20 00:20:00.000000'),
       (DEFAULT, 691, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-20 00:00:00.000000', '2025-04-20 00:00:00.000000', '2025-04-20 00:20:00.000000');

-- 2025-04-25 00:00:00.000000
-- 2025-04-28
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (81, 1, 121, NULL, 'Create task request dto', 'Create task request dto', NULL, 'HARD', 'BACKEND', 'NORMAL', FALSE, '2025-04-25', '2025-04-28', '2025-04-28', '2025-04-25 00:00:00.000000', '2025-04-25 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (692, 81, 2, 'JOINED', '2025-04-25 00:00:00.000000', '2025-04-25T15:25:56'),
       (693, 81, 4, 'JOINED', '2025-04-25 00:00:00.000000', '2025-04-25T12:59:03'),
       (694, 81, 6, 'JOINED', '2025-04-25 00:00:00.000000', '2025-04-25T15:17:17'),
       (695, 81, 32, 'JOINED', '2025-04-25 00:00:00.000000', '2025-04-24T18:02:53'),
       (696, 81, 34, 'JOINED', '2025-04-25 00:00:00.000000', '2025-04-25T03:02:53'),
       (697, 81, 36, 'JOINED', '2025-04-25 00:00:00.000000', '2025-04-24T21:30:15');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 692, 'Employee 2 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-26 00:00:00.000000', '2025-04-26 00:00:00.000000', '2025-04-26 00:20:00.000000'),
       (DEFAULT, 693, 'Employee 4 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-26 00:00:00.000000', '2025-04-26 00:00:00.000000', '2025-04-26 00:20:00.000000'),
       (DEFAULT, 694, 'Employee 6 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-26 00:00:00.000000', '2025-04-26 00:00:00.000000', '2025-04-26 00:20:00.000000'),
       (DEFAULT, 695, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-26 00:00:00.000000', '2025-04-26 00:00:00.000000', '2025-04-26 00:20:00.000000'),
       (DEFAULT, 696, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-26 00:00:00.000000', '2025-04-26 00:00:00.000000', '2025-04-26 00:20:00.000000'),
       (DEFAULT, 697, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-04-26 00:00:00.000000', '2025-04-26 00:00:00.000000', '2025-04-26 00:20:00.000000');

-- 2025-04-29 00:00:00.000000
-- 2025-05-06
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (82, 1, 121, NULL, 'Create task response dto', 'Create task response dto', NULL, 'ADVANCED', 'BACKEND', 'NORMAL', FALSE, '2025-04-29', '2025-05-06', '2025-05-06', '2025-04-29 00:00:00.000000', '2025-04-29 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (698, 82, 8, 'JOINED', '2025-04-29 00:00:00.000000', '2025-04-29T06:48:58'),
       (699, 82, 10, 'JOINED', '2025-04-29 00:00:00.000000', '2025-04-29T16:53:46'),
       (700, 82, 12, 'JOINED', '2025-04-29 00:00:00.000000', '2025-04-30T15:30:15'),
       (701, 82, 14, 'JOINED', '2025-04-29 00:00:00.000000', '2025-04-29T20:29:46'),
       (702, 82, 38, 'JOINED', '2025-04-29 00:00:00.000000', '2025-04-28T07:46:34'),
       (703, 82, 40, 'JOINED', '2025-04-29 00:00:00.000000', '2025-04-28T21:18:44'),
       (704, 82, 42, 'JOINED', '2025-04-29 00:00:00.000000', '2025-04-29T19:03:22'),
       (705, 82, 44, 'JOINED', '2025-04-29 00:00:00.000000', '2025-04-29T07:23:32');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 698, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-01 00:00:00.000000', '2025-05-01 00:00:00.000000', '2025-05-01 00:20:00.000000'),
       (DEFAULT, 699, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-01 00:00:00.000000', '2025-05-01 00:00:00.000000', '2025-05-01 00:20:00.000000'),
       (DEFAULT, 700, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-01 00:00:00.000000', '2025-05-01 00:00:00.000000', '2025-05-01 00:20:00.000000'),
       (DEFAULT, 701, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-01 00:00:00.000000', '2025-05-01 00:00:00.000000', '2025-05-01 00:20:00.000000'),
       (DEFAULT, 702, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-01 00:00:00.000000', '2025-05-01 00:00:00.000000', '2025-05-01 00:20:00.000000'),
       (DEFAULT, 703, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-01 00:00:00.000000', '2025-05-01 00:00:00.000000', '2025-05-01 00:20:00.000000'),
       (DEFAULT, 704, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-01 00:00:00.000000', '2025-05-01 00:00:00.000000', '2025-05-01 00:20:00.000000'),
       (DEFAULT, 705, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-01 00:00:00.000000', '2025-05-01 00:00:00.000000', '2025-05-01 00:20:00.000000');

-- 2025-05-07 00:00:00.000000
-- 2025-05-13
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (83, 1, 121, NULL, 'Add swagger configuration', 'Add swagger configuration', NULL, 'NORMAL', 'BACKEND', 'NORMAL', FALSE, '2025-05-07', '2025-05-13', '2025-05-13', '2025-05-07 00:00:00.000000', '2025-05-07 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (706, 83, 16, 'JOINED', '2025-05-07 00:00:00.000000', '2025-05-07T10:22:27'),
       (707, 83, 18, 'JOINED', '2025-05-07 00:00:00.000000', '2025-05-08T03:15:29'),
       (708, 83, 20, 'JOINED', '2025-05-07 00:00:00.000000', '2025-05-06T18:52:34'),
       (709, 83, 46, 'JOINED', '2025-05-07 00:00:00.000000', '2025-05-08T04:38:39'),
       (710, 83, 48, 'JOINED', '2025-05-07 00:00:00.000000', '2025-05-07T15:02:10'),
       (711, 83, 50, 'JOINED', '2025-05-07 00:00:00.000000', '2025-05-07T23:36:15');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 706, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-08 18:00:00.000000', '2025-05-08 18:00:00.000000', '2025-05-08 18:20:00.000000'),
       (DEFAULT, 707, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-08 18:00:00.000000', '2025-05-08 18:00:00.000000', '2025-05-08 18:20:00.000000'),
       (DEFAULT, 708, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-08 18:00:00.000000', '2025-05-08 18:00:00.000000', '2025-05-08 18:20:00.000000'),
       (DEFAULT, 709, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-08 18:00:00.000000', '2025-05-08 18:00:00.000000', '2025-05-08 18:20:00.000000'),
       (DEFAULT, 710, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-08 18:00:00.000000', '2025-05-08 18:00:00.000000', '2025-05-08 18:20:00.000000'),
       (DEFAULT, 711, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-08 18:00:00.000000', '2025-05-08 18:00:00.000000', '2025-05-08 18:20:00.000000');

-- 2025-05-14 00:00:00.000000
-- 2025-05-19
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (84, 1, 121, NULL, 'Add cors configuration', 'Add cors configuration', NULL, 'LIGHT', 'BACKEND', 'NORMAL', FALSE, '2025-05-14', '2025-05-19', '2025-05-19', '2025-05-14 00:00:00.000000', '2025-05-14 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (712, 84, 22, 'JOINED', '2025-05-14 00:00:00.000000', '2025-05-15T00:46:05'),
       (713, 84, 24, 'JOINED', '2025-05-14 00:00:00.000000', '2025-05-14T12:01:27'),
       (714, 84, 26, 'JOINED', '2025-05-14 00:00:00.000000', '2025-05-15T10:42:15'),
       (715, 84, 28, 'JOINED', '2025-05-14 00:00:00.000000', '2025-05-13T21:59:03'),
       (716, 84, 52, 'JOINED', '2025-05-14 00:00:00.000000', '2025-05-13T02:32:39'),
       (717, 84, 54, 'JOINED', '2025-05-14 00:00:00.000000', '2025-05-13T10:32:10'),
       (718, 84, 56, 'JOINED', '2025-05-14 00:00:00.000000', '2025-05-15T02:29:46'),
       (719, 84, 58, 'JOINED', '2025-05-14 00:00:00.000000', '2025-05-14T17:31:56');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 712, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-15 12:00:00.000000', '2025-05-15 12:00:00.000000', '2025-05-15 12:20:00.000000'),
       (DEFAULT, 713, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-15 12:00:00.000000', '2025-05-15 12:00:00.000000', '2025-05-15 12:20:00.000000'),
       (DEFAULT, 714, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-15 12:00:00.000000', '2025-05-15 12:00:00.000000', '2025-05-15 12:20:00.000000'),
       (DEFAULT, 715, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-15 12:00:00.000000', '2025-05-15 12:00:00.000000', '2025-05-15 12:20:00.000000'),
       (DEFAULT, 716, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-15 12:00:00.000000', '2025-05-15 12:00:00.000000', '2025-05-15 12:20:00.000000'),
       (DEFAULT, 717, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-15 12:00:00.000000', '2025-05-15 12:00:00.000000', '2025-05-15 12:20:00.000000'),
       (DEFAULT, 718, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-15 12:00:00.000000', '2025-05-15 12:00:00.000000', '2025-05-15 12:20:00.000000'),
       (DEFAULT, 719, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-15 12:00:00.000000', '2025-05-15 12:00:00.000000', '2025-05-15 12:20:00.000000');

-- 2025-05-20 00:00:00.000000
-- 2025-05-24
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (85, 1, 121, NULL, 'Optimize list rendering', 'Optimize list rendering', NULL, 'HARD', 'FRONTEND', 'NORMAL', FALSE, '2025-05-20', '2025-05-24', '2025-05-24', '2025-05-20 00:00:00.000000', '2025-05-20 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (720, 85, 1, 'JOINED', '2025-05-20 00:00:00.000000', '2025-05-20T20:54:36'),
       (721, 85, 3, 'JOINED', '2025-05-20 00:00:00.000000', '2025-05-20T14:09:36'),
       (722, 85, 5, 'JOINED', '2025-05-20 00:00:00.000000', '2025-05-20T22:15:36'),
       (723, 85, 7, 'JOINED', '2025-05-20 00:00:00.000000', '2025-05-21T03:07:12'),
       (724, 85, 31, 'JOINED', '2025-05-20 00:00:00.000000', '2025-05-20T15:25:12'),
       (725, 85, 33, 'JOINED', '2025-05-20 00:00:00.000000', '2025-05-20T09:18'),
       (726, 85, 35, 'JOINED', '2025-05-20 00:00:00.000000', '2025-05-20T07:08:24'),
       (727, 85, 37, 'JOINED', '2025-05-20 00:00:00.000000', '2025-05-20T09:50:24');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 720, 'Employee 1 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-21 06:00:00.000000', '2025-05-21 06:00:00.000000', '2025-05-21 06:20:00.000000'),
       (DEFAULT, 721, 'Employee 3 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-21 06:00:00.000000', '2025-05-21 06:00:00.000000', '2025-05-21 06:20:00.000000'),
       (DEFAULT, 722, 'Employee 5 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-21 06:00:00.000000', '2025-05-21 06:00:00.000000', '2025-05-21 06:20:00.000000'),
       (DEFAULT, 723, 'Employee 7 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-21 06:00:00.000000', '2025-05-21 06:00:00.000000', '2025-05-21 06:20:00.000000'),
       (DEFAULT, 724, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-21 06:00:00.000000', '2025-05-21 06:00:00.000000', '2025-05-21 06:20:00.000000'),
       (DEFAULT, 725, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-21 06:00:00.000000', '2025-05-21 06:00:00.000000', '2025-05-21 06:20:00.000000'),
       (DEFAULT, 726, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-21 06:00:00.000000', '2025-05-21 06:00:00.000000', '2025-05-21 06:20:00.000000'),
       (DEFAULT, 727, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-21 06:00:00.000000', '2025-05-21 06:00:00.000000', '2025-05-21 06:20:00.000000');

-- 2025-05-25 00:00:00.000000
-- 2025-06-01
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (86, 1, 121, NULL, 'Memoize task components', 'Memoize task components', NULL, 'ADVANCED', 'FRONTEND', 'NORMAL', FALSE, '2025-05-25', '2025-06-01', '2025-06-01', '2025-05-25 00:00:00.000000', '2025-05-25 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (728, 86, 9, 'JOINED', '2025-05-25 00:00:00.000000', '2025-05-25T17:36:58'),
       (729, 86, 11, 'JOINED', '2025-05-25 00:00:00.000000', '2025-05-24T23:02:24'),
       (730, 86, 13, 'JOINED', '2025-05-25 00:00:00.000000', '2025-05-25T11:34:05'),
       (731, 86, 39, 'JOINED', '2025-05-25 00:00:00.000000', '2025-05-24T17:25:27'),
       (732, 86, 41, 'JOINED', '2025-05-25 00:00:00.000000', '2025-05-25T05:22:34'),
       (733, 86, 43, 'JOINED', '2025-05-25 00:00:00.000000', '2025-05-26T00:31:41');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 728, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-27 00:00:00.000000', '2025-05-27 00:00:00.000000', '2025-05-27 00:20:00.000000'),
       (DEFAULT, 729, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-27 00:00:00.000000', '2025-05-27 00:00:00.000000', '2025-05-27 00:20:00.000000'),
       (DEFAULT, 730, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-27 00:00:00.000000', '2025-05-27 00:00:00.000000', '2025-05-27 00:20:00.000000'),
       (DEFAULT, 731, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-27 00:00:00.000000', '2025-05-27 00:00:00.000000', '2025-05-27 00:20:00.000000'),
       (DEFAULT, 732, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-27 00:00:00.000000', '2025-05-27 00:00:00.000000', '2025-05-27 00:20:00.000000'),
       (DEFAULT, 733, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-05-27 00:00:00.000000', '2025-05-27 00:00:00.000000', '2025-05-27 00:20:00.000000');

-- 2025-06-02 00:00:00.000000
-- 2025-06-08
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (87, 1, 121, NULL, 'Extract TaskItem component', 'Extract TaskItem component', NULL, 'NORMAL', 'FRONTEND', 'NORMAL', FALSE, '2025-06-02', '2025-06-08', '2025-06-08', '2025-06-02 00:00:00.000000', '2025-06-02 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (734, 87, 15, 'JOINED', '2025-06-02 00:00:00.000000', '2025-06-02T00:55:27'),
       (735, 87, 17, 'JOINED', '2025-06-02 00:00:00.000000', '2025-06-03T02:15'),
       (736, 87, 19, 'JOINED', '2025-06-02 00:00:00.000000', '2025-06-03T11:42'),
       (737, 87, 21, 'JOINED', '2025-06-02 00:00:00.000000', '2025-06-02T04:49:48'),
       (738, 87, 45, 'JOINED', '2025-06-02 00:00:00.000000', '2025-06-02T14:54:36'),
       (739, 87, 47, 'JOINED', '2025-06-02 00:00:00.000000', '2025-05-31T16:40:05'),
       (740, 87, 49, 'JOINED', '2025-06-02 00:00:00.000000', '2025-06-01T21:01:05'),
       (741, 87, 51, 'JOINED', '2025-06-02 00:00:00.000000', '2025-06-02T03:41:46');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 734, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-03 18:00:00.000000', '2025-06-03 18:00:00.000000', '2025-06-03 18:20:00.000000'),
       (DEFAULT, 735, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-03 18:00:00.000000', '2025-06-03 18:00:00.000000', '2025-06-03 18:20:00.000000'),
       (DEFAULT, 736, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-03 18:00:00.000000', '2025-06-03 18:00:00.000000', '2025-06-03 18:20:00.000000'),
       (DEFAULT, 737, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-03 18:00:00.000000', '2025-06-03 18:00:00.000000', '2025-06-03 18:20:00.000000'),
       (DEFAULT, 738, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-03 18:00:00.000000', '2025-06-03 18:00:00.000000', '2025-06-03 18:20:00.000000'),
       (DEFAULT, 739, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-03 18:00:00.000000', '2025-06-03 18:00:00.000000', '2025-06-03 18:20:00.000000'),
       (DEFAULT, 740, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-03 18:00:00.000000', '2025-06-03 18:00:00.000000', '2025-06-03 18:20:00.000000'),
       (DEFAULT, 741, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-03 18:00:00.000000', '2025-06-03 18:00:00.000000', '2025-06-03 18:20:00.000000');

-- 2025-06-09 00:00:00.000000
-- 2025-06-14
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (88, 1, 121, NULL, 'Extract TaskCard component', 'Extract TaskCard component', NULL, 'LIGHT', 'FRONTEND', 'NORMAL', FALSE, '2025-06-09', '2025-06-14', '2025-06-14', '2025-06-09 00:00:00.000000', '2025-06-09 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (742, 88, 23, 'JOINED', '2025-06-09 00:00:00.000000', '2025-06-08T06:00'),
       (743, 88, 25, 'JOINED', '2025-06-09 00:00:00.000000', '2025-06-10T05:24:44'),
       (744, 88, 27, 'JOINED', '2025-06-09 00:00:00.000000', '2025-06-09T20:20:24'),
       (745, 88, 53, 'JOINED', '2025-06-09 00:00:00.000000', '2025-06-08T04:16:20'),
       (746, 88, 55, 'JOINED', '2025-06-09 00:00:00.000000', '2025-06-09T20:39:51'),
       (747, 88, 57, 'JOINED', '2025-06-09 00:00:00.000000', '2025-06-08T22:50:53');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 742, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-10 12:00:00.000000', '2025-06-10 12:00:00.000000', '2025-06-10 12:20:00.000000'),
       (DEFAULT, 743, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-10 12:00:00.000000', '2025-06-10 12:00:00.000000', '2025-06-10 12:20:00.000000'),
       (DEFAULT, 744, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-10 12:00:00.000000', '2025-06-10 12:00:00.000000', '2025-06-10 12:20:00.000000'),
       (DEFAULT, 745, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-10 12:00:00.000000', '2025-06-10 12:00:00.000000', '2025-06-10 12:20:00.000000'),
       (DEFAULT, 746, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-10 12:00:00.000000', '2025-06-10 12:00:00.000000', '2025-06-10 12:20:00.000000'),
       (DEFAULT, 747, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-10 12:00:00.000000', '2025-06-10 12:00:00.000000', '2025-06-10 12:20:00.000000');

-- 2025-06-15 00:00:00.000000
-- 2025-06-19
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (89, 1, 121, NULL, 'Setup object mapper config', 'Setup object mapper config', NULL, 'HARD', 'BACKEND', 'NORMAL', FALSE, '2025-06-15', '2025-06-19', '2025-06-19', '2025-06-15 00:00:00.000000', '2025-06-15 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (748, 89, 2, 'JOINED', '2025-06-15 00:00:00.000000', '2025-06-14T19:35:03'),
       (749, 89, 4, 'JOINED', '2025-06-15 00:00:00.000000', '2025-06-15T17:22:34'),
       (750, 89, 6, 'JOINED', '2025-06-15 00:00:00.000000', '2025-06-14T11:08:10'),
       (751, 89, 32, 'JOINED', '2025-06-15 00:00:00.000000', '2025-06-14T19:06:15'),
       (752, 89, 34, 'JOINED', '2025-06-15 00:00:00.000000', '2025-06-15T09:30:15'),
       (753, 89, 36, 'JOINED', '2025-06-15 00:00:00.000000', '2025-06-13T17:51:22');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 748, 'Employee 2 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-16 00:00:00.000000', '2025-06-16 00:00:00.000000', '2025-06-16 00:20:00.000000'),
       (DEFAULT, 749, 'Employee 4 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-16 00:00:00.000000', '2025-06-16 00:00:00.000000', '2025-06-16 00:20:00.000000'),
       (DEFAULT, 750, 'Employee 6 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-16 00:00:00.000000', '2025-06-16 00:00:00.000000', '2025-06-16 00:20:00.000000'),
       (DEFAULT, 751, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-16 00:00:00.000000', '2025-06-16 00:00:00.000000', '2025-06-16 00:20:00.000000'),
       (DEFAULT, 752, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-16 00:00:00.000000', '2025-06-16 00:00:00.000000', '2025-06-16 00:20:00.000000'),
       (DEFAULT, 753, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-16 00:00:00.000000', '2025-06-16 00:00:00.000000', '2025-06-16 00:20:00.000000');

-- 2025-06-20 00:00:00.000000
-- 2025-06-27
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (90, 1, 121, NULL, 'Add logging interceptor', 'Add logging interceptor', NULL, 'ADVANCED', 'BACKEND', 'NORMAL', FALSE, '2025-06-20', '2025-06-27', '2025-06-27', '2025-06-20 00:00:00.000000', '2025-06-20 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (754, 90, 8, 'JOINED', '2025-06-20 00:00:00.000000', '2025-06-20T21:30:15'),
       (755, 90, 10, 'JOINED', '2025-06-20 00:00:00.000000', '2025-06-20T09:40:37'),
       (756, 90, 12, 'JOINED', '2025-06-20 00:00:00.000000', '2025-06-20T05:59:26'),
       (757, 90, 14, 'JOINED', '2025-06-20 00:00:00.000000', '2025-06-19T09:33:42'),
       (758, 90, 38, 'JOINED', '2025-06-20 00:00:00.000000', '2025-06-19T14:00:58'),
       (759, 90, 40, 'JOINED', '2025-06-20 00:00:00.000000', '2025-06-20T17:58:17'),
       (760, 90, 42, 'JOINED', '2025-06-20 00:00:00.000000', '2025-06-20T15:49:15'),
       (761, 90, 44, 'JOINED', '2025-06-20 00:00:00.000000', '2025-06-20T01:59:49');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 754, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-21 14:24:00.000000', '2025-06-21 14:24:00.000000', '2025-06-21 14:44:00.000000'),
       (DEFAULT, 755, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-21 14:24:00.000000', '2025-06-21 14:24:00.000000', '2025-06-21 14:44:00.000000'),
       (DEFAULT, 756, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-21 14:24:00.000000', '2025-06-21 14:24:00.000000', '2025-06-21 14:44:00.000000'),
       (DEFAULT, 757, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-21 14:24:00.000000', '2025-06-21 14:24:00.000000', '2025-06-21 14:44:00.000000'),
       (DEFAULT, 758, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-21 14:24:00.000000', '2025-06-21 14:24:00.000000', '2025-06-21 14:44:00.000000'),
       (DEFAULT, 759, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-21 14:24:00.000000', '2025-06-21 14:24:00.000000', '2025-06-21 14:44:00.000000'),
       (DEFAULT, 760, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-21 14:24:00.000000', '2025-06-21 14:24:00.000000', '2025-06-21 14:44:00.000000'),
       (DEFAULT, 761, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-21 14:24:00.000000', '2025-06-21 14:24:00.000000', '2025-06-21 14:44:00.000000');

-- 2025-06-28 00:00:00.000000
-- 2025-07-04
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (91, 1, 121, NULL, 'Add service layer tests', 'Add service layer tests', NULL, 'NORMAL', 'BACKEND', 'NORMAL', FALSE, '2025-06-28', '2025-07-04', '2025-07-04', '2025-06-28 00:00:00.000000', '2025-06-28 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (762, 91, 16, 'JOINED', '2025-06-28 00:00:00.000000', '2025-06-27T16:20:22'),
       (763, 91, 18, 'JOINED', '2025-06-28 00:00:00.000000', '2025-06-25T19:26:59'),
       (764, 91, 20, 'JOINED', '2025-06-28 00:00:00.000000', '2025-06-27T16:04:14'),
       (765, 91, 46, 'JOINED', '2025-06-28 00:00:00.000000', '2025-06-27T17:57:08'),
       (766, 91, 48, 'JOINED', '2025-06-28 00:00:00.000000', '2025-06-28T00:56:27'),
       (767, 91, 50, 'JOINED', '2025-06-28 00:00:00.000000', '2025-06-28T10:12:52');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 762, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-29 09:36:00.000000', '2025-06-29 09:36:00.000000', '2025-06-29 09:56:00.000000'),
       (DEFAULT, 763, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-29 09:36:00.000000', '2025-06-29 09:36:00.000000', '2025-06-29 09:56:00.000000'),
       (DEFAULT, 764, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-29 09:36:00.000000', '2025-06-29 09:36:00.000000', '2025-06-29 09:56:00.000000'),
       (DEFAULT, 765, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-29 09:36:00.000000', '2025-06-29 09:36:00.000000', '2025-06-29 09:56:00.000000'),
       (DEFAULT, 766, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-29 09:36:00.000000', '2025-06-29 09:36:00.000000', '2025-06-29 09:56:00.000000'),
       (DEFAULT, 767, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-06-29 09:36:00.000000', '2025-06-29 09:36:00.000000', '2025-06-29 09:56:00.000000');

-- 2025-07-05 00:00:00.000000
-- 2025-07-10
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (92, 1, 121, NULL, 'Add repository tests', 'Add repository tests', NULL, 'LIGHT', 'BACKEND', 'NORMAL', FALSE, '2025-07-05', '2025-07-10', '2025-07-10', '2025-07-05 00:00:00.000000', '2025-07-05 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (768, 92, 22, 'JOINED', '2025-07-05 00:00:00.000000', '2025-07-05T03:41:12'),
       (769, 92, 24, 'JOINED', '2025-07-05 00:00:00.000000', '2025-07-05T07:36:12'),
       (770, 92, 26, 'JOINED', '2025-07-05 00:00:00.000000', '2025-07-04T04:59:32'),
       (771, 92, 28, 'JOINED', '2025-07-05 00:00:00.000000', '2025-07-04T19:44:16'),
       (772, 92, 52, 'JOINED', '2025-07-05 00:00:00.000000', '2025-07-04T23:25:27'),
       (773, 92, 54, 'JOINED', '2025-07-05 00:00:00.000000', '2025-07-04T15:14:42'),
       (774, 92, 56, 'JOINED', '2025-07-05 00:00:00.000000', '2025-07-05T11:03:34'),
       (775, 92, 58, 'JOINED', '2025-07-05 00:00:00.000000', '2025-07-04T21:07:12');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 768, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-06 04:48:00.000000', '2025-07-06 04:48:00.000000', '2025-07-06 05:08:00.000000'),
       (DEFAULT, 769, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-06 04:48:00.000000', '2025-07-06 04:48:00.000000', '2025-07-06 05:08:00.000000'),
       (DEFAULT, 770, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-06 04:48:00.000000', '2025-07-06 04:48:00.000000', '2025-07-06 05:08:00.000000'),
       (DEFAULT, 771, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-06 04:48:00.000000', '2025-07-06 04:48:00.000000', '2025-07-06 05:08:00.000000'),
       (DEFAULT, 772, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-06 04:48:00.000000', '2025-07-06 04:48:00.000000', '2025-07-06 05:08:00.000000'),
       (DEFAULT, 773, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-06 04:48:00.000000', '2025-07-06 04:48:00.000000', '2025-07-06 05:08:00.000000'),
       (DEFAULT, 774, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-06 04:48:00.000000', '2025-07-06 04:48:00.000000', '2025-07-06 05:08:00.000000'),
       (DEFAULT, 775, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-06 04:48:00.000000', '2025-07-06 04:48:00.000000', '2025-07-06 05:08:00.000000');

-- 2025-07-11 00:00:00.000000
-- 2025-07-15
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (93, 1, 121, NULL, 'Extract UserMenu component', 'Extract UserMenu component', NULL, 'HARD', 'FRONTEND', 'NORMAL', FALSE, '2025-07-11', '2025-07-15', '2025-07-15', '2025-07-11 00:00:00.000000', '2025-07-11 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (776, 93, 1, 'JOINED', '2025-07-11 00:00:00.000000', '2025-07-10T03:56:10'),
       (777, 93, 3, 'JOINED', '2025-07-11 00:00:00.000000', '2025-07-11T06:25:56'),
       (778, 93, 5, 'JOINED', '2025-07-11 00:00:00.000000', '2025-07-10T15:50:24'),
       (779, 93, 7, 'JOINED', '2025-07-11 00:00:00.000000', '2025-07-11T09:01:27'),
       (780, 93, 31, 'JOINED', '2025-07-11 00:00:00.000000', '2025-07-11T03:50:24'),
       (781, 93, 33, 'JOINED', '2025-07-11 00:00:00.000000', '2025-07-11T12:34:34'),
       (782, 93, 35, 'JOINED', '2025-07-11 00:00:00.000000', '2025-07-09T19:35:03'),
       (783, 93, 37, 'JOINED', '2025-07-11 00:00:00.000000', '2025-07-10T13:49:27');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 776, 'Employee 1 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-12 00:00:00.000000', '2025-07-12 00:00:00.000000', '2025-07-12 00:20:00.000000'),
       (DEFAULT, 777, 'Employee 3 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-12 00:00:00.000000', '2025-07-12 00:00:00.000000', '2025-07-12 00:20:00.000000'),
       (DEFAULT, 778, 'Employee 5 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-12 00:00:00.000000', '2025-07-12 00:00:00.000000', '2025-07-12 00:20:00.000000'),
       (DEFAULT, 779, 'Employee 7 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-12 00:00:00.000000', '2025-07-12 00:00:00.000000', '2025-07-12 00:20:00.000000'),
       (DEFAULT, 780, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-12 00:00:00.000000', '2025-07-12 00:00:00.000000', '2025-07-12 00:20:00.000000'),
       (DEFAULT, 781, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-12 00:00:00.000000', '2025-07-12 00:00:00.000000', '2025-07-12 00:20:00.000000'),
       (DEFAULT, 782, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-12 00:00:00.000000', '2025-07-12 00:00:00.000000', '2025-07-12 00:20:00.000000'),
       (DEFAULT, 783, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-12 00:00:00.000000', '2025-07-12 00:00:00.000000', '2025-07-12 00:20:00.000000');

-- 2025-07-16 00:00:00.000000
-- 2025-07-23
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (94, 1, 121, NULL, 'Create API hook', 'Create API hook', NULL, 'ADVANCED', 'FRONTEND', 'NORMAL', FALSE, '2025-07-16', '2025-07-23', '2025-07-23', '2025-07-16 00:00:00.000000', '2025-07-16 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (784, 94, 9, 'JOINED', '2025-07-16 00:00:00.000000', '2025-07-15T14:00:58'),
       (785, 94, 11, 'JOINED', '2025-07-16 00:00:00.000000', '2025-07-15T04:29:35'),
       (786, 94, 13, 'JOINED', '2025-07-16 00:00:00.000000', '2025-07-15T11:42:44'),
       (787, 94, 39, 'JOINED', '2025-07-16 00:00:00.000000', '2025-07-15T01:52:54'),
       (788, 94, 41, 'JOINED', '2025-07-16 00:00:00.000000', '2025-07-16T04:27:16'),
       (789, 94, 43, 'JOINED', '2025-07-16 00:00:00.000000', '2025-07-14T20:21:08');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 784, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-17 14:24:00.000000', '2025-07-17 14:24:00.000000', '2025-07-17 14:44:00.000000'),
       (DEFAULT, 785, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-17 14:24:00.000000', '2025-07-17 14:24:00.000000', '2025-07-17 14:44:00.000000'),
       (DEFAULT, 786, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-17 14:24:00.000000', '2025-07-17 14:24:00.000000', '2025-07-17 14:44:00.000000'),
       (DEFAULT, 787, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-17 14:24:00.000000', '2025-07-17 14:24:00.000000', '2025-07-17 14:44:00.000000'),
       (DEFAULT, 788, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-17 14:24:00.000000', '2025-07-17 14:24:00.000000', '2025-07-17 14:44:00.000000'),
       (DEFAULT, 789, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-17 14:24:00.000000', '2025-07-17 14:24:00.000000', '2025-07-17 14:44:00.000000');

-- 2025-07-24 00:00:00.000000
-- 2025-07-30
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (95, 1, 121, NULL, 'Create auth hook', 'Create auth hook', NULL, 'NORMAL', 'FRONTEND', 'NORMAL', FALSE, '2025-07-24', '2025-07-30', '2025-07-30', '2025-07-24 00:00:00.000000', '2025-07-24 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (790, 95, 15, 'JOINED', '2025-07-24 00:00:00.000000', '2025-07-23T08:40:43'),
       (791, 95, 17, 'JOINED', '2025-07-24 00:00:00.000000', '2025-07-24T09:56:45'),
       (792, 95, 19, 'JOINED', '2025-07-24 00:00:00.000000', '2025-07-25T07:26:59'),
       (793, 95, 21, 'JOINED', '2025-07-24 00:00:00.000000', '2025-07-23T19:01:38'),
       (794, 95, 45, 'JOINED', '2025-07-24 00:00:00.000000', '2025-07-23T23:51:57'),
       (795, 95, 47, 'JOINED', '2025-07-24 00:00:00.000000', '2025-07-24T11:09:19'),
       (796, 95, 49, 'JOINED', '2025-07-24 00:00:00.000000', '2025-07-24T04:42:15'),
       (797, 95, 51, 'JOINED', '2025-07-24 00:00:00.000000', '2025-07-23T17:49:04');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 790, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-25 09:36:00.000000', '2025-07-25 09:36:00.000000', '2025-07-25 09:56:00.000000'),
       (DEFAULT, 791, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-25 09:36:00.000000', '2025-07-25 09:36:00.000000', '2025-07-25 09:56:00.000000'),
       (DEFAULT, 792, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-25 09:36:00.000000', '2025-07-25 09:36:00.000000', '2025-07-25 09:56:00.000000'),
       (DEFAULT, 793, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-25 09:36:00.000000', '2025-07-25 09:36:00.000000', '2025-07-25 09:56:00.000000'),
       (DEFAULT, 794, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-25 09:36:00.000000', '2025-07-25 09:36:00.000000', '2025-07-25 09:56:00.000000'),
       (DEFAULT, 795, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-25 09:36:00.000000', '2025-07-25 09:36:00.000000', '2025-07-25 09:56:00.000000'),
       (DEFAULT, 796, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-25 09:36:00.000000', '2025-07-25 09:36:00.000000', '2025-07-25 09:56:00.000000'),
       (DEFAULT, 797, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-07-25 09:36:00.000000', '2025-07-25 09:36:00.000000', '2025-07-25 09:56:00.000000');

-- 2025-07-31 00:00:00.000000
-- 2025-08-05
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (96, 1, 121, NULL, 'Create form hook', 'Create form hook', NULL, 'LIGHT', 'FRONTEND', 'NORMAL', FALSE, '2025-07-31', '2025-08-05', '2025-08-05', '2025-07-31 00:00:00.000000', '2025-07-31 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (798, 96, 23, 'JOINED', '2025-07-31 00:00:00.000000', '2025-07-31T08:17:40'),
       (799, 96, 25, 'JOINED', '2025-07-31 00:00:00.000000', '2025-07-30T12:56:27'),
       (800, 96, 27, 'JOINED', '2025-07-31 00:00:00.000000', '2025-07-30T13:03:22'),
       (801, 96, 53, 'JOINED', '2025-07-31 00:00:00.000000', '2025-07-31T10:01:21'),
       (802, 96, 55, 'JOINED', '2025-07-31 00:00:00.000000', '2025-07-31T21:32:33'),
       (803, 96, 57, 'JOINED', '2025-07-31 00:00:00.000000', '2025-07-31T17:23:43');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 798, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-01 04:48:00.000000', '2025-08-01 04:48:00.000000', '2025-08-01 05:08:00.000000'),
       (DEFAULT, 799, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-01 04:48:00.000000', '2025-08-01 04:48:00.000000', '2025-08-01 05:08:00.000000'),
       (DEFAULT, 800, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-01 04:48:00.000000', '2025-08-01 04:48:00.000000', '2025-08-01 05:08:00.000000'),
       (DEFAULT, 801, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-01 04:48:00.000000', '2025-08-01 04:48:00.000000', '2025-08-01 05:08:00.000000'),
       (DEFAULT, 802, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-01 04:48:00.000000', '2025-08-01 04:48:00.000000', '2025-08-01 05:08:00.000000'),
       (DEFAULT, 803, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-01 04:48:00.000000', '2025-08-01 04:48:00.000000', '2025-08-01 05:08:00.000000');

-- 2025-08-06 00:00:00.000000
-- 2025-08-10
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (97, 1, 121, NULL, 'Add controller tests', 'Add controller tests', NULL, 'HARD', 'BACKEND', 'NORMAL', FALSE, '2025-08-06', '2025-08-10', '2025-08-10', '2025-08-06 00:00:00.000000', '2025-08-06 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (804, 97, 2, 'JOINED', '2025-08-06 00:00:00.000000', '2025-08-06T00:15:08'),
       (805, 97, 4, 'JOINED', '2025-08-06 00:00:00.000000', '2025-08-06T10:14:53'),
       (806, 97, 6, 'JOINED', '2025-08-06 00:00:00.000000', '2025-08-05T10:22:48'),
       (807, 97, 32, 'JOINED', '2025-08-06 00:00:00.000000', '2025-08-05T11:11:46'),
       (808, 97, 34, 'JOINED', '2025-08-06 00:00:00.000000', '2025-08-05T14:45:58'),
       (809, 97, 36, 'JOINED', '2025-08-06 00:00:00.000000', '2025-08-05T12:06:51');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 804, 'Employee 2 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-06 18:00:00.000000', '2025-08-06 18:00:00.000000', '2025-08-06 18:20:00.000000'),
       (DEFAULT, 805, 'Employee 4 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-06 18:00:00.000000', '2025-08-06 18:00:00.000000', '2025-08-06 18:20:00.000000'),
       (DEFAULT, 806, 'Employee 6 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-06 18:00:00.000000', '2025-08-06 18:00:00.000000', '2025-08-06 18:20:00.000000'),
       (DEFAULT, 807, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-06 18:00:00.000000', '2025-08-06 18:00:00.000000', '2025-08-06 18:20:00.000000'),
       (DEFAULT, 808, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-06 18:00:00.000000', '2025-08-06 18:00:00.000000', '2025-08-06 18:20:00.000000'),
       (DEFAULT, 809, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-06 18:00:00.000000', '2025-08-06 18:00:00.000000', '2025-08-06 18:20:00.000000');

-- 2025-08-11 00:00:00.000000
-- 2025-08-18
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (98, 1, 121, NULL, 'Integrate with redis cache', 'Integrate with redis cache', NULL, 'ADVANCED', 'BACKEND', 'NORMAL', FALSE, '2025-08-11', '2025-08-18', '2025-08-18', '2025-08-11 00:00:00.000000', '2025-08-11 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (810, 98, 8, 'JOINED', '2025-08-11 00:00:00.000000', '2025-08-11T10:11:43'),
       (811, 98, 10, 'JOINED', '2025-08-11 00:00:00.000000', '2025-08-11T02:31:30'),
       (812, 98, 12, 'JOINED', '2025-08-11 00:00:00.000000', '2025-08-10T16:53:46'),
       (813, 98, 14, 'JOINED', '2025-08-11 00:00:00.000000', '2025-08-09T23:16:14'),
       (814, 98, 38, 'JOINED', '2025-08-11 00:00:00.000000', '2025-08-11T09:22:46'),
       (815, 98, 40, 'JOINED', '2025-08-11 00:00:00.000000', '2025-08-11T04:09:25'),
       (816, 98, 42, 'JOINED', '2025-08-11 00:00:00.000000', '2025-08-11T22:26:07'),
       (817, 98, 44, 'JOINED', '2025-08-11 00:00:00.000000', '2025-08-10T19:50:01');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 810, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-12 04:48:00.000000', '2025-08-12 04:48:00.000000', '2025-08-12 05:08:00.000000'),
       (DEFAULT, 811, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-12 04:48:00.000000', '2025-08-12 04:48:00.000000', '2025-08-12 05:08:00.000000'),
       (DEFAULT, 812, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-12 04:48:00.000000', '2025-08-12 04:48:00.000000', '2025-08-12 05:08:00.000000'),
       (DEFAULT, 813, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-12 04:48:00.000000', '2025-08-12 04:48:00.000000', '2025-08-12 05:08:00.000000'),
       (DEFAULT, 814, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-12 04:48:00.000000', '2025-08-12 04:48:00.000000', '2025-08-12 05:08:00.000000'),
       (DEFAULT, 815, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-12 04:48:00.000000', '2025-08-12 04:48:00.000000', '2025-08-12 05:08:00.000000'),
       (DEFAULT, 816, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-12 04:48:00.000000', '2025-08-12 04:48:00.000000', '2025-08-12 05:08:00.000000'),
       (DEFAULT, 817, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-12 04:48:00.000000', '2025-08-12 04:48:00.000000', '2025-08-12 05:08:00.000000');

-- 2025-08-19 00:00:00.000000
-- 2025-08-25
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (99, 1, 121, NULL, 'Cache task list response', 'Cache task list response', NULL, 'NORMAL', 'BACKEND', 'NORMAL', FALSE, '2025-08-19', '2025-08-25', '2025-08-25', '2025-08-19 00:00:00.000000', '2025-08-19 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (818, 99, 16, 'JOINED', '2025-08-19 00:00:00.000000', '2025-08-17T06:22:11'),
       (819, 99, 18, 'JOINED', '2025-08-19 00:00:00.000000', '2025-08-19T06:29:36'),
       (820, 99, 20, 'JOINED', '2025-08-19 00:00:00.000000', '2025-08-19T12:38:01'),
       (821, 99, 46, 'JOINED', '2025-08-19 00:00:00.000000', '2025-08-18T14:04:17'),
       (822, 99, 48, 'JOINED', '2025-08-19 00:00:00.000000', '2025-08-19T08:29:33'),
       (823, 99, 50, 'JOINED', '2025-08-19 00:00:00.000000', '2025-08-17T03:39:24');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 818, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-20 01:12:00.000000', '2025-08-20 01:12:00.000000', '2025-08-20 01:32:00.000000'),
       (DEFAULT, 819, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-20 01:12:00.000000', '2025-08-20 01:12:00.000000', '2025-08-20 01:32:00.000000'),
       (DEFAULT, 820, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-20 01:12:00.000000', '2025-08-20 01:12:00.000000', '2025-08-20 01:32:00.000000'),
       (DEFAULT, 821, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-20 01:12:00.000000', '2025-08-20 01:12:00.000000', '2025-08-20 01:32:00.000000'),
       (DEFAULT, 822, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-20 01:12:00.000000', '2025-08-20 01:12:00.000000', '2025-08-20 01:32:00.000000'),
       (DEFAULT, 823, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-20 01:12:00.000000', '2025-08-20 01:12:00.000000', '2025-08-20 01:32:00.000000');

-- 2025-08-26 00:00:00.000000
-- 2025-08-31
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (100, 1, 121, NULL, 'Add rate limit filter', 'Add rate limit filter', NULL, 'LIGHT', 'BACKEND', 'NORMAL', FALSE, '2025-08-26', '2025-08-31', '2025-08-31', '2025-08-26 00:00:00.000000', '2025-08-26 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (824, 100, 22, 'JOINED', '2025-08-26 00:00:00.000000', '2025-08-25T22:35:20'),
       (825, 100, 24, 'JOINED', '2025-08-26 00:00:00.000000', '2025-08-25T19:02:22'),
       (826, 100, 26, 'JOINED', '2025-08-26 00:00:00.000000', '2025-08-25T13:53:55'),
       (827, 100, 28, 'JOINED', '2025-08-26 00:00:00.000000', '2025-08-25T03:07:38'),
       (828, 100, 52, 'JOINED', '2025-08-26 00:00:00.000000', '2025-08-26T01:31:36'),
       (829, 100, 54, 'JOINED', '2025-08-26 00:00:00.000000', '2025-08-26T03:36:26'),
       (830, 100, 56, 'JOINED', '2025-08-26 00:00:00.000000', '2025-08-26T14:30:03'),
       (831, 100, 58, 'JOINED', '2025-08-26 00:00:00.000000', '2025-08-25T11:41:43');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 824, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-26 21:36:00.000000', '2025-08-26 21:36:00.000000', '2025-08-26 21:56:00.000000'),
       (DEFAULT, 825, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-26 21:36:00.000000', '2025-08-26 21:36:00.000000', '2025-08-26 21:56:00.000000'),
       (DEFAULT, 826, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-26 21:36:00.000000', '2025-08-26 21:36:00.000000', '2025-08-26 21:56:00.000000'),
       (DEFAULT, 827, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-26 21:36:00.000000', '2025-08-26 21:36:00.000000', '2025-08-26 21:56:00.000000'),
       (DEFAULT, 828, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-26 21:36:00.000000', '2025-08-26 21:36:00.000000', '2025-08-26 21:56:00.000000'),
       (DEFAULT, 829, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-26 21:36:00.000000', '2025-08-26 21:36:00.000000', '2025-08-26 21:56:00.000000'),
       (DEFAULT, 830, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-26 21:36:00.000000', '2025-08-26 21:36:00.000000', '2025-08-26 21:56:00.000000'),
       (DEFAULT, 831, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-08-26 21:36:00.000000', '2025-08-26 21:36:00.000000', '2025-08-26 21:56:00.000000');

-- 2025-09-01 00:00:00.000000
-- 2025-09-05
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (101, 1, 121, NULL, 'Integrate login API', 'Integrate login API', NULL, 'HARD', 'FRONTEND', 'NORMAL', FALSE, '2025-09-01', '2025-09-05', '2025-09-05', '2025-09-01 00:00:00.000000', '2025-09-01 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (832, 101, 1, 'JOINED', '2025-09-01 00:00:00.000000', '2025-08-31T23:26:10'),
       (833, 101, 3, 'JOINED', '2025-09-01 00:00:00.000000', '2025-08-31T13:14:10'),
       (834, 101, 5, 'JOINED', '2025-09-01 00:00:00.000000', '2025-08-31T10:35:03'),
       (835, 101, 7, 'JOINED', '2025-09-01 00:00:00.000000', '2025-08-31T15:53:17'),
       (836, 101, 31, 'JOINED', '2025-09-01 00:00:00.000000', '2025-08-30T06:01:27'),
       (837, 101, 33, 'JOINED', '2025-09-01 00:00:00.000000', '2025-08-30T08:34:27'),
       (838, 101, 35, 'JOINED', '2025-09-01 00:00:00.000000', '2025-09-01T07:23:32'),
       (839, 101, 37, 'JOINED', '2025-09-01 00:00:00.000000', '2025-08-31T17:18:58');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 832, 'Employee 1 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-01 18:00:00.000000', '2025-09-01 18:00:00.000000', '2025-09-01 18:20:00.000000'),
       (DEFAULT, 833, 'Employee 3 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-01 18:00:00.000000', '2025-09-01 18:00:00.000000', '2025-09-01 18:20:00.000000'),
       (DEFAULT, 834, 'Employee 5 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-01 18:00:00.000000', '2025-09-01 18:00:00.000000', '2025-09-01 18:20:00.000000'),
       (DEFAULT, 835, 'Employee 7 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-01 18:00:00.000000', '2025-09-01 18:00:00.000000', '2025-09-01 18:20:00.000000'),
       (DEFAULT, 836, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-01 18:00:00.000000', '2025-09-01 18:00:00.000000', '2025-09-01 18:20:00.000000'),
       (DEFAULT, 837, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-01 18:00:00.000000', '2025-09-01 18:00:00.000000', '2025-09-01 18:20:00.000000'),
       (DEFAULT, 838, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-01 18:00:00.000000', '2025-09-01 18:00:00.000000', '2025-09-01 18:20:00.000000'),
       (DEFAULT, 839, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-01 18:00:00.000000', '2025-09-01 18:00:00.000000', '2025-09-01 18:20:00.000000');

-- 2025-09-06 00:00:00.000000
-- 2025-09-13
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (102, 1, 121, NULL, 'Integrate register API', 'Integrate register API', NULL, 'ADVANCED', 'FRONTEND', 'NORMAL', FALSE, '2025-09-06', '2025-09-13', '2025-09-13', '2025-09-06 00:00:00.000000', '2025-09-06 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (840, 102, 9, 'JOINED', '2025-09-06 00:00:00.000000', '2025-09-04T08:54:32'),
       (841, 102, 11, 'JOINED', '2025-09-06 00:00:00.000000', '2025-09-04T01:33:54'),
       (842, 102, 13, 'JOINED', '2025-09-06 00:00:00.000000', '2025-09-04T13:18:55'),
       (843, 102, 39, 'JOINED', '2025-09-06 00:00:00.000000', '2025-09-04T04:00:47'),
       (844, 102, 41, 'JOINED', '2025-09-06 00:00:00.000000', '2025-09-06T07:54:38'),
       (845, 102, 43, 'JOINED', '2025-09-06 00:00:00.000000', '2025-09-04T04:20:22');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 840, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-07 04:48:00.000000', '2025-09-07 04:48:00.000000', '2025-09-07 05:08:00.000000'),
       (DEFAULT, 841, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-07 04:48:00.000000', '2025-09-07 04:48:00.000000', '2025-09-07 05:08:00.000000'),
       (DEFAULT, 842, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-07 04:48:00.000000', '2025-09-07 04:48:00.000000', '2025-09-07 05:08:00.000000'),
       (DEFAULT, 843, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-07 04:48:00.000000', '2025-09-07 04:48:00.000000', '2025-09-07 05:08:00.000000'),
       (DEFAULT, 844, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-07 04:48:00.000000', '2025-09-07 04:48:00.000000', '2025-09-07 05:08:00.000000'),
       (DEFAULT, 845, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-07 04:48:00.000000', '2025-09-07 04:48:00.000000', '2025-09-07 05:08:00.000000');

-- 2025-09-14 00:00:00.000000
-- 2025-09-20
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (103, 1, 121, NULL, 'Integrate task API', 'Integrate task API', NULL, 'NORMAL', 'FRONTEND', 'NORMAL', FALSE, '2025-09-14', '2025-09-20', '2025-09-20', '2025-09-14 00:00:00.000000', '2025-09-14 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (846, 103, 15, 'JOINED', '2025-09-14 00:00:00.000000', '2025-09-13T07:13:01'),
       (847, 103, 17, 'JOINED', '2025-09-14 00:00:00.000000', '2025-09-13T08:30:08'),
       (848, 103, 19, 'JOINED', '2025-09-14 00:00:00.000000', '2025-09-14T02:04'),
       (849, 103, 21, 'JOINED', '2025-09-14 00:00:00.000000', '2025-09-14T13:55:08'),
       (850, 103, 45, 'JOINED', '2025-09-14 00:00:00.000000', '2025-09-13T22:55:30'),
       (851, 103, 47, 'JOINED', '2025-09-14 00:00:00.000000', '2025-09-13T11:55:46'),
       (852, 103, 49, 'JOINED', '2025-09-14 00:00:00.000000', '2025-09-12T05:22:12'),
       (853, 103, 51, 'JOINED', '2025-09-14 00:00:00.000000', '2025-09-13T06:04:28');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 846, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-15 01:12:00.000000', '2025-09-15 01:12:00.000000', '2025-09-15 01:32:00.000000'),
       (DEFAULT, 847, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-15 01:12:00.000000', '2025-09-15 01:12:00.000000', '2025-09-15 01:32:00.000000'),
       (DEFAULT, 848, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-15 01:12:00.000000', '2025-09-15 01:12:00.000000', '2025-09-15 01:32:00.000000'),
       (DEFAULT, 849, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-15 01:12:00.000000', '2025-09-15 01:12:00.000000', '2025-09-15 01:32:00.000000'),
       (DEFAULT, 850, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-15 01:12:00.000000', '2025-09-15 01:12:00.000000', '2025-09-15 01:32:00.000000'),
       (DEFAULT, 851, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-15 01:12:00.000000', '2025-09-15 01:12:00.000000', '2025-09-15 01:32:00.000000'),
       (DEFAULT, 852, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-15 01:12:00.000000', '2025-09-15 01:12:00.000000', '2025-09-15 01:32:00.000000'),
       (DEFAULT, 853, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-15 01:12:00.000000', '2025-09-15 01:12:00.000000', '2025-09-15 01:32:00.000000');

-- 2025-09-21 00:00:00.000000
-- 2025-09-26
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (104, 1, 121, NULL, 'Store token in cookie', 'Store token in cookie', NULL, 'LIGHT', 'FRONTEND', 'NORMAL', FALSE, '2025-09-21', '2025-09-26', '2025-09-26', '2025-09-21 00:00:00.000000', '2025-09-21 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (854, 104, 23, 'JOINED', '2025-09-21 00:00:00.000000', '2025-09-20T04:57:48'),
       (855, 104, 25, 'JOINED', '2025-09-21 00:00:00.000000', '2025-09-20T22:28'),
       (856, 104, 27, 'JOINED', '2025-09-21 00:00:00.000000', '2025-09-21T01:53:37'),
       (857, 104, 53, 'JOINED', '2025-09-21 00:00:00.000000', '2025-09-19T17:42:09'),
       (858, 104, 55, 'JOINED', '2025-09-21 00:00:00.000000', '2025-09-19T14:16:31'),
       (859, 104, 57, 'JOINED', '2025-09-21 00:00:00.000000', '2025-09-21T17:41');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 854, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-21 21:36:00.000000', '2025-09-21 21:36:00.000000', '2025-09-21 21:56:00.000000'),
       (DEFAULT, 855, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-21 21:36:00.000000', '2025-09-21 21:36:00.000000', '2025-09-21 21:56:00.000000'),
       (DEFAULT, 856, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-21 21:36:00.000000', '2025-09-21 21:36:00.000000', '2025-09-21 21:56:00.000000'),
       (DEFAULT, 857, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-21 21:36:00.000000', '2025-09-21 21:36:00.000000', '2025-09-21 21:56:00.000000'),
       (DEFAULT, 858, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-21 21:36:00.000000', '2025-09-21 21:36:00.000000', '2025-09-21 21:56:00.000000'),
       (DEFAULT, 859, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-21 21:36:00.000000', '2025-09-21 21:36:00.000000', '2025-09-21 21:56:00.000000');

-- 2025-09-27 00:00:00.000000
-- 2025-10-01
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (105, 1, 121, NULL, 'Add health check endpoint', 'Add health check endpoint', NULL, 'HARD', 'BACKEND', 'NORMAL', FALSE, '2025-09-27', '2025-10-01', '2025-10-01', '2025-09-27 00:00:00.000000', '2025-09-27 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (860, 105, 2, 'JOINED', '2025-09-27 00:00:00.000000', '2025-09-26T11:29:03'),
       (861, 105, 4, 'JOINED', '2025-09-27 00:00:00.000000', '2025-09-26T15:02:53'),
       (862, 105, 6, 'JOINED', '2025-09-27 00:00:00.000000', '2025-09-26T03:10:05'),
       (863, 105, 32, 'JOINED', '2025-09-27 00:00:00.000000', '2025-09-26T20:13:56'),
       (864, 105, 34, 'JOINED', '2025-09-27 00:00:00.000000', '2025-09-25T16:41:32'),
       (865, 105, 36, 'JOINED', '2025-09-27 00:00:00.000000', '2025-09-25T13:14:10');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 860, 'Employee 2 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-27 12:00:00.000000', '2025-09-27 12:00:00.000000', '2025-09-27 12:20:00.000000'),
       (DEFAULT, 861, 'Employee 4 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-27 12:00:00.000000', '2025-09-27 12:00:00.000000', '2025-09-27 12:20:00.000000'),
       (DEFAULT, 862, 'Employee 6 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-27 12:00:00.000000', '2025-09-27 12:00:00.000000', '2025-09-27 12:20:00.000000'),
       (DEFAULT, 863, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-27 12:00:00.000000', '2025-09-27 12:00:00.000000', '2025-09-27 12:20:00.000000'),
       (DEFAULT, 864, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-27 12:00:00.000000', '2025-09-27 12:00:00.000000', '2025-09-27 12:20:00.000000'),
       (DEFAULT, 865, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-09-27 12:00:00.000000', '2025-09-27 12:00:00.000000', '2025-09-27 12:20:00.000000');

-- 2025-10-02 00:00:00.000000
-- 2025-10-09
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (106, 1, 121, NULL, 'Add metrics endpoint', 'Add metrics endpoint', NULL, 'ADVANCED', 'BACKEND', 'NORMAL', FALSE, '2025-10-02', '2025-10-09', '2025-10-09', '2025-10-02 00:00:00.000000', '2025-10-02 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (866, 106, 8, 'JOINED', '2025-10-02 00:00:00.000000', '2025-09-30T08:47:37'),
       (867, 106, 10, 'JOINED', '2025-10-02 00:00:00.000000', '2025-09-30T12:25:21'),
       (868, 106, 12, 'JOINED', '2025-10-02 00:00:00.000000', '2025-09-28T18:05:12'),
       (869, 106, 14, 'JOINED', '2025-10-02 00:00:00.000000', '2025-10-01T17:58:17'),
       (870, 106, 38, 'JOINED', '2025-10-02 00:00:00.000000', '2025-10-02T05:01:50'),
       (871, 106, 40, 'JOINED', '2025-10-02 00:00:00.000000', '2025-09-30T19:51:11'),
       (872, 106, 42, 'JOINED', '2025-10-02 00:00:00.000000', '2025-09-29T16:43:24'),
       (873, 106, 44, 'JOINED', '2025-10-02 00:00:00.000000', '2025-09-29T12:13:50');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 866, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-02 19:12:00.000000', '2025-10-02 19:12:00.000000', '2025-10-02 19:32:00.000000'),
       (DEFAULT, 867, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-02 19:12:00.000000', '2025-10-02 19:12:00.000000', '2025-10-02 19:32:00.000000'),
       (DEFAULT, 868, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-02 19:12:00.000000', '2025-10-02 19:12:00.000000', '2025-10-02 19:32:00.000000'),
       (DEFAULT, 869, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-02 19:12:00.000000', '2025-10-02 19:12:00.000000', '2025-10-02 19:32:00.000000'),
       (DEFAULT, 870, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-02 19:12:00.000000', '2025-10-02 19:12:00.000000', '2025-10-02 19:32:00.000000'),
       (DEFAULT, 871, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-02 19:12:00.000000', '2025-10-02 19:12:00.000000', '2025-10-02 19:32:00.000000'),
       (DEFAULT, 872, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-02 19:12:00.000000', '2025-10-02 19:12:00.000000', '2025-10-02 19:32:00.000000'),
       (DEFAULT, 873, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-02 19:12:00.000000', '2025-10-02 19:12:00.000000', '2025-10-02 19:32:00.000000');

-- 2025-10-10 00:00:00.000000
-- 2025-10-16
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (107, 1, 121, NULL, 'Implement scheduled cleanup', 'Implement scheduled cleanup', NULL, 'NORMAL', 'BACKEND', 'NORMAL', FALSE, '2025-10-10', '2025-10-16', '2025-10-16', '2025-10-10 00:00:00.000000', '2025-10-10 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (874, 107, 16, 'JOINED', '2025-10-10 00:00:00.000000', '2025-10-08T11:34:40'),
       (875, 107, 18, 'JOINED', '2025-10-10 00:00:00.000000', '2025-10-08T20:48:03'),
       (876, 107, 20, 'JOINED', '2025-10-10 00:00:00.000000', '2025-10-08T14:08:53'),
       (877, 107, 46, 'JOINED', '2025-10-10 00:00:00.000000', '2025-10-10T01:04:31'),
       (878, 107, 48, 'JOINED', '2025-10-10 00:00:00.000000', '2025-10-09T03:09:05'),
       (879, 107, 50, 'JOINED', '2025-10-10 00:00:00.000000', '2025-10-07T07:45:25');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 874, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-10 16:48:00.000000', '2025-10-10 16:48:00.000000', '2025-10-10 17:08:00.000000'),
       (DEFAULT, 875, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-10 16:48:00.000000', '2025-10-10 16:48:00.000000', '2025-10-10 17:08:00.000000'),
       (DEFAULT, 876, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-10 16:48:00.000000', '2025-10-10 16:48:00.000000', '2025-10-10 17:08:00.000000'),
       (DEFAULT, 877, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-10 16:48:00.000000', '2025-10-10 16:48:00.000000', '2025-10-10 17:08:00.000000'),
       (DEFAULT, 878, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-10 16:48:00.000000', '2025-10-10 16:48:00.000000', '2025-10-10 17:08:00.000000'),
       (DEFAULT, 879, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-10 16:48:00.000000', '2025-10-10 16:48:00.000000', '2025-10-10 17:08:00.000000');

-- 2025-10-17 00:00:00.000000
-- 2025-10-22
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (108, 1, 121, NULL, 'Implement audit logs', 'Implement audit logs', NULL, 'LIGHT', 'BACKEND', 'NORMAL', FALSE, '2025-10-17', '2025-10-22', '2025-10-22', '2025-10-17 00:00:00.000000', '2025-10-17 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (880, 108, 22, 'JOINED', '2025-10-17 00:00:00.000000', '2025-10-16T05:28:54'),
       (881, 108, 24, 'JOINED', '2025-10-17 00:00:00.000000', '2025-10-14T16:09:25'),
       (882, 108, 26, 'JOINED', '2025-10-17 00:00:00.000000', '2025-10-16T20:54:15'),
       (883, 108, 28, 'JOINED', '2025-10-17 00:00:00.000000', '2025-10-15T16:31:18'),
       (884, 108, 52, 'JOINED', '2025-10-17 00:00:00.000000', '2025-10-15T21:34:34'),
       (885, 108, 54, 'JOINED', '2025-10-17 00:00:00.000000', '2025-10-17T07:16:20'),
       (886, 108, 56, 'JOINED', '2025-10-17 00:00:00.000000', '2025-10-15T12:06:55'),
       (887, 108, 58, 'JOINED', '2025-10-17 00:00:00.000000', '2025-10-16T02:37:50');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 880, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-17 14:24:00.000000', '2025-10-17 14:24:00.000000', '2025-10-17 14:44:00.000000'),
       (DEFAULT, 881, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-17 14:24:00.000000', '2025-10-17 14:24:00.000000', '2025-10-17 14:44:00.000000'),
       (DEFAULT, 882, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-17 14:24:00.000000', '2025-10-17 14:24:00.000000', '2025-10-17 14:44:00.000000'),
       (DEFAULT, 883, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-17 14:24:00.000000', '2025-10-17 14:24:00.000000', '2025-10-17 14:44:00.000000'),
       (DEFAULT, 884, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-17 14:24:00.000000', '2025-10-17 14:24:00.000000', '2025-10-17 14:44:00.000000'),
       (DEFAULT, 885, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-17 14:24:00.000000', '2025-10-17 14:24:00.000000', '2025-10-17 14:44:00.000000'),
       (DEFAULT, 886, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-17 14:24:00.000000', '2025-10-17 14:24:00.000000', '2025-10-17 14:44:00.000000'),
       (DEFAULT, 887, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-17 14:24:00.000000', '2025-10-17 14:24:00.000000', '2025-10-17 14:44:00.000000');

-- 2025-10-23 00:00:00.000000
-- 2025-10-27
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (109, 1, 121, NULL, 'Protect private routes', 'Protect private routes', NULL, 'HARD', 'FRONTEND', 'NORMAL', FALSE, '2025-10-23', '2025-10-27', '2025-10-27', '2025-10-23 00:00:00.000000', '2025-10-23 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (888, 109, 1, 'JOINED', '2025-10-23 00:00:00.000000', '2025-10-22T12:27:22'),
       (889, 109, 3, 'JOINED', '2025-10-23 00:00:00.000000', '2025-10-22T23:34:48'),
       (890, 109, 5, 'JOINED', '2025-10-23 00:00:00.000000', '2025-10-22T10:17:46'),
       (891, 109, 7, 'JOINED', '2025-10-23 00:00:00.000000', '2025-10-22T06:18'),
       (892, 109, 31, 'JOINED', '2025-10-23 00:00:00.000000', '2025-10-22T18:56:10'),
       (893, 109, 33, 'JOINED', '2025-10-23 00:00:00.000000', '2025-10-22T19:54:29'),
       (894, 109, 35, 'JOINED', '2025-10-23 00:00:00.000000', '2025-10-22T05:13:12'),
       (895, 109, 37, 'JOINED', '2025-10-23 00:00:00.000000', '2025-10-23T06:23:03');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 888, 'Employee 1 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-23 12:00:00.000000', '2025-10-23 12:00:00.000000', '2025-10-23 12:20:00.000000'),
       (DEFAULT, 889, 'Employee 3 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-23 12:00:00.000000', '2025-10-23 12:00:00.000000', '2025-10-23 12:20:00.000000'),
       (DEFAULT, 890, 'Employee 5 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-23 12:00:00.000000', '2025-10-23 12:00:00.000000', '2025-10-23 12:20:00.000000'),
       (DEFAULT, 891, 'Employee 7 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-23 12:00:00.000000', '2025-10-23 12:00:00.000000', '2025-10-23 12:20:00.000000'),
       (DEFAULT, 892, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-23 12:00:00.000000', '2025-10-23 12:00:00.000000', '2025-10-23 12:20:00.000000'),
       (DEFAULT, 893, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-23 12:00:00.000000', '2025-10-23 12:00:00.000000', '2025-10-23 12:20:00.000000'),
       (DEFAULT, 894, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-23 12:00:00.000000', '2025-10-23 12:00:00.000000', '2025-10-23 12:20:00.000000'),
       (DEFAULT, 895, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-23 12:00:00.000000', '2025-10-23 12:00:00.000000', '2025-10-23 12:20:00.000000');

-- 2025-10-28 00:00:00.000000
-- 2025-11-04
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (110, 1, 121, NULL, 'Redirect if unauthenticated', 'Redirect if unauthenticated', NULL, 'ADVANCED', 'FRONTEND', 'NORMAL', FALSE, '2025-10-28', '2025-11-04', '2025-11-04', '2025-10-28 00:00:00.000000', '2025-10-28 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (896, 110, 9, 'JOINED', '2025-10-28 00:00:00.000000', '2025-10-25T22:04:48'),
       (897, 110, 11, 'JOINED', '2025-10-28 00:00:00.000000', '2025-10-25T11:53:06'),
       (898, 110, 13, 'JOINED', '2025-10-28 00:00:00.000000', '2025-10-26T08:06:09'),
       (899, 110, 39, 'JOINED', '2025-10-28 00:00:00.000000', '2025-10-27T05:21:25'),
       (900, 110, 41, 'JOINED', '2025-10-28 00:00:00.000000', '2025-10-26T06:53:35'),
       (901, 110, 43, 'JOINED', '2025-10-28 00:00:00.000000', '2025-10-26T07:24:41');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 896, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-28 19:12:00.000000', '2025-10-28 19:12:00.000000', '2025-10-28 19:32:00.000000'),
       (DEFAULT, 897, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-28 19:12:00.000000', '2025-10-28 19:12:00.000000', '2025-10-28 19:32:00.000000'),
       (DEFAULT, 898, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-28 19:12:00.000000', '2025-10-28 19:12:00.000000', '2025-10-28 19:32:00.000000'),
       (DEFAULT, 899, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-28 19:12:00.000000', '2025-10-28 19:12:00.000000', '2025-10-28 19:32:00.000000'),
       (DEFAULT, 900, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-28 19:12:00.000000', '2025-10-28 19:12:00.000000', '2025-10-28 19:32:00.000000'),
       (DEFAULT, 901, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-10-28 19:12:00.000000', '2025-10-28 19:12:00.000000', '2025-10-28 19:32:00.000000');

-- 2025-11-05 00:00:00.000000
-- 2025-11-11
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (111, 1, 121, NULL, 'Create 404 page', 'Create 404 page', NULL, 'NORMAL', 'FRONTEND', 'NORMAL', FALSE, '2025-11-05', '2025-11-11', '2025-11-11', '2025-11-05 00:00:00.000000', '2025-11-05 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (902, 111, 15, 'JOINED', '2025-11-05 00:00:00.000000', '2025-11-03T07:20:39'),
       (903, 111, 17, 'JOINED', '2025-11-05 00:00:00.000000', '2025-11-03T18:59:12'),
       (904, 111, 19, 'JOINED', '2025-11-05 00:00:00.000000', '2025-11-03T22:00:38'),
       (905, 111, 21, 'JOINED', '2025-11-05 00:00:00.000000', '2025-11-04T08:08:27'),
       (906, 111, 45, 'JOINED', '2025-11-05 00:00:00.000000', '2025-11-04T20:23:17'),
       (907, 111, 47, 'JOINED', '2025-11-05 00:00:00.000000', '2025-11-03T10:31:10'),
       (908, 111, 49, 'JOINED', '2025-11-05 00:00:00.000000', '2025-11-04T04:03:31'),
       (909, 111, 51, 'JOINED', '2025-11-05 00:00:00.000000', '2025-11-04T05:16:05');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 902, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-05 16:48:00.000000', '2025-11-05 16:48:00.000000', '2025-11-05 17:08:00.000000'),
       (DEFAULT, 903, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-05 16:48:00.000000', '2025-11-05 16:48:00.000000', '2025-11-05 17:08:00.000000'),
       (DEFAULT, 904, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-05 16:48:00.000000', '2025-11-05 16:48:00.000000', '2025-11-05 17:08:00.000000'),
       (DEFAULT, 905, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-05 16:48:00.000000', '2025-11-05 16:48:00.000000', '2025-11-05 17:08:00.000000'),
       (DEFAULT, 906, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-05 16:48:00.000000', '2025-11-05 16:48:00.000000', '2025-11-05 17:08:00.000000'),
       (DEFAULT, 907, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-05 16:48:00.000000', '2025-11-05 16:48:00.000000', '2025-11-05 17:08:00.000000'),
       (DEFAULT, 908, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-05 16:48:00.000000', '2025-11-05 16:48:00.000000', '2025-11-05 17:08:00.000000'),
       (DEFAULT, 909, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-05 16:48:00.000000', '2025-11-05 16:48:00.000000', '2025-11-05 17:08:00.000000');

-- 2025-11-12 00:00:00.000000
-- 2025-11-17
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (112, 1, 121, NULL, 'Create 500 page', 'Create 500 page', NULL, 'LIGHT', 'FRONTEND', 'NORMAL', FALSE, '2025-11-12', '2025-11-17', '2025-11-17', '2025-11-12 00:00:00.000000', '2025-11-12 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (910, 112, 23, 'JOINED', '2025-11-12 00:00:00.000000', '2025-11-11T16:29:52'),
       (911, 112, 25, 'JOINED', '2025-11-12 00:00:00.000000', '2025-11-09T21:59:20'),
       (912, 112, 27, 'JOINED', '2025-11-12 00:00:00.000000', '2025-11-12T01:10:51'),
       (913, 112, 53, 'JOINED', '2025-11-12 00:00:00.000000', '2025-11-11T05:44:27'),
       (914, 112, 55, 'JOINED', '2025-11-12 00:00:00.000000', '2025-11-11T23:22'),
       (915, 112, 57, 'JOINED', '2025-11-12 00:00:00.000000', '2025-11-12T10:30:44');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 910, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-12 14:24:00.000000', '2025-11-12 14:24:00.000000', '2025-11-12 14:44:00.000000'),
       (DEFAULT, 911, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-12 14:24:00.000000', '2025-11-12 14:24:00.000000', '2025-11-12 14:44:00.000000'),
       (DEFAULT, 912, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-12 14:24:00.000000', '2025-11-12 14:24:00.000000', '2025-11-12 14:44:00.000000'),
       (DEFAULT, 913, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-12 14:24:00.000000', '2025-11-12 14:24:00.000000', '2025-11-12 14:44:00.000000'),
       (DEFAULT, 914, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-12 14:24:00.000000', '2025-11-12 14:24:00.000000', '2025-11-12 14:44:00.000000'),
       (DEFAULT, 915, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-12 14:24:00.000000', '2025-11-12 14:24:00.000000', '2025-11-12 14:44:00.000000');

-- 2025-11-18 00:00:00.000000
-- 2025-11-22
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (113, 1, 121, NULL, 'Add user activity tracking', 'Add user activity tracking', NULL, 'HARD', 'BACKEND', 'NORMAL', FALSE, '2025-11-18', '2025-11-22', '2025-11-22', '2025-11-18 00:00:00.000000', '2025-11-18 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (916, 113, 2, 'JOINED', '2025-11-18 00:00:00.000000', '2025-11-16T21:37:27'),
       (917, 113, 4, 'JOINED', '2025-11-18 00:00:00.000000', '2025-11-15T10:23:53'),
       (918, 113, 6, 'JOINED', '2025-11-18 00:00:00.000000', '2025-11-17T16:32:53'),
       (919, 113, 32, 'JOINED', '2025-11-18 00:00:00.000000', '2025-11-16T00:11:32'),
       (920, 113, 34, 'JOINED', '2025-11-18 00:00:00.000000', '2025-11-17T13:07:41'),
       (921, 113, 36, 'JOINED', '2025-11-18 00:00:00.000000', '2025-11-17T04:34:41');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 916, 'Employee 2 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-18 06:00:00.000000', '2025-11-18 06:00:00.000000', '2025-11-18 06:20:00.000000'),
       (DEFAULT, 917, 'Employee 4 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-18 06:00:00.000000', '2025-11-18 06:00:00.000000', '2025-11-18 06:20:00.000000'),
       (DEFAULT, 918, 'Employee 6 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-18 06:00:00.000000', '2025-11-18 06:00:00.000000', '2025-11-18 06:20:00.000000'),
       (DEFAULT, 919, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-18 06:00:00.000000', '2025-11-18 06:00:00.000000', '2025-11-18 06:20:00.000000'),
       (DEFAULT, 920, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-18 06:00:00.000000', '2025-11-18 06:00:00.000000', '2025-11-18 06:20:00.000000'),
       (DEFAULT, 921, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-18 06:00:00.000000', '2025-11-18 06:00:00.000000', '2025-11-18 06:20:00.000000');

-- 2025-11-23 00:00:00.000000
-- 2025-11-30
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (114, 1, 121, NULL, 'Refactor service layers', 'Refactor service layers', NULL, 'ADVANCED', 'BACKEND', 'NORMAL', FALSE, '2025-11-23', '2025-11-30', '2025-11-30', '2025-11-23 00:00:00.000000', '2025-11-23 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (922, 114, 8, 'JOINED', '2025-11-23 00:00:00.000000', '2025-11-21T10:43:24'),
       (923, 114, 10, 'JOINED', '2025-11-23 00:00:00.000000', '2025-11-21T03:36:35'),
       (924, 114, 12, 'JOINED', '2025-11-23 00:00:00.000000', '2025-11-21T12:32:50'),
       (925, 114, 14, 'JOINED', '2025-11-23 00:00:00.000000', '2025-11-21T13:38:30'),
       (926, 114, 38, 'JOINED', '2025-11-23 00:00:00.000000', '2025-11-21T13:05:40'),
       (927, 114, 40, 'JOINED', '2025-11-23 00:00:00.000000', '2025-11-21T02:19:59'),
       (928, 114, 42, 'JOINED', '2025-11-23 00:00:00.000000', '2025-11-19T11:50:48'),
       (929, 114, 44, 'JOINED', '2025-11-23 00:00:00.000000', '2025-11-21T17:06:26');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 922, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-23 09:36:00.000000', '2025-11-23 09:36:00.000000', '2025-11-23 09:56:00.000000'),
       (DEFAULT, 923, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-23 09:36:00.000000', '2025-11-23 09:36:00.000000', '2025-11-23 09:56:00.000000'),
       (DEFAULT, 924, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-23 09:36:00.000000', '2025-11-23 09:36:00.000000', '2025-11-23 09:56:00.000000'),
       (DEFAULT, 925, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-23 09:36:00.000000', '2025-11-23 09:36:00.000000', '2025-11-23 09:56:00.000000'),
       (DEFAULT, 926, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-23 09:36:00.000000', '2025-11-23 09:36:00.000000', '2025-11-23 09:56:00.000000'),
       (DEFAULT, 927, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-23 09:36:00.000000', '2025-11-23 09:36:00.000000', '2025-11-23 09:56:00.000000'),
       (DEFAULT, 928, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-23 09:36:00.000000', '2025-11-23 09:36:00.000000', '2025-11-23 09:56:00.000000'),
       (DEFAULT, 929, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-11-23 09:36:00.000000', '2025-11-23 09:36:00.000000', '2025-11-23 09:56:00.000000');

-- 2025-12-01 00:00:00.000000
-- 2025-12-07
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (115, 1, 121, NULL, 'Optimize database queries', 'Optimize database queries', NULL, 'NORMAL', 'BACKEND', 'NORMAL', FALSE, '2025-12-01', '2025-12-07', '2025-12-07', '2025-12-01 00:00:00.000000', '2025-12-01 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (930, 115, 16, 'JOINED', '2025-12-01 00:00:00.000000', '2025-11-27T18:22:33'),
       (931, 115, 18, 'JOINED', '2025-12-01 00:00:00.000000', '2025-11-27T14:23:09'),
       (932, 115, 20, 'JOINED', '2025-12-01 00:00:00.000000', '2025-11-30T00:47:58'),
       (933, 115, 46, 'JOINED', '2025-12-01 00:00:00.000000', '2025-11-28T14:00:24'),
       (934, 115, 48, 'JOINED', '2025-12-01 00:00:00.000000', '2025-11-29T11:04:25'),
       (935, 115, 50, 'JOINED', '2025-12-01 00:00:00.000000', '2025-11-28T18:57:15');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 930, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-01 08:24:00.000000', '2025-12-01 08:24:00.000000', '2025-12-01 08:44:00.000000'),
       (DEFAULT, 931, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-01 08:24:00.000000', '2025-12-01 08:24:00.000000', '2025-12-01 08:44:00.000000'),
       (DEFAULT, 932, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-01 08:24:00.000000', '2025-12-01 08:24:00.000000', '2025-12-01 08:44:00.000000'),
       (DEFAULT, 933, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-01 08:24:00.000000', '2025-12-01 08:24:00.000000', '2025-12-01 08:44:00.000000'),
       (DEFAULT, 934, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-01 08:24:00.000000', '2025-12-01 08:24:00.000000', '2025-12-01 08:44:00.000000'),
       (DEFAULT, 935, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-01 08:24:00.000000', '2025-12-01 08:24:00.000000', '2025-12-01 08:44:00.000000');

-- 2025-12-08 00:00:00.000000
-- 2025-12-13
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (116, 1, 121, NULL, 'Add transactional annotations', 'Add transactional annotations', NULL, 'LIGHT', 'BACKEND', 'NORMAL', FALSE, '2025-12-08', '2025-12-13', '2025-12-13', '2025-12-08 00:00:00.000000', '2025-12-08 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (936, 116, 22, 'JOINED', '2025-12-08 00:00:00.000000', '2025-12-05T14:05'),
       (937, 116, 24, 'JOINED', '2025-12-08 00:00:00.000000', '2025-12-05T16:16:20'),
       (938, 116, 26, 'JOINED', '2025-12-08 00:00:00.000000', '2025-12-06T10:11:35'),
       (939, 116, 28, 'JOINED', '2025-12-08 00:00:00.000000', '2025-12-07T21:53:52'),
       (940, 116, 52, 'JOINED', '2025-12-08 00:00:00.000000', '2025-12-06T15:31:41'),
       (941, 116, 54, 'JOINED', '2025-12-08 00:00:00.000000', '2025-12-05T22:09:16'),
       (942, 116, 56, 'JOINED', '2025-12-08 00:00:00.000000', '2025-12-06T05:40:43'),
       (943, 116, 58, 'JOINED', '2025-12-08 00:00:00.000000', '2025-12-05T18:27:39');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 936, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-08 07:12:00.000000', '2025-12-08 07:12:00.000000', '2025-12-08 07:32:00.000000'),
       (DEFAULT, 937, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-08 07:12:00.000000', '2025-12-08 07:12:00.000000', '2025-12-08 07:32:00.000000'),
       (DEFAULT, 938, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-08 07:12:00.000000', '2025-12-08 07:12:00.000000', '2025-12-08 07:32:00.000000'),
       (DEFAULT, 939, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-08 07:12:00.000000', '2025-12-08 07:12:00.000000', '2025-12-08 07:32:00.000000'),
       (DEFAULT, 940, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-08 07:12:00.000000', '2025-12-08 07:12:00.000000', '2025-12-08 07:32:00.000000'),
       (DEFAULT, 941, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-08 07:12:00.000000', '2025-12-08 07:12:00.000000', '2025-12-08 07:32:00.000000'),
       (DEFAULT, 942, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-08 07:12:00.000000', '2025-12-08 07:12:00.000000', '2025-12-08 07:32:00.000000'),
       (DEFAULT, 943, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-08 07:12:00.000000', '2025-12-08 07:12:00.000000', '2025-12-08 07:32:00.000000');

-- 2025-12-14 00:00:00.000000
-- 2025-12-18
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (117, 1, 121, NULL, 'Make main page responsive', 'Make main page responsive', NULL, 'HARD', 'FRONTEND', 'NORMAL', FALSE, '2025-12-14', '2025-12-18', '2025-12-18', '2025-12-14 00:00:00.000000', '2025-12-14 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (944, 117, 1, 'JOINED', '2025-12-14 00:00:00.000000', '2025-12-12T04:58:48'),
       (945, 117, 3, 'JOINED', '2025-12-14 00:00:00.000000', '2025-12-13T03:19:27'),
       (946, 117, 5, 'JOINED', '2025-12-14 00:00:00.000000', '2025-12-13T09:28:48'),
       (947, 117, 7, 'JOINED', '2025-12-14 00:00:00.000000', '2025-12-13T21:06:29'),
       (948, 117, 31, 'JOINED', '2025-12-14 00:00:00.000000', '2025-12-11T21:34:12'),
       (949, 117, 33, 'JOINED', '2025-12-14 00:00:00.000000', '2025-12-12T19:54:51'),
       (950, 117, 35, 'JOINED', '2025-12-14 00:00:00.000000', '2025-12-11T09:56:32'),
       (951, 117, 37, 'JOINED', '2025-12-14 00:00:00.000000', '2025-12-13T09:08:17');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 944, 'Employee 1 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-14 06:00:00.000000', '2025-12-14 06:00:00.000000', '2025-12-14 06:20:00.000000'),
       (DEFAULT, 945, 'Employee 3 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-14 06:00:00.000000', '2025-12-14 06:00:00.000000', '2025-12-14 06:20:00.000000'),
       (DEFAULT, 946, 'Employee 5 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-14 06:00:00.000000', '2025-12-14 06:00:00.000000', '2025-12-14 06:20:00.000000'),
       (DEFAULT, 947, 'Employee 7 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-14 06:00:00.000000', '2025-12-14 06:00:00.000000', '2025-12-14 06:20:00.000000'),
       (DEFAULT, 948, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-14 06:00:00.000000', '2025-12-14 06:00:00.000000', '2025-12-14 06:20:00.000000'),
       (DEFAULT, 949, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-14 06:00:00.000000', '2025-12-14 06:00:00.000000', '2025-12-14 06:20:00.000000'),
       (DEFAULT, 950, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-14 06:00:00.000000', '2025-12-14 06:00:00.000000', '2025-12-14 06:20:00.000000'),
       (DEFAULT, 951, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-14 06:00:00.000000', '2025-12-14 06:00:00.000000', '2025-12-14 06:20:00.000000');

-- 2025-12-19 00:00:00.000000
-- 2025-12-26
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (118, 1, 121, NULL, 'Make task page responsive', 'Make task page responsive', NULL, 'ADVANCED', 'FRONTEND', 'NORMAL', FALSE, '2025-12-19', '2025-12-26', '2025-12-26', '2025-12-19 00:00:00.000000', '2025-12-19 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (952, 118, 9, 'JOINED', '2025-12-19 00:00:00.000000', '2025-12-18T13:54:03'),
       (953, 118, 11, 'JOINED', '2025-12-19 00:00:00.000000', '2025-12-16T16:29'),
       (954, 118, 13, 'JOINED', '2025-12-19 00:00:00.000000', '2025-12-17T18:01:10'),
       (955, 118, 39, 'JOINED', '2025-12-19 00:00:00.000000', '2025-12-14T20:09:36'),
       (956, 118, 41, 'JOINED', '2025-12-19 00:00:00.000000', '2025-12-18T12:37:27'),
       (957, 118, 43, 'JOINED', '2025-12-19 00:00:00.000000', '2025-12-16T19:35:03');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 952, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-19 09:36:00.000000', '2025-12-19 09:36:00.000000', '2025-12-19 09:56:00.000000'),
       (DEFAULT, 953, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-19 09:36:00.000000', '2025-12-19 09:36:00.000000', '2025-12-19 09:56:00.000000'),
       (DEFAULT, 954, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-19 09:36:00.000000', '2025-12-19 09:36:00.000000', '2025-12-19 09:56:00.000000'),
       (DEFAULT, 955, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-19 09:36:00.000000', '2025-12-19 09:36:00.000000', '2025-12-19 09:56:00.000000'),
       (DEFAULT, 956, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-19 09:36:00.000000', '2025-12-19 09:36:00.000000', '2025-12-19 09:56:00.000000'),
       (DEFAULT, 957, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-19 09:36:00.000000', '2025-12-19 09:36:00.000000', '2025-12-19 09:56:00.000000');

-- 2025-12-27 00:00:00.000000
-- 2026-01-02
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (119, 1, 121, NULL, 'Add dark mode toggle', 'Add dark mode toggle', NULL, 'NORMAL', 'FRONTEND', 'NORMAL', FALSE, '2025-12-27', '2026-01-02', '2026-01-02', '2025-12-27 00:00:00.000000', '2025-12-27 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (958, 119, 15, 'JOINED', '2025-12-27 00:00:00.000000', '2025-12-24T14:48:16'),
       (959, 119, 17, 'JOINED', '2025-12-27 00:00:00.000000', '2025-12-25T22:14:45'),
       (960, 119, 19, 'JOINED', '2025-12-27 00:00:00.000000', '2025-12-23T09:55:01'),
       (961, 119, 21, 'JOINED', '2025-12-27 00:00:00.000000', '2025-12-23T23:09:49'),
       (962, 119, 45, 'JOINED', '2025-12-27 00:00:00.000000', '2025-12-24T18:18:57'),
       (963, 119, 47, 'JOINED', '2025-12-27 00:00:00.000000', '2025-12-25T22:14:45'),
       (964, 119, 49, 'JOINED', '2025-12-27 00:00:00.000000', '2025-12-24T03:57:06'),
       (965, 119, 51, 'JOINED', '2025-12-27 00:00:00.000000', '2025-12-24T23:15:48');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 958, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-27 08:24:00.000000', '2025-12-27 08:24:00.000000', '2025-12-27 08:44:00.000000'),
       (DEFAULT, 959, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-27 08:24:00.000000', '2025-12-27 08:24:00.000000', '2025-12-27 08:44:00.000000'),
       (DEFAULT, 960, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-27 08:24:00.000000', '2025-12-27 08:24:00.000000', '2025-12-27 08:44:00.000000'),
       (DEFAULT, 961, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-27 08:24:00.000000', '2025-12-27 08:24:00.000000', '2025-12-27 08:44:00.000000'),
       (DEFAULT, 962, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-27 08:24:00.000000', '2025-12-27 08:24:00.000000', '2025-12-27 08:44:00.000000'),
       (DEFAULT, 963, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-27 08:24:00.000000', '2025-12-27 08:24:00.000000', '2025-12-27 08:44:00.000000'),
       (DEFAULT, 964, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-27 08:24:00.000000', '2025-12-27 08:24:00.000000', '2025-12-27 08:44:00.000000'),
       (DEFAULT, 965, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2025-12-27 08:24:00.000000', '2025-12-27 08:24:00.000000', '2025-12-27 08:44:00.000000');

-- 2026-01-03 00:00:00.000000
-- 2026-01-08
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (120, 1, 121, NULL, 'Optimize mobile UI', 'Optimize mobile UI', NULL, 'LIGHT', 'FRONTEND', 'NORMAL', FALSE, '2026-01-03', '2026-01-08', '2026-01-08', '2026-01-03 00:00:00.000000', '2026-01-03 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (966, 120, 23, 'JOINED', '2026-01-03 00:00:00.000000', '2025-12-30T18:14:50'),
       (967, 120, 25, 'JOINED', '2026-01-03 00:00:00.000000', '2025-12-31T14:37:50'),
       (968, 120, 27, 'JOINED', '2026-01-03 00:00:00.000000', '2026-01-01T05:48:55'),
       (969, 120, 53, 'JOINED', '2026-01-03 00:00:00.000000', '2025-12-31T13:23:58'),
       (970, 120, 55, 'JOINED', '2026-01-03 00:00:00.000000', '2026-01-01T10:11:35'),
       (971, 120, 57, 'JOINED', '2026-01-03 00:00:00.000000', '2025-12-31T21:44:39');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 966, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-03 07:12:00.000000', '2026-01-03 07:12:00.000000', '2026-01-03 07:32:00.000000'),
       (DEFAULT, 967, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-03 07:12:00.000000', '2026-01-03 07:12:00.000000', '2026-01-03 07:32:00.000000'),
       (DEFAULT, 968, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-03 07:12:00.000000', '2026-01-03 07:12:00.000000', '2026-01-03 07:32:00.000000'),
       (DEFAULT, 969, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-03 07:12:00.000000', '2026-01-03 07:12:00.000000', '2026-01-03 07:32:00.000000'),
       (DEFAULT, 970, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-03 07:12:00.000000', '2026-01-03 07:12:00.000000', '2026-01-03 07:32:00.000000'),
       (DEFAULT, 971, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-03 07:12:00.000000', '2026-01-03 07:12:00.000000', '2026-01-03 07:32:00.000000');

-- 2026-01-09 00:00:00.000000
-- 2026-01-13
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (121, 1, 121, NULL, 'Prepare production config', 'Prepare production config', NULL, 'HARD', 'BACKEND', 'NORMAL', FALSE, '2026-01-09', '2026-01-13', '2026-01-13', '2026-01-09 00:00:00.000000', '2026-01-09 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (972, 121, 2, 'JOINED', '2026-01-09 00:00:00.000000', '2026-01-06T16:55:12'),
       (973, 121, 4, 'JOINED', '2026-01-09 00:00:00.000000', '2026-01-08T14:52:48'),
       (974, 121, 6, 'JOINED', '2026-01-09 00:00:00.000000', '2026-01-07T01:19:12'),
       (975, 121, 32, 'JOINED', '2026-01-09 00:00:00.000000', '2026-01-05T18:57:36'),
       (976, 121, 34, 'JOINED', '2026-01-09 00:00:00.000000', '2026-01-07T14:52:48'),
       (977, 121, 36, 'JOINED', '2026-01-09 00:00:00.000000', '2026-01-08T02:24');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 972, 'Employee 2 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-09 00:00:00.000000', '2026-01-09 00:00:00.000000', '2026-01-09 00:20:00.000000'),
       (DEFAULT, 973, 'Employee 4 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-09 00:00:00.000000', '2026-01-09 00:00:00.000000', '2026-01-09 00:20:00.000000'),
       (DEFAULT, 974, 'Employee 6 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-09 00:00:00.000000', '2026-01-09 00:00:00.000000', '2026-01-09 00:20:00.000000'),
       (DEFAULT, 975, 'Employee 32 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-09 00:00:00.000000', '2026-01-09 00:00:00.000000', '2026-01-09 00:20:00.000000'),
       (DEFAULT, 976, 'Employee 34 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-09 00:00:00.000000', '2026-01-09 00:00:00.000000', '2026-01-09 00:20:00.000000'),
       (DEFAULT, 977, 'Employee 36 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-09 00:00:00.000000', '2026-01-09 00:00:00.000000', '2026-01-09 00:20:00.000000');

-- 2026-01-14 00:00:00.000000
-- 2026-01-21
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (122, 1, 121, NULL, 'Dockerize backend service', 'Dockerize backend service', NULL, 'ADVANCED', 'BACKEND', 'NORMAL', FALSE, '2026-01-14', '2026-01-21', '2026-01-21', '2026-01-14 00:00:00.000000', '2026-01-14 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (978, 122, 8, 'JOINED', '2026-01-14 00:00:00.000000', '2026-01-11T05:11:03'),
       (979, 122, 10, 'JOINED', '2026-01-14 00:00:00.000000', '2026-01-12T09:24:29'),
       (980, 122, 12, 'JOINED', '2026-01-14 00:00:00.000000', '2026-01-12T15:33:08'),
       (981, 122, 14, 'JOINED', '2026-01-14 00:00:00.000000', '2026-01-12T16:42:15'),
       (982, 122, 38, 'JOINED', '2026-01-14 00:00:00.000000', '2026-01-11T14:58:34'),
       (983, 122, 40, 'JOINED', '2026-01-14 00:00:00.000000', '2026-01-12T01:55:12'),
       (984, 122, 42, 'JOINED', '2026-01-14 00:00:00.000000', '2026-01-09T19:12:01'),
       (985, 122, 44, 'JOINED', '2026-01-14 00:00:00.000000', '2026-01-10T02:18:15');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 978, 'Employee 8 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-14 00:00:00.000000', '2026-01-14 00:00:00.000000', '2026-01-14 00:20:00.000000'),
       (DEFAULT, 979, 'Employee 10 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-14 00:00:00.000000', '2026-01-14 00:00:00.000000', '2026-01-14 00:20:00.000000'),
       (DEFAULT, 980, 'Employee 12 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-14 00:00:00.000000', '2026-01-14 00:00:00.000000', '2026-01-14 00:20:00.000000'),
       (DEFAULT, 981, 'Employee 14 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-14 00:00:00.000000', '2026-01-14 00:00:00.000000', '2026-01-14 00:20:00.000000'),
       (DEFAULT, 982, 'Employee 38 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-14 00:00:00.000000', '2026-01-14 00:00:00.000000', '2026-01-14 00:20:00.000000'),
       (DEFAULT, 983, 'Employee 40 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-14 00:00:00.000000', '2026-01-14 00:00:00.000000', '2026-01-14 00:20:00.000000'),
       (DEFAULT, 984, 'Employee 42 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-14 00:00:00.000000', '2026-01-14 00:00:00.000000', '2026-01-14 00:20:00.000000'),
       (DEFAULT, 985, 'Employee 44 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-14 00:00:00.000000', '2026-01-14 00:00:00.000000', '2026-01-14 00:20:00.000000');

-- 2026-01-22 00:00:00.000000
-- 2026-01-28
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (123, 1, 121, NULL, 'Write deployment script', 'Write deployment script', NULL, 'NORMAL', 'BACKEND', 'NORMAL', FALSE, '2026-01-22', '2026-01-28', '2026-01-28', '2026-01-22 00:00:00.000000', '2026-01-22 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (986, 123, 16, 'JOINED', '2026-01-22 00:00:00.000000', '2026-01-20T12:53:17'),
       (987, 123, 18, 'JOINED', '2026-01-22 00:00:00.000000', '2026-01-20T16:35:03'),
       (988, 123, 20, 'JOINED', '2026-01-22 00:00:00.000000', '2026-01-17T20:02:24'),
       (989, 123, 46, 'JOINED', '2026-01-22 00:00:00.000000', '2026-01-19T20:15:22'),
       (990, 123, 48, 'JOINED', '2026-01-22 00:00:00.000000', '2026-01-16T15:38:53'),
       (991, 123, 50, 'JOINED', '2026-01-22 00:00:00.000000', '2026-01-19T22:46:34');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 986, 'Employee 16 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-22 00:00:00.000000', '2026-01-22 00:00:00.000000', '2026-01-22 00:20:00.000000'),
       (DEFAULT, 987, 'Employee 18 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-22 00:00:00.000000', '2026-01-22 00:00:00.000000', '2026-01-22 00:20:00.000000'),
       (DEFAULT, 988, 'Employee 20 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-22 00:00:00.000000', '2026-01-22 00:00:00.000000', '2026-01-22 00:20:00.000000'),
       (DEFAULT, 989, 'Employee 46 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-22 00:00:00.000000', '2026-01-22 00:00:00.000000', '2026-01-22 00:20:00.000000'),
       (DEFAULT, 990, 'Employee 48 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-22 00:00:00.000000', '2026-01-22 00:00:00.000000', '2026-01-22 00:20:00.000000'),
       (DEFAULT, 991, 'Employee 50 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-22 00:00:00.000000', '2026-01-22 00:00:00.000000', '2026-01-22 00:20:00.000000');

-- 2026-01-29 00:00:00.000000
-- 2026-02-03
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (124, 1, 121, NULL, 'Refactor service rest layers', 'Refactor service rest layers', NULL, 'LIGHT', 'BACKEND', 'NORMAL', FALSE, '2026-01-29', '2026-02-03', '2026-02-03', '2026-01-29 00:00:00.000000', '2026-01-29 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (992, 124, 22, 'JOINED', '2026-01-29 00:00:00.000000', '2026-01-26T20:44:10'),
       (993, 124, 24, 'JOINED', '2026-01-29 00:00:00.000000', '2026-01-26T14:24'),
       (994, 124, 26, 'JOINED', '2026-01-29 00:00:00.000000', '2026-01-27T03:12:58'),
       (995, 124, 28, 'JOINED', '2026-01-29 00:00:00.000000', '2026-01-27T11:08:10'),
       (996, 124, 52, 'JOINED', '2026-01-29 00:00:00.000000', '2026-01-26T22:53:46'),
       (997, 124, 54, 'JOINED', '2026-01-29 00:00:00.000000', '2026-01-27T01:37:56'),
       (998, 124, 56, 'JOINED', '2026-01-29 00:00:00.000000', '2026-01-25T07:43:41'),
       (999, 124, 58, 'JOINED', '2026-01-29 00:00:00.000000', '2026-01-28T08:26:53');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 992, 'Employee 22 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-29 00:00:00.000000', '2026-01-29 00:00:00.000000', '2026-01-29 00:20:00.000000'),
       (DEFAULT, 993, 'Employee 24 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-29 00:00:00.000000', '2026-01-29 00:00:00.000000', '2026-01-29 00:20:00.000000'),
       (DEFAULT, 994, 'Employee 26 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-29 00:00:00.000000', '2026-01-29 00:00:00.000000', '2026-01-29 00:20:00.000000'),
       (DEFAULT, 995, 'Employee 28 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-29 00:00:00.000000', '2026-01-29 00:00:00.000000', '2026-01-29 00:20:00.000000'),
       (DEFAULT, 996, 'Employee 52 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-29 00:00:00.000000', '2026-01-29 00:00:00.000000', '2026-01-29 00:20:00.000000'),
       (DEFAULT, 997, 'Employee 54 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-29 00:00:00.000000', '2026-01-29 00:00:00.000000', '2026-01-29 00:20:00.000000'),
       (DEFAULT, 998, 'Employee 56 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-29 00:00:00.000000', '2026-01-29 00:00:00.000000', '2026-01-29 00:20:00.000000'),
       (DEFAULT, 999, 'Employee 58 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-01-29 00:00:00.000000', '2026-01-29 00:00:00.000000', '2026-01-29 00:20:00.000000');

-- 2026-02-04 00:00:00.000000
-- 2026-02-08
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (125, 1, 121, NULL, 'Create shared icon set', 'Create shared icon set', NULL, 'HARD', 'FRONTEND', 'NORMAL', FALSE, '2026-02-04', '2026-02-08', '2026-02-08', '2026-02-04 00:00:00.000000', '2026-02-04 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (1000, 125, 1, 'JOINED', '2026-02-04 00:00:00.000000', '2026-01-31T21:07:12'),
       (1001, 125, 3, 'JOINED', '2026-02-04 00:00:00.000000', '2026-02-02T04:19:12'),
       (1002, 125, 5, 'JOINED', '2026-02-04 00:00:00.000000', '2026-02-01T07:40:48'),
       (1003, 125, 7, 'JOINED', '2026-02-04 00:00:00.000000', '2026-02-01T11:09:36'),
       (1004, 125, 31, 'JOINED', '2026-02-04 00:00:00.000000', '2026-02-02T04:55:12'),
       (1005, 125, 33, 'JOINED', '2026-02-04 00:00:00.000000', '2026-02-03T00:00'),
       (1006, 125, 35, 'JOINED', '2026-02-04 00:00:00.000000', '2026-02-03T01:04:48'),
       (1007, 125, 37, 'JOINED', '2026-02-04 00:00:00.000000', '2026-02-02T20:02:24');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 1000, 'Employee 1 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-04 00:00:00.000000', '2026-02-04 00:00:00.000000', '2026-02-04 00:20:00.000000'),
       (DEFAULT, 1001, 'Employee 3 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-04 00:00:00.000000', '2026-02-04 00:00:00.000000', '2026-02-04 00:20:00.000000'),
       (DEFAULT, 1002, 'Employee 5 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-04 00:00:00.000000', '2026-02-04 00:00:00.000000', '2026-02-04 00:20:00.000000'),
       (DEFAULT, 1003, 'Employee 7 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-04 00:00:00.000000', '2026-02-04 00:00:00.000000', '2026-02-04 00:20:00.000000'),
       (DEFAULT, 1004, 'Employee 31 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-04 00:00:00.000000', '2026-02-04 00:00:00.000000', '2026-02-04 00:20:00.000000'),
       (DEFAULT, 1005, 'Employee 33 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-04 00:00:00.000000', '2026-02-04 00:00:00.000000', '2026-02-04 00:20:00.000000'),
       (DEFAULT, 1006, 'Employee 35 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-04 00:00:00.000000', '2026-02-04 00:00:00.000000', '2026-02-04 00:20:00.000000'),
       (DEFAULT, 1007, 'Employee 37 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-04 00:00:00.000000', '2026-02-04 00:00:00.000000', '2026-02-04 00:20:00.000000');

-- 2026-02-09 00:00:00.000000
-- 2026-02-16
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (126, 1, 121, NULL, 'Build color theme', 'Build color theme', NULL, 'ADVANCED', 'FRONTEND', 'NORMAL', FALSE, '2026-02-09', '2026-02-16', '2026-02-16', '2026-02-09 00:00:00.000000', '2026-02-09 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (1008, 126, 9, 'JOINED', '2026-02-09 00:00:00.000000', '2026-02-07T00:34:34'),
       (1009, 126, 11, 'JOINED', '2026-02-09 00:00:00.000000', '2026-02-05T19:00:29'),
       (1010, 126, 13, 'JOINED', '2026-02-09 00:00:00.000000', '2026-02-07T20:55:41'),
       (1011, 126, 39, 'JOINED', '2026-02-09 00:00:00.000000', '2026-02-06T16:30:44'),
       (1012, 126, 41, 'JOINED', '2026-02-09 00:00:00.000000', '2026-02-05T21:53:17'),
       (1013, 126, 43, 'JOINED', '2026-02-09 00:00:00.000000', '2026-02-06T07:06:15');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 1008, 'Employee 9 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-09 00:00:00.000000', '2026-02-09 00:00:00.000000', '2026-02-09 00:20:00.000000'),
       (DEFAULT, 1009, 'Employee 11 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-09 00:00:00.000000', '2026-02-09 00:00:00.000000', '2026-02-09 00:20:00.000000'),
       (DEFAULT, 1010, 'Employee 13 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-09 00:00:00.000000', '2026-02-09 00:00:00.000000', '2026-02-09 00:20:00.000000'),
       (DEFAULT, 1011, 'Employee 39 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-09 00:00:00.000000', '2026-02-09 00:00:00.000000', '2026-02-09 00:20:00.000000'),
       (DEFAULT, 1012, 'Employee 41 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-09 00:00:00.000000', '2026-02-09 00:00:00.000000', '2026-02-09 00:20:00.000000'),
       (DEFAULT, 1013, 'Employee 43 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-09 00:00:00.000000', '2026-02-09 00:00:00.000000', '2026-02-09 00:20:00.000000');

-- 2026-02-17 00:00:00.000000
-- 2026-02-23
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (127, 1, 121, NULL, 'Define typography scale', 'Define typography scale', NULL, 'NORMAL', 'FRONTEND', 'NORMAL', FALSE, '2026-02-17', '2026-02-23', '2026-02-23', '2026-02-17 00:00:00.000000', '2026-02-17 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (1014, 127, 15, 'JOINED', '2026-02-17 00:00:00.000000', '2026-02-13T12:10:05'),
       (1015, 127, 17, 'JOINED', '2026-02-17 00:00:00.000000', '2026-02-13T15:41:46'),
       (1016, 127, 19, 'JOINED', '2026-02-17 00:00:00.000000', '2026-02-14T11:00:58'),
       (1017, 127, 21, 'JOINED', '2026-02-17 00:00:00.000000', '2026-02-15T02:08:10'),
       (1018, 127, 45, 'JOINED', '2026-02-17 00:00:00.000000', '2026-02-16T22:29:17'),
       (1019, 127, 47, 'JOINED', '2026-02-17 00:00:00.000000', '2026-02-13T08:08:10'),
       (1020, 127, 49, 'JOINED', '2026-02-17 00:00:00.000000', '2026-02-13T13:50:53'),
       (1021, 127, 51, 'JOINED', '2026-02-17 00:00:00.000000', '2026-02-15T12:12:58');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 1014, 'Employee 15 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-17 00:00:00.000000', '2026-02-17 00:00:00.000000', '2026-02-17 00:20:00.000000'),
       (DEFAULT, 1015, 'Employee 17 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-17 00:00:00.000000', '2026-02-17 00:00:00.000000', '2026-02-17 00:20:00.000000'),
       (DEFAULT, 1016, 'Employee 19 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-17 00:00:00.000000', '2026-02-17 00:00:00.000000', '2026-02-17 00:20:00.000000'),
       (DEFAULT, 1017, 'Employee 21 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-17 00:00:00.000000', '2026-02-17 00:00:00.000000', '2026-02-17 00:20:00.000000'),
       (DEFAULT, 1018, 'Employee 45 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-17 00:00:00.000000', '2026-02-17 00:00:00.000000', '2026-02-17 00:20:00.000000'),
       (DEFAULT, 1019, 'Employee 47 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-17 00:00:00.000000', '2026-02-17 00:00:00.000000', '2026-02-17 00:20:00.000000'),
       (DEFAULT, 1020, 'Employee 49 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-17 00:00:00.000000', '2026-02-17 00:00:00.000000', '2026-02-17 00:20:00.000000'),
       (DEFAULT, 1021, 'Employee 51 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-17 00:00:00.000000', '2026-02-17 00:00:00.000000', '2026-02-17 00:20:00.000000');

-- 2026-02-24 00:00:00.000000
-- 2026-03-01
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (128, 1, 121, NULL, 'Add UI tests with Cypress', 'Add UI tests with Cypress', NULL, 'LIGHT', 'FRONTEND', 'NORMAL', FALSE, '2026-02-24', '2026-03-01', '2026-03-01', '2026-02-24 00:00:00.000000', '2026-02-24 00:00:00.000000');
INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES (1022, 128, 23, 'JOINED', '2026-02-24 00:00:00.000000', '2026-02-23T01:58:05'),
       (1023, 128, 25, 'JOINED', '2026-02-24 00:00:00.000000', '2026-02-22T02:29:46'),
       (1024, 128, 27, 'JOINED', '2026-02-24 00:00:00.000000', '2026-02-21T19:35:03'),
       (1025, 128, 53, 'JOINED', '2026-02-24 00:00:00.000000', '2026-02-21T01:52:20'),
       (1026, 128, 55, 'JOINED', '2026-02-24 00:00:00.000000', '2026-02-20T08:18:15'),
       (1027, 128, 57, 'JOINED', '2026-02-24 00:00:00.000000', '2026-02-22T20:55:41');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES (DEFAULT, 1022, 'Employee 23 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-24 00:00:00.000000', '2026-02-24 00:00:00.000000', '2026-02-24 00:20:00.000000'),
       (DEFAULT, 1023, 'Employee 25 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-24 00:00:00.000000', '2026-02-24 00:00:00.000000', '2026-02-24 00:20:00.000000'),
       (DEFAULT, 1024, 'Employee 27 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-24 00:00:00.000000', '2026-02-24 00:00:00.000000', '2026-02-24 00:20:00.000000'),
       (DEFAULT, 1025, 'Employee 53 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-24 00:00:00.000000', '2026-02-24 00:00:00.000000', '2026-02-24 00:20:00.000000'),
       (DEFAULT, 1026, 'Employee 55 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-24 00:00:00.000000', '2026-02-24 00:00:00.000000', '2026-02-24 00:20:00.000000'),
       (DEFAULT, 1027, 'Employee 57 submit Report', 'Completed Task.', NULL, 'APPROVED', '2026-02-24 00:00:00.000000', '2026-02-24 00:00:00.000000', '2026-02-24 00:20:00.000000');

ALTER TABLE project AUTO_INCREMENT = 2;
ALTER TABLE project_role AUTO_INCREMENT = 3;
ALTER TABLE `phase` AUTO_INCREMENT = 2;
ALTER TABLE collection AUTO_INCREMENT = 2;
ALTER TABLE task AUTO_INCREMENT = 129;
ALTER TABLE task_for_users AUTO_INCREMENT = 1028;

COMMIT;