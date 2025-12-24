
START TRANSACTION;

INSERT INTO project (`id`, `created_time`, `description`, `due_date`, `expected_start_date`, `name`, `status`, `updated_time`, `created_by_id`)
VALUES (4, '2020-01-01 00:00:00.000000', 'This is CVWritingSupporter HumanResources', '2023-11-15', '2020-01-01', 'CVWritingSupporter HumanResources', 'IN_PROGRESS', '2020-01-01 00:00:00.000000', 154);


INSERT INTO project_role (`id`, `role`, `project_id`, `user_info_id`) VALUES (7, 'OWNER', 4, 154);
INSERT INTO project_role (`id`, `role`, `project_id`, `user_info_id`) VALUES (8, 'MEMBER', 4, 151);


INSERT INTO `phase` (`id`, `created_time`, `description`, `due_date`, `start_date`, `name`, `updated_time`, `project_id`, `created_by_id`)
VALUES (11, '2020-01-01 00:05:00.000000', 'This is Onsite & Employee Documentation', '2021-11-25', '2020-01-01', 'Onsite & Employee Documentation', '2020-01-01 00:05:00.000000', 4, 154);


INSERT INTO collection (`id`, `created_time`, `description`, `due_date`, `start_date`, `name`, `updated_time`, `phase_id`, `created_by_id`)
VALUES (62, '2020-01-01 00:10:00.000000', 'This is Onsite Preparation Documents', '2020-09-23', '2020-01-01', 'Onsite Preparation Documents', '2020-01-01 00:10:00.000000', 11, 154);


