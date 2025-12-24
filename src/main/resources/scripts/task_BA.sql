
START TRANSACTION;

INSERT INTO project (`id`, `created_time`, `description`, `due_date`, `expected_start_date`, `name`, `status`, `updated_time`, `created_by_id`)
VALUES (5, '2020-01-01 00:00:00.000000', 'This is CVWritingSupporter BusinessAnalysis', '2024-06-08', '2020-01-01', 'CVWritingSupporter BusinessAnalysis', 'IN_PROGRESS', '2020-01-01 00:00:00.000000', 154);


INSERT INTO project_role (`id`, `role`, `project_id`, `user_info_id`) VALUES (9, 'OWNER', 5, 154);
INSERT INTO project_role (`id`, `role`, `project_id`, `user_info_id`) VALUES (10, 'MEMBER', 5, 151);


INSERT INTO `phase` (`id`, `created_time`, `description`, `due_date`, `start_date`, `name`, `updated_time`, `project_id`, `created_by_id`)
VALUES (14, '2020-01-01 00:05:00.000000', 'This is Database Design', '2021-03-06', '2020-01-01', 'Database Design', '2020-01-01 00:05:00.000000', 5, 154);


INSERT INTO collection (`id`, `created_time`, `description`, `due_date`, `start_date`, `name`, `updated_time`, `phase_id`, `created_by_id`)
VALUES (73, '2020-01-01 00:10:00.000000', 'This is Business Requirements Analysis', '2020-05-14', '2020-01-01', 'Business Requirements Analysis', '2020-01-01 00:10:00.000000', 14, 154);