-- 2020-01-02 00:15:00.000000
-- 2020-01-02
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (870, 62, 151, NULL, 'Collect Employee Personal Documents', 'This is Collect Employee Personal Documents', NULL, 'ADVANCED', 'HR', 'LOW', FALSE, '2020-01-02', '2020-01-05', '2020-01-06', '2020-01-02 00:15:00.000000', '2020-01-02 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19324, 870, 142, 'JOINED', '2020-01-02 00:15:00.000000', '2020-01-03 03:25:04.800000'),
(19325, 870, 143, 'JOINED', '2020-01-02 00:15:00.000000', '2020-01-02 13:29:52.800000'),
(19326, 870, 144, 'JOINED', '2020-01-02 00:15:00.000000', '2020-01-02 08:53:24.000000'),
(19327, 870, 145, 'JOINED', '2020-01-02 00:15:00.000000', '2020-01-02 05:31:48.000000'),
(19328, 870, 141, 'JOINED', '2020-01-02 00:15:00.000000', '2020-01-03 16:45:43.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19324, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-01-04 17:08:45.600000', '2020-01-04 17:08:45.600000', '2020-01-04 17:13:45.600000'),
(DEFAULT, 19325, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-01-04 05:03:00.000000', '2020-01-04 05:03:00.000000', '2020-01-04 05:08:00.000000'),
(DEFAULT, 19326, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-01-03 12:32:16.800000', '2020-01-03 12:32:16.800000', '2020-01-03 12:37:16.800000'),
(DEFAULT, 19327, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-01-03 13:47:09.600000', '2020-01-03 13:47:09.600000', '2020-01-03 13:52:09.600000'),
(DEFAULT, 19328, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-01-05 09:51:00.000000', '2020-01-05 09:51:00.000000', '2020-01-05 09:56:00.000000');

-- 2020-01-07 00:15:00.000000
-- 2020-01-07
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (871, 62, 151, NULL, 'Verify Employee ID Copies', 'This is Verify Employee ID Copies', NULL, 'HARD', 'HR', 'URGENT', FALSE, '2020-01-07', '2020-02-06', '2020-01-15', '2020-01-07 00:15:00.000000', '2020-01-07 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19330, 871, 141, 'JOINED', '2020-01-07 00:15:00.000000', '2020-01-14 05:03:00.000000'),
(19331, 871, 142, 'JOINED', '2020-01-07 00:15:00.000000', '2020-01-14 05:03:00.000000'),
(19332, 871, 143, 'JOINED', '2020-01-07 00:15:00.000000', '2020-01-07 23:00:07.200000'),
(19333, 871, 144, 'JOINED', '2020-01-07 00:15:00.000000', '2020-01-11 10:14:02.400000'),
(19334, 871, 145, 'JOINED', '2020-01-07 00:15:00.000000', '2020-01-07 19:15:28.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19330, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-06 13:52:55.200000', '2020-02-06 13:52:55.200000', '2020-02-06 13:57:55.200000'),
(DEFAULT, 19331, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-01-31 17:31:48.000000', '2020-01-31 17:31:48.000000', '2020-01-31 17:36:48.000000'),
(DEFAULT, 19332, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-01-22 01:29:52.800000', '2020-01-22 01:29:52.800000', '2020-01-22 01:34:52.800000'),
(DEFAULT, 19333, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-01-14 21:33:43.200000', '2020-01-14 21:33:43.200000', '2020-01-14 21:38:43.200000'),
(DEFAULT, 19334, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-01-10 10:14:02.400000', '2020-01-10 10:14:02.400000', '2020-01-10 10:19:02.400000');

-- 2020-01-16 00:15:00.000000
-- 2020-01-16
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (872, 62, 151, NULL, 'Prepare Passport Scan Files', 'This is Prepare Passport Scan Files', NULL, 'HARD', 'HR', 'URGENT', FALSE, '2020-01-16', '2020-02-09', '2020-01-24', '2020-01-16 00:15:00.000000', '2020-01-16 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19336, 872, 141, 'JOINED', '2020-01-16 00:15:00.000000', '2020-01-16 13:35:38.400000'),
(19337, 872, 142, 'JOINED', '2020-01-16 00:15:00.000000', '2020-01-17 15:59:38.400000'),
(19338, 872, 143, 'JOINED', '2020-01-16 00:15:00.000000', '2020-01-23 05:03:00.000000'),
(19339, 872, 144, 'JOINED', '2020-01-16 00:15:00.000000', '2020-01-17 23:17:24.000000'),
(19340, 872, 145, 'JOINED', '2020-01-16 00:15:00.000000', '2020-01-20 16:57:14.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19336, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-01-31 10:54:21.600000', '2020-01-31 10:54:21.600000', '2020-01-31 10:59:21.600000'),
(DEFAULT, 19337, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-01-30 08:30:21.600000', '2020-01-30 08:30:21.600000', '2020-01-30 08:35:21.600000'),
(DEFAULT, 19338, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-09 10:48:36.000000', '2020-02-09 10:48:36.000000', '2020-02-09 10:53:36.000000'),
(DEFAULT, 19339, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-01-19 08:07:19.200000', '2020-01-19 08:07:19.200000', '2020-01-19 08:12:19.200000'),
(DEFAULT, 19340, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-01-27 07:32:45.600000', '2020-01-27 07:32:45.600000', '2020-01-27 07:37:45.600000');

-- 2020-01-25 00:15:00.000000
-- 2020-01-25
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (873, 62, 151, NULL, 'Collect Visa Application Forms', 'This is Collect Visa Application Forms', NULL, 'HARD', 'HR', 'HIGH', FALSE, '2020-01-25', '2020-02-07', '2020-02-01', '2020-01-25 00:15:00.000000', '2020-01-25 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19342, 873, 141, 'JOINED', '2020-01-25 00:15:00.000000', '2020-01-25 04:57:14.400000'),
(19343, 873, 142, 'JOINED', '2020-01-25 00:15:00.000000', '2020-01-25 07:23:24.000000'),
(19344, 873, 143, 'JOINED', '2020-01-25 00:15:00.000000', '2020-01-27 02:59:09.600000'),
(19345, 873, 144, 'JOINED', '2020-01-25 00:15:00.000000', '2020-01-26 18:55:19.200000'),
(19346, 873, 145, 'JOINED', '2020-01-25 00:15:00.000000', '2020-01-25 20:54:50.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19342, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-07 19:32:45.600000', '2020-02-07 19:32:45.600000', '2020-02-07 19:37:45.600000'),
(DEFAULT, 19343, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-07 17:06:36.000000', '2020-02-07 17:06:36.000000', '2020-02-07 17:11:36.000000'),
(DEFAULT, 19344, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-01-29 18:09:14.400000', '2020-01-29 18:09:14.400000', '2020-01-29 18:14:14.400000'),
(DEFAULT, 19345, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-01-29 03:22:12.000000', '2020-01-29 03:22:12.000000', '2020-01-29 03:27:12.000000'),
(DEFAULT, 19346, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-01-27 00:38:02.400000', '2020-01-27 00:38:02.400000', '2020-01-27 00:43:02.400000');

-- 2020-02-02 00:15:00.000000
-- 2020-02-02
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (874, 62, 151, NULL, 'Review Visa Supporting Documents', 'This is Review Visa Supporting Documents', NULL, 'HARD', 'HR', 'HIGH', FALSE, '2020-02-02', '2020-02-24', '2020-02-09', '2020-02-02 00:15:00.000000', '2020-02-02 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19348, 874, 141, 'JOINED', '2020-02-02 00:15:00.000000', '2020-02-08 07:27:00.000000'),
(19349, 874, 142, 'JOINED', '2020-02-02 00:15:00.000000', '2020-02-02 03:46:40.800000'),
(19350, 874, 143, 'JOINED', '2020-02-02 00:15:00.000000', '2020-02-02 10:50:02.400000'),
(19351, 874, 144, 'JOINED', '2020-02-02 00:15:00.000000', '2020-02-03 17:14:31.200000'),
(19352, 874, 145, 'JOINED', '2020-02-02 00:15:00.000000', '2020-02-05 11:34:40.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19348, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-24 07:09:43.200000', '2020-02-24 07:09:43.200000', '2020-02-24 07:14:43.200000'),
(DEFAULT, 19349, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-15 20:43:19.200000', '2020-02-15 20:43:19.200000', '2020-02-15 20:48:19.200000'),
(DEFAULT, 19350, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-06 05:03:00.000000', '2020-02-06 05:03:00.000000', '2020-02-06 05:08:00.000000'),
(DEFAULT, 19351, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-06 18:19:19.200000', '2020-02-06 18:19:19.200000', '2020-02-06 18:24:19.200000'),
(DEFAULT, 19352, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-08 14:00:07.200000', '2020-02-08 14:00:07.200000', '2020-02-08 14:05:07.200000');

-- 2020-02-10 00:15:00.000000
-- 2020-02-10
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (875, 62, 151, NULL, 'Prepare Onsite Invitation Letters', 'This is Prepare Onsite Invitation Letters', NULL, 'HARD', 'HR', 'HIGH', FALSE, '2020-02-10', '2020-02-23', '2020-02-17', '2020-02-10 00:15:00.000000', '2020-02-10 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19354, 875, 141, 'JOINED', '2020-02-10 00:15:00.000000', '2020-02-10 11:25:19.200000'),
(19355, 875, 142, 'JOINED', '2020-02-10 00:15:00.000000', '2020-02-14 15:48:07.200000'),
(19356, 875, 143, 'JOINED', '2020-02-10 00:15:00.000000', '2020-02-10 12:00:36.000000'),
(19357, 875, 144, 'JOINED', '2020-02-10 00:15:00.000000', '2020-02-11 11:16:40.800000'),
(19358, 875, 145, 'JOINED', '2020-02-10 00:15:00.000000', '2020-02-11 11:51:57.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19354, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-23 13:04:40.800000', '2020-02-23 13:04:40.800000', '2020-02-23 13:09:40.800000'),
(DEFAULT, 19355, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-16 22:14:02.400000', '2020-02-16 22:14:02.400000', '2020-02-16 22:19:02.400000'),
(DEFAULT, 19356, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-13 14:36:07.200000', '2020-02-13 14:36:07.200000', '2020-02-13 14:41:07.200000'),
(DEFAULT, 19357, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-22 13:13:19.200000', '2020-02-22 13:13:19.200000', '2020-02-22 13:18:19.200000'),
(DEFAULT, 19358, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-12 14:14:31.200000', '2020-02-12 14:14:31.200000', '2020-02-12 14:19:31.200000');

-- 2020-02-18 00:15:00.000000
-- 2020-02-18
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (876, 62, 151, NULL, 'Collect Employment Contracts', 'This is Collect Employment Contracts', NULL, 'HARD', 'HR', 'HIGH', FALSE, '2020-02-18', '2020-03-01', '2020-02-25', '2020-02-18 00:15:00.000000', '2020-02-18 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19360, 876, 141, 'JOINED', '2020-02-18 00:15:00.000000', '2020-02-18 02:46:12.000000'),
(19361, 876, 142, 'JOINED', '2020-02-18 00:15:00.000000', '2020-02-19 03:48:07.200000'),
(19362, 876, 143, 'JOINED', '2020-02-18 00:15:00.000000', '2020-02-19 17:14:31.200000'),
(19363, 876, 144, 'JOINED', '2020-02-18 00:15:00.000000', '2020-02-20 05:40:26.400000'),
(19364, 876, 145, 'JOINED', '2020-02-18 00:15:00.000000', '2020-02-19 10:01:04.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19360, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-20 09:02:02.400000', '2020-02-20 09:02:02.400000', '2020-02-20 09:07:02.400000'),
(DEFAULT, 19361, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-22 09:04:55.200000', '2020-02-22 09:04:55.200000', '2020-02-22 09:09:55.200000'),
(DEFAULT, 19362, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-01 07:15:28.800000', '2020-03-01 07:15:28.800000', '2020-03-01 07:20:28.800000'),
(DEFAULT, 19363, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-23 16:09:43.200000', '2020-02-23 16:09:43.200000', '2020-02-23 16:14:43.200000'),
(DEFAULT, 19364, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-02-20 21:27:57.600000', '2020-02-20 21:27:57.600000', '2020-02-20 21:32:57.600000');

-- 2020-02-26 00:15:00.000000
-- 2020-02-26
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (877, 62, 151, NULL, 'Verify Contract Validity Period', 'This is Verify Contract Validity Period', NULL, 'HARD', 'HR', 'HIGH', FALSE, '2020-02-26', '2020-03-09', '2020-03-04', '2020-02-26 00:15:00.000000', '2020-02-26 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19366, 877, 141, 'JOINED', '2020-02-26 00:15:00.000000', '2020-02-27 16:24:07.200000'),
(19367, 877, 142, 'JOINED', '2020-02-26 00:15:00.000000', '2020-02-27 15:23:38.400000'),
(19368, 877, 143, 'JOINED', '2020-02-26 00:15:00.000000', '2020-02-27 10:26:16.800000'),
(19369, 877, 144, 'JOINED', '2020-02-26 00:15:00.000000', '2020-03-02 14:28:55.200000'),
(19370, 877, 145, 'JOINED', '2020-02-26 00:15:00.000000', '2020-02-29 05:51:57.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19366, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-09 08:05:52.800000', '2020-03-09 08:05:52.800000', '2020-03-09 08:10:52.800000'),
(DEFAULT, 19367, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-09 09:06:21.600000', '2020-03-09 09:06:21.600000', '2020-03-09 09:11:21.600000'),
(DEFAULT, 19368, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-09 14:03:43.200000', '2020-03-09 14:03:43.200000', '2020-03-09 14:08:43.200000'),
(DEFAULT, 19369, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-03 16:11:09.600000', '2020-03-03 16:11:09.600000', '2020-03-03 16:16:09.600000'),
(DEFAULT, 19370, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-01 22:01:04.800000', '2020-03-01 22:01:04.800000', '2020-03-01 22:06:04.800000');

-- 2020-03-05 00:15:00.000000
-- 2020-03-05
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (878, 62, 151, NULL, 'Prepare Assignment Decision Documents', 'This is Prepare Assignment Decision Documents', NULL, 'HARD', 'HR', 'HIGH', FALSE, '2020-03-05', '2020-03-29', '2020-03-12', '2020-03-05 00:15:00.000000', '2020-03-05 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19372, 878, 141, 'JOINED', '2020-03-05 00:15:00.000000', '2020-03-05 06:58:12.000000'),
(19373, 878, 142, 'JOINED', '2020-03-05 00:15:00.000000', '2020-03-05 10:45:00.000000'),
(19374, 878, 143, 'JOINED', '2020-03-05 00:15:00.000000', '2020-03-11 07:27:00.000000'),
(19375, 878, 144, 'JOINED', '2020-03-05 00:15:00.000000', '2020-03-06 10:21:14.400000'),
(19376, 878, 145, 'JOINED', '2020-03-05 00:15:00.000000', '2020-03-07 20:47:38.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19372, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-07 14:34:40.800000', '2020-03-07 14:34:40.800000', '2020-03-07 14:39:40.800000'),
(DEFAULT, 19373, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-18 13:45:00.000000', '2020-03-18 13:45:00.000000', '2020-03-18 13:50:00.000000'),
(DEFAULT, 19374, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-29 17:07:19.200000', '2020-03-29 17:07:19.200000', '2020-03-29 17:12:19.200000'),
(DEFAULT, 19375, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-07 21:07:48.000000', '2020-03-07 21:07:48.000000', '2020-03-07 21:12:48.000000'),
(DEFAULT, 19376, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-09 23:21:43.200000', '2020-03-09 23:21:43.200000', '2020-03-09 23:26:43.200000');

-- 2020-03-13 00:15:00.000000
-- 2020-03-13
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (879, 62, 151, NULL, 'Collect Health Check Certificates', 'This is Collect Health Check Certificates', NULL, 'HARD', 'HR', 'HIGH', FALSE, '2020-03-13', '2020-04-07', '2020-03-20', '2020-03-13 00:15:00.000000', '2020-03-13 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19378, 879, 141, 'JOINED', '2020-03-13 00:15:00.000000', '2020-03-19 07:27:00.000000'),
(19379, 879, 142, 'JOINED', '2020-03-13 00:15:00.000000', '2020-03-17 10:25:33.600000'),
(19380, 879, 143, 'JOINED', '2020-03-13 00:15:00.000000', '2020-03-19 07:27:00.000000'),
(19381, 879, 144, 'JOINED', '2020-03-13 00:15:00.000000', '2020-03-13 07:08:16.800000'),
(19382, 879, 145, 'JOINED', '2020-03-13 00:15:00.000000', '2020-03-13 10:29:52.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19378, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-07 03:32:16.800000', '2020-04-07 03:32:16.800000', '2020-04-07 03:37:16.800000'),
(DEFAULT, 19379, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-19 15:20:45.600000', '2020-03-19 15:20:45.600000', '2020-03-19 15:25:45.600000'),
(DEFAULT, 19380, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-07 16:38:31.200000', '2020-04-07 16:38:31.200000', '2020-04-07 16:43:31.200000'),
(DEFAULT, 19381, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-14 17:44:45.600000', '2020-03-14 17:44:45.600000', '2020-03-14 17:49:45.600000'),
(DEFAULT, 19382, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-15 02:39:00.000000', '2020-03-15 02:39:00.000000', '2020-03-15 02:44:00.000000');

-- 2020-03-21 00:15:00.000000
-- 2020-03-21
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (880, 62, 151, NULL, 'Verify Insurance Coverage', 'This is Verify Insurance Coverage', NULL, 'HARD', 'HR', 'HIGH', FALSE, '2020-03-21', '2020-04-01', '2020-03-28', '2020-03-21 00:15:00.000000', '2020-03-21 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19384, 880, 141, 'JOINED', '2020-03-21 00:15:00.000000', '2020-03-22 03:58:12.000000'),
(19385, 880, 142, 'JOINED', '2020-03-21 00:15:00.000000', '2020-03-22 10:11:09.600000'),
(19386, 880, 143, 'JOINED', '2020-03-21 00:15:00.000000', '2020-03-23 06:40:55.200000'),
(19387, 880, 144, 'JOINED', '2020-03-21 00:15:00.000000', '2020-03-24 16:27:00.000000'),
(19388, 880, 145, 'JOINED', '2020-03-21 00:15:00.000000', '2020-03-24 17:17:24.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19384, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-25 08:54:50.400000', '2020-03-25 08:54:50.400000', '2020-03-25 08:59:50.400000'),
(DEFAULT, 19385, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-27 14:10:12.000000', '2020-03-27 14:10:12.000000', '2020-03-27 14:15:12.000000'),
(DEFAULT, 19386, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-01 17:49:04.800000', '2020-04-01 17:49:04.800000', '2020-04-01 17:54:04.800000'),
(DEFAULT, 19387, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-26 13:48:36.000000', '2020-03-26 13:48:36.000000', '2020-03-26 13:53:36.000000'),
(DEFAULT, 19388, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-27 19:22:40.800000', '2020-03-27 19:22:40.800000', '2020-03-27 19:27:40.800000');

-- 2020-03-29 00:15:00.000000
-- 2020-03-29
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (881, 62, 151, NULL, 'Prepare Onsite Policy Documents', 'This is Prepare Onsite Policy Documents', NULL, 'HARD', 'HR', 'HIGH', FALSE, '2020-03-29', '2020-04-03', '2020-04-05', '2020-03-29 00:15:00.000000', '2020-03-29 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19390, 881, 141, 'JOINED', '2020-03-29 00:15:00.000000', '2020-03-29 13:11:09.600000'),
(19391, 881, 142, 'JOINED', '2020-03-29 00:15:00.000000', '2020-03-29 11:40:26.400000'),
(19392, 881, 143, 'JOINED', '2020-03-29 00:15:00.000000', '2020-03-30 07:29:52.800000'),
(19393, 881, 144, 'JOINED', '2020-03-29 00:15:00.000000', '2020-03-29 17:43:19.200000'),
(19394, 881, 145, 'JOINED', '2020-03-29 00:15:00.000000', '2020-03-30 19:45:43.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19390, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-02 05:13:04.800000', '2020-04-02 05:13:04.800000', '2020-04-02 05:18:04.800000'),
(DEFAULT, 19391, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-31 14:14:31.200000', '2020-03-31 14:14:31.200000', '2020-03-31 14:19:31.200000'),
(DEFAULT, 19392, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-03 18:00:36.000000', '2020-04-03 18:00:36.000000', '2020-04-03 18:05:36.000000'),
(DEFAULT, 19393, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-03-31 22:48:36.000000', '2020-03-31 22:48:36.000000', '2020-03-31 22:53:36.000000'),
(DEFAULT, 19394, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-01 19:08:16.800000', '2020-04-01 19:08:16.800000', '2020-04-01 19:13:16.800000');

-- 2020-04-06 00:15:00.000000
-- 2020-04-06
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (882, 62, 151, NULL, 'Compile Onsite Checklist', 'This is Compile Onsite Checklist', NULL, 'HARD', 'HR', 'HIGH', FALSE, '2020-04-06', '2020-04-19', '2020-04-13', '2020-04-06 00:15:00.000000', '2020-04-06 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19396, 882, 141, 'JOINED', '2020-04-06 00:15:00.000000', '2020-04-08 07:01:04.800000'),
(19397, 882, 142, 'JOINED', '2020-04-06 00:15:00.000000', '2020-04-06 05:42:36.000000'),
(19398, 882, 143, 'JOINED', '2020-04-06 00:15:00.000000', '2020-04-06 00:45:14.400000'),
(19399, 882, 144, 'JOINED', '2020-04-06 00:15:00.000000', '2020-04-09 04:51:28.800000'),
(19400, 882, 145, 'JOINED', '2020-04-06 00:15:00.000000', '2020-04-09 08:03:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19396, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-10 23:41:52.800000', '2020-04-10 23:41:52.800000', '2020-04-10 23:46:52.800000'),
(DEFAULT, 19397, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-19 18:47:24.000000', '2020-04-19 18:47:24.000000', '2020-04-19 18:52:24.000000'),
(DEFAULT, 19398, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-08 09:22:12.000000', '2020-04-08 09:22:12.000000', '2020-04-08 09:27:12.000000'),
(DEFAULT, 19399, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-10 13:37:04.800000', '2020-04-10 13:37:04.800000', '2020-04-10 13:42:04.800000'),
(DEFAULT, 19400, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-10 10:45:43.200000', '2020-04-10 10:45:43.200000', '2020-04-10 10:50:43.200000');

-- 2020-04-14 00:15:00.000000
-- 2020-04-14
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (883, 62, 151, NULL, 'Review Country-specific Regulations', 'This is Review Country-specific Regulations', NULL, 'HARD', 'HR', 'HIGH', FALSE, '2020-04-14', '2020-05-08', '2020-04-21', '2020-04-14 00:15:00.000000', '2020-04-14 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19402, 883, 141, 'JOINED', '2020-04-14 00:15:00.000000', '2020-04-14 14:31:48.000000'),
(19403, 883, 142, 'JOINED', '2020-04-14 00:15:00.000000', '2020-04-20 07:27:00.000000'),
(19404, 883, 143, 'JOINED', '2020-04-14 00:15:00.000000', '2020-04-15 20:05:52.800000'),
(19405, 883, 144, 'JOINED', '2020-04-14 00:15:00.000000', '2020-04-16 06:40:55.200000'),
(19406, 883, 145, 'JOINED', '2020-04-14 00:15:00.000000', '2020-04-14 05:27:28.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19402, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-18 11:26:02.400000', '2020-04-18 11:26:02.400000', '2020-04-18 11:31:02.400000'),
(DEFAULT, 19403, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-08 00:59:38.400000', '2020-05-08 00:59:38.400000', '2020-05-08 01:04:38.400000'),
(DEFAULT, 19404, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-18 02:51:57.600000', '2020-04-18 02:51:57.600000', '2020-04-18 02:56:57.600000'),
(DEFAULT, 19405, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-17 23:00:07.200000', '2020-04-17 23:00:07.200000', '2020-04-17 23:05:07.200000'),
(DEFAULT, 19406, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-16 07:21:14.400000', '2020-04-16 07:21:14.400000', '2020-04-16 07:26:14.400000');

-- 2020-04-22 00:15:00.000000
-- 2020-04-22
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (884, 62, 151, NULL, 'Prepare Travel Authorization Forms', 'This is Prepare Travel Authorization Forms', NULL, 'HARD', 'HR', 'HIGH', FALSE, '2020-04-22', '2020-05-17', '2020-04-29', '2020-04-22 00:15:00.000000', '2020-04-22 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19408, 884, 141, 'JOINED', '2020-04-22 00:15:00.000000', '2020-04-22 13:11:09.600000'),
(19409, 884, 142, 'JOINED', '2020-04-22 00:15:00.000000', '2020-04-22 21:35:09.600000'),
(19410, 884, 143, 'JOINED', '2020-04-22 00:15:00.000000', '2020-04-28 07:27:00.000000'),
(19411, 884, 144, 'JOINED', '2020-04-22 00:15:00.000000', '2020-04-24 02:28:55.200000'),
(19412, 884, 145, 'JOINED', '2020-04-22 00:15:00.000000', '2020-04-25 14:26:02.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19408, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-05 11:18:50.400000', '2020-05-05 11:18:50.400000', '2020-05-05 11:23:50.400000'),
(DEFAULT, 19409, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-25 12:35:09.600000', '2020-04-25 12:35:09.600000', '2020-04-25 12:40:09.600000'),
(DEFAULT, 19410, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-17 20:30:21.600000', '2020-05-17 20:30:21.600000', '2020-05-17 20:35:21.600000'),
(DEFAULT, 19411, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-26 02:41:52.800000', '2020-04-26 02:41:52.800000', '2020-04-26 02:46:52.800000'),
(DEFAULT, 19412, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-04-28 03:04:55.200000', '2020-04-28 03:04:55.200000', '2020-04-28 03:09:55.200000');

-- 2020-04-30 00:15:00.000000
-- 2020-04-30
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (885, 62, 151, NULL, 'Collect Emergency Contact Forms', 'This is Collect Emergency Contact Forms', NULL, 'HARD', 'HR', 'HIGH', FALSE, '2020-04-30', '2020-05-25', '2020-05-07', '2020-04-30 00:15:00.000000', '2020-04-30 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19414, 885, 141, 'JOINED', '2020-04-30 00:15:00.000000', '2020-05-06 07:27:00.000000'),
(19415, 885, 142, 'JOINED', '2020-04-30 00:15:00.000000', '2020-05-02 07:31:19.200000'),
(19416, 885, 143, 'JOINED', '2020-04-30 00:15:00.000000', '2020-05-01 06:59:38.400000'),
(19417, 885, 144, 'JOINED', '2020-04-30 00:15:00.000000', '2020-05-02 22:58:40.800000'),
(19418, 885, 145, 'JOINED', '2020-04-30 00:15:00.000000', '2020-05-01 02:27:28.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19414, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-25 09:15:00.000000', '2020-05-25 09:15:00.000000', '2020-05-25 09:20:00.000000'),
(DEFAULT, 19415, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-11 16:58:40.800000', '2020-05-11 16:58:40.800000', '2020-05-11 17:03:40.800000'),
(DEFAULT, 19416, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-05 02:43:19.200000', '2020-05-05 02:43:19.200000', '2020-05-05 02:48:19.200000'),
(DEFAULT, 19417, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-05 02:03:00.000000', '2020-05-05 02:03:00.000000', '2020-05-05 02:08:00.000000'),
(DEFAULT, 19418, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-03 15:56:45.600000', '2020-05-03 15:56:45.600000', '2020-05-03 16:01:45.600000');

-- 2020-05-08 00:15:00.000000
-- 2020-05-08
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (886, 62, 151, NULL, 'Verify Employee Availability', 'This is Verify Employee Availability', NULL, 'HARD', 'HR', 'HIGH', FALSE, '2020-05-08', '2020-05-12', '2020-05-15', '2020-05-08 00:15:00.000000', '2020-05-08 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19420, 886, 141, 'JOINED', '2020-05-08 00:15:00.000000', '2020-05-08 01:35:38.400000'),
(19421, 886, 142, 'JOINED', '2020-05-08 00:15:00.000000', '2020-05-08 23:36:07.200000'),
(19422, 886, 143, 'JOINED', '2020-05-08 00:15:00.000000', '2020-05-08 03:16:26.400000'),
(19423, 886, 144, 'JOINED', '2020-05-08 00:15:00.000000', '2020-05-08 11:40:26.400000'),
(19424, 886, 145, 'JOINED', '2020-05-08 00:15:00.000000', '2020-05-10 05:00:07.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19420, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-12 21:40:55.200000', '2020-05-12 21:40:55.200000', '2020-05-12 21:45:55.200000'),
(DEFAULT, 19421, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-12 03:12:07.200000', '2020-05-12 03:12:07.200000', '2020-05-12 03:17:07.200000'),
(DEFAULT, 19422, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-11 10:34:12.000000', '2020-05-11 10:34:12.000000', '2020-05-11 10:39:12.000000'),
(DEFAULT, 19423, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-10 00:58:12.000000', '2020-05-10 00:58:12.000000', '2020-05-10 01:03:12.000000'),
(DEFAULT, 19424, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-11 14:56:16.800000', '2020-05-11 14:56:16.800000', '2020-05-11 15:01:16.800000');

-- 2020-05-16 00:15:00.000000
-- 2020-05-16
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (887, 62, 151, NULL, 'Confirm Onsite Duration', 'This is Confirm Onsite Duration', NULL, 'HARD', 'HR', 'HIGH', FALSE, '2020-05-16', '2020-05-29', '2020-05-23', '2020-05-16 00:15:00.000000', '2020-05-16 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19426, 887, 141, 'JOINED', '2020-05-16 00:15:00.000000', '2020-05-17 14:13:04.800000'),
(19427, 887, 142, 'JOINED', '2020-05-16 00:15:00.000000', '2020-05-16 18:28:40.800000'),
(19428, 887, 143, 'JOINED', '2020-05-16 00:15:00.000000', '2020-05-17 17:44:45.600000'),
(19429, 887, 144, 'JOINED', '2020-05-16 00:15:00.000000', '2020-05-17 13:32:45.600000'),
(19430, 887, 145, 'JOINED', '2020-05-16 00:15:00.000000', '2020-05-16 10:50:02.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19426, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-20 15:48:07.200000', '2020-05-20 15:48:07.200000', '2020-05-20 15:53:07.200000'),
(DEFAULT, 19427, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-29 06:01:19.200000', '2020-05-29 06:01:19.200000', '2020-05-29 06:06:19.200000'),
(DEFAULT, 19428, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-20 14:07:19.200000', '2020-05-20 14:07:19.200000', '2020-05-20 14:12:19.200000'),
(DEFAULT, 19429, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-20 22:21:14.400000', '2020-05-20 22:21:14.400000', '2020-05-20 22:26:14.400000'),
(DEFAULT, 19430, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-19 06:42:21.600000', '2020-05-19 06:42:21.600000', '2020-05-19 06:47:21.600000');

-- 2020-05-24 00:15:00.000000
-- 2020-05-24
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (888, 62, 151, NULL, 'Prepare Onsite Timeline Document', 'This is Prepare Onsite Timeline Document', NULL, 'HARD', 'HR', 'HIGH', FALSE, '2020-05-24', '2020-06-19', '2020-05-31', '2020-05-24 00:15:00.000000', '2020-05-24 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19432, 888, 141, 'JOINED', '2020-05-24 00:15:00.000000', '2020-05-26 02:39:00.000000'),
(19433, 888, 142, 'JOINED', '2020-05-24 00:15:00.000000', '2020-05-30 07:27:00.000000'),
(19434, 888, 143, 'JOINED', '2020-05-24 00:15:00.000000', '2020-05-28 04:22:40.800000'),
(19435, 888, 144, 'JOINED', '2020-05-24 00:15:00.000000', '2020-05-25 22:47:09.600000'),
(19436, 888, 145, 'JOINED', '2020-05-24 00:15:00.000000', '2020-05-24 10:29:52.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19432, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-06-04 21:51:00.000000', '2020-06-04 21:51:00.000000', '2020-06-04 21:56:00.000000'),
(DEFAULT, 19433, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-06-19 00:12:07.200000', '2020-06-19 00:12:07.200000', '2020-06-19 00:17:07.200000'),
(DEFAULT, 19434, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-30 14:10:12.000000', '2020-05-30 14:10:12.000000', '2020-05-30 14:15:12.000000'),
(DEFAULT, 19435, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-29 02:13:04.800000', '2020-05-29 02:13:04.800000', '2020-05-29 02:18:04.800000'),
(DEFAULT, 19436, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-05-26 13:54:21.600000', '2020-05-26 13:54:21.600000', '2020-05-26 13:59:21.600000');

-- 2020-06-01 00:15:00.000000
-- 2020-06-01
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (889, 62, 151, NULL, 'Send Onsite Preparation Emails', 'This is Send Onsite Preparation Emails', NULL, 'HARD', 'HR', 'HIGH', FALSE, '2020-06-01', '2020-06-14', '2020-06-08', '2020-06-01 00:15:00.000000', '2020-06-01 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19438, 889, 141, 'JOINED', '2020-06-01 00:15:00.000000', '2020-06-01 20:19:33.600000'),
(19439, 889, 142, 'JOINED', '2020-06-01 00:15:00.000000', '2020-06-02 08:10:12.000000'),
(19440, 889, 143, 'JOINED', '2020-06-01 00:15:00.000000', '2020-06-01 03:56:45.600000'),
(19441, 889, 144, 'JOINED', '2020-06-01 00:15:00.000000', '2020-06-01 01:35:38.400000'),
(19442, 889, 145, 'JOINED', '2020-06-01 00:15:00.000000', '2020-06-01 17:58:26.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19438, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-06-14 04:10:26.400000', '2020-06-14 04:10:26.400000', '2020-06-14 04:15:26.400000'),
(DEFAULT, 19439, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-06-06 04:34:12.000000', '2020-06-06 04:34:12.000000', '2020-06-06 04:39:12.000000'),
(DEFAULT, 19440, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-06-04 06:22:12.000000', '2020-06-04 06:22:12.000000', '2020-06-04 06:27:12.000000'),
(DEFAULT, 19441, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-06-03 06:30:50.400000', '2020-06-03 06:30:50.400000', '2020-06-03 06:35:50.400000'),
(DEFAULT, 19442, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-06-14 06:31:33.600000', '2020-06-14 06:31:33.600000', '2020-06-14 06:36:33.600000');

-- 2020-06-09 00:15:00.000000
-- 2020-06-09
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (890, 62, 151, NULL, 'Collect Signed Commitments', 'This is Collect Signed Commitments', NULL, 'HARD', 'HR', 'HIGH', FALSE, '2020-06-09', '2020-07-01', '2020-06-16', '2020-06-09 00:15:00.000000', '2020-06-09 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19444, 890, 141, 'JOINED', '2020-06-09 00:15:00.000000', '2020-06-09 13:31:19.200000'),
(19445, 890, 142, 'JOINED', '2020-06-09 00:15:00.000000', '2020-06-10 18:45:14.400000'),
(19446, 890, 143, 'JOINED', '2020-06-09 00:15:00.000000', '2020-06-15 07:27:00.000000'),
(19447, 890, 144, 'JOINED', '2020-06-09 00:15:00.000000', '2020-06-09 12:40:55.200000'),
(19448, 890, 145, 'JOINED', '2020-06-09 00:15:00.000000', '2020-06-09 11:50:31.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19444, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-06-11 16:45:43.200000', '2020-06-11 16:45:43.200000', '2020-06-11 16:50:43.200000'),
(DEFAULT, 19445, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-06-21 05:44:45.600000', '2020-06-21 05:44:45.600000', '2020-06-21 05:49:45.600000'),
(DEFAULT, 19446, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-01 16:44:16.800000', '2020-07-01 16:44:16.800000', '2020-07-01 16:49:16.800000'),
(DEFAULT, 19447, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-06-12 00:39:28.800000', '2020-06-12 00:39:28.800000', '2020-06-12 00:44:28.800000'),
(DEFAULT, 19448, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-06-12 21:39:28.800000', '2020-06-12 21:39:28.800000', '2020-06-12 21:44:28.800000');

-- 2020-06-17 00:15:00.000000
-- 2020-06-17
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (891, 62, 151, NULL, 'Archive Submitted Documents', 'This is Archive Submitted Documents', NULL, 'HARD', 'HR', 'HIGH', FALSE, '2020-06-17', '2020-06-30', '2020-06-24', '2020-06-17 00:15:00.000000', '2020-06-17 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19450, 891, 141, 'JOINED', '2020-06-17 00:15:00.000000', '2020-06-17 01:15:28.800000'),
(19451, 891, 142, 'JOINED', '2020-06-17 00:15:00.000000', '2020-06-19 17:15:57.600000'),
(19452, 891, 143, 'JOINED', '2020-06-17 00:15:00.000000', '2020-06-17 19:49:19.200000'),
(19453, 891, 144, 'JOINED', '2020-06-17 00:15:00.000000', '2020-06-20 01:39:57.600000'),
(19454, 891, 145, 'JOINED', '2020-06-17 00:15:00.000000', '2020-06-17 03:56:45.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19450, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-06-23 15:10:40.800000', '2020-06-23 15:10:40.800000', '2020-06-23 15:15:40.800000'),
(DEFAULT, 19451, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-06-22 12:17:52.800000', '2020-06-22 12:17:52.800000', '2020-06-22 12:22:52.800000'),
(DEFAULT, 19452, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-06-30 04:40:40.800000', '2020-06-30 04:40:40.800000', '2020-06-30 04:45:40.800000'),
(DEFAULT, 19453, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-06-22 04:14:02.400000', '2020-06-22 04:14:02.400000', '2020-06-22 04:19:02.400000'),
(DEFAULT, 19454, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-06-19 20:27:28.800000', '2020-06-19 20:27:28.800000', '2020-06-19 20:32:28.800000');

-- 2020-06-25 00:15:00.000000
-- 2020-06-25
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (892, 62, 151, NULL, 'Verify Document Completeness', 'This is Verify Document Completeness', NULL, 'HARD', 'HR', 'HIGH', FALSE, '2020-06-25', '2020-07-18', '2020-07-02', '2020-06-25 00:15:00.000000', '2020-06-25 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19456, 892, 141, 'JOINED', '2020-06-25 00:15:00.000000', '2020-07-01 07:27:00.000000'),
(19457, 892, 142, 'JOINED', '2020-06-25 00:15:00.000000', '2020-06-25 11:55:33.600000'),
(19458, 892, 143, 'JOINED', '2020-06-25 00:15:00.000000', '2020-06-25 09:09:14.400000'),
(19459, 892, 144, 'JOINED', '2020-06-25 00:15:00.000000', '2020-06-28 14:56:16.800000'),
(19460, 892, 145, 'JOINED', '2020-06-25 00:15:00.000000', '2020-06-25 12:00:36.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19456, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-18 07:41:24.000000', '2020-07-18 07:41:24.000000', '2020-07-18 07:46:24.000000'),
(DEFAULT, 19457, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-08 12:34:26.400000', '2020-07-08 12:34:26.400000', '2020-07-08 12:39:26.400000'),
(DEFAULT, 19458, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-01 08:37:33.600000', '2020-07-01 08:37:33.600000', '2020-07-01 08:42:33.600000'),
(DEFAULT, 19459, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-01 00:43:48.000000', '2020-07-01 00:43:48.000000', '2020-07-01 00:48:48.000000'),
(DEFAULT, 19460, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-06-28 12:15:00.000000', '2020-06-28 12:15:00.000000', '2020-06-28 12:20:00.000000');

-- 2020-07-03 00:15:00.000000
-- 2020-07-03
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (893, 62, 151, NULL, 'Resolve Missing Document Issues', 'This is Resolve Missing Document Issues', NULL, 'HARD', 'HR', 'NORMAL', FALSE, '2020-07-03', '2020-07-20', '2020-07-09', '2020-07-03 00:15:00.000000', '2020-07-03 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19462, 893, 141, 'JOINED', '2020-07-03 00:15:00.000000', '2020-07-03 04:34:12.000000'),
(19463, 893, 142, 'JOINED', '2020-07-03 00:15:00.000000', '2020-07-04 00:35:09.600000'),
(19464, 893, 143, 'JOINED', '2020-07-03 00:15:00.000000', '2020-07-03 02:50:31.200000'),
(19465, 893, 144, 'JOINED', '2020-07-03 00:15:00.000000', '2020-07-08 09:51:00.000000'),
(19466, 893, 145, 'JOINED', '2020-07-03 00:15:00.000000', '2020-07-05 19:38:31.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19462, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-06 06:35:09.600000', '2020-07-06 06:35:09.600000', '2020-07-06 06:40:09.600000'),
(DEFAULT, 19463, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-05 02:21:43.200000', '2020-07-05 02:21:43.200000', '2020-07-05 02:26:43.200000'),
(DEFAULT, 19464, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-07 13:15:28.800000', '2020-07-07 13:15:28.800000', '2020-07-07 13:20:28.800000'),
(DEFAULT, 19465, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-20 20:56:16.800000', '2020-07-20 20:56:16.800000', '2020-07-20 21:01:16.800000'),
(DEFAULT, 19466, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-08 17:11:38.400000', '2020-07-08 17:11:38.400000', '2020-07-08 17:16:38.400000');

-- 2020-07-10 00:15:00.000000
-- 2020-07-10
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (894, 62, 151, NULL, 'Prepare Final Onsite Dossier', 'This is Prepare Final Onsite Dossier', NULL, 'HARD', 'HR', 'NORMAL', FALSE, '2020-07-10', '2020-07-29', '2020-07-16', '2020-07-10 00:15:00.000000', '2020-07-10 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19468, 894, 141, 'JOINED', '2020-07-10 00:15:00.000000', '2020-07-10 06:52:26.400000'),
(19469, 894, 142, 'JOINED', '2020-07-10 00:15:00.000000', '2020-07-12 16:45:43.200000'),
(19470, 894, 143, 'JOINED', '2020-07-10 00:15:00.000000', '2020-07-10 10:02:31.200000'),
(19471, 894, 144, 'JOINED', '2020-07-10 00:15:00.000000', '2020-07-15 09:51:00.000000'),
(19472, 894, 145, 'JOINED', '2020-07-10 00:15:00.000000', '2020-07-12 06:15:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19468, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-13 05:43:19.200000', '2020-07-13 05:43:19.200000', '2020-07-13 05:48:19.200000'),
(DEFAULT, 19469, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-15 10:08:16.800000', '2020-07-15 10:08:16.800000', '2020-07-15 10:13:16.800000'),
(DEFAULT, 19470, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-14 03:27:57.600000', '2020-07-14 03:27:57.600000', '2020-07-14 03:32:57.600000'),
(DEFAULT, 19471, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-29 13:06:50.400000', '2020-07-29 13:06:50.400000', '2020-07-29 13:11:50.400000'),
(DEFAULT, 19472, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-14 07:38:31.200000', '2020-07-14 07:38:31.200000', '2020-07-14 07:43:31.200000');

-- 2020-07-17 00:15:00.000000
-- 2020-07-17
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (895, 62, 151, NULL, 'Internal Review of Onsite Files', 'This is Internal Review of Onsite Files', NULL, 'HARD', 'HR', 'NORMAL', FALSE, '2020-07-17', '2020-08-08', '2020-07-23', '2020-07-17 00:15:00.000000', '2020-07-17 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19474, 895, 141, 'JOINED', '2020-07-17 00:15:00.000000', '2020-07-17 10:45:43.200000'),
(19475, 895, 142, 'JOINED', '2020-07-17 00:15:00.000000', '2020-07-18 18:48:07.200000'),
(19476, 895, 143, 'JOINED', '2020-07-17 00:15:00.000000', '2020-07-18 09:39:28.800000'),
(19477, 895, 144, 'JOINED', '2020-07-17 00:15:00.000000', '2020-07-22 09:51:00.000000'),
(19478, 895, 145, 'JOINED', '2020-07-17 00:15:00.000000', '2020-07-19 11:17:24.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19474, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-19 03:22:12.000000', '2020-07-19 03:22:12.000000', '2020-07-19 03:27:12.000000'),
(DEFAULT, 19475, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-27 05:41:52.800000', '2020-07-27 05:41:52.800000', '2020-07-27 05:46:52.800000'),
(DEFAULT, 19476, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-19 14:01:33.600000', '2020-07-19 14:01:33.600000', '2020-07-19 14:06:33.600000'),
(DEFAULT, 19477, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-08 17:34:40.800000', '2020-08-08 17:34:40.800000', '2020-08-08 17:39:40.800000'),
(DEFAULT, 19478, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-22 11:26:02.400000', '2020-07-22 11:26:02.400000', '2020-07-22 11:31:02.400000');

-- 2020-07-24 00:15:00.000000
-- 2020-07-24
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (896, 62, 151, NULL, 'Submit Documents to Management', 'This is Submit Documents to Management', NULL, 'HARD', 'HR', 'NORMAL', FALSE, '2020-07-24', '2020-08-02', '2020-07-30', '2020-07-24 00:15:00.000000', '2020-07-24 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19480, 896, 141, 'JOINED', '2020-07-24 00:15:00.000000', '2020-07-25 23:20:16.800000'),
(19481, 896, 142, 'JOINED', '2020-07-24 00:15:00.000000', '2020-07-26 06:32:16.800000'),
(19482, 896, 143, 'JOINED', '2020-07-24 00:15:00.000000', '2020-07-25 06:46:40.800000'),
(19483, 896, 144, 'JOINED', '2020-07-24 00:15:00.000000', '2020-07-26 22:48:36.000000'),
(19484, 896, 145, 'JOINED', '2020-07-24 00:15:00.000000', '2020-07-24 03:07:48.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19480, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-28 01:09:43.200000', '2020-07-28 01:09:43.200000', '2020-07-28 01:14:43.200000'),
(DEFAULT, 19481, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-27 10:02:31.200000', '2020-07-27 10:02:31.200000', '2020-07-27 10:07:31.200000'),
(DEFAULT, 19482, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-28 07:03:57.600000', '2020-07-28 07:03:57.600000', '2020-07-28 07:08:57.600000'),
(DEFAULT, 19483, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-02 01:41:24.000000', '2020-08-02 01:41:24.000000', '2020-08-02 01:46:24.000000'),
(DEFAULT, 19484, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-07-26 23:31:48.000000', '2020-07-26 23:31:48.000000', '2020-07-26 23:36:48.000000');

-- 2020-07-31 00:15:00.000000
-- 2020-07-31
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (897, 62, 151, NULL, 'Update Onsite Status Tracker', 'This is Update Onsite Status Tracker', NULL, 'HARD', 'HR', 'NORMAL', FALSE, '2020-07-31', '2020-08-23', '2020-08-06', '2020-07-31 00:15:00.000000', '2020-07-31 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19486, 897, 141, 'JOINED', '2020-07-31 00:15:00.000000', '2020-08-05 09:51:00.000000'),
(19487, 897, 142, 'JOINED', '2020-07-31 00:15:00.000000', '2020-07-31 06:17:52.800000'),
(19488, 897, 143, 'JOINED', '2020-07-31 00:15:00.000000', '2020-08-05 09:51:00.000000'),
(19489, 897, 144, 'JOINED', '2020-07-31 00:15:00.000000', '2020-08-02 20:30:21.600000'),
(19490, 897, 145, 'JOINED', '2020-07-31 00:15:00.000000', '2020-08-02 09:16:26.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19486, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-20 17:46:12.000000', '2020-08-20 17:46:12.000000', '2020-08-20 17:51:12.000000'),
(DEFAULT, 19487, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-01 07:55:48.000000', '2020-08-01 07:55:48.000000', '2020-08-01 08:00:48.000000'),
(DEFAULT, 19488, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-23 07:58:40.800000', '2020-08-23 07:58:40.800000', '2020-08-23 08:03:40.800000'),
(DEFAULT, 19489, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-05 06:32:16.800000', '2020-08-05 06:32:16.800000', '2020-08-05 06:37:16.800000'),
(DEFAULT, 19490, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-09 15:13:33.600000', '2020-08-09 15:13:33.600000', '2020-08-09 15:18:33.600000');

-- 2020-08-07 00:15:00.000000
-- 2020-08-07
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (898, 62, 151, NULL, 'Confirm Approval from Stakeholders', 'This is Confirm Approval from Stakeholders', NULL, 'HARD', 'HR', 'NORMAL', FALSE, '2020-08-07', '2020-08-16', '2020-08-13', '2020-08-07 00:15:00.000000', '2020-08-07 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19492, 898, 141, 'JOINED', '2020-08-07 00:15:00.000000', '2020-08-09 12:00:36.000000'),
(19493, 898, 142, 'JOINED', '2020-08-07 00:15:00.000000', '2020-08-08 04:28:26.400000'),
(19494, 898, 143, 'JOINED', '2020-08-07 00:15:00.000000', '2020-08-07 23:51:57.600000'),
(19495, 898, 144, 'JOINED', '2020-08-07 00:15:00.000000', '2020-08-08 07:21:14.400000'),
(19496, 898, 145, 'JOINED', '2020-08-07 00:15:00.000000', '2020-08-07 19:15:28.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19492, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-16 12:29:24.000000', '2020-08-16 12:29:24.000000', '2020-08-16 12:34:24.000000'),
(DEFAULT, 19493, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-09 11:00:07.200000', '2020-08-09 11:00:07.200000', '2020-08-09 11:05:07.200000'),
(DEFAULT, 19494, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-09 17:11:38.400000', '2020-08-09 17:11:38.400000', '2020-08-09 17:16:38.400000'),
(DEFAULT, 19495, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-11 01:44:16.800000', '2020-08-11 01:44:16.800000', '2020-08-11 01:49:16.800000'),
(DEFAULT, 19496, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-09 18:12:07.200000', '2020-08-09 18:12:07.200000', '2020-08-09 18:17:07.200000');

-- 2020-08-14 00:15:00.000000
-- 2020-08-14
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (899, 62, 151, NULL, 'Notify Employees of Approval', 'This is Notify Employees of Approval', NULL, 'HARD', 'HR', 'NORMAL', FALSE, '2020-08-14', '2020-09-03', '2020-08-20', '2020-08-14 00:15:00.000000', '2020-08-14 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19498, 899, 141, 'JOINED', '2020-08-14 00:15:00.000000', '2020-08-14 07:27:00.000000'),
(19499, 899, 142, 'JOINED', '2020-08-14 00:15:00.000000', '2020-08-14 07:18:21.600000'),
(19500, 899, 143, 'JOINED', '2020-08-14 00:15:00.000000', '2020-08-14 03:33:43.200000'),
(19501, 899, 144, 'JOINED', '2020-08-14 00:15:00.000000', '2020-08-19 09:51:00.000000'),
(19502, 899, 145, 'JOINED', '2020-08-14 00:15:00.000000', '2020-08-14 09:10:40.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19498, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-19 19:03:57.600000', '2020-08-19 19:03:57.600000', '2020-08-19 19:08:57.600000'),
(DEFAULT, 19499, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-16 16:11:09.600000', '2020-08-16 16:11:09.600000', '2020-08-16 16:16:09.600000'),
(DEFAULT, 19500, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-16 23:23:09.600000', '2020-08-16 23:23:09.600000', '2020-08-16 23:28:09.600000'),
(DEFAULT, 19501, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-09-03 22:39:57.600000', '2020-09-03 22:39:57.600000', '2020-09-03 22:44:57.600000'),
(DEFAULT, 19502, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-15 06:46:40.800000', '2020-08-15 06:46:40.800000', '2020-08-15 06:51:40.800000');

-- 2020-08-21 00:15:00.000000
-- 2020-08-21
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (900, 62, 151, NULL, 'Finalize Onsite Documentation', 'This is Finalize Onsite Documentation', NULL, 'HARD', 'HR', 'NORMAL', FALSE, '2020-08-21', '2020-08-25', '2020-08-27', '2020-08-21 00:15:00.000000', '2020-08-21 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19504, 900, 141, 'JOINED', '2020-08-21 00:15:00.000000', '2020-08-21 01:32:45.600000'),
(19505, 900, 142, 'JOINED', '2020-08-21 00:15:00.000000', '2020-08-22 16:42:50.400000'),
(19506, 900, 143, 'JOINED', '2020-08-21 00:15:00.000000', '2020-08-21 07:09:43.200000'),
(19507, 900, 144, 'JOINED', '2020-08-21 00:15:00.000000', '2020-08-21 06:26:31.200000'),
(19508, 900, 145, 'JOINED', '2020-08-21 00:15:00.000000', '2020-08-22 05:28:55.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19504, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-24 10:19:48.000000', '2020-08-24 10:19:48.000000', '2020-08-24 10:24:48.000000'),
(DEFAULT, 19505, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-24 03:25:04.800000', '2020-08-24 03:25:04.800000', '2020-08-24 03:30:04.800000'),
(DEFAULT, 19506, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-25 21:36:36.000000', '2020-08-25 21:36:36.000000', '2020-08-25 21:41:36.000000'),
(DEFAULT, 19507, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-22 12:15:00.000000', '2020-08-22 12:15:00.000000', '2020-08-22 12:20:00.000000'),
(DEFAULT, 19508, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-23 23:23:09.600000', '2020-08-23 23:23:09.600000', '2020-08-23 23:28:09.600000');

-- 2020-08-28 00:15:00.000000
-- 2020-08-28
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (901, 62, 151, NULL, 'Sign Off Onsite Documents', 'This is Sign Off Onsite Documents', NULL, 'HARD', 'HR', 'NORMAL', FALSE, '2020-08-28', '2020-09-01', '2020-09-03', '2020-08-28 00:15:00.000000', '2020-08-28 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19510, 901, 141, 'JOINED', '2020-08-28 00:15:00.000000', '2020-08-30 14:36:07.200000'),
(19511, 901, 142, 'JOINED', '2020-08-28 00:15:00.000000', '2020-08-28 06:17:52.800000'),
(19512, 901, 143, 'JOINED', '2020-08-28 00:15:00.000000', '2020-08-29 05:28:55.200000'),
(19513, 901, 144, 'JOINED', '2020-08-28 00:15:00.000000', '2020-08-28 04:25:33.600000'),
(19514, 901, 145, 'JOINED', '2020-08-28 00:15:00.000000', '2020-08-28 06:17:52.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19510, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-09-01 17:26:02.400000', '2020-09-01 17:26:02.400000', '2020-09-01 17:31:02.400000'),
(DEFAULT, 19511, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-29 15:25:04.800000', '2020-08-29 15:25:04.800000', '2020-08-29 15:30:04.800000'),
(DEFAULT, 19512, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-31 12:38:02.400000', '2020-08-31 12:38:02.400000', '2020-08-31 12:43:02.400000'),
(DEFAULT, 19513, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-09-01 09:04:55.200000', '2020-09-01 09:04:55.200000', '2020-09-01 09:09:55.200000'),
(DEFAULT, 19514, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-08-29 18:43:48.000000', '2020-08-29 18:43:48.000000', '2020-08-29 18:48:48.000000');

-- 2020-09-04 00:15:00.000000
-- 2020-09-04
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (902, 62, 151, NULL, 'Close Onsite Documentation Phase', 'This is Close Onsite Documentation Phase', NULL, 'HARD', 'HR', 'NORMAL', FALSE, '2020-09-04', '2020-09-23', '2020-09-10', '2020-09-04 00:15:00.000000', '2020-09-04 00:15:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19516, 902, 141, 'JOINED', '2020-09-04 00:15:00.000000', '2020-09-04 15:04:55.200000'),
(19517, 902, 142, 'JOINED', '2020-09-04 00:15:00.000000', '2020-09-04 23:17:24.000000'),
(19518, 902, 143, 'JOINED', '2020-09-04 00:15:00.000000', '2020-09-09 09:51:00.000000'),
(19519, 902, 144, 'JOINED', '2020-09-04 00:15:00.000000', '2020-09-05 03:19:19.200000'),
(19520, 902, 145, 'JOINED', '2020-09-04 00:15:00.000000', '2020-09-06 01:03:57.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19516, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-09-06 03:30:50.400000', '2020-09-06 03:30:50.400000', '2020-09-06 03:35:50.400000'),
(DEFAULT, 19517, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-09-09 22:39:57.600000', '2020-09-09 22:39:57.600000', '2020-09-09 22:44:57.600000'),
(DEFAULT, 19518, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-09-23 03:53:52.800000', '2020-09-23 03:53:52.800000', '2020-09-23 03:58:52.800000'),
(DEFAULT, 19519, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-09-09 03:13:33.600000', '2020-09-09 03:13:33.600000', '2020-09-09 03:18:33.600000'),
(DEFAULT, 19520, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-09-08 09:13:33.600000', '2020-09-08 09:13:33.600000', '2020-09-08 09:18:33.600000');

INSERT INTO collection (`id`, `created_time`, `description`, `due_date`, `start_date`, `name`, `updated_time`, `phase_id`, `created_by_id`)
VALUES (63, '2020-09-10 00:15:00.000000', 'This is Meeting & Communication Reports', '2021-04-11', '2020-09-10', 'Meeting & Communication Reports', '2020-09-10 00:15:00.000000', 11, 154);


-- 2020-09-11 00:20:00.000000
-- 2020-09-11
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (903, 63, 151, NULL, 'Prepare Meeting Agenda Template', 'This is Prepare Meeting Agenda Template', NULL, 'HARD', 'HR', 'NORMAL', FALSE, '2020-09-11', '2020-09-16', '2020-09-17', '2020-09-11 00:20:00.000000', '2020-09-11 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19522, 903, 141, 'JOINED', '2020-09-11 00:20:00.000000', '2020-09-13 18:08:28.800000'),
(19523, 903, 142, 'JOINED', '2020-09-11 00:20:00.000000', '2020-09-11 13:26:14.400000'),
(19524, 903, 143, 'JOINED', '2020-09-11 00:20:00.000000', '2020-09-13 06:28:38.400000'),
(19525, 903, 144, 'JOINED', '2020-09-11 00:20:00.000000', '2020-09-11 01:03:12.000000'),
(19526, 903, 145, 'JOINED', '2020-09-11 00:20:00.000000', '2020-09-12 12:37:16.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19522, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-09-16 08:38:14.400000', '2020-09-16 08:38:14.400000', '2020-09-16 08:43:14.400000'),
(DEFAULT, 19523, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-09-12 23:42:33.600000', '2020-09-12 23:42:33.600000', '2020-09-12 23:47:33.600000'),
(DEFAULT, 19524, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-09-15 21:24:19.200000', '2020-09-15 21:24:19.200000', '2020-09-15 21:29:19.200000'),
(DEFAULT, 19525, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-09-14 11:42:33.600000', '2020-09-14 11:42:33.600000', '2020-09-14 11:47:33.600000'),
(DEFAULT, 19526, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-09-14 08:49:45.600000', '2020-09-14 08:49:45.600000', '2020-09-14 08:54:45.600000');

-- 2020-09-18 00:20:00.000000
-- 2020-09-18
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (904, 63, 151, NULL, 'Collect Meeting Notes', 'This is Collect Meeting Notes', NULL, 'HARD', 'HR', 'NORMAL', FALSE, '2020-09-18', '2020-10-06', '2020-09-24', '2020-09-18 00:20:00.000000', '2020-09-18 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19528, 904, 141, 'JOINED', '2020-09-18 00:20:00.000000', '2020-09-18 02:12:19.200000'),
(19529, 904, 142, 'JOINED', '2020-09-18 00:20:00.000000', '2020-09-20 06:20:00.000000'),
(19530, 904, 143, 'JOINED', '2020-09-18 00:20:00.000000', '2020-09-19 18:05:36.000000'),
(19531, 904, 144, 'JOINED', '2020-09-18 00:20:00.000000', '2020-09-19 02:23:50.400000'),
(19532, 904, 145, 'JOINED', '2020-09-18 00:20:00.000000', '2020-09-23 09:56:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19528, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-09-23 06:11:21.600000', '2020-09-23 06:11:21.600000', '2020-09-23 06:16:21.600000'),
(DEFAULT, 19529, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-09-22 03:15:40.800000', '2020-09-22 03:15:40.800000', '2020-09-22 03:20:40.800000'),
(DEFAULT, 19530, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-09-20 21:01:16.800000', '2020-09-20 21:01:16.800000', '2020-09-20 21:06:16.800000'),
(DEFAULT, 19531, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-09-21 19:46:24.000000', '2020-09-21 19:46:24.000000', '2020-09-21 19:51:24.000000'),
(DEFAULT, 19532, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-06 19:20:28.800000', '2020-10-06 19:20:28.800000', '2020-10-06 19:25:28.800000');

-- 2020-09-25 00:20:00.000000
-- 2020-09-25
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (905, 63, 151, NULL, 'Draft Weekly HR Meeting Report', 'This is Draft Weekly HR Meeting Report', NULL, 'HARD', 'HR', 'NORMAL', FALSE, '2020-09-25', '2020-10-15', '2020-10-01', '2020-09-25 00:20:00.000000', '2020-09-25 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19534, 905, 141, 'JOINED', '2020-09-25 00:20:00.000000', '2020-09-26 09:53:07.200000'),
(19535, 905, 142, 'JOINED', '2020-09-25 00:20:00.000000', '2020-09-25 06:31:31.200000'),
(19536, 905, 143, 'JOINED', '2020-09-25 00:20:00.000000', '2020-09-30 09:56:00.000000'),
(19537, 905, 144, 'JOINED', '2020-09-25 00:20:00.000000', '2020-09-30 09:56:00.000000'),
(19538, 905, 145, 'JOINED', '2020-09-25 00:20:00.000000', '2020-09-26 23:25:16.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19534, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-09-30 14:06:33.600000', '2020-09-30 14:06:33.600000', '2020-09-30 14:11:33.600000'),
(DEFAULT, 19535, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-09-28 19:11:50.400000', '2020-09-28 19:11:50.400000', '2020-09-28 19:16:50.400000'),
(DEFAULT, 19536, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-13 16:53:36.000000', '2020-10-13 16:53:36.000000', '2020-10-13 16:58:36.000000'),
(DEFAULT, 19537, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-15 08:12:19.200000', '2020-10-15 08:12:19.200000', '2020-10-15 08:17:19.200000'),
(DEFAULT, 19538, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-09-27 21:18:33.600000', '2020-09-27 21:18:33.600000', '2020-09-27 21:23:33.600000');

-- 2020-10-02 00:20:00.000000
-- 2020-10-02
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (906, 63, 151, NULL, 'Draft Monthly HR Meeting Summary', 'This is Draft Monthly HR Meeting Summary', NULL, 'HARD', 'HR', 'NORMAL', FALSE, '2020-10-02', '2020-10-12', '2020-10-08', '2020-10-02 00:20:00.000000', '2020-10-02 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19540, 906, 141, 'JOINED', '2020-10-02 00:20:00.000000', '2020-10-03 02:41:07.200000'),
(19541, 906, 142, 'JOINED', '2020-10-02 00:20:00.000000', '2020-10-02 04:30:33.600000'),
(19542, 906, 143, 'JOINED', '2020-10-02 00:20:00.000000', '2020-10-04 14:49:45.600000'),
(19543, 906, 144, 'JOINED', '2020-10-02 00:20:00.000000', '2020-10-02 00:28:38.400000'),
(19544, 906, 145, 'JOINED', '2020-10-02 00:20:00.000000', '2020-10-02 20:03:40.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19540, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-12 21:58:52.800000', '2020-10-12 21:58:52.800000', '2020-10-12 22:03:52.800000'),
(DEFAULT, 19541, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-06 03:32:57.600000', '2020-10-06 03:32:57.600000', '2020-10-06 03:37:57.600000'),
(DEFAULT, 19542, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-11 09:50:14.400000', '2020-10-11 09:50:14.400000', '2020-10-11 09:55:14.400000'),
(DEFAULT, 19543, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-05 12:17:07.200000', '2020-10-05 12:17:07.200000', '2020-10-05 12:22:07.200000'),
(DEFAULT, 19544, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-04 07:55:02.400000', '2020-10-04 07:55:02.400000', '2020-10-04 08:00:02.400000');

-- 2020-10-09 00:20:00.000000
-- 2020-10-09
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (907, 63, 151, NULL, 'Compile Action Items List', 'This is Compile Action Items List', NULL, 'HARD', 'HR', 'NORMAL', FALSE, '2020-10-09', '2020-10-31', '2020-10-15', '2020-10-09 00:20:00.000000', '2020-10-09 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19546, 907, 141, 'JOINED', '2020-10-09 00:20:00.000000', '2020-10-10 02:06:33.600000'),
(19547, 907, 142, 'JOINED', '2020-10-09 00:20:00.000000', '2020-10-11 23:36:48.000000'),
(19548, 907, 143, 'JOINED', '2020-10-09 00:20:00.000000', '2020-10-09 21:30:04.800000'),
(19549, 907, 144, 'JOINED', '2020-10-09 00:20:00.000000', '2020-10-14 09:56:00.000000'),
(19550, 907, 145, 'JOINED', '2020-10-09 00:20:00.000000', '2020-10-09 01:11:50.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19546, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-11 01:08:57.600000', '2020-10-11 01:08:57.600000', '2020-10-11 01:13:57.600000'),
(DEFAULT, 19547, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-14 15:41:36.000000', '2020-10-14 15:41:36.000000', '2020-10-14 15:46:36.000000'),
(DEFAULT, 19548, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-11 17:16:38.400000', '2020-10-11 17:16:38.400000', '2020-10-11 17:21:38.400000'),
(DEFAULT, 19549, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-31 01:14:43.200000', '2020-10-31 01:14:43.200000', '2020-10-31 01:19:43.200000'),
(DEFAULT, 19550, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-12 20:29:36.000000', '2020-10-12 20:29:36.000000', '2020-10-12 20:34:36.000000');

-- 2020-10-16 00:20:00.000000
-- 2020-10-16
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (908, 63, 151, NULL, 'Assign Action Items to Owners', 'This is Assign Action Items to Owners', NULL, 'HARD', 'HR', 'NORMAL', FALSE, '2020-10-16', '2020-10-21', '2020-10-22', '2020-10-16 00:20:00.000000', '2020-10-16 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19552, 908, 141, 'JOINED', '2020-10-16 00:20:00.000000', '2020-10-18 17:33:55.200000'),
(19553, 908, 142, 'JOINED', '2020-10-16 00:20:00.000000', '2020-10-18 18:34:24.000000'),
(19554, 908, 143, 'JOINED', '2020-10-16 00:20:00.000000', '2020-10-16 19:20:28.800000'),
(19555, 908, 144, 'JOINED', '2020-10-16 00:20:00.000000', '2020-10-17 04:16:09.600000'),
(19556, 908, 145, 'JOINED', '2020-10-16 00:20:00.000000', '2020-10-16 12:34:24.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19552, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-21 08:03:40.800000', '2020-10-21 08:03:40.800000', '2020-10-21 08:08:40.800000'),
(DEFAULT, 19553, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-20 21:50:14.400000', '2020-10-20 21:50:14.400000', '2020-10-20 21:55:14.400000'),
(DEFAULT, 19554, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-17 23:42:33.600000', '2020-10-17 23:42:33.600000', '2020-10-17 23:47:33.600000'),
(DEFAULT, 19555, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-19 14:26:43.200000', '2020-10-19 14:26:43.200000', '2020-10-19 14:31:43.200000'),
(DEFAULT, 19556, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-18 15:32:57.600000', '2020-10-18 15:32:57.600000', '2020-10-18 15:37:57.600000');

-- 2020-10-23 00:20:00.000000
-- 2020-10-23
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (909, 63, 151, NULL, 'Track Action Item Progress', 'This is Track Action Item Progress', NULL, 'HARD', 'HR', 'NORMAL', FALSE, '2020-10-23', '2020-11-15', '2020-10-29', '2020-10-23 00:20:00.000000', '2020-10-23 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19558, 909, 141, 'JOINED', '2020-10-23 00:20:00.000000', '2020-10-25 15:41:36.000000'),
(19559, 909, 142, 'JOINED', '2020-10-23 00:20:00.000000', '2020-10-28 09:56:00.000000'),
(19560, 909, 143, 'JOINED', '2020-10-23 00:20:00.000000', '2020-10-24 04:42:04.800000'),
(19561, 909, 144, 'JOINED', '2020-10-23 00:20:00.000000', '2020-10-28 09:56:00.000000'),
(19562, 909, 145, 'JOINED', '2020-10-23 00:20:00.000000', '2020-10-23 23:48:19.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19558, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-28 16:50:43.200000', '2020-10-28 16:50:43.200000', '2020-10-28 16:55:43.200000'),
(DEFAULT, 19559, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-11-14 07:26:14.400000', '2020-11-14 07:26:14.400000', '2020-11-14 07:31:14.400000'),
(DEFAULT, 19560, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-27 17:05:07.200000', '2020-10-27 17:05:07.200000', '2020-10-27 17:10:07.200000'),
(DEFAULT, 19561, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-11-15 07:29:07.200000', '2020-11-15 07:29:07.200000', '2020-11-15 07:34:07.200000'),
(DEFAULT, 19562, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-25 17:51:12.000000', '2020-10-25 17:51:12.000000', '2020-10-25 17:56:12.000000');

-- 2020-10-30 00:20:00.000000
-- 2020-10-30
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (910, 63, 151, NULL, 'Prepare Follow-up Meeting Notes', 'This is Prepare Follow-up Meeting Notes', NULL, 'HARD', 'HR', 'NORMAL', FALSE, '2020-10-30', '2020-11-19', '2020-11-05', '2020-10-30 00:20:00.000000', '2020-10-30 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19564, 910, 141, 'JOINED', '2020-10-30 00:20:00.000000', '2020-10-30 16:53:36.000000'),
(19565, 910, 142, 'JOINED', '2020-10-30 00:20:00.000000', '2020-11-03 20:41:07.200000'),
(19566, 910, 143, 'JOINED', '2020-10-30 00:20:00.000000', '2020-11-04 09:56:00.000000'),
(19567, 910, 144, 'JOINED', '2020-10-30 00:20:00.000000', '2020-10-31 13:59:21.600000'),
(19568, 910, 145, 'JOINED', '2020-10-30 00:20:00.000000', '2020-11-02 18:11:21.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19564, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-10-31 19:14:43.200000', '2020-10-31 19:14:43.200000', '2020-10-31 19:19:43.200000'),
(DEFAULT, 19565, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-11-04 22:36:19.200000', '2020-11-04 22:36:19.200000', '2020-11-04 22:41:19.200000'),
(DEFAULT, 19566, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-11-19 22:44:57.600000', '2020-11-19 22:44:57.600000', '2020-11-19 22:49:57.600000'),
(DEFAULT, 19567, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-11-09 10:40:38.400000', '2020-11-09 10:40:38.400000', '2020-11-09 10:45:38.400000'),
(DEFAULT, 19568, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-11-04 13:57:55.200000', '2020-11-04 13:57:55.200000', '2020-11-04 14:02:55.200000');

-- 2020-11-06 00:20:00.000000
-- 2020-11-06
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (911, 63, 151, NULL, 'Draft Cross-team Meeting Report', 'This is Draft Cross-team Meeting Report', NULL, 'HARD', 'HR', 'NORMAL', FALSE, '2020-11-06', '2020-11-17', '2020-11-12', '2020-11-06 00:20:00.000000', '2020-11-06 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19570, 911, 141, 'JOINED', '2020-11-06 00:20:00.000000', '2020-11-06 23:31:02.400000'),
(19571, 911, 142, 'JOINED', '2020-11-06 00:20:00.000000', '2020-11-06 04:30:33.600000'),
(19572, 911, 143, 'JOINED', '2020-11-06 00:20:00.000000', '2020-11-06 12:43:02.400000'),
(19573, 911, 144, 'JOINED', '2020-11-06 00:20:00.000000', '2020-11-06 20:25:16.800000'),
(19574, 911, 145, 'JOINED', '2020-11-06 00:20:00.000000', '2020-11-07 01:06:04.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19570, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-11-08 18:08:28.800000', '2020-11-08 18:08:28.800000', '2020-11-08 18:13:28.800000'),
(DEFAULT, 19571, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-11-08 14:23:50.400000', '2020-11-08 14:23:50.400000', '2020-11-08 14:28:50.400000'),
(DEFAULT, 19572, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-11-11 00:17:07.200000', '2020-11-11 00:17:07.200000', '2020-11-11 00:22:07.200000'),
(DEFAULT, 19573, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-11-17 04:14:43.200000', '2020-11-17 04:14:43.200000', '2020-11-17 04:19:43.200000'),
(DEFAULT, 19574, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-11-08 21:01:16.800000', '2020-11-08 21:01:16.800000', '2020-11-08 21:06:16.800000');

-- 2020-11-13 00:20:00.000000
-- 2020-11-13
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (912, 63, 151, NULL, 'Summarize Management Decisions', 'This is Summarize Management Decisions', NULL, 'HARD', 'HR', 'NORMAL', FALSE, '2020-11-13', '2020-12-03', '2020-11-19', '2020-11-13 00:20:00.000000', '2020-11-13 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19576, 912, 141, 'JOINED', '2020-11-13 00:20:00.000000', '2020-11-18 09:56:00.000000'),
(19577, 912, 142, 'JOINED', '2020-11-13 00:20:00.000000', '2020-11-18 09:56:00.000000'),
(19578, 912, 143, 'JOINED', '2020-11-13 00:20:00.000000', '2020-11-14 12:20:00.000000'),
(19579, 912, 144, 'JOINED', '2020-11-13 00:20:00.000000', '2020-11-15 23:58:24.000000'),
(19580, 912, 145, 'JOINED', '2020-11-13 00:20:00.000000', '2020-11-15 21:31:31.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19576, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-02 15:21:26.400000', '2020-12-02 15:21:26.400000', '2020-12-02 15:26:26.400000'),
(DEFAULT, 19577, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-03 02:00:48.000000', '2020-12-03 02:00:48.000000', '2020-12-03 02:05:48.000000'),
(DEFAULT, 19578, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-11-18 04:44:57.600000', '2020-11-18 04:44:57.600000', '2020-11-18 04:49:57.600000'),
(DEFAULT, 19579, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-11-22 00:41:36.000000', '2020-11-22 00:41:36.000000', '2020-11-22 00:46:36.000000'),
(DEFAULT, 19580, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-11-22 03:08:28.800000', '2020-11-22 03:08:28.800000', '2020-11-22 03:13:28.800000');

-- 2020-11-20 00:20:00.000000
-- 2020-11-20
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (913, 63, 151, NULL, 'Prepare Stakeholder Communication', 'This is Prepare Stakeholder Communication', NULL, 'HARD', 'HR', 'LOW', FALSE, '2020-11-20', '2020-12-06', '2020-11-25', '2020-11-20 00:20:00.000000', '2020-11-20 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19582, 913, 141, 'JOINED', '2020-11-20 00:20:00.000000', '2020-11-24 12:20:00.000000'),
(19583, 913, 142, 'JOINED', '2020-11-20 00:20:00.000000', '2020-11-21 13:46:24.000000'),
(19584, 913, 143, 'JOINED', '2020-11-20 00:20:00.000000', '2020-11-22 04:28:24.000000'),
(19585, 913, 144, 'JOINED', '2020-11-20 00:20:00.000000', '2020-11-24 12:20:00.000000'),
(19586, 913, 145, 'JOINED', '2020-11-20 00:20:00.000000', '2020-11-20 08:51:12.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19582, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-06 20:44:00.000000', '2020-12-06 20:44:00.000000', '2020-12-06 20:49:00.000000'),
(DEFAULT, 19583, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-11-23 14:15:12.000000', '2020-11-23 14:15:12.000000', '2020-11-23 14:20:12.000000'),
(DEFAULT, 19584, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-11-27 20:11:36.000000', '2020-11-27 20:11:36.000000', '2020-11-27 20:16:36.000000'),
(DEFAULT, 19585, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-06 03:48:48.000000', '2020-12-06 03:48:48.000000', '2020-12-06 03:53:48.000000'),
(DEFAULT, 19586, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-11-23 23:00:48.000000', '2020-11-23 23:00:48.000000', '2020-11-23 23:05:48.000000');

-- 2020-11-26 00:20:00.000000
-- 2020-11-26
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (914, 63, 151, NULL, 'Review Report Accuracy', 'This is Review Report Accuracy', NULL, 'HARD', 'HR', 'LOW', FALSE, '2020-11-26', '2020-12-11', '2020-12-01', '2020-11-26 00:20:00.000000', '2020-11-26 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19588, 914, 141, 'JOINED', '2020-11-26 00:20:00.000000', '2020-11-28 03:52:24.000000'),
(19589, 914, 142, 'JOINED', '2020-11-26 00:20:00.000000', '2020-11-29 08:29:36.000000'),
(19590, 914, 143, 'JOINED', '2020-11-26 00:20:00.000000', '2020-11-29 22:24:48.000000'),
(19591, 914, 144, 'JOINED', '2020-11-26 00:20:00.000000', '2020-11-28 08:15:12.000000'),
(19592, 914, 145, 'JOINED', '2020-11-26 00:20:00.000000', '2020-11-30 12:20:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19588, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-03 20:47:36.000000', '2020-12-03 20:47:36.000000', '2020-12-03 20:52:36.000000'),
(DEFAULT, 19589, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-11-30 10:46:24.000000', '2020-11-30 10:46:24.000000', '2020-11-30 10:51:24.000000'),
(DEFAULT, 19590, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-11-30 18:27:12.000000', '2020-11-30 18:27:12.000000', '2020-11-30 18:32:12.000000'),
(DEFAULT, 19591, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-03 16:24:48.000000', '2020-12-03 16:24:48.000000', '2020-12-03 16:29:48.000000'),
(DEFAULT, 19592, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-11 21:48:48.000000', '2020-12-11 21:48:48.000000', '2020-12-11 21:53:48.000000');

-- 2020-12-02 00:20:00.000000
-- 2020-12-02
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (915, 63, 151, NULL, 'Revise Meeting Report Content', 'This is Revise Meeting Report Content', NULL, 'HARD', 'HR', 'LOW', FALSE, '2020-12-02', '2020-12-18', '2020-12-07', '2020-12-02 00:20:00.000000', '2020-12-02 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19594, 915, 141, 'JOINED', '2020-12-02 00:20:00.000000', '2020-12-02 12:12:48.000000'),
(19595, 915, 142, 'JOINED', '2020-12-02 00:20:00.000000', '2020-12-06 12:20:00.000000'),
(19596, 915, 143, 'JOINED', '2020-12-02 00:20:00.000000', '2020-12-03 03:20:00.000000'),
(19597, 915, 144, 'JOINED', '2020-12-02 00:20:00.000000', '2020-12-03 07:42:48.000000'),
(19598, 915, 145, 'JOINED', '2020-12-02 00:20:00.000000', '2020-12-04 06:27:12.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19594, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-03 18:05:36.000000', '2020-12-03 18:05:36.000000', '2020-12-03 18:10:36.000000'),
(DEFAULT, 19595, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-18 17:22:24.000000', '2020-12-18 17:22:24.000000', '2020-12-18 17:27:24.000000'),
(DEFAULT, 19596, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-10 21:20:00.000000', '2020-12-10 21:20:00.000000', '2020-12-10 21:25:00.000000'),
(DEFAULT, 19597, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-10 16:57:12.000000', '2020-12-10 16:57:12.000000', '2020-12-10 17:02:12.000000'),
(DEFAULT, 19598, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-05 17:22:24.000000', '2020-12-05 17:22:24.000000', '2020-12-05 17:27:24.000000');

-- 2020-12-08 00:20:00.000000
-- 2020-12-08
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (916, 63, 151, NULL, 'Format Official Meeting Report', 'This is Format Official Meeting Report', NULL, 'HARD', 'HR', 'LOW', FALSE, '2020-12-08', '2020-12-23', '2020-12-13', '2020-12-08 00:20:00.000000', '2020-12-08 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19600, 916, 141, 'JOINED', '2020-12-08 00:20:00.000000', '2020-12-10 03:56:00.000000'),
(19601, 916, 142, 'JOINED', '2020-12-08 00:20:00.000000', '2020-12-09 12:56:00.000000'),
(19602, 916, 143, 'JOINED', '2020-12-08 00:20:00.000000', '2020-12-12 12:20:00.000000'),
(19603, 916, 144, 'JOINED', '2020-12-08 00:20:00.000000', '2020-12-09 09:34:24.000000'),
(19604, 916, 145, 'JOINED', '2020-12-08 00:20:00.000000', '2020-12-08 01:32:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19600, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-11 05:08:00.000000', '2020-12-11 05:08:00.000000', '2020-12-11 05:13:00.000000'),
(DEFAULT, 19601, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-16 11:44:00.000000', '2020-12-16 11:44:00.000000', '2020-12-16 11:49:00.000000'),
(DEFAULT, 19602, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-23 14:36:48.000000', '2020-12-23 14:36:48.000000', '2020-12-23 14:41:48.000000'),
(DEFAULT, 19603, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-16 15:05:36.000000', '2020-12-16 15:05:36.000000', '2020-12-16 15:10:36.000000'),
(DEFAULT, 19604, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-09 03:20:00.000000', '2020-12-09 03:20:00.000000', '2020-12-09 03:25:00.000000');

-- 2020-12-14 00:20:00.000000
-- 2020-12-14
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (917, 63, 151, NULL, 'Send Meeting Report to Attendees', 'This is Send Meeting Report to Attendees', NULL, 'HARD', 'HR', 'LOW', FALSE, '2020-12-14', '2021-01-02', '2020-12-19', '2020-12-14 00:20:00.000000', '2020-12-14 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19606, 917, 141, 'JOINED', '2020-12-14 00:20:00.000000', '2020-12-14 03:05:36.000000'),
(19607, 917, 142, 'JOINED', '2020-12-14 00:20:00.000000', '2020-12-15 06:34:24.000000'),
(19608, 917, 143, 'JOINED', '2020-12-14 00:20:00.000000', '2020-12-15 05:51:12.000000'),
(19609, 917, 144, 'JOINED', '2020-12-14 00:20:00.000000', '2020-12-14 10:24:48.000000'),
(19610, 917, 145, 'JOINED', '2020-12-14 00:20:00.000000', '2020-12-18 12:20:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19606, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-15 17:51:12.000000', '2020-12-15 17:51:12.000000', '2020-12-15 17:56:12.000000'),
(DEFAULT, 19607, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-22 18:05:36.000000', '2020-12-22 18:05:36.000000', '2020-12-22 18:10:36.000000'),
(DEFAULT, 19608, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-17 01:10:24.000000', '2020-12-17 01:10:24.000000', '2020-12-17 01:15:24.000000'),
(DEFAULT, 19609, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-23 14:15:12.000000', '2020-12-23 14:15:12.000000', '2020-12-23 14:20:12.000000'),
(DEFAULT, 19610, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-02 02:29:36.000000', '2021-01-02 02:29:36.000000', '2021-01-02 02:34:36.000000');

-- 2020-12-20 00:20:00.000000
-- 2020-12-20
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (918, 63, 151, NULL, 'Archive Meeting Reports', 'This is Archive Meeting Reports', NULL, 'HARD', 'HR', 'LOW', FALSE, '2020-12-20', '2020-12-23', '2020-12-25', '2020-12-20 00:20:00.000000', '2020-12-20 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19612, 918, 141, 'JOINED', '2020-12-20 00:20:00.000000', '2020-12-20 08:36:48.000000'),
(19613, 918, 142, 'JOINED', '2020-12-20 00:20:00.000000', '2020-12-22 17:08:00.000000'),
(19614, 918, 143, 'JOINED', '2020-12-20 00:20:00.000000', '2020-12-20 01:46:24.000000'),
(19615, 918, 144, 'JOINED', '2020-12-20 00:20:00.000000', '2020-12-20 20:08:00.000000'),
(19616, 918, 145, 'JOINED', '2020-12-20 00:20:00.000000', '2020-12-20 07:39:12.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19612, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-23 06:56:00.000000', '2020-12-23 06:56:00.000000', '2020-12-23 07:01:00.000000'),
(DEFAULT, 19613, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-23 11:44:00.000000', '2020-12-23 11:44:00.000000', '2020-12-23 11:49:00.000000'),
(DEFAULT, 19614, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-22 23:29:36.000000', '2020-12-22 23:29:36.000000', '2020-12-22 23:34:36.000000'),
(DEFAULT, 19615, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-22 17:22:24.000000', '2020-12-22 17:22:24.000000', '2020-12-22 17:27:24.000000'),
(DEFAULT, 19616, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-21 13:03:12.000000', '2020-12-21 13:03:12.000000', '2020-12-21 13:08:12.000000');

-- 2020-12-26 00:20:00.000000
-- 2020-12-26
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (919, 63, 151, NULL, 'Prepare Quarterly HR Review Notes', 'This is Prepare Quarterly HR Review Notes', NULL, 'HARD', 'HR', 'LOW', FALSE, '2020-12-26', '2021-01-10', '2020-12-31', '2020-12-26 00:20:00.000000', '2020-12-26 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19618, 919, 141, 'JOINED', '2020-12-26 00:20:00.000000', '2020-12-27 16:39:12.000000'),
(19619, 919, 142, 'JOINED', '2020-12-26 00:20:00.000000', '2020-12-26 17:15:12.000000'),
(19620, 919, 143, 'JOINED', '2020-12-26 00:20:00.000000', '2020-12-30 12:20:00.000000'),
(19621, 919, 144, 'JOINED', '2020-12-26 00:20:00.000000', '2020-12-27 11:18:48.000000'),
(19622, 919, 145, 'JOINED', '2020-12-26 00:20:00.000000', '2020-12-26 19:39:12.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19618, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-29 14:58:24.000000', '2020-12-29 14:58:24.000000', '2020-12-29 15:03:24.000000'),
(DEFAULT, 19619, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-28 22:10:24.000000', '2020-12-28 22:10:24.000000', '2020-12-28 22:15:24.000000'),
(DEFAULT, 19620, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-10 21:27:12.000000', '2021-01-10 21:27:12.000000', '2021-01-10 21:32:12.000000'),
(DEFAULT, 19621, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-03 13:21:12.000000', '2021-01-03 13:21:12.000000', '2021-01-03 13:26:12.000000'),
(DEFAULT, 19622, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2020-12-28 01:03:12.000000', '2020-12-28 01:03:12.000000', '2020-12-28 01:08:12.000000');

-- 2021-01-01 00:20:00.000000
-- 2021-01-01
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (920, 63, 151, NULL, 'Document HR Policy Discussions', 'This is Document HR Policy Discussions', NULL, 'HARD', 'HR', 'LOW', FALSE, '2021-01-01', '2021-01-18', '2021-01-06', '2021-01-01 00:20:00.000000', '2021-01-01 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19624, 920, 141, 'JOINED', '2021-01-01 00:20:00.000000', '2021-01-02 03:34:24.000000'),
(19625, 920, 142, 'JOINED', '2021-01-01 00:20:00.000000', '2021-01-01 06:12:48.000000'),
(19626, 920, 143, 'JOINED', '2021-01-01 00:20:00.000000', '2021-01-05 12:20:00.000000'),
(19627, 920, 144, 'JOINED', '2021-01-01 00:20:00.000000', '2021-01-01 15:23:36.000000'),
(19628, 920, 145, 'JOINED', '2021-01-01 00:20:00.000000', '2021-01-01 09:05:36.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19624, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-05 16:03:12.000000', '2021-01-05 16:03:12.000000', '2021-01-05 16:08:12.000000'),
(DEFAULT, 19625, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-02 07:53:36.000000', '2021-01-02 07:53:36.000000', '2021-01-02 07:58:36.000000'),
(DEFAULT, 19626, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-18 01:24:48.000000', '2021-01-18 01:24:48.000000', '2021-01-18 01:29:48.000000'),
(DEFAULT, 19627, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-10 09:16:24.000000', '2021-01-10 09:16:24.000000', '2021-01-10 09:21:24.000000'),
(DEFAULT, 19628, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-02 17:00:48.000000', '2021-01-02 17:00:48.000000', '2021-01-02 17:05:48.000000');

-- 2021-01-07 00:20:00.000000
-- 2021-01-07
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (921, 63, 151, NULL, 'Summarize Employee Feedback', 'This is Summarize Employee Feedback', NULL, 'HARD', 'HR', 'LOW', FALSE, '2021-01-07', '2021-01-16', '2021-01-12', '2021-01-07 00:20:00.000000', '2021-01-07 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19630, 921, 141, 'JOINED', '2021-01-07 00:20:00.000000', '2021-01-07 05:33:12.000000'),
(19631, 921, 142, 'JOINED', '2021-01-07 00:20:00.000000', '2021-01-10 02:15:12.000000'),
(19632, 921, 143, 'JOINED', '2021-01-07 00:20:00.000000', '2021-01-07 02:51:12.000000'),
(19633, 921, 144, 'JOINED', '2021-01-07 00:20:00.000000', '2021-01-07 00:41:36.000000'),
(19634, 921, 145, 'JOINED', '2021-01-07 00:20:00.000000', '2021-01-07 02:08:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19630, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-16 19:06:48.000000', '2021-01-16 19:06:48.000000', '2021-01-16 19:11:48.000000'),
(DEFAULT, 19631, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-11 11:29:36.000000', '2021-01-11 11:29:36.000000', '2021-01-11 11:34:36.000000'),
(DEFAULT, 19632, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-08 00:41:36.000000', '2021-01-08 00:41:36.000000', '2021-01-08 00:46:36.000000'),
(DEFAULT, 19633, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-08 16:24:48.000000', '2021-01-08 16:24:48.000000', '2021-01-08 16:29:48.000000'),
(DEFAULT, 19634, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-08 09:41:36.000000', '2021-01-08 09:41:36.000000', '2021-01-08 09:46:36.000000');

-- 2021-01-13 00:20:00.000000
-- 2021-01-13
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (922, 63, 151, NULL, 'Prepare Decision Log', 'This is Prepare Decision Log', NULL, 'HARD', 'HR', 'LOW', FALSE, '2021-01-13', '2021-01-27', '2021-01-18', '2021-01-13 00:20:00.000000', '2021-01-13 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19636, 922, 141, 'JOINED', '2021-01-13 00:20:00.000000', '2021-01-14 13:10:24.000000'),
(19637, 922, 142, 'JOINED', '2021-01-13 00:20:00.000000', '2021-01-13 00:34:24.000000'),
(19638, 922, 143, 'JOINED', '2021-01-13 00:20:00.000000', '2021-01-15 08:51:12.000000'),
(19639, 922, 144, 'JOINED', '2021-01-13 00:20:00.000000', '2021-01-13 09:48:48.000000'),
(19640, 922, 145, 'JOINED', '2021-01-13 00:20:00.000000', '2021-01-17 12:20:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19636, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-17 15:48:48.000000', '2021-01-17 15:48:48.000000', '2021-01-17 15:53:48.000000'),
(DEFAULT, 19637, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-15 18:34:24.000000', '2021-01-15 18:34:24.000000', '2021-01-15 18:39:24.000000'),
(DEFAULT, 19638, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-20 15:48:48.000000', '2021-01-20 15:48:48.000000', '2021-01-20 15:53:48.000000'),
(DEFAULT, 19639, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-14 06:05:36.000000', '2021-01-14 06:05:36.000000', '2021-01-14 06:10:36.000000'),
(DEFAULT, 19640, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-27 17:22:24.000000', '2021-01-27 17:22:24.000000', '2021-01-27 17:27:24.000000');

-- 2021-01-19 00:20:00.000000
-- 2021-01-19
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (923, 63, 151, NULL, 'Verify Meeting Attendance Records', 'This is Verify Meeting Attendance Records', NULL, 'HARD', 'HR', 'LOW', FALSE, '2021-01-19', '2021-01-26', '2021-01-24', '2021-01-19 00:20:00.000000', '2021-01-19 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19642, 923, 141, 'JOINED', '2021-01-19 00:20:00.000000', '2021-01-19 18:12:48.000000'),
(19643, 923, 142, 'JOINED', '2021-01-19 00:20:00.000000', '2021-01-21 17:18:48.000000'),
(19644, 923, 143, 'JOINED', '2021-01-19 00:20:00.000000', '2021-01-19 02:08:00.000000'),
(19645, 923, 144, 'JOINED', '2021-01-19 00:20:00.000000', '2021-01-20 09:20:00.000000'),
(19646, 923, 145, 'JOINED', '2021-01-19 00:20:00.000000', '2021-01-19 12:12:48.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19642, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-21 12:34:24.000000', '2021-01-21 12:34:24.000000', '2021-01-21 12:39:24.000000'),
(DEFAULT, 19643, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-26 07:21:12.000000', '2021-01-26 07:21:12.000000', '2021-01-26 07:26:12.000000'),
(DEFAULT, 19644, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-20 15:12:48.000000', '2021-01-20 15:12:48.000000', '2021-01-20 15:17:48.000000'),
(DEFAULT, 19645, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-21 08:58:24.000000', '2021-01-21 08:58:24.000000', '2021-01-21 09:03:24.000000'),
(DEFAULT, 19646, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-21 22:24:48.000000', '2021-01-21 22:24:48.000000', '2021-01-21 22:29:48.000000');

-- 2021-01-25 00:20:00.000000
-- 2021-01-25
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (924, 63, 151, NULL, 'Prepare Executive Briefing Notes', 'This is Prepare Executive Briefing Notes', NULL, 'HARD', 'HR', 'LOW', FALSE, '2021-01-25', '2021-02-12', '2021-01-30', '2021-01-25 00:20:00.000000', '2021-01-25 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19648, 924, 141, 'JOINED', '2021-01-25 00:20:00.000000', '2021-01-27 08:00:48.000000'),
(19649, 924, 142, 'JOINED', '2021-01-25 00:20:00.000000', '2021-01-29 12:20:00.000000'),
(19650, 924, 143, 'JOINED', '2021-01-25 00:20:00.000000', '2021-01-25 03:34:24.000000'),
(19651, 924, 144, 'JOINED', '2021-01-25 00:20:00.000000', '2021-01-25 16:32:00.000000'),
(19652, 924, 145, 'JOINED', '2021-01-25 00:20:00.000000', '2021-01-25 20:15:12.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19648, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-28 14:22:24.000000', '2021-01-28 14:22:24.000000', '2021-01-28 14:27:24.000000'),
(DEFAULT, 19649, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-12 10:03:12.000000', '2021-02-12 10:03:12.000000', '2021-02-12 10:08:12.000000'),
(DEFAULT, 19650, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-27 04:03:12.000000', '2021-01-27 04:03:12.000000', '2021-01-27 04:08:12.000000'),
(DEFAULT, 19651, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-26 15:27:12.000000', '2021-01-26 15:27:12.000000', '2021-01-26 15:32:12.000000'),
(DEFAULT, 19652, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-01-27 03:20:00.000000', '2021-01-27 03:20:00.000000', '2021-01-27 03:25:00.000000');

-- 2021-01-31 00:20:00.000000
-- 2021-01-31
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (925, 63, 151, NULL, 'Review Communication Tone', 'This is Review Communication Tone', NULL, 'HARD', 'HR', 'LOW', FALSE, '2021-01-31', '2021-02-04', '2021-02-05', '2021-01-31 00:20:00.000000', '2021-01-31 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19654, 925, 141, 'JOINED', '2021-01-31 00:20:00.000000', '2021-01-31 00:27:12.000000'),
(19655, 925, 142, 'JOINED', '2021-01-31 00:20:00.000000', '2021-01-31 00:34:24.000000'),
(19656, 925, 143, 'JOINED', '2021-01-31 00:20:00.000000', '2021-02-02 00:34:24.000000'),
(19657, 925, 144, 'JOINED', '2021-01-31 00:20:00.000000', '2021-02-01 19:24:48.000000'),
(19658, 925, 145, 'JOINED', '2021-01-31 00:20:00.000000', '2021-02-01 22:10:24.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19654, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-02 19:39:12.000000', '2021-02-02 19:39:12.000000', '2021-02-02 19:44:12.000000'),
(DEFAULT, 19655, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-02 02:44:00.000000', '2021-02-02 02:44:00.000000', '2021-02-02 02:49:00.000000'),
(DEFAULT, 19656, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-03 13:53:36.000000', '2021-02-03 13:53:36.000000', '2021-02-03 13:58:36.000000'),
(DEFAULT, 19657, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-03 00:27:12.000000', '2021-02-03 00:27:12.000000', '2021-02-03 00:32:12.000000'),
(DEFAULT, 19658, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-04 09:12:48.000000', '2021-02-04 09:12:48.000000', '2021-02-04 09:17:48.000000');

-- 2021-02-06 00:20:00.000000
-- 2021-02-06
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (926, 63, 151, NULL, 'Align Report with HR Standards', 'This is Align Report with HR Standards', NULL, 'HARD', 'HR', 'LOW', FALSE, '2021-02-06', '2021-02-10', '2021-02-11', '2021-02-06 00:20:00.000000', '2021-02-06 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19660, 926, 141, 'JOINED', '2021-02-06 00:20:00.000000', '2021-02-07 10:17:36.000000'),
(19661, 926, 142, 'JOINED', '2021-02-06 00:20:00.000000', '2021-02-08 19:39:12.000000'),
(19662, 926, 143, 'JOINED', '2021-02-06 00:20:00.000000', '2021-02-07 19:53:36.000000'),
(19663, 926, 144, 'JOINED', '2021-02-06 00:20:00.000000', '2021-02-06 02:08:00.000000'),
(19664, 926, 145, 'JOINED', '2021-02-06 00:20:00.000000', '2021-02-06 13:53:36.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19660, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-09 10:10:24.000000', '2021-02-09 10:10:24.000000', '2021-02-09 10:15:24.000000'),
(DEFAULT, 19661, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-10 13:32:00.000000', '2021-02-10 13:32:00.000000', '2021-02-10 13:37:00.000000'),
(DEFAULT, 19662, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-09 13:03:12.000000', '2021-02-09 13:03:12.000000', '2021-02-09 13:08:12.000000'),
(DEFAULT, 19663, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-07 17:15:12.000000', '2021-02-07 17:15:12.000000', '2021-02-07 17:20:12.000000'),
(DEFAULT, 19664, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-08 14:36:48.000000', '2021-02-08 14:36:48.000000', '2021-02-08 14:41:48.000000');

-- 2021-02-12 00:20:00.000000
-- 2021-02-12
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (927, 63, 151, NULL, 'Resolve Missing Information', 'This is Resolve Missing Information', NULL, 'HARD', 'HR', 'LOW', FALSE, '2021-02-12', '2021-02-28', '2021-02-17', '2021-02-12 00:20:00.000000', '2021-02-12 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19666, 927, 141, 'JOINED', '2021-02-12 00:20:00.000000', '2021-02-13 00:41:36.000000'),
(19667, 927, 142, 'JOINED', '2021-02-12 00:20:00.000000', '2021-02-15 10:46:24.000000'),
(19668, 927, 143, 'JOINED', '2021-02-12 00:20:00.000000', '2021-02-16 12:20:00.000000'),
(19669, 927, 144, 'JOINED', '2021-02-12 00:20:00.000000', '2021-02-12 15:05:36.000000'),
(19670, 927, 145, 'JOINED', '2021-02-12 00:20:00.000000', '2021-02-12 17:44:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19666, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-16 07:32:00.000000', '2021-02-16 07:32:00.000000', '2021-02-16 07:37:00.000000'),
(DEFAULT, 19667, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-16 14:36:48.000000', '2021-02-16 14:36:48.000000', '2021-02-16 14:41:48.000000'),
(DEFAULT, 19668, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-28 17:15:12.000000', '2021-02-28 17:15:12.000000', '2021-02-28 17:20:12.000000'),
(DEFAULT, 19669, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-16 16:17:36.000000', '2021-02-16 16:17:36.000000', '2021-02-16 16:22:36.000000'),
(DEFAULT, 19670, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-13 22:53:36.000000', '2021-02-13 22:53:36.000000', '2021-02-13 22:58:36.000000');

-- 2021-02-18 00:20:00.000000
-- 2021-02-18
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (928, 63, 151, NULL, 'Finalize Meeting Reports', 'This is Finalize Meeting Reports', NULL, 'HARD', 'HR', 'LOW', FALSE, '2021-02-18', '2021-03-04', '2021-02-23', '2021-02-18 00:20:00.000000', '2021-02-18 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19672, 928, 141, 'JOINED', '2021-02-18 00:20:00.000000', '2021-02-22 12:20:00.000000'),
(19673, 928, 142, 'JOINED', '2021-02-18 00:20:00.000000', '2021-02-20 07:24:48.000000'),
(19674, 928, 143, 'JOINED', '2021-02-18 00:20:00.000000', '2021-02-21 02:08:00.000000'),
(19675, 928, 144, 'JOINED', '2021-02-18 00:20:00.000000', '2021-02-18 23:44:00.000000'),
(19676, 928, 145, 'JOINED', '2021-02-18 00:20:00.000000', '2021-02-18 15:56:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19672, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-04 16:24:48.000000', '2021-03-04 16:24:48.000000', '2021-03-04 16:29:48.000000'),
(DEFAULT, 19673, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-22 06:27:12.000000', '2021-02-22 06:27:12.000000', '2021-02-22 06:32:12.000000'),
(DEFAULT, 19674, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-22 08:22:24.000000', '2021-02-22 08:22:24.000000', '2021-02-22 08:27:24.000000'),
(DEFAULT, 19675, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-21 13:03:12.000000', '2021-02-21 13:03:12.000000', '2021-02-21 13:08:12.000000'),
(DEFAULT, 19676, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-20 08:36:48.000000', '2021-02-20 08:36:48.000000', '2021-02-20 08:41:48.000000');

-- 2021-02-24 00:20:00.000000
-- 2021-02-24
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (929, 63, 151, NULL, 'Sign Off Meeting Documentation', 'This is Sign Off Meeting Documentation', NULL, 'HARD', 'HR', 'LOW', FALSE, '2021-02-24', '2021-03-12', '2021-03-01', '2021-02-24 00:20:00.000000', '2021-02-24 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19678, 929, 141, 'JOINED', '2021-02-24 00:20:00.000000', '2021-02-24 07:53:36.000000'),
(19679, 929, 142, 'JOINED', '2021-02-24 00:20:00.000000', '2021-02-26 06:41:36.000000'),
(19680, 929, 143, 'JOINED', '2021-02-24 00:20:00.000000', '2021-02-25 18:48:48.000000'),
(19681, 929, 144, 'JOINED', '2021-02-24 00:20:00.000000', '2021-02-28 12:20:00.000000'),
(19682, 929, 145, 'JOINED', '2021-02-24 00:20:00.000000', '2021-02-24 17:29:36.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19678, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-25 11:51:12.000000', '2021-02-25 11:51:12.000000', '2021-02-25 11:56:12.000000'),
(DEFAULT, 19679, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-27 19:03:12.000000', '2021-02-27 19:03:12.000000', '2021-02-27 19:08:12.000000'),
(DEFAULT, 19680, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-02-28 07:03:12.000000', '2021-02-28 07:03:12.000000', '2021-02-28 07:08:12.000000'),
(DEFAULT, 19681, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-12 06:48:48.000000', '2021-03-12 06:48:48.000000', '2021-03-12 06:53:48.000000'),
(DEFAULT, 19682, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-05 07:10:24.000000', '2021-03-05 07:10:24.000000', '2021-03-05 07:15:24.000000');

-- 2021-03-02 00:20:00.000000
-- 2021-03-02
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (930, 63, 151, NULL, 'Publish Internal HR Reports', 'This is Publish Internal HR Reports', NULL, 'HARD', 'HR', 'LOW', FALSE, '2021-03-02', '2021-03-20', '2021-03-07', '2021-03-02 00:20:00.000000', '2021-03-02 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19684, 930, 141, 'JOINED', '2021-03-02 00:20:00.000000', '2021-03-03 19:17:36.000000'),
(19685, 930, 142, 'JOINED', '2021-03-02 00:20:00.000000', '2021-03-03 17:36:48.000000'),
(19686, 930, 143, 'JOINED', '2021-03-02 00:20:00.000000', '2021-03-06 12:20:00.000000'),
(19687, 930, 144, 'JOINED', '2021-03-02 00:20:00.000000', '2021-03-02 13:46:24.000000'),
(19688, 930, 145, 'JOINED', '2021-03-02 00:20:00.000000', '2021-03-06 12:20:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19684, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-06 20:00:48.000000', '2021-03-06 20:00:48.000000', '2021-03-06 20:05:48.000000'),
(DEFAULT, 19685, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-05 23:08:00.000000', '2021-03-05 23:08:00.000000', '2021-03-05 23:13:00.000000'),
(DEFAULT, 19686, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-20 15:20:00.000000', '2021-03-20 15:20:00.000000', '2021-03-20 15:25:00.000000'),
(DEFAULT, 19687, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-04 09:56:00.000000', '2021-03-04 09:56:00.000000', '2021-03-04 10:01:00.000000'),
(DEFAULT, 19688, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-19 01:39:12.000000', '2021-03-19 01:39:12.000000', '2021-03-19 01:44:12.000000');

-- 2021-03-08 00:20:00.000000
-- 2021-03-08
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (931, 63, 151, NULL, 'Notify Relevant Departments', 'This is Notify Relevant Departments', NULL, 'HARD', 'HR', 'LOW', FALSE, '2021-03-08', '2021-03-25', '2021-03-13', '2021-03-08 00:20:00.000000', '2021-03-08 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19690, 931, 141, 'JOINED', '2021-03-08 00:20:00.000000', '2021-03-08 08:15:12.000000'),
(19691, 931, 142, 'JOINED', '2021-03-08 00:20:00.000000', '2021-03-12 12:20:00.000000'),
(19692, 931, 143, 'JOINED', '2021-03-08 00:20:00.000000', '2021-03-10 22:10:24.000000'),
(19693, 931, 144, 'JOINED', '2021-03-08 00:20:00.000000', '2021-03-08 19:39:12.000000'),
(19694, 931, 145, 'JOINED', '2021-03-08 00:20:00.000000', '2021-03-08 00:20:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19690, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-09 02:22:24.000000', '2021-03-09 02:22:24.000000', '2021-03-09 02:27:24.000000'),
(DEFAULT, 19691, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-25 04:03:12.000000', '2021-03-25 04:03:12.000000', '2021-03-25 04:08:12.000000'),
(DEFAULT, 19692, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-15 02:29:36.000000', '2021-03-15 02:29:36.000000', '2021-03-15 02:34:36.000000'),
(DEFAULT, 19693, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-11 11:51:12.000000', '2021-03-11 11:51:12.000000', '2021-03-11 11:56:12.000000'),
(DEFAULT, 19694, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-09 12:27:12.000000', '2021-03-09 12:27:12.000000', '2021-03-09 12:32:12.000000');

-- 2021-03-14 00:20:00.000000
-- 2021-03-14
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (932, 63, 151, NULL, 'Store Reports in HR System', 'This is Store Reports in HR System', NULL, 'HARD', 'HR', 'LOW', FALSE, '2021-03-14', '2021-03-23', '2021-03-19', '2021-03-14 00:20:00.000000', '2021-03-14 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19696, 932, 141, 'JOINED', '2021-03-14 00:20:00.000000', '2021-03-15 14:58:24.000000'),
(19697, 932, 142, 'JOINED', '2021-03-14 00:20:00.000000', '2021-03-14 06:48:48.000000'),
(19698, 932, 143, 'JOINED', '2021-03-14 00:20:00.000000', '2021-03-15 06:20:00.000000'),
(19699, 932, 144, 'JOINED', '2021-03-14 00:20:00.000000', '2021-03-14 11:22:24.000000'),
(19700, 932, 145, 'JOINED', '2021-03-14 00:20:00.000000', '2021-03-14 03:09:12.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19696, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-22 09:41:36.000000', '2021-03-22 09:41:36.000000', '2021-03-22 09:46:36.000000'),
(DEFAULT, 19697, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-15 08:15:12.000000', '2021-03-15 08:15:12.000000', '2021-03-15 08:20:12.000000'),
(DEFAULT, 19698, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-16 04:39:12.000000', '2021-03-16 04:39:12.000000', '2021-03-16 04:44:12.000000'),
(DEFAULT, 19699, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-16 07:39:12.000000', '2021-03-16 07:39:12.000000', '2021-03-16 07:44:12.000000'),
(DEFAULT, 19700, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-23 21:30:48.000000', '2021-03-23 21:30:48.000000', '2021-03-23 21:35:48.000000');

-- 2021-03-20 00:20:00.000000
-- 2021-03-20
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (933, 63, 151, NULL, 'Audit Meeting Documentation', 'This is Audit Meeting Documentation', NULL, 'HARD', 'HR', 'LOW', FALSE, '2021-03-20', '2021-04-05', '2021-03-25', '2021-03-20 00:20:00.000000', '2021-03-20 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19702, 933, 141, 'JOINED', '2021-03-20 00:20:00.000000', '2021-03-22 05:29:36.000000'),
(19703, 933, 142, 'JOINED', '2021-03-20 00:20:00.000000', '2021-03-21 06:20:00.000000'),
(19704, 933, 143, 'JOINED', '2021-03-20 00:20:00.000000', '2021-03-20 19:10:24.000000'),
(19705, 933, 144, 'JOINED', '2021-03-20 00:20:00.000000', '2021-03-21 08:36:48.000000'),
(19706, 933, 145, 'JOINED', '2021-03-20 00:20:00.000000', '2021-03-24 12:20:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19702, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-23 02:00:48.000000', '2021-03-23 02:00:48.000000', '2021-03-23 02:05:48.000000'),
(DEFAULT, 19703, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-24 11:08:00.000000', '2021-03-24 11:08:00.000000', '2021-03-24 11:13:00.000000'),
(DEFAULT, 19704, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-23 23:08:00.000000', '2021-03-23 23:08:00.000000', '2021-03-23 23:13:00.000000'),
(DEFAULT, 19705, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-23 02:44:00.000000', '2021-03-23 02:44:00.000000', '2021-03-23 02:49:00.000000'),
(DEFAULT, 19706, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-05 20:51:12.000000', '2021-04-05 20:51:12.000000', '2021-04-05 20:56:12.000000');

-- 2021-03-26 00:20:00.000000
-- 2021-03-26
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (934, 63, 151, NULL, 'Close Meeting Report Collection', 'This is Close Meeting Report Collection', NULL, 'HARD', 'HR', 'LOW', FALSE, '2021-03-26', '2021-04-12', '2021-03-31', '2021-03-26 00:20:00.000000', '2021-03-26 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19708, 934, 141, 'JOINED', '2021-03-26 00:20:00.000000', '2021-03-28 22:24:48.000000'),
(19709, 934, 142, 'JOINED', '2021-03-26 00:20:00.000000', '2021-03-27 10:17:36.000000'),
(19710, 934, 143, 'JOINED', '2021-03-26 00:20:00.000000', '2021-03-26 18:16:24.000000'),
(19711, 934, 144, 'JOINED', '2021-03-26 00:20:00.000000', '2021-03-26 21:05:36.000000'),
(19712, 934, 145, 'JOINED', '2021-03-26 00:20:00.000000', '2021-03-30 12:20:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19708, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-02 02:15:12.000000', '2021-04-02 02:15:12.000000', '2021-04-02 02:20:12.000000'),
(DEFAULT, 19709, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-03-29 14:15:12.000000', '2021-03-29 14:15:12.000000', '2021-03-29 14:20:12.000000'),
(DEFAULT, 19710, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-04 06:23:36.000000', '2021-04-04 06:23:36.000000', '2021-04-04 06:28:36.000000'),
(DEFAULT, 19711, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-04 03:34:24.000000', '2021-04-04 03:34:24.000000', '2021-04-04 03:39:24.000000'),
(DEFAULT, 19712, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-12 07:39:12.000000', '2021-04-12 07:39:12.000000', '2021-04-12 07:44:12.000000');

-- 2021-04-01 00:20:00.000000
-- 2021-04-01
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (935, 63, 151, NULL, 'Complete Communication Review', 'This is Complete Communication Review', NULL, 'HARD', 'HR', 'LOW', FALSE, '2021-04-01', '2021-04-11', '2021-04-06', '2021-04-01 00:20:00.000000', '2021-04-01 00:20:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19714, 935, 141, 'JOINED', '2021-04-01 00:20:00.000000', '2021-04-01 04:24:48.000000'),
(19715, 935, 142, 'JOINED', '2021-04-01 00:20:00.000000', '2021-04-02 05:58:24.000000'),
(19716, 935, 143, 'JOINED', '2021-04-01 00:20:00.000000', '2021-04-03 05:08:00.000000'),
(19717, 935, 144, 'JOINED', '2021-04-01 00:20:00.000000', '2021-04-02 17:22:24.000000'),
(19718, 935, 145, 'JOINED', '2021-04-01 00:20:00.000000', '2021-04-01 00:23:36.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19714, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-02 07:24:48.000000', '2021-04-02 07:24:48.000000', '2021-04-02 07:29:48.000000'),
(DEFAULT, 19715, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-03 11:51:12.000000', '2021-04-03 11:51:12.000000', '2021-04-03 11:56:12.000000'),
(DEFAULT, 19716, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-08 19:32:00.000000', '2021-04-08 19:32:00.000000', '2021-04-08 19:37:00.000000'),
(DEFAULT, 19717, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-05 15:20:00.000000', '2021-04-05 15:20:00.000000', '2021-04-05 15:25:00.000000'),
(DEFAULT, 19718, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-11 00:16:24.000000', '2021-04-11 00:16:24.000000', '2021-04-11 00:21:24.000000');

INSERT INTO collection (`id`, `created_time`, `description`, `due_date`, `start_date`, `name`, `updated_time`, `phase_id`, `created_by_id`)
VALUES (64, '2021-04-06 00:20:00.000000', 'This is Employee Records & Compliance', '2021-11-25', '2021-04-06', 'Employee Records & Compliance', '2021-04-06 00:20:00.000000', 11, 154);


-- 2021-04-07 00:25:00.000000
-- 2021-04-07
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (936, 64, 151, NULL, 'Update Employee Personal Records', 'This is Update Employee Personal Records', NULL, 'HARD', 'HR', 'LOW', FALSE, '2021-04-07', '2021-04-22', '2021-04-12', '2021-04-07 00:25:00.000000', '2021-04-07 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19720, 936, 141, 'JOINED', '2021-04-07 00:25:00.000000', '2021-04-08 17:34:36.000000'),
(19721, 936, 142, 'JOINED', '2021-04-07 00:25:00.000000', '2021-04-10 15:32:12.000000'),
(19722, 936, 143, 'JOINED', '2021-04-07 00:25:00.000000', '2021-04-11 12:25:00.000000'),
(19723, 936, 144, 'JOINED', '2021-04-07 00:25:00.000000', '2021-04-11 12:25:00.000000'),
(19724, 936, 145, 'JOINED', '2021-04-07 00:25:00.000000', '2021-04-11 12:25:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19720, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-09 21:53:48.000000', '2021-04-09 21:53:48.000000', '2021-04-09 21:58:48.000000'),
(DEFAULT, 19721, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-11 11:05:48.000000', '2021-04-11 11:05:48.000000', '2021-04-11 11:10:48.000000'),
(DEFAULT, 19722, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-22 00:10:36.000000', '2021-04-22 00:10:36.000000', '2021-04-22 00:15:36.000000'),
(DEFAULT, 19723, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-22 06:17:48.000000', '2021-04-22 06:17:48.000000', '2021-04-22 06:22:48.000000'),
(DEFAULT, 19724, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-22 12:25:00.000000', '2021-04-22 12:25:00.000000', '2021-04-22 12:30:00.000000');

-- 2021-04-13 00:25:00.000000
-- 2021-04-13
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (937, 64, 151, NULL, 'Verify Employee Contact Information', 'This is Verify Employee Contact Information', NULL, 'HARD', 'HR', 'LOW', FALSE, '2021-04-13', '2021-04-28', '2021-04-18', '2021-04-13 00:25:00.000000', '2021-04-13 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19726, 937, 141, 'JOINED', '2021-04-13 00:25:00.000000', '2021-04-14 03:39:24.000000'),
(19727, 937, 142, 'JOINED', '2021-04-13 00:25:00.000000', '2021-04-13 01:08:12.000000'),
(19728, 937, 143, 'JOINED', '2021-04-13 00:25:00.000000', '2021-04-13 04:08:12.000000'),
(19729, 937, 144, 'JOINED', '2021-04-13 00:25:00.000000', '2021-04-17 12:25:00.000000'),
(19730, 937, 145, 'JOINED', '2021-04-13 00:25:00.000000', '2021-04-14 16:37:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19726, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-17 21:32:12.000000', '2021-04-17 21:32:12.000000', '2021-04-17 21:37:12.000000'),
(DEFAULT, 19727, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-14 12:17:48.000000', '2021-04-14 12:17:48.000000', '2021-04-14 12:22:48.000000'),
(DEFAULT, 19728, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-14 02:05:48.000000', '2021-04-14 02:05:48.000000', '2021-04-14 02:10:48.000000'),
(DEFAULT, 19729, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-28 05:41:48.000000', '2021-04-28 05:41:48.000000', '2021-04-28 05:46:48.000000'),
(DEFAULT, 19730, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-21 08:13:00.000000', '2021-04-21 08:13:00.000000', '2021-04-21 08:18:00.000000');

-- 2021-04-19 00:25:00.000000
-- 2021-04-19
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (938, 64, 151, NULL, 'Maintain Employment History Files', 'This is Maintain Employment History Files', NULL, 'HARD', 'HR', 'LOW', FALSE, '2021-04-19', '2021-05-08', '2021-04-24', '2021-04-19 00:25:00.000000', '2021-04-19 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19732, 938, 141, 'JOINED', '2021-04-19 00:25:00.000000', '2021-04-22 13:29:48.000000'),
(19733, 938, 142, 'JOINED', '2021-04-19 00:25:00.000000', '2021-04-19 17:13:00.000000'),
(19734, 938, 143, 'JOINED', '2021-04-19 00:25:00.000000', '2021-04-22 02:13:00.000000'),
(19735, 938, 144, 'JOINED', '2021-04-19 00:25:00.000000', '2021-04-20 11:34:36.000000'),
(19736, 938, 145, 'JOINED', '2021-04-19 00:25:00.000000', '2021-04-23 12:25:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19732, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-23 10:01:00.000000', '2021-04-23 10:01:00.000000', '2021-04-23 10:06:00.000000'),
(DEFAULT, 19733, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-20 21:25:00.000000', '2021-04-20 21:25:00.000000', '2021-04-20 21:30:00.000000'),
(DEFAULT, 19734, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-22 21:25:00.000000', '2021-04-22 21:25:00.000000', '2021-04-22 21:30:00.000000'),
(DEFAULT, 19735, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-22 23:49:00.000000', '2021-04-22 23:49:00.000000', '2021-04-22 23:54:00.000000'),
(DEFAULT, 19736, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-08 08:13:00.000000', '2021-05-08 08:13:00.000000', '2021-05-08 08:18:00.000000');

-- 2021-04-25 00:25:00.000000
-- 2021-04-25
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (939, 64, 151, NULL, 'Review Labor Contract Compliance', 'This is Review Labor Contract Compliance', NULL, 'HARD', 'HR', 'LOW', FALSE, '2021-04-25', '2021-05-03', '2021-04-30', '2021-04-25 00:25:00.000000', '2021-04-25 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19738, 939, 141, 'JOINED', '2021-04-25 00:25:00.000000', '2021-04-25 05:27:24.000000'),
(19739, 939, 142, 'JOINED', '2021-04-25 00:25:00.000000', '2021-04-26 16:33:24.000000'),
(19740, 939, 143, 'JOINED', '2021-04-25 00:25:00.000000', '2021-04-25 04:08:12.000000'),
(19741, 939, 144, 'JOINED', '2021-04-25 00:25:00.000000', '2021-04-25 10:01:00.000000'),
(19742, 939, 145, 'JOINED', '2021-04-25 00:25:00.000000', '2021-04-26 11:27:24.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19738, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-27 22:58:36.000000', '2021-04-27 22:58:36.000000', '2021-04-27 23:03:36.000000'),
(DEFAULT, 19739, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-03 08:16:36.000000', '2021-05-03 08:16:36.000000', '2021-05-03 08:21:36.000000'),
(DEFAULT, 19740, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-26 10:08:12.000000', '2021-04-26 10:08:12.000000', '2021-04-26 10:13:12.000000'),
(DEFAULT, 19741, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-04-28 15:53:48.000000', '2021-04-28 15:53:48.000000', '2021-04-28 15:58:48.000000'),
(DEFAULT, 19742, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-03 13:22:36.000000', '2021-05-03 13:22:36.000000', '2021-05-03 13:27:36.000000');

-- 2021-05-01 00:25:00.000000
-- 2021-05-01
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (940, 64, 151, NULL, 'Update Job Title Records', 'This is Update Job Title Records', NULL, 'HARD', 'HR', 'LOW', FALSE, '2021-05-01', '2021-05-18', '2021-05-06', '2021-05-01 00:25:00.000000', '2021-05-01 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19744, 940, 141, 'JOINED', '2021-05-01 00:25:00.000000', '2021-05-01 23:27:24.000000'),
(19745, 940, 142, 'JOINED', '2021-05-01 00:25:00.000000', '2021-05-01 04:29:48.000000'),
(19746, 940, 143, 'JOINED', '2021-05-01 00:25:00.000000', '2021-05-02 01:51:24.000000'),
(19747, 940, 144, 'JOINED', '2021-05-01 00:25:00.000000', '2021-05-05 12:25:00.000000'),
(19748, 940, 145, 'JOINED', '2021-05-01 00:25:00.000000', '2021-05-01 16:44:12.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19744, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-03 14:13:00.000000', '2021-05-03 14:13:00.000000', '2021-05-03 14:18:00.000000'),
(DEFAULT, 19745, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-02 02:56:12.000000', '2021-05-02 02:56:12.000000', '2021-05-02 03:01:12.000000'),
(DEFAULT, 19746, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-03 05:34:36.000000', '2021-05-03 05:34:36.000000', '2021-05-03 05:39:36.000000'),
(DEFAULT, 19747, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-18 21:53:48.000000', '2021-05-18 21:53:48.000000', '2021-05-18 21:58:48.000000'),
(DEFAULT, 19748, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-03 14:41:48.000000', '2021-05-03 14:41:48.000000', '2021-05-03 14:46:48.000000');

-- 2021-05-07 00:25:00.000000
-- 2021-05-07
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (941, 64, 151, NULL, 'Update Department Assignment', 'This is Update Department Assignment', NULL, 'HARD', 'HR', 'LOW', FALSE, '2021-05-07', '2021-05-11', '2021-05-12', '2021-05-07 00:25:00.000000', '2021-05-07 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19750, 941, 141, 'JOINED', '2021-05-07 00:25:00.000000', '2021-05-09 13:15:24.000000'),
(19751, 941, 142, 'JOINED', '2021-05-07 00:25:00.000000', '2021-05-07 03:39:24.000000'),
(19752, 941, 143, 'JOINED', '2021-05-07 00:25:00.000000', '2021-05-09 05:05:48.000000'),
(19753, 941, 144, 'JOINED', '2021-05-07 00:25:00.000000', '2021-05-07 03:25:00.000000'),
(19754, 941, 145, 'JOINED', '2021-05-07 00:25:00.000000', '2021-05-07 10:15:24.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19750, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-11 17:41:48.000000', '2021-05-11 17:41:48.000000', '2021-05-11 17:46:48.000000'),
(DEFAULT, 19751, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-08 15:17:48.000000', '2021-05-08 15:17:48.000000', '2021-05-08 15:22:48.000000'),
(DEFAULT, 19752, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-11 14:34:36.000000', '2021-05-11 14:34:36.000000', '2021-05-11 14:39:36.000000'),
(DEFAULT, 19753, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-09 12:03:24.000000', '2021-05-09 12:03:24.000000', '2021-05-09 12:08:24.000000'),
(DEFAULT, 19754, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-09 18:32:12.000000', '2021-05-09 18:32:12.000000', '2021-05-09 18:37:12.000000');

-- 2021-05-13 00:25:00.000000
-- 2021-05-13
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (942, 64, 151, NULL, 'Track Employee Status Changes', 'This is Track Employee Status Changes', NULL, 'HARD', 'HR', 'URGENT', FALSE, '2021-05-13', '2021-06-11', '2021-05-21', '2021-05-13 00:25:00.000000', '2021-05-13 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19756, 942, 141, 'JOINED', '2021-05-13 00:25:00.000000', '2021-05-20 05:13:00.000000'),
(19757, 942, 142, 'JOINED', '2021-05-13 00:25:00.000000', '2021-05-13 16:55:43.200000'),
(19758, 942, 144, 'JOINED', '2021-05-13 00:25:00.000000', '2021-05-20 05:13:00.000000'),
(19759, 942, 145, 'JOINED', '2021-05-13 00:25:00.000000', '2021-05-13 15:46:36.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19756, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-06-05 09:03:24.000000', '2021-06-05 09:03:24.000000', '2021-06-05 09:08:24.000000'),
(DEFAULT, 19757, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-28 07:54:16.800000', '2021-05-28 07:54:16.800000', '2021-05-28 07:59:16.800000'),
(DEFAULT, 19758, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-06-11 20:23:04.800000', '2021-06-11 20:23:04.800000', '2021-06-11 20:28:04.800000'),
(DEFAULT, 19759, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-18 20:11:33.600000', '2021-05-18 20:11:33.600000', '2021-05-18 20:16:33.600000');

-- 2021-05-22 00:25:00.000000
-- 2021-05-22
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (943, 64, 151, NULL, 'Archive Resigned Employee Files', 'This is Archive Resigned Employee Files', NULL, 'HARD', 'HR', 'URGENT', FALSE, '2021-05-22', '2021-06-19', '2021-05-30', '2021-05-22 00:25:00.000000', '2021-05-22 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19761, 943, 141, 'JOINED', '2021-05-22 00:25:00.000000', '2021-05-22 10:47:04.800000'),
(19762, 943, 142, 'JOINED', '2021-05-22 00:25:00.000000', '2021-05-29 05:13:00.000000'),
(19763, 943, 144, 'JOINED', '2021-05-22 00:25:00.000000', '2021-05-22 00:48:02.400000'),
(19764, 943, 145, 'JOINED', '2021-05-22 00:25:00.000000', '2021-05-29 05:13:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19761, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-26 14:25:57.600000', '2021-05-26 14:25:57.600000', '2021-05-26 14:30:57.600000'),
(DEFAULT, 19762, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-06-14 08:17:19.200000', '2021-06-14 08:17:19.200000', '2021-06-14 08:22:19.200000'),
(DEFAULT, 19763, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-05-27 04:38:26.400000', '2021-05-27 04:38:26.400000', '2021-05-27 04:43:26.400000'),
(DEFAULT, 19764, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-06-19 08:51:52.800000', '2021-06-19 08:51:52.800000', '2021-06-19 08:56:52.800000');

-- 2021-05-31 00:25:00.000000
-- 2021-05-31
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (944, 64, 151, NULL, 'Prepare Compliance Audit Files', 'This is Prepare Compliance Audit Files', NULL, 'HARD', 'HR', 'URGENT', FALSE, '2021-05-31', '2021-06-26', '2021-06-08', '2021-05-31 00:25:00.000000', '2021-05-31 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19766, 944, 141, 'JOINED', '2021-05-31 00:25:00.000000', '2021-06-07 05:13:00.000000'),
(19767, 944, 142, 'JOINED', '2021-05-31 00:25:00.000000', '2021-05-31 02:43:14.400000'),
(19768, 944, 144, 'JOINED', '2021-05-31 00:25:00.000000', '2021-06-01 16:03:52.800000'),
(19769, 944, 145, 'JOINED', '2021-05-31 00:25:00.000000', '2021-06-01 04:21:09.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19766, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-06-26 01:34:07.200000', '2021-06-26 01:34:07.200000', '2021-06-26 01:39:07.200000'),
(DEFAULT, 19767, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-06-04 03:52:21.600000', '2021-06-04 03:52:21.600000', '2021-06-04 03:57:21.600000'),
(DEFAULT, 19768, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-06-14 08:46:07.200000', '2021-06-14 08:46:07.200000', '2021-06-14 08:51:07.200000'),
(DEFAULT, 19769, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-06-14 20:28:50.400000', '2021-06-14 20:28:50.400000', '2021-06-14 20:33:50.400000');

-- 2021-06-09 00:25:00.000000
-- 2021-06-09
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (945, 64, 151, NULL, 'Verify Legal Document Storage', 'This is Verify Legal Document Storage', NULL, 'HARD', 'HR', 'URGENT', FALSE, '2021-06-09', '2021-07-07', '2021-06-17', '2021-06-09 00:25:00.000000', '2021-06-09 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19771, 945, 141, 'JOINED', '2021-06-09 00:25:00.000000', '2021-06-09 16:21:09.600000'),
(19772, 945, 142, 'JOINED', '2021-06-09 00:25:00.000000', '2021-06-16 05:13:00.000000'),
(19773, 945, 144, 'JOINED', '2021-06-09 00:25:00.000000', '2021-06-10 10:52:50.400000'),
(19774, 945, 145, 'JOINED', '2021-06-09 00:25:00.000000', '2021-06-16 05:13:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19771, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-06-24 08:28:50.400000', '2021-06-24 08:28:50.400000', '2021-06-24 08:33:50.400000'),
(DEFAULT, 19772, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-07 18:04:50.400000', '2021-07-07 18:04:50.400000', '2021-07-07 18:09:50.400000'),
(DEFAULT, 19773, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-06-23 13:57:09.600000', '2021-06-23 13:57:09.600000', '2021-06-23 14:02:09.600000'),
(DEFAULT, 19774, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-03 12:53:48.000000', '2021-07-03 12:53:48.000000', '2021-07-03 12:58:48.000000');

-- 2021-06-18 00:25:00.000000
-- 2021-06-18
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (946, 64, 151, NULL, 'Review Data Privacy Compliance', 'This is Review Data Privacy Compliance', NULL, 'HARD', 'HR', 'URGENT', FALSE, '2021-06-18', '2021-07-18', '2021-06-26', '2021-06-18 00:25:00.000000', '2021-06-18 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19776, 946, 141, 'JOINED', '2021-06-18 00:25:00.000000', '2021-06-18 21:55:14.400000'),
(19777, 946, 142, 'JOINED', '2021-06-18 00:25:00.000000', '2021-06-19 12:42:16.800000'),
(19778, 946, 144, 'JOINED', '2021-06-18 00:25:00.000000', '2021-06-25 05:13:00.000000'),
(19779, 946, 145, 'JOINED', '2021-06-18 00:25:00.000000', '2021-06-18 06:45:09.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19776, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-06-23 20:23:04.800000', '2021-06-23 20:23:04.800000', '2021-06-23 20:28:04.800000'),
(DEFAULT, 19777, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-02 12:07:43.200000', '2021-07-02 12:07:43.200000', '2021-07-02 12:12:43.200000'),
(DEFAULT, 19778, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-18 15:58:07.200000', '2021-07-18 15:58:07.200000', '2021-07-18 16:03:07.200000'),
(DEFAULT, 19779, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-06-22 20:34:36.000000', '2021-06-22 20:34:36.000000', '2021-06-22 20:39:36.000000');

-- 2021-06-27 00:25:00.000000
-- 2021-06-27
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (947, 64, 151, NULL, 'Prepare HR Compliance Checklist', 'This is Prepare HR Compliance Checklist', NULL, 'HARD', 'HR', 'URGENT', FALSE, '2021-06-27', '2021-07-23', '2021-07-05', '2021-06-27 00:25:00.000000', '2021-06-27 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19781, 947, 141, 'JOINED', '2021-06-27 00:25:00.000000', '2021-06-28 10:58:36.000000'),
(19782, 947, 142, 'JOINED', '2021-06-27 00:25:00.000000', '2021-06-30 17:18:45.600000'),
(19783, 947, 144, 'JOINED', '2021-06-27 00:25:00.000000', '2021-07-04 05:13:00.000000'),
(19784, 947, 145, 'JOINED', '2021-06-27 00:25:00.000000', '2021-07-04 05:13:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19781, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-11 13:51:24.000000', '2021-07-11 13:51:24.000000', '2021-07-11 13:56:24.000000'),
(DEFAULT, 19782, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-04 23:04:21.600000', '2021-07-04 23:04:21.600000', '2021-07-04 23:09:21.600000'),
(DEFAULT, 19783, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-21 05:59:04.800000', '2021-07-21 05:59:04.800000', '2021-07-21 06:04:04.800000'),
(DEFAULT, 19784, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-23 19:48:31.200000', '2021-07-23 19:48:31.200000', '2021-07-23 19:53:31.200000');

-- 2021-07-06 00:25:00.000000
-- 2021-07-06
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (948, 64, 151, NULL, 'Conduct Internal HR Audit', 'This is Conduct Internal HR Audit', NULL, 'HARD', 'HR', 'URGENT', FALSE, '2021-07-06', '2021-08-05', '2021-07-14', '2021-07-06 00:25:00.000000', '2021-07-06 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19786, 948, 141, 'JOINED', '2021-07-06 00:25:00.000000', '2021-07-13 05:13:00.000000'),
(19787, 948, 142, 'JOINED', '2021-07-06 00:25:00.000000', '2021-07-06 06:10:36.000000'),
(19788, 948, 144, 'JOINED', '2021-07-06 00:25:00.000000', '2021-07-09 04:15:24.000000'),
(19789, 948, 145, 'JOINED', '2021-07-06 00:25:00.000000', '2021-07-06 03:29:19.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19786, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-04 23:50:26.400000', '2021-08-04 23:50:26.400000', '2021-08-04 23:55:26.400000'),
(DEFAULT, 19787, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-12 11:10:07.200000', '2021-07-12 11:10:07.200000', '2021-07-12 11:15:07.200000'),
(DEFAULT, 19788, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-13 17:41:48.000000', '2021-07-13 17:41:48.000000', '2021-07-13 17:46:48.000000'),
(DEFAULT, 19789, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-10 18:16:21.600000', '2021-07-10 18:16:21.600000', '2021-07-10 18:21:21.600000');

-- 2021-07-15 00:25:00.000000
-- 2021-07-15
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (949, 64, 151, NULL, 'Resolve Compliance Gaps', 'This is Resolve Compliance Gaps', NULL, 'HARD', 'HR', 'URGENT', FALSE, '2021-07-15', '2021-08-14', '2021-07-23', '2021-07-15 00:25:00.000000', '2021-07-15 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19791, 949, 141, 'JOINED', '2021-07-15 00:25:00.000000', '2021-07-22 05:13:00.000000'),
(19792, 949, 142, 'JOINED', '2021-07-15 00:25:00.000000', '2021-07-22 05:13:00.000000'),
(19793, 949, 144, 'JOINED', '2021-07-15 00:25:00.000000', '2021-07-15 02:20:12.000000'),
(19794, 949, 145, 'JOINED', '2021-07-15 00:25:00.000000', '2021-07-16 14:37:28.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19791, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-10 00:01:57.600000', '2021-08-10 00:01:57.600000', '2021-08-10 00:06:57.600000'),
(DEFAULT, 19792, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-14 09:37:57.600000', '2021-08-14 09:37:57.600000', '2021-08-14 09:42:57.600000'),
(DEFAULT, 19793, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-30 22:29:48.000000', '2021-07-30 22:29:48.000000', '2021-07-30 22:34:48.000000'),
(DEFAULT, 19794, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-21 03:06:16.800000', '2021-07-21 03:06:16.800000', '2021-07-21 03:11:16.800000');

-- 2021-07-24 00:25:00.000000
-- 2021-07-24
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (950, 64, 151, NULL, 'Document Audit Findings', 'This is Document Audit Findings', NULL, 'HARD', 'HR', 'HIGH', FALSE, '2021-07-24', '2021-08-17', '2021-07-31', '2021-07-24 00:25:00.000000', '2021-07-24 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19796, 950, 142, 'JOINED', '2021-07-24 00:25:00.000000', '2021-07-30 07:37:00.000000'),
(19797, 950, 143, 'JOINED', '2021-07-24 00:25:00.000000', '2021-07-27 00:29:19.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19796, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-17 08:33:09.600000', '2021-08-17 08:33:09.600000', '2021-08-17 08:38:09.600000'),
(DEFAULT, 19797, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-07-29 12:58:07.200000', '2021-07-29 12:58:07.200000', '2021-07-29 13:03:07.200000');

-- 2021-08-01 00:25:00.000000
-- 2021-08-01
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (951, 64, 151, NULL, 'Prepare Audit Summary Report', 'This is Prepare Audit Summary Report', NULL, 'ADVANCED', 'HR', 'URGENT', FALSE, '2021-08-01', '2021-08-14', '2021-08-08', '2021-08-01 00:25:00.000000', '2021-08-01 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19799, 951, 141, 'JOINED', '2021-08-01 00:25:00.000000', '2021-08-01 16:42:45.600000'),
(19800, 951, 142, 'JOINED', '2021-08-01 00:25:00.000000', '2021-08-04 00:49:28.800000'),
(19801, 951, 143, 'JOINED', '2021-08-01 00:25:00.000000', '2021-08-01 06:48:02.400000'),
(19802, 951, 144, 'JOINED', '2021-08-01 00:25:00.000000', '2021-08-01 14:31:43.200000'),
(19803, 951, 145, 'JOINED', '2021-08-01 00:25:00.000000', '2021-08-02 03:58:07.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19799, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-05 03:52:21.600000', '2021-08-05 03:52:21.600000', '2021-08-05 03:57:21.600000'),
(DEFAULT, 19800, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-06 22:52:50.400000', '2021-08-06 22:52:50.400000', '2021-08-06 22:57:50.400000'),
(DEFAULT, 19801, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-03 18:06:16.800000', '2021-08-03 18:06:16.800000', '2021-08-03 18:11:16.800000'),
(DEFAULT, 19802, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-14 10:18:16.800000', '2021-08-14 10:18:16.800000', '2021-08-14 10:23:16.800000'),
(DEFAULT, 19803, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-07 10:48:31.200000', '2021-08-07 10:48:31.200000', '2021-08-07 10:53:31.200000');

-- 2021-08-09 00:25:00.000000
-- 2021-08-09
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (952, 64, 151, NULL, 'Submit Compliance Report', 'This is Submit Compliance Report', NULL, 'NORMAL', 'HR', 'LOW', FALSE, '2021-08-09', '2021-08-11', '2021-08-12', '2021-08-09 00:25:00.000000', '2021-08-09 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19805, 952, 145, 'JOINED', '2021-08-09 00:25:00.000000', '2021-08-10 02:15:52.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19805, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-11 11:44:40.800000', '2021-08-11 11:44:40.800000', '2021-08-11 11:49:40.800000');

-- 2021-08-13 00:25:00.000000
-- 2021-08-13
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (953, 64, 151, NULL, 'Update HR Policies Documentation', 'This is Update HR Policies Documentation', NULL, 'ADVANCED', 'HR', 'URGENT', FALSE, '2021-08-13', '2021-09-03', '2021-08-20', '2021-08-13 00:25:00.000000', '2021-08-13 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19807, 953, 141, 'JOINED', '2021-08-13 00:25:00.000000', '2021-08-16 00:49:28.800000'),
(19808, 953, 142, 'JOINED', '2021-08-13 00:25:00.000000', '2021-08-16 08:02:55.200000'),
(19809, 953, 143, 'JOINED', '2021-08-13 00:25:00.000000', '2021-08-14 23:07:14.400000'),
(19810, 953, 144, 'JOINED', '2021-08-13 00:25:00.000000', '2021-08-19 07:37:00.000000'),
(19811, 953, 145, 'JOINED', '2021-08-13 00:25:00.000000', '2021-08-14 14:02:55.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19807, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-19 02:24:31.200000', '2021-08-19 02:24:31.200000', '2021-08-19 02:29:31.200000'),
(DEFAULT, 19808, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-18 19:51:24.000000', '2021-08-18 19:51:24.000000', '2021-08-18 19:56:24.000000'),
(DEFAULT, 19809, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-18 08:05:48.000000', '2021-08-18 08:05:48.000000', '2021-08-18 08:10:48.000000'),
(DEFAULT, 19810, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-09-03 17:53:19.200000', '2021-09-03 17:53:19.200000', '2021-09-03 17:58:19.200000'),
(DEFAULT, 19811, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-18 10:26:55.200000', '2021-08-18 10:26:55.200000', '2021-08-18 10:31:55.200000');

-- 2021-08-21 00:25:00.000000
-- 2021-08-21
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (954, 64, 151, NULL, 'Communicate Policy Updates', 'This is Communicate Policy Updates', NULL, 'NORMAL', 'HR', 'NORMAL', FALSE, '2021-08-21', '2021-08-24', '2021-08-25', '2021-08-21 00:25:00.000000', '2021-08-21 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19813, 954, 144, 'JOINED', '2021-08-21 00:25:00.000000', '2021-08-23 11:56:12.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19813, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-24 02:37:28.800000', '2021-08-24 02:37:28.800000', '2021-08-24 02:42:28.800000');

-- 2021-08-26 00:25:00.000000
-- 2021-08-26
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (955, 64, 151, NULL, 'Collect Policy Acknowledgements', 'This is Collect Policy Acknowledgements', NULL, 'ADVANCED', 'HR', 'URGENT', FALSE, '2021-08-26', '2021-09-21', '2021-09-02', '2021-08-26 00:25:00.000000', '2021-08-26 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19815, 955, 141, 'JOINED', '2021-08-26 00:25:00.000000', '2021-08-28 11:53:19.200000'),
(19816, 955, 142, 'JOINED', '2021-08-26 00:25:00.000000', '2021-08-28 02:08:40.800000'),
(19817, 955, 143, 'JOINED', '2021-08-26 00:25:00.000000', '2021-08-26 13:11:04.800000'),
(19818, 955, 144, 'JOINED', '2021-08-26 00:25:00.000000', '2021-09-01 07:37:00.000000'),
(19819, 955, 145, 'JOINED', '2021-08-26 00:25:00.000000', '2021-08-27 01:37:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19815, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-30 20:20:12.000000', '2021-08-30 20:20:12.000000', '2021-08-30 20:25:12.000000'),
(DEFAULT, 19816, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-30 18:19:14.400000', '2021-08-30 18:19:14.400000', '2021-08-30 18:24:14.400000'),
(DEFAULT, 19817, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-29 20:59:04.800000', '2021-08-29 20:59:04.800000', '2021-08-29 21:04:04.800000'),
(DEFAULT, 19818, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-09-21 18:20:40.800000', '2021-09-21 18:20:40.800000', '2021-09-21 18:25:40.800000'),
(DEFAULT, 19819, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-08-31 00:32:12.000000', '2021-08-31 00:32:12.000000', '2021-08-31 00:37:12.000000');

-- 2021-09-03 00:25:00.000000
-- 2021-09-03
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (956, 64, 151, NULL, 'Verify Acknowledgement Completion', 'This is Verify Acknowledgement Completion', NULL, 'NORMAL', 'HR', 'NORMAL', FALSE, '2021-09-03', '2021-09-04', '2021-09-07', '2021-09-03 00:25:00.000000', '2021-09-03 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19821, 956, 144, 'JOINED', '2021-09-03 00:25:00.000000', '2021-09-03 05:30:16.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19821, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-09-04 09:26:26.400000', '2021-09-04 09:26:26.400000', '2021-09-04 09:31:26.400000');

-- 2021-09-08 00:25:00.000000
-- 2021-09-08
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (957, 64, 151, NULL, 'Archive Policy Documents', 'This is Archive Policy Documents', NULL, 'ADVANCED', 'HR', 'URGENT', FALSE, '2021-09-08', '2021-10-03', '2021-09-15', '2021-09-08 00:25:00.000000', '2021-09-08 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19823, 957, 141, 'JOINED', '2021-09-08 00:25:00.000000', '2021-09-08 23:36:02.400000'),
(19824, 957, 142, 'JOINED', '2021-09-08 00:25:00.000000', '2021-09-08 20:24:31.200000'),
(19825, 957, 143, 'JOINED', '2021-09-08 00:25:00.000000', '2021-09-11 13:25:28.800000'),
(19826, 957, 144, 'JOINED', '2021-09-08 00:25:00.000000', '2021-09-14 07:37:00.000000'),
(19827, 957, 145, 'JOINED', '2021-09-08 00:25:00.000000', '2021-09-08 07:33:24.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19823, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-09-12 05:23:04.800000', '2021-09-12 05:23:04.800000', '2021-09-12 05:28:04.800000'),
(DEFAULT, 19824, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-09-21 04:25:28.800000', '2021-09-21 04:25:28.800000', '2021-09-21 04:30:28.800000'),
(DEFAULT, 19825, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-09-14 16:31:14.400000', '2021-09-14 16:31:14.400000', '2021-09-14 16:36:14.400000'),
(DEFAULT, 19826, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-10-03 13:26:55.200000', '2021-10-03 13:26:55.200000', '2021-10-03 13:31:55.200000'),
(DEFAULT, 19827, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-09-21 17:16:36.000000', '2021-09-21 17:16:36.000000', '2021-09-21 17:21:36.000000');

-- 2021-09-16 00:25:00.000000
-- 2021-09-16
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (958, 64, 151, NULL, 'Prepare Compliance Training Materials', 'This is Prepare Compliance Training Materials', NULL, 'NORMAL', 'HR', 'NORMAL', FALSE, '2021-09-16', '2021-09-19', '2021-09-20', '2021-09-16 00:25:00.000000', '2021-09-16 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19829, 958, 144, 'JOINED', '2021-09-16 00:25:00.000000', '2021-09-18 20:23:04.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19829, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-09-19 12:59:33.600000', '2021-09-19 12:59:33.600000', '2021-09-19 13:04:33.600000');

-- 2021-09-21 00:25:00.000000
-- 2021-09-21
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (959, 64, 151, NULL, 'Record Training Attendance', 'This is Record Training Attendance', NULL, 'ADVANCED', 'HR', 'HIGH', FALSE, '2021-09-21', '2021-09-25', '2021-09-27', '2021-09-21 00:25:00.000000', '2021-09-21 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19831, 959, 141, 'JOINED', '2021-09-21 00:25:00.000000', '2021-09-21 16:41:19.200000'),
(19832, 959, 142, 'JOINED', '2021-09-21 00:25:00.000000', '2021-09-23 14:46:07.200000'),
(19833, 959, 143, 'JOINED', '2021-09-21 00:25:00.000000', '2021-09-21 04:26:55.200000'),
(19834, 959, 144, 'JOINED', '2021-09-21 00:25:00.000000', '2021-09-21 22:26:55.200000'),
(19835, 959, 145, 'JOINED', '2021-09-21 00:25:00.000000', '2021-09-21 17:41:48.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19831, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-09-23 14:28:50.400000', '2021-09-23 14:28:50.400000', '2021-09-23 14:33:50.400000'),
(DEFAULT, 19832, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-09-25 02:20:12.000000', '2021-09-25 02:20:12.000000', '2021-09-25 02:25:12.000000'),
(DEFAULT, 19833, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-09-22 22:55:43.200000', '2021-09-22 22:55:43.200000', '2021-09-22 23:00:43.200000'),
(DEFAULT, 19834, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-09-24 12:13:28.800000', '2021-09-24 12:13:28.800000', '2021-09-24 12:18:28.800000'),
(DEFAULT, 19835, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-09-24 19:16:50.400000', '2021-09-24 19:16:50.400000', '2021-09-24 19:21:50.400000');

-- 2021-09-28 00:25:00.000000
-- 2021-09-28
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (960, 64, 151, NULL, 'Evaluate Training Effectiveness', 'This is Evaluate Training Effectiveness', NULL, 'NORMAL', 'HR', 'HIGH', FALSE, '2021-09-28', '2021-09-29', '2021-10-03', '2021-09-28 00:25:00.000000', '2021-09-28 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19837, 960, 144, 'JOINED', '2021-09-28 00:25:00.000000', '2021-09-28 05:41:48.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19837, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-09-29 09:17:48.000000', '2021-09-29 09:17:48.000000', '2021-09-29 09:22:48.000000');

-- 2021-10-04 00:25:00.000000
-- 2021-10-04
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (961, 64, 151, NULL, 'Update Compliance Metrics', 'This is Update Compliance Metrics', NULL, 'ADVANCED', 'HR', 'HIGH', FALSE, '2021-10-04', '2021-10-09', '2021-10-10', '2021-10-04 00:25:00.000000', '2021-10-04 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19839, 961, 141, 'JOINED', '2021-10-04 00:25:00.000000', '2021-10-06 04:24:02.400000'),
(19840, 961, 142, 'JOINED', '2021-10-04 00:25:00.000000', '2021-10-07 16:15:24.000000'),
(19841, 961, 143, 'JOINED', '2021-10-04 00:25:00.000000', '2021-10-05 21:20:40.800000'),
(19842, 961, 144, 'JOINED', '2021-10-04 00:25:00.000000', '2021-10-04 02:00:02.400000'),
(19843, 961, 145, 'JOINED', '2021-10-04 00:25:00.000000', '2021-10-05 23:13:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19839, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-10-08 13:42:45.600000', '2021-10-08 13:42:45.600000', '2021-10-08 13:47:45.600000'),
(DEFAULT, 19840, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-10-09 15:37:57.600000', '2021-10-09 15:37:57.600000', '2021-10-09 15:42:57.600000'),
(DEFAULT, 19841, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-10-07 07:11:04.800000', '2021-10-07 07:11:04.800000', '2021-10-07 07:16:04.800000'),
(DEFAULT, 19842, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-10-06 21:32:12.000000', '2021-10-06 21:32:12.000000', '2021-10-06 21:37:12.000000'),
(DEFAULT, 19843, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-10-08 01:02:26.400000', '2021-10-08 01:02:26.400000', '2021-10-08 01:07:26.400000');

-- 2021-10-11 00:25:00.000000
-- 2021-10-11
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (962, 64, 151, NULL, 'Review Regulatory Changes', 'This is Review Regulatory Changes', NULL, 'NORMAL', 'HR', 'HIGH', FALSE, '2021-10-11', '2021-10-14', '2021-10-16', '2021-10-11 00:25:00.000000', '2021-10-11 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19845, 962, 144, 'JOINED', '2021-10-11 00:25:00.000000', '2021-10-12 03:32:12.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19845, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-10-14 01:08:12.000000', '2021-10-14 01:08:12.000000', '2021-10-14 01:13:12.000000');

-- 2021-10-17 00:25:00.000000
-- 2021-10-17
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (963, 64, 151, NULL, 'Adjust HR Procedures', 'This is Adjust HR Procedures', NULL, 'ADVANCED', 'HR', 'HIGH', FALSE, '2021-10-17', '2021-11-08', '2021-10-23', '2021-10-17 00:25:00.000000', '2021-10-17 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19847, 963, 141, 'JOINED', '2021-10-17 00:25:00.000000', '2021-10-22 10:01:00.000000'),
(19848, 963, 142, 'JOINED', '2021-10-17 00:25:00.000000', '2021-10-18 09:49:28.800000'),
(19849, 963, 143, 'JOINED', '2021-10-17 00:25:00.000000', '2021-10-20 08:11:33.600000'),
(19850, 963, 144, 'JOINED', '2021-10-17 00:25:00.000000', '2021-10-19 21:32:12.000000'),
(19851, 963, 145, 'JOINED', '2021-10-17 00:25:00.000000', '2021-10-22 10:01:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19847, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-11-07 06:45:09.600000', '2021-11-07 06:45:09.600000', '2021-11-07 06:50:09.600000'),
(DEFAULT, 19848, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-10-21 04:12:31.200000', '2021-10-21 04:12:31.200000', '2021-10-21 04:17:31.200000'),
(DEFAULT, 19849, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-10-22 09:00:31.200000', '2021-10-22 09:00:31.200000', '2021-10-22 09:05:31.200000'),
(DEFAULT, 19850, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-10-22 04:49:57.600000', '2021-10-22 04:49:57.600000', '2021-10-22 04:54:57.600000'),
(DEFAULT, 19851, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-11-08 07:57:09.600000', '2021-11-08 07:57:09.600000', '2021-11-08 08:02:09.600000');

-- 2021-10-24 00:25:00.000000
-- 2021-10-24
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (964, 64, 151, NULL, 'Finalize Compliance Records', 'This is Finalize Compliance Records', NULL, 'NORMAL', 'HR', 'URGENT', FALSE, '2021-10-24', '2021-10-29', '2021-10-30', '2021-10-24 00:25:00.000000', '2021-10-24 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19853, 964, 144, 'JOINED', '2021-10-24 00:25:00.000000', '2021-10-27 00:25:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19853, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-10-29 11:18:45.600000', '2021-10-29 11:18:45.600000', '2021-10-29 11:23:45.600000');

-- 2021-10-31 00:25:00.000000
-- 2021-10-31
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (965, 64, 151, NULL, 'Sign Off Compliance Documentation', 'This is Sign Off Compliance Documentation', NULL, 'ADVANCED', 'HR', 'HIGH', FALSE, '2021-10-31', '2021-11-22', '2021-11-06', '2021-10-31 00:25:00.000000', '2021-10-31 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19855, 965, 141, 'JOINED', '2021-10-31 00:25:00.000000', '2021-11-02 00:04:50.400000'),
(19856, 965, 142, 'JOINED', '2021-10-31 00:25:00.000000', '2021-11-04 02:20:12.000000'),
(19857, 965, 143, 'JOINED', '2021-10-31 00:25:00.000000', '2021-11-02 22:06:45.600000'),
(19858, 965, 144, 'JOINED', '2021-10-31 00:25:00.000000', '2021-10-31 08:46:07.200000'),
(19859, 965, 145, 'JOINED', '2021-10-31 00:25:00.000000', '2021-11-05 10:01:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19855, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-11-04 05:38:55.200000', '2021-11-04 05:38:55.200000', '2021-11-04 05:43:55.200000'),
(DEFAULT, 19856, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-11-05 23:33:09.600000', '2021-11-05 23:33:09.600000', '2021-11-05 23:38:09.600000'),
(DEFAULT, 19857, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-11-05 12:53:48.000000', '2021-11-05 12:53:48.000000', '2021-11-05 12:58:48.000000'),
(DEFAULT, 19858, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-11-02 06:07:43.200000', '2021-11-02 06:07:43.200000', '2021-11-02 06:12:43.200000'),
(DEFAULT, 19859, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-11-22 06:22:07.200000', '2021-11-22 06:22:07.200000', '2021-11-22 06:27:07.200000');

-- 2021-11-07 00:25:00.000000
-- 2021-11-07
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (966, 64, 151, NULL, 'Close Compliance Collection', 'This is Close Compliance Collection', NULL, 'NORMAL', 'HR', 'URGENT', FALSE, '2021-11-07', '2021-11-11', '2021-11-13', '2021-11-07 00:25:00.000000', '2021-11-07 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19861, 966, 144, 'JOINED', '2021-11-07 00:25:00.000000', '2021-11-08 18:27:52.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19861, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-11-11 10:49:57.600000', '2021-11-11 10:49:57.600000', '2021-11-11 10:54:57.600000');

-- 2021-11-14 00:25:00.000000
-- 2021-11-14
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (967, 64, 151, NULL, 'Complete Employee Records Review', 'This is Complete Employee Records Review', NULL, 'ADVANCED', 'HR', 'HIGH', FALSE, '2021-11-14', '2021-11-19', '2021-11-20', '2021-11-14 00:25:00.000000', '2021-11-14 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19863, 967, 141, 'JOINED', '2021-11-14 00:25:00.000000', '2021-11-17 07:02:26.400000'),
(19864, 967, 142, 'JOINED', '2021-11-14 00:25:00.000000', '2021-11-16 10:09:38.400000'),
(19865, 967, 143, 'JOINED', '2021-11-14 00:25:00.000000', '2021-11-14 08:46:07.200000'),
(19866, 967, 144, 'JOINED', '2021-11-14 00:25:00.000000', '2021-11-14 08:28:50.400000'),
(19867, 967, 145, 'JOINED', '2021-11-14 00:25:00.000000', '2021-11-14 00:50:55.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19863, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-11-19 14:28:50.400000', '2021-11-19 14:28:50.400000', '2021-11-19 14:33:50.400000'),
(DEFAULT, 19864, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-11-18 11:50:26.400000', '2021-11-18 11:50:26.400000', '2021-11-18 11:55:26.400000'),
(DEFAULT, 19865, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-11-15 23:04:21.600000', '2021-11-15 23:04:21.600000', '2021-11-15 23:09:21.600000'),
(DEFAULT, 19866, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-11-16 15:37:57.600000', '2021-11-16 15:37:57.600000', '2021-11-16 15:42:57.600000'),
(DEFAULT, 19867, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-11-15 21:46:36.000000', '2021-11-15 21:46:36.000000', '2021-11-15 21:51:36.000000');

-- 2021-11-21 00:25:00.000000
-- 2021-11-21
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (968, 64, 151, NULL, 'Archive Final HR Records', 'This is Archive Final HR Records', NULL, 'NORMAL', 'HR', 'URGENT', FALSE, '2021-11-21', '2021-11-25', '2021-11-27', '2021-11-21 00:25:00.000000', '2021-11-21 00:25:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19869, 968, 144, 'JOINED', '2021-11-21 00:25:00.000000', '2021-11-24 03:43:43.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19869, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-11-25 23:21:38.400000', '2021-11-25 23:21:38.400000', '2021-11-25 23:26:38.400000');

INSERT INTO `phase` (`id`, `created_time`, `description`, `due_date`, `start_date`, `name`, `updated_time`, `project_id`, `created_by_id`)
VALUES (12, '2021-11-27 00:25:00.000000', 'This is Compensation & HR Reporting', '2023-11-15', '2021-11-27', 'Compensation & HR Reporting', '2021-11-27 00:25:00.000000', 4, 154);


INSERT INTO collection (`id`, `created_time`, `description`, `due_date`, `start_date`, `name`, `updated_time`, `phase_id`, `created_by_id`)
VALUES (65, '2021-11-27 00:30:00.000000', 'This is Salary & Allowance Reports', '2022-06-20', '2021-11-27', 'Salary & Allowance Reports', '2021-11-27 00:30:00.000000', 12, 154);


-- 2021-11-28 00:35:00.000000
-- 2021-11-28
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (969, 65, 151, NULL, 'Collect Monthly Salary Data', 'This is Collect Monthly Salary Data', NULL, 'ADVANCED', 'HR', 'NORMAL', FALSE, '2021-11-28', '2021-12-01', '2021-12-03', '2021-11-28 00:35:00.000000', '2021-11-28 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19871, 969, 141, 'JOINED', '2021-11-28 00:35:00.000000', '2021-11-28 18:06:12.000000'),
(19872, 969, 142, 'JOINED', '2021-11-28 00:35:00.000000', '2021-11-29 21:13:24.000000'),
(19873, 969, 143, 'JOINED', '2021-11-28 00:35:00.000000', '2021-11-30 02:15:48.000000'),
(19874, 969, 144, 'JOINED', '2021-11-28 00:35:00.000000', '2021-11-28 09:06:12.000000'),
(19875, 969, 145, 'JOINED', '2021-11-28 00:35:00.000000', '2021-11-28 05:15:48.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19871, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-11-29 13:54:12.000000', '2021-11-29 13:54:12.000000', '2021-11-29 13:59:12.000000'),
(DEFAULT, 19872, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-11-30 21:20:36.000000', '2021-11-30 21:20:36.000000', '2021-11-30 21:25:36.000000'),
(DEFAULT, 19873, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-11-30 21:20:36.000000', '2021-11-30 21:20:36.000000', '2021-11-30 21:25:36.000000'),
(DEFAULT, 19874, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-12-01 05:51:48.000000', '2021-12-01 05:51:48.000000', '2021-12-01 05:56:48.000000'),
(DEFAULT, 19875, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-11-29 16:25:24.000000', '2021-11-29 16:25:24.000000', '2021-11-29 16:30:24.000000');

-- 2021-12-04 00:35:00.000000
-- 2021-12-04
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (970, 65, 151, NULL, 'Verify Salary Calculation Sheets', 'This is Verify Salary Calculation Sheets', NULL, 'ADVANCED', 'HR', 'LOW', FALSE, '2021-12-04', '2021-12-11', '2021-12-08', '2021-12-04 00:35:00.000000', '2021-12-04 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19877, 970, 144, 'JOINED', '2021-12-04 00:35:00.000000', '2021-12-04 18:29:14.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19877, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-12-11 06:40:45.600000', '2021-12-11 06:40:45.600000', '2021-12-11 06:45:45.600000');

-- 2021-12-09 00:35:00.000000
-- 2021-12-09
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (971, 65, 151, NULL, 'Prepare Quarterly Salary Report', 'This is Prepare Quarterly Salary Report', NULL, 'ADVANCED', 'HR', 'NORMAL', FALSE, '2021-12-09', '2021-12-12', '2021-12-14', '2021-12-09 00:35:00.000000', '2021-12-09 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19879, 971, 141, 'JOINED', '2021-12-09 00:35:00.000000', '2021-12-09 20:15:48.000000'),
(19880, 971, 142, 'JOINED', '2021-12-09 00:35:00.000000', '2021-12-10 01:11:00.000000'),
(19881, 971, 143, 'JOINED', '2021-12-09 00:35:00.000000', '2021-12-11 15:56:36.000000'),
(19882, 971, 144, 'JOINED', '2021-12-09 00:35:00.000000', '2021-12-09 09:27:48.000000'),
(19883, 971, 145, 'JOINED', '2021-12-09 00:35:00.000000', '2021-12-10 01:47:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19879, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-12-10 22:18:12.000000', '2021-12-10 22:18:12.000000', '2021-12-10 22:23:12.000000'),
(DEFAULT, 19880, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-12-12 04:11:00.000000', '2021-12-12 04:11:00.000000', '2021-12-12 04:16:00.000000'),
(DEFAULT, 19881, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-12-12 20:44:36.000000', '2021-12-12 20:44:36.000000', '2021-12-12 20:49:36.000000'),
(DEFAULT, 19882, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-12-12 15:27:48.000000', '2021-12-12 15:27:48.000000', '2021-12-12 15:32:48.000000'),
(DEFAULT, 19883, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-12-11 21:27:48.000000', '2021-12-11 21:27:48.000000', '2021-12-11 21:32:48.000000');

-- 2021-12-15 00:35:00.000000
-- 2021-12-15
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (972, 65, 151, NULL, 'Analyze Salary Adjustment History', 'This is Analyze Salary Adjustment History', NULL, 'ADVANCED', 'HR', 'NORMAL', FALSE, '2021-12-15', '2021-12-23', '2021-12-20', '2021-12-15 00:35:00.000000', '2021-12-15 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19885, 972, 144, 'JOINED', '2021-12-15 00:35:00.000000', '2021-12-16 14:30:12.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19885, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-12-23 10:39:48.000000', '2021-12-23 10:39:48.000000', '2021-12-23 10:44:48.000000');

-- 2021-12-21 00:35:00.000000
-- 2021-12-21
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (973, 65, 151, NULL, 'Compile Allowance Records', 'This is Compile Allowance Records', NULL, 'ADVANCED', 'HR', 'NORMAL', FALSE, '2021-12-21', '2021-12-25', '2021-12-26', '2021-12-21 00:35:00.000000', '2021-12-21 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19887, 973, 141, 'JOINED', '2021-12-21 00:35:00.000000', '2021-12-23 17:08:36.000000'),
(19888, 973, 142, 'JOINED', '2021-12-21 00:35:00.000000', '2021-12-23 11:01:24.000000'),
(19889, 973, 143, 'JOINED', '2021-12-21 00:35:00.000000', '2021-12-22 02:37:24.000000'),
(19890, 973, 144, 'JOINED', '2021-12-21 00:35:00.000000', '2021-12-21 06:49:24.000000'),
(19891, 973, 145, 'JOINED', '2021-12-21 00:35:00.000000', '2021-12-22 21:20:36.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19887, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-12-25 18:20:36.000000', '2021-12-25 18:20:36.000000', '2021-12-25 18:25:36.000000'),
(DEFAULT, 19888, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-12-25 02:08:36.000000', '2021-12-25 02:08:36.000000', '2021-12-25 02:13:36.000000'),
(DEFAULT, 19889, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-12-23 07:32:36.000000', '2021-12-23 07:32:36.000000', '2021-12-23 07:37:36.000000'),
(DEFAULT, 19890, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-12-22 02:51:48.000000', '2021-12-22 02:51:48.000000', '2021-12-22 02:56:48.000000'),
(DEFAULT, 19891, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2021-12-25 07:18:12.000000', '2021-12-25 07:18:12.000000', '2021-12-25 07:23:12.000000');

-- 2021-12-27 00:35:00.000000
-- 2021-12-27
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (974, 65, 151, NULL, 'Verify Overtime Payment Data', 'This is Verify Overtime Payment Data', NULL, 'ADVANCED', 'HR', 'NORMAL', FALSE, '2021-12-27', '2022-01-04', '2022-01-01', '2021-12-27 00:35:00.000000', '2021-12-27 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19893, 974, 144, 'JOINED', '2021-12-27 00:35:00.000000', '2021-12-28 05:19:24.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19893, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-01-04 19:50:36.000000', '2022-01-04 19:50:36.000000', '2022-01-04 19:55:36.000000');

-- 2022-01-02 00:35:00.000000
-- 2022-01-02
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (975, 65, 151, NULL, 'Prepare Bonus Distribution Report', 'This is Prepare Bonus Distribution Report', NULL, 'ADVANCED', 'HR', 'NORMAL', FALSE, '2022-01-02', '2022-01-06', '2022-01-07', '2022-01-02 00:35:00.000000', '2022-01-02 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19895, 975, 141, 'JOINED', '2022-01-02 00:35:00.000000', '2022-01-03 21:13:24.000000'),
(19896, 975, 142, 'JOINED', '2022-01-02 00:35:00.000000', '2022-01-03 12:56:36.000000'),
(19897, 975, 143, 'JOINED', '2022-01-02 00:35:00.000000', '2022-01-02 02:08:36.000000'),
(19898, 975, 144, 'JOINED', '2022-01-02 00:35:00.000000', '2022-01-04 07:03:48.000000'),
(19899, 975, 145, 'JOINED', '2022-01-02 00:35:00.000000', '2022-01-03 13:03:48.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19895, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-01-04 17:37:24.000000', '2022-01-04 17:37:24.000000', '2022-01-04 17:42:24.000000'),
(DEFAULT, 19896, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-01-05 14:15:48.000000', '2022-01-05 14:15:48.000000', '2022-01-05 14:20:48.000000'),
(DEFAULT, 19897, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-01-03 16:18:12.000000', '2022-01-03 16:18:12.000000', '2022-01-03 16:23:12.000000'),
(DEFAULT, 19898, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-01-06 23:37:24.000000', '2022-01-06 23:37:24.000000', '2022-01-06 23:42:24.000000'),
(DEFAULT, 19899, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-01-05 04:39:48.000000', '2022-01-05 04:39:48.000000', '2022-01-05 04:44:48.000000');

-- 2022-01-08 00:35:00.000000
-- 2022-01-08
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (976, 65, 151, NULL, 'Review Payroll Discrepancies', 'This is Review Payroll Discrepancies', NULL, 'ADVANCED', 'HR', 'NORMAL', FALSE, '2022-01-08', '2022-01-11', '2022-01-13', '2022-01-08 00:35:00.000000', '2022-01-08 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19901, 976, 144, 'JOINED', '2022-01-08 00:35:00.000000', '2022-01-09 07:18:12.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19901, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-01-11 20:30:12.000000', '2022-01-11 20:30:12.000000', '2022-01-11 20:35:12.000000');

-- 2022-01-14 00:35:00.000000
-- 2022-01-14
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (977, 65, 151, NULL, 'Resolve Salary Data Issues', 'This is Resolve Salary Data Issues', NULL, 'ADVANCED', 'HR', 'NORMAL', FALSE, '2022-01-14', '2022-01-18', '2022-01-19', '2022-01-14 00:35:00.000000', '2022-01-14 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19903, 977, 141, 'JOINED', '2022-01-14 00:35:00.000000', '2022-01-17 12:42:12.000000'),
(19904, 977, 142, 'JOINED', '2022-01-14 00:35:00.000000', '2022-01-16 19:47:00.000000'),
(19905, 977, 143, 'JOINED', '2022-01-14 00:35:00.000000', '2022-01-14 21:56:36.000000'),
(19906, 977, 144, 'JOINED', '2022-01-14 00:35:00.000000', '2022-01-15 12:27:48.000000'),
(19907, 977, 145, 'JOINED', '2022-01-14 00:35:00.000000', '2022-01-15 14:44:36.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19903, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-01-18 22:39:48.000000', '2022-01-18 22:39:48.000000', '2022-01-18 22:44:48.000000'),
(DEFAULT, 19904, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-01-18 07:47:00.000000', '2022-01-18 07:47:00.000000', '2022-01-18 07:52:00.000000'),
(DEFAULT, 19905, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-01-15 18:35:00.000000', '2022-01-15 18:35:00.000000', '2022-01-15 18:40:00.000000'),
(DEFAULT, 19906, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-01-18 20:08:36.000000', '2022-01-18 20:08:36.000000', '2022-01-18 20:13:36.000000'),
(DEFAULT, 19907, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-01-18 13:18:12.000000', '2022-01-18 13:18:12.000000', '2022-01-18 13:23:12.000000');

-- 2022-01-20 00:35:00.000000
-- 2022-01-20
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (978, 65, 151, NULL, 'Generate Salary Trend Analysis', 'This is Generate Salary Trend Analysis', NULL, 'ADVANCED', 'HR', 'HIGH', FALSE, '2022-01-20', '2022-01-24', '2022-01-26', '2022-01-20 00:35:00.000000', '2022-01-20 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19909, 978, 144, 'JOINED', '2022-01-20 00:35:00.000000', '2022-01-20 08:56:07.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19909, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-01-24 09:07:38.400000', '2022-01-24 09:07:38.400000', '2022-01-24 09:12:38.400000');

-- 2022-01-27 00:35:00.000000
-- 2022-01-27
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (979, 65, 151, NULL, 'Prepare Department Salary Breakdown', 'This is Prepare Department Salary Breakdown', NULL, 'ADVANCED', 'HR', 'NORMAL', FALSE, '2022-01-27', '2022-01-31', '2022-02-01', '2022-01-27 00:35:00.000000', '2022-01-27 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19911, 979, 141, 'JOINED', '2022-01-27 00:35:00.000000', '2022-01-29 15:20:36.000000'),
(19912, 979, 142, 'JOINED', '2022-01-27 00:35:00.000000', '2022-01-28 19:25:24.000000'),
(19913, 979, 143, 'JOINED', '2022-01-27 00:35:00.000000', '2022-01-27 05:30:12.000000'),
(19914, 979, 144, 'JOINED', '2022-01-27 00:35:00.000000', '2022-01-27 19:11:00.000000'),
(19915, 979, 145, 'JOINED', '2022-01-27 00:35:00.000000', '2022-01-27 10:11:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19911, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-01-31 14:01:24.000000', '2022-01-31 14:01:24.000000', '2022-01-31 14:06:24.000000'),
(DEFAULT, 19912, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-01-30 06:20:36.000000', '2022-01-30 06:20:36.000000', '2022-01-30 06:25:36.000000'),
(DEFAULT, 19913, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-01-28 17:37:24.000000', '2022-01-28 17:37:24.000000', '2022-01-28 17:42:24.000000'),
(DEFAULT, 19914, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-01-28 18:27:48.000000', '2022-01-28 18:27:48.000000', '2022-01-28 18:32:48.000000'),
(DEFAULT, 19915, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-01-29 14:08:36.000000', '2022-01-29 14:08:36.000000', '2022-01-29 14:13:36.000000');

-- 2022-02-02 00:35:00.000000
-- 2022-02-02
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (980, 65, 151, NULL, 'Review Cost Allocation', 'This is Review Cost Allocation', NULL, 'ADVANCED', 'HR', 'HIGH', FALSE, '2022-02-02', '2022-02-05', '2022-02-08', '2022-02-02 00:35:00.000000', '2022-02-02 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19917, 980, 144, 'JOINED', '2022-02-02 00:35:00.000000', '2022-02-02 18:52:16.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19917, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-02-05 15:42:12.000000', '2022-02-05 15:42:12.000000', '2022-02-05 15:47:12.000000');

-- 2022-02-09 00:35:00.000000
-- 2022-02-09
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (981, 65, 151, NULL, 'Prepare Management Salary Summary', 'This is Prepare Management Salary Summary', NULL, 'ADVANCED', 'HR', 'NORMAL', FALSE, '2022-02-09', '2022-02-13', '2022-02-14', '2022-02-09 00:35:00.000000', '2022-02-09 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19919, 981, 141, 'JOINED', '2022-02-09 00:35:00.000000', '2022-02-09 13:11:00.000000'),
(19920, 981, 142, 'JOINED', '2022-02-09 00:35:00.000000', '2022-02-10 22:03:48.000000'),
(19921, 981, 143, 'JOINED', '2022-02-09 00:35:00.000000', '2022-02-09 11:23:00.000000'),
(19922, 981, 144, 'JOINED', '2022-02-09 00:35:00.000000', '2022-02-10 20:08:36.000000'),
(19923, 981, 145, 'JOINED', '2022-02-09 00:35:00.000000', '2022-02-09 22:47:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19919, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-02-10 10:11:00.000000', '2022-02-10 10:11:00.000000', '2022-02-10 10:16:00.000000'),
(DEFAULT, 19920, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-02-12 02:08:36.000000', '2022-02-12 02:08:36.000000', '2022-02-12 02:13:36.000000'),
(DEFAULT, 19921, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-02-10 11:30:12.000000', '2022-02-10 11:30:12.000000', '2022-02-10 11:35:12.000000'),
(DEFAULT, 19922, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-02-13 11:44:36.000000', '2022-02-13 11:44:36.000000', '2022-02-13 11:49:36.000000'),
(DEFAULT, 19923, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-02-10 18:13:24.000000', '2022-02-10 18:13:24.000000', '2022-02-10 18:18:24.000000');

-- 2022-02-15 00:35:00.000000
-- 2022-02-15
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (982, 65, 151, NULL, 'Validate Payroll Approval', 'This is Validate Payroll Approval', NULL, 'ADVANCED', 'HR', 'HIGH', FALSE, '2022-02-15', '2022-03-04', '2022-02-21', '2022-02-15 00:35:00.000000', '2022-02-15 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19925, 982, 144, 'JOINED', '2022-02-15 00:35:00.000000', '2022-02-20 10:11:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19925, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-03-04 13:47:00.000000', '2022-03-04 13:47:00.000000', '2022-03-04 13:52:00.000000');

-- 2022-02-22 00:35:00.000000
-- 2022-02-22
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (983, 65, 151, NULL, 'Document Payroll Assumptions', 'This is Document Payroll Assumptions', NULL, 'ADVANCED', 'HR', 'NORMAL', FALSE, '2022-02-22', '2022-03-10', '2022-02-27', '2022-02-22 00:35:00.000000', '2022-02-22 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19927, 983, 141, 'JOINED', '2022-02-22 00:35:00.000000', '2022-02-22 11:51:48.000000'),
(19928, 983, 142, 'JOINED', '2022-02-22 00:35:00.000000', '2022-02-23 16:54:12.000000'),
(19929, 983, 143, 'JOINED', '2022-02-22 00:35:00.000000', '2022-02-23 16:18:12.000000'),
(19930, 983, 144, 'JOINED', '2022-02-22 00:35:00.000000', '2022-02-26 12:35:00.000000'),
(19931, 983, 145, 'JOINED', '2022-02-22 00:35:00.000000', '2022-02-22 17:08:36.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19927, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-02-23 11:08:36.000000', '2022-02-23 11:08:36.000000', '2022-02-23 11:13:36.000000'),
(DEFAULT, 19928, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-02-25 06:35:00.000000', '2022-02-25 06:35:00.000000', '2022-02-25 06:40:00.000000'),
(DEFAULT, 19929, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-02-26 04:03:48.000000', '2022-02-26 04:03:48.000000', '2022-02-26 04:08:48.000000'),
(DEFAULT, 19930, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-03-10 12:42:12.000000', '2022-03-10 12:42:12.000000', '2022-03-10 12:47:12.000000'),
(DEFAULT, 19931, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-02-23 12:49:24.000000', '2022-02-23 12:49:24.000000', '2022-02-23 12:54:24.000000');

-- 2022-02-28 00:35:00.000000
-- 2022-02-28
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (984, 65, 151, NULL, 'Review Compensation Policies', 'This is Review Compensation Policies', NULL, 'ADVANCED', 'HR', 'HIGH', FALSE, '2022-02-28', '2022-03-10', '2022-03-06', '2022-02-28 00:35:00.000000', '2022-02-28 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19933, 984, 144, 'JOINED', '2022-02-28 00:35:00.000000', '2022-03-01 12:39:19.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19933, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-03-10 12:30:40.800000', '2022-03-10 12:30:40.800000', '2022-03-10 12:35:40.800000');

-- 2022-03-07 00:35:00.000000
-- 2022-03-07
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (985, 65, 151, NULL, 'Update Salary Bands', 'This is Update Salary Bands', NULL, 'ADVANCED', 'HR', 'NORMAL', FALSE, '2022-03-07', '2022-03-11', '2022-03-12', '2022-03-07 00:35:00.000000', '2022-03-07 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19935, 985, 141, 'JOINED', '2022-03-07 00:35:00.000000', '2022-03-09 05:30:12.000000'),
(19936, 985, 142, 'JOINED', '2022-03-07 00:35:00.000000', '2022-03-09 00:27:48.000000'),
(19937, 985, 143, 'JOINED', '2022-03-07 00:35:00.000000', '2022-03-09 15:20:36.000000'),
(19938, 985, 144, 'JOINED', '2022-03-07 00:35:00.000000', '2022-03-07 04:18:12.000000'),
(19939, 985, 145, 'JOINED', '2022-03-07 00:35:00.000000', '2022-03-07 02:15:48.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19935, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-03-10 04:11:00.000000', '2022-03-10 04:11:00.000000', '2022-03-10 04:16:00.000000'),
(DEFAULT, 19936, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-03-11 06:13:24.000000', '2022-03-11 06:13:24.000000', '2022-03-11 06:18:24.000000'),
(DEFAULT, 19937, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-03-11 15:06:12.000000', '2022-03-11 15:06:12.000000', '2022-03-11 15:11:12.000000'),
(DEFAULT, 19938, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-03-08 19:32:36.000000', '2022-03-08 19:32:36.000000', '2022-03-08 19:37:36.000000'),
(DEFAULT, 19939, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-03-08 05:01:24.000000', '2022-03-08 05:01:24.000000', '2022-03-08 05:06:24.000000');

-- 2022-03-13 00:35:00.000000
-- 2022-03-13
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (986, 65, 151, NULL, 'Verify Market Benchmark Data', 'This is Verify Market Benchmark Data', NULL, 'ADVANCED', 'HR', 'HIGH', FALSE, '2022-03-13', '2022-03-18', '2022-03-19', '2022-03-13 00:35:00.000000', '2022-03-13 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19941, 986, 144, 'JOINED', '2022-03-13 00:35:00.000000', '2022-03-13 03:53:43.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19941, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-03-18 15:47:57.600000', '2022-03-18 15:47:57.600000', '2022-03-18 15:52:57.600000');

-- 2022-03-20 00:35:00.000000
-- 2022-03-20
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (987, 65, 151, NULL, 'Prepare Compensation Adjustment Proposal', 'This is Prepare Compensation Adjustment Proposal', NULL, 'ADVANCED', 'HR', 'LOW', FALSE, '2022-03-20', '2022-04-01', '2022-03-24', '2022-03-20 00:35:00.000000', '2022-03-20 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19943, 987, 141, 'JOINED', '2022-03-20 00:35:00.000000', '2022-03-23 14:59:00.000000'),
(19944, 987, 142, 'JOINED', '2022-03-20 00:35:00.000000', '2022-03-20 13:44:07.200000'),
(19945, 987, 143, 'JOINED', '2022-03-20 00:35:00.000000', '2022-03-20 06:26:21.600000'),
(19946, 987, 144, 'JOINED', '2022-03-20 00:35:00.000000', '2022-03-20 02:59:00.000000'),
(19947, 987, 145, 'JOINED', '2022-03-20 00:35:00.000000', '2022-03-20 02:53:14.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19943, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-04-01 21:13:24.000000', '2022-04-01 21:13:24.000000', '2022-04-01 21:18:24.000000'),
(DEFAULT, 19944, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-03-22 04:36:55.200000', '2022-03-22 04:36:55.200000', '2022-03-22 04:41:55.200000'),
(DEFAULT, 19945, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-03-21 00:46:31.200000', '2022-03-21 00:46:31.200000', '2022-03-21 00:51:31.200000'),
(DEFAULT, 19946, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-03-21 10:28:16.800000', '2022-03-21 10:28:16.800000', '2022-03-21 10:33:16.800000'),
(DEFAULT, 19947, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-03-21 19:18:12.000000', '2022-03-21 19:18:12.000000', '2022-03-21 19:23:12.000000');

-- 2022-03-25 00:35:00.000000
-- 2022-03-25
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (988, 65, 151, NULL, 'Collect Management Feedback', 'This is Collect Management Feedback', NULL, 'ADVANCED', 'HR', 'HIGH', FALSE, '2022-03-25', '2022-03-27', '2022-03-31', '2022-03-25 00:35:00.000000', '2022-03-25 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19949, 988, 144, 'JOINED', '2022-03-25 00:35:00.000000', '2022-03-25 09:04:45.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19949, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-03-27 07:09:33.600000', '2022-03-27 07:09:33.600000', '2022-03-27 07:14:33.600000');

-- 2022-04-01 00:35:00.000000
-- 2022-04-01
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (989, 65, 151, NULL, 'Revise Salary Reports', 'This is Revise Salary Reports', NULL, 'ADVANCED', 'HR', 'LOW', FALSE, '2022-04-01', '2022-04-04', '2022-04-05', '2022-04-01 00:35:00.000000', '2022-04-01 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19951, 989, 141, 'JOINED', '2022-04-01 00:35:00.000000', '2022-04-02 16:36:55.200000'),
(19952, 989, 142, 'JOINED', '2022-04-01 00:35:00.000000', '2022-04-01 17:34:31.200000'),
(19953, 989, 143, 'JOINED', '2022-04-01 00:35:00.000000', '2022-04-03 13:09:33.600000'),
(19954, 989, 144, 'JOINED', '2022-04-01 00:35:00.000000', '2022-04-01 09:47:57.600000'),
(19955, 989, 145, 'JOINED', '2022-04-01 00:35:00.000000', '2022-04-01 09:30:40.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19951, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-04-04 09:47:57.600000', '2022-04-04 09:47:57.600000', '2022-04-04 09:52:57.600000'),
(DEFAULT, 19952, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-04-02 08:27:19.200000', '2022-04-02 08:27:19.200000', '2022-04-02 08:32:19.200000'),
(DEFAULT, 19953, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-04-04 14:01:24.000000', '2022-04-04 14:01:24.000000', '2022-04-04 14:06:24.000000'),
(DEFAULT, 19954, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-04-03 03:16:16.800000', '2022-04-03 03:16:16.800000', '2022-04-03 03:21:16.800000'),
(DEFAULT, 19955, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-04-02 15:04:45.600000', '2022-04-02 15:04:45.600000', '2022-04-02 15:09:45.600000');

-- 2022-04-06 00:35:00.000000
-- 2022-04-06
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (990, 65, 151, NULL, 'Finalize Salary Reports', 'This is Finalize Salary Reports', NULL, 'ADVANCED', 'HR', 'HIGH', FALSE, '2022-04-06', '2022-04-29', '2022-04-12', '2022-04-06 00:35:00.000000', '2022-04-06 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19957, 990, 144, 'JOINED', '2022-04-06 00:35:00.000000', '2022-04-11 10:11:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19957, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-04-29 01:23:57.600000', '2022-04-29 01:23:57.600000', '2022-04-29 01:28:57.600000');

-- 2022-04-13 00:35:00.000000
-- 2022-04-13
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (991, 65, 151, NULL, 'Submit Salary Reports for Approval', 'This is Submit Salary Reports for Approval', NULL, 'ADVANCED', 'HR', 'LOW', FALSE, '2022-04-13', '2022-04-26', '2022-04-17', '2022-04-13 00:35:00.000000', '2022-04-13 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19959, 991, 141, 'JOINED', '2022-04-13 00:35:00.000000', '2022-04-14 03:33:33.600000'),
(19960, 991, 142, 'JOINED', '2022-04-13 00:35:00.000000', '2022-04-14 17:17:14.400000'),
(19961, 991, 143, 'JOINED', '2022-04-13 00:35:00.000000', '2022-04-14 21:13:24.000000'),
(19962, 991, 144, 'JOINED', '2022-04-13 00:35:00.000000', '2022-04-14 20:07:09.600000'),
(19963, 991, 145, 'JOINED', '2022-04-13 00:35:00.000000', '2022-04-16 14:59:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19959, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-04-15 07:41:14.400000', '2022-04-15 07:41:14.400000', '2022-04-15 07:46:14.400000'),
(DEFAULT, 19960, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-04-16 05:11:28.800000', '2022-04-16 05:11:28.800000', '2022-04-16 05:16:28.800000'),
(DEFAULT, 19961, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-04-15 18:14:50.400000', '2022-04-15 18:14:50.400000', '2022-04-15 18:19:50.400000'),
(DEFAULT, 19962, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-04-19 05:02:50.400000', '2022-04-19 05:02:50.400000', '2022-04-19 05:07:50.400000'),
(DEFAULT, 19963, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-04-26 09:36:26.400000', '2022-04-26 09:36:26.400000', '2022-04-26 09:41:26.400000');

-- 2022-04-18 00:35:00.000000
-- 2022-04-18
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (992, 65, 151, NULL, 'Record Approved Salary Changes', 'This is Record Approved Salary Changes', NULL, 'ADVANCED', 'HR', 'HIGH', FALSE, '2022-04-18', '2022-04-28', '2022-04-24', '2022-04-18 00:35:00.000000', '2022-04-18 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19965, 992, 144, 'JOINED', '2022-04-18 00:35:00.000000', '2022-04-19 16:19:38.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19965, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-04-28 08:50:21.600000', '2022-04-28 08:50:21.600000', '2022-04-28 08:55:21.600000');

-- 2022-04-25 00:35:00.000000
-- 2022-04-25
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (993, 65, 151, NULL, 'Communicate Salary Updates', 'This is Communicate Salary Updates', NULL, 'ADVANCED', 'HR', 'LOW', FALSE, '2022-04-25', '2022-04-28', '2022-04-29', '2022-04-25 00:35:00.000000', '2022-04-25 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19967, 993, 141, 'JOINED', '2022-04-25 00:35:00.000000', '2022-04-25 14:01:24.000000'),
(19968, 993, 142, 'JOINED', '2022-04-25 00:35:00.000000', '2022-04-25 05:05:43.200000'),
(19969, 993, 143, 'JOINED', '2022-04-25 00:35:00.000000', '2022-04-25 07:58:31.200000'),
(19970, 993, 144, 'JOINED', '2022-04-25 00:35:00.000000', '2022-04-27 15:27:48.000000'),
(19971, 993, 145, 'JOINED', '2022-04-25 00:35:00.000000', '2022-04-25 16:19:38.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19967, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-04-27 12:11:57.600000', '2022-04-27 12:11:57.600000', '2022-04-27 12:16:57.600000'),
(DEFAULT, 19968, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-04-25 20:44:36.000000', '2022-04-25 20:44:36.000000', '2022-04-25 20:49:36.000000'),
(DEFAULT, 19969, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-04-26 01:49:52.800000', '2022-04-26 01:49:52.800000', '2022-04-26 01:54:52.800000'),
(DEFAULT, 19970, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-04-28 11:20:07.200000', '2022-04-28 11:20:07.200000', '2022-04-28 11:25:07.200000'),
(DEFAULT, 19971, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-04-28 01:32:36.000000', '2022-04-28 01:32:36.000000', '2022-04-28 01:37:36.000000');

-- 2022-04-30 00:35:00.000000
-- 2022-04-30
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (994, 65, 151, NULL, 'Archive Salary Documentation', 'This is Archive Salary Documentation', NULL, 'ADVANCED', 'HR', 'HIGH', FALSE, '2022-04-30', '2022-05-23', '2022-05-06', '2022-04-30 00:35:00.000000', '2022-04-30 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19973, 994, 144, 'JOINED', '2022-04-30 00:35:00.000000', '2022-05-05 10:11:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19973, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-05-23 09:10:31.200000', '2022-05-23 09:10:31.200000', '2022-05-23 09:15:31.200000');

-- 2022-05-07 00:35:00.000000
-- 2022-05-07
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (995, 65, 151, NULL, 'Prepare Annual Salary Summary', 'This is Prepare Annual Salary Summary', NULL, 'ADVANCED', 'HR', 'LOW', FALSE, '2022-05-07', '2022-05-22', '2022-05-11', '2022-05-07 00:35:00.000000', '2022-05-07 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19975, 995, 141, 'JOINED', '2022-05-07 00:35:00.000000', '2022-05-10 01:55:38.400000'),
(19976, 995, 142, 'JOINED', '2022-05-07 00:35:00.000000', '2022-05-10 14:59:00.000000'),
(19977, 995, 143, 'JOINED', '2022-05-07 00:35:00.000000', '2022-05-08 20:56:07.200000'),
(19978, 995, 144, 'JOINED', '2022-05-07 00:35:00.000000', '2022-05-10 14:59:00.000000'),
(19979, 995, 145, 'JOINED', '2022-05-07 00:35:00.000000', '2022-05-08 09:30:40.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19975, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-05-10 19:58:31.200000', '2022-05-10 19:58:31.200000', '2022-05-10 20:03:31.200000'),
(DEFAULT, 19976, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-05-20 14:53:14.400000', '2022-05-20 14:53:14.400000', '2022-05-20 14:58:14.400000'),
(DEFAULT, 19977, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-05-09 19:41:14.400000', '2022-05-09 19:41:14.400000', '2022-05-09 19:46:14.400000'),
(DEFAULT, 19978, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-05-22 06:43:38.400000', '2022-05-22 06:43:38.400000', '2022-05-22 06:48:38.400000'),
(DEFAULT, 19979, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-05-09 17:46:02.400000', '2022-05-09 17:46:02.400000', '2022-05-09 17:51:02.400000');

-- 2022-05-12 00:35:00.000000
-- 2022-05-12
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (996, 65, 151, NULL, 'Review Compensation KPIs', 'This is Review Compensation KPIs', NULL, 'ADVANCED', 'HR', 'HIGH', FALSE, '2022-05-12', '2022-05-17', '2022-05-18', '2022-05-12 00:35:00.000000', '2022-05-12 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19981, 996, 144, 'JOINED', '2022-05-12 00:35:00.000000', '2022-05-12 14:07:09.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19981, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-05-17 10:02:21.600000', '2022-05-17 10:02:21.600000', '2022-05-17 10:07:21.600000');

-- 2022-05-19 00:35:00.000000
-- 2022-05-19
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (997, 65, 151, NULL, 'Audit Salary Data Accuracy', 'This is Audit Salary Data Accuracy', NULL, 'ADVANCED', 'HR', 'URGENT', FALSE, '2022-05-19', '2022-06-01', '2022-05-26', '2022-05-19 00:35:00.000000', '2022-05-19 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19983, 997, 142, 'JOINED', '2022-05-19 00:35:00.000000', '2022-05-20 17:44:36.000000'),
(19984, 997, 143, 'JOINED', '2022-05-19 00:35:00.000000', '2022-05-19 23:51:04.800000'),
(19985, 997, 144, 'JOINED', '2022-05-19 00:35:00.000000', '2022-05-20 13:52:45.600000'),
(19986, 997, 145, 'JOINED', '2022-05-19 00:35:00.000000', '2022-05-19 19:03:48.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19983, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-05-22 22:49:52.800000', '2022-05-22 22:49:52.800000', '2022-05-22 22:54:52.800000'),
(DEFAULT, 19984, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-06-01 01:18:55.200000', '2022-06-01 01:18:55.200000', '2022-06-01 01:23:55.200000'),
(DEFAULT, 19985, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-05-31 11:17:14.400000', '2022-05-31 11:17:14.400000', '2022-05-31 11:22:14.400000'),
(DEFAULT, 19986, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-06-01 06:06:12.000000', '2022-06-01 06:06:12.000000', '2022-06-01 06:11:12.000000');

-- 2022-05-27 00:35:00.000000
-- 2022-05-27
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (998, 65, 151, NULL, 'Sign Off Salary Reports', 'This is Sign Off Salary Reports', NULL, 'ADVANCED', 'HR', 'HIGH', FALSE, '2022-05-27', '2022-05-31', '2022-06-02', '2022-05-27 00:35:00.000000', '2022-05-27 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19988, 998, 144, 'JOINED', '2022-05-27 00:35:00.000000', '2022-05-28 14:35:57.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19988, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-05-31 02:56:07.200000', '2022-05-31 02:56:07.200000', '2022-05-31 03:01:07.200000');

-- 2022-06-03 00:35:00.000000
-- 2022-06-03
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (999, 65, 151, NULL, 'Close Salary Report Collection', 'This is Close Salary Report Collection', NULL, 'ADVANCED', 'HR', 'HIGH', FALSE, '2022-06-03', '2022-06-25', '2022-06-09', '2022-06-03 00:35:00.000000', '2022-06-03 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19990, 999, 141, 'JOINED', '2022-06-03 00:35:00.000000', '2022-06-06 22:36:55.200000'),
(19991, 999, 142, 'JOINED', '2022-06-03 00:35:00.000000', '2022-06-03 16:34:02.400000'),
(19992, 999, 144, 'JOINED', '2022-06-03 00:35:00.000000', '2022-06-04 07:58:31.200000'),
(19993, 999, 145, 'JOINED', '2022-06-03 00:35:00.000000', '2022-06-08 10:11:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19990, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-06-08 15:30:40.800000', '2022-06-08 15:30:40.800000', '2022-06-08 15:35:40.800000'),
(DEFAULT, 19991, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-06-05 02:15:48.000000', '2022-06-05 02:15:48.000000', '2022-06-05 02:20:48.000000'),
(DEFAULT, 19992, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-06-07 06:23:28.800000', '2022-06-07 06:23:28.800000', '2022-06-07 06:28:28.800000'),
(DEFAULT, 19993, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-06-25 11:51:48.000000', '2022-06-25 11:51:48.000000', '2022-06-25 11:56:48.000000');

-- 2022-06-10 00:35:00.000000
-- 2022-06-10
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1000, 65, 151, NULL, 'Complete Compensation Review', 'This is Complete Compensation Review', NULL, 'ADVANCED', 'HR', 'HIGH', FALSE, '2022-06-10', '2022-06-14', '2022-06-16', '2022-06-10 00:35:00.000000', '2022-06-10 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19995, 1000, 144, 'JOINED', '2022-06-10 00:35:00.000000', '2022-06-10 15:07:38.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19995, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-06-14 04:05:14.400000', '2022-06-14 04:05:14.400000', '2022-06-14 04:10:14.400000');

-- 2022-06-17 00:35:00.000000
-- 2022-06-17
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1001, 65, 151, NULL, 'Archive Final Compensation Files', 'This is Archive Final Compensation Files', NULL, 'ADVANCED', 'HR', 'NORMAL', FALSE, '2022-06-17', '2022-06-20', '2022-06-22', '2022-06-17 00:35:00.000000', '2022-06-17 00:35:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(19997, 1001, 141, 'JOINED', '2022-06-17 00:35:00.000000', '2022-06-17 07:32:36.000000'),
(19998, 1001, 143, 'JOINED', '2022-06-17 00:35:00.000000', '2022-06-19 00:06:12.000000'),
(19999, 1001, 144, 'JOINED', '2022-06-17 00:35:00.000000', '2022-06-18 00:06:12.000000'),
(20000, 1001, 145, 'JOINED', '2022-06-17 00:35:00.000000', '2022-06-18 03:06:12.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 19997, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-06-18 06:42:12.000000', '2022-06-18 06:42:12.000000', '2022-06-18 06:47:12.000000'),
(DEFAULT, 19998, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-06-20 19:25:24.000000', '2022-06-20 19:25:24.000000', '2022-06-20 19:30:24.000000'),
(DEFAULT, 19999, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-06-19 05:08:36.000000', '2022-06-19 05:08:36.000000', '2022-06-19 05:13:36.000000'),
(DEFAULT, 20000, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-06-19 22:47:00.000000', '2022-06-19 22:47:00.000000', '2022-06-19 22:52:00.000000');

INSERT INTO collection (`id`, `created_time`, `description`, `due_date`, `start_date`, `name`, `updated_time`, `phase_id`, `created_by_id`)
VALUES (66, '2022-06-22 00:35:00.000000', 'This is HR Metrics & Statistics Reports', '2023-04-09', '2022-06-22', 'HR Metrics & Statistics Reports', '2022-06-22 00:35:00.000000', 12, 154);


-- 2022-06-23 00:40:00.000000
-- 2022-06-23
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1002, 66, 151, NULL, 'Collect Headcount Data', 'This is Collect Headcount Data', NULL, 'ADVANCED', 'HR', 'URGENT', FALSE, '2022-06-23', '2022-07-17', '2022-06-30', '2022-06-23 00:40:00.000000', '2022-06-23 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20002, 1002, 144, 'JOINED', '2022-06-23 00:40:00.000000', '2022-06-29 07:52:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20002, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-07-17 04:26:04.800000', '2022-07-17 04:26:04.800000', '2022-07-17 04:31:04.800000');

-- 2022-07-01 00:40:00.000000
-- 2022-07-01
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1003, 66, 151, NULL, 'Prepare Monthly Headcount Report', 'This is Prepare Monthly Headcount Report', NULL, 'ADVANCED', 'HR', 'LOW', FALSE, '2022-07-01', '2022-07-03', '2022-07-05', '2022-07-01 00:40:00.000000', '2022-07-01 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20004, 1003, 142, 'JOINED', '2022-07-01 00:40:00.000000', '2022-07-01 09:47:12.000000'),
(20005, 1003, 143, 'JOINED', '2022-07-01 00:40:00.000000', '2022-07-01 01:20:19.200000'),
(20006, 1003, 144, 'JOINED', '2022-07-01 00:40:00.000000', '2022-07-01 16:59:12.000000'),
(20007, 1003, 145, 'JOINED', '2022-07-01 00:40:00.000000', '2022-07-01 21:29:55.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20004, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-07-02 14:40:57.600000', '2022-07-02 14:40:57.600000', '2022-07-02 14:45:57.600000'),
(DEFAULT, 20005, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-07-02 07:28:57.600000', '2022-07-02 07:28:57.600000', '2022-07-02 07:33:57.600000'),
(DEFAULT, 20006, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-07-02 11:48:09.600000', '2022-07-02 11:48:09.600000', '2022-07-02 11:53:09.600000'),
(DEFAULT, 20007, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-07-03 05:28:00.000000', '2022-07-03 05:28:00.000000', '2022-07-03 05:33:00.000000');

-- 2022-07-06 00:40:00.000000
-- 2022-07-06
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1004, 66, 151, NULL, 'Analyze Headcount Changes', 'This is Analyze Headcount Changes', NULL, 'HARD', 'HR', 'NORMAL', FALSE, '2022-07-06', '2022-07-07', '2022-07-12', '2022-07-06 00:40:00.000000', '2022-07-06 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20009, 1004, 143, 'JOINED', '2022-07-06 00:40:00.000000', '2022-07-06 05:07:50.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20009, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-07-07 07:20:19.200000', '2022-07-07 07:20:19.200000', '2022-07-07 07:25:19.200000');

-- 2022-07-13 00:40:00.000000
-- 2022-07-13
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1005, 66, 151, NULL, 'Prepare Turnover Rate Statistics', 'This is Prepare Turnover Rate Statistics', NULL, 'HARD', 'HR', 'URGENT', FALSE, '2022-07-13', '2022-08-12', '2022-07-21', '2022-07-13 00:40:00.000000', '2022-07-13 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20011, 1005, 141, 'JOINED', '2022-07-13 00:40:00.000000', '2022-07-13 10:39:02.400000'),
(20012, 1005, 142, 'JOINED', '2022-07-13 00:40:00.000000', '2022-07-20 05:28:00.000000'),
(20013, 1005, 143, 'JOINED', '2022-07-13 00:40:00.000000', '2022-07-20 05:28:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20011, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-07-19 21:01:07.200000', '2022-07-19 21:01:07.200000', '2022-07-19 21:06:07.200000'),
(DEFAULT, 20012, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-08-12 09:18:24.000000', '2022-08-12 09:18:24.000000', '2022-08-12 09:23:24.000000'),
(DEFAULT, 20013, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-08-11 01:14:33.600000', '2022-08-11 01:14:33.600000', '2022-08-11 01:19:33.600000');

-- 2022-07-22 00:40:00.000000
-- 2022-07-22
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1006, 66, 151, NULL, 'Analyze Attrition Trends', 'This is Analyze Attrition Trends', NULL, 'HARD', 'HR', 'NORMAL', FALSE, '2022-07-22', '2022-07-23', '2022-07-28', '2022-07-22 00:40:00.000000', '2022-07-22 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20015, 1006, 143, 'JOINED', '2022-07-22 00:40:00.000000', '2022-07-22 01:23:12.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20015, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-07-23 12:05:26.400000', '2022-07-23 12:05:26.400000', '2022-07-23 12:10:26.400000');

-- 2022-07-29 00:40:00.000000
-- 2022-07-29
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1007, 66, 151, NULL, 'Prepare Recruitment Pipeline Report', 'This is Prepare Recruitment Pipeline Report', NULL, 'HARD', 'HR', 'URGENT', FALSE, '2022-07-29', '2022-08-29', '2022-08-06', '2022-07-29 00:40:00.000000', '2022-07-29 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20017, 1007, 141, 'JOINED', '2022-07-29 00:40:00.000000', '2022-08-05 05:28:00.000000'),
(20018, 1007, 142, 'JOINED', '2022-07-29 00:40:00.000000', '2022-07-29 02:23:40.800000'),
(20019, 1007, 143, 'JOINED', '2022-07-29 00:40:00.000000', '2022-08-05 05:28:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20017, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-08-25 17:56:48.000000', '2022-08-25 17:56:48.000000', '2022-08-25 18:01:48.000000'),
(DEFAULT, 20018, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-08-02 14:29:26.400000', '2022-08-02 14:29:26.400000', '2022-08-02 14:34:26.400000'),
(DEFAULT, 20019, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-08-29 00:51:31.200000', '2022-08-29 00:51:31.200000', '2022-08-29 00:56:31.200000');

-- 2022-08-07 00:40:00.000000
-- 2022-08-07
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1008, 66, 151, NULL, 'Collect Hiring Data', 'This is Collect Hiring Data', NULL, 'HARD', 'HR', 'NORMAL', FALSE, '2022-08-07', '2022-08-15', '2022-08-13', '2022-08-07 00:40:00.000000', '2022-08-07 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20021, 1008, 143, 'JOINED', '2022-08-07 00:40:00.000000', '2022-08-10 11:10:43.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20021, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-08-15 14:09:16.800000', '2022-08-15 14:09:16.800000', '2022-08-15 14:14:16.800000');

-- 2022-08-14 00:40:00.000000
-- 2022-08-14
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1009, 66, 151, NULL, 'Prepare Time-to-Hire Metrics', 'This is Prepare Time-to-Hire Metrics', NULL, 'HARD', 'HR', 'URGENT', FALSE, '2022-08-14', '2022-09-09', '2022-08-22', '2022-08-14 00:40:00.000000', '2022-08-14 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20023, 1009, 141, 'JOINED', '2022-08-14 00:40:00.000000', '2022-08-21 05:28:00.000000'),
(20024, 1009, 142, 'JOINED', '2022-08-14 00:40:00.000000', '2022-08-21 05:28:00.000000'),
(20025, 1009, 143, 'JOINED', '2022-08-14 00:40:00.000000', '2022-08-14 14:29:26.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20023, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-09-09 12:22:43.200000', '2022-09-09 12:22:43.200000', '2022-09-09 12:27:43.200000'),
(DEFAULT, 20024, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-09-08 09:29:55.200000', '2022-09-08 09:29:55.200000', '2022-09-08 09:34:55.200000'),
(DEFAULT, 20025, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-08-20 15:27:02.400000', '2022-08-20 15:27:02.400000', '2022-08-20 15:32:02.400000');

-- 2022-08-23 00:40:00.000000
-- 2022-08-23
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1010, 66, 151, NULL, 'Analyze Recruitment Efficiency', 'This is Analyze Recruitment Efficiency', NULL, 'HARD', 'HR', 'NORMAL', FALSE, '2022-08-23', '2022-09-12', '2022-08-29', '2022-08-23 00:40:00.000000', '2022-08-23 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20027, 1010, 143, 'JOINED', '2022-08-23 00:40:00.000000', '2022-08-28 10:16:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20027, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-09-12 08:40:57.600000', '2022-09-12 08:40:57.600000', '2022-09-12 08:45:57.600000');

-- 2022-08-30 00:40:00.000000
-- 2022-08-30
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1011, 66, 151, NULL, 'Prepare Training Participation Report', 'This is Prepare Training Participation Report', NULL, 'HARD', 'HR', 'URGENT', FALSE, '2022-08-30', '2022-09-23', '2022-09-07', '2022-08-30 00:40:00.000000', '2022-08-30 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20029, 1011, 141, 'JOINED', '2022-08-30 00:40:00.000000', '2022-08-31 23:53:55.200000'),
(20030, 1011, 142, 'JOINED', '2022-08-30 00:40:00.000000', '2022-08-30 23:48:09.600000'),
(20031, 1011, 143, 'JOINED', '2022-08-30 00:40:00.000000', '2022-09-06 05:28:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20029, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-09-06 11:25:07.200000', '2022-09-06 11:25:07.200000', '2022-09-06 11:30:07.200000'),
(DEFAULT, 20030, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-09-14 01:31:50.400000', '2022-09-14 01:31:50.400000', '2022-09-14 01:36:50.400000'),
(DEFAULT, 20031, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-09-23 00:51:31.200000', '2022-09-23 00:51:31.200000', '2022-09-23 00:56:31.200000');

-- 2022-09-08 00:40:00.000000
-- 2022-09-08
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1012, 66, 151, NULL, 'Collect Training Cost Data', 'This is Collect Training Cost Data', NULL, 'HARD', 'HR', 'NORMAL', FALSE, '2022-09-08', '2022-09-12', '2022-09-14', '2022-09-08 00:40:00.000000', '2022-09-08 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20033, 1012, 143, 'JOINED', '2022-09-08 00:40:00.000000', '2022-09-08 07:34:43.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20033, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-09-12 19:34:43.200000', '2022-09-12 19:34:43.200000', '2022-09-12 19:39:43.200000');

-- 2022-09-15 00:40:00.000000
-- 2022-09-15
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1013, 66, 151, NULL, 'Analyze Training Effectiveness', 'This is Analyze Training Effectiveness', NULL, 'HARD', 'HR', 'URGENT', FALSE, '2022-09-15', '2022-10-15', '2022-09-23', '2022-09-15 00:40:00.000000', '2022-09-15 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20035, 1013, 141, 'JOINED', '2022-09-15 00:40:00.000000', '2022-09-22 05:28:00.000000'),
(20036, 1013, 142, 'JOINED', '2022-09-15 00:40:00.000000', '2022-09-22 05:28:00.000000'),
(20037, 1013, 143, 'JOINED', '2022-09-15 00:40:00.000000', '2022-09-22 05:28:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20035, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-10-15 13:54:52.800000', '2022-10-15 13:54:52.800000', '2022-10-15 13:59:52.800000'),
(DEFAULT, 20036, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-10-09 11:59:40.800000', '2022-10-09 11:59:40.800000', '2022-10-09 12:04:40.800000'),
(DEFAULT, 20037, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-10-08 15:50:04.800000', '2022-10-08 15:50:04.800000', '2022-10-08 15:55:04.800000');

-- 2022-09-24 00:40:00.000000
-- 2022-09-24
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1014, 66, 151, NULL, 'Prepare Absence Statistics', 'This is Prepare Absence Statistics', NULL, 'HARD', 'HR', 'NORMAL', FALSE, '2022-09-24', '2022-09-27', '2022-09-30', '2022-09-24 00:40:00.000000', '2022-09-24 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20039, 1014, 143, 'JOINED', '2022-09-24 00:40:00.000000', '2022-09-25 14:58:14.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20039, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-09-27 05:33:45.600000', '2022-09-27 05:33:45.600000', '2022-09-27 05:38:45.600000');

-- 2022-10-01 00:40:00.000000
-- 2022-10-01
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1015, 66, 151, NULL, 'Analyze Leave Patterns', 'This is Analyze Leave Patterns', NULL, 'HARD', 'HR', 'URGENT', FALSE, '2022-10-01', '2022-10-28', '2022-10-09', '2022-10-01 00:40:00.000000', '2022-10-01 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20041, 1015, 141, 'JOINED', '2022-10-01 00:40:00.000000', '2022-10-01 06:14:04.800000'),
(20042, 1015, 142, 'JOINED', '2022-10-01 00:40:00.000000', '2022-10-01 19:52:00.000000'),
(20043, 1015, 143, 'JOINED', '2022-10-01 00:40:00.000000', '2022-10-08 05:28:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20041, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-10-08 07:23:12.000000', '2022-10-08 07:23:12.000000', '2022-10-08 07:28:12.000000'),
(DEFAULT, 20042, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-10-16 05:28:00.000000', '2022-10-16 05:28:00.000000', '2022-10-16 05:33:00.000000'),
(DEFAULT, 20043, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-10-28 13:43:21.600000', '2022-10-28 13:43:21.600000', '2022-10-28 13:48:21.600000');

-- 2022-10-10 00:40:00.000000
-- 2022-10-10
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1016, 66, 151, NULL, 'Prepare Overtime Statistics', 'This is Prepare Overtime Statistics', NULL, 'HARD', 'HR', 'HIGH', FALSE, '2022-10-10', '2022-10-31', '2022-10-17', '2022-10-10 00:40:00.000000', '2022-10-10 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20045, 1016, 142, 'JOINED', '2022-10-10 00:40:00.000000', '2022-10-16 07:52:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20045, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-10-31 12:35:40.800000', '2022-10-31 12:35:40.800000', '2022-10-31 12:40:40.800000');

-- 2022-10-18 00:40:00.000000
-- 2022-10-18
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1017, 66, 151, NULL, 'Analyze Workforce Utilization', 'This is Analyze Workforce Utilization', NULL, 'HARD', 'HR', 'URGENT', FALSE, '2022-10-18', '2022-11-13', '2022-10-26', '2022-10-18 00:40:00.000000', '2022-10-18 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20047, 1017, 141, 'JOINED', '2022-10-18 00:40:00.000000', '2022-10-19 21:12:38.400000'),
(20048, 1017, 142, 'JOINED', '2022-10-18 00:40:00.000000', '2022-10-25 05:28:00.000000'),
(20049, 1017, 143, 'JOINED', '2022-10-18 00:40:00.000000', '2022-10-18 06:19:50.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20047, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-10-24 22:21:45.600000', '2022-10-24 22:21:45.600000', '2022-10-24 22:26:45.600000'),
(DEFAULT, 20048, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-11-13 14:17:55.200000', '2022-11-13 14:17:55.200000', '2022-11-13 14:22:55.200000'),
(DEFAULT, 20049, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-11-02 19:00:09.600000', '2022-11-02 19:00:09.600000', '2022-11-02 19:05:09.600000');

-- 2022-10-27 00:40:00.000000
-- 2022-10-27
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1018, 66, 151, NULL, 'Prepare Gender Diversity Metrics', 'This is Prepare Gender Diversity Metrics', NULL, 'HARD', 'HR', 'HIGH', FALSE, '2022-10-27', '2022-11-07', '2022-11-03', '2022-10-27 00:40:00.000000', '2022-10-27 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20051, 1018, 142, 'JOINED', '2022-10-27 00:40:00.000000', '2022-10-29 11:02:48.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20051, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-11-07 14:17:12.000000', '2022-11-07 14:17:12.000000', '2022-11-07 14:22:12.000000');

-- 2022-11-04 00:40:00.000000
-- 2022-11-04
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1019, 66, 151, NULL, 'Prepare Age Distribution Report', 'This is Prepare Age Distribution Report', NULL, 'HARD', 'HR', 'URGENT', FALSE, '2022-11-04', '2022-11-28', '2022-11-12', '2022-11-04 00:40:00.000000', '2022-11-04 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20053, 1019, 141, 'JOINED', '2022-11-04 00:40:00.000000', '2022-11-04 22:10:14.400000'),
(20054, 1019, 142, 'JOINED', '2022-11-04 00:40:00.000000', '2022-11-11 05:28:00.000000'),
(20055, 1019, 143, 'JOINED', '2022-11-04 00:40:00.000000', '2022-11-04 16:53:26.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20053, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-11-08 22:21:45.600000', '2022-11-08 22:21:45.600000', '2022-11-08 22:26:45.600000'),
(DEFAULT, 20054, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-11-28 08:20:48.000000', '2022-11-28 08:20:48.000000', '2022-11-28 08:25:48.000000'),
(DEFAULT, 20055, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-11-19 08:26:33.600000', '2022-11-19 08:26:33.600000', '2022-11-19 08:31:33.600000');

-- 2022-11-13 00:40:00.000000
-- 2022-11-13
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1020, 66, 151, NULL, 'Prepare Skill Distribution Report', 'This is Prepare Skill Distribution Report', NULL, 'HARD', 'HR', 'HIGH', FALSE, '2022-11-13', '2022-11-26', '2022-11-20', '2022-11-13 00:40:00.000000', '2022-11-13 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20057, 1020, 142, 'JOINED', '2022-11-13 00:40:00.000000', '2022-11-13 12:35:40.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20057, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-11-26 12:44:19.200000', '2022-11-26 12:44:19.200000', '2022-11-26 12:49:19.200000');

-- 2022-11-21 00:40:00.000000
-- 2022-11-21
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1021, 66, 151, NULL, 'Analyze Workforce Composition', 'This is Analyze Workforce Composition', NULL, 'HARD', 'HR', 'URGENT', FALSE, '2022-11-21', '2022-12-06', '2022-11-29', '2022-11-21 00:40:00.000000', '2022-11-21 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20059, 1021, 141, 'JOINED', '2022-11-21 00:40:00.000000', '2022-11-22 11:13:36.000000'),
(20060, 1021, 142, 'JOINED', '2022-11-21 00:40:00.000000', '2022-11-22 16:13:07.200000'),
(20061, 1021, 143, 'JOINED', '2022-11-21 00:40:00.000000', '2022-11-21 14:58:14.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20059, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-12-05 14:06:24.000000', '2022-12-05 14:06:24.000000', '2022-12-05 14:11:24.000000'),
(DEFAULT, 20060, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-11-27 03:44:19.200000', '2022-11-27 03:44:19.200000', '2022-11-27 03:49:19.200000'),
(DEFAULT, 20061, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-12-06 10:21:45.600000', '2022-12-06 10:21:45.600000', '2022-12-06 10:26:45.600000');

-- 2022-11-30 00:40:00.000000
-- 2022-11-30
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1022, 66, 151, NULL, 'Prepare Quarterly HR Dashboard', 'This is Prepare Quarterly HR Dashboard', NULL, 'HARD', 'HR', 'HIGH', FALSE, '2022-11-30', '2022-12-04', '2022-12-07', '2022-11-30 00:40:00.000000', '2022-11-30 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20063, 1022, 142, 'JOINED', '2022-11-30 00:40:00.000000', '2022-11-30 12:45:45.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20063, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-12-04 19:04:28.800000', '2022-12-04 19:04:28.800000', '2022-12-04 19:09:28.800000');

-- 2022-12-08 00:40:00.000000
-- 2022-12-08
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1023, 66, 151, NULL, 'Validate HR Metric Accuracy', 'This is Validate HR Metric Accuracy', NULL, 'HARD', 'HR', 'URGENT', FALSE, '2022-12-08', '2023-01-03', '2022-12-16', '2022-12-08 00:40:00.000000', '2022-12-08 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20065, 1023, 141, 'JOINED', '2022-12-08 00:40:00.000000', '2022-12-10 05:16:28.800000'),
(20066, 1023, 142, 'JOINED', '2022-12-08 00:40:00.000000', '2022-12-15 05:28:00.000000'),
(20067, 1023, 143, 'JOINED', '2022-12-08 00:40:00.000000', '2022-12-15 05:28:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20065, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-12-15 18:19:50.400000', '2022-12-15 18:19:50.400000', '2022-12-15 18:24:50.400000'),
(DEFAULT, 20066, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-01-03 21:12:38.400000', '2023-01-03 21:12:38.400000', '2023-01-03 21:17:38.400000'),
(DEFAULT, 20067, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-01-03 04:41:55.200000', '2023-01-03 04:41:55.200000', '2023-01-03 04:46:55.200000');

-- 2022-12-17 00:40:00.000000
-- 2022-12-17
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1024, 66, 151, NULL, 'Review KPI Definitions', 'This is Review KPI Definitions', NULL, 'HARD', 'HR', 'HIGH', FALSE, '2022-12-17', '2023-01-07', '2022-12-24', '2022-12-17 00:40:00.000000', '2022-12-17 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20069, 1024, 142, 'JOINED', '2022-12-17 00:40:00.000000', '2022-12-23 07:52:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20069, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-01-07 12:45:45.600000', '2023-01-07 12:45:45.600000', '2023-01-07 12:50:45.600000');

-- 2022-12-25 00:40:00.000000
-- 2022-12-25
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1025, 66, 151, NULL, 'Update Metrics Documentation', 'This is Update Metrics Documentation', NULL, 'HARD', 'HR', 'URGENT', FALSE, '2022-12-25', '2022-12-29', '2023-01-02', '2022-12-25 00:40:00.000000', '2022-12-25 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20071, 1025, 141, 'JOINED', '2022-12-25 00:40:00.000000', '2022-12-25 18:31:21.600000'),
(20072, 1025, 142, 'JOINED', '2022-12-25 00:40:00.000000', '2022-12-25 04:53:26.400000'),
(20073, 1025, 143, 'JOINED', '2022-12-25 00:40:00.000000', '2022-12-25 00:51:31.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20071, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-12-29 22:10:14.400000', '2022-12-29 22:10:14.400000', '2022-12-29 22:15:14.400000'),
(DEFAULT, 20072, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-12-29 21:01:07.200000', '2022-12-29 21:01:07.200000', '2022-12-29 21:06:07.200000'),
(DEFAULT, 20073, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2022-12-29 11:48:09.600000', '2022-12-29 11:48:09.600000', '2022-12-29 11:53:09.600000');

-- 2023-01-03 00:40:00.000000
-- 2023-01-03
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1026, 66, 151, NULL, 'Prepare Management Metrics Summary', 'This is Prepare Management Metrics Summary', NULL, 'HARD', 'HR', 'HIGH', FALSE, '2023-01-03', '2023-01-16', '2023-01-10', '2023-01-03 00:40:00.000000', '2023-01-03 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20075, 1026, 142, 'JOINED', '2023-01-03 00:40:00.000000', '2023-01-03 22:35:26.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20075, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-01-16 02:44:33.600000', '2023-01-16 02:44:33.600000', '2023-01-16 02:49:33.600000');

-- 2023-01-11 00:40:00.000000
-- 2023-01-11
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1027, 66, 151, NULL, 'Collect Management Feedback', 'This is Collect Management Feedback', NULL, 'HARD', 'HR', 'URGENT', FALSE, '2023-01-11', '2023-02-09', '2023-01-19', '2023-01-11 00:40:00.000000', '2023-01-11 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20077, 1027, 141, 'JOINED', '2023-01-11 00:40:00.000000', '2023-01-18 05:28:00.000000'),
(20078, 1027, 142, 'JOINED', '2023-01-11 00:40:00.000000', '2023-01-11 15:04:00.000000'),
(20079, 1027, 143, 'JOINED', '2023-01-11 00:40:00.000000', '2023-01-18 05:28:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20077, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-02-06 21:01:07.200000', '2023-02-06 21:01:07.200000', '2023-02-06 21:06:07.200000'),
(DEFAULT, 20078, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-01-16 11:13:36.000000', '2023-01-16 11:13:36.000000', '2023-01-16 11:18:36.000000'),
(DEFAULT, 20079, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-02-09 02:35:12.000000', '2023-02-09 02:35:12.000000', '2023-02-09 02:40:12.000000');

-- 2023-01-20 00:40:00.000000
-- 2023-01-20
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1028, 66, 151, NULL, 'Revise Metrics Reports', 'This is Revise Metrics Reports', NULL, 'HARD', 'HR', 'HIGH', FALSE, '2023-01-20', '2023-01-26', '2023-01-27', '2023-01-20 00:40:00.000000', '2023-01-20 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20081, 1028, 142, 'JOINED', '2023-01-20 00:40:00.000000', '2023-01-20 08:13:36.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20081, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-01-26 05:20:48.000000', '2023-01-26 05:20:48.000000', '2023-01-26 05:25:48.000000');

-- 2023-01-28 00:40:00.000000
-- 2023-01-28
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1029, 66, 151, NULL, 'Finalize HR Metrics Reports', 'This is Finalize HR Metrics Reports', NULL, 'HARD', 'HR', 'URGENT', FALSE, '2023-01-28', '2023-02-24', '2023-02-05', '2023-01-28 00:40:00.000000', '2023-01-28 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20083, 1029, 141, 'JOINED', '2023-01-28 00:40:00.000000', '2023-02-04 05:28:00.000000'),
(20084, 1029, 142, 'JOINED', '2023-01-28 00:40:00.000000', '2023-02-04 05:28:00.000000'),
(20085, 1029, 143, 'JOINED', '2023-01-28 00:40:00.000000', '2023-01-29 10:04:28.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20083, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-02-24 22:56:19.200000', '2023-02-24 22:56:19.200000', '2023-02-24 23:01:19.200000'),
(DEFAULT, 20084, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-02-22 14:06:24.000000', '2023-02-22 14:06:24.000000', '2023-02-22 14:11:24.000000'),
(DEFAULT, 20085, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-02-03 08:09:16.800000', '2023-02-03 08:09:16.800000', '2023-02-03 08:14:16.800000');

-- 2023-02-06 00:40:00.000000
-- 2023-02-06
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1030, 66, 151, NULL, 'Publish HR Statistics', 'This is Publish HR Statistics', NULL, 'HARD', 'HR', 'URGENT', FALSE, '2023-02-06', '2023-03-02', '2023-02-14', '2023-02-06 00:40:00.000000', '2023-02-06 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20087, 1030, 141, 'JOINED', '2023-02-06 00:40:00.000000', '2023-02-13 05:28:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20087, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-03-02 12:57:16.800000', '2023-03-02 12:57:16.800000', '2023-03-02 13:02:16.800000');

-- 2023-02-15 00:40:00.000000
-- 2023-02-15
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1031, 66, 151, NULL, 'Archive Metrics Documentation', 'This is Archive Metrics Documentation', NULL, 'HARD', 'HR', 'URGENT', FALSE, '2023-02-15', '2023-03-13', '2023-02-23', '2023-02-15 00:40:00.000000', '2023-02-15 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20089, 1031, 141, 'JOINED', '2023-02-15 00:40:00.000000', '2023-02-22 05:28:00.000000'),
(20090, 1031, 142, 'JOINED', '2023-02-15 00:40:00.000000', '2023-02-22 05:28:00.000000'),
(20091, 1031, 143, 'JOINED', '2023-02-15 00:40:00.000000', '2023-02-15 12:11:12.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20089, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-03-12 20:03:31.200000', '2023-03-12 20:03:31.200000', '2023-03-12 20:08:31.200000'),
(DEFAULT, 20090, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-03-13 18:19:50.400000', '2023-03-13 18:19:50.400000', '2023-03-13 18:24:50.400000'),
(DEFAULT, 20091, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-02-22 23:42:24.000000', '2023-02-22 23:42:24.000000', '2023-02-22 23:47:24.000000');

-- 2023-02-24 00:40:00.000000
-- 2023-02-24
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1032, 66, 151, NULL, 'Sign Off HR Metrics Reports', 'This is Sign Off HR Metrics Reports', NULL, 'HARD', 'HR', 'URGENT', FALSE, '2023-02-24', '2023-03-24', '2023-03-04', '2023-02-24 00:40:00.000000', '2023-02-24 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20093, 1032, 141, 'JOINED', '2023-02-24 00:40:00.000000', '2023-03-03 05:28:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20093, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-03-24 15:04:00.000000', '2023-03-24 15:04:00.000000', '2023-03-24 15:09:00.000000');

-- 2023-03-05 00:40:00.000000
-- 2023-03-05
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1033, 66, 151, NULL, 'Close Metrics Collection', 'This is Close Metrics Collection', NULL, 'HARD', 'HR', 'URGENT', FALSE, '2023-03-05', '2023-03-19', '2023-03-13', '2023-03-05 00:40:00.000000', '2023-03-05 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20095, 1033, 141, 'JOINED', '2023-03-05 00:40:00.000000', '2023-03-05 01:03:02.400000'),
(20096, 1033, 142, 'JOINED', '2023-03-05 00:40:00.000000', '2023-03-06 04:13:07.200000'),
(20097, 1033, 143, 'JOINED', '2023-03-05 00:40:00.000000', '2023-03-05 04:30:24.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20095, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-03-09 06:25:36.000000', '2023-03-09 06:25:36.000000', '2023-03-09 06:30:36.000000'),
(DEFAULT, 20096, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-03-19 21:06:52.800000', '2023-03-19 21:06:52.800000', '2023-03-19 21:11:52.800000'),
(DEFAULT, 20097, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-03-10 09:52:57.600000', '2023-03-10 09:52:57.600000', '2023-03-10 09:57:57.600000');

-- 2023-03-14 00:40:00.000000
-- 2023-03-14
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1034, 66, 151, NULL, 'Complete HR Statistics Review', 'This is Complete HR Statistics Review', NULL, 'HARD', 'HR', 'URGENT', FALSE, '2023-03-14', '2023-04-09', '2023-03-22', '2023-03-14 00:40:00.000000', '2023-03-14 00:40:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20099, 1034, 141, 'JOINED', '2023-03-14 00:40:00.000000', '2023-03-21 05:28:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20099, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-04-09 16:01:36.000000', '2023-04-09 16:01:36.000000', '2023-04-09 16:06:36.000000');

INSERT INTO collection (`id`, `created_time`, `description`, `due_date`, `start_date`, `name`, `updated_time`, `phase_id`, `created_by_id`)
VALUES (67, '2023-03-22 00:40:00.000000', 'This is Internal HR Reporting & Review', '2023-11-15', '2023-03-22', 'Internal HR Reporting & Review', '2023-03-22 00:40:00.000000', 12, 154);


-- 2023-03-23 00:45:00.000000
-- 2023-03-23
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1035, 67, 151, NULL, 'Prepare Monthly HR Activity Report', 'This is Prepare Monthly HR Activity Report', NULL, 'HARD', 'HR', 'URGENT', FALSE, '2023-03-23', '2023-04-21', '2023-03-31', '2023-03-23 00:45:00.000000', '2023-03-23 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20101, 1035, 141, 'JOINED', '2023-03-23 00:45:00.000000', '2023-03-23 05:38:45.600000'),
(20102, 1035, 142, 'JOINED', '2023-03-23 00:45:00.000000', '2023-03-23 03:14:45.600000'),
(20103, 1035, 143, 'JOINED', '2023-03-23 00:45:00.000000', '2023-03-30 05:33:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20101, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-04-07 19:51:14.400000', '2023-04-07 19:51:14.400000', '2023-04-07 19:56:14.400000'),
(DEFAULT, 20102, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-03-29 00:56:31.200000', '2023-03-29 00:56:31.200000', '2023-03-29 01:01:31.200000'),
(DEFAULT, 20103, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-04-21 06:19:04.800000', '2023-04-21 06:19:04.800000', '2023-04-21 06:24:04.800000');

-- 2023-04-01 00:45:00.000000
-- 2023-04-01
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1036, 67, 151, NULL, 'Collect Department HR Updates', 'This is Collect Department HR Updates', NULL, 'HARD', 'HR', 'URGENT', FALSE, '2023-04-01', '2023-05-01', '2023-04-09', '2023-04-01 00:45:00.000000', '2023-04-01 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20105, 1036, 141, 'JOINED', '2023-04-01 00:45:00.000000', '2023-04-08 05:33:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20105, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-05-01 11:07:04.800000', '2023-05-01 11:07:04.800000', '2023-05-01 11:12:04.800000');

-- 2023-04-10 00:45:00.000000
-- 2023-04-10
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1037, 67, 151, NULL, 'Summarize HR Activities', 'This is Summarize HR Activities', NULL, 'ADVANCED', 'HR', 'URGENT', FALSE, '2023-04-10', '2023-05-07', '2023-04-17', '2023-04-10 00:45:00.000000', '2023-04-10 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20107, 1037, 142, 'JOINED', '2023-04-10 00:45:00.000000', '2023-04-16 07:57:00.000000'),
(20108, 1037, 144, 'JOINED', '2023-04-10 00:45:00.000000', '2023-04-11 02:57:28.800000'),
(20109, 1037, 145, 'JOINED', '2023-04-10 00:45:00.000000', '2023-04-10 03:11:09.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20107, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-05-07 02:44:31.200000', '2023-05-07 02:44:31.200000', '2023-05-07 02:49:31.200000'),
(DEFAULT, 20108, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-04-16 04:25:19.200000', '2023-04-16 04:25:19.200000', '2023-04-16 04:30:19.200000'),
(DEFAULT, 20109, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-04-23 22:18:50.400000', '2023-04-23 22:18:50.400000', '2023-04-23 22:23:50.400000');

-- 2023-04-18 00:45:00.000000
-- 2023-04-18
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1038, 67, 151, NULL, 'Prepare Quarterly HR Performance Report', 'This is Prepare Quarterly HR Performance Report', NULL, 'ADVANCED', 'HR', 'URGENT', FALSE, '2023-04-18', '2023-05-13', '2023-04-25', '2023-04-18 00:45:00.000000', '2023-04-18 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20111, 1038, 144, 'JOINED', '2023-04-18 00:45:00.000000', '2023-04-24 07:57:00.000000'),
(20112, 1038, 145, 'JOINED', '2023-04-18 00:45:00.000000', '2023-04-18 04:26:45.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20111, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-05-13 03:11:52.800000', '2023-05-13 03:11:52.800000', '2023-05-13 03:16:52.800000'),
(DEFAULT, 20112, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-04-21 16:57:00.000000', '2023-04-21 16:57:00.000000', '2023-04-21 17:02:00.000000');

-- 2023-04-26 00:45:00.000000
-- 2023-04-26
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1039, 67, 151, NULL, 'Analyze HR Process Efficiency', 'This is Analyze HR Process Efficiency', NULL, 'ADVANCED', 'HR', 'URGENT', FALSE, '2023-04-26', '2023-05-22', '2023-05-03', '2023-04-26 00:45:00.000000', '2023-04-26 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20114, 1039, 142, 'JOINED', '2023-04-26 00:45:00.000000', '2023-05-02 07:57:00.000000'),
(20115, 1039, 144, 'JOINED', '2023-04-26 00:45:00.000000', '2023-05-02 07:57:00.000000'),
(20116, 1039, 145, 'JOINED', '2023-04-26 00:45:00.000000', '2023-05-02 07:57:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20114, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-05-21 12:06:07.200000', '2023-05-21 12:06:07.200000', '2023-05-21 12:11:07.200000'),
(DEFAULT, 20115, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-05-17 15:21:57.600000', '2023-05-17 15:21:57.600000', '2023-05-17 15:26:57.600000'),
(DEFAULT, 20116, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-05-22 15:59:24.000000', '2023-05-22 15:59:24.000000', '2023-05-22 16:04:24.000000');

-- 2023-05-04 00:45:00.000000
-- 2023-05-04
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1040, 67, 151, NULL, 'Identify HR Improvement Areas', 'This is Identify HR Improvement Areas', NULL, 'ADVANCED', 'HR', 'URGENT', FALSE, '2023-05-04', '2023-05-25', '2023-05-11', '2023-05-04 00:45:00.000000', '2023-05-04 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20118, 1040, 144, 'JOINED', '2023-05-04 00:45:00.000000', '2023-05-04 22:35:24.000000'),
(20119, 1040, 145, 'JOINED', '2023-05-04 00:45:00.000000', '2023-05-10 07:57:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20118, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-05-10 17:51:43.200000', '2023-05-10 17:51:43.200000', '2023-05-10 17:56:43.200000'),
(DEFAULT, 20119, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-05-25 14:21:28.800000', '2023-05-25 14:21:28.800000', '2023-05-25 14:26:28.800000');

-- 2023-05-12 00:45:00.000000
-- 2023-05-12
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1041, 67, 151, NULL, 'Prepare HR Improvement Proposals', 'This is Prepare HR Improvement Proposals', NULL, 'ADVANCED', 'HR', 'URGENT', FALSE, '2023-05-12', '2023-06-07', '2023-05-19', '2023-05-12 00:45:00.000000', '2023-05-12 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20121, 1041, 142, 'JOINED', '2023-05-12 00:45:00.000000', '2023-05-18 07:57:00.000000'),
(20122, 1041, 144, 'JOINED', '2023-05-12 00:45:00.000000', '2023-05-18 07:57:00.000000'),
(20123, 1041, 145, 'JOINED', '2023-05-12 00:45:00.000000', '2023-05-12 09:09:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20121, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-06-07 02:02:45.600000', '2023-06-07 02:02:45.600000', '2023-06-07 02:07:45.600000'),
(DEFAULT, 20122, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-06-06 03:52:12.000000', '2023-06-06 03:52:12.000000', '2023-06-06 03:57:12.000000'),
(DEFAULT, 20123, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-05-16 00:10:26.400000', '2023-05-16 00:10:26.400000', '2023-05-16 00:15:26.400000');

-- 2023-05-20 00:45:00.000000
-- 2023-05-20
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1042, 67, 151, NULL, 'Review HR Tool Usage', 'This is Review HR Tool Usage', NULL, 'ADVANCED', 'HR', 'URGENT', FALSE, '2023-05-20', '2023-06-10', '2023-05-27', '2023-05-20 00:45:00.000000', '2023-05-20 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20125, 1042, 144, 'JOINED', '2023-05-20 00:45:00.000000', '2023-05-21 12:57:14.400000'),
(20126, 1042, 145, 'JOINED', '2023-05-20 00:45:00.000000', '2023-05-26 07:57:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20125, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-06-01 12:32:45.600000', '2023-06-01 12:32:45.600000', '2023-06-01 12:37:45.600000'),
(DEFAULT, 20126, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-06-10 14:41:38.400000', '2023-06-10 14:41:38.400000', '2023-06-10 14:46:38.400000');

-- 2023-05-28 00:45:00.000000
-- 2023-05-28
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1043, 67, 151, NULL, 'Analyze HR System Data', 'This is Analyze HR System Data', NULL, 'ADVANCED', 'HR', 'HIGH', FALSE, '2023-05-28', '2023-06-17', '2023-06-03', '2023-05-28 00:45:00.000000', '2023-05-28 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20128, 1043, 142, 'JOINED', '2023-05-28 00:45:00.000000', '2023-05-28 01:02:16.800000'),
(20129, 1043, 144, 'JOINED', '2023-05-28 00:45:00.000000', '2023-06-02 10:21:00.000000'),
(20130, 1043, 145, 'JOINED', '2023-05-28 00:45:00.000000', '2023-05-28 21:37:48.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20128, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-05-29 06:59:24.000000', '2023-05-29 06:59:24.000000', '2023-05-29 07:04:24.000000'),
(DEFAULT, 20129, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-06-17 02:08:31.200000', '2023-06-17 02:08:31.200000', '2023-06-17 02:13:31.200000'),
(DEFAULT, 20130, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-06-01 01:13:48.000000', '2023-06-01 01:13:48.000000', '2023-06-01 01:18:48.000000');

-- 2023-06-04 00:45:00.000000
-- 2023-06-04
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1044, 67, 151, NULL, 'Prepare HR Digitalization Report', 'This is Prepare HR Digitalization Report', NULL, 'ADVANCED', 'HR', 'URGENT', FALSE, '2023-06-04', '2023-06-18', '2023-06-11', '2023-06-04 00:45:00.000000', '2023-06-04 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20132, 1044, 144, 'JOINED', '2023-06-04 00:45:00.000000', '2023-06-05 14:02:45.600000'),
(20133, 1044, 145, 'JOINED', '2023-06-04 00:45:00.000000', '2023-06-04 01:25:19.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20132, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-06-16 11:27:14.400000', '2023-06-16 11:27:14.400000', '2023-06-16 11:32:14.400000'),
(DEFAULT, 20133, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-06-18 00:04:40.800000', '2023-06-18 00:04:40.800000', '2023-06-18 00:09:40.800000');

-- 2023-06-12 00:45:00.000000
-- 2023-06-12
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1045, 67, 151, NULL, 'Collect HR Feedback from Employees', 'This is Collect HR Feedback from Employees', NULL, 'ADVANCED', 'HR', 'HIGH', FALSE, '2023-06-12', '2023-06-16', '2023-06-18', '2023-06-12 00:45:00.000000', '2023-06-12 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20135, 1045, 142, 'JOINED', '2023-06-12 00:45:00.000000', '2023-06-14 21:34:55.200000'),
(20136, 1045, 144, 'JOINED', '2023-06-12 00:45:00.000000', '2023-06-12 01:45:28.800000'),
(20137, 1045, 145, 'JOINED', '2023-06-12 00:45:00.000000', '2023-06-13 01:13:48.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20135, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-06-16 06:59:24.000000', '2023-06-16 06:59:24.000000', '2023-06-16 07:04:24.000000'),
(DEFAULT, 20136, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-06-14 19:42:36.000000', '2023-06-14 19:42:36.000000', '2023-06-14 19:47:36.000000'),
(DEFAULT, 20137, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-06-15 11:07:04.800000', '2023-06-15 11:07:04.800000', '2023-06-15 11:12:04.800000');

-- 2023-06-19 00:45:00.000000
-- 2023-06-19
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1046, 67, 151, NULL, 'Analyze Employee Satisfaction', 'This is Analyze Employee Satisfaction', NULL, 'ADVANCED', 'HR', 'URGENT', FALSE, '2023-06-19', '2023-07-15', '2023-06-26', '2023-06-19 00:45:00.000000', '2023-06-19 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20139, 1046, 144, 'JOINED', '2023-06-19 00:45:00.000000', '2023-06-21 06:30:36.000000'),
(20140, 1046, 145, 'JOINED', '2023-06-19 00:45:00.000000', '2023-06-25 07:57:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20139, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-06-24 21:32:02.400000', '2023-06-24 21:32:02.400000', '2023-06-24 21:37:02.400000'),
(DEFAULT, 20140, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-07-15 23:43:04.800000', '2023-07-15 23:43:04.800000', '2023-07-15 23:48:04.800000');

-- 2023-06-27 00:45:00.000000
-- 2023-06-27
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1047, 67, 151, NULL, 'Prepare Employee Feedback Summary', 'This is Prepare Employee Feedback Summary', NULL, 'ADVANCED', 'HR', 'HIGH', FALSE, '2023-06-27', '2023-07-02', '2023-07-03', '2023-06-27 00:45:00.000000', '2023-06-27 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20142, 1047, 142, 'JOINED', '2023-06-27 00:45:00.000000', '2023-06-30 11:41:38.400000'),
(20143, 1047, 144, 'JOINED', '2023-06-27 00:45:00.000000', '2023-06-27 05:21:28.800000'),
(20144, 1047, 145, 'JOINED', '2023-06-27 00:45:00.000000', '2023-06-27 11:58:55.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20142, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-07-02 01:08:02.400000', '2023-07-02 01:08:02.400000', '2023-07-02 01:13:02.400000'),
(DEFAULT, 20143, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-06-29 04:26:45.600000', '2023-06-29 04:26:45.600000', '2023-06-29 04:31:45.600000'),
(DEFAULT, 20144, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-06-29 12:13:19.200000', '2023-06-29 12:13:19.200000', '2023-06-29 12:18:19.200000');

-- 2023-07-04 00:45:00.000000
-- 2023-07-04
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1048, 67, 151, NULL, 'Review HR Communication Effectiveness', 'This is Review HR Communication Effectiveness', NULL, 'ADVANCED', 'HR', 'URGENT', FALSE, '2023-07-04', '2023-07-26', '2023-07-11', '2023-07-04 00:45:00.000000', '2023-07-04 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20146, 1048, 144, 'JOINED', '2023-07-04 00:45:00.000000', '2023-07-10 07:57:00.000000'),
(20147, 1048, 145, 'JOINED', '2023-07-04 00:45:00.000000', '2023-07-04 09:29:09.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20146, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-07-26 11:11:24.000000', '2023-07-26 11:11:24.000000', '2023-07-26 11:16:24.000000'),
(DEFAULT, 20147, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-07-08 00:50:45.600000', '2023-07-08 00:50:45.600000', '2023-07-08 00:55:45.600000');

-- 2023-07-12 00:45:00.000000
-- 2023-07-12
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1049, 67, 151, NULL, 'Prepare HR Communication Plan', 'This is Prepare HR Communication Plan', NULL, 'ADVANCED', 'HR', 'LOW', FALSE, '2023-07-12', '2023-07-15', '2023-07-16', '2023-07-12 00:45:00.000000', '2023-07-12 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20149, 1049, 143, 'JOINED', '2023-07-12 00:45:00.000000', '2023-07-12 02:22:55.200000'),
(20150, 1049, 144, 'JOINED', '2023-07-12 00:45:00.000000', '2023-07-12 13:36:50.400000'),
(20151, 1049, 145, 'JOINED', '2023-07-12 00:45:00.000000', '2023-07-12 09:52:12.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20149, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-07-13 03:49:19.200000', '2023-07-13 03:49:19.200000', '2023-07-13 03:54:19.200000'),
(DEFAULT, 20150, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-07-15 01:25:19.200000', '2023-07-15 01:25:19.200000', '2023-07-15 01:30:19.200000'),
(DEFAULT, 20151, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-07-13 22:15:14.400000', '2023-07-13 22:15:14.400000', '2023-07-13 22:20:14.400000');

-- 2023-07-17 00:45:00.000000
-- 2023-07-17
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1050, 67, 151, NULL, 'Update Internal HR Guidelines', 'This is Update Internal HR Guidelines', NULL, 'ADVANCED', 'HR', 'URGENT', FALSE, '2023-07-17', '2023-08-07', '2023-07-24', '2023-07-17 00:45:00.000000', '2023-07-17 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20153, 1050, 144, 'JOINED', '2023-07-17 00:45:00.000000', '2023-07-17 06:37:48.000000'),
(20154, 1050, 145, 'JOINED', '2023-07-17 00:45:00.000000', '2023-07-23 07:57:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20153, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-07-30 18:52:12.000000', '2023-07-30 18:52:12.000000', '2023-07-30 18:57:12.000000'),
(DEFAULT, 20154, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-08-07 18:53:38.400000', '2023-08-07 18:53:38.400000', '2023-08-07 18:58:38.400000');

-- 2023-07-25 00:45:00.000000
-- 2023-07-25
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1051, 67, 151, NULL, 'Prepare HR Knowledge Base Updates', 'This is Prepare HR Knowledge Base Updates', NULL, 'ADVANCED', 'HR', 'LOW', FALSE, '2023-07-25', '2023-07-31', '2023-07-29', '2023-07-25 00:45:00.000000', '2023-07-25 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20156, 1051, 143, 'JOINED', '2023-07-25 00:45:00.000000', '2023-07-25 03:03:14.400000'),
(20157, 1051, 144, 'JOINED', '2023-07-25 00:45:00.000000', '2023-07-27 16:06:36.000000'),
(20158, 1051, 145, 'JOINED', '2023-07-25 00:45:00.000000', '2023-07-26 14:45:57.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20156, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-07-26 04:29:38.400000', '2023-07-26 04:29:38.400000', '2023-07-26 04:34:38.400000'),
(DEFAULT, 20157, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-07-28 22:32:31.200000', '2023-07-28 22:32:31.200000', '2023-07-28 22:37:31.200000'),
(DEFAULT, 20158, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-07-31 10:44:02.400000', '2023-07-31 10:44:02.400000', '2023-07-31 10:49:02.400000');

-- 2023-07-30 00:45:00.000000
-- 2023-07-30
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1052, 67, 151, NULL, 'Validate HR Documentation Consistency', 'This is Validate HR Documentation Consistency', NULL, 'ADVANCED', 'HR', 'URGENT', FALSE, '2023-07-30', '2023-08-12', '2023-08-06', '2023-07-30 00:45:00.000000', '2023-07-30 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20160, 1052, 144, 'JOINED', '2023-07-30 00:45:00.000000', '2023-07-30 04:46:55.200000'),
(20161, 1052, 145, 'JOINED', '2023-07-30 00:45:00.000000', '2023-07-30 23:30:50.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20160, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-08-12 20:43:04.800000', '2023-08-12 20:43:04.800000', '2023-08-12 20:48:04.800000'),
(DEFAULT, 20161, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-08-12 01:59:09.600000', '2023-08-12 01:59:09.600000', '2023-08-12 02:04:09.600000');

-- 2023-08-07 00:45:00.000000
-- 2023-08-07
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1053, 67, 151, NULL, 'Prepare HR Risk Assessment', 'This is Prepare HR Risk Assessment', NULL, 'ADVANCED', 'HR', 'LOW', FALSE, '2023-08-07', '2023-08-09', '2023-08-11', '2023-08-07 00:45:00.000000', '2023-08-07 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20163, 1053, 143, 'JOINED', '2023-08-07 00:45:00.000000', '2023-08-08 11:47:24.000000'),
(20164, 1053, 144, 'JOINED', '2023-08-07 00:45:00.000000', '2023-08-07 15:20:31.200000'),
(20165, 1053, 145, 'JOINED', '2023-08-07 00:45:00.000000', '2023-08-07 08:02:45.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20163, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-08-09 14:05:38.400000', '2023-08-09 14:05:38.400000', '2023-08-09 14:10:38.400000'),
(DEFAULT, 20164, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-08-08 15:37:48.000000', '2023-08-08 15:37:48.000000', '2023-08-08 15:42:48.000000'),
(DEFAULT, 20165, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-08-08 06:24:50.400000', '2023-08-08 06:24:50.400000', '2023-08-08 06:29:50.400000');

-- 2023-08-12 00:45:00.000000
-- 2023-08-12
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1054, 67, 151, NULL, 'Review HR Compliance Status', 'This is Review HR Compliance Status', NULL, 'ADVANCED', 'HR', 'URGENT', FALSE, '2023-08-12', '2023-09-05', '2023-08-19', '2023-08-12 00:45:00.000000', '2023-08-12 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20167, 1054, 144, 'JOINED', '2023-08-12 00:45:00.000000', '2023-08-18 07:57:00.000000'),
(20168, 1054, 145, 'JOINED', '2023-08-12 00:45:00.000000', '2023-08-12 11:35:09.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20167, 'Employee 144 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-09-05 07:22:26.400000', '2023-09-05 07:22:26.400000', '2023-09-05 07:27:26.400000'),
(DEFAULT, 20168, 'Employee 145 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-08-25 13:54:50.400000', '2023-08-25 13:54:50.400000', '2023-08-25 13:59:50.400000');

-- 2023-08-20 00:45:00.000000
-- 2023-08-20
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1055, 67, 151, NULL, 'Prepare Annual HR Review', 'This is Prepare Annual HR Review', NULL, 'HARD', 'HR', 'HIGH', FALSE, '2023-08-20', '2023-09-13', '2023-08-27', '2023-08-20 00:45:00.000000', '2023-08-20 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20170, 1055, 142, 'JOINED', '2023-08-20 00:45:00.000000', '2023-08-26 07:57:00.000000'),
(20171, 1055, 143, 'JOINED', '2023-08-20 00:45:00.000000', '2023-08-26 07:57:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20170, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-09-10 10:49:48.000000', '2023-09-10 10:49:48.000000', '2023-09-10 10:54:48.000000'),
(DEFAULT, 20171, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-09-13 00:29:09.600000', '2023-09-13 00:29:09.600000', '2023-09-13 00:34:09.600000');

-- 2023-08-28 00:45:00.000000
-- 2023-08-28
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1056, 67, 151, NULL, 'Collect Leadership Feedback', 'This is Collect Leadership Feedback', NULL, 'HARD', 'HR', 'LOW', FALSE, '2023-08-28', '2023-09-06', '2023-09-02', '2023-08-28 00:45:00.000000', '2023-08-28 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20173, 1056, 141, 'JOINED', '2023-08-28 00:45:00.000000', '2023-08-28 02:33:00.000000'),
(20174, 1056, 142, 'JOINED', '2023-08-28 00:45:00.000000', '2023-08-30 01:13:48.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20173, 'Employee 141 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-09-06 22:57:00.000000', '2023-09-06 22:57:00.000000', '2023-09-06 23:02:00.000000'),
(DEFAULT, 20174, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-09-05 00:16:12.000000', '2023-09-05 00:16:12.000000', '2023-09-05 00:21:12.000000');

-- 2023-09-03 00:45:00.000000
-- 2023-09-03
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1057, 67, 151, NULL, 'Revise HR Review Report', 'This is Revise HR Review Report', NULL, 'HARD', 'HR', 'HIGH', FALSE, '2023-09-03', '2023-09-28', '2023-09-10', '2023-09-03 00:45:00.000000', '2023-09-03 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20176, 1057, 142, 'JOINED', '2023-09-03 00:45:00.000000', '2023-09-03 05:27:14.400000'),
(20177, 1057, 143, 'JOINED', '2023-09-03 00:45:00.000000', '2023-09-09 07:57:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20176, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-09-05 09:42:07.200000', '2023-09-05 09:42:07.200000', '2023-09-05 09:47:07.200000'),
(DEFAULT, 20177, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-09-28 18:39:14.400000', '2023-09-28 18:39:14.400000', '2023-09-28 18:44:14.400000');

-- 2023-09-11 00:45:00.000000
-- 2023-09-11
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1058, 67, 151, NULL, 'Finalize HR Review Documentation', 'This is Finalize HR Review Documentation', NULL, 'HARD', 'HR', 'NORMAL', FALSE, '2023-09-11', '2023-10-04', '2023-09-17', '2023-09-11 00:45:00.000000', '2023-09-11 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20179, 1058, 142, 'JOINED', '2023-09-11 00:45:00.000000', '2023-09-16 10:21:00.000000'),
(20180, 1058, 143, 'JOINED', '2023-09-11 00:45:00.000000', '2023-09-11 21:20:31.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20179, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-10-04 10:12:21.600000', '2023-10-04 10:12:21.600000', '2023-10-04 10:17:21.600000'),
(DEFAULT, 20180, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-09-15 01:48:21.600000', '2023-09-15 01:48:21.600000', '2023-09-15 01:53:21.600000');

-- 2023-09-18 00:45:00.000000
-- 2023-09-18
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1059, 67, 151, NULL, 'Present HR Review to Management', 'This is Present HR Review to Management', NULL, 'HARD', 'HR', 'HIGH', FALSE, '2023-09-18', '2023-09-24', '2023-09-25', '2023-09-18 00:45:00.000000', '2023-09-18 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20182, 1059, 142, 'JOINED', '2023-09-18 00:45:00.000000', '2023-09-20 18:36:21.600000'),
(20183, 1059, 143, 'JOINED', '2023-09-18 00:45:00.000000', '2023-09-18 17:33:00.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20182, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-09-24 04:45:28.800000', '2023-09-24 04:45:28.800000', '2023-09-24 04:50:28.800000'),
(DEFAULT, 20183, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-09-23 11:57:28.800000', '2023-09-23 11:57:28.800000', '2023-09-23 12:02:28.800000');

-- 2023-09-26 00:45:00.000000
-- 2023-09-26
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1060, 67, 151, NULL, 'Document Management Decisions', 'This is Document Management Decisions', NULL, 'HARD', 'HR', 'NORMAL', FALSE, '2023-09-26', '2023-09-27', '2023-10-02', '2023-09-26 00:45:00.000000', '2023-09-26 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20185, 1060, 142, 'JOINED', '2023-09-26 00:45:00.000000', '2023-09-26 07:05:09.600000'),
(20186, 1060, 143, 'JOINED', '2023-09-26 00:45:00.000000', '2023-09-26 03:46:26.400000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20185, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-09-27 07:08:02.400000', '2023-09-27 07:08:02.400000', '2023-09-27 07:13:02.400000'),
(DEFAULT, 20186, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-09-27 10:18:07.200000', '2023-09-27 10:18:07.200000', '2023-09-27 10:23:07.200000');

-- 2023-10-03 00:45:00.000000
-- 2023-10-03
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1061, 67, 151, NULL, 'Update HR Action Plan', 'This is Update HR Action Plan', NULL, 'HARD', 'HR', 'HIGH', FALSE, '2023-10-03', '2023-10-24', '2023-10-10', '2023-10-03 00:45:00.000000', '2023-10-03 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20188, 1061, 142, 'JOINED', '2023-10-03 00:45:00.000000', '2023-10-09 07:57:00.000000'),
(20189, 1061, 143, 'JOINED', '2023-10-03 00:45:00.000000', '2023-10-04 04:48:21.600000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20188, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-10-24 17:43:04.800000', '2023-10-24 17:43:04.800000', '2023-10-24 17:48:04.800000'),
(DEFAULT, 20189, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-10-06 09:23:24.000000', '2023-10-06 09:23:24.000000', '2023-10-06 09:28:24.000000');

-- 2023-10-11 00:45:00.000000
-- 2023-10-11
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1062, 67, 151, NULL, 'Track HR Action Items', 'This is Track HR Action Items', NULL, 'HARD', 'HR', 'NORMAL', FALSE, '2023-10-11', '2023-10-13', '2023-10-17', '2023-10-11 00:45:00.000000', '2023-10-11 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20191, 1062, 142, 'JOINED', '2023-10-11 00:45:00.000000', '2023-10-11 19:45:28.800000'),
(20192, 1062, 143, 'JOINED', '2023-10-11 00:45:00.000000', '2023-10-11 08:14:16.800000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20191, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-10-13 03:52:12.000000', '2023-10-13 03:52:12.000000', '2023-10-13 03:57:12.000000'),
(DEFAULT, 20192, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-10-12 11:09:57.600000', '2023-10-12 11:09:57.600000', '2023-10-12 11:14:57.600000');

-- 2023-10-18 00:45:00.000000
-- 2023-10-18
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1063, 67, 151, NULL, 'Verify Action Item Completion', 'This is Verify Action Item Completion', NULL, 'HARD', 'HR', 'HIGH', FALSE, '2023-10-18', '2023-10-31', '2023-10-25', '2023-10-18 00:45:00.000000', '2023-10-18 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20194, 1063, 142, 'JOINED', '2023-10-18 00:45:00.000000', '2023-10-19 16:18:50.400000'),
(20195, 1063, 143, 'JOINED', '2023-10-18 00:45:00.000000', '2023-10-18 17:22:55.200000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20194, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-10-30 09:11:09.600000', '2023-10-30 09:11:09.600000', '2023-10-30 09:16:09.600000'),
(DEFAULT, 20195, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-10-31 08:07:04.800000', '2023-10-31 08:07:04.800000', '2023-10-31 08:12:04.800000');

-- 2023-10-26 00:45:00.000000
-- 2023-10-26
INSERT INTO task (id, collection_id, created_by_id, root_task_id, name, description, report_format, level, task_type, priority, is_locked, start_date, end_date, deadline, created_time, updated_time)
VALUES (1064, 67, 151, NULL, 'Prepare HR Closure Report', 'This is Prepare HR Closure Report', NULL, 'HARD', 'HR', 'NORMAL', FALSE, '2023-10-26', '2023-11-15', '2023-11-01', '2023-10-26 00:45:00.000000', '2023-10-26 00:45:00.000000');

INSERT INTO task_for_users (id, task_id, assigned_to_id, user_task_status, updated_time, started_time)
VALUES
(20197, 1064, 142, 'JOINED', '2023-10-26 00:45:00.000000', '2023-10-31 10:21:00.000000'),
(20198, 1064, 143, 'JOINED', '2023-10-26 00:45:00.000000', '2023-10-26 05:04:12.000000');
INSERT INTO report (id, created_by_id, title, content, rejected_reason, report_status, created_time, updated_time, reviewed_time)
VALUES
(DEFAULT, 20197, 'Employee 142 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-11-15 09:03:14.400000', '2023-11-15 09:03:14.400000', '2023-11-15 09:08:14.400000'),
(DEFAULT, 20198, 'Employee 143 submit Report', 'Completed Task.', NULL, 'APPROVED', '2023-11-06 20:25:48.000000', '2023-11-06 20:25:48.000000', '2023-11-06 20:30:48.000000');

ALTER TABLE project AUTO_INCREMENT = 5;
ALTER TABLE project_role AUTO_INCREMENT = 9;
ALTER TABLE `phase` AUTO_INCREMENT = 13;
ALTER TABLE collection AUTO_INCREMENT = 68;
ALTER TABLE task AUTO_INCREMENT = 1065;
ALTER TABLE task_for_users AUTO_INCREMENT = 20200;
ALTER TABLE report AUTO_INCREMENT = 20200;

COMMIT;