-- 2020-01-02 00:15:00.000000
-- 2020-01-02
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1112, 73, 151, NULL, 'Analyze CV Data Requirements', 'This is Analyze CV Data Requirements', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2020-01-02', '2020-01-29', '2020-01-09', '2020-01-02 00:15:00.000000', '2020-01-02 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20699, 1112, 146, 'JOINED', '2020-01-02 00:15:00.000000', '2020-01-08 07:27:00.000000'),
(20700, 1112, 147, 'JOINED', '2020-01-02 00:15:00.000000', '2020-01-02 12:20:45.600000'),
(20701, 1112, 148, 'JOINED', '2020-01-02 00:15:00.000000', '2020-01-03 13:32:45.600000'),
(20702, 1112, 149, 'JOINED', '2020-01-02 00:15:00.000000', '2020-01-02 15:22:12.000000'),
(20703, 1112, 150, 'JOINED', '2020-01-02 00:15:00.000000', '2020-01-08 07:27:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20699, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-01-29 05:15:57.600000', '2020-01-29 05:15:57.600000', '2020-01-29 05:20:57.600000'),
(DEFAULT, 20700, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-01-06 07:03:57.600000', '2020-01-06 07:03:57.600000', '2020-01-06 07:08:57.600000'),
(DEFAULT, 20701, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-01-07 03:23:38.400000', '2020-01-07 03:23:38.400000', '2020-01-07 03:28:38.400000'),
(DEFAULT, 20702, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-01-15 09:07:48.000000', '2020-01-15 09:07:48.000000', '2020-01-15 09:12:48.000000'),
(DEFAULT, 20703, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-01-28 03:23:38.400000', '2020-01-28 03:23:38.400000', '2020-01-28 03:28:38.400000');

-- 2020-01-10 00:15:00.000000
-- 2020-01-10
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1113, 73, 151, NULL, 'Identify Core CV Entities', 'This is Identify Core CV Entities', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2020-01-10', '2020-02-05', '2020-01-17', '2020-01-10 00:15:00.000000', '2020-01-10 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20705, 1113, 146, 'JOINED', '2020-01-10 00:15:00.000000', '2020-01-16 07:27:00.000000'),
(20706, 1113, 147, 'JOINED', '2020-01-10 00:15:00.000000', '2020-01-16 07:27:00.000000'),
(20707, 1113, 148, 'JOINED', '2020-01-10 00:15:00.000000', '2020-01-11 05:03:43.200000'),
(20708, 1113, 149, 'JOINED', '2020-01-10 00:15:00.000000', '2020-01-10 11:00:07.200000'),
(20709, 1113, 150, 'JOINED', '2020-01-10 00:15:00.000000', '2020-01-12 03:29:24.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20705, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-05 01:32:45.600000', '2020-02-05 01:32:45.600000', '2020-02-05 01:37:45.600000'),
(DEFAULT, 20706, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-03 09:43:48.000000', '2020-02-03 09:43:48.000000', '2020-02-03 09:48:48.000000'),
(DEFAULT, 20707, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-01-22 19:26:16.800000', '2020-01-22 19:26:16.800000', '2020-01-22 19:31:16.800000'),
(DEFAULT, 20708, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-01-23 13:29:52.800000', '2020-01-23 13:29:52.800000', '2020-01-23 13:34:52.800000'),
(DEFAULT, 20709, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-01-14 14:57:43.200000', '2020-01-14 14:57:43.200000', '2020-01-14 15:02:43.200000');

-- 2020-01-18 00:15:00.000000
-- 2020-01-18
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1114, 73, 151, NULL, 'Define User Data Scope', 'This is Define User Data Scope', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2020-01-18', '2020-02-13', '2020-01-25', '2020-01-18 00:15:00.000000', '2020-01-18 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20711, 1114, 146, 'JOINED', '2020-01-18 00:15:00.000000', '2020-01-20 01:28:26.400000'),
(20712, 1114, 147, 'JOINED', '2020-01-18 00:15:00.000000', '2020-01-24 07:27:00.000000'),
(20713, 1114, 148, 'JOINED', '2020-01-18 00:15:00.000000', '2020-01-18 13:56:31.200000'),
(20714, 1114, 149, 'JOINED', '2020-01-18 00:15:00.000000', '2020-01-24 07:27:00.000000'),
(20715, 1114, 150, 'JOINED', '2020-01-18 00:15:00.000000', '2020-01-20 17:26:02.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20711, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-01-23 10:16:55.200000', '2020-01-23 10:16:55.200000', '2020-01-23 10:21:55.200000'),
(DEFAULT, 20712, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-13 15:19:19.200000', '2020-02-13 15:19:19.200000', '2020-02-13 15:24:19.200000'),
(DEFAULT, 20713, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-01-31 10:33:28.800000', '2020-01-31 10:33:28.800000', '2020-01-31 10:38:28.800000'),
(DEFAULT, 20714, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-07 07:37:04.800000', '2020-02-07 07:37:04.800000', '2020-02-07 07:42:04.800000'),
(DEFAULT, 20715, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-01-22 21:10:40.800000', '2020-01-22 21:10:40.800000', '2020-01-22 21:15:40.800000');

-- 2020-01-26 00:15:00.000000
-- 2020-01-26
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1115, 73, 151, NULL, 'Analyze CV Versioning Needs', 'This is Analyze CV Versioning Needs', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2020-01-26', '2020-02-21', '2020-02-02', '2020-01-26 00:15:00.000000', '2020-01-26 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20717, 1115, 146, 'JOINED', '2020-01-26 00:15:00.000000', '2020-01-29 16:27:00.000000'),
(20718, 1115, 147, 'JOINED', '2020-01-26 00:15:00.000000', '2020-02-01 07:27:00.000000'),
(20719, 1115, 148, 'JOINED', '2020-01-26 00:15:00.000000', '2020-02-01 07:27:00.000000'),
(20720, 1115, 149, 'JOINED', '2020-01-26 00:15:00.000000', '2020-02-01 07:27:00.000000'),
(20721, 1115, 150, 'JOINED', '2020-01-26 00:15:00.000000', '2020-01-26 19:24:07.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20717, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-01 17:51:57.600000', '2020-02-01 17:51:57.600000', '2020-02-01 17:56:57.600000'),
(DEFAULT, 20718, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-16 15:12:07.200000', '2020-02-16 15:12:07.200000', '2020-02-16 15:17:07.200000'),
(DEFAULT, 20719, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-21 13:38:31.200000', '2020-02-21 13:38:31.200000', '2020-02-21 13:43:31.200000'),
(DEFAULT, 20720, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-16 08:49:04.800000', '2020-02-16 08:49:04.800000', '2020-02-16 08:54:04.800000'),
(DEFAULT, 20721, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-01-27 23:57:43.200000', '2020-01-27 23:57:43.200000', '2020-01-28 00:02:43.200000');

-- 2020-02-03 00:15:00.000000
-- 2020-02-03
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1116, 73, 151, NULL, 'Identify Data Ownership Rules', 'This is Identify Data Ownership Rules', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2020-02-03', '2020-02-12', '2020-02-09', '2020-02-03 00:15:00.000000', '2020-02-03 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20723, 1116, 146, 'JOINED', '2020-02-03 00:15:00.000000', '2020-02-03 11:20:16.800000'),
(20724, 1116, 147, 'JOINED', '2020-02-03 00:15:00.000000', '2020-02-03 22:16:55.200000'),
(20725, 1116, 148, 'JOINED', '2020-02-03 00:15:00.000000', '2020-02-03 11:03:00.000000'),
(20726, 1116, 149, 'JOINED', '2020-02-03 00:15:00.000000', '2020-02-03 12:55:19.200000'),
(20727, 1116, 150, 'JOINED', '2020-02-03 00:15:00.000000', '2020-02-05 15:23:38.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20723, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-06 11:03:00.000000', '2020-02-06 11:03:00.000000', '2020-02-06 11:08:00.000000'),
(DEFAULT, 20724, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-06 08:10:12.000000', '2020-02-06 08:10:12.000000', '2020-02-06 08:15:12.000000'),
(DEFAULT, 20725, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-06 02:41:52.800000', '2020-02-06 02:41:52.800000', '2020-02-06 02:46:52.800000'),
(DEFAULT, 20726, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-07 16:34:12.000000', '2020-02-07 16:34:12.000000', '2020-02-07 16:39:12.000000'),
(DEFAULT, 20727, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-12 09:06:21.600000', '2020-02-12 09:06:21.600000', '2020-02-12 09:11:21.600000');

-- 2020-02-10 00:15:00.000000
-- 2020-02-10
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1117, 73, 151, NULL, 'Analyze CV Template Data', 'This is Analyze CV Template Data', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2020-02-10', '2020-03-04', '2020-02-16', '2020-02-10 00:15:00.000000', '2020-02-10 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20729, 1117, 146, 'JOINED', '2020-02-10 00:15:00.000000', '2020-02-10 15:48:07.200000'),
(20730, 1117, 147, 'JOINED', '2020-02-10 00:15:00.000000', '2020-02-15 09:51:00.000000'),
(20731, 1117, 148, 'JOINED', '2020-02-10 00:15:00.000000', '2020-02-12 01:51:28.800000'),
(20732, 1117, 149, 'JOINED', '2020-02-10 00:15:00.000000', '2020-02-12 08:24:36.000000'),
(20733, 1117, 150, 'JOINED', '2020-02-10 00:15:00.000000', '2020-02-13 14:04:26.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20729, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-12 13:27:00.000000', '2020-02-12 13:27:00.000000', '2020-02-12 13:32:00.000000'),
(DEFAULT, 20730, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-04 09:42:21.600000', '2020-03-04 09:42:21.600000', '2020-03-04 09:47:21.600000'),
(DEFAULT, 20731, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-19 22:38:31.200000', '2020-02-19 22:38:31.200000', '2020-02-19 22:43:31.200000'),
(DEFAULT, 20732, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-14 14:50:31.200000', '2020-02-14 14:50:31.200000', '2020-02-14 14:55:31.200000'),
(DEFAULT, 20733, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-18 10:25:33.600000', '2020-02-18 10:25:33.600000', '2020-02-18 10:30:33.600000');

-- 2020-02-17 00:15:00.000000
-- 2020-02-17
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1118, 73, 151, NULL, 'Define CV History Tracking Rules', 'This is Define CV History Tracking Rules', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2020-02-17', '2020-03-08', '2020-02-23', '2020-02-17 00:15:00.000000', '2020-02-17 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20735, 1118, 146, 'JOINED', '2020-02-17 00:15:00.000000', '2020-02-18 06:12:07.200000'),
(20736, 1118, 147, 'JOINED', '2020-02-17 00:15:00.000000', '2020-02-17 19:15:28.800000'),
(20737, 1118, 148, 'JOINED', '2020-02-17 00:15:00.000000', '2020-02-17 03:38:02.400000'),
(20738, 1118, 149, 'JOINED', '2020-02-17 00:15:00.000000', '2020-02-18 09:04:55.200000'),
(20739, 1118, 150, 'JOINED', '2020-02-17 00:15:00.000000', '2020-02-22 09:51:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20735, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-20 15:04:55.200000', '2020-02-20 15:04:55.200000', '2020-02-20 15:09:55.200000'),
(DEFAULT, 20736, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-21 18:26:31.200000', '2020-02-21 18:26:31.200000', '2020-02-21 18:31:31.200000'),
(DEFAULT, 20737, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-28 20:51:57.600000', '2020-02-28 20:51:57.600000', '2020-02-28 20:56:57.600000'),
(DEFAULT, 20738, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-27 15:25:04.800000', '2020-02-27 15:25:04.800000', '2020-02-27 15:30:04.800000'),
(DEFAULT, 20739, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-08 06:23:38.400000', '2020-03-08 06:23:38.400000', '2020-03-08 06:28:38.400000');

-- 2020-02-24 00:15:00.000000
-- 2020-02-24
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1119, 73, 151, NULL, 'Identify Required Metadata Fields', 'This is Identify Required Metadata Fields', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2020-02-24', '2020-03-14', '2020-03-01', '2020-02-24 00:15:00.000000', '2020-02-24 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20741, 1119, 146, 'JOINED', '2020-02-24 00:15:00.000000', '2020-02-27 13:55:48.000000'),
(20742, 1119, 147, 'JOINED', '2020-02-24 00:15:00.000000', '2020-02-25 08:47:38.400000'),
(20743, 1119, 148, 'JOINED', '2020-02-24 00:15:00.000000', '2020-02-29 09:51:00.000000'),
(20744, 1119, 149, 'JOINED', '2020-02-24 00:15:00.000000', '2020-02-29 09:51:00.000000'),
(20745, 1119, 150, 'JOINED', '2020-02-24 00:15:00.000000', '2020-02-24 22:25:33.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20741, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-28 21:53:52.800000', '2020-02-28 21:53:52.800000', '2020-02-28 21:58:52.800000'),
(DEFAULT, 20742, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-05 15:42:21.600000', '2020-03-05 15:42:21.600000', '2020-03-05 15:47:21.600000'),
(DEFAULT, 20743, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-14 06:29:24.000000', '2020-03-14 06:29:24.000000', '2020-03-14 06:34:24.000000'),
(DEFAULT, 20744, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-13 23:17:24.000000', '2020-03-13 23:17:24.000000', '2020-03-13 23:22:24.000000'),
(DEFAULT, 20745, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-29 14:27:28.800000', '2020-02-29 14:27:28.800000', '2020-02-29 14:32:28.800000');

-- 2020-03-02 00:15:00.000000
-- 2020-03-02
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1120, 73, 151, NULL, 'Analyze Search & Filter Requirements', 'This is Analyze Search & Filter Requirements', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2020-03-02', '2020-03-13', '2020-03-08', '2020-03-02 00:15:00.000000', '2020-03-02 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20747, 1120, 146, 'JOINED', '2020-03-02 00:15:00.000000', '2020-03-02 03:16:26.400000'),
(20748, 1120, 147, 'JOINED', '2020-03-02 00:15:00.000000', '2020-03-03 05:11:38.400000'),
(20749, 1120, 148, 'JOINED', '2020-03-02 00:15:00.000000', '2020-03-02 23:34:40.800000'),
(20750, 1120, 149, 'JOINED', '2020-03-02 00:15:00.000000', '2020-03-03 12:15:00.000000'),
(20751, 1120, 150, 'JOINED', '2020-03-02 00:15:00.000000', '2020-03-03 17:08:45.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20747, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-03 23:54:50.400000', '2020-03-03 23:54:50.400000', '2020-03-03 23:59:50.400000'),
(DEFAULT, 20748, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-06 05:54:50.400000', '2020-03-06 05:54:50.400000', '2020-03-06 05:59:50.400000'),
(DEFAULT, 20749, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-13 00:55:19.200000', '2020-03-13 00:55:19.200000', '2020-03-13 01:00:19.200000'),
(DEFAULT, 20750, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-12 12:15:00.000000', '2020-03-12 12:15:00.000000', '2020-03-12 12:20:00.000000'),
(DEFAULT, 20751, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-04 18:38:02.400000', '2020-03-04 18:38:02.400000', '2020-03-04 18:43:02.400000');

-- 2020-03-09 00:15:00.000000
-- 2020-03-09
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1121, 73, 151, NULL, 'Define Audit Data Needs', 'This is Define Audit Data Needs', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2020-03-09', '2020-03-27', '2020-03-15', '2020-03-09 00:15:00.000000', '2020-03-09 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20753, 1121, 146, 'JOINED', '2020-03-09 00:15:00.000000', '2020-03-11 11:26:02.400000'),
(20754, 1121, 147, 'JOINED', '2020-03-09 00:15:00.000000', '2020-03-09 18:45:14.400000'),
(20755, 1121, 148, 'JOINED', '2020-03-09 00:15:00.000000', '2020-03-09 19:32:45.600000'),
(20756, 1121, 149, 'JOINED', '2020-03-09 00:15:00.000000', '2020-03-14 09:51:00.000000'),
(20757, 1121, 150, 'JOINED', '2020-03-09 00:15:00.000000', '2020-03-09 12:03:28.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20753, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-12 21:51:00.000000', '2020-03-12 21:51:00.000000', '2020-03-12 21:56:00.000000'),
(DEFAULT, 20754, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-20 05:44:45.600000', '2020-03-20 05:44:45.600000', '2020-03-20 05:49:45.600000'),
(DEFAULT, 20755, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-20 04:57:14.400000', '2020-03-20 04:57:14.400000', '2020-03-20 05:02:14.400000'),
(DEFAULT, 20756, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-27 01:58:40.800000', '2020-03-27 01:58:40.800000', '2020-03-27 02:03:40.800000'),
(DEFAULT, 20757, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-11 05:57:43.200000', '2020-03-11 05:57:43.200000', '2020-03-11 06:02:43.200000');

-- 2020-03-16 00:15:00.000000
-- 2020-03-16
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1122, 73, 151, NULL, 'Identify Reporting Data Needs', 'This is Identify Reporting Data Needs', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2020-03-16', '2020-04-07', '2020-03-22', '2020-03-16 00:15:00.000000', '2020-03-16 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20759, 1122, 146, 'JOINED', '2020-03-16 00:15:00.000000', '2020-03-17 22:45:43.200000'),
(20760, 1122, 147, 'JOINED', '2020-03-16 00:15:00.000000', '2020-03-16 15:17:52.800000'),
(20761, 1122, 148, 'JOINED', '2020-03-16 00:15:00.000000', '2020-03-21 09:51:00.000000'),
(20762, 1122, 149, 'JOINED', '2020-03-16 00:15:00.000000', '2020-03-16 01:32:45.600000'),
(20763, 1122, 150, 'JOINED', '2020-03-16 00:15:00.000000', '2020-03-21 09:51:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20759, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-19 17:31:48.000000', '2020-03-19 17:31:48.000000', '2020-03-19 17:36:48.000000'),
(DEFAULT, 20760, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-27 09:12:07.200000', '2020-03-27 09:12:07.200000', '2020-03-27 09:17:07.200000'),
(DEFAULT, 20761, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-06 11:11:38.400000', '2020-04-06 11:11:38.400000', '2020-04-06 11:16:38.400000'),
(DEFAULT, 20762, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-18 09:42:21.600000', '2020-03-18 09:42:21.600000', '2020-03-18 09:47:21.600000'),
(DEFAULT, 20763, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-07 06:03:28.800000', '2020-04-07 06:03:28.800000', '2020-04-07 06:08:28.800000');

-- 2020-03-23 00:15:00.000000
-- 2020-03-23
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1123, 73, 151, NULL, 'Analyze Data Retention Rules', 'This is Analyze Data Retention Rules', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2020-03-23', '2020-04-10', '2020-03-29', '2020-03-23 00:15:00.000000', '2020-03-23 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20765, 1123, 146, 'JOINED', '2020-03-23 00:15:00.000000', '2020-03-25 02:47:38.400000'),
(20766, 1123, 147, 'JOINED', '2020-03-23 00:15:00.000000', '2020-03-28 09:51:00.000000'),
(20767, 1123, 148, 'JOINED', '2020-03-23 00:15:00.000000', '2020-03-28 09:51:00.000000'),
(20768, 1123, 149, 'JOINED', '2020-03-23 00:15:00.000000', '2020-03-23 20:15:57.600000'),
(20769, 1123, 150, 'JOINED', '2020-03-23 00:15:00.000000', '2020-03-23 03:42:21.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20765, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-26 22:42:50.400000', '2020-03-26 22:42:50.400000', '2020-03-26 22:47:50.400000'),
(DEFAULT, 20766, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-10 13:03:57.600000', '2020-04-10 13:03:57.600000', '2020-04-10 13:08:57.600000'),
(DEFAULT, 20767, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-09 23:31:48.000000', '2020-04-09 23:31:48.000000', '2020-04-09 23:36:48.000000'),
(DEFAULT, 20768, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-28 15:19:19.200000', '2020-03-28 15:19:19.200000', '2020-03-28 15:24:19.200000'),
(DEFAULT, 20769, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-24 10:22:40.800000', '2020-03-24 10:22:40.800000', '2020-03-24 10:27:40.800000');

-- 2020-03-30 00:15:00.000000
-- 2020-03-30
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1124, 73, 151, NULL, 'Define GDPR-related Data Constraints', 'This is Define GDPR-related Data Constraints', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2020-03-30', '2020-04-03', '2020-04-04', '2020-03-30 00:15:00.000000', '2020-03-30 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20771, 1124, 146, 'JOINED', '2020-03-30 00:15:00.000000', '2020-03-30 19:55:48.000000'),
(20772, 1124, 147, 'JOINED', '2020-03-30 00:15:00.000000', '2020-03-31 08:46:12.000000'),
(20773, 1124, 148, 'JOINED', '2020-03-30 00:15:00.000000', '2020-03-30 09:07:48.000000'),
(20774, 1124, 149, 'JOINED', '2020-03-30 00:15:00.000000', '2020-04-01 15:07:48.000000'),
(20775, 1124, 150, 'JOINED', '2020-03-30 00:15:00.000000', '2020-03-30 15:00:36.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20771, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-02 06:07:48.000000', '2020-04-02 06:07:48.000000', '2020-04-02 06:12:48.000000'),
(DEFAULT, 20772, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-03 16:34:12.000000', '2020-04-03 16:34:12.000000', '2020-04-03 16:39:12.000000'),
(DEFAULT, 20773, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-31 17:31:48.000000', '2020-03-31 17:31:48.000000', '2020-03-31 17:36:48.000000'),
(DEFAULT, 20774, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-02 09:43:48.000000', '2020-04-02 09:43:48.000000', '2020-04-02 09:48:48.000000'),
(DEFAULT, 20775, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-31 11:17:24.000000', '2020-03-31 11:17:24.000000', '2020-03-31 11:22:24.000000');

-- 2020-04-05 00:15:00.000000
-- 2020-04-05
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1125, 73, 151, NULL, 'Analyze Data Access Permissions', 'This is Analyze Data Access Permissions', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2020-04-05', '2020-04-22', '2020-04-10', '2020-04-05 00:15:00.000000', '2020-04-05 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20777, 1125, 146, 'JOINED', '2020-04-05 00:15:00.000000', '2020-04-08 21:07:48.000000'),
(20778, 1125, 147, 'JOINED', '2020-04-05 00:15:00.000000', '2020-04-05 10:19:48.000000'),
(20779, 1125, 148, 'JOINED', '2020-04-05 00:15:00.000000', '2020-04-09 12:15:00.000000'),
(20780, 1125, 149, 'JOINED', '2020-04-05 00:15:00.000000', '2020-04-07 16:12:36.000000'),
(20781, 1125, 150, 'JOINED', '2020-04-05 00:15:00.000000', '2020-04-05 21:15:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20777, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-10 00:00:36.000000', '2020-04-10 00:00:36.000000', '2020-04-10 00:05:36.000000'),
(DEFAULT, 20778, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-06 09:58:12.000000', '2020-04-06 09:58:12.000000', '2020-04-06 10:03:12.000000'),
(DEFAULT, 20779, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-22 08:31:48.000000', '2020-04-22 08:31:48.000000', '2020-04-22 08:36:48.000000'),
(DEFAULT, 20780, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-12 08:17:24.000000', '2020-04-12 08:17:24.000000', '2020-04-12 08:22:24.000000'),
(DEFAULT, 20781, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-06 21:00:36.000000', '2020-04-06 21:00:36.000000', '2020-04-06 21:05:36.000000');

-- 2020-04-11 00:15:00.000000
-- 2020-04-11
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1126, 73, 151, NULL, 'Identify Integration Data Needs', 'This is Identify Integration Data Needs', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2020-04-11', '2020-04-20', '2020-04-16', '2020-04-11 00:15:00.000000', '2020-04-11 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20783, 1126, 146, 'JOINED', '2020-04-11 00:15:00.000000', '2020-04-11 10:41:24.000000'),
(20784, 1126, 147, 'JOINED', '2020-04-11 00:15:00.000000', '2020-04-11 04:12:36.000000'),
(20785, 1126, 148, 'JOINED', '2020-04-11 00:15:00.000000', '2020-04-11 19:55:48.000000'),
(20786, 1126, 149, 'JOINED', '2020-04-11 00:15:00.000000', '2020-04-11 07:27:00.000000'),
(20787, 1126, 150, 'JOINED', '2020-04-11 00:15:00.000000', '2020-04-11 05:31:48.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20783, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-12 07:41:24.000000', '2020-04-12 07:41:24.000000', '2020-04-12 07:46:24.000000'),
(DEFAULT, 20784, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-12 04:27:00.000000', '2020-04-12 04:27:00.000000', '2020-04-12 04:32:00.000000'),
(DEFAULT, 20785, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-12 19:34:12.000000', '2020-04-12 19:34:12.000000', '2020-04-12 19:39:12.000000'),
(DEFAULT, 20786, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-12 05:03:00.000000', '2020-04-12 05:03:00.000000', '2020-04-12 05:08:00.000000'),
(DEFAULT, 20787, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-20 18:58:12.000000', '2020-04-20 18:58:12.000000', '2020-04-20 19:03:12.000000');

-- 2020-04-17 00:15:00.000000
-- 2020-04-17
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1127, 73, 151, NULL, 'Validate Data Completeness Rules', 'This is Validate Data Completeness Rules', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2020-04-17', '2020-04-25', '2020-04-22', '2020-04-17 00:15:00.000000', '2020-04-17 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20789, 1127, 146, 'JOINED', '2020-04-17 00:15:00.000000', '2020-04-17 16:34:12.000000'),
(20790, 1127, 147, 'JOINED', '2020-04-17 00:15:00.000000', '2020-04-17 19:48:36.000000'),
(20791, 1127, 148, 'JOINED', '2020-04-17 00:15:00.000000', '2020-04-18 19:41:24.000000'),
(20792, 1127, 149, 'JOINED', '2020-04-17 00:15:00.000000', '2020-04-18 06:11:24.000000'),
(20793, 1127, 150, 'JOINED', '2020-04-17 00:15:00.000000', '2020-04-18 04:05:24.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20789, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-19 08:53:24.000000', '2020-04-19 08:53:24.000000', '2020-04-19 08:58:24.000000'),
(DEFAULT, 20790, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-21 03:51:00.000000', '2020-04-21 03:51:00.000000', '2020-04-21 03:56:00.000000'),
(DEFAULT, 20791, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-19 21:36:36.000000', '2020-04-19 21:36:36.000000', '2020-04-19 21:41:36.000000'),
(DEFAULT, 20792, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-25 18:18:36.000000', '2020-04-25 18:18:36.000000', '2020-04-25 18:23:36.000000'),
(DEFAULT, 20793, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-19 00:29:24.000000', '2020-04-19 00:29:24.000000', '2020-04-19 00:34:24.000000');

-- 2020-04-23 00:15:00.000000
-- 2020-04-23
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1128, 73, 151, NULL, 'Analyze Error Logging Data', 'This is Analyze Error Logging Data', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2020-04-23', '2020-04-30', '2020-04-28', '2020-04-23 00:15:00.000000', '2020-04-23 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20795, 1128, 146, 'JOINED', '2020-04-23 00:15:00.000000', '2020-04-24 03:36:36.000000'),
(20796, 1128, 147, 'JOINED', '2020-04-23 00:15:00.000000', '2020-04-24 22:12:36.000000'),
(20797, 1128, 148, 'JOINED', '2020-04-23 00:15:00.000000', '2020-04-25 10:37:48.000000'),
(20798, 1128, 149, 'JOINED', '2020-04-23 00:15:00.000000', '2020-04-25 03:25:48.000000'),
(20799, 1128, 150, 'JOINED', '2020-04-23 00:15:00.000000', '2020-04-23 04:41:24.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20795, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-25 11:10:12.000000', '2020-04-25 11:10:12.000000', '2020-04-25 11:15:12.000000'),
(DEFAULT, 20796, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-27 03:43:48.000000', '2020-04-27 03:43:48.000000', '2020-04-27 03:48:48.000000'),
(DEFAULT, 20797, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-30 13:52:12.000000', '2020-04-30 13:52:12.000000', '2020-04-30 13:57:12.000000'),
(DEFAULT, 20798, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-30 21:04:12.000000', '2020-04-30 21:04:12.000000', '2020-04-30 21:09:12.000000'),
(DEFAULT, 20799, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-26 20:03:00.000000', '2020-04-26 20:03:00.000000', '2020-04-26 20:08:00.000000');

-- 2020-04-29 00:15:00.000000
-- 2020-04-29
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1129, 73, 151, NULL, 'Define Business Data Glossary', 'This is Define Business Data Glossary', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2020-04-29', '2020-05-18', '2020-05-04', '2020-04-29 00:15:00.000000', '2020-04-29 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20801, 1129, 146, 'JOINED', '2020-04-29 00:15:00.000000', '2020-04-30 21:36:36.000000'),
(20802, 1129, 147, 'JOINED', '2020-04-29 00:15:00.000000', '2020-04-30 10:12:36.000000'),
(20803, 1129, 148, 'JOINED', '2020-04-29 00:15:00.000000', '2020-04-29 10:41:24.000000'),
(20804, 1129, 149, 'JOINED', '2020-04-29 00:15:00.000000', '2020-05-03 12:15:00.000000'),
(20805, 1129, 150, 'JOINED', '2020-04-29 00:15:00.000000', '2020-04-30 05:17:24.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20801, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-03 08:10:12.000000', '2020-05-03 08:10:12.000000', '2020-05-03 08:15:12.000000'),
(DEFAULT, 20802, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-03 07:55:48.000000', '2020-05-03 07:55:48.000000', '2020-05-03 08:00:48.000000'),
(DEFAULT, 20803, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-30 05:46:12.000000', '2020-04-30 05:46:12.000000', '2020-04-30 05:51:12.000000'),
(DEFAULT, 20804, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-18 10:34:12.000000', '2020-05-18 10:34:12.000000', '2020-05-18 10:39:12.000000'),
(DEFAULT, 20805, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-01 17:03:00.000000', '2020-05-01 17:03:00.000000', '2020-05-01 17:08:00.000000');

-- 2020-05-05 00:15:00.000000
-- 2020-05-05
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1130, 73, 151, NULL, 'Review Business Data Assumptions', 'This is Review Business Data Assumptions', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2020-05-05', '2020-05-11', '2020-05-09', '2020-05-05 00:15:00.000000', '2020-05-05 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20807, 1130, 146, 'JOINED', '2020-05-05 00:15:00.000000', '2020-05-06 11:34:40.800000'),
(20808, 1130, 147, 'JOINED', '2020-05-05 00:15:00.000000', '2020-05-05 01:01:04.800000'),
(20809, 1130, 148, 'JOINED', '2020-05-05 00:15:00.000000', '2020-05-05 14:33:14.400000'),
(20810, 1130, 149, 'JOINED', '2020-05-05 00:15:00.000000', '2020-05-05 22:54:21.600000'),
(20811, 1130, 150, 'JOINED', '2020-05-05 00:15:00.000000', '2020-05-06 09:51:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20807, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-07 17:20:16.800000', '2020-05-07 17:20:16.800000', '2020-05-07 17:25:16.800000'),
(DEFAULT, 20808, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-06 00:09:14.400000', '2020-05-06 00:09:14.400000', '2020-05-06 00:14:14.400000'),
(DEFAULT, 20809, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-06 16:11:09.600000', '2020-05-06 16:11:09.600000', '2020-05-06 16:16:09.600000'),
(DEFAULT, 20810, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-06 20:59:09.600000', '2020-05-06 20:59:09.600000', '2020-05-06 21:04:09.600000'),
(DEFAULT, 20811, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-11 14:39:00.000000', '2020-05-11 14:39:00.000000', '2020-05-11 14:44:00.000000');

-- 2020-05-10 00:15:00.000000
-- 2020-05-10
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1131, 73, 151, NULL, 'Sign Off Business Data Requirements', 'This is Sign Off Business Data Requirements', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2020-05-10', '2020-05-14', '2020-05-14', '2020-05-10 00:15:00.000000', '2020-05-10 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20813, 1131, 146, 'JOINED', '2020-05-10 00:15:00.000000', '2020-05-11 18:52:26.400000'),
(20814, 1131, 147, 'JOINED', '2020-05-10 00:15:00.000000', '2020-05-10 17:03:00.000000'),
(20815, 1131, 148, 'JOINED', '2020-05-10 00:15:00.000000', '2020-05-11 20:01:33.600000'),
(20816, 1131, 149, 'JOINED', '2020-05-10 00:15:00.000000', '2020-05-10 14:04:26.400000'),
(20817, 1131, 150, 'JOINED', '2020-05-10 00:15:00.000000', '2020-05-10 05:37:33.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20813, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-13 02:10:12.000000', '2020-05-13 02:10:12.000000', '2020-05-13 02:15:12.000000'),
(DEFAULT, 20814, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-11 13:24:07.200000', '2020-05-11 13:24:07.200000', '2020-05-11 13:29:07.200000'),
(DEFAULT, 20815, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-14 00:09:14.400000', '2020-05-14 00:09:14.400000', '2020-05-14 00:14:14.400000'),
(DEFAULT, 20816, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-13 00:03:28.800000', '2020-05-13 00:03:28.800000', '2020-05-13 00:08:28.800000'),
(DEFAULT, 20817, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-11 03:19:19.200000', '2020-05-11 03:19:19.200000', '2020-05-11 03:24:19.200000');

INSERT INTO collection (`id`, `created_time`, `description`, `due_date`, `start_date`, `name`, `updated_time`, `phase_id`, `created_by_id`)
VALUES (74, '2020-05-14 00:15:00.000000', 'This is Logical Data Modeling', '2020-10-19', '2020-05-14', 'Logical Data Modeling', '2020-05-14 00:15:00.000000', 14, 154);


-- 2020-05-15 00:20:00.000000
-- 2020-05-15
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1132, 74, 151, NULL, 'Define Logical CV Data Model', 'This is Define Logical CV Data Model', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2020-05-15', '2020-05-22', '2020-05-19', '2020-05-15 00:20:00.000000', '2020-05-15 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20819, 1132, 146, 'JOINED', '2020-05-15 00:20:00.000000', '2020-05-15 05:08:00.000000'),
(20820, 1132, 147, 'JOINED', '2020-05-15 00:20:00.000000', '2020-05-16 02:55:31.200000'),
(20821, 1132, 148, 'JOINED', '2020-05-15 00:20:00.000000', '2020-05-15 01:23:21.600000'),
(20822, 1132, 149, 'JOINED', '2020-05-15 00:20:00.000000', '2020-05-15 11:51:12.000000'),
(20823, 1132, 150, 'JOINED', '2020-05-15 00:20:00.000000', '2020-05-17 05:59:50.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20819, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-16 13:57:55.200000', '2020-05-16 13:57:55.200000', '2020-05-16 14:02:55.200000'),
(DEFAULT, 20820, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-17 08:58:24.000000', '2020-05-17 08:58:24.000000', '2020-05-17 09:03:24.000000'),
(DEFAULT, 20821, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-22 23:16:38.400000', '2020-05-22 23:16:38.400000', '2020-05-22 23:21:38.400000'),
(DEFAULT, 20822, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-17 23:28:09.600000', '2020-05-17 23:28:09.600000', '2020-05-17 23:33:09.600000'),
(DEFAULT, 20823, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-18 17:36:48.000000', '2020-05-18 17:36:48.000000', '2020-05-18 17:41:48.000000');

-- 2020-05-20 00:20:00.000000
-- 2020-05-20
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1133, 74, 151, NULL, 'Map Entities to Business Concepts', 'This is Map Entities to Business Concepts', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2020-05-20', '2020-05-23', '2020-05-24', '2020-05-20 00:20:00.000000', '2020-05-20 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20825, 1133, 146, 'JOINED', '2020-05-20 00:20:00.000000', '2020-05-22 00:54:33.600000'),
(20826, 1133, 147, 'JOINED', '2020-05-20 00:20:00.000000', '2020-05-20 03:01:16.800000'),
(20827, 1133, 148, 'JOINED', '2020-05-20 00:20:00.000000', '2020-05-20 02:20:57.600000'),
(20828, 1133, 149, 'JOINED', '2020-05-20 00:20:00.000000', '2020-05-21 11:39:40.800000'),
(20829, 1133, 150, 'JOINED', '2020-05-20 00:20:00.000000', '2020-05-20 07:43:31.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20825, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-23 05:31:02.400000', '2020-05-23 05:31:02.400000', '2020-05-23 05:36:02.400000'),
(DEFAULT, 20826, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-21 10:42:04.800000', '2020-05-21 10:42:04.800000', '2020-05-21 10:47:04.800000'),
(DEFAULT, 20827, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-20 22:47:50.400000', '2020-05-20 22:47:50.400000', '2020-05-20 22:52:50.400000'),
(DEFAULT, 20828, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-23 09:56:00.000000', '2020-05-23 09:56:00.000000', '2020-05-23 10:01:00.000000'),
(DEFAULT, 20829, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-21 10:24:48.000000', '2020-05-21 10:24:48.000000', '2020-05-21 10:29:48.000000');

-- 2020-05-25 00:20:00.000000
-- 2020-05-25
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1134, 74, 151, NULL, 'Define Entity Relationships', 'This is Define Entity Relationships', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2020-05-25', '2020-06-20', '2020-06-01', '2020-05-25 00:20:00.000000', '2020-05-25 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20831, 1134, 147, 'JOINED', '2020-05-25 00:20:00.000000', '2020-05-25 11:15:12.000000'),
(20832, 1134, 148, 'JOINED', '2020-05-25 00:20:00.000000', '2020-05-26 17:09:26.400000'),
(20833, 1134, 149, 'JOINED', '2020-05-25 00:20:00.000000', '2020-05-31 07:32:00.000000'),
(20834, 1134, 150, 'JOINED', '2020-05-25 00:20:00.000000', '2020-05-25 08:23:50.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20831, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-30 07:10:24.000000', '2020-05-30 07:10:24.000000', '2020-05-30 07:15:24.000000'),
(DEFAULT, 20832, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-30 11:32:28.800000', '2020-05-30 11:32:28.800000', '2020-05-30 11:37:28.800000'),
(DEFAULT, 20833, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-06-20 05:39:40.800000', '2020-06-20 05:39:40.800000', '2020-06-20 05:44:40.800000'),
(DEFAULT, 20834, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-26 13:57:55.200000', '2020-05-26 13:57:55.200000', '2020-05-26 14:02:55.200000');

-- 2020-06-02 00:20:00.000000
-- 2020-06-02
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1135, 74, 151, NULL, 'Analyze Normalization Level', 'This is Analyze Normalization Level', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2020-06-02', '2020-06-25', '2020-06-09', '2020-06-02 00:20:00.000000', '2020-06-02 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20836, 1135, 147, 'JOINED', '2020-06-02 00:20:00.000000', '2020-06-02 16:47:50.400000'),
(20837, 1135, 148, 'JOINED', '2020-06-02 00:20:00.000000', '2020-06-08 07:32:00.000000'),
(20838, 1135, 149, 'JOINED', '2020-06-02 00:20:00.000000', '2020-06-02 00:25:02.400000'),
(20839, 1135, 150, 'JOINED', '2020-06-02 00:20:00.000000', '2020-06-05 19:03:12.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20836, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-06-15 07:52:09.600000', '2020-06-15 07:52:09.600000', '2020-06-15 07:57:09.600000'),
(DEFAULT, 20837, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-06-25 23:44:00.000000', '2020-06-25 23:44:00.000000', '2020-06-25 23:49:00.000000'),
(DEFAULT, 20838, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-06-16 00:14:57.600000', '2020-06-16 00:14:57.600000', '2020-06-16 00:19:57.600000'),
(DEFAULT, 20839, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-06-07 10:52:09.600000', '2020-06-07 10:52:09.600000', '2020-06-07 10:57:09.600000');

-- 2020-06-10 00:20:00.000000
-- 2020-06-10
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1136, 74, 151, NULL, 'Define CV–User Relationship', 'This is Define CV–User Relationship', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2020-06-10', '2020-07-06', '2020-06-17', '2020-06-10 00:20:00.000000', '2020-06-10 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20841, 1136, 147, 'JOINED', '2020-06-10 00:20:00.000000', '2020-06-16 07:32:00.000000'),
(20842, 1136, 148, 'JOINED', '2020-06-10 00:20:00.000000', '2020-06-11 01:21:55.200000'),
(20843, 1136, 149, 'JOINED', '2020-06-10 00:20:00.000000', '2020-06-16 07:32:00.000000'),
(20844, 1136, 150, 'JOINED', '2020-06-10 00:20:00.000000', '2020-06-16 07:32:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20841, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-06 18:35:50.400000', '2020-07-06 18:35:50.400000', '2020-07-06 18:40:50.400000'),
(DEFAULT, 20842, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-06-22 23:18:04.800000', '2020-06-22 23:18:04.800000', '2020-06-22 23:23:04.800000'),
(DEFAULT, 20843, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-02 15:38:43.200000', '2020-07-02 15:38:43.200000', '2020-07-02 15:43:43.200000'),
(DEFAULT, 20844, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-06 21:27:12.000000', '2020-07-06 21:27:12.000000', '2020-07-06 21:32:12.000000');

-- 2020-06-18 00:20:00.000000
-- 2020-06-18
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1137, 74, 151, NULL, 'Define CV–Template Mapping', 'This is Define CV–Template Mapping', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2020-06-18', '2020-07-13', '2020-06-25', '2020-06-18 00:20:00.000000', '2020-06-18 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20846, 1137, 147, 'JOINED', '2020-06-18 00:20:00.000000', '2020-06-24 07:32:00.000000'),
(20847, 1137, 148, 'JOINED', '2020-06-18 00:20:00.000000', '2020-06-21 04:56:28.800000'),
(20848, 1137, 149, 'JOINED', '2020-06-18 00:20:00.000000', '2020-06-18 09:14:14.400000'),
(20849, 1137, 150, 'JOINED', '2020-06-18 00:20:00.000000', '2020-06-18 09:34:24.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20846, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-13 04:57:55.200000', '2020-07-13 04:57:55.200000', '2020-07-13 05:02:55.200000'),
(DEFAULT, 20847, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-06-24 17:06:33.600000', '2020-06-24 17:06:33.600000', '2020-06-24 17:11:33.600000'),
(DEFAULT, 20848, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-06-22 01:36:19.200000', '2020-06-22 01:36:19.200000', '2020-06-22 01:41:19.200000'),
(DEFAULT, 20849, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-06-23 11:12:19.200000', '2020-06-23 11:12:19.200000', '2020-06-23 11:17:19.200000');

-- 2020-06-26 00:20:00.000000
-- 2020-06-26
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1138, 74, 151, NULL, 'Model Versioned CV Structure', 'This is Model Versioned CV Structure', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2020-06-26', '2020-07-18', '2020-07-03', '2020-06-26 00:20:00.000000', '2020-06-26 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20851, 1138, 147, 'JOINED', '2020-06-26 00:20:00.000000', '2020-06-27 00:21:26.400000'),
(20852, 1138, 148, 'JOINED', '2020-06-26 00:20:00.000000', '2020-06-26 17:53:21.600000'),
(20853, 1138, 149, 'JOINED', '2020-06-26 00:20:00.000000', '2020-07-02 07:32:00.000000'),
(20854, 1138, 150, 'JOINED', '2020-06-26 00:20:00.000000', '2020-06-27 13:37:45.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20851, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-09 00:18:33.600000', '2020-07-09 00:18:33.600000', '2020-07-09 00:23:33.600000'),
(DEFAULT, 20852, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-09 06:46:38.400000', '2020-07-09 06:46:38.400000', '2020-07-09 06:51:38.400000'),
(DEFAULT, 20853, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-18 06:04:09.600000', '2020-07-18 06:04:09.600000', '2020-07-18 06:09:09.600000'),
(DEFAULT, 20854, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-06-30 04:27:40.800000', '2020-06-30 04:27:40.800000', '2020-06-30 04:32:40.800000');

-- 2020-07-04 00:20:00.000000
-- 2020-07-04
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1139, 74, 151, NULL, 'Define Audit Trail Structure', 'This is Define Audit Trail Structure', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2020-07-04', '2020-07-29', '2020-07-11', '2020-07-04 00:20:00.000000', '2020-07-04 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20856, 1139, 147, 'JOINED', '2020-07-04 00:20:00.000000', '2020-07-10 07:32:00.000000'),
(20857, 1139, 148, 'JOINED', '2020-07-04 00:20:00.000000', '2020-07-04 16:07:31.200000'),
(20858, 1139, 149, 'JOINED', '2020-07-04 00:20:00.000000', '2020-07-10 07:32:00.000000'),
(20859, 1139, 150, 'JOINED', '2020-07-04 00:20:00.000000', '2020-07-04 22:00:19.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20856, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-26 21:51:40.800000', '2020-07-26 21:51:40.800000', '2020-07-26 21:56:40.800000'),
(DEFAULT, 20857, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-10 17:26:43.200000', '2020-07-10 17:26:43.200000', '2020-07-10 17:31:43.200000'),
(DEFAULT, 20858, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-29 16:33:26.400000', '2020-07-29 16:33:26.400000', '2020-07-29 16:38:26.400000'),
(DEFAULT, 20859, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-06 09:47:21.600000', '2020-07-06 09:47:21.600000', '2020-07-06 09:52:21.600000');

-- 2020-07-12 00:20:00.000000
-- 2020-07-12
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1140, 74, 151, NULL, 'Model Recommendation Data Flow', 'This is Model Recommendation Data Flow', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2020-07-12', '2020-08-04', '2020-07-19', '2020-07-12 00:20:00.000000', '2020-07-12 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20861, 1140, 147, 'JOINED', '2020-07-12 00:20:00.000000', '2020-07-13 14:23:07.200000'),
(20862, 1140, 148, 'JOINED', '2020-07-12 00:20:00.000000', '2020-07-12 01:40:38.400000'),
(20863, 1140, 149, 'JOINED', '2020-07-12 00:20:00.000000', '2020-07-18 07:32:00.000000'),
(20864, 1140, 150, 'JOINED', '2020-07-12 00:20:00.000000', '2020-07-12 02:51:12.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20861, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-24 10:16:52.800000', '2020-07-24 10:16:52.800000', '2020-07-24 10:21:52.800000'),
(DEFAULT, 20862, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-15 19:13:16.800000', '2020-07-15 19:13:16.800000', '2020-07-15 19:18:16.800000'),
(DEFAULT, 20863, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-04 23:44:00.000000', '2020-08-04 23:44:00.000000', '2020-08-04 23:49:00.000000'),
(DEFAULT, 20864, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-14 00:12:48.000000', '2020-07-14 00:12:48.000000', '2020-07-14 00:17:48.000000');

-- 2020-07-20 00:20:00.000000
-- 2020-07-20
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1141, 74, 151, NULL, 'Define Status Lifecycle Fields', 'This is Define Status Lifecycle Fields', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2020-07-20', '2020-07-26', '2020-07-27', '2020-07-20 00:20:00.000000', '2020-07-20 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20866, 1141, 147, 'JOINED', '2020-07-20 00:20:00.000000', '2020-07-23 00:34:24.000000'),
(20867, 1141, 148, 'JOINED', '2020-07-20 00:20:00.000000', '2020-07-20 23:10:52.800000'),
(20868, 1141, 149, 'JOINED', '2020-07-20 00:20:00.000000', '2020-07-21 10:16:09.600000'),
(20869, 1141, 150, 'JOINED', '2020-07-20 00:20:00.000000', '2020-07-23 21:34:24.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20866, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-26 13:55:02.400000', '2020-07-26 13:55:02.400000', '2020-07-26 14:00:02.400000'),
(DEFAULT, 20867, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-25 13:43:31.200000', '2020-07-25 13:43:31.200000', '2020-07-25 13:48:31.200000'),
(DEFAULT, 20868, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-26 12:04:09.600000', '2020-07-26 12:04:09.600000', '2020-07-26 12:09:09.600000'),
(DEFAULT, 20869, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-26 16:56:28.800000', '2020-07-26 16:56:28.800000', '2020-07-26 17:01:28.800000');

-- 2020-07-28 00:20:00.000000
-- 2020-07-28
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1142, 74, 151, NULL, 'Validate Cardinality Rules', 'This is Validate Cardinality Rules', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2020-07-28', '2020-08-09', '2020-08-04', '2020-07-28 00:20:00.000000', '2020-07-28 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20871, 1142, 147, 'JOINED', '2020-07-28 00:20:00.000000', '2020-07-29 10:31:16.800000'),
(20872, 1142, 148, 'JOINED', '2020-07-28 00:20:00.000000', '2020-07-28 01:10:24.000000'),
(20873, 1142, 149, 'JOINED', '2020-07-28 00:20:00.000000', '2020-07-29 06:04:09.600000'),
(20874, 1142, 150, 'JOINED', '2020-07-28 00:20:00.000000', '2020-07-29 15:58:52.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20871, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-09 14:08:43.200000', '2020-08-09 14:08:43.200000', '2020-08-09 14:13:43.200000'),
(DEFAULT, 20872, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-31 20:03:40.800000', '2020-07-31 20:03:40.800000', '2020-07-31 20:08:40.800000'),
(DEFAULT, 20873, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-09 18:35:50.400000', '2020-08-09 18:35:50.400000', '2020-08-09 18:40:50.400000'),
(DEFAULT, 20874, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-31 00:34:24.000000', '2020-07-31 00:34:24.000000', '2020-07-31 00:39:24.000000');

-- 2020-08-05 00:20:00.000000
-- 2020-08-05
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1143, 74, 151, NULL, 'Resolve Data Ambiguities', 'This is Resolve Data Ambiguities', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2020-08-05', '2020-08-27', '2020-08-12', '2020-08-05 00:20:00.000000', '2020-08-05 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20876, 1143, 147, 'JOINED', '2020-08-05 00:20:00.000000', '2020-08-11 07:32:00.000000'),
(20877, 1143, 148, 'JOINED', '2020-08-05 00:20:00.000000', '2020-08-05 10:34:52.800000'),
(20878, 1143, 149, 'JOINED', '2020-08-05 00:20:00.000000', '2020-08-05 16:17:36.000000'),
(20879, 1143, 150, 'JOINED', '2020-08-05 00:20:00.000000', '2020-08-06 09:45:55.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20876, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-27 07:55:02.400000', '2020-08-27 07:55:02.400000', '2020-08-27 08:00:02.400000'),
(DEFAULT, 20877, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-11 14:15:12.000000', '2020-08-11 14:15:12.000000', '2020-08-11 14:20:12.000000'),
(DEFAULT, 20878, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-09 04:47:50.400000', '2020-08-09 04:47:50.400000', '2020-08-09 04:52:50.400000'),
(DEFAULT, 20879, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-10 04:39:12.000000', '2020-08-10 04:39:12.000000', '2020-08-10 04:44:12.000000');

-- 2020-08-13 00:20:00.000000
-- 2020-08-13
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1144, 74, 151, NULL, 'Align Model with Business Rules', 'This is Align Model with Business Rules', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2020-08-13', '2020-09-07', '2020-08-20', '2020-08-13 00:20:00.000000', '2020-08-13 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20881, 1144, 147, 'JOINED', '2020-08-13 00:20:00.000000', '2020-08-14 18:14:57.600000'),
(20882, 1144, 148, 'JOINED', '2020-08-13 00:20:00.000000', '2020-08-14 04:38:28.800000'),
(20883, 1144, 149, 'JOINED', '2020-08-13 00:20:00.000000', '2020-08-19 07:32:00.000000'),
(20884, 1144, 150, 'JOINED', '2020-08-13 00:20:00.000000', '2020-08-13 10:55:02.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20881, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-25 06:25:02.400000', '2020-08-25 06:25:02.400000', '2020-08-25 06:30:02.400000'),
(DEFAULT, 20882, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-25 20:01:31.200000', '2020-08-25 20:01:31.200000', '2020-08-25 20:06:31.200000'),
(DEFAULT, 20883, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-09-07 13:11:50.400000', '2020-09-07 13:11:50.400000', '2020-09-07 13:16:50.400000'),
(DEFAULT, 20884, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-26 13:44:57.600000', '2020-08-26 13:44:57.600000', '2020-08-26 13:49:57.600000');

-- 2020-08-21 00:20:00.000000
-- 2020-08-21
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1145, 74, 151, NULL, 'Validate Logical Model Consistency', 'This is Validate Logical Model Consistency', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2020-08-21', '2020-09-03', '2020-08-28', '2020-08-21 00:20:00.000000', '2020-08-21 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20886, 1145, 147, 'JOINED', '2020-08-21 00:20:00.000000', '2020-08-21 15:12:04.800000'),
(20887, 1145, 148, 'JOINED', '2020-08-21 00:20:00.000000', '2020-08-21 08:13:45.600000'),
(20888, 1145, 149, 'JOINED', '2020-08-21 00:20:00.000000', '2020-08-22 12:17:07.200000'),
(20889, 1145, 150, 'JOINED', '2020-08-21 00:20:00.000000', '2020-08-21 14:16:38.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20886, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-09-03 09:27:55.200000', '2020-09-03 09:27:55.200000', '2020-09-03 09:32:55.200000'),
(DEFAULT, 20887, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-25 05:48:19.200000', '2020-08-25 05:48:19.200000', '2020-08-25 05:53:19.200000'),
(DEFAULT, 20888, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-27 12:44:28.800000', '2020-08-27 12:44:28.800000', '2020-08-27 12:49:28.800000'),
(DEFAULT, 20889, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-22 20:10:52.800000', '2020-08-22 20:10:52.800000', '2020-08-22 20:15:52.800000');

-- 2020-08-29 00:20:00.000000
-- 2020-08-29
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1146, 74, 151, NULL, 'Review Logical Constraints', 'This is Review Logical Constraints', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2020-08-29', '2020-09-25', '2020-09-05', '2020-08-29 00:20:00.000000', '2020-08-29 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20891, 1146, 147, 'JOINED', '2020-08-29 00:20:00.000000', '2020-08-30 06:54:33.600000'),
(20892, 1146, 148, 'JOINED', '2020-08-29 00:20:00.000000', '2020-09-04 07:32:00.000000'),
(20893, 1146, 149, 'JOINED', '2020-08-29 00:20:00.000000', '2020-09-04 07:32:00.000000'),
(20894, 1146, 150, 'JOINED', '2020-08-29 00:20:00.000000', '2020-08-31 06:05:36.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20891, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-09-04 12:04:09.600000', '2020-09-04 12:04:09.600000', '2020-09-04 12:09:09.600000'),
(DEFAULT, 20892, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-09-25 03:30:04.800000', '2020-09-25 03:30:04.800000', '2020-09-25 03:35:04.800000'),
(DEFAULT, 20893, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-09-25 05:51:12.000000', '2020-09-25 05:51:12.000000', '2020-09-25 05:56:12.000000'),
(DEFAULT, 20894, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-09-02 22:26:14.400000', '2020-09-02 22:26:14.400000', '2020-09-02 22:31:14.400000');

-- 2020-09-06 00:20:00.000000
-- 2020-09-06
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1147, 74, 151, NULL, 'Optimize Logical Model Simplicity', 'This is Optimize Logical Model Simplicity', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2020-09-06', '2020-10-02', '2020-09-13', '2020-09-06 00:20:00.000000', '2020-09-06 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20896, 1147, 147, 'JOINED', '2020-09-06 00:20:00.000000', '2020-09-08 09:37:16.800000'),
(20897, 1147, 148, 'JOINED', '2020-09-06 00:20:00.000000', '2020-09-12 07:32:00.000000'),
(20898, 1147, 149, 'JOINED', '2020-09-06 00:20:00.000000', '2020-09-12 07:32:00.000000'),
(20899, 1147, 150, 'JOINED', '2020-09-06 00:20:00.000000', '2020-09-09 16:32:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20896, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-09-12 23:59:50.400000', '2020-09-12 23:59:50.400000', '2020-09-13 00:04:50.400000'),
(DEFAULT, 20897, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-09-27 10:14:43.200000', '2020-09-27 10:14:43.200000', '2020-09-27 10:19:43.200000'),
(DEFAULT, 20898, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-02 19:06:04.800000', '2020-10-02 19:06:04.800000', '2020-10-02 19:11:04.800000'),
(DEFAULT, 20899, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-09-12 10:53:36.000000', '2020-09-12 10:53:36.000000', '2020-09-12 10:58:36.000000');

-- 2020-09-14 00:20:00.000000
-- 2020-09-14
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1148, 74, 151, NULL, 'Document Logical Data Model', 'This is Document Logical Data Model', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2020-09-14', '2020-09-27', '2020-09-21', '2020-09-14 00:20:00.000000', '2020-09-14 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20901, 1148, 147, 'JOINED', '2020-09-14 00:20:00.000000', '2020-09-15 04:43:31.200000'),
(20902, 1148, 148, 'JOINED', '2020-09-14 00:20:00.000000', '2020-09-14 19:08:57.600000'),
(20903, 1148, 149, 'JOINED', '2020-09-14 00:20:00.000000', '2020-09-14 07:53:36.000000'),
(20904, 1148, 150, 'JOINED', '2020-09-14 00:20:00.000000', '2020-09-16 06:56:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20901, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-09-26 19:56:28.800000', '2020-09-26 19:56:28.800000', '2020-09-26 20:01:28.800000'),
(DEFAULT, 20902, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-09-27 05:31:02.400000', '2020-09-27 05:31:02.400000', '2020-09-27 05:36:02.400000'),
(DEFAULT, 20903, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-09-18 00:25:45.600000', '2020-09-18 00:25:45.600000', '2020-09-18 00:30:45.600000'),
(DEFAULT, 20904, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-09-18 04:47:50.400000', '2020-09-18 04:47:50.400000', '2020-09-18 04:52:50.400000');

-- 2020-09-22 00:20:00.000000
-- 2020-09-22
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1149, 74, 151, NULL, 'Review with Backend Team', 'This is Review with Backend Team', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2020-09-22', '2020-10-17', '2020-09-29', '2020-09-22 00:20:00.000000', '2020-09-22 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20906, 1149, 147, 'JOINED', '2020-09-22 00:20:00.000000', '2020-09-28 07:32:00.000000'),
(20907, 1149, 148, 'JOINED', '2020-09-22 00:20:00.000000', '2020-09-22 05:27:26.400000'),
(20908, 1149, 149, 'JOINED', '2020-09-22 00:20:00.000000', '2020-09-22 07:13:16.800000'),
(20909, 1149, 150, 'JOINED', '2020-09-22 00:20:00.000000', '2020-09-25 05:06:33.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20906, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-17 22:26:14.400000', '2020-10-17 22:26:14.400000', '2020-10-17 22:31:14.400000'),
(DEFAULT, 20907, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-05 19:12:33.600000', '2020-10-05 19:12:33.600000', '2020-10-05 19:17:33.600000'),
(DEFAULT, 20908, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-09-26 01:46:24.000000', '2020-09-26 01:46:24.000000', '2020-09-26 01:51:24.000000'),
(DEFAULT, 20909, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-09-27 19:46:24.000000', '2020-09-27 19:46:24.000000', '2020-09-27 19:51:24.000000');

-- 2020-09-30 00:20:00.000000
-- 2020-09-30
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1150, 74, 151, NULL, 'Apply Feedback to Model', 'This is Apply Feedback to Model', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2020-09-30', '2020-10-06', '2020-10-07', '2020-09-30 00:20:00.000000', '2020-09-30 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20911, 1150, 147, 'JOINED', '2020-09-30 00:20:00.000000', '2020-09-30 08:23:50.400000'),
(20912, 1150, 148, 'JOINED', '2020-09-30 00:20:00.000000', '2020-10-02 08:16:38.400000'),
(20913, 1150, 149, 'JOINED', '2020-09-30 00:20:00.000000', '2020-09-30 21:20:00.000000'),
(20914, 1150, 150, 'JOINED', '2020-09-30 00:20:00.000000', '2020-10-01 04:23:21.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20911, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-03 23:25:16.800000', '2020-10-03 23:25:16.800000', '2020-10-03 23:30:16.800000'),
(DEFAULT, 20912, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-06 05:10:52.800000', '2020-10-06 05:10:52.800000', '2020-10-06 05:15:52.800000'),
(DEFAULT, 20913, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-04 14:22:24.000000', '2020-10-04 14:22:24.000000', '2020-10-04 14:27:24.000000'),
(DEFAULT, 20914, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-04 05:38:14.400000', '2020-10-04 05:38:14.400000', '2020-10-04 05:43:14.400000');

-- 2020-10-08 00:20:00.000000
-- 2020-10-08
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1151, 74, 151, NULL, 'Finalize Logical Data Model', 'This is Finalize Logical Data Model', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2020-10-08', '2020-10-19', '2020-10-14', '2020-10-08 00:20:00.000000', '2020-10-08 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20916, 1151, 147, 'JOINED', '2020-10-08 00:20:00.000000', '2020-10-09 08:52:38.400000'),
(20917, 1151, 148, 'JOINED', '2020-10-08 00:20:00.000000', '2020-10-08 07:57:55.200000'),
(20918, 1151, 149, 'JOINED', '2020-10-08 00:20:00.000000', '2020-10-08 05:56:57.600000'),
(20919, 1151, 150, 'JOINED', '2020-10-08 00:20:00.000000', '2020-10-10 23:10:52.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20916, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-13 02:09:26.400000', '2020-10-13 02:09:26.400000', '2020-10-13 02:14:26.400000'),
(DEFAULT, 20917, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-19 16:42:04.800000', '2020-10-19 16:42:04.800000', '2020-10-19 16:47:04.800000'),
(DEFAULT, 20918, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-10 15:15:40.800000', '2020-10-10 15:15:40.800000', '2020-10-10 15:20:40.800000'),
(DEFAULT, 20919, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-12 15:21:26.400000', '2020-10-12 15:21:26.400000', '2020-10-12 15:26:26.400000');

INSERT INTO collection (`id`, `created_time`, `description`, `due_date`, `start_date`, `name`, `updated_time`, `phase_id`, `created_by_id`)
VALUES (75, '2020-10-14 00:20:00.000000', 'This is Data Validation & Review', '2021-03-06', '2020-10-14', 'Data Validation & Review', '2020-10-14 00:20:00.000000', 14, 154);


-- 2020-10-15 00:25:00.000000
-- 2020-10-15
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1152, 75, 151, NULL, 'Define Business Validation Rules', 'This is Define Business Validation Rules', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2020-10-15', '2020-10-19', '2020-10-21', '2020-10-15 00:25:00.000000', '2020-10-15 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20921, 1152, 147, 'JOINED', '2020-10-15 00:25:00.000000', '2020-10-16 23:38:55.200000'),
(20922, 1152, 148, 'JOINED', '2020-10-15 00:25:00.000000', '2020-10-16 14:43:14.400000'),
(20923, 1152, 149, 'JOINED', '2020-10-15 00:25:00.000000', '2020-10-16 03:37:57.600000'),
(20924, 1152, 150, 'JOINED', '2020-10-15 00:25:00.000000', '2020-10-15 08:37:28.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20921, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-19 17:10:07.200000', '2020-10-19 17:10:07.200000', '2020-10-19 17:15:07.200000'),
(DEFAULT, 20922, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-18 20:34:36.000000', '2020-10-18 20:34:36.000000', '2020-10-18 20:39:36.000000'),
(DEFAULT, 20923, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-18 18:50:55.200000', '2020-10-18 18:50:55.200000', '2020-10-18 18:55:55.200000'),
(DEFAULT, 20924, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-17 12:36:31.200000', '2020-10-17 12:36:31.200000', '2020-10-17 12:41:31.200000');

-- 2020-10-22 00:25:00.000000
-- 2020-10-22
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1153, 75, 151, NULL, 'Define Mandatory Field Rules', 'This is Define Mandatory Field Rules', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2020-10-22', '2020-10-27', '2020-10-28', '2020-10-22 00:25:00.000000', '2020-10-22 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20926, 1153, 147, 'JOINED', '2020-10-22 00:25:00.000000', '2020-10-22 04:09:38.400000'),
(20927, 1153, 148, 'JOINED', '2020-10-22 00:25:00.000000', '2020-10-22 10:03:52.800000'),
(20928, 1153, 149, 'JOINED', '2020-10-22 00:25:00.000000', '2020-10-23 05:21:38.400000'),
(20929, 1153, 150, 'JOINED', '2020-10-22 00:25:00.000000', '2020-10-23 03:29:19.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20926, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-24 02:23:04.800000', '2020-10-24 02:23:04.800000', '2020-10-24 02:28:04.800000'),
(DEFAULT, 20927, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-26 18:19:14.400000', '2020-10-26 18:19:14.400000', '2020-10-26 18:24:14.400000'),
(DEFAULT, 20928, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-25 10:29:48.000000', '2020-10-25 10:29:48.000000', '2020-10-25 10:34:48.000000'),
(DEFAULT, 20929, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-27 22:49:57.600000', '2020-10-27 22:49:57.600000', '2020-10-27 22:54:57.600000');

-- 2020-10-29 00:25:00.000000
-- 2020-10-29
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1154, 75, 151, NULL, 'Define Cross-field Validation', 'This is Define Cross-field Validation', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2020-10-29', '2020-11-03', '2020-11-04', '2020-10-29 00:25:00.000000', '2020-10-29 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20931, 1154, 147, 'JOINED', '2020-10-29 00:25:00.000000', '2020-10-30 06:04:50.400000'),
(20932, 1154, 148, 'JOINED', '2020-10-29 00:25:00.000000', '2020-10-30 06:39:24.000000'),
(20933, 1154, 149, 'JOINED', '2020-10-29 00:25:00.000000', '2020-11-01 04:52:50.400000'),
(20934, 1154, 150, 'JOINED', '2020-10-29 00:25:00.000000', '2020-10-29 23:36:02.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20931, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-11-02 08:14:26.400000', '2020-11-02 08:14:26.400000', '2020-11-02 08:19:26.400000'),
(DEFAULT, 20932, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-11-01 17:50:26.400000', '2020-11-01 17:50:26.400000', '2020-11-01 17:55:26.400000'),
(DEFAULT, 20933, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-11-03 14:02:55.200000', '2020-11-03 14:02:55.200000', '2020-11-03 14:07:55.200000'),
(DEFAULT, 20934, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-31 21:14:55.200000', '2020-10-31 21:14:55.200000', '2020-10-31 21:19:55.200000');

-- 2020-11-05 00:25:00.000000
-- 2020-11-05
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1155, 75, 151, NULL, 'Analyze Data Quality Risks', 'This is Analyze Data Quality Risks', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2020-11-05', '2020-11-15', '2020-11-11', '2020-11-05 00:25:00.000000', '2020-11-05 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20936, 1155, 147, 'JOINED', '2020-11-05 00:25:00.000000', '2020-11-06 06:04:50.400000'),
(20937, 1155, 148, 'JOINED', '2020-11-05 00:25:00.000000', '2020-11-05 05:01:28.800000'),
(20938, 1155, 149, 'JOINED', '2020-11-05 00:25:00.000000', '2020-11-06 03:20:40.800000'),
(20939, 1155, 150, 'JOINED', '2020-11-05 00:25:00.000000', '2020-11-05 06:01:57.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20936, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-11-10 08:08:40.800000', '2020-11-10 08:08:40.800000', '2020-11-10 08:13:40.800000'),
(DEFAULT, 20937, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-11-07 15:37:57.600000', '2020-11-07 15:37:57.600000', '2020-11-07 15:42:57.600000'),
(DEFAULT, 20938, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-11-15 21:29:19.200000', '2020-11-15 21:29:19.200000', '2020-11-15 21:34:19.200000'),
(DEFAULT, 20939, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-11-06 12:50:55.200000', '2020-11-06 12:50:55.200000', '2020-11-06 12:55:55.200000');

-- 2020-11-12 00:25:00.000000
-- 2020-11-12
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1156, 75, 151, NULL, 'Define Duplicate Detection Rules', 'This is Define Duplicate Detection Rules', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2020-11-12', '2020-12-01', '2020-11-18', '2020-11-12 00:25:00.000000', '2020-11-12 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20941, 1156, 147, 'JOINED', '2020-11-12 00:25:00.000000', '2020-11-17 10:01:00.000000'),
(20942, 1156, 148, 'JOINED', '2020-11-12 00:25:00.000000', '2020-11-17 10:01:00.000000'),
(20943, 1156, 149, 'JOINED', '2020-11-12 00:25:00.000000', '2020-11-14 00:56:40.800000'),
(20944, 1156, 150, 'JOINED', '2020-11-12 00:25:00.000000', '2020-11-13 19:19:43.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20941, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-11-29 22:49:57.600000', '2020-11-29 22:49:57.600000', '2020-11-29 22:54:57.600000'),
(DEFAULT, 20942, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-01 05:56:12.000000', '2020-12-01 05:56:12.000000', '2020-12-01 06:01:12.000000'),
(DEFAULT, 20943, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-11-21 23:53:19.200000', '2020-11-21 23:53:19.200000', '2020-11-21 23:58:19.200000'),
(DEFAULT, 20944, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-11-16 05:04:21.600000', '2020-11-16 05:04:21.600000', '2020-11-16 05:09:21.600000');

-- 2020-11-19 00:25:00.000000
-- 2020-11-19
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1157, 75, 151, NULL, 'Review Edge Case Scenarios', 'This is Review Edge Case Scenarios', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2020-11-19', '2020-12-09', '2020-11-25', '2020-11-19 00:25:00.000000', '2020-11-19 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20946, 1157, 147, 'JOINED', '2020-11-19 00:25:00.000000', '2020-11-21 07:16:50.400000'),
(20947, 1157, 148, 'JOINED', '2020-11-19 00:25:00.000000', '2020-11-20 05:30:16.800000'),
(20948, 1157, 149, 'JOINED', '2020-11-19 00:25:00.000000', '2020-11-24 10:01:00.000000'),
(20949, 1157, 150, 'JOINED', '2020-11-19 00:25:00.000000', '2020-11-20 01:32:40.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20946, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-11-23 08:57:38.400000', '2020-11-23 08:57:38.400000', '2020-11-23 09:02:38.400000'),
(DEFAULT, 20947, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-11-23 09:14:55.200000', '2020-11-23 09:14:55.200000', '2020-11-23 09:19:55.200000'),
(DEFAULT, 20948, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-09 04:06:45.600000', '2020-12-09 04:06:45.600000', '2020-12-09 04:11:45.600000'),
(DEFAULT, 20949, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-11-29 23:17:19.200000', '2020-11-29 23:17:19.200000', '2020-11-29 23:22:19.200000');

-- 2020-11-26 00:25:00.000000
-- 2020-11-26
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1158, 75, 151, NULL, 'Validate Error Handling Scenarios', 'This is Validate Error Handling Scenarios', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2020-11-26', '2020-12-14', '2020-12-02', '2020-11-26 00:25:00.000000', '2020-11-26 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20951, 1158, 147, 'JOINED', '2020-11-26 00:25:00.000000', '2020-11-27 15:48:02.400000'),
(20952, 1158, 148, 'JOINED', '2020-11-26 00:25:00.000000', '2020-12-01 10:01:00.000000'),
(20953, 1158, 149, 'JOINED', '2020-11-26 00:25:00.000000', '2020-11-26 06:36:31.200000'),
(20954, 1158, 150, 'JOINED', '2020-11-26 00:25:00.000000', '2020-11-26 22:44:12.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20951, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-06 09:01:57.600000', '2020-12-06 09:01:57.600000', '2020-12-06 09:06:57.600000'),
(DEFAULT, 20952, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-14 22:18:16.800000', '2020-12-14 22:18:16.800000', '2020-12-14 22:23:16.800000'),
(DEFAULT, 20953, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-11-29 01:51:24.000000', '2020-11-29 01:51:24.000000', '2020-11-29 01:56:24.000000'),
(DEFAULT, 20954, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-11-28 13:19:43.200000', '2020-11-28 13:19:43.200000', '2020-11-28 13:24:43.200000');

-- 2020-12-03 00:25:00.000000
-- 2020-12-03
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1159, 75, 151, NULL, 'Align Validation with BE Logic', 'This is Align Validation with BE Logic', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2020-12-03', '2020-12-20', '2020-12-09', '2020-12-03 00:25:00.000000', '2020-12-03 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20956, 1159, 147, 'JOINED', '2020-12-03 00:25:00.000000', '2020-12-08 10:01:00.000000'),
(20957, 1159, 148, 'JOINED', '2020-12-03 00:25:00.000000', '2020-12-05 13:54:16.800000'),
(20958, 1159, 149, 'JOINED', '2020-12-03 00:25:00.000000', '2020-12-03 03:52:21.600000'),
(20959, 1159, 150, 'JOINED', '2020-12-03 00:25:00.000000', '2020-12-03 21:43:43.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20956, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-20 23:33:09.600000', '2020-12-20 23:33:09.600000', '2020-12-20 23:38:09.600000'),
(DEFAULT, 20957, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-08 06:50:55.200000', '2020-12-08 06:50:55.200000', '2020-12-08 06:55:55.200000'),
(DEFAULT, 20958, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-06 09:46:36.000000', '2020-12-06 09:46:36.000000', '2020-12-06 09:51:36.000000'),
(DEFAULT, 20959, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-08 04:58:36.000000', '2020-12-08 04:58:36.000000', '2020-12-08 05:03:36.000000');

-- 2020-12-10 00:25:00.000000
-- 2020-12-10
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1160, 75, 151, NULL, 'Review Data Consistency Rules', 'This is Review Data Consistency Rules', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2020-12-10', '2021-01-02', '2020-12-16', '2020-12-10 00:25:00.000000', '2020-12-10 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20961, 1160, 147, 'JOINED', '2020-12-10 00:25:00.000000', '2020-12-15 10:01:00.000000'),
(20962, 1160, 148, 'JOINED', '2020-12-10 00:25:00.000000', '2020-12-15 10:01:00.000000'),
(20963, 1160, 149, 'JOINED', '2020-12-10 00:25:00.000000', '2020-12-15 10:01:00.000000'),
(20964, 1160, 150, 'JOINED', '2020-12-10 00:25:00.000000', '2020-12-10 17:24:31.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20961, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-02 08:00:02.400000', '2021-01-02 08:00:02.400000', '2021-01-02 08:05:02.400000'),
(DEFAULT, 20962, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-27 20:31:43.200000', '2020-12-27 20:31:43.200000', '2020-12-27 20:36:43.200000'),
(DEFAULT, 20963, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-28 15:32:12.000000', '2020-12-28 15:32:12.000000', '2020-12-28 15:37:12.000000'),
(DEFAULT, 20964, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-14 03:20:40.800000', '2020-12-14 03:20:40.800000', '2020-12-14 03:25:40.800000');

-- 2020-12-17 00:25:00.000000
-- 2020-12-17
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1161, 75, 151, NULL, 'Analyze Impact of Invalid Data', 'This is Analyze Impact of Invalid Data', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2020-12-17', '2021-01-07', '2020-12-23', '2020-12-17 00:25:00.000000', '2020-12-17 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20966, 1161, 147, 'JOINED', '2020-12-17 00:25:00.000000', '2020-12-22 10:01:00.000000'),
(20967, 1161, 148, 'JOINED', '2020-12-17 00:25:00.000000', '2020-12-17 08:54:45.600000'),
(20968, 1161, 149, 'JOINED', '2020-12-17 00:25:00.000000', '2020-12-22 10:01:00.000000'),
(20969, 1161, 150, 'JOINED', '2020-12-17 00:25:00.000000', '2020-12-18 20:46:07.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20966, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-05 23:56:12.000000', '2021-01-05 23:56:12.000000', '2021-01-06 00:01:12.000000'),
(DEFAULT, 20967, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-19 09:52:21.600000', '2020-12-19 09:52:21.600000', '2020-12-19 09:57:21.600000'),
(DEFAULT, 20968, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-07 04:01:00.000000', '2021-01-07 04:01:00.000000', '2021-01-07 04:06:00.000000'),
(DEFAULT, 20969, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-22 18:30:45.600000', '2020-12-22 18:30:45.600000', '2020-12-22 18:35:45.600000');

-- 2020-12-24 00:25:00.000000
-- 2020-12-24
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1162, 75, 151, NULL, 'Define Data Correction Scenarios', 'This is Define Data Correction Scenarios', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2020-12-24', '2021-01-10', '2020-12-30', '2020-12-24 00:25:00.000000', '2020-12-24 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20971, 1162, 147, 'JOINED', '2020-12-24 00:25:00.000000', '2020-12-25 11:41:48.000000'),
(20972, 1162, 148, 'JOINED', '2020-12-24 00:25:00.000000', '2020-12-29 10:01:00.000000'),
(20973, 1162, 149, 'JOINED', '2020-12-24 00:25:00.000000', '2020-12-25 01:37:00.000000'),
(20974, 1162, 150, 'JOINED', '2020-12-24 00:25:00.000000', '2020-12-25 00:53:48.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20971, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-03 13:08:12.000000', '2021-01-03 13:08:12.000000', '2021-01-03 13:13:12.000000'),
(DEFAULT, 20972, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-10 14:46:07.200000', '2021-01-10 14:46:07.200000', '2021-01-10 14:51:07.200000'),
(DEFAULT, 20973, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-28 19:02:26.400000', '2020-12-28 19:02:26.400000', '2020-12-28 19:07:26.400000'),
(DEFAULT, 20974, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-26 09:17:48.000000', '2020-12-26 09:17:48.000000', '2020-12-26 09:22:48.000000');

-- 2020-12-31 00:25:00.000000
-- 2020-12-31
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1163, 75, 151, NULL, 'Validate Migration Data Rules', 'This is Validate Migration Data Rules', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2020-12-31', '2021-01-19', '2021-01-06', '2020-12-31 00:25:00.000000', '2020-12-31 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20976, 1163, 147, 'JOINED', '2020-12-31 00:25:00.000000', '2020-12-31 14:14:26.400000'),
(20977, 1163, 148, 'JOINED', '2020-12-31 00:25:00.000000', '2021-01-05 10:01:00.000000'),
(20978, 1163, 149, 'JOINED', '2020-12-31 00:25:00.000000', '2020-12-31 07:37:00.000000'),
(20979, 1163, 150, 'JOINED', '2020-12-31 00:25:00.000000', '2021-01-02 18:30:45.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20976, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-11 10:35:33.600000', '2021-01-11 10:35:33.600000', '2021-01-11 10:40:33.600000'),
(DEFAULT, 20977, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-19 10:58:36.000000', '2021-01-19 10:58:36.000000', '2021-01-19 11:03:36.000000'),
(DEFAULT, 20978, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-04 09:58:07.200000', '2021-01-04 09:58:07.200000', '2021-01-04 10:03:07.200000'),
(DEFAULT, 20979, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-04 14:17:19.200000', '2021-01-04 14:17:19.200000', '2021-01-04 14:22:19.200000');

-- 2021-01-07 00:25:00.000000
-- 2021-01-07
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1164, 75, 151, NULL, 'Review Historical Data Handling', 'This is Review Historical Data Handling', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2021-01-07', '2021-01-26', '2021-01-13', '2021-01-07 00:25:00.000000', '2021-01-07 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20981, 1164, 147, 'JOINED', '2021-01-07 00:25:00.000000', '2021-01-12 10:01:00.000000'),
(20982, 1164, 148, 'JOINED', '2021-01-07 00:25:00.000000', '2021-01-08 11:59:04.800000'),
(20983, 1164, 149, 'JOINED', '2021-01-07 00:25:00.000000', '2021-01-12 10:01:00.000000'),
(20984, 1164, 150, 'JOINED', '2021-01-07 00:25:00.000000', '2021-01-09 22:41:19.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20981, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-26 02:54:45.600000', '2021-01-26 02:54:45.600000', '2021-01-26 02:59:45.600000'),
(DEFAULT, 20982, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-17 12:50:55.200000', '2021-01-17 12:50:55.200000', '2021-01-17 12:55:55.200000'),
(DEFAULT, 20983, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-26 20:28:50.400000', '2021-01-26 20:28:50.400000', '2021-01-26 20:33:50.400000'),
(DEFAULT, 20984, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-11 04:03:52.800000', '2021-01-11 04:03:52.800000', '2021-01-11 04:08:52.800000');

-- 2021-01-14 00:25:00.000000
-- 2021-01-14
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1165, 75, 151, NULL, 'Define Data Review Checklist', 'This is Define Data Review Checklist', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2021-01-14', '2021-01-17', '2021-01-19', '2021-01-14 00:25:00.000000', '2021-01-14 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20986, 1165, 147, 'JOINED', '2021-01-14 00:25:00.000000', '2021-01-14 21:17:48.000000'),
(20987, 1165, 148, 'JOINED', '2021-01-14 00:25:00.000000', '2021-01-14 14:34:36.000000'),
(20988, 1165, 149, 'JOINED', '2021-01-14 00:25:00.000000', '2021-01-14 02:05:48.000000'),
(20989, 1165, 150, 'JOINED', '2021-01-14 00:25:00.000000', '2021-01-16 06:25:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20986, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-16 06:39:24.000000', '2021-01-16 06:39:24.000000', '2021-01-16 06:44:24.000000'),
(DEFAULT, 20987, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-15 09:17:48.000000', '2021-01-15 09:17:48.000000', '2021-01-15 09:22:48.000000'),
(DEFAULT, 20988, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-16 22:44:12.000000', '2021-01-16 22:44:12.000000', '2021-01-16 22:49:12.000000'),
(DEFAULT, 20989, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-17 04:29:48.000000', '2021-01-17 04:29:48.000000', '2021-01-17 04:34:48.000000');

-- 2021-01-20 00:25:00.000000
-- 2021-01-20
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1166, 75, 151, NULL, 'Conduct Data Review Workshop', 'This is Conduct Data Review Workshop', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2021-01-20', '2021-01-27', '2021-01-25', '2021-01-20 00:25:00.000000', '2021-01-20 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20991, 1166, 147, 'JOINED', '2021-01-20 00:25:00.000000', '2021-01-22 19:37:00.000000'),
(20992, 1166, 148, 'JOINED', '2021-01-20 00:25:00.000000', '2021-01-21 15:03:24.000000'),
(20993, 1166, 149, 'JOINED', '2021-01-20 00:25:00.000000', '2021-01-20 11:20:12.000000'),
(20994, 1166, 150, 'JOINED', '2021-01-20 00:25:00.000000', '2021-01-22 23:41:48.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20991, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-27 05:13:00.000000', '2021-01-27 05:13:00.000000', '2021-01-27 05:18:00.000000'),
(DEFAULT, 20992, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-23 04:51:24.000000', '2021-01-23 04:51:24.000000', '2021-01-23 04:56:24.000000'),
(DEFAULT, 20993, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-22 20:20:12.000000', '2021-01-22 20:20:12.000000', '2021-01-22 20:25:12.000000'),
(DEFAULT, 20994, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-23 19:58:36.000000', '2021-01-23 19:58:36.000000', '2021-01-23 20:03:36.000000');

-- 2021-01-26 00:25:00.000000
-- 2021-01-26
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1167, 75, 151, NULL, 'Document Validation Findings', 'This is Document Validation Findings', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2021-01-26', '2021-02-02', '2021-01-31', '2021-01-26 00:25:00.000000', '2021-01-26 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20996, 1167, 147, 'JOINED', '2021-01-26 00:25:00.000000', '2021-01-26 19:51:24.000000'),
(20997, 1167, 148, 'JOINED', '2021-01-26 00:25:00.000000', '2021-01-28 19:01:00.000000'),
(20998, 1167, 149, 'JOINED', '2021-01-26 00:25:00.000000', '2021-01-29 11:41:48.000000'),
(20999, 1167, 150, 'JOINED', '2021-01-26 00:25:00.000000', '2021-01-28 21:39:24.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20996, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-28 06:39:24.000000', '2021-01-28 06:39:24.000000', '2021-01-28 06:44:24.000000'),
(DEFAULT, 20997, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-02 05:49:00.000000', '2021-02-02 05:49:00.000000', '2021-02-02 05:54:00.000000'),
(DEFAULT, 20998, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-30 07:37:00.000000', '2021-01-30 07:37:00.000000', '2021-01-30 07:42:00.000000'),
(DEFAULT, 20999, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-02 03:10:36.000000', '2021-02-02 03:10:36.000000', '2021-02-02 03:15:36.000000');

-- 2021-02-01 00:25:00.000000
-- 2021-02-01
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1168, 75, 151, NULL, 'Resolve Validation Conflicts', 'This is Resolve Validation Conflicts', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2021-02-01', '2021-02-05', '2021-02-06', '2021-02-01 00:25:00.000000', '2021-02-01 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21001, 1168, 147, 'JOINED', '2021-02-01 00:25:00.000000', '2021-02-02 14:49:00.000000'),
(21002, 1168, 148, 'JOINED', '2021-02-01 00:25:00.000000', '2021-02-01 17:27:24.000000'),
(21003, 1168, 149, 'JOINED', '2021-02-01 00:25:00.000000', '2021-02-01 22:15:24.000000'),
(21004, 1168, 150, 'JOINED', '2021-02-01 00:25:00.000000', '2021-02-01 15:39:24.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21001, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-05 22:37:00.000000', '2021-02-05 22:37:00.000000', '2021-02-05 22:42:00.000000'),
(DEFAULT, 21002, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-04 12:10:36.000000', '2021-02-04 12:10:36.000000', '2021-02-04 12:15:36.000000'),
(DEFAULT, 21003, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-03 20:20:12.000000', '2021-02-03 20:20:12.000000', '2021-02-03 20:25:12.000000'),
(DEFAULT, 21004, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-02 14:27:24.000000', '2021-02-02 14:27:24.000000', '2021-02-02 14:32:24.000000');

-- 2021-02-07 00:25:00.000000
-- 2021-02-07
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1169, 75, 151, NULL, 'Confirm Validation Coverage', 'This is Confirm Validation Coverage', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2021-02-07', '2021-02-10', '2021-02-12', '2021-02-07 00:25:00.000000', '2021-02-07 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21006, 1169, 147, 'JOINED', '2021-02-07 00:25:00.000000', '2021-02-07 07:44:12.000000'),
(21007, 1169, 148, 'JOINED', '2021-02-07 00:25:00.000000', '2021-02-07 03:17:48.000000'),
(21008, 1169, 149, 'JOINED', '2021-02-07 00:25:00.000000', '2021-02-09 06:17:48.000000'),
(21009, 1169, 150, 'JOINED', '2021-02-07 00:25:00.000000', '2021-02-07 19:01:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21006, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-08 11:27:24.000000', '2021-02-08 11:27:24.000000', '2021-02-08 11:32:24.000000'),
(DEFAULT, 21007, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-09 19:51:24.000000', '2021-02-09 19:51:24.000000', '2021-02-09 19:56:24.000000'),
(DEFAULT, 21008, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-10 04:08:12.000000', '2021-02-10 04:08:12.000000', '2021-02-10 04:13:12.000000'),
(DEFAULT, 21009, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-09 06:25:00.000000', '2021-02-09 06:25:00.000000', '2021-02-09 06:30:00.000000');

-- 2021-02-13 00:25:00.000000
-- 2021-02-13
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1170, 75, 151, NULL, 'Get Stakeholder Approval', 'This is Get Stakeholder Approval', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2021-02-13', '2021-02-22', '2021-02-18', '2021-02-13 00:25:00.000000', '2021-02-13 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21011, 1170, 147, 'JOINED', '2021-02-13 00:25:00.000000', '2021-02-13 19:08:12.000000'),
(21012, 1170, 148, 'JOINED', '2021-02-13 00:25:00.000000', '2021-02-13 10:22:36.000000'),
(21013, 1170, 149, 'JOINED', '2021-02-13 00:25:00.000000', '2021-02-14 15:03:24.000000'),
(21014, 1170, 150, 'JOINED', '2021-02-13 00:25:00.000000', '2021-02-13 23:05:48.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21011, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-17 04:29:48.000000', '2021-02-17 04:29:48.000000', '2021-02-17 04:34:48.000000'),
(DEFAULT, 21012, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-22 14:27:24.000000', '2021-02-22 14:27:24.000000', '2021-02-22 14:32:24.000000'),
(DEFAULT, 21013, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-16 13:29:48.000000', '2021-02-16 13:29:48.000000', '2021-02-16 13:34:48.000000'),
(DEFAULT, 21014, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-16 07:44:12.000000', '2021-02-16 07:44:12.000000', '2021-02-16 07:49:12.000000');

-- 2021-02-19 00:25:00.000000
-- 2021-02-19
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1171, 75, 151, NULL, 'Sign Off Database Design Phase', 'This is Sign Off Database Design Phase', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2021-02-19', '2021-03-06', '2021-02-24', '2021-02-19 00:25:00.000000', '2021-02-19 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21016, 1171, 147, 'JOINED', '2021-02-19 00:25:00.000000', '2021-02-19 21:46:36.000000'),
(21017, 1171, 148, 'JOINED', '2021-02-19 00:25:00.000000', '2021-02-21 16:37:00.000000'),
(21018, 1171, 149, 'JOINED', '2021-02-19 00:25:00.000000', '2021-02-23 12:25:00.000000'),
(21019, 1171, 150, 'JOINED', '2021-02-19 00:25:00.000000', '2021-02-19 16:08:12.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21016, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-21 20:13:00.000000', '2021-02-21 20:13:00.000000', '2021-02-21 20:18:00.000000'),
(DEFAULT, 21017, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-22 22:51:24.000000', '2021-02-22 22:51:24.000000', '2021-02-22 22:56:24.000000'),
(DEFAULT, 21018, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-06 20:13:00.000000', '2021-03-06 20:13:00.000000', '2021-03-06 20:18:00.000000'),
(DEFAULT, 21019, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-22 16:58:36.000000', '2021-02-22 16:58:36.000000', '2021-02-22 17:03:36.000000');

INSERT INTO `phase` (`id`, `created_time`, `description`, `due_date`, `start_date`, `name`, `updated_time`, `project_id`, `created_by_id`)
VALUES (15, '2021-02-24 00:25:00.000000', 'This is Main Business Rules Analysis', '2023-01-15', '2021-02-24', 'Main Business Rules Analysis', '2021-02-24 00:25:00.000000', 5, 154);


INSERT INTO collection (`id`, `created_time`, `description`, `due_date`, `start_date`, `name`, `updated_time`, `phase_id`, `created_by_id`)
VALUES (76, '2021-02-24 00:30:00.000000', 'This is Core Business Rules', '2021-06-22', '2021-02-24', 'Core Business Rules', '2021-02-24 00:30:00.000000', 15, 154);


-- 2021-02-25 00:35:00.000000
-- 2021-02-25
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1172, 76, 151, NULL, 'Identify CV Creation Rules', 'This is Identify CV Creation Rules', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2021-02-25', '2021-03-15', '2021-03-02', '2021-02-25 00:35:00.000000', '2021-02-25 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21021, 1172, 147, 'JOINED', '2021-02-25 00:35:00.000000', '2021-02-25 00:56:36.000000'),
(21022, 1172, 148, 'JOINED', '2021-02-25 00:35:00.000000', '2021-02-25 12:06:12.000000'),
(21023, 1172, 149, 'JOINED', '2021-02-25 00:35:00.000000', '2021-03-01 12:35:00.000000'),
(21024, 1172, 150, 'JOINED', '2021-02-25 00:35:00.000000', '2021-03-01 12:35:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21021, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-27 00:35:00.000000', '2021-02-27 00:35:00.000000', '2021-02-27 00:40:00.000000'),
(DEFAULT, 21022, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-26 22:18:12.000000', '2021-02-26 22:18:12.000000', '2021-02-26 22:23:12.000000'),
(DEFAULT, 21023, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-15 14:30:12.000000', '2021-03-15 14:30:12.000000', '2021-03-15 14:35:12.000000'),
(DEFAULT, 21024, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-12 15:27:48.000000', '2021-03-12 15:27:48.000000', '2021-03-12 15:32:48.000000');

-- 2021-03-03 00:35:00.000000
-- 2021-03-03
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1173, 76, 151, NULL, 'Define CV Editing Constraints', 'This is Define CV Editing Constraints', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2021-03-03', '2021-03-07', '2021-03-08', '2021-03-03 00:35:00.000000', '2021-03-03 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21026, 1173, 147, 'JOINED', '2021-03-03 00:35:00.000000', '2021-03-03 07:47:00.000000'),
(21027, 1173, 148, 'JOINED', '2021-03-03 00:35:00.000000', '2021-03-03 16:32:36.000000'),
(21028, 1173, 149, 'JOINED', '2021-03-03 00:35:00.000000', '2021-03-03 07:39:48.000000'),
(21029, 1173, 150, 'JOINED', '2021-03-03 00:35:00.000000', '2021-03-05 16:11:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21026, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-04 04:39:48.000000', '2021-03-04 04:39:48.000000', '2021-03-04 04:44:48.000000'),
(DEFAULT, 21027, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-05 04:54:12.000000', '2021-03-05 04:54:12.000000', '2021-03-05 04:59:12.000000'),
(DEFAULT, 21028, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-05 03:20:36.000000', '2021-03-05 03:20:36.000000', '2021-03-05 03:25:36.000000'),
(DEFAULT, 21029, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-07 04:47:00.000000', '2021-03-07 04:47:00.000000', '2021-03-07 04:52:00.000000');

-- 2021-03-09 00:35:00.000000
-- 2021-03-09
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1174, 76, 151, NULL, 'Define CV Submission Rules', 'This is Define CV Submission Rules', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2021-03-09', '2021-03-18', '2021-03-14', '2021-03-09 00:35:00.000000', '2021-03-09 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21031, 1174, 147, 'JOINED', '2021-03-09 00:35:00.000000', '2021-03-11 14:51:48.000000'),
(21032, 1174, 148, 'JOINED', '2021-03-09 00:35:00.000000', '2021-03-12 13:39:48.000000'),
(21033, 1174, 149, 'JOINED', '2021-03-09 00:35:00.000000', '2021-03-10 00:24:12.000000'),
(21034, 1174, 150, 'JOINED', '2021-03-09 00:35:00.000000', '2021-03-10 00:35:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21031, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-12 12:20:36.000000', '2021-03-12 12:20:36.000000', '2021-03-12 12:25:36.000000'),
(DEFAULT, 21032, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-13 10:18:12.000000', '2021-03-13 10:18:12.000000', '2021-03-13 10:23:12.000000'),
(DEFAULT, 21033, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-18 00:45:48.000000', '2021-03-18 00:45:48.000000', '2021-03-18 00:50:48.000000'),
(DEFAULT, 21034, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-11 16:54:12.000000', '2021-03-11 16:54:12.000000', '2021-03-11 16:59:12.000000');

-- 2021-03-15 00:35:00.000000
-- 2021-03-15
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1175, 76, 151, NULL, 'Analyze CV Scoring Criteria', 'This is Analyze CV Scoring Criteria', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2021-03-15', '2021-03-22', '2021-03-20', '2021-03-15 00:35:00.000000', '2021-03-15 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21036, 1175, 147, 'JOINED', '2021-03-15 00:35:00.000000', '2021-03-17 20:30:12.000000'),
(21037, 1175, 148, 'JOINED', '2021-03-15 00:35:00.000000', '2021-03-15 08:30:12.000000'),
(21038, 1175, 149, 'JOINED', '2021-03-15 00:35:00.000000', '2021-03-17 15:27:48.000000'),
(21039, 1175, 150, 'JOINED', '2021-03-15 00:35:00.000000', '2021-03-15 10:39:48.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21036, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-22 04:39:48.000000', '2021-03-22 04:39:48.000000', '2021-03-22 04:44:48.000000'),
(DEFAULT, 21037, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-18 21:56:36.000000', '2021-03-18 21:56:36.000000', '2021-03-18 22:01:36.000000'),
(DEFAULT, 21038, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-18 14:01:24.000000', '2021-03-18 14:01:24.000000', '2021-03-18 14:06:24.000000'),
(DEFAULT, 21039, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-19 20:44:36.000000', '2021-03-19 20:44:36.000000', '2021-03-19 20:49:36.000000');

-- 2021-03-21 00:35:00.000000
-- 2021-03-21
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1176, 76, 151, NULL, 'Define Recommendation Triggers', 'This is Define Recommendation Triggers', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2021-03-21', '2021-04-05', '2021-03-26', '2021-03-21 00:35:00.000000', '2021-03-21 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21041, 1176, 147, 'JOINED', '2021-03-21 00:35:00.000000', '2021-03-21 18:56:36.000000'),
(21042, 1176, 148, 'JOINED', '2021-03-21 00:35:00.000000', '2021-03-22 13:14:36.000000'),
(21043, 1176, 149, 'JOINED', '2021-03-21 00:35:00.000000', '2021-03-23 15:27:48.000000'),
(21044, 1176, 150, 'JOINED', '2021-03-21 00:35:00.000000', '2021-03-25 12:35:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21041, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-25 23:30:12.000000', '2021-03-25 23:30:12.000000', '2021-03-25 23:35:12.000000'),
(DEFAULT, 21042, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-29 11:55:24.000000', '2021-03-29 11:55:24.000000', '2021-03-29 12:00:24.000000'),
(DEFAULT, 21043, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-24 10:25:24.000000', '2021-03-24 10:25:24.000000', '2021-03-24 10:30:24.000000'),
(DEFAULT, 21044, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-05 10:32:36.000000', '2021-04-05 10:32:36.000000', '2021-04-05 10:37:36.000000');

-- 2021-03-27 00:35:00.000000
-- 2021-03-27
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1177, 76, 151, NULL, 'Identify User Role Permissions', 'This is Identify User Role Permissions', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2021-03-27', '2021-04-12', '2021-04-01', '2021-03-27 00:35:00.000000', '2021-03-27 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21046, 1177, 147, 'JOINED', '2021-03-27 00:35:00.000000', '2021-03-29 06:35:00.000000'),
(21047, 1177, 148, 'JOINED', '2021-03-27 00:35:00.000000', '2021-03-31 12:35:00.000000'),
(21048, 1177, 149, 'JOINED', '2021-03-27 00:35:00.000000', '2021-03-27 07:47:00.000000'),
(21049, 1177, 150, 'JOINED', '2021-03-27 00:35:00.000000', '2021-03-27 13:03:48.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21046, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-03 18:35:00.000000', '2021-04-03 18:35:00.000000', '2021-04-03 18:40:00.000000'),
(DEFAULT, 21047, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-12 09:06:12.000000', '2021-04-12 09:06:12.000000', '2021-04-12 09:11:12.000000'),
(DEFAULT, 21048, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-28 09:27:48.000000', '2021-03-28 09:27:48.000000', '2021-03-28 09:32:48.000000'),
(DEFAULT, 21049, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-05 12:06:12.000000', '2021-04-05 12:06:12.000000', '2021-04-05 12:11:12.000000');

-- 2021-04-02 00:35:00.000000
-- 2021-04-02
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1178, 76, 151, NULL, 'Define Visibility Rules', 'This is Define Visibility Rules', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2021-04-02', '2021-04-17', '2021-04-07', '2021-04-02 00:35:00.000000', '2021-04-02 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21051, 1178, 147, 'JOINED', '2021-04-02 00:35:00.000000', '2021-04-03 09:56:36.000000'),
(21052, 1178, 148, 'JOINED', '2021-04-02 00:35:00.000000', '2021-04-02 01:18:12.000000'),
(21053, 1178, 149, 'JOINED', '2021-04-02 00:35:00.000000', '2021-04-02 14:37:24.000000'),
(21054, 1178, 150, 'JOINED', '2021-04-02 00:35:00.000000', '2021-04-06 12:35:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21051, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-04 13:03:48.000000', '2021-04-04 13:03:48.000000', '2021-04-04 13:08:48.000000'),
(DEFAULT, 21052, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-05 15:56:36.000000', '2021-04-05 15:56:36.000000', '2021-04-05 16:01:36.000000'),
(DEFAULT, 21053, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-05 05:01:24.000000', '2021-04-05 05:01:24.000000', '2021-04-05 05:06:24.000000'),
(DEFAULT, 21054, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-17 05:30:12.000000', '2021-04-17 05:30:12.000000', '2021-04-17 05:35:12.000000');

-- 2021-04-08 00:35:00.000000
-- 2021-04-08
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1179, 76, 151, NULL, 'Analyze Approval Workflows', 'This is Analyze Approval Workflows', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2021-04-08', '2021-04-24', '2021-04-13', '2021-04-08 00:35:00.000000', '2021-04-08 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21056, 1179, 147, 'JOINED', '2021-04-08 00:35:00.000000', '2021-04-12 12:35:00.000000'),
(21057, 1179, 148, 'JOINED', '2021-04-08 00:35:00.000000', '2021-04-12 12:35:00.000000'),
(21058, 1179, 149, 'JOINED', '2021-04-08 00:35:00.000000', '2021-04-08 18:13:24.000000'),
(21059, 1179, 150, 'JOINED', '2021-04-08 00:35:00.000000', '2021-04-09 05:44:36.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21056, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-22 15:49:24.000000', '2021-04-22 15:49:24.000000', '2021-04-22 15:54:24.000000'),
(DEFAULT, 21057, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-24 13:11:00.000000', '2021-04-24 13:11:00.000000', '2021-04-24 13:16:00.000000'),
(DEFAULT, 21058, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-09 20:44:36.000000', '2021-04-09 20:44:36.000000', '2021-04-09 20:49:36.000000'),
(DEFAULT, 21059, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-12 18:49:24.000000', '2021-04-12 18:49:24.000000', '2021-04-12 18:54:24.000000');

-- 2021-04-14 00:35:00.000000
-- 2021-04-14
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1180, 76, 151, NULL, 'Define CV Status Transitions', 'This is Define CV Status Transitions', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2021-04-14', '2021-04-18', '2021-04-19', '2021-04-14 00:35:00.000000', '2021-04-14 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21061, 1180, 147, 'JOINED', '2021-04-14 00:35:00.000000', '2021-04-15 11:23:00.000000'),
(21062, 1180, 148, 'JOINED', '2021-04-14 00:35:00.000000', '2021-04-14 18:49:24.000000'),
(21063, 1180, 149, 'JOINED', '2021-04-14 00:35:00.000000', '2021-04-15 02:30:12.000000'),
(21064, 1180, 150, 'JOINED', '2021-04-14 00:35:00.000000', '2021-04-16 02:44:36.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21061, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-17 16:25:24.000000', '2021-04-17 16:25:24.000000', '2021-04-17 16:30:24.000000'),
(DEFAULT, 21062, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-16 17:37:24.000000', '2021-04-16 17:37:24.000000', '2021-04-16 17:42:24.000000'),
(DEFAULT, 21063, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-18 17:30:12.000000', '2021-04-18 17:30:12.000000', '2021-04-18 17:35:12.000000'),
(DEFAULT, 21064, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-18 23:01:24.000000', '2021-04-18 23:01:24.000000', '2021-04-18 23:06:24.000000');

-- 2021-04-20 00:35:00.000000
-- 2021-04-20
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1181, 76, 151, NULL, 'Define Error Handling Rules', 'This is Define Error Handling Rules', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2021-04-20', '2021-04-29', '2021-04-25', '2021-04-20 00:35:00.000000', '2021-04-20 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21066, 1181, 147, 'JOINED', '2021-04-20 00:35:00.000000', '2021-04-21 23:59:00.000000'),
(21067, 1181, 148, 'JOINED', '2021-04-20 00:35:00.000000', '2021-04-20 03:35:00.000000'),
(21068, 1181, 149, 'JOINED', '2021-04-20 00:35:00.000000', '2021-04-21 22:18:12.000000'),
(21069, 1181, 150, 'JOINED', '2021-04-20 00:35:00.000000', '2021-04-20 03:56:36.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21066, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-24 03:35:00.000000', '2021-04-24 03:35:00.000000', '2021-04-24 03:40:00.000000'),
(DEFAULT, 21067, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-29 21:35:00.000000', '2021-04-29 21:35:00.000000', '2021-04-29 21:40:00.000000'),
(DEFAULT, 21068, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-22 17:01:24.000000', '2021-04-22 17:01:24.000000', '2021-04-22 17:06:24.000000'),
(DEFAULT, 21069, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-22 18:06:12.000000', '2021-04-22 18:06:12.000000', '2021-04-22 18:11:12.000000');

-- 2021-04-26 00:35:00.000000
-- 2021-04-26
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1182, 76, 151, NULL, 'Define Notification Triggers', 'This is Define Notification Triggers', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2021-04-26', '2021-04-29', '2021-05-01', '2021-04-26 00:35:00.000000', '2021-04-26 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21071, 1182, 147, 'JOINED', '2021-04-26 00:35:00.000000', '2021-04-28 07:39:48.000000'),
(21072, 1182, 148, 'JOINED', '2021-04-26 00:35:00.000000', '2021-04-26 19:03:48.000000'),
(21073, 1182, 149, 'JOINED', '2021-04-26 00:35:00.000000', '2021-04-26 01:03:48.000000'),
(21074, 1182, 150, 'JOINED', '2021-04-26 00:35:00.000000', '2021-04-27 16:11:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21071, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-29 03:42:12.000000', '2021-04-29 03:42:12.000000', '2021-04-29 03:47:12.000000'),
(DEFAULT, 21072, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-28 17:08:36.000000', '2021-04-28 17:08:36.000000', '2021-04-28 17:13:36.000000'),
(DEFAULT, 21073, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-28 02:51:48.000000', '2021-04-28 02:51:48.000000', '2021-04-28 02:56:48.000000'),
(DEFAULT, 21074, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-29 21:42:12.000000', '2021-04-29 21:42:12.000000', '2021-04-29 21:47:12.000000');

-- 2021-05-02 00:35:00.000000
-- 2021-05-02
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1183, 76, 151, NULL, 'Analyze Retry & Recovery Rules', 'This is Analyze Retry & Recovery Rules', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2021-05-02', '2021-05-15', '2021-05-06', '2021-05-02 00:35:00.000000', '2021-05-02 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21076, 1183, 147, 'JOINED', '2021-05-02 00:35:00.000000', '2021-05-02 03:39:19.200000'),
(21077, 1183, 148, 'JOINED', '2021-05-02 00:35:00.000000', '2021-05-02 23:02:50.400000'),
(21078, 1183, 149, 'JOINED', '2021-05-02 00:35:00.000000', '2021-05-05 14:59:00.000000'),
(21079, 1183, 150, 'JOINED', '2021-05-02 00:35:00.000000', '2021-05-04 03:22:02.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21076, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-05 17:51:48.000000', '2021-05-05 17:51:48.000000', '2021-05-05 17:56:48.000000'),
(DEFAULT, 21077, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-04 09:59:28.800000', '2021-05-04 09:59:28.800000', '2021-05-04 10:04:28.800000'),
(DEFAULT, 21078, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-15 08:27:19.200000', '2021-05-15 08:27:19.200000', '2021-05-15 08:32:19.200000'),
(DEFAULT, 21079, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-05 09:01:52.800000', '2021-05-05 09:01:52.800000', '2021-05-05 09:06:52.800000');

-- 2021-05-07 00:35:00.000000
-- 2021-05-07
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1184, 76, 151, NULL, 'Define SLA-related Rules', 'This is Define SLA-related Rules', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2021-05-07', '2021-05-19', '2021-05-11', '2021-05-07 00:35:00.000000', '2021-05-07 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21081, 1184, 147, 'JOINED', '2021-05-07 00:35:00.000000', '2021-05-07 22:16:45.600000'),
(21082, 1184, 148, 'JOINED', '2021-05-07 00:35:00.000000', '2021-05-09 21:59:28.800000'),
(21083, 1184, 149, 'JOINED', '2021-05-07 00:35:00.000000', '2021-05-07 16:59:57.600000'),
(21084, 1184, 150, 'JOINED', '2021-05-07 00:35:00.000000', '2021-05-10 14:59:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21081, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-14 02:53:14.400000', '2021-05-14 02:53:14.400000', '2021-05-14 02:58:14.400000'),
(DEFAULT, 21082, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-10 17:28:45.600000', '2021-05-10 17:28:45.600000', '2021-05-10 17:33:45.600000'),
(DEFAULT, 21083, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-08 11:02:50.400000', '2021-05-08 11:02:50.400000', '2021-05-08 11:07:50.400000'),
(DEFAULT, 21084, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-19 07:47:00.000000', '2021-05-19 07:47:00.000000', '2021-05-19 07:52:00.000000');

-- 2021-05-12 00:35:00.000000
-- 2021-05-12
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1185, 76, 151, NULL, 'Align Rules with Backend Logic', 'This is Align Rules with Backend Logic', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2021-05-12', '2021-05-19', '2021-05-16', '2021-05-12 00:35:00.000000', '2021-05-12 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21086, 1185, 147, 'JOINED', '2021-05-12 00:35:00.000000', '2021-05-13 03:22:02.400000'),
(21087, 1185, 148, 'JOINED', '2021-05-12 00:35:00.000000', '2021-05-12 17:25:52.800000'),
(21088, 1185, 149, 'JOINED', '2021-05-12 00:35:00.000000', '2021-05-12 07:47:00.000000'),
(21089, 1185, 150, 'JOINED', '2021-05-12 00:35:00.000000', '2021-05-12 11:43:09.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21086, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-14 13:38:21.600000', '2021-05-14 13:38:21.600000', '2021-05-14 13:43:21.600000'),
(DEFAULT, 21087, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-19 07:44:07.200000', '2021-05-19 07:44:07.200000', '2021-05-19 07:49:07.200000'),
(DEFAULT, 21088, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-14 15:27:48.000000', '2021-05-14 15:27:48.000000', '2021-05-14 15:32:48.000000'),
(DEFAULT, 21089, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-13 16:36:55.200000', '2021-05-13 16:36:55.200000', '2021-05-13 16:41:55.200000');

-- 2021-05-17 00:35:00.000000
-- 2021-05-17
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1186, 76, 151, NULL, 'Resolve Rule Conflicts', 'This is Resolve Rule Conflicts', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2021-05-17', '2021-05-23', '2021-05-21', '2021-05-17 00:35:00.000000', '2021-05-17 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21091, 1186, 147, 'JOINED', '2021-05-17 00:35:00.000000', '2021-05-18 03:10:31.200000'),
(21092, 1186, 148, 'JOINED', '2021-05-17 00:35:00.000000', '2021-05-17 19:18:12.000000'),
(21093, 1186, 149, 'JOINED', '2021-05-17 00:35:00.000000', '2021-05-19 04:54:12.000000'),
(21094, 1186, 150, 'JOINED', '2021-05-17 00:35:00.000000', '2021-05-18 04:02:21.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21091, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-19 16:48:26.400000', '2021-05-19 16:48:26.400000', '2021-05-19 16:53:26.400000'),
(DEFAULT, 21092, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-20 03:56:36.000000', '2021-05-20 03:56:36.000000', '2021-05-20 04:01:36.000000'),
(DEFAULT, 21093, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-20 15:56:36.000000', '2021-05-20 15:56:36.000000', '2021-05-20 16:01:36.000000'),
(DEFAULT, 21094, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-23 21:07:38.400000', '2021-05-23 21:07:38.400000', '2021-05-23 21:12:38.400000');

-- 2021-05-22 00:35:00.000000
-- 2021-05-22
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1187, 76, 151, NULL, 'Validate Business Rule Coverage', 'This is Validate Business Rule Coverage', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2021-05-22', '2021-05-25', '2021-05-26', '2021-05-22 00:35:00.000000', '2021-05-22 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21096, 1187, 147, 'JOINED', '2021-05-22 00:35:00.000000', '2021-05-24 00:17:43.200000'),
(21097, 1187, 148, 'JOINED', '2021-05-22 00:35:00.000000', '2021-05-22 10:28:16.800000'),
(21098, 1187, 149, 'JOINED', '2021-05-22 00:35:00.000000', '2021-05-22 10:51:19.200000'),
(21099, 1187, 150, 'JOINED', '2021-05-22 00:35:00.000000', '2021-05-22 20:50:21.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21096, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-25 21:30:40.800000', '2021-05-25 21:30:40.800000', '2021-05-25 21:35:40.800000'),
(DEFAULT, 21097, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-23 14:24:26.400000', '2021-05-23 14:24:26.400000', '2021-05-23 14:29:26.400000'),
(DEFAULT, 21098, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-24 10:22:31.200000', '2021-05-24 10:22:31.200000', '2021-05-24 10:27:31.200000'),
(DEFAULT, 21099, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-24 23:08:36.000000', '2021-05-24 23:08:36.000000', '2021-05-24 23:13:36.000000');

-- 2021-05-27 00:35:00.000000
-- 2021-05-27
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1188, 76, 151, NULL, 'Document Business Rules', 'This is Document Business Rules', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2021-05-27', '2021-05-31', '2021-05-31', '2021-05-27 00:35:00.000000', '2021-05-27 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21101, 1188, 147, 'JOINED', '2021-05-27 00:35:00.000000', '2021-05-27 22:05:14.400000'),
(21102, 1188, 148, 'JOINED', '2021-05-27 00:35:00.000000', '2021-05-28 09:47:57.600000'),
(21103, 1188, 149, 'JOINED', '2021-05-27 00:35:00.000000', '2021-05-27 16:08:07.200000'),
(21104, 1188, 150, 'JOINED', '2021-05-27 00:35:00.000000', '2021-05-28 01:26:50.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21101, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-30 00:35:00.000000', '2021-05-30 00:35:00.000000', '2021-05-30 00:40:00.000000'),
(DEFAULT, 21102, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-31 00:23:28.800000', '2021-05-31 00:23:28.800000', '2021-05-31 00:28:28.800000'),
(DEFAULT, 21103, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-30 08:56:07.200000', '2021-05-30 08:56:07.200000', '2021-05-30 09:01:07.200000'),
(DEFAULT, 21104, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-30 12:58:02.400000', '2021-05-30 12:58:02.400000', '2021-05-30 13:03:02.400000');

-- 2021-06-01 00:35:00.000000
-- 2021-06-01
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1189, 76, 151, NULL, 'Review Rules with Stakeholders', 'This is Review Rules with Stakeholders', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2021-06-01', '2021-06-06', '2021-06-05', '2021-06-01 00:35:00.000000', '2021-06-01 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21106, 1189, 147, 'JOINED', '2021-06-01 00:35:00.000000', '2021-06-01 08:33:04.800000'),
(21107, 1189, 148, 'JOINED', '2021-06-01 00:35:00.000000', '2021-06-01 04:54:12.000000'),
(21108, 1189, 149, 'JOINED', '2021-06-01 00:35:00.000000', '2021-06-03 09:01:52.800000'),
(21109, 1189, 150, 'JOINED', '2021-06-01 00:35:00.000000', '2021-06-01 14:47:28.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21106, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-06-03 16:48:26.400000', '2021-06-03 16:48:26.400000', '2021-06-03 16:53:26.400000'),
(DEFAULT, 21107, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-06-01 21:53:43.200000', '2021-06-01 21:53:43.200000', '2021-06-01 21:58:43.200000'),
(DEFAULT, 21108, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-06-06 16:08:07.200000', '2021-06-06 16:08:07.200000', '2021-06-06 16:13:07.200000'),
(DEFAULT, 21109, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-06-04 10:28:16.800000', '2021-06-04 10:28:16.800000', '2021-06-04 10:33:16.800000');

-- 2021-06-06 00:35:00.000000
-- 2021-06-06
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1190, 76, 151, NULL, 'Refine Business Rules', 'This is Refine Business Rules', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2021-06-06', '2021-06-18', '2021-06-10', '2021-06-06 00:35:00.000000', '2021-06-06 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21111, 1190, 147, 'JOINED', '2021-06-06 00:35:00.000000', '2021-06-06 02:24:26.400000'),
(21112, 1190, 148, 'JOINED', '2021-06-06 00:35:00.000000', '2021-06-08 05:05:43.200000'),
(21113, 1190, 149, 'JOINED', '2021-06-06 00:35:00.000000', '2021-06-09 14:59:00.000000'),
(21114, 1190, 150, 'JOINED', '2021-06-06 00:35:00.000000', '2021-06-08 15:45:04.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21111, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-06-13 22:45:33.600000', '2021-06-13 22:45:33.600000', '2021-06-13 22:50:33.600000'),
(DEFAULT, 21112, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-06-11 20:04:16.800000', '2021-06-11 20:04:16.800000', '2021-06-11 20:09:16.800000'),
(DEFAULT, 21113, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-06-18 14:35:57.600000', '2021-06-18 14:35:57.600000', '2021-06-18 14:40:57.600000'),
(DEFAULT, 21114, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-06-09 22:57:04.800000', '2021-06-09 22:57:04.800000', '2021-06-09 23:02:04.800000');

-- 2021-06-11 00:35:00.000000
-- 2021-06-11
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1191, 76, 151, NULL, 'Sign Off Core Business Rules', 'This is Sign Off Core Business Rules', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2021-06-11', '2021-06-22', '2021-06-15', '2021-06-11 00:35:00.000000', '2021-06-11 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21116, 1191, 147, 'JOINED', '2021-06-11 00:35:00.000000', '2021-06-11 19:18:12.000000'),
(21117, 1191, 148, 'JOINED', '2021-06-11 00:35:00.000000', '2021-06-11 20:38:50.400000'),
(21118, 1191, 149, 'JOINED', '2021-06-11 00:35:00.000000', '2021-06-11 03:56:36.000000'),
(21119, 1191, 150, 'JOINED', '2021-06-11 00:35:00.000000', '2021-06-14 14:59:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21116, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-06-14 02:41:43.200000', '2021-06-14 02:41:43.200000', '2021-06-14 02:46:43.200000'),
(DEFAULT, 21117, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-06-13 14:41:43.200000', '2021-06-13 14:41:43.200000', '2021-06-13 14:46:43.200000'),
(DEFAULT, 21118, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-06-12 01:44:07.200000', '2021-06-12 01:44:07.200000', '2021-06-12 01:49:07.200000'),
(DEFAULT, 21119, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-06-22 20:33:04.800000', '2021-06-22 20:33:04.800000', '2021-06-22 20:38:04.800000');

INSERT INTO collection (`id`, `created_time`, `description`, `due_date`, `start_date`, `name`, `updated_time`, `phase_id`, `created_by_id`)
VALUES (77, '2021-06-15 00:35:00.000000', 'This is Process Flow Analysis', '2021-10-16', '2021-06-15', 'Process Flow Analysis', '2021-06-15 00:35:00.000000', 15, 154);


-- 2021-06-16 00:40:00.000000
-- 2021-06-16
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1192, 77, 151, NULL, 'Define CV End-to-End Flow', 'This is Define CV End-to-End Flow', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2021-06-16', '2021-06-29', '2021-06-20', '2021-06-16 00:40:00.000000', '2021-06-16 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21121, 1192, 147, 'JOINED', '2021-06-16 00:40:00.000000', '2021-06-18 09:09:45.600000'),
(21122, 1192, 148, 'JOINED', '2021-06-16 00:40:00.000000', '2021-06-16 14:12:09.600000'),
(21123, 1192, 149, 'JOINED', '2021-06-16 00:40:00.000000', '2021-06-17 02:12:09.600000'),
(21124, 1192, 150, 'JOINED', '2021-06-16 00:40:00.000000', '2021-06-19 15:04:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21121, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-06-21 16:10:14.400000', '2021-06-21 16:10:14.400000', '2021-06-21 16:15:14.400000'),
(DEFAULT, 21122, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-06-17 10:21:45.600000', '2021-06-17 10:21:45.600000', '2021-06-17 10:26:45.600000'),
(DEFAULT, 21123, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-06-19 07:05:55.200000', '2021-06-19 07:05:55.200000', '2021-06-19 07:10:55.200000'),
(DEFAULT, 21124, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-06-29 06:31:21.600000', '2021-06-29 06:31:21.600000', '2021-06-29 06:36:21.600000');

-- 2021-06-21 00:40:00.000000
-- 2021-06-21
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1193, 77, 151, NULL, 'Map User Interaction Flow', 'This is Map User Interaction Flow', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2021-06-21', '2021-07-04', '2021-06-25', '2021-06-21 00:40:00.000000', '2021-06-21 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21126, 1193, 147, 'JOINED', '2021-06-21 00:40:00.000000', '2021-06-21 01:54:52.800000'),
(21127, 1193, 148, 'JOINED', '2021-06-21 00:40:00.000000', '2021-06-24 15:04:00.000000'),
(21128, 1193, 149, 'JOINED', '2021-06-21 00:40:00.000000', '2021-06-21 02:23:40.800000'),
(21129, 1193, 150, 'JOINED', '2021-06-21 00:40:00.000000', '2021-06-21 07:37:36.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21126, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-06-22 14:23:40.800000', '2021-06-22 14:23:40.800000', '2021-06-22 14:28:40.800000'),
(DEFAULT, 21127, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-04 03:50:04.800000', '2021-07-04 03:50:04.800000', '2021-07-04 03:55:04.800000'),
(DEFAULT, 21128, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-06-21 21:52:57.600000', '2021-06-21 21:52:57.600000', '2021-06-21 21:57:57.600000'),
(DEFAULT, 21129, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-06-28 17:42:24.000000', '2021-06-28 17:42:24.000000', '2021-06-28 17:47:24.000000');

-- 2021-06-26 00:40:00.000000
-- 2021-06-26
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1194, 77, 151, NULL, 'Define Exception Flows', 'This is Define Exception Flows', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2021-06-26', '2021-07-02', '2021-06-30', '2021-06-26 00:40:00.000000', '2021-06-26 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21131, 1194, 147, 'JOINED', '2021-06-26 00:40:00.000000', '2021-06-27 01:49:07.200000'),
(21132, 1194, 148, 'JOINED', '2021-06-26 00:40:00.000000', '2021-06-27 06:57:16.800000'),
(21133, 1194, 149, 'JOINED', '2021-06-26 00:40:00.000000', '2021-06-26 17:56:48.000000'),
(21134, 1194, 150, 'JOINED', '2021-06-26 00:40:00.000000', '2021-06-26 00:40:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21131, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-06-28 15:32:48.000000', '2021-06-28 15:32:48.000000', '2021-06-28 15:37:48.000000'),
(DEFAULT, 21132, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-02 18:22:43.200000', '2021-07-02 18:22:43.200000', '2021-07-02 18:27:43.200000'),
(DEFAULT, 21133, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-06-29 08:09:16.800000', '2021-06-29 08:09:16.800000', '2021-06-29 08:14:16.800000'),
(DEFAULT, 21134, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-06-28 20:20:48.000000', '2021-06-28 20:20:48.000000', '2021-06-28 20:25:48.000000');

-- 2021-07-01 00:40:00.000000
-- 2021-07-01
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1195, 77, 151, NULL, 'Analyze Failure Scenarios', 'This is Analyze Failure Scenarios', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2021-07-01', '2021-07-15', '2021-07-05', '2021-07-01 00:40:00.000000', '2021-07-01 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21136, 1195, 147, 'JOINED', '2021-07-01 00:40:00.000000', '2021-07-01 03:15:31.200000'),
(21137, 1195, 148, 'JOINED', '2021-07-01 00:40:00.000000', '2021-07-01 22:47:40.800000'),
(21138, 1195, 149, 'JOINED', '2021-07-01 00:40:00.000000', '2021-07-03 08:43:50.400000'),
(21139, 1195, 150, 'JOINED', '2021-07-01 00:40:00.000000', '2021-07-04 15:04:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21136, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-04 22:56:19.200000', '2021-07-04 22:56:19.200000', '2021-07-04 23:01:19.200000'),
(DEFAULT, 21137, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-08 02:32:19.200000', '2021-07-08 02:32:19.200000', '2021-07-08 02:37:19.200000'),
(DEFAULT, 21138, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-04 02:12:09.600000', '2021-07-04 02:12:09.600000', '2021-07-04 02:17:09.600000'),
(DEFAULT, 21139, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-15 10:50:33.600000', '2021-07-15 10:50:33.600000', '2021-07-15 10:55:33.600000');

-- 2021-07-06 00:40:00.000000
-- 2021-07-06
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1196, 77, 151, NULL, 'Define Recovery Processes', 'This is Define Recovery Processes', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2021-07-06', '2021-07-13', '2021-07-10', '2021-07-06 00:40:00.000000', '2021-07-06 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21141, 1196, 147, 'JOINED', '2021-07-06 00:40:00.000000', '2021-07-06 23:13:36.000000'),
(21142, 1196, 148, 'JOINED', '2021-07-06 00:40:00.000000', '2021-07-06 08:00:38.400000'),
(21143, 1196, 149, 'JOINED', '2021-07-06 00:40:00.000000', '2021-07-07 05:56:48.000000'),
(21144, 1196, 150, 'JOINED', '2021-07-06 00:40:00.000000', '2021-07-07 19:57:45.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21141, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-08 09:12:38.400000', '2021-07-08 09:12:38.400000', '2021-07-08 09:17:38.400000'),
(DEFAULT, 21142, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-13 17:19:21.600000', '2021-07-13 17:19:21.600000', '2021-07-13 17:24:21.600000'),
(DEFAULT, 21143, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-07 20:26:33.600000', '2021-07-07 20:26:33.600000', '2021-07-07 20:31:33.600000'),
(DEFAULT, 21144, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-09 10:04:28.800000', '2021-07-09 10:04:28.800000', '2021-07-09 10:09:28.800000');

-- 2021-07-11 00:40:00.000000
-- 2021-07-11
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1197, 77, 151, NULL, 'Align Process with FE UX', 'This is Align Process with FE UX', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2021-07-11', '2021-07-14', '2021-07-15', '2021-07-11 00:40:00.000000', '2021-07-11 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21146, 1197, 147, 'JOINED', '2021-07-11 00:40:00.000000', '2021-07-11 03:44:19.200000'),
(21147, 1197, 148, 'JOINED', '2021-07-11 00:40:00.000000', '2021-07-11 03:27:02.400000'),
(21148, 1197, 149, 'JOINED', '2021-07-11 00:40:00.000000', '2021-07-11 21:52:57.600000'),
(21149, 1197, 150, 'JOINED', '2021-07-11 00:40:00.000000', '2021-07-11 02:23:40.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21146, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-12 22:16:00.000000', '2021-07-12 22:16:00.000000', '2021-07-12 22:21:00.000000'),
(DEFAULT, 21147, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-14 17:28:00.000000', '2021-07-14 17:28:00.000000', '2021-07-14 17:33:00.000000'),
(DEFAULT, 21148, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-12 12:28:28.800000', '2021-07-12 12:28:28.800000', '2021-07-12 12:33:28.800000'),
(DEFAULT, 21149, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-14 08:03:31.200000', '2021-07-14 08:03:31.200000', '2021-07-14 08:08:31.200000');

-- 2021-07-16 00:40:00.000000
-- 2021-07-16
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1198, 77, 151, NULL, 'Align Process with BE Services', 'This is Align Process with BE Services', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2021-07-16', '2021-07-19', '2021-07-20', '2021-07-16 00:40:00.000000', '2021-07-16 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21151, 1198, 147, 'JOINED', '2021-07-16 00:40:00.000000', '2021-07-17 08:49:36.000000'),
(21152, 1198, 148, 'JOINED', '2021-07-16 00:40:00.000000', '2021-07-16 01:37:36.000000'),
(21153, 1198, 149, 'JOINED', '2021-07-16 00:40:00.000000', '2021-07-16 20:15:02.400000'),
(21154, 1198, 150, 'JOINED', '2021-07-16 00:40:00.000000', '2021-07-17 12:22:43.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21151, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-19 00:34:14.400000', '2021-07-19 00:34:14.400000', '2021-07-19 00:39:14.400000'),
(DEFAULT, 21152, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-18 02:46:43.200000', '2021-07-18 02:46:43.200000', '2021-07-18 02:51:43.200000'),
(DEFAULT, 21153, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-18 14:40:57.600000', '2021-07-18 14:40:57.600000', '2021-07-18 14:45:57.600000'),
(DEFAULT, 21154, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-19 19:28:57.600000', '2021-07-19 19:28:57.600000', '2021-07-19 19:33:57.600000');

-- 2021-07-21 00:40:00.000000
-- 2021-07-21
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1199, 77, 151, NULL, 'Define Integration Touchpoints', 'This is Define Integration Touchpoints', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2021-07-21', '2021-07-28', '2021-07-25', '2021-07-21 00:40:00.000000', '2021-07-21 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21156, 1199, 147, 'JOINED', '2021-07-21 00:40:00.000000', '2021-07-21 06:25:36.000000'),
(21157, 1199, 148, 'JOINED', '2021-07-21 00:40:00.000000', '2021-07-21 20:55:21.600000'),
(21158, 1199, 149, 'JOINED', '2021-07-21 00:40:00.000000', '2021-07-21 10:59:12.000000'),
(21159, 1199, 150, 'JOINED', '2021-07-21 00:40:00.000000', '2021-07-22 06:57:16.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21156, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-22 09:58:43.200000', '2021-07-22 09:58:43.200000', '2021-07-22 10:03:43.200000'),
(DEFAULT, 21157, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-24 11:48:09.600000', '2021-07-24 11:48:09.600000', '2021-07-24 11:53:09.600000'),
(DEFAULT, 21158, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-28 14:20:48.000000', '2021-07-28 14:20:48.000000', '2021-07-28 14:25:48.000000'),
(DEFAULT, 21159, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-27 18:22:43.200000', '2021-07-27 18:22:43.200000', '2021-07-27 18:27:43.200000');

-- 2021-07-26 00:40:00.000000
-- 2021-07-26
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1200, 77, 151, NULL, 'Identify Bottlenecks', 'This is Identify Bottlenecks', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2021-07-26', '2021-08-08', '2021-07-30', '2021-07-26 00:40:00.000000', '2021-07-26 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21161, 1200, 147, 'JOINED', '2021-07-26 00:40:00.000000', '2021-07-27 06:42:52.800000'),
(21162, 1200, 148, 'JOINED', '2021-07-26 00:40:00.000000', '2021-07-29 15:04:00.000000'),
(21163, 1200, 149, 'JOINED', '2021-07-26 00:40:00.000000', '2021-07-27 02:58:14.400000'),
(21164, 1200, 150, 'JOINED', '2021-07-26 00:40:00.000000', '2021-07-26 14:46:43.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21161, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-28 20:55:21.600000', '2021-07-28 20:55:21.600000', '2021-07-28 21:00:21.600000'),
(DEFAULT, 21162, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-08 17:22:14.400000', '2021-08-08 17:22:14.400000', '2021-08-08 17:27:14.400000'),
(DEFAULT, 21163, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-29 15:21:16.800000', '2021-07-29 15:21:16.800000', '2021-07-29 15:26:16.800000'),
(DEFAULT, 21164, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-28 05:45:16.800000', '2021-07-28 05:45:16.800000', '2021-07-28 05:50:16.800000');

-- 2021-07-31 00:40:00.000000
-- 2021-07-31
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1201, 77, 151, NULL, 'Optimize Process Efficiency', 'This is Optimize Process Efficiency', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2021-07-31', '2021-08-03', '2021-08-04', '2021-07-31 00:40:00.000000', '2021-07-31 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21166, 1201, 147, 'JOINED', '2021-07-31 00:40:00.000000', '2021-08-01 15:44:19.200000'),
(21167, 1201, 148, 'JOINED', '2021-07-31 00:40:00.000000', '2021-07-31 09:18:24.000000'),
(21168, 1201, 149, 'JOINED', '2021-07-31 00:40:00.000000', '2021-07-31 13:37:36.000000'),
(21169, 1201, 150, 'JOINED', '2021-07-31 00:40:00.000000', '2021-08-01 14:29:26.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21166, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-02 23:42:24.000000', '2021-08-02 23:42:24.000000', '2021-08-02 23:47:24.000000'),
(DEFAULT, 21167, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-01 07:40:28.800000', '2021-08-01 07:40:28.800000', '2021-08-01 07:45:28.800000'),
(DEFAULT, 21168, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-03 20:55:21.600000', '2021-08-03 20:55:21.600000', '2021-08-03 21:00:21.600000'),
(DEFAULT, 21169, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-03 07:46:14.400000', '2021-08-03 07:46:14.400000', '2021-08-03 07:51:14.400000');

-- 2021-08-05 00:40:00.000000
-- 2021-08-05
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1202, 77, 151, NULL, 'Validate Parallel Flows', 'This is Validate Parallel Flows', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2021-08-05', '2021-08-20', '2021-08-09', '2021-08-05 00:40:00.000000', '2021-08-05 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21171, 1202, 147, 'JOINED', '2021-08-05 00:40:00.000000', '2021-08-06 20:55:21.600000'),
(21172, 1202, 148, 'JOINED', '2021-08-05 00:40:00.000000', '2021-08-05 14:49:36.000000'),
(21173, 1202, 149, 'JOINED', '2021-08-05 00:40:00.000000', '2021-08-08 15:04:00.000000'),
(21174, 1202, 150, 'JOINED', '2021-08-05 00:40:00.000000', '2021-08-08 15:04:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21171, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-08 00:51:31.200000', '2021-08-08 00:51:31.200000', '2021-08-08 00:56:31.200000'),
(DEFAULT, 21172, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-12 10:30:24.000000', '2021-08-12 10:30:24.000000', '2021-08-12 10:35:24.000000'),
(DEFAULT, 21173, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-20 03:55:50.400000', '2021-08-20 03:55:50.400000', '2021-08-20 04:00:50.400000'),
(DEFAULT, 21174, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-18 14:23:40.800000', '2021-08-18 14:23:40.800000', '2021-08-18 14:28:40.800000');

-- 2021-08-10 00:40:00.000000
-- 2021-08-10
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1203, 77, 151, NULL, 'Define Manual Intervention Points', 'This is Define Manual Intervention Points', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2021-08-10', '2021-08-25', '2021-08-14', '2021-08-10 00:40:00.000000', '2021-08-10 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21176, 1203, 147, 'JOINED', '2021-08-10 00:40:00.000000', '2021-08-13 15:04:00.000000'),
(21177, 1203, 148, 'JOINED', '2021-08-10 00:40:00.000000', '2021-08-11 16:59:12.000000'),
(21178, 1203, 149, 'JOINED', '2021-08-10 00:40:00.000000', '2021-08-11 03:15:31.200000'),
(21179, 1203, 150, 'JOINED', '2021-08-10 00:40:00.000000', '2021-08-13 15:04:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21176, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-25 09:41:26.400000', '2021-08-25 09:41:26.400000', '2021-08-25 09:46:26.400000'),
(DEFAULT, 21177, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-13 06:02:33.600000', '2021-08-13 06:02:33.600000', '2021-08-13 06:07:33.600000'),
(DEFAULT, 21178, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-12 07:52:00.000000', '2021-08-12 07:52:00.000000', '2021-08-12 07:57:00.000000'),
(DEFAULT, 21179, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-23 01:14:33.600000', '2021-08-23 01:14:33.600000', '2021-08-23 01:19:33.600000');

-- 2021-08-15 00:40:00.000000
-- 2021-08-15
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1204, 77, 151, NULL, 'Document Process Flow Diagrams', 'This is Document Process Flow Diagrams', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2021-08-15', '2021-08-28', '2021-08-19', '2021-08-15 00:40:00.000000', '2021-08-15 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21181, 1204, 147, 'JOINED', '2021-08-15 00:40:00.000000', '2021-08-18 15:04:00.000000'),
(21182, 1204, 148, 'JOINED', '2021-08-15 00:40:00.000000', '2021-08-15 18:37:07.200000'),
(21183, 1204, 149, 'JOINED', '2021-08-15 00:40:00.000000', '2021-08-15 18:19:50.400000'),
(21184, 1204, 150, 'JOINED', '2021-08-15 00:40:00.000000', '2021-08-16 07:08:48.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21181, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-28 10:04:28.800000', '2021-08-28 10:04:28.800000', '2021-08-28 10:09:28.800000'),
(DEFAULT, 21182, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-17 19:00:09.600000', '2021-08-17 19:00:09.600000', '2021-08-17 19:05:09.600000'),
(DEFAULT, 21183, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-18 00:57:16.800000', '2021-08-18 00:57:16.800000', '2021-08-18 01:02:16.800000'),
(DEFAULT, 21184, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-21 18:11:12.000000', '2021-08-21 18:11:12.000000', '2021-08-21 18:16:12.000000');

-- 2021-08-20 00:40:00.000000
-- 2021-08-20
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1205, 77, 151, NULL, 'Review Flow with Team', 'This is Review Flow with Team', NULL, 'NORMAL', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2021-08-20', '2021-09-10', '2021-08-26', '2021-08-20 00:40:00.000000', '2021-08-20 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21186, 1205, 147, 'JOINED', '2021-08-20 00:40:00.000000', '2021-08-20 21:58:43.200000'),
(21187, 1205, 148, 'JOINED', '2021-08-20 00:40:00.000000', '2021-08-25 10:16:00.000000'),
(21188, 1205, 149, 'JOINED', '2021-08-20 00:40:00.000000', '2021-08-25 10:16:00.000000'),
(21189, 1205, 150, 'JOINED', '2021-08-20 00:40:00.000000', '2021-08-22 09:41:26.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21186, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-31 03:21:16.800000', '2021-08-31 03:21:16.800000', '2021-08-31 03:26:16.800000'),
(DEFAULT, 21187, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-09-08 03:09:45.600000', '2021-09-08 03:09:45.600000', '2021-09-08 03:14:45.600000'),
(DEFAULT, 21188, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-09-10 21:41:26.400000', '2021-09-10 21:41:26.400000', '2021-09-10 21:46:26.400000'),
(DEFAULT, 21189, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-25 04:47:40.800000', '2021-08-25 04:47:40.800000', '2021-08-25 04:52:40.800000');

-- 2021-08-27 00:40:00.000000
-- 2021-08-27
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1206, 77, 151, NULL, 'Apply Feedback to Flows', 'This is Apply Feedback to Flows', NULL, 'NORMAL', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2021-08-27', '2021-09-01', '2021-09-02', '2021-08-27 00:40:00.000000', '2021-08-27 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21191, 1206, 147, 'JOINED', '2021-08-27 00:40:00.000000', '2021-08-29 18:54:24.000000'),
(21192, 1206, 148, 'JOINED', '2021-08-27 00:40:00.000000', '2021-08-28 02:00:38.400000'),
(21193, 1206, 149, 'JOINED', '2021-08-27 00:40:00.000000', '2021-08-28 08:55:21.600000'),
(21194, 1206, 150, 'JOINED', '2021-08-27 00:40:00.000000', '2021-08-30 05:42:24.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21191, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-09-01 06:40:00.000000', '2021-09-01 06:40:00.000000', '2021-09-01 06:45:00.000000'),
(DEFAULT, 21192, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-31 01:26:04.800000', '2021-08-31 01:26:04.800000', '2021-08-31 01:31:04.800000'),
(DEFAULT, 21193, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-31 03:52:57.600000', '2021-08-31 03:52:57.600000', '2021-08-31 03:57:57.600000'),
(DEFAULT, 21194, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-09-01 23:48:09.600000', '2021-09-01 23:48:09.600000', '2021-09-01 23:53:09.600000');

-- 2021-09-03 00:40:00.000000
-- 2021-09-03
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1207, 77, 151, NULL, 'Validate End-to-End Scenarios', 'This is Validate End-to-End Scenarios', NULL, 'NORMAL', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2021-09-03', '2021-09-22', '2021-09-09', '2021-09-03 00:40:00.000000', '2021-09-03 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21196, 1207, 147, 'JOINED', '2021-09-03 00:40:00.000000', '2021-09-03 06:42:52.800000'),
(21197, 1207, 148, 'JOINED', '2021-09-03 00:40:00.000000', '2021-09-08 10:16:00.000000'),
(21198, 1207, 149, 'JOINED', '2021-09-03 00:40:00.000000', '2021-09-03 07:17:26.400000'),
(21199, 1207, 150, 'JOINED', '2021-09-03 00:40:00.000000', '2021-09-03 16:00:09.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21196, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-09-05 04:56:19.200000', '2021-09-05 04:56:19.200000', '2021-09-05 05:01:19.200000'),
(DEFAULT, 21197, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-09-22 04:01:36.000000', '2021-09-22 04:01:36.000000', '2021-09-22 04:06:36.000000'),
(DEFAULT, 21198, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-09-05 08:32:19.200000', '2021-09-05 08:32:19.200000', '2021-09-05 08:37:19.200000'),
(DEFAULT, 21199, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-09-14 09:19:50.400000', '2021-09-14 09:19:50.400000', '2021-09-14 09:24:50.400000');

-- 2021-09-10 00:40:00.000000
-- 2021-09-10
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1208, 77, 151, NULL, 'Resolve Flow Inconsistencies', 'This is Resolve Flow Inconsistencies', NULL, 'NORMAL', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2021-09-10', '2021-09-29', '2021-09-16', '2021-09-10 00:40:00.000000', '2021-09-10 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21201, 1208, 147, 'JOINED', '2021-09-10 00:40:00.000000', '2021-09-10 11:45:16.800000'),
(21202, 1208, 148, 'JOINED', '2021-09-10 00:40:00.000000', '2021-09-10 00:40:00.000000'),
(21203, 1208, 149, 'JOINED', '2021-09-10 00:40:00.000000', '2021-09-11 08:33:45.600000'),
(21204, 1208, 150, 'JOINED', '2021-09-10 00:40:00.000000', '2021-09-15 10:16:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21201, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-09-12 23:22:14.400000', '2021-09-12 23:22:14.400000', '2021-09-12 23:27:14.400000'),
(DEFAULT, 21202, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-09-11 20:17:55.200000', '2021-09-11 20:17:55.200000', '2021-09-11 20:22:55.200000'),
(DEFAULT, 21203, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-09-20 16:46:14.400000', '2021-09-20 16:46:14.400000', '2021-09-20 16:51:14.400000'),
(DEFAULT, 21204, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-09-29 17:51:02.400000', '2021-09-29 17:51:02.400000', '2021-09-29 17:56:02.400000');

-- 2021-09-17 00:40:00.000000
-- 2021-09-17
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1209, 77, 151, NULL, 'Finalize Process Flows', 'This is Finalize Process Flows', NULL, 'NORMAL', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2021-09-17', '2021-09-28', '2021-09-23', '2021-09-17 00:40:00.000000', '2021-09-17 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21206, 1209, 147, 'JOINED', '2021-09-17 00:40:00.000000', '2021-09-17 09:27:02.400000'),
(21207, 1209, 148, 'JOINED', '2021-09-17 00:40:00.000000', '2021-09-18 04:36:09.600000'),
(21208, 1209, 149, 'JOINED', '2021-09-17 00:40:00.000000', '2021-09-17 09:52:57.600000'),
(21209, 1209, 150, 'JOINED', '2021-09-17 00:40:00.000000', '2021-09-18 11:39:31.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21206, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-09-19 18:19:50.400000', '2021-09-19 18:19:50.400000', '2021-09-19 18:24:50.400000'),
(DEFAULT, 21207, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-09-20 10:18:52.800000', '2021-09-20 10:18:52.800000', '2021-09-20 10:23:52.800000'),
(DEFAULT, 21208, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-09-28 15:27:02.400000', '2021-09-28 15:27:02.400000', '2021-09-28 15:32:02.400000'),
(DEFAULT, 21209, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-09-27 13:40:28.800000', '2021-09-27 13:40:28.800000', '2021-09-27 13:45:28.800000');

-- 2021-09-24 00:40:00.000000
-- 2021-09-24
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1210, 77, 151, NULL, 'Approve Process Definitions', 'This is Approve Process Definitions', NULL, 'NORMAL', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2021-09-24', '2021-10-14', '2021-09-30', '2021-09-24 00:40:00.000000', '2021-09-24 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21211, 1210, 147, 'JOINED', '2021-09-24 00:40:00.000000', '2021-09-26 23:30:52.800000'),
(21212, 1210, 148, 'JOINED', '2021-09-24 00:40:00.000000', '2021-09-24 16:30:24.000000'),
(21213, 1210, 149, 'JOINED', '2021-09-24 00:40:00.000000', '2021-09-29 10:16:00.000000'),
(21214, 1210, 150, 'JOINED', '2021-09-24 00:40:00.000000', '2021-09-24 04:59:12.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21211, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-09-29 15:09:45.600000', '2021-09-29 15:09:45.600000', '2021-09-29 15:14:45.600000'),
(DEFAULT, 21212, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-10-05 08:49:36.000000', '2021-10-05 08:49:36.000000', '2021-10-05 08:54:36.000000'),
(DEFAULT, 21213, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-10-14 07:05:55.200000', '2021-10-14 07:05:55.200000', '2021-10-14 07:10:55.200000'),
(DEFAULT, 21214, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-09-27 11:53:55.200000', '2021-09-27 11:53:55.200000', '2021-09-27 11:58:55.200000');

-- 2021-10-01 00:40:00.000000
-- 2021-10-01
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1211, 77, 151, NULL, 'Sign Off BA Phase', 'This is Sign Off BA Phase', NULL, 'NORMAL', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2021-10-01', '2021-10-16', '2021-10-06', '2021-10-01 00:40:00.000000', '2021-10-01 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21216, 1211, 147, 'JOINED', '2021-10-01 00:40:00.000000', '2021-10-02 05:56:48.000000'),
(21217, 1211, 148, 'JOINED', '2021-10-01 00:40:00.000000', '2021-10-01 13:59:12.000000'),
(21218, 1211, 149, 'JOINED', '2021-10-01 00:40:00.000000', '2021-10-01 16:01:36.000000'),
(21219, 1211, 150, 'JOINED', '2021-10-01 00:40:00.000000', '2021-10-05 12:40:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21216, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-10-03 22:59:12.000000', '2021-10-03 22:59:12.000000', '2021-10-03 23:04:12.000000'),
(DEFAULT, 21217, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-10-02 22:23:12.000000', '2021-10-02 22:23:12.000000', '2021-10-02 22:28:12.000000'),
(DEFAULT, 21218, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-10-03 08:13:36.000000', '2021-10-03 08:13:36.000000', '2021-10-03 08:18:36.000000'),
(DEFAULT, 21219, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-10-16 23:13:36.000000', '2021-10-16 23:13:36.000000', '2021-10-16 23:18:36.000000');

INSERT INTO collection (`id`, `created_time`, `description`, `due_date`, `start_date`, `name`, `updated_time`, `phase_id`, `created_by_id`)
VALUES (78, '2021-10-06 00:40:00.000000', 'This is Cross-Domain Alignment Rules', '2022-02-04', '2021-10-06', 'Cross-Domain Alignment Rules', '2021-10-06 00:40:00.000000', 15, 154);


-- 2021-10-07 00:45:00.000000
-- 2021-10-07
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1212, 78, 151, NULL, 'Align Business Rules with Backend Logic', 'This is Align Business Rules with Backend Logic', NULL, 'NORMAL', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2021-10-07', '2021-10-25', '2021-10-12', '2021-10-07 00:45:00.000000', '2021-10-07 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21221, 1212, 147, 'JOINED', '2021-10-07 00:45:00.000000', '2021-10-07 04:17:24.000000'),
(21222, 1212, 148, 'JOINED', '2021-10-07 00:45:00.000000', '2021-10-07 03:09:00.000000'),
(21223, 1212, 149, 'JOINED', '2021-10-07 00:45:00.000000', '2021-10-08 21:23:24.000000'),
(21224, 1212, 150, 'JOINED', '2021-10-07 00:45:00.000000', '2021-10-11 12:45:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21221, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-10-16 21:12:36.000000', '2021-10-16 21:12:36.000000', '2021-10-16 21:17:36.000000'),
(DEFAULT, 21222, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-10-09 13:35:24.000000', '2021-10-09 13:35:24.000000', '2021-10-09 13:40:24.000000'),
(DEFAULT, 21223, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-10-11 08:54:36.000000', '2021-10-11 08:54:36.000000', '2021-10-11 08:59:36.000000'),
(DEFAULT, 21224, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-10-25 09:52:12.000000', '2021-10-25 09:52:12.000000', '2021-10-25 09:57:12.000000');

-- 2021-10-13 00:45:00.000000
-- 2021-10-13
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1213, 78, 151, NULL, 'Align Business Rules with Frontend UX', 'This is Align Business Rules with Frontend UX', NULL, 'NORMAL', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2021-10-13', '2021-10-29', '2021-10-18', '2021-10-13 00:45:00.000000', '2021-10-13 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21226, 1213, 147, 'JOINED', '2021-10-13 00:45:00.000000', '2021-10-13 12:23:24.000000'),
(21227, 1213, 148, 'JOINED', '2021-10-13 00:45:00.000000', '2021-10-13 17:33:00.000000'),
(21228, 1213, 149, 'JOINED', '2021-10-13 00:45:00.000000', '2021-10-14 13:06:36.000000'),
(21229, 1213, 150, 'JOINED', '2021-10-13 00:45:00.000000', '2021-10-17 12:45:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21226, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-10-15 08:11:24.000000', '2021-10-15 08:11:24.000000', '2021-10-15 08:16:24.000000'),
(DEFAULT, 21227, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-10-15 16:28:12.000000', '2021-10-15 16:28:12.000000', '2021-10-15 16:33:12.000000'),
(DEFAULT, 21228, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-10-15 14:11:24.000000', '2021-10-15 14:11:24.000000', '2021-10-15 14:16:24.000000'),
(DEFAULT, 21229, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-10-29 20:54:36.000000', '2021-10-29 20:54:36.000000', '2021-10-29 20:59:36.000000');

-- 2021-10-19 00:45:00.000000
-- 2021-10-19
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1214, 78, 151, NULL, 'Validate API Contract Against Business Rules', 'This is Validate API Contract Against Business Rules', NULL, 'NORMAL', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2021-10-19', '2021-10-22', '2021-10-23', '2021-10-19 00:45:00.000000', '2021-10-19 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21231, 1214, 147, 'JOINED', '2021-10-19 00:45:00.000000', '2021-10-19 19:39:43.200000'),
(21232, 1214, 148, 'JOINED', '2021-10-19 00:45:00.000000', '2021-10-20 11:24:21.600000'),
(21233, 1214, 149, 'JOINED', '2021-10-19 00:45:00.000000', '2021-10-19 09:46:26.400000'),
(21234, 1214, 150, 'JOINED', '2021-10-19 00:45:00.000000', '2021-10-19 00:50:45.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21231, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-10-21 09:40:40.800000', '2021-10-21 09:40:40.800000', '2021-10-21 09:45:40.800000'),
(DEFAULT, 21232, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-10-22 00:10:26.400000', '2021-10-22 00:10:26.400000', '2021-10-22 00:15:26.400000'),
(DEFAULT, 21233, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-10-20 17:09:57.600000', '2021-10-20 17:09:57.600000', '2021-10-20 17:14:57.600000'),
(DEFAULT, 21234, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-10-21 01:08:02.400000', '2021-10-21 01:08:02.400000', '2021-10-21 01:13:02.400000');

-- 2021-10-24 00:45:00.000000
-- 2021-10-24
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1215, 78, 151, NULL, 'Review Data Flow Across Domains', 'This is Review Data Flow Across Domains', NULL, 'NORMAL', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2021-10-24', '2021-11-08', '2021-10-28', '2021-10-24 00:45:00.000000', '2021-10-24 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21236, 1215, 147, 'JOINED', '2021-10-24 00:45:00.000000', '2021-10-25 00:16:12.000000'),
(21237, 1215, 148, 'JOINED', '2021-10-24 00:45:00.000000', '2021-10-24 04:41:09.600000'),
(21238, 1215, 149, 'JOINED', '2021-10-24 00:45:00.000000', '2021-10-24 02:22:55.200000'),
(21239, 1215, 150, 'JOINED', '2021-10-24 00:45:00.000000', '2021-10-27 15:09:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21236, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-10-26 15:14:45.600000', '2021-10-26 15:14:45.600000', '2021-10-26 15:19:45.600000'),
(DEFAULT, 21237, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-10-24 20:31:33.600000', '2021-10-24 20:31:33.600000', '2021-10-24 20:36:33.600000'),
(DEFAULT, 21238, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-10-25 04:12:21.600000', '2021-10-25 04:12:21.600000', '2021-10-25 04:17:21.600000'),
(DEFAULT, 21239, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-11-08 07:28:12.000000', '2021-11-08 07:28:12.000000', '2021-11-08 07:33:12.000000');

-- 2021-10-29 00:45:00.000000
-- 2021-10-29
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1216, 78, 151, NULL, 'Identify Cross-Domain Rule Conflicts', 'This is Identify Cross-Domain Rule Conflicts', NULL, 'NORMAL', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2021-10-29', '2021-11-07', '2021-11-01', '2021-10-29 00:45:00.000000', '2021-10-29 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21241, 1216, 147, 'JOINED', '2021-10-29 00:45:00.000000', '2021-10-30 11:40:12.000000'),
(21242, 1216, 148, 'JOINED', '2021-10-29 00:45:00.000000', '2021-10-29 02:02:45.600000'),
(21243, 1216, 149, 'JOINED', '2021-10-29 00:45:00.000000', '2021-10-29 05:34:26.400000'),
(21244, 1216, 150, 'JOINED', '2021-10-29 00:45:00.000000', '2021-10-31 17:33:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21241, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-10-31 16:06:36.000000', '2021-10-31 16:06:36.000000', '2021-10-31 16:11:36.000000'),
(DEFAULT, 21242, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-10-29 20:45:57.600000', '2021-10-29 20:45:57.600000', '2021-10-29 20:50:57.600000'),
(DEFAULT, 21243, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-10-29 17:27:14.400000', '2021-10-29 17:27:14.400000', '2021-10-29 17:32:14.400000'),
(DEFAULT, 21244, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-11-07 12:42:07.200000', '2021-11-07 12:42:07.200000', '2021-11-07 12:47:07.200000');

-- 2021-11-02 00:45:00.000000
-- 2021-11-02
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1217, 78, 151, NULL, 'Resolve Backend–Frontend Rule Mismatches', 'This is Resolve Backend–Frontend Rule Mismatches', NULL, 'NORMAL', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2021-11-02', '2021-11-07', '2021-11-05', '2021-11-02 00:45:00.000000', '2021-11-02 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21246, 1217, 147, 'JOINED', '2021-11-02 00:45:00.000000', '2021-11-02 15:26:16.800000'),
(21247, 1217, 148, 'JOINED', '2021-11-02 00:45:00.000000', '2021-11-02 16:31:04.800000'),
(21248, 1217, 149, 'JOINED', '2021-11-02 00:45:00.000000', '2021-11-02 06:56:31.200000'),
(21249, 1217, 150, 'JOINED', '2021-11-02 00:45:00.000000', '2021-11-02 05:58:12.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21246, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-11-03 13:45:28.800000', '2021-11-03 13:45:28.800000', '2021-11-03 13:50:28.800000'),
(DEFAULT, 21247, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-11-03 21:40:40.800000', '2021-11-03 21:40:40.800000', '2021-11-03 21:45:40.800000'),
(DEFAULT, 21248, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-11-03 04:58:26.400000', '2021-11-03 04:58:26.400000', '2021-11-03 05:03:26.400000'),
(DEFAULT, 21249, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-11-07 19:31:48.000000', '2021-11-07 19:31:48.000000', '2021-11-07 19:36:48.000000');

-- 2021-11-06 00:45:00.000000
-- 2021-11-06
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1218, 78, 151, NULL, 'Validate End-to-End Business Scenarios', 'This is Validate End-to-End Business Scenarios', NULL, 'NORMAL', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2021-11-06', '2021-11-08', '2021-11-09', '2021-11-06 00:45:00.000000', '2021-11-06 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21251, 1218, 147, 'JOINED', '2021-11-06 00:45:00.000000', '2021-11-07 09:34:55.200000'),
(21252, 1218, 148, 'JOINED', '2021-11-06 00:45:00.000000', '2021-11-07 06:07:33.600000'),
(21253, 1218, 149, 'JOINED', '2021-11-06 00:45:00.000000', '2021-11-06 05:30:07.200000'),
(21254, 1218, 150, 'JOINED', '2021-11-06 00:45:00.000000', '2021-11-06 16:26:45.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21251, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-11-08 09:42:07.200000', '2021-11-08 09:42:07.200000', '2021-11-08 09:47:07.200000'),
(DEFAULT, 21252, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-11-07 21:57:57.600000', '2021-11-07 21:57:57.600000', '2021-11-07 22:02:57.600000'),
(DEFAULT, 21253, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-11-07 00:26:16.800000', '2021-11-07 00:26:16.800000', '2021-11-07 00:31:16.800000'),
(DEFAULT, 21254, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-11-08 12:47:52.800000', '2021-11-08 12:47:52.800000', '2021-11-08 12:52:52.800000');

-- 2021-11-10 00:45:00.000000
-- 2021-11-10
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1219, 78, 151, NULL, 'Align Error Handling Between Domains', 'This is Align Error Handling Between Domains', NULL, 'NORMAL', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2021-11-10', '2021-11-20', '2021-11-13', '2021-11-10 00:45:00.000000', '2021-11-10 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21256, 1219, 147, 'JOINED', '2021-11-10 00:45:00.000000', '2021-11-12 05:31:33.600000'),
(21257, 1219, 148, 'JOINED', '2021-11-10 00:45:00.000000', '2021-11-10 15:17:38.400000'),
(21258, 1219, 149, 'JOINED', '2021-11-10 00:45:00.000000', '2021-11-10 16:31:04.800000'),
(21259, 1219, 150, 'JOINED', '2021-11-10 00:45:00.000000', '2021-11-12 17:33:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21256, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-11-12 17:50:16.800000', '2021-11-12 17:50:16.800000', '2021-11-12 17:55:16.800000'),
(DEFAULT, 21257, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-11-11 10:39:43.200000', '2021-11-11 10:39:43.200000', '2021-11-11 10:44:43.200000'),
(DEFAULT, 21258, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-11-11 07:08:02.400000', '2021-11-11 07:08:02.400000', '2021-11-11 07:13:02.400000'),
(DEFAULT, 21259, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-11-20 17:04:12.000000', '2021-11-20 17:04:12.000000', '2021-11-20 17:09:12.000000');

-- 2021-11-14 00:45:00.000000
-- 2021-11-14
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1220, 78, 151, NULL, 'Validate Permission Rules Across Services', 'This is Validate Permission Rules Across Services', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2021-11-14', '2021-12-10', '2021-11-21', '2021-11-14 00:45:00.000000', '2021-11-14 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21261, 1220, 147, 'JOINED', '2021-11-14 00:45:00.000000', '2021-11-20 07:57:00.000000'),
(21262, 1220, 149, 'JOINED', '2021-11-14 00:45:00.000000', '2021-11-14 06:47:52.800000'),
(21263, 1220, 150, 'JOINED', '2021-11-14 00:45:00.000000', '2021-11-20 07:57:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21261, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-12-10 21:52:12.000000', '2021-12-10 21:52:12.000000', '2021-12-10 21:57:12.000000'),
(DEFAULT, 21262, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-11-18 04:52:40.800000', '2021-11-18 04:52:40.800000', '2021-11-18 04:57:40.800000'),
(DEFAULT, 21263, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-12-05 05:37:19.200000', '2021-12-05 05:37:19.200000', '2021-12-05 05:42:19.200000');

-- 2021-11-22 00:45:00.000000
-- 2021-11-22
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1221, 78, 151, NULL, 'Review Authentication & Authorization Flows', 'This is Review Authentication & Authorization Flows', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2021-11-22', '2021-12-18', '2021-11-29', '2021-11-22 00:45:00.000000', '2021-11-22 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21265, 1221, 147, 'JOINED', '2021-11-22 00:45:00.000000', '2021-11-23 06:29:09.600000'),
(21266, 1221, 149, 'JOINED', '2021-11-22 00:45:00.000000', '2021-11-28 07:57:00.000000'),
(21267, 1221, 150, 'JOINED', '2021-11-22 00:45:00.000000', '2021-11-28 07:57:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21265, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-12-04 19:00:50.400000', '2021-12-04 19:00:50.400000', '2021-12-04 19:05:50.400000'),
(DEFAULT, 21266, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-12-16 21:39:14.400000', '2021-12-16 21:39:14.400000', '2021-12-16 21:44:14.400000'),
(DEFAULT, 21267, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-12-18 09:56:31.200000', '2021-12-18 09:56:31.200000', '2021-12-18 10:01:31.200000');

-- 2021-11-30 00:45:00.000000
-- 2021-11-30
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1222, 78, 151, NULL, 'Align Validation Rules Across Layers', 'This is Align Validation Rules Across Layers', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2021-11-30', '2021-12-03', '2021-12-06', '2021-11-30 00:45:00.000000', '2021-11-30 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21269, 1222, 148, 'JOINED', '2021-11-30 00:45:00.000000', '2021-11-30 15:52:12.000000'),
(21270, 1222, 149, 'JOINED', '2021-11-30 00:45:00.000000', '2021-11-30 05:47:24.000000'),
(21271, 1222, 150, 'JOINED', '2021-11-30 00:45:00.000000', '2021-11-30 04:03:43.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21269, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-12-03 06:39:14.400000', '2021-12-03 06:39:14.400000', '2021-12-03 06:44:14.400000'),
(DEFAULT, 21270, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-12-03 07:57:00.000000', '2021-12-03 07:57:00.000000', '2021-12-03 08:02:00.000000'),
(DEFAULT, 21271, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-12-03 09:49:19.200000', '2021-12-03 09:49:19.200000', '2021-12-03 09:54:19.200000');

-- 2021-12-07 00:45:00.000000
-- 2021-12-07
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1223, 78, 151, NULL, 'Validate Business Logic Execution Order', 'This is Validate Business Logic Execution Order', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2021-12-07', '2021-12-25', '2021-12-13', '2021-12-07 00:45:00.000000', '2021-12-07 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21273, 1223, 148, 'JOINED', '2021-12-07 00:45:00.000000', '2021-12-07 21:46:26.400000'),
(21274, 1223, 149, 'JOINED', '2021-12-07 00:45:00.000000', '2021-12-07 06:30:36.000000'),
(21275, 1223, 150, 'JOINED', '2021-12-07 00:45:00.000000', '2021-12-12 10:21:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21273, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-12-09 22:00:50.400000', '2021-12-09 22:00:50.400000', '2021-12-09 22:05:50.400000'),
(DEFAULT, 21274, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-12-09 08:20:02.400000', '2021-12-09 08:20:02.400000', '2021-12-09 08:25:02.400000'),
(DEFAULT, 21275, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-12-25 03:11:52.800000', '2021-12-25 03:11:52.800000', '2021-12-25 03:16:52.800000');

-- 2021-12-14 00:45:00.000000
-- 2021-12-14
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1224, 78, 151, NULL, 'Analyze Impact of Async Processing on Business Rules', 'This is Analyze Impact of Async Processing on Business Rules', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2021-12-14', '2021-12-24', '2021-12-20', '2021-12-14 00:45:00.000000', '2021-12-14 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21277, 1224, 148, 'JOINED', '2021-12-14 00:45:00.000000', '2021-12-14 17:44:31.200000'),
(21278, 1224, 149, 'JOINED', '2021-12-14 00:45:00.000000', '2021-12-16 00:07:33.600000'),
(21279, 1224, 150, 'JOINED', '2021-12-14 00:45:00.000000', '2021-12-15 20:05:38.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21277, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-12-16 19:33:57.600000', '2021-12-16 19:33:57.600000', '2021-12-16 19:38:57.600000'),
(DEFAULT, 21278, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-12-24 01:22:26.400000', '2021-12-24 01:22:26.400000', '2021-12-24 01:27:26.400000'),
(DEFAULT, 21279, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-12-19 10:12:21.600000', '2021-12-19 10:12:21.600000', '2021-12-19 10:17:21.600000');

-- 2021-12-21 00:45:00.000000
-- 2021-12-21
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1225, 78, 151, NULL, 'Review Transaction Boundaries', 'This is Review Transaction Boundaries', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2021-12-21', '2022-01-12', '2021-12-27', '2021-12-21 00:45:00.000000', '2021-12-21 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21281, 1225, 148, 'JOINED', '2021-12-21 00:45:00.000000', '2021-12-22 23:58:55.200000'),
(21282, 1225, 149, 'JOINED', '2021-12-21 00:45:00.000000', '2021-12-22 16:03:43.200000'),
(21283, 1225, 150, 'JOINED', '2021-12-21 00:45:00.000000', '2021-12-26 10:21:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21281, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-12-31 01:31:04.800000', '2021-12-31 01:31:04.800000', '2021-12-31 01:36:04.800000'),
(DEFAULT, 21282, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-12-24 16:09:28.800000', '2021-12-24 16:09:28.800000', '2021-12-24 16:14:28.800000'),
(DEFAULT, 21283, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-01-12 14:28:40.800000', '2022-01-12 14:28:40.800000', '2022-01-12 14:33:40.800000');

-- 2021-12-28 00:45:00.000000
-- 2021-12-28
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1226, 78, 151, NULL, 'Validate Data Consistency Across Services', 'This is Validate Data Consistency Across Services', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2021-12-28', '2022-01-12', '2022-01-02', '2021-12-28 00:45:00.000000', '2021-12-28 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21285, 1226, 147, 'JOINED', '2021-12-28 00:45:00.000000', '2021-12-30 02:33:00.000000'),
(21286, 1226, 149, 'JOINED', '2021-12-28 00:45:00.000000', '2022-01-01 12:45:00.000000'),
(21287, 1226, 150, 'JOINED', '2021-12-28 00:45:00.000000', '2021-12-28 08:18:36.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21285, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-12-31 12:16:12.000000', '2021-12-31 12:16:12.000000', '2021-12-31 12:21:12.000000'),
(DEFAULT, 21286, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-01-12 01:06:36.000000', '2022-01-12 01:06:36.000000', '2022-01-12 01:11:36.000000'),
(DEFAULT, 21287, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-12-31 17:18:36.000000', '2021-12-31 17:18:36.000000', '2021-12-31 17:23:36.000000');

-- 2022-01-03 00:45:00.000000
-- 2022-01-03
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1227, 78, 151, NULL, 'Align Logging & Audit Requirements', 'This is Align Logging & Audit Requirements', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2022-01-03', '2022-01-17', '2022-01-08', '2022-01-03 00:45:00.000000', '2022-01-03 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21289, 1227, 147, 'JOINED', '2022-01-03 00:45:00.000000', '2022-01-04 03:16:12.000000'),
(21290, 1227, 149, 'JOINED', '2022-01-03 00:45:00.000000', '2022-01-04 00:16:12.000000'),
(21291, 1227, 150, 'JOINED', '2022-01-03 00:45:00.000000', '2022-01-07 12:45:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21289, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-01-05 16:28:12.000000', '2022-01-05 16:28:12.000000', '2022-01-05 16:33:12.000000'),
(DEFAULT, 21290, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-01-06 11:04:12.000000', '2022-01-06 11:04:12.000000', '2022-01-06 11:09:12.000000'),
(DEFAULT, 21291, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-01-17 20:25:48.000000', '2022-01-17 20:25:48.000000', '2022-01-17 20:30:48.000000');

-- 2022-01-09 00:45:00.000000
-- 2022-01-09
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1228, 78, 151, NULL, 'Validate Reporting Data Sources', 'This is Validate Reporting Data Sources', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2022-01-09', '2022-01-13', '2022-01-14', '2022-01-09 00:45:00.000000', '2022-01-09 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21293, 1228, 147, 'JOINED', '2022-01-09 00:45:00.000000', '2022-01-10 04:13:48.000000'),
(21294, 1228, 149, 'JOINED', '2022-01-09 00:45:00.000000', '2022-01-10 09:45:00.000000'),
(21295, 1228, 150, 'JOINED', '2022-01-09 00:45:00.000000', '2022-01-09 09:37:48.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21293, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-01-12 07:35:24.000000', '2022-01-12 07:35:24.000000', '2022-01-12 07:40:24.000000'),
(DEFAULT, 21294, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-01-11 12:01:48.000000', '2022-01-11 12:01:48.000000', '2022-01-11 12:06:48.000000'),
(DEFAULT, 21295, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-01-13 02:18:36.000000', '2022-01-13 02:18:36.000000', '2022-01-13 02:23:36.000000');

-- 2022-01-15 00:45:00.000000
-- 2022-01-15
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1229, 78, 151, NULL, 'Confirm Business KPI Traceability', 'This is Confirm Business KPI Traceability', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2022-01-15', '2022-01-30', '2022-01-20', '2022-01-15 00:45:00.000000', '2022-01-15 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21297, 1229, 147, 'JOINED', '2022-01-15 00:45:00.000000', '2022-01-16 22:42:36.000000'),
(21298, 1229, 149, 'JOINED', '2022-01-15 00:45:00.000000', '2022-01-19 12:45:00.000000'),
(21299, 1229, 150, 'JOINED', '2022-01-15 00:45:00.000000', '2022-01-15 02:04:12.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21297, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-01-19 03:16:12.000000', '2022-01-19 03:16:12.000000', '2022-01-19 03:21:12.000000'),
(DEFAULT, 21298, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-01-30 14:25:48.000000', '2022-01-30 14:25:48.000000', '2022-01-30 14:30:48.000000'),
(DEFAULT, 21299, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-01-17 15:52:12.000000', '2022-01-17 15:52:12.000000', '2022-01-17 15:57:12.000000');

-- 2022-01-21 00:45:00.000000
-- 2022-01-21
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1230, 78, 151, NULL, 'Finalize Cross-Domain Alignment', 'This is Finalize Cross-Domain Alignment', NULL, 'ADVANCED', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2022-01-21', '2022-01-28', '2022-01-25', '2022-01-21 00:45:00.000000', '2022-01-21 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21301, 1230, 147, 'JOINED', '2022-01-21 00:45:00.000000', '2022-01-21 15:37:48.000000'),
(21302, 1230, 148, 'JOINED', '2022-01-21 00:45:00.000000', '2022-01-21 16:52:40.800000'),
(21303, 1230, 150, 'JOINED', '2022-01-21 00:45:00.000000', '2022-01-21 13:02:16.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21301, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-01-22 11:18:36.000000', '2022-01-22 11:18:36.000000', '2022-01-22 11:23:36.000000'),
(DEFAULT, 21302, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-01-22 13:59:52.800000', '2022-01-22 13:59:52.800000', '2022-01-22 14:04:52.800000'),
(DEFAULT, 21303, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-01-28 12:27:43.200000', '2022-01-28 12:27:43.200000', '2022-01-28 12:32:43.200000');

-- 2022-01-26 00:45:00.000000
-- 2022-01-26
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1231, 78, 151, NULL, 'Sign Off Cross-Domain Business Rules', 'This is Sign Off Cross-Domain Business Rules', NULL, 'NORMAL', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2022-01-26', '2022-02-04', '2022-01-31', '2022-01-26 00:45:00.000000', '2022-01-26 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21305, 1231, 147, 'JOINED', '2022-01-26 00:45:00.000000', '2022-01-26 10:13:48.000000'),
(21306, 1231, 148, 'JOINED', '2022-01-26 00:45:00.000000', '2022-01-26 17:25:48.000000'),
(21307, 1231, 150, 'JOINED', '2022-01-26 00:45:00.000000', '2022-01-26 23:18:36.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21305, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-01-28 15:59:24.000000', '2022-01-28 15:59:24.000000', '2022-01-28 16:04:24.000000'),
(DEFAULT, 21306, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-01-28 03:30:36.000000', '2022-01-28 03:30:36.000000', '2022-01-28 03:35:36.000000'),
(DEFAULT, 21307, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-02-04 02:11:24.000000', '2022-02-04 02:11:24.000000', '2022-02-04 02:16:24.000000');

INSERT INTO collection (`id`, `created_time`, `description`, `due_date`, `start_date`, `name`, `updated_time`, `phase_id`, `created_by_id`)
VALUES (79, '2022-01-31 00:45:00.000000', 'This is Exception & Edge Case Rules', '2022-08-08', '2022-01-31', 'Exception & Edge Case Rules', '2022-01-31 00:45:00.000000', 15, 154);


-- 2022-02-01 00:50:00.000000
-- 2022-02-01
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1232, 79, 151, NULL, 'Identify CV Incomplete Submission Rules', 'This is Identify CV Incomplete Submission Rules', NULL, 'NORMAL', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2022-02-01', '2022-02-15', '2022-02-05', '2022-02-01 00:50:00.000000', '2022-02-01 00:50:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21309, 1232, 147, 'JOINED', '2022-02-01 00:50:00.000000', '2022-02-03 05:14:57.600000'),
(21310, 1232, 148, 'JOINED', '2022-02-01 00:50:00.000000', '2022-02-02 23:46:38.400000'),
(21311, 1232, 150, 'JOINED', '2022-02-01 00:50:00.000000', '2022-02-04 15:14:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21309, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-02-04 09:28:24.000000', '2022-02-04 09:28:24.000000', '2022-02-04 09:33:24.000000'),
(DEFAULT, 21310, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-02-04 00:55:45.600000', '2022-02-04 00:55:45.600000', '2022-02-04 01:00:45.600000'),
(DEFAULT, 21311, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-02-15 17:43:45.600000', '2022-02-15 17:43:45.600000', '2022-02-15 17:48:45.600000');

-- 2022-02-06 00:50:00.000000
-- 2022-02-06
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1233, 79, 151, NULL, 'Define Missing Field Handling Rules', 'This is Define Missing Field Handling Rules', NULL, 'NORMAL', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2022-02-06', '2022-02-08', '2022-02-09', '2022-02-06 00:50:00.000000', '2022-02-06 00:50:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21313, 1233, 147, 'JOINED', '2022-02-06 00:50:00.000000', '2022-02-06 11:25:02.400000'),
(21314, 1233, 149, 'JOINED', '2022-02-06 00:50:00.000000', '2022-02-07 09:52:52.800000'),
(21315, 1233, 150, 'JOINED', '2022-02-06 00:50:00.000000', '2022-02-06 05:48:04.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21313, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-02-07 13:11:36.000000', '2022-02-07 13:11:36.000000', '2022-02-07 13:16:36.000000'),
(DEFAULT, 21314, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-02-08 17:33:40.800000', '2022-02-08 17:33:40.800000', '2022-02-08 17:38:40.800000'),
(DEFAULT, 21315, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-02-08 06:28:24.000000', '2022-02-08 06:28:24.000000', '2022-02-08 06:33:24.000000');

-- 2022-02-10 00:50:00.000000
-- 2022-02-10
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1234, 79, 151, NULL, 'Analyze Invalid CV Format Scenarios', 'This is Analyze Invalid CV Format Scenarios', NULL, 'NORMAL', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2022-02-10', '2022-02-15', '2022-02-13', '2022-02-10 00:50:00.000000', '2022-02-10 00:50:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21317, 1234, 147, 'JOINED', '2022-02-10 00:50:00.000000', '2022-02-11 14:50:57.600000'),
(21318, 1234, 149, 'JOINED', '2022-02-10 00:50:00.000000', '2022-02-10 12:08:14.400000'),
(21319, 1234, 150, 'JOINED', '2022-02-10 00:50:00.000000', '2022-02-10 05:45:55.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21317, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-02-12 02:13:31.200000', '2022-02-12 02:13:31.200000', '2022-02-12 02:18:31.200000'),
(DEFAULT, 21318, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-02-11 23:16:24.000000', '2022-02-11 23:16:24.000000', '2022-02-11 23:21:24.000000'),
(DEFAULT, 21319, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-02-15 19:54:04.800000', '2022-02-15 19:54:04.800000', '2022-02-15 19:59:04.800000');

-- 2022-02-14 00:50:00.000000
-- 2022-02-14
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1235, 79, 151, NULL, 'Define Duplicate CV Detection Rules', 'This is Define Duplicate CV Detection Rules', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2022-02-14', '2022-03-16', '2022-02-22', '2022-02-14 00:50:00.000000', '2022-02-14 00:50:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21321, 1235, 146, 'JOINED', '2022-02-14 00:50:00.000000', '2022-02-14 05:26:28.800000'),
(21322, 1235, 150, 'JOINED', '2022-02-14 00:50:00.000000', '2022-02-21 05:38:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21321, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-03-01 20:13:31.200000', '2022-03-01 20:13:31.200000', '2022-03-01 20:18:31.200000'),
(DEFAULT, 21322, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-03-16 21:11:07.200000', '2022-03-16 21:11:07.200000', '2022-03-16 21:16:07.200000');

-- 2022-02-23 00:50:00.000000
-- 2022-02-23
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1236, 79, 151, NULL, 'Analyze Concurrent Edit Scenarios', 'This is Analyze Concurrent Edit Scenarios', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2022-02-23', '2022-03-01', '2022-03-03', '2022-02-23 00:50:00.000000', '2022-02-23 00:50:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21324, 1236, 146, 'JOINED', '2022-02-23 00:50:00.000000', '2022-02-23 15:14:00.000000'),
(21325, 1236, 147, 'JOINED', '2022-02-23 00:50:00.000000', '2022-02-27 06:24:04.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21324, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-02-28 10:37:31.200000', '2022-02-28 10:37:31.200000', '2022-02-28 10:42:31.200000'),
(DEFAULT, 21325, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-03-01 13:07:16.800000', '2022-03-01 13:07:16.800000', '2022-03-01 13:12:16.800000');

-- 2022-03-04 00:50:00.000000
-- 2022-03-04
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1237, 79, 151, NULL, 'Define Conflict Resolution Rules', 'This is Define Conflict Resolution Rules', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2022-03-04', '2022-04-02', '2022-03-12', '2022-03-04 00:50:00.000000', '2022-03-04 00:50:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21327, 1237, 146, 'JOINED', '2022-03-04 00:50:00.000000', '2022-03-11 05:38:00.000000'),
(21328, 1237, 147, 'JOINED', '2022-03-04 00:50:00.000000', '2022-03-04 03:19:45.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21327, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-04-02 21:11:07.200000', '2022-04-02 21:11:07.200000', '2022-04-02 21:16:07.200000'),
(DEFAULT, 21328, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-03-06 19:27:26.400000', '2022-03-06 19:27:26.400000', '2022-03-06 19:32:26.400000');

-- 2022-03-13 00:50:00.000000
-- 2022-03-13
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1238, 79, 151, NULL, 'Identify API Failure Business Impact', 'This is Identify API Failure Business Impact', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2022-03-13', '2022-03-28', '2022-03-21', '2022-03-13 00:50:00.000000', '2022-03-13 00:50:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21330, 1238, 146, 'JOINED', '2022-03-13 00:50:00.000000', '2022-03-13 08:25:02.400000'),
(21331, 1238, 147, 'JOINED', '2022-03-13 00:50:00.000000', '2022-03-16 18:18:19.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21330, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-03-28 17:14:57.600000', '2022-03-28 17:14:57.600000', '2022-03-28 17:19:57.600000'),
(DEFAULT, 21331, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-03-18 11:46:38.400000', '2022-03-18 11:46:38.400000', '2022-03-18 11:51:38.400000');

-- 2022-03-22 00:50:00.000000
-- 2022-03-22
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1239, 79, 151, NULL, 'Define Timeout Handling Rules', 'This is Define Timeout Handling Rules', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2022-03-22', '2022-03-28', '2022-03-30', '2022-03-22 00:50:00.000000', '2022-03-22 00:50:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21333, 1239, 146, 'JOINED', '2022-03-22 00:50:00.000000', '2022-03-23 23:52:24.000000'),
(21334, 1239, 147, 'JOINED', '2022-03-22 00:50:00.000000', '2022-03-22 14:39:26.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21333, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-03-28 18:29:50.400000', '2022-03-28 18:29:50.400000', '2022-03-28 18:34:50.400000'),
(DEFAULT, 21334, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-03-23 19:50:28.800000', '2022-03-23 19:50:28.800000', '2022-03-23 19:55:28.800000');

-- 2022-03-31 00:50:00.000000
-- 2022-03-31
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1240, 79, 151, NULL, 'Analyze Partial Save Scenarios', 'This is Analyze Partial Save Scenarios', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2022-03-31', '2022-04-14', '2022-04-08', '2022-03-31 00:50:00.000000', '2022-03-31 00:50:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21336, 1240, 146, 'JOINED', '2022-03-31 00:50:00.000000', '2022-04-01 06:58:38.400000'),
(21337, 1240, 147, 'JOINED', '2022-03-31 00:50:00.000000', '2022-03-31 05:49:31.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21336, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-04-14 18:41:21.600000', '2022-04-14 18:41:21.600000', '2022-04-14 18:46:21.600000'),
(DEFAULT, 21337, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-04-03 10:02:57.600000', '2022-04-03 10:02:57.600000', '2022-04-03 10:07:57.600000');

-- 2022-04-09 00:50:00.000000
-- 2022-04-09
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1241, 79, 151, NULL, 'Define Rollback Business Rules', 'This is Define Rollback Business Rules', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2022-04-09', '2022-04-15', '2022-04-17', '2022-04-09 00:50:00.000000', '2022-04-09 00:50:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21339, 1241, 146, 'JOINED', '2022-04-09 00:50:00.000000', '2022-04-09 07:44:43.200000'),
(21340, 1241, 147, 'JOINED', '2022-04-09 00:50:00.000000', '2022-04-12 05:38:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21339, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-04-15 09:05:21.600000', '2022-04-15 09:05:21.600000', '2022-04-15 09:10:21.600000'),
(DEFAULT, 21340, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-04-14 00:26:57.600000', '2022-04-14 00:26:57.600000', '2022-04-14 00:31:57.600000');

-- 2022-04-18 00:50:00.000000
-- 2022-04-18
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1242, 79, 151, NULL, 'Identify Unauthorized Access Scenarios', 'This is Identify Unauthorized Access Scenarios', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2022-04-18', '2022-05-03', '2022-04-26', '2022-04-18 00:50:00.000000', '2022-04-18 00:50:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21342, 1242, 146, 'JOINED', '2022-04-18 00:50:00.000000', '2022-04-18 23:58:09.600000'),
(21343, 1242, 147, 'JOINED', '2022-04-18 00:50:00.000000', '2022-04-19 19:50:28.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21342, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-05-03 01:41:50.400000', '2022-05-03 01:41:50.400000', '2022-05-03 01:46:50.400000'),
(DEFAULT, 21343, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-04-22 11:12:04.800000', '2022-04-22 11:12:04.800000', '2022-04-22 11:17:04.800000');

-- 2022-04-27 00:50:00.000000
-- 2022-04-27
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1243, 79, 151, NULL, 'Define Security Violation Handling', 'This is Define Security Violation Handling', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2022-04-27', '2022-05-02', '2022-05-05', '2022-04-27 00:50:00.000000', '2022-04-27 00:50:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21345, 1243, 146, 'JOINED', '2022-04-27 00:50:00.000000', '2022-04-27 11:12:04.800000'),
(21346, 1243, 147, 'JOINED', '2022-04-27 00:50:00.000000', '2022-04-27 06:01:02.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21345, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-05-02 01:59:07.200000', '2022-05-02 01:59:07.200000', '2022-05-02 02:04:07.200000'),
(DEFAULT, 21346, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-04-28 19:04:24.000000', '2022-04-28 19:04:24.000000', '2022-04-28 19:09:24.000000');

-- 2022-05-06 00:50:00.000000
-- 2022-05-06
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1244, 79, 151, NULL, 'Analyze Data Corruption Impact', 'This is Analyze Data Corruption Impact', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2022-05-06', '2022-06-01', '2022-05-14', '2022-05-06 00:50:00.000000', '2022-05-06 00:50:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21348, 1244, 146, 'JOINED', '2022-05-06 00:50:00.000000', '2022-05-13 05:38:00.000000'),
(21349, 1244, 147, 'JOINED', '2022-05-06 00:50:00.000000', '2022-05-07 00:21:12.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21348, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-06-01 17:20:43.200000', '2022-06-01 17:20:43.200000', '2022-06-01 17:25:43.200000'),
(DEFAULT, 21349, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-05-21 01:18:48.000000', '2022-05-21 01:18:48.000000', '2022-05-21 01:23:48.000000');

-- 2022-05-15 00:50:00.000000
-- 2022-05-15
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1245, 79, 151, NULL, 'Define Recovery Business Rules', 'This is Define Recovery Business Rules', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2022-05-15', '2022-05-29', '2022-05-23', '2022-05-15 00:50:00.000000', '2022-05-15 00:50:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21351, 1245, 146, 'JOINED', '2022-05-15 00:50:00.000000', '2022-05-16 02:16:24.000000'),
(21352, 1245, 147, 'JOINED', '2022-05-15 00:50:00.000000', '2022-05-21 04:05:50.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21351, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-05-29 23:23:36.000000', '2022-05-29 23:23:36.000000', '2022-05-29 23:28:36.000000'),
(DEFAULT, 21352, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-05-22 20:59:36.000000', '2022-05-22 20:59:36.000000', '2022-05-22 21:04:36.000000');

-- 2022-05-24 00:50:00.000000
-- 2022-05-24
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1246, 79, 151, NULL, 'Identify System Degradation Scenarios', 'This is Identify System Degradation Scenarios', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2022-05-24', '2022-06-18', '2022-06-01', '2022-05-24 00:50:00.000000', '2022-05-24 00:50:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21354, 1246, 146, 'JOINED', '2022-05-24 00:50:00.000000', '2022-05-31 05:38:00.000000'),
(21355, 1246, 147, 'JOINED', '2022-05-24 00:50:00.000000', '2022-05-28 07:56:14.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21354, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-06-18 13:53:21.600000', '2022-06-18 13:53:21.600000', '2022-06-18 13:58:21.600000'),
(DEFAULT, 21355, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-05-30 01:36:04.800000', '2022-05-30 01:36:04.800000', '2022-05-30 01:41:04.800000');

-- 2022-06-02 00:50:00.000000
-- 2022-06-02
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1247, 79, 151, NULL, 'Define Graceful Degradation Rules', 'This is Define Graceful Degradation Rules', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2022-06-02', '2022-07-03', '2022-06-10', '2022-06-02 00:50:00.000000', '2022-06-02 00:50:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21357, 1247, 146, 'JOINED', '2022-06-02 00:50:00.000000', '2022-06-09 05:38:00.000000'),
(21358, 1247, 147, 'JOINED', '2022-06-02 00:50:00.000000', '2022-06-07 11:00:33.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21357, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-07-03 03:19:45.600000', '2022-07-03 03:19:45.600000', '2022-07-03 03:24:45.600000'),
(DEFAULT, 21358, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-06-09 04:28:52.800000', '2022-06-09 04:28:52.800000', '2022-06-09 04:33:52.800000');

-- 2022-06-11 00:50:00.000000
-- 2022-06-11
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1248, 79, 151, NULL, 'Analyze Cross-Service Failure Impact', 'This is Analyze Cross-Service Failure Impact', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2022-06-11', '2022-07-11', '2022-06-19', '2022-06-11 00:50:00.000000', '2022-06-11 00:50:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21360, 1248, 146, 'JOINED', '2022-06-11 00:50:00.000000', '2022-06-18 05:38:00.000000'),
(21361, 1248, 147, 'JOINED', '2022-06-11 00:50:00.000000', '2022-06-11 21:11:07.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21360, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-07-11 16:11:36.000000', '2022-07-11 16:11:36.000000', '2022-07-11 16:16:36.000000'),
(DEFAULT, 21361, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-06-15 11:46:38.400000', '2022-06-15 11:46:38.400000', '2022-06-15 11:51:38.400000');

-- 2022-06-20 00:50:00.000000
-- 2022-06-20
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1249, 79, 151, NULL, 'Define Escalation Rules', 'This is Define Escalation Rules', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2022-06-20', '2022-06-27', '2022-06-28', '2022-06-20 00:50:00.000000', '2022-06-20 00:50:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21363, 1249, 146, 'JOINED', '2022-06-20 00:50:00.000000', '2022-06-22 21:34:09.600000'),
(21364, 1249, 147, 'JOINED', '2022-06-20 00:50:00.000000', '2022-06-20 05:38:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21363, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-06-27 06:47:07.200000', '2022-06-27 06:47:07.200000', '2022-06-27 06:52:07.200000'),
(DEFAULT, 21364, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-06-21 20:48:04.800000', '2022-06-21 20:48:04.800000', '2022-06-21 20:53:04.800000');

-- 2022-06-29 00:50:00.000000
-- 2022-06-29
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1250, 79, 151, NULL, 'Validate Edge Case Coverage', 'This is Validate Edge Case Coverage', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2022-06-29', '2022-07-27', '2022-07-07', '2022-06-29 00:50:00.000000', '2022-06-29 00:50:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21366, 1250, 146, 'JOINED', '2022-06-29 00:50:00.000000', '2022-07-06 05:38:00.000000'),
(21367, 1250, 147, 'JOINED', '2022-06-29 00:50:00.000000', '2022-06-29 18:06:48.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21366, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-07-27 19:04:24.000000', '2022-07-27 19:04:24.000000', '2022-07-27 19:09:24.000000'),
(DEFAULT, 21367, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-07-01 15:02:28.800000', '2022-07-01 15:02:28.800000', '2022-07-01 15:07:28.800000');

-- 2022-07-08 00:50:00.000000
-- 2022-07-08
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1251, 79, 151, NULL, 'Sign Off Exception Handling Rules', 'This is Sign Off Exception Handling Rules', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2022-07-08', '2022-08-08', '2022-07-16', '2022-07-08 00:50:00.000000', '2022-07-08 00:50:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21369, 1251, 146, 'JOINED', '2022-07-08 00:50:00.000000', '2022-07-15 05:38:00.000000'),
(21370, 1251, 147, 'JOINED', '2022-07-08 00:50:00.000000', '2022-07-10 19:15:55.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21369, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-08-08 05:03:26.400000', '2022-08-08 05:03:26.400000', '2022-08-08 05:08:26.400000'),
(DEFAULT, 21370, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-07-12 11:00:33.600000', '2022-07-12 11:00:33.600000', '2022-07-12 11:05:33.600000');

INSERT INTO collection (`id`, `created_time`, `description`, `due_date`, `start_date`, `name`, `updated_time`, `phase_id`, `created_by_id`)
VALUES (80, '2022-07-16 00:50:00.000000', 'This is Reporting & Analytics Rules', '2023-01-15', '2022-07-16', 'Reporting & Analytics Rules', '2022-07-16 00:50:00.000000', 15, 154);


-- 2022-07-17 00:55:00.000000
-- 2022-07-17
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1252, 80, 151, NULL, 'Identify Business Metrics Requirements', 'This is Identify Business Metrics Requirements', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2022-07-17', '2022-07-21', '2022-07-25', '2022-07-17 00:55:00.000000', '2022-07-17 00:55:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21372, 1252, 146, 'JOINED', '2022-07-17 00:55:00.000000', '2022-07-17 01:06:31.200000'),
(21373, 1252, 147, 'JOINED', '2022-07-17 00:55:00.000000', '2022-07-18 05:19:57.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21372, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-07-21 01:18:02.400000', '2022-07-21 01:18:02.400000', '2022-07-21 01:23:02.400000'),
(DEFAULT, 21373, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-07-20 10:07:57.600000', '2022-07-20 10:07:57.600000', '2022-07-20 10:12:57.600000');

-- 2022-07-26 00:55:00.000000
-- 2022-07-26
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1253, 80, 151, NULL, 'Define CV Usage Metrics', 'This is Define CV Usage Metrics', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2022-07-26', '2022-08-09', '2022-08-03', '2022-07-26 00:55:00.000000', '2022-07-26 00:55:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21375, 1253, 146, 'JOINED', '2022-07-26 00:55:00.000000', '2022-07-27 14:15:38.400000'),
(21376, 1253, 147, 'JOINED', '2022-07-26 00:55:00.000000', '2022-07-26 21:50:40.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21375, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-08-09 11:34:21.600000', '2022-08-09 11:34:21.600000', '2022-08-09 11:39:21.600000'),
(DEFAULT, 21376, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-07-28 18:23:19.200000', '2022-07-28 18:23:19.200000', '2022-07-28 18:28:19.200000');

-- 2022-08-04 00:55:00.000000
-- 2022-08-04
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1254, 80, 151, NULL, 'Define CV Quality Scoring Metrics', 'This is Define CV Quality Scoring Metrics', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2022-08-04', '2022-08-19', '2022-08-12', '2022-08-04 00:55:00.000000', '2022-08-04 00:55:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21378, 1254, 146, 'JOINED', '2022-08-04 00:55:00.000000', '2022-08-04 23:45:52.800000'),
(21379, 1254, 147, 'JOINED', '2022-08-04 00:55:00.000000', '2022-08-09 01:29:33.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21378, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-08-19 02:04:07.200000', '2022-08-19 02:04:07.200000', '2022-08-19 02:09:07.200000'),
(DEFAULT, 21379, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-08-10 22:25:14.400000', '2022-08-10 22:25:14.400000', '2022-08-10 22:30:14.400000');

-- 2022-08-13 00:55:00.000000
-- 2022-08-13
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1255, 80, 151, NULL, 'Analyze Recommendation Effectiveness KPIs', 'This is Analyze Recommendation Effectiveness KPIs', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2022-08-13', '2022-09-09', '2022-08-21', '2022-08-13 00:55:00.000000', '2022-08-13 00:55:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21381, 1255, 146, 'JOINED', '2022-08-13 00:55:00.000000', '2022-08-20 05:43:00.000000'),
(21382, 1255, 148, 'JOINED', '2022-08-13 00:55:00.000000', '2022-08-14 06:17:33.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21381, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-09-09 00:43:28.800000', '2022-09-09 00:43:28.800000', '2022-09-09 00:48:28.800000'),
(DEFAULT, 21382, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-08-17 18:23:19.200000', '2022-08-17 18:23:19.200000', '2022-08-17 18:28:19.200000');

-- 2022-08-22 00:55:00.000000
-- 2022-08-22
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1256, 80, 151, NULL, 'Define User Engagement Metrics', 'This is Define User Engagement Metrics', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2022-08-22', '2022-09-14', '2022-08-30', '2022-08-22 00:55:00.000000', '2022-08-22 00:55:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21384, 1256, 146, 'JOINED', '2022-08-22 00:55:00.000000', '2022-08-29 05:43:00.000000'),
(21385, 1256, 148, 'JOINED', '2022-08-22 00:55:00.000000', '2022-08-22 01:29:33.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21384, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-09-14 08:58:50.400000', '2022-09-14 08:58:50.400000', '2022-09-14 09:03:50.400000'),
(DEFAULT, 21385, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-08-24 11:17:04.800000', '2022-08-24 11:17:04.800000', '2022-08-24 11:22:04.800000');

-- 2022-08-31 00:55:00.000000
-- 2022-08-31
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1257, 80, 151, NULL, 'Define Conversion Tracking Rules', 'This is Define Conversion Tracking Rules', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2022-08-31', '2022-09-14', '2022-09-08', '2022-08-31 00:55:00.000000', '2022-08-31 00:55:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21387, 1257, 146, 'JOINED', '2022-08-31 00:55:00.000000', '2022-09-01 11:05:33.600000'),
(21388, 1257, 147, 'JOINED', '2022-08-31 00:55:00.000000', '2022-09-01 03:47:48.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21387, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-09-14 14:44:26.400000', '2022-09-14 14:44:26.400000', '2022-09-14 14:49:26.400000'),
(DEFAULT, 21388, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-09-02 16:39:38.400000', '2022-09-02 16:39:38.400000', '2022-09-02 16:44:38.400000');

-- 2022-09-09 00:55:00.000000
-- 2022-09-09
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1258, 80, 151, NULL, 'Analyze Funnel Drop-off Points', 'This is Analyze Funnel Drop-off Points', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2022-09-09', '2022-10-02', '2022-09-17', '2022-09-09 00:55:00.000000', '2022-09-09 00:55:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21390, 1258, 146, 'JOINED', '2022-09-09 00:55:00.000000', '2022-09-16 05:43:00.000000'),
(21391, 1258, 149, 'JOINED', '2022-09-09 00:55:00.000000', '2022-09-13 13:46:50.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21390, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-10-02 15:42:02.400000', '2022-10-02 15:42:02.400000', '2022-10-02 15:47:02.400000'),
(DEFAULT, 21391, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-09-16 17:02:40.800000', '2022-09-16 17:02:40.800000', '2022-09-16 17:07:40.800000');

-- 2022-09-18 00:55:00.000000
-- 2022-09-18
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1259, 80, 151, NULL, 'Define Data Aggregation Rules', 'This is Define Data Aggregation Rules', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2022-09-18', '2022-10-02', '2022-09-26', '2022-09-18 00:55:00.000000', '2022-09-18 00:55:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21393, 1259, 146, 'JOINED', '2022-09-18 00:55:00.000000', '2022-09-19 20:41:33.600000'),
(21394, 1259, 149, 'JOINED', '2022-09-18 00:55:00.000000', '2022-09-20 12:26:12.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21393, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-10-02 05:08:26.400000', '2022-10-02 05:08:26.400000', '2022-10-02 05:13:26.400000'),
(DEFAULT, 21394, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-09-23 01:52:36.000000', '2022-09-23 01:52:36.000000', '2022-09-23 01:57:36.000000');

-- 2022-09-27 00:55:00.000000
-- 2022-09-27
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1260, 80, 151, NULL, 'Define Time-based Reporting Rules', 'This is Define Time-based Reporting Rules', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2022-09-27', '2022-10-04', '2022-10-05', '2022-09-27 00:55:00.000000', '2022-09-27 00:55:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21396, 1260, 146, 'JOINED', '2022-09-27 00:55:00.000000', '2022-09-27 23:22:50.400000'),
(21397, 1260, 149, 'JOINED', '2022-09-27 00:55:00.000000', '2022-10-01 18:00:16.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21396, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-10-02 18:46:21.600000', '2022-10-02 18:46:21.600000', '2022-10-02 18:51:21.600000'),
(DEFAULT, 21397, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-10-04 07:38:12.000000', '2022-10-04 07:38:12.000000', '2022-10-04 07:43:12.000000');

-- 2022-10-06 00:55:00.000000
-- 2022-10-06
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1261, 80, 151, NULL, 'Define Role-based Report Visibility', 'This is Define Role-based Report Visibility', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2022-10-06', '2022-10-21', '2022-10-14', '2022-10-06 00:55:00.000000', '2022-10-06 00:55:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21399, 1261, 146, 'JOINED', '2022-10-06 00:55:00.000000', '2022-10-06 18:06:02.400000'),
(21400, 1261, 149, 'JOINED', '2022-10-06 00:55:00.000000', '2022-10-07 00:49:14.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21399, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-10-21 07:43:57.600000', '2022-10-21 07:43:57.600000', '2022-10-21 07:48:57.600000'),
(DEFAULT, 21400, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-10-21 01:00:45.600000', '2022-10-21 01:00:45.600000', '2022-10-21 01:05:45.600000');

-- 2022-10-15 00:55:00.000000
-- 2022-10-15
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1262, 80, 151, NULL, 'Analyze Data Accuracy Constraints', 'This is Analyze Data Accuracy Constraints', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2022-10-15', '2022-10-28', '2022-10-23', '2022-10-15 00:55:00.000000', '2022-10-15 00:55:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21402, 1262, 146, 'JOINED', '2022-10-15 00:55:00.000000', '2022-10-16 03:24:45.600000'),
(21403, 1262, 149, 'JOINED', '2022-10-15 00:55:00.000000', '2022-10-17 10:36:45.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21402, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-10-20 13:12:16.800000', '2022-10-20 13:12:16.800000', '2022-10-20 13:17:16.800000'),
(DEFAULT, 21403, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-10-28 15:13:14.400000', '2022-10-28 15:13:14.400000', '2022-10-28 15:18:14.400000');

-- 2022-10-24 00:55:00.000000
-- 2022-10-24
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1263, 80, 151, NULL, 'Define Metric Validation Rules', 'This is Define Metric Validation Rules', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2022-10-24', '2022-11-20', '2022-11-01', '2022-10-24 00:55:00.000000', '2022-10-24 00:55:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21405, 1263, 146, 'JOINED', '2022-10-24 00:55:00.000000', '2022-10-25 09:33:24.000000'),
(21406, 1263, 149, 'JOINED', '2022-10-24 00:55:00.000000', '2022-10-31 05:43:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21405, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-10-29 20:30:02.400000', '2022-10-29 20:30:02.400000', '2022-10-29 20:35:02.400000'),
(DEFAULT, 21406, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-11-20 11:40:07.200000', '2022-11-20 11:40:07.200000', '2022-11-20 11:45:07.200000');

-- 2022-11-02 00:55:00.000000
-- 2022-11-02
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1264, 80, 151, NULL, 'Align Reporting with Database Model', 'This is Align Reporting with Database Model', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2022-11-02', '2022-11-07', '2022-11-10', '2022-11-02 00:55:00.000000', '2022-11-02 00:55:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21408, 1264, 146, 'JOINED', '2022-11-02 00:55:00.000000', '2022-11-02 15:53:33.600000'),
(21409, 1264, 149, 'JOINED', '2022-11-02 00:55:00.000000', '2022-11-02 08:12:45.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21408, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-11-07 10:07:57.600000', '2022-11-07 10:07:57.600000', '2022-11-07 10:12:57.600000'),
(DEFAULT, 21409, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-11-06 11:17:04.800000', '2022-11-06 11:17:04.800000', '2022-11-06 11:22:04.800000');

-- 2022-11-11 00:55:00.000000
-- 2022-11-11
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1265, 80, 151, NULL, 'Align Reporting with Backend APIs', 'This is Align Reporting with Backend APIs', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2022-11-11', '2022-12-09', '2022-11-19', '2022-11-11 00:55:00.000000', '2022-11-11 00:55:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21411, 1265, 146, 'JOINED', '2022-11-11 00:55:00.000000', '2022-11-18 05:43:00.000000'),
(21412, 1265, 149, 'JOINED', '2022-11-11 00:55:00.000000', '2022-11-18 05:43:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21411, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-12-09 11:28:36.000000', '2022-12-09 11:28:36.000000', '2022-12-09 11:33:36.000000'),
(DEFAULT, 21412, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-12-08 18:34:50.400000', '2022-12-08 18:34:50.400000', '2022-12-08 18:39:50.400000');

-- 2022-11-20 00:55:00.000000
-- 2022-11-20
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1266, 80, 151, NULL, 'Define Historical Reporting Rules', 'This is Define Historical Reporting Rules', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2022-11-20', '2022-12-17', '2022-11-28', '2022-11-20 00:55:00.000000', '2022-11-20 00:55:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21414, 1266, 146, 'JOINED', '2022-11-20 00:55:00.000000', '2022-11-27 05:43:00.000000'),
(21415, 1266, 149, 'JOINED', '2022-11-20 00:55:00.000000', '2022-11-27 05:43:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21414, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-12-17 22:13:43.200000', '2022-12-17 22:13:43.200000', '2022-12-17 22:18:43.200000'),
(DEFAULT, 21415, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-12-16 08:12:45.600000', '2022-12-16 08:12:45.600000', '2022-12-16 08:17:45.600000');

-- 2022-11-29 00:55:00.000000
-- 2022-11-29
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1267, 80, 151, NULL, 'Define Export & Sharing Rules', 'This is Define Export & Sharing Rules', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2022-11-29', '2022-12-25', '2022-12-07', '2022-11-29 00:55:00.000000', '2022-11-29 00:55:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21417, 1267, 146, 'JOINED', '2022-11-29 00:55:00.000000', '2022-12-06 05:43:00.000000'),
(21418, 1267, 149, 'JOINED', '2022-11-29 00:55:00.000000', '2022-11-29 01:52:36.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21417, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-12-25 22:02:12.000000', '2022-12-25 22:02:12.000000', '2022-12-25 22:07:12.000000'),
(DEFAULT, 21418, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-12-03 14:21:24.000000', '2022-12-03 14:21:24.000000', '2022-12-03 14:26:24.000000');

-- 2022-12-08 00:55:00.000000
-- 2022-12-08
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1268, 80, 151, NULL, 'Validate Analytics Use Cases', 'This is Validate Analytics Use Cases', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2022-12-08', '2022-12-19', '2022-12-14', '2022-12-08 00:55:00.000000', '2022-12-08 00:55:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21420, 1268, 146, 'JOINED', '2022-12-08 00:55:00.000000', '2022-12-08 17:58:50.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21420, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-12-19 07:51:09.600000', '2022-12-19 07:51:09.600000', '2022-12-19 07:56:09.600000');

-- 2022-12-15 00:55:00.000000
-- 2022-12-15
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1269, 80, 151, NULL, 'Review Metrics with Stakeholders', 'This is Review Metrics with Stakeholders', NULL, 'NORMAL', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2022-12-15', '2023-01-07', '2022-12-21', '2022-12-15 00:55:00.000000', '2022-12-15 00:55:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21422, 1269, 147, 'JOINED', '2022-12-15 00:55:00.000000', '2022-12-17 14:58:50.400000'),
(21423, 1269, 148, 'JOINED', '2022-12-15 00:55:00.000000', '2022-12-16 06:08:55.200000'),
(21424, 1269, 149, 'JOINED', '2022-12-15 00:55:00.000000', '2022-12-15 01:29:33.600000'),
(21425, 1269, 150, 'JOINED', '2022-12-15 00:55:00.000000', '2022-12-20 10:31:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21422, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-12-20 07:20:55.200000', '2022-12-20 07:20:55.200000', '2022-12-20 07:25:55.200000'),
(DEFAULT, 21423, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-12-18 18:11:48.000000', '2022-12-18 18:11:48.000000', '2022-12-18 18:16:48.000000'),
(DEFAULT, 21424, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-12-17 11:14:12.000000', '2022-12-17 11:14:12.000000', '2022-12-17 11:19:12.000000'),
(DEFAULT, 21425, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-01-07 08:04:07.200000', '2023-01-07 08:04:07.200000', '2023-01-07 08:09:07.200000');

-- 2022-12-22 00:55:00.000000
-- 2022-12-22
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1270, 80, 151, NULL, 'Finalize Reporting Rules', 'This is Finalize Reporting Rules', NULL, 'LIGHT', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2022-12-22', '2022-12-22', '2022-12-24', '2022-12-22 00:55:00.000000', '2022-12-22 00:55:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21427, 1270, 150, 'JOINED', '2022-12-22 00:55:00.000000', '2022-12-22 02:44:26.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21427, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-12-22 15:33:24.000000', '2022-12-22 15:33:24.000000', '2022-12-22 15:38:24.000000');

-- 2022-12-25 00:55:00.000000
-- 2022-12-25
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1271, 80, 151, NULL, 'Sign Off Analytics Rules', 'This is Sign Off Analytics Rules', NULL, 'NORMAL', 'BUSINESS_ANALYSIS', 'URGENT', FALSE, '2022-12-25', '2023-01-15', '2022-12-31', '2022-12-25 00:55:00.000000', '2022-12-25 00:55:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21429, 1271, 147, 'JOINED', '2022-12-25 00:55:00.000000', '2022-12-27 19:43:57.600000'),
(21430, 1271, 148, 'JOINED', '2022-12-25 00:55:00.000000', '2022-12-30 10:31:00.000000'),
(21431, 1271, 149, 'JOINED', '2022-12-25 00:55:00.000000', '2022-12-30 10:31:00.000000'),
(21432, 1271, 150, 'JOINED', '2022-12-25 00:55:00.000000', '2022-12-30 10:31:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21429, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-12-30 04:28:07.200000', '2022-12-30 04:28:07.200000', '2022-12-30 04:33:07.200000'),
(DEFAULT, 21430, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-01-13 20:07:00.000000', '2023-01-13 20:07:00.000000', '2023-01-13 20:12:00.000000'),
(DEFAULT, 21431, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-01-14 19:52:36.000000', '2023-01-14 19:52:36.000000', '2023-01-14 19:57:36.000000'),
(DEFAULT, 21432, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-01-15 09:50:40.800000', '2023-01-15 09:50:40.800000', '2023-01-15 09:55:40.800000');

INSERT INTO `phase` (`id`, `created_time`, `description`, `due_date`, `start_date`, `name`, `updated_time`, `project_id`, `created_by_id`)
VALUES (16, '2022-12-31 00:55:00.000000', 'This is Client Requests #1', '2024-05-05', '2022-12-31', 'Client Requests #1', '2022-12-31 00:55:00.000000', 5, 154);


INSERT INTO collection (`id`, `created_time`, `description`, `due_date`, `start_date`, `name`, `updated_time`, `phase_id`, `created_by_id`)
VALUES (81, '2022-12-31 01:00:00.000000', 'This is Requirement Changes & Clarification', '2023-06-05', '2022-12-31', 'Requirement Changes & Clarification', '2022-12-31 01:00:00.000000', 16, 154);


-- 2023-01-01 01:05:00.000000
-- 2023-01-01
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1272, 81, 151, NULL, 'Analyze Client Change Request Summary', 'This is Analyze Client Change Request Summary', NULL, 'LIGHT', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2023-01-01', '2023-01-05', '2023-01-03', '2023-01-01 01:05:00.000000', '2023-01-01 01:05:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21434, 1272, 150, 'JOINED', '2023-01-01 01:05:00.000000', '2023-01-01 01:20:50.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21434, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-01-05 00:49:09.600000', '2023-01-05 00:49:09.600000', '2023-01-05 00:54:09.600000');

-- 2023-01-04 01:05:00.000000
-- 2023-01-04
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1273, 81, 151, NULL, 'Clarify Updated CV Creation Requirements', 'This is Clarify Updated CV Creation Requirements', NULL, 'NORMAL', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2023-01-04', '2023-01-08', '2023-01-09', '2023-01-04 01:05:00.000000', '2023-01-04 01:05:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21436, 1273, 147, 'JOINED', '2023-01-04 01:05:00.000000', '2023-01-07 11:24:12.000000'),
(21437, 1273, 148, 'JOINED', '2023-01-04 01:05:00.000000', '2023-01-04 19:19:24.000000'),
(21438, 1273, 149, 'JOINED', '2023-01-04 01:05:00.000000', '2023-01-04 10:12:12.000000'),
(21439, 1273, 150, 'JOINED', '2023-01-04 01:05:00.000000', '2023-01-05 18:07:24.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21436, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-01-08 11:31:24.000000', '2023-01-08 11:31:24.000000', '2023-01-08 11:36:24.000000'),
(DEFAULT, 21437, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-01-06 01:12:12.000000', '2023-01-06 01:12:12.000000', '2023-01-06 01:17:12.000000'),
(DEFAULT, 21438, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-01-06 05:53:00.000000', '2023-01-06 05:53:00.000000', '2023-01-06 05:58:00.000000'),
(DEFAULT, 21439, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-01-07 17:02:36.000000', '2023-01-07 17:02:36.000000', '2023-01-07 17:07:36.000000');

-- 2023-01-10 01:05:00.000000
-- 2023-01-10
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1274, 81, 151, NULL, 'Analyze Changes in CV Editing Flow', 'This is Analyze Changes in CV Editing Flow', NULL, 'LIGHT', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2023-01-10', '2023-01-11', '2023-01-12', '2023-01-10 01:05:00.000000', '2023-01-10 01:05:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21441, 1274, 150, 'JOINED', '2023-01-10 01:05:00.000000', '2023-01-11 05:04:02.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21441, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-01-11 22:38:07.200000', '2023-01-11 22:38:07.200000', '2023-01-11 22:43:07.200000');

-- 2023-01-13 01:05:00.000000
-- 2023-01-13
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1275, 81, 151, NULL, 'Clarify New CV Submission Constraints', 'This is Clarify New CV Submission Constraints', NULL, 'NORMAL', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2023-01-13', '2023-01-29', '2023-01-18', '2023-01-13 01:05:00.000000', '2023-01-13 01:05:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21443, 1275, 147, 'JOINED', '2023-01-13 01:05:00.000000', '2023-01-13 05:31:24.000000'),
(21444, 1275, 148, 'JOINED', '2023-01-13 01:05:00.000000', '2023-01-16 09:50:36.000000'),
(21445, 1275, 149, 'JOINED', '2023-01-13 01:05:00.000000', '2023-01-13 02:17:00.000000'),
(21446, 1275, 150, 'JOINED', '2023-01-13 01:05:00.000000', '2023-01-17 13:05:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21443, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-01-14 15:00:12.000000', '2023-01-14 15:00:12.000000', '2023-01-14 15:05:12.000000'),
(DEFAULT, 21444, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-01-17 16:33:48.000000', '2023-01-17 16:33:48.000000', '2023-01-17 16:38:48.000000'),
(DEFAULT, 21445, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-01-14 03:00:12.000000', '2023-01-14 03:00:12.000000', '2023-01-14 03:05:12.000000'),
(DEFAULT, 21446, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-01-29 07:12:12.000000', '2023-01-29 07:12:12.000000', '2023-01-29 07:17:12.000000');

-- 2023-01-19 01:05:00.000000
-- 2023-01-19
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1276, 81, 151, NULL, 'Analyze Updated Scoring Expectations', 'This is Analyze Updated Scoring Expectations', NULL, 'LIGHT', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2023-01-19', '2023-01-22', '2023-01-21', '2023-01-19 01:05:00.000000', '2023-01-19 01:05:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21448, 1276, 150, 'JOINED', '2023-01-19 01:05:00.000000', '2023-01-19 12:34:45.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21448, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-01-22 13:35:14.400000', '2023-01-22 13:35:14.400000', '2023-01-22 13:40:14.400000');

-- 2023-01-22 01:05:00.000000
-- 2023-01-22
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1277, 81, 151, NULL, 'Clarify Recommendation Logic Changes', 'This is Clarify Recommendation Logic Changes', NULL, 'NORMAL', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2023-01-22', '2023-02-08', '2023-01-27', '2023-01-22 01:05:00.000000', '2023-01-22 01:05:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21450, 1277, 147, 'JOINED', '2023-01-22 01:05:00.000000', '2023-01-23 03:43:24.000000'),
(21451, 1277, 148, 'JOINED', '2023-01-22 01:05:00.000000', '2023-01-23 07:12:12.000000'),
(21452, 1277, 149, 'JOINED', '2023-01-22 01:05:00.000000', '2023-01-24 17:17:00.000000'),
(21453, 1277, 150, 'JOINED', '2023-01-22 01:05:00.000000', '2023-01-26 13:05:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21450, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-01-25 12:29:00.000000', '2023-01-25 12:29:00.000000', '2023-01-25 12:34:00.000000'),
(DEFAULT, 21451, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-01-25 00:50:36.000000', '2023-01-25 00:50:36.000000', '2023-01-25 00:55:36.000000'),
(DEFAULT, 21452, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-01-26 07:05:00.000000', '2023-01-26 07:05:00.000000', '2023-01-26 07:10:00.000000'),
(DEFAULT, 21453, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-02-08 19:55:24.000000', '2023-02-08 19:55:24.000000', '2023-02-08 20:00:24.000000');

-- 2023-01-28 01:05:00.000000
-- 2023-01-28
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1278, 81, 151, NULL, 'Identify Deprecated Business Rules', 'This is Identify Deprecated Business Rules', NULL, 'LIGHT', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2023-01-28', '2023-01-29', '2023-01-30', '2023-01-28 01:05:00.000000', '2023-01-28 01:05:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21455, 1278, 150, 'JOINED', '2023-01-28 01:05:00.000000', '2023-01-28 03:23:14.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21455, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-01-29 02:25:38.400000', '2023-01-29 02:25:38.400000', '2023-01-29 02:30:38.400000');

-- 2023-01-31 01:05:00.000000
-- 2023-01-31
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1279, 81, 151, NULL, 'Identify Newly Added Business Rules', 'This is Identify Newly Added Business Rules', NULL, 'NORMAL', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2023-01-31', '2023-02-06', '2023-02-04', '2023-01-31 01:05:00.000000', '2023-01-31 01:05:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21457, 1279, 147, 'JOINED', '2023-01-31 01:05:00.000000', '2023-01-31 18:27:33.600000'),
(21458, 1279, 148, 'JOINED', '2023-01-31 01:05:00.000000', '2023-01-31 18:33:19.200000'),
(21459, 1279, 149, 'JOINED', '2023-01-31 01:05:00.000000', '2023-02-01 15:49:09.600000'),
(21460, 1279, 150, 'JOINED', '2023-01-31 01:05:00.000000', '2023-02-01 13:45:19.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21457, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-02-01 12:53:28.800000', '2023-02-01 12:53:28.800000', '2023-02-01 12:58:28.800000'),
(DEFAULT, 21458, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-02-01 16:15:04.800000', '2023-02-01 16:15:04.800000', '2023-02-01 16:20:04.800000'),
(DEFAULT, 21459, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-02-06 10:20:50.400000', '2023-02-06 10:20:50.400000', '2023-02-06 10:25:50.400000'),
(DEFAULT, 21460, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-02-06 12:24:40.800000', '2023-02-06 12:24:40.800000', '2023-02-06 12:29:40.800000');

-- 2023-02-05 01:05:00.000000
-- 2023-02-05
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1280, 81, 151, NULL, 'Analyze Impact on User Roles', 'This is Analyze Impact on User Roles', NULL, 'LIGHT', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2023-02-05', '2023-02-06', '2023-02-07', '2023-02-05 01:05:00.000000', '2023-02-05 01:05:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21462, 1280, 150, 'JOINED', '2023-02-05 01:05:00.000000', '2023-02-05 23:12:40.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21462, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-02-06 17:18:26.400000', '2023-02-06 17:18:26.400000', '2023-02-06 17:23:26.400000');

-- 2023-02-08 01:05:00.000000
-- 2023-02-08
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1281, 81, 151, NULL, 'Clarify Permission Model Changes', 'This is Clarify Permission Model Changes', NULL, 'NORMAL', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2023-02-08', '2023-02-10', '2023-02-11', '2023-02-08 01:05:00.000000', '2023-02-08 01:05:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21464, 1281, 147, 'JOINED', '2023-02-08 01:05:00.000000', '2023-02-09 21:34:45.600000'),
(21465, 1281, 148, 'JOINED', '2023-02-08 01:05:00.000000', '2023-02-09 05:18:26.400000'),
(21466, 1281, 149, 'JOINED', '2023-02-08 01:05:00.000000', '2023-02-09 17:11:14.400000'),
(21467, 1281, 150, 'JOINED', '2023-02-08 01:05:00.000000', '2023-02-08 04:10:45.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21464, 'Employee 147 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-02-10 15:47:43.200000', '2023-02-10 15:47:43.200000', '2023-02-10 15:52:43.200000'),
(DEFAULT, 21465, 'Employee 148 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-02-10 09:36:12.000000', '2023-02-10 09:36:12.000000', '2023-02-10 09:41:12.000000'),
(DEFAULT, 21466, 'Employee 149 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-02-10 10:49:38.400000', '2023-02-10 10:49:38.400000', '2023-02-10 10:54:38.400000'),
(DEFAULT, 21467, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-02-09 03:52:02.400000', '2023-02-09 03:52:02.400000', '2023-02-09 03:57:02.400000');

-- 2023-02-12 01:05:00.000000
-- 2023-02-12
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1282, 81, 151, NULL, 'Analyze Change in Data Visibility Rules', 'This is Analyze Change in Data Visibility Rules', NULL, 'LIGHT', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2023-02-12', '2023-02-13', '2023-02-14', '2023-02-12 01:05:00.000000', '2023-02-12 01:05:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21469, 1282, 150, 'JOINED', '2023-02-12 01:05:00.000000', '2023-02-12 22:46:45.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21469, 'Employee 150 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-02-13 12:59:14.400000', '2023-02-13 12:59:14.400000', '2023-02-13 13:04:14.400000');

-- 2023-02-15 01:05:00.000000
-- 2023-02-15
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1283, 81, 151, NULL, 'Clarify Audit & Logging Expectations', 'This is Clarify Audit & Logging Expectations', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2023-02-15', '2023-03-12', '2023-02-22', '2023-02-15 01:05:00.000000', '2023-02-15 01:05:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21471, 1283, 146, 'JOINED', '2023-02-15 01:05:00.000000', '2023-02-21 08:17:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21471, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-03-12 18:08:50.400000', '2023-03-12 18:08:50.400000', '2023-03-12 18:13:50.400000');

-- 2023-02-23 01:05:00.000000
-- 2023-02-23
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1284, 81, 151, NULL, 'Analyze Updated Error Handling Rules', 'This is Analyze Updated Error Handling Rules', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2023-02-23', '2023-03-04', '2023-02-28', '2023-02-23 01:05:00.000000', '2023-02-23 01:05:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21473, 1284, 146, 'JOINED', '2023-02-23 01:05:00.000000', '2023-02-23 03:57:48.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21473, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-03-04 22:12:12.000000', '2023-03-04 22:12:12.000000', '2023-03-04 22:17:12.000000');

-- 2023-03-01 01:05:00.000000
-- 2023-03-01
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1285, 81, 151, NULL, 'Clarify Edge Case Handling Updates', 'This is Clarify Edge Case Handling Updates', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2023-03-01', '2023-03-12', '2023-03-08', '2023-03-01 01:05:00.000000', '2023-03-01 01:05:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21475, 1285, 146, 'JOINED', '2023-03-01 01:05:00.000000', '2023-03-03 08:36:26.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21475, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-03-12 17:33:33.600000', '2023-03-12 17:33:33.600000', '2023-03-12 17:38:33.600000');

-- 2023-03-09 01:05:00.000000
-- 2023-03-09
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1286, 81, 151, NULL, 'Analyze New Validation Requirements', 'This is Analyze New Validation Requirements', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2023-03-09', '2023-03-18', '2023-03-14', '2023-03-09 01:05:00.000000', '2023-03-09 01:05:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21477, 1286, 146, 'JOINED', '2023-03-09 01:05:00.000000', '2023-03-09 23:56:36.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21477, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-03-18 02:13:24.000000', '2023-03-18 02:13:24.000000', '2023-03-18 02:18:24.000000');

-- 2023-03-15 01:05:00.000000
-- 2023-03-15
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1287, 81, 151, NULL, 'Clarify Client Terminology Changes', 'This is Clarify Client Terminology Changes', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2023-03-15', '2023-03-26', '2023-03-22', '2023-03-15 01:05:00.000000', '2023-03-15 01:05:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21479, 1287, 146, 'JOINED', '2023-03-15 01:05:00.000000', '2023-03-17 07:00:40.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21479, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-03-26 19:09:19.200000', '2023-03-26 19:09:19.200000', '2023-03-26 19:14:19.200000');

-- 2023-03-23 01:05:00.000000
-- 2023-03-23
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1288, 81, 151, NULL, 'Resolve Ambiguous Client Statements', 'This is Resolve Ambiguous Client Statements', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2023-03-23', '2023-03-27', '2023-03-28', '2023-03-23 01:05:00.000000', '2023-03-23 01:05:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21481, 1288, 146, 'JOINED', '2023-03-23 01:05:00.000000', '2023-03-24 19:19:24.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21481, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-03-27 05:31:24.000000', '2023-03-27 05:31:24.000000', '2023-03-27 05:36:24.000000');

-- 2023-03-29 01:05:00.000000
-- 2023-03-29
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1289, 81, 151, NULL, 'Update Business Glossary', 'This is Update Business Glossary', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2023-03-29', '2023-04-01', '2023-04-05', '2023-03-29 01:05:00.000000', '2023-03-29 01:05:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21483, 1289, 146, 'JOINED', '2023-03-29 01:05:00.000000', '2023-03-29 03:56:21.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21483, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-04-01 20:58:45.600000', '2023-04-01 20:58:45.600000', '2023-04-01 21:03:45.600000');

-- 2023-04-06 01:05:00.000000
-- 2023-04-06
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1290, 81, 151, NULL, 'Confirm Clarified Requirements with Client', 'This is Confirm Clarified Requirements with Client', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2023-04-06', '2023-04-07', '2023-04-11', '2023-04-06 01:05:00.000000', '2023-04-06 01:05:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21485, 1290, 146, 'JOINED', '2023-04-06 01:05:00.000000', '2023-04-06 07:05:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21485, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-04-07 11:02:36.000000', '2023-04-07 11:02:36.000000', '2023-04-07 11:07:36.000000');

-- 2023-04-12 01:05:00.000000
-- 2023-04-12
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1291, 81, 151, NULL, 'Sign Off Clarified Requirements', 'This is Sign Off Clarified Requirements', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2023-04-12', '2023-04-16', '2023-04-19', '2023-04-12 01:05:00.000000', '2023-04-12 01:05:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21487, 1291, 146, 'JOINED', '2023-04-12 01:05:00.000000', '2023-04-13 15:53:28.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21487, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-04-16 08:24:12.000000', '2023-04-16 08:24:12.000000', '2023-04-16 08:29:12.000000');

-- 2023-04-20 01:05:00.000000
-- 2023-04-20
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1292, 81, 151, NULL, 'Analyze Additional Client Feedback', 'This is Analyze Additional Client Feedback', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2023-04-20', '2023-04-21', '2023-04-25', '2023-04-20 01:05:00.000000', '2023-04-20 01:05:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21489, 1292, 146, 'JOINED', '2023-04-20 01:05:00.000000', '2023-04-20 17:45:48.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21489, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-04-21 21:21:48.000000', '2023-04-21 21:21:48.000000', '2023-04-21 21:26:48.000000');

-- 2023-04-26 01:05:00.000000
-- 2023-04-26
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1293, 81, 151, NULL, 'Clarify Priority Changes from Client', 'This is Clarify Priority Changes from Client', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2023-04-26', '2023-05-03', '2023-05-03', '2023-04-26 01:05:00.000000', '2023-04-26 01:05:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21491, 1293, 146, 'JOINED', '2023-04-26 01:05:00.000000', '2023-04-30 05:32:50.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21491, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-05-03 00:54:55.200000', '2023-05-03 00:54:55.200000', '2023-05-03 00:59:55.200000');

-- 2023-05-04 01:05:00.000000
-- 2023-05-04
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1294, 81, 151, NULL, 'Analyze Change Dependencies', 'This is Analyze Change Dependencies', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2023-05-04', '2023-05-06', '2023-05-09', '2023-05-04 01:05:00.000000', '2023-05-04 01:05:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21493, 1294, 146, 'JOINED', '2023-05-04 01:05:00.000000', '2023-05-04 12:29:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21493, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-05-06 21:43:24.000000', '2023-05-06 21:43:24.000000', '2023-05-06 21:48:24.000000');

-- 2023-05-10 01:05:00.000000
-- 2023-05-10
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1295, 81, 151, NULL, 'Identify Conflicting Change Requests', 'This is Identify Conflicting Change Requests', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2023-05-10', '2023-05-22', '2023-05-17', '2023-05-10 01:05:00.000000', '2023-05-10 01:05:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21495, 1295, 146, 'JOINED', '2023-05-10 01:05:00.000000', '2023-05-11 09:10:16.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21495, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-05-22 16:59:43.200000', '2023-05-22 16:59:43.200000', '2023-05-22 17:04:43.200000');

-- 2023-05-18 01:05:00.000000
-- 2023-05-18
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1296, 81, 151, NULL, 'Resolve Requirement Conflicts', 'This is Resolve Requirement Conflicts', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2023-05-18', '2023-06-04', '2023-05-23', '2023-05-18 01:05:00.000000', '2023-05-18 01:05:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21497, 1296, 146, 'JOINED', '2023-05-18 01:05:00.000000', '2023-05-22 13:05:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21497, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-06-04 09:14:36.000000', '2023-06-04 09:14:36.000000', '2023-06-04 09:19:36.000000');

-- 2023-05-24 01:05:00.000000
-- 2023-05-24
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1297, 81, 151, NULL, 'Re-validate Business Scope', 'This is Re-validate Business Scope', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2023-05-24', '2023-06-07', '2023-05-31', '2023-05-24 01:05:00.000000', '2023-05-24 01:05:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21499, 1297, 146, 'JOINED', '2023-05-24 01:05:00.000000', '2023-05-24 02:10:31.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21499, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-06-06 23:59:28.800000', '2023-06-06 23:59:28.800000', '2023-06-07 00:04:28.800000');

-- 2023-06-01 01:05:00.000000
-- 2023-06-01
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1298, 81, 151, NULL, 'Confirm Non-functional Requirement Changes', 'This is Confirm Non-functional Requirement Changes', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2023-06-01', '2023-06-05', '2023-06-06', '2023-06-01 01:05:00.000000', '2023-06-01 01:05:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21501, 1298, 146, 'JOINED', '2023-06-01 01:05:00.000000', '2023-06-01 20:09:48.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21501, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-06-05 13:05:00.000000', '2023-06-05 13:05:00.000000', '2023-06-05 13:10:00.000000');

INSERT INTO collection (`id`, `created_time`, `description`, `due_date`, `start_date`, `name`, `updated_time`, `phase_id`, `created_by_id`)
VALUES (82, '2023-06-06 01:05:00.000000', 'This is Impact Analysis & Re-alignment', '2023-12-04', '2023-06-06', 'Impact Analysis & Re-alignment', '2023-06-06 01:05:00.000000', 16, 154);


-- 2023-06-07 01:10:00.000000
-- 2023-06-07
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1299, 82, 151, NULL, 'Analyze Impact on Backend Services', 'This is Analyze Impact on Backend Services', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2023-06-07', '2023-06-12', '2023-06-14', '2023-06-07 01:10:00.000000', '2023-06-07 01:10:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21503, 1299, 146, 'JOINED', '2023-06-07 01:10:00.000000', '2023-06-07 15:26:48.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21503, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-06-12 21:06:38.400000', '2023-06-12 21:06:38.400000', '2023-06-12 21:11:38.400000');

-- 2023-06-15 01:10:00.000000
-- 2023-06-15
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1300, 82, 151, NULL, 'Analyze Impact on Frontend UX', 'This is Analyze Impact on Frontend UX', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2023-06-15', '2023-06-19', '2023-06-20', '2023-06-15 01:10:00.000000', '2023-06-15 01:10:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21505, 1300, 146, 'JOINED', '2023-06-15 01:10:00.000000', '2023-06-16 02:50:48.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21505, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-06-19 06:55:36.000000', '2023-06-19 06:55:36.000000', '2023-06-19 07:00:36.000000');

-- 2023-06-21 01:10:00.000000
-- 2023-06-21
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1301, 82, 151, NULL, 'Analyze Impact on Database Schema', 'This is Analyze Impact on Database Schema', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2023-06-21', '2023-07-11', '2023-06-28', '2023-06-21 01:10:00.000000', '2023-06-21 01:10:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21507, 1301, 146, 'JOINED', '2023-06-21 01:10:00.000000', '2023-06-27 08:22:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21507, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-07-11 22:58:57.600000', '2023-07-11 22:58:57.600000', '2023-07-11 23:03:57.600000');

-- 2023-06-29 01:10:00.000000
-- 2023-06-29
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1302, 82, 151, NULL, 'Analyze Impact on API Contracts', 'This is Analyze Impact on API Contracts', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2023-06-29', '2023-06-30', '2023-07-04', '2023-06-29 01:10:00.000000', '2023-06-29 01:10:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21509, 1302, 146, 'JOINED', '2023-06-29 01:10:00.000000', '2023-06-29 11:07:36.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21509, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-06-30 21:26:48.000000', '2023-06-30 21:26:48.000000', '2023-06-30 21:31:48.000000');

-- 2023-07-05 01:10:00.000000
-- 2023-07-05
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1303, 82, 151, NULL, 'Analyze Impact on Existing Data', 'This is Analyze Impact on Existing Data', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2023-07-05', '2023-07-27', '2023-07-12', '2023-07-05 01:10:00.000000', '2023-07-05 01:10:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21511, 1303, 146, 'JOINED', '2023-07-05 01:10:00.000000', '2023-07-11 08:22:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21511, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-07-27 17:39:16.800000', '2023-07-27 17:39:16.800000', '2023-07-27 17:44:16.800000');

-- 2023-07-13 01:10:00.000000
-- 2023-07-13
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1304, 82, 151, NULL, 'Analyze Impact on User Workflows', 'This is Analyze Impact on User Workflows', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2023-07-13', '2023-07-21', '2023-07-18', '2023-07-13 01:10:00.000000', '2023-07-13 01:10:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21513, 1304, 146, 'JOINED', '2023-07-13 01:10:00.000000', '2023-07-14 21:41:12.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21513, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-07-21 04:38:48.000000', '2023-07-21 04:38:48.000000', '2023-07-21 04:43:48.000000');

-- 2023-07-19 01:10:00.000000
-- 2023-07-19
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1305, 82, 151, NULL, 'Analyze Impact on Integrations', 'This is Analyze Impact on Integrations', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2023-07-19', '2023-07-31', '2023-07-26', '2023-07-19 01:10:00.000000', '2023-07-19 01:10:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21515, 1305, 146, 'JOINED', '2023-07-19 01:10:00.000000', '2023-07-20 22:26:33.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21515, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-07-31 03:53:26.400000', '2023-07-31 03:53:26.400000', '2023-07-31 03:58:26.400000');

-- 2023-07-27 01:10:00.000000
-- 2023-07-27
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1306, 82, 151, NULL, 'Analyze Impact on Reporting', 'This is Analyze Impact on Reporting', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2023-07-27', '2023-07-29', '2023-08-01', '2023-07-27 01:10:00.000000', '2023-07-27 01:10:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21517, 1306, 146, 'JOINED', '2023-07-27 01:10:00.000000', '2023-07-27 07:53:12.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21517, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-07-29 02:29:12.000000', '2023-07-29 02:29:12.000000', '2023-07-29 02:34:12.000000');

-- 2023-08-02 01:10:00.000000
-- 2023-08-02
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1307, 82, 151, NULL, 'Analyze Impact on Analytics', 'This is Analyze Impact on Analytics', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2023-08-02', '2023-08-07', '2023-08-09', '2023-08-02 01:10:00.000000', '2023-08-02 01:10:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21519, 1307, 146, 'JOINED', '2023-08-02 01:10:00.000000', '2023-08-02 12:05:12.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21519, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-08-07 06:19:36.000000', '2023-08-07 06:19:36.000000', '2023-08-07 06:24:36.000000');

-- 2023-08-10 01:10:00.000000
-- 2023-08-10
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1308, 82, 151, NULL, 'Analyze Impact on Security Rules', 'This is Analyze Impact on Security Rules', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2023-08-10', '2023-08-11', '2023-08-15', '2023-08-10 01:10:00.000000', '2023-08-10 01:10:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21521, 1308, 146, 'JOINED', '2023-08-10 01:10:00.000000', '2023-08-10 05:22:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21521, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-08-11 07:24:24.000000', '2023-08-11 07:24:24.000000', '2023-08-11 07:29:24.000000');

-- 2023-08-16 01:10:00.000000
-- 2023-08-16
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1309, 82, 151, NULL, 'Analyze Impact on Performance Requirements', 'This is Analyze Impact on Performance Requirements', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2023-08-16', '2023-09-10', '2023-08-23', '2023-08-16 01:10:00.000000', '2023-08-16 01:10:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21523, 1309, 146, 'JOINED', '2023-08-16 01:10:00.000000', '2023-08-22 08:22:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21523, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-09-10 15:52:43.200000', '2023-09-10 15:52:43.200000', '2023-09-10 15:57:43.200000');

-- 2023-08-24 01:10:00.000000
-- 2023-08-24
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1310, 82, 151, NULL, 'Analyze Impact on Error Handling', 'This is Analyze Impact on Error Handling', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2023-08-24', '2023-08-26', '2023-08-29', '2023-08-24 01:10:00.000000', '2023-08-24 01:10:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21525, 1310, 146, 'JOINED', '2023-08-24 01:10:00.000000', '2023-08-24 19:53:12.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21525, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-08-26 14:14:48.000000', '2023-08-26 14:14:48.000000', '2023-08-26 14:19:48.000000');

-- 2023-08-30 01:10:00.000000
-- 2023-08-30
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1311, 82, 151, NULL, 'Identify High-risk Change Areas', 'This is Identify High-risk Change Areas', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2023-08-30', '2023-09-02', '2023-09-06', '2023-08-30 01:10:00.000000', '2023-08-30 01:10:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21527, 1311, 146, 'JOINED', '2023-08-30 01:10:00.000000', '2023-08-30 16:37:21.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21527, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-09-02 00:54:09.600000', '2023-09-02 00:54:09.600000', '2023-09-02 00:59:09.600000');

-- 2023-09-07 01:10:00.000000
-- 2023-09-07
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1312, 82, 151, NULL, 'Identify Required Refactor Scope', 'This is Identify Required Refactor Scope', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2023-09-07', '2023-09-11', '2023-09-12', '2023-09-07 01:10:00.000000', '2023-09-07 01:10:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21529, 1312, 146, 'JOINED', '2023-09-07 01:10:00.000000', '2023-09-08 10:46:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21529, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-09-11 04:53:12.000000', '2023-09-11 04:53:12.000000', '2023-09-11 04:58:12.000000');

-- 2023-09-13 01:10:00.000000
-- 2023-09-13
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1313, 82, 151, NULL, 'Align Changes with Technical Constraints', 'This is Align Changes with Technical Constraints', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2023-09-13', '2023-09-17', '2023-09-20', '2023-09-13 01:10:00.000000', '2023-09-13 01:10:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21531, 1313, 146, 'JOINED', '2023-09-13 01:10:00.000000', '2023-09-14 11:46:28.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21531, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-09-17 01:15:45.600000', '2023-09-17 01:15:45.600000', '2023-09-17 01:20:45.600000');

-- 2023-09-21 01:10:00.000000
-- 2023-09-21
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1314, 82, 151, NULL, 'Align Changes with Product Vision', 'This is Align Changes with Product Vision', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2023-09-21', '2023-09-25', '2023-09-26', '2023-09-21 01:10:00.000000', '2023-09-21 01:10:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21533, 1314, 146, 'JOINED', '2023-09-21 01:10:00.000000', '2023-09-21 01:24:24.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21533, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-09-25 12:12:24.000000', '2023-09-25 12:12:24.000000', '2023-09-25 12:17:24.000000');

-- 2023-09-27 01:10:00.000000
-- 2023-09-27
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1315, 82, 151, NULL, 'Update Impact Analysis Document', 'This is Update Impact Analysis Document', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2023-09-27', '2023-10-01', '2023-10-04', '2023-09-27 01:10:00.000000', '2023-09-27 01:10:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21535, 1315, 146, 'JOINED', '2023-09-27 01:10:00.000000', '2023-09-29 00:12:24.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21535, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-10-01 11:20:33.600000', '2023-10-01 11:20:33.600000', '2023-10-01 11:25:33.600000');

-- 2023-10-05 01:10:00.000000
-- 2023-10-05
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1316, 82, 151, NULL, 'Review Impact Analysis with Tech Team', 'This is Review Impact Analysis with Tech Team', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2023-10-05', '2023-10-09', '2023-10-10', '2023-10-05 01:10:00.000000', '2023-10-05 01:10:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21537, 1316, 146, 'JOINED', '2023-10-05 01:10:00.000000', '2023-10-09 02:14:48.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21537, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-10-09 20:22:00.000000', '2023-10-09 20:22:00.000000', '2023-10-09 20:27:00.000000');

-- 2023-10-11 01:10:00.000000
-- 2023-10-11
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1317, 82, 151, NULL, 'Apply Feedback to Impact Analysis', 'This is Apply Feedback to Impact Analysis', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2023-10-11', '2023-10-16', '2023-10-18', '2023-10-11 01:10:00.000000', '2023-10-11 01:10:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21539, 1317, 146, 'JOINED', '2023-10-11 01:10:00.000000', '2023-10-12 22:01:21.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21539, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-10-16 04:58:57.600000', '2023-10-16 04:58:57.600000', '2023-10-16 05:03:57.600000');

-- 2023-10-19 01:10:00.000000
-- 2023-10-19
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1318, 82, 151, NULL, 'Sign Off Impact Analysis', 'This is Sign Off Impact Analysis', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2023-10-19', '2023-10-23', '2023-10-24', '2023-10-19 01:10:00.000000', '2023-10-19 01:10:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21541, 1318, 146, 'JOINED', '2023-10-19 01:10:00.000000', '2023-10-20 17:29:12.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21541, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-10-23 18:05:12.000000', '2023-10-23 18:05:12.000000', '2023-10-23 18:10:12.000000');

-- 2023-10-25 01:10:00.000000
-- 2023-10-25
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1319, 82, 151, NULL, 'Re-align Roadmap Based on Changes', 'This is Re-align Roadmap Based on Changes', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2023-10-25', '2023-10-29', '2023-11-01', '2023-10-25 01:10:00.000000', '2023-10-25 01:10:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21543, 1319, 146, 'JOINED', '2023-10-25 01:10:00.000000', '2023-10-27 08:46:28.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21543, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-10-29 15:42:38.400000', '2023-10-29 15:42:38.400000', '2023-10-29 15:47:38.400000');

-- 2023-11-02 01:10:00.000000
-- 2023-11-02
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1320, 82, 151, NULL, 'Update Milestone Definitions', 'This is Update Milestone Definitions', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2023-11-02', '2023-11-21', '2023-11-07', '2023-11-02 01:10:00.000000', '2023-11-02 01:10:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21545, 1320, 146, 'JOINED', '2023-11-02 01:10:00.000000', '2023-11-06 13:10:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21545, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-11-21 06:26:48.000000', '2023-11-21 06:26:48.000000', '2023-11-21 06:31:48.000000');

-- 2023-11-08 01:10:00.000000
-- 2023-11-08
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1321, 82, 151, NULL, 'Confirm Delivery Adjustments', 'This is Confirm Delivery Adjustments', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2023-11-08', '2023-11-10', '2023-11-15', '2023-11-08 01:10:00.000000', '2023-11-08 01:10:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21547, 1321, 146, 'JOINED', '2023-11-08 01:10:00.000000', '2023-11-08 01:30:09.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21547, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-11-10 18:00:52.800000', '2023-11-10 18:00:52.800000', '2023-11-10 18:05:52.800000');

-- 2023-11-16 01:10:00.000000
-- 2023-11-16
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1322, 82, 151, NULL, 'Communicate Changes to Stakeholders', 'This is Communicate Changes to Stakeholders', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2023-11-16', '2023-12-01', '2023-11-21', '2023-11-16 01:10:00.000000', '2023-11-16 01:10:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21549, 1322, 146, 'JOINED', '2023-11-16 01:10:00.000000', '2023-11-20 13:10:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21549, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-12-01 10:38:48.000000', '2023-12-01 10:38:48.000000', '2023-12-01 10:43:48.000000');

-- 2023-11-22 01:10:00.000000
-- 2023-11-22
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1323, 82, 151, NULL, 'Confirm Refactor Readiness', 'This is Confirm Refactor Readiness', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2023-11-22', '2023-12-12', '2023-11-29', '2023-11-22 01:10:00.000000', '2023-11-22 01:10:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21551, 1323, 146, 'JOINED', '2023-11-22 01:10:00.000000', '2023-11-28 08:22:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21551, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-12-12 20:27:45.600000', '2023-12-12 20:27:45.600000', '2023-12-12 20:32:45.600000');

-- 2023-11-30 01:10:00.000000
-- 2023-11-30
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1324, 82, 151, NULL, 'Finalize Change Alignment', 'This is Finalize Change Alignment', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2023-11-30', '2023-12-04', '2023-12-05', '2023-11-30 01:10:00.000000', '2023-11-30 01:10:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21553, 1324, 146, 'JOINED', '2023-11-30 01:10:00.000000', '2023-11-30 03:05:12.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21553, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-12-04 00:26:48.000000', '2023-12-04 00:26:48.000000', '2023-12-04 00:31:48.000000');

INSERT INTO collection (`id`, `created_time`, `description`, `due_date`, `start_date`, `name`, `updated_time`, `phase_id`, `created_by_id`)
VALUES (83, '2023-12-05 01:10:00.000000', 'This is Documentation & Approval', '2024-05-05', '2023-12-05', 'Documentation & Approval', '2023-12-05 01:10:00.000000', 16, 154);


-- 2023-12-06 01:15:00.000000
-- 2023-12-06
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1325, 83, 151, NULL, 'Update Business Requirement Document', 'This is Update Business Requirement Document', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2023-12-06', '2023-12-10', '2023-12-13', '2023-12-06 01:15:00.000000', '2023-12-06 01:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21555, 1325, 146, 'JOINED', '2023-12-06 01:15:00.000000', '2023-12-07 00:36:07.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21555, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-12-10 23:41:24.000000', '2023-12-10 23:41:24.000000', '2023-12-10 23:46:24.000000');

-- 2023-12-14 01:15:00.000000
-- 2023-12-14
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1326, 83, 151, NULL, 'Update Business Rules Specification', 'This is Update Business Rules Specification', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2023-12-14', '2023-12-18', '2023-12-19', '2023-12-14 01:15:00.000000', '2023-12-14 01:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21557, 1326, 146, 'JOINED', '2023-12-14 01:15:00.000000', '2023-12-14 11:05:24.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21557, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-12-18 20:55:48.000000', '2023-12-18 20:55:48.000000', '2023-12-18 21:00:48.000000');

-- 2023-12-20 01:15:00.000000
-- 2023-12-20
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1327, 83, 151, NULL, 'Update Process Flow Diagrams', 'This is Update Process Flow Diagrams', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'HIGH', FALSE, '2023-12-20', '2024-01-09', '2023-12-27', '2023-12-20 01:15:00.000000', '2023-12-20 01:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21559, 1327, 146, 'JOINED', '2023-12-20 01:15:00.000000', '2023-12-26 08:27:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21559, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-09 13:39:28.800000', '2024-01-09 13:39:28.800000', '2024-01-09 13:44:28.800000');

-- 2023-12-28 01:15:00.000000
-- 2023-12-28
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1328, 83, 151, NULL, 'Update Data Definition Documents', 'This is Update Data Definition Documents', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2023-12-28', '2023-12-29', '2024-01-02', '2023-12-28 01:15:00.000000', '2023-12-28 01:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21561, 1328, 146, 'JOINED', '2023-12-28 01:15:00.000000', '2023-12-28 18:17:24.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21561, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-12-29 14:48:36.000000', '2023-12-29 14:48:36.000000', '2023-12-29 14:53:36.000000');

-- 2024-01-03 01:15:00.000000
-- 2024-01-03
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1329, 83, 151, NULL, 'Update API-related BA Notes', 'This is Update API-related BA Notes', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2024-01-03', '2024-01-06', '2024-01-09', '2024-01-03 01:15:00.000000', '2024-01-03 01:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21563, 1329, 146, 'JOINED', '2024-01-03 01:15:00.000000', '2024-01-03 18:05:52.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21563, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-06 15:39:00.000000', '2024-01-06 15:39:00.000000', '2024-01-06 15:44:00.000000');

-- 2024-01-10 01:15:00.000000
-- 2024-01-10
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1330, 83, 151, NULL, 'Review Updated Documents Internally', 'This is Review Updated Documents Internally', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2024-01-10', '2024-01-11', '2024-01-15', '2024-01-10 01:15:00.000000', '2024-01-10 01:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21565, 1330, 146, 'JOINED', '2024-01-10 01:15:00.000000', '2024-01-10 01:51:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21565, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-11 01:22:12.000000', '2024-01-11 01:22:12.000000', '2024-01-11 01:27:12.000000');

-- 2024-01-16 01:15:00.000000
-- 2024-01-16
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1331, 83, 151, NULL, 'Review Updated Documents with BE Team', 'This is Review Updated Documents with BE Team', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2024-01-16', '2024-01-20', '2024-01-22', '2024-01-16 01:15:00.000000', '2024-01-16 01:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21567, 1331, 146, 'JOINED', '2024-01-16 01:15:00.000000', '2024-01-18 20:03:57.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21567, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-20 08:03:57.600000', '2024-01-20 08:03:57.600000', '2024-01-20 08:08:57.600000');

-- 2024-01-23 01:15:00.000000
-- 2024-01-23
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1332, 83, 151, NULL, 'Review Updated Documents with FE Team', 'This is Review Updated Documents with FE Team', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'LOW', FALSE, '2024-01-23', '2024-01-27', '2024-01-28', '2024-01-23 01:15:00.000000', '2024-01-23 01:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21569, 1332, 146, 'JOINED', '2024-01-23 01:15:00.000000', '2024-01-25 22:15:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21569, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-27 09:31:48.000000', '2024-01-27 09:31:48.000000', '2024-01-27 09:36:48.000000');

-- 2024-01-29 01:15:00.000000
-- 2024-01-29
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1333, 83, 151, NULL, 'Apply Review Feedback', 'This is Apply Review Feedback', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2024-01-29', '2024-01-30', '2024-02-04', '2024-01-29 01:15:00.000000', '2024-01-29 01:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21571, 1333, 146, 'JOINED', '2024-01-29 01:15:00.000000', '2024-01-29 02:58:40.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21571, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-01-30 06:46:12.000000', '2024-01-30 06:46:12.000000', '2024-01-30 06:51:12.000000');

-- 2024-02-05 01:15:00.000000
-- 2024-02-05
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1334, 83, 151, NULL, 'Resolve Documentation Conflicts', 'This is Resolve Documentation Conflicts', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2024-02-05', '2024-02-16', '2024-02-11', '2024-02-05 01:15:00.000000', '2024-02-05 01:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21573, 1334, 146, 'JOINED', '2024-02-05 01:15:00.000000', '2024-02-05 04:59:38.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21573, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-16 21:30:21.600000', '2024-02-16 21:30:21.600000', '2024-02-16 21:35:21.600000');

-- 2024-02-12 01:15:00.000000
-- 2024-02-12
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1335, 83, 151, NULL, 'Prepare Client Review Session', 'This is Prepare Client Review Session', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2024-02-12', '2024-02-15', '2024-02-18', '2024-02-12 01:15:00.000000', '2024-02-12 01:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21575, 1335, 146, 'JOINED', '2024-02-12 01:15:00.000000', '2024-02-14 04:39:28.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21575, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-15 11:45:43.200000', '2024-02-15 11:45:43.200000', '2024-02-15 11:50:43.200000');

-- 2024-02-19 01:15:00.000000
-- 2024-02-19
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1336, 83, 151, NULL, 'Present Refactor Changes to Client', 'This is Present Refactor Changes to Client', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2024-02-19', '2024-02-23', '2024-02-25', '2024-02-19 01:15:00.000000', '2024-02-19 01:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21577, 1336, 146, 'JOINED', '2024-02-19 01:15:00.000000', '2024-02-20 11:05:24.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21577, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-23 01:00:36.000000', '2024-02-23 01:00:36.000000', '2024-02-23 01:05:36.000000');

-- 2024-02-26 01:15:00.000000
-- 2024-02-26
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1337, 83, 151, NULL, 'Collect Client Feedback', 'This is Collect Client Feedback', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2024-02-26', '2024-02-28', '2024-03-03', '2024-02-26 01:15:00.000000', '2024-02-26 01:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21579, 1337, 146, 'JOINED', '2024-02-26 01:15:00.000000', '2024-02-27 02:01:04.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21579, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-02-28 11:08:16.800000', '2024-02-28 11:08:16.800000', '2024-02-28 11:13:16.800000');

-- 2024-03-04 01:15:00.000000
-- 2024-03-04
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1338, 83, 151, NULL, 'Apply Client Feedback', 'This is Apply Client Feedback', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2024-03-04', '2024-03-09', '2024-03-10', '2024-03-04 01:15:00.000000', '2024-03-04 01:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21581, 1338, 146, 'JOINED', '2024-03-04 01:15:00.000000', '2024-03-08 04:53:52.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21581, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-09 16:02:02.400000', '2024-03-09 16:02:02.400000', '2024-03-09 16:07:02.400000');

-- 2024-03-11 01:15:00.000000
-- 2024-03-11
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1339, 83, 151, NULL, 'Confirm Client Acceptance', 'This is Confirm Client Acceptance', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2024-03-11', '2024-03-14', '2024-03-17', '2024-03-11 01:15:00.000000', '2024-03-11 01:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21583, 1339, 146, 'JOINED', '2024-03-11 01:15:00.000000', '2024-03-11 15:04:26.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21583, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-14 00:31:48.000000', '2024-03-14 00:31:48.000000', '2024-03-14 00:36:48.000000');

-- 2024-03-18 01:15:00.000000
-- 2024-03-18
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1340, 83, 151, NULL, 'Finalize Approved Documents', 'This is Finalize Approved Documents', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2024-03-18', '2024-03-22', '2024-03-24', '2024-03-18 01:15:00.000000', '2024-03-18 01:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21585, 1340, 146, 'JOINED', '2024-03-18 01:15:00.000000', '2024-03-20 09:24:36.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21585, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-22 03:18:50.400000', '2024-03-22 03:18:50.400000', '2024-03-22 03:23:50.400000');

-- 2024-03-25 01:15:00.000000
-- 2024-03-25
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1341, 83, 151, NULL, 'Archive Previous Versions', 'This is Archive Previous Versions', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2024-03-25', '2024-03-28', '2024-03-31', '2024-03-25 01:15:00.000000', '2024-03-25 01:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21587, 1341, 146, 'JOINED', '2024-03-25 01:15:00.000000', '2024-03-25 19:06:21.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21587, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-03-28 03:07:19.200000', '2024-03-28 03:07:19.200000', '2024-03-28 03:12:19.200000');

-- 2024-04-01 01:15:00.000000
-- 2024-04-01
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1342, 83, 151, NULL, 'Sign Off Client Requests #1', 'This is Sign Off Client Requests #1', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2024-04-01', '2024-04-03', '2024-04-07', '2024-04-01 01:15:00.000000', '2024-04-01 01:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21589, 1342, 146, 'JOINED', '2024-04-01 01:15:00.000000', '2024-04-01 22:25:04.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21589, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-03 17:28:26.400000', '2024-04-03 17:28:26.400000', '2024-04-03 17:33:26.400000');

-- 2024-04-08 01:15:00.000000
-- 2024-04-08
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1343, 83, 151, NULL, 'Prepare Handover to Implementation', 'This is Prepare Handover to Implementation', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2024-04-08', '2024-04-10', '2024-04-14', '2024-04-08 01:15:00.000000', '2024-04-08 01:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21591, 1343, 146, 'JOINED', '2024-04-08 01:15:00.000000', '2024-04-08 19:40:55.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21591, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-10 17:19:48.000000', '2024-04-10 17:19:48.000000', '2024-04-10 17:24:48.000000');

-- 2024-04-15 01:15:00.000000
-- 2024-04-15
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1344, 83, 151, NULL, 'Close Phase Client Requests #1', 'This is Close Phase Client Requests #1', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2024-04-15', '2024-05-05', '2024-04-21', '2024-04-15 01:15:00.000000', '2024-04-15 01:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21593, 1344, 146, 'JOINED', '2024-04-15 01:15:00.000000', '2024-04-20 10:51:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21593, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-05 06:31:48.000000', '2024-05-05 06:31:48.000000', '2024-05-05 06:36:48.000000');

INSERT INTO `phase` (`id`, `created_time`, `description`, `due_date`, `start_date`, `name`, `updated_time`, `project_id`, `created_by_id`)
VALUES (17, '2024-04-21 01:15:00.000000', 'This is Client Requests #2', '2024-06-08', '2024-04-21', 'Client Requests #2', '2024-04-21 01:15:00.000000', 5, 154);


INSERT INTO collection (`id`, `created_time`, `description`, `due_date`, `start_date`, `name`, `updated_time`, `phase_id`, `created_by_id`)
VALUES (84, '2024-04-21 01:20:00.000000', 'This is Additional Change Requests', '2024-06-08', '2024-04-21', 'Additional Change Requests', '2024-04-21 01:20:00.000000', 17, 154);


-- 2024-04-22 01:25:00.000000
-- 2024-04-22
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1345, 84, 151, NULL, 'Analyze New Client Feedback Round', 'This is Analyze New Client Feedback Round', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2024-04-22', '2024-04-26', '2024-04-28', '2024-04-22 01:25:00.000000', '2024-04-22 01:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21595, 1345, 146, 'JOINED', '2024-04-22 01:25:00.000000', '2024-04-24 23:49:57.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21595, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-04-26 03:28:50.400000', '2024-04-26 03:28:50.400000', '2024-04-26 03:33:50.400000');

-- 2024-04-29 01:25:00.000000
-- 2024-04-29
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1346, 84, 151, NULL, 'Identify Late-stage Requirement Changes', 'This is Identify Late-stage Requirement Changes', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2024-04-29', '2024-05-02', '2024-05-05', '2024-04-29 01:25:00.000000', '2024-04-29 01:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21597, 1346, 146, 'JOINED', '2024-04-29 01:25:00.000000', '2024-05-01 09:34:36.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21597, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-02 07:45:09.600000', '2024-05-02 07:45:09.600000', '2024-05-02 07:50:09.600000');

-- 2024-05-06 01:25:00.000000
-- 2024-05-06
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1347, 84, 151, NULL, 'Clarify Urgent Business Adjustments', 'This is Clarify Urgent Business Adjustments', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2024-05-06', '2024-05-24', '2024-05-12', '2024-05-06 01:25:00.000000', '2024-05-06 01:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21599, 1347, 146, 'JOINED', '2024-05-06 01:25:00.000000', '2024-05-11 11:01:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21599, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-24 08:37:00.000000', '2024-05-24 08:37:00.000000', '2024-05-24 08:42:00.000000');

-- 2024-05-13 01:25:00.000000
-- 2024-05-13
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1348, 84, 151, NULL, 'Analyze Change Impact on Existing Refactor', 'This is Analyze Change Impact on Existing Refactor', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2024-05-13', '2024-05-14', '2024-05-19', '2024-05-13 01:25:00.000000', '2024-05-13 01:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21601, 1348, 146, 'JOINED', '2024-05-13 01:25:00.000000', '2024-05-13 10:12:02.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21601, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-14 17:26:55.200000', '2024-05-14 17:26:55.200000', '2024-05-14 17:31:55.200000');

-- 2024-05-20 01:25:00.000000
-- 2024-05-20
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1349, 84, 151, NULL, 'Identify Scope Creep Risks', 'This is Identify Scope Creep Risks', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2024-05-20', '2024-05-24', '2024-05-26', '2024-05-20 01:25:00.000000', '2024-05-20 01:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21603, 1349, 146, 'JOINED', '2024-05-20 01:25:00.000000', '2024-05-22 07:25:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21603, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-24 00:10:07.200000', '2024-05-24 00:10:07.200000', '2024-05-24 00:15:07.200000');

-- 2024-05-27 01:25:00.000000
-- 2024-05-27
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1350, 84, 151, NULL, 'Negotiate Change Boundaries', 'This is Negotiate Change Boundaries', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2024-05-27', '2024-05-31', '2024-06-02', '2024-05-27 01:25:00.000000', '2024-05-27 01:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21605, 1350, 146, 'JOINED', '2024-05-27 01:25:00.000000', '2024-05-29 11:52:50.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21605, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-05-31 05:38:26.400000', '2024-05-31 05:38:26.400000', '2024-05-31 05:43:26.400000');

-- 2024-06-03 01:25:00.000000
-- 2024-06-03
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1351, 84, 151, NULL, 'Update Priority Based on Urgency', 'This is Update Priority Based on Urgency', NULL, 'HARD', 'BUSINESS_ANALYSIS', 'NORMAL', FALSE, '2024-06-03', '2024-06-08', '2024-06-09', '2024-06-03 01:25:00.000000', '2024-06-03 01:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(21607, 1351, 146, 'JOINED', '2024-06-03 01:25:00.000000', '2024-06-06 01:50:55.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 21607, 'Employee 146 submit Report', 'Completed Task.', NULL, 'APPROVED', '2024-06-08 07:25:00.000000', '2024-06-08 07:25:00.000000', '2024-06-08 07:30:00.000000');

ALTER TABLE project AUTO_INCREMENT = 6;
ALTER TABLE project_role AUTO_INCREMENT = 11;
ALTER TABLE `phase` AUTO_INCREMENT = 18;
ALTER TABLE collection AUTO_INCREMENT = 85;
ALTER TABLE task AUTO_INCREMENT = 1352;
ALTER TABLE task_for_users AUTO_INCREMENT = 21609;
ALTER TABLE report AUTO_INCREMENT = 21609;

COMMIT;
