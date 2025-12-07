USE task_management;-- Reset tất cả table (nếu có dữ liệu cũ)
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
TRUNCATE TABLE `report`;
TRUNCATE TABLE `comment_of_report`;
TRUNCATE TABLE `group`;
TRUNCATE TABLE `group_has_users`;
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

-- 3. Tạo 10 Account ROLE_EMPLOYEE
-- password: 123123
INSERT INTO account (username, password, status, created_time, updated_time)
VALUES ('employee1', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee2', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee3', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee4', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee5', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee6', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee7', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee8', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee9', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee10', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee11', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee12', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee13', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee14', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee15', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee16', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee17', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee18', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee19', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee20', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee21', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee22', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee23', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee24', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee25', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee26', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee27', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee28', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee29', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee30', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee31', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee32', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee33', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee34', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee35', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee36', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee37', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee38', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee39', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee40', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee41', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee42', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee43', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee44', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee45', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee46', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee47', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee48', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee49', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee50', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee51', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee52', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee53', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee54', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee55', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee56', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee57', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee58', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee59', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee60', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee61', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee62', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee63', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee64', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee65', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee66', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee67', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee68', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee69', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee70', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee71', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee72', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee73', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee74', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee75', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee76', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee77', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee78', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee79', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee80', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee81', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee82', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee83', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee84', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee85', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee86', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee87', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee88', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee89', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee90', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee91', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee92', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee93', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee94', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee95', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee96', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee97', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee98', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee99', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee100', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee101', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee102', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee103', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee104', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee105', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee106', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee107', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee108', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee109', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee110', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee111', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee112', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee113', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee114', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee115', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee116', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee117', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee118', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee119', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('employee120', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW());

-- 4. Tạo 3 Account ROLE_LEAD
INSERT INTO account (username, password, status, created_time, updated_time)
VALUES ('lead1', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('lead2', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW()),
       ('lead3', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW());

-- 5. Tạo 1 Account ROLE_PM (Owner project)
INSERT INTO account (username, password, status, created_time, updated_time)
VALUES ('pm1', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW());

INSERT INTO account (username, password, status, created_time, updated_time)
VALUES ('admin', '$2a$08$ljSypDfSMuIH0tR0c3.GeuyKO20K77u.UBK/0Koxkmr5BOdTjTTVy', 1, NOW(), NOW());

-- ROLE_EMP cho 10 employee
INSERT INTO account_authorities (account_id, authority_id)
VALUES
    (1,4),
    (2,4),
    (3,4),
    (4,4),
    (5,4),
    (6,4),
    (7,4),
    (8,4),
    (9,4),
    (10,4),
    (11,4),
    (12,4),
    (13,4),
    (14,4),
    (15,4),
    (16,4),
    (17,4),
    (18,4),
    (19,4),
    (20,4),
    (21,4),
    (22,4),
    (23,4),
    (24,4),
    (25,4),
    (26,4),
    (27,4),
    (28,4),
    (29,4),
    (30,4),
    (31,4),
    (32,4),
    (33,4),
    (34,4),
    (35,4),
    (36,4),
    (37,4),
    (38,4),
    (39,4),
    (40,4),
    (41,4),
    (42,4),
    (43,4),
    (44,4),
    (45,4),
    (46,4),
    (47,4),
    (48,4),
    (49,4),
    (50,4),
    (51,4),
    (52,4),
    (53,4),
    (54,4),
    (55,4),
    (56,4),
    (57,4),
    (58,4),
    (59,4),
    (60,4),
    (61,4),
    (62,4),
    (63,4),
    (64,4),
    (65,4),
    (66,4),
    (67,4),
    (68,4),
    (69,4),
    (70,4),
    (71,4),
    (72,4),
    (73,4),
    (74,4),
    (75,4),
    (76,4),
    (77,4),
    (78,4),
    (79,4),
    (80,4),
    (81,4),
    (82,4),
    (83,4),
    (84,4),
    (85,4),
    (86,4),
    (87,4),
    (88,4),
    (89,4),
    (90,4),
    (91,4),
    (92,4),
    (93,4),
    (94,4),
    (95,4),
    (96,4),
    (97,4),
    (98,4),
    (99,4),
    (100,4),
    (101,4),
    (102,4),
    (103,4),
    (104,4),
    (105,4),
    (106,4),
    (107,4),
    (108,4),
    (109,4),
    (110,4),
    (111,4),
    (112,4),
    (113,4),
    (114,4),
    (115,4),
    (116,4),
    (117,4),
    (118,4),
    (119,4),
    (120,4);

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

INSERT INTO account_authorities (account_id, authority_id)
SELECT a.id, au.id
FROM account a
         JOIN authority au ON au.name = 'ROLE_ADMIN'
WHERE a.username = 'admin';

-- 6. Tạo UserInfo liên kết Account, 10 employee + 3 lead + 1 pm, phòng ban assign đơn giản
INSERT INTO user_info (full_name, email, phone, identity, department_id, account_id)
VALUES ('Employee 1', 'employee1@example.com', '0900000001', '001', 1, 1),
       ('Employee 2', 'employee2@example.com', '0900000002', '002', 1, 2),
       ('Employee 3', 'employee3@example.com', '0900000003', '003', 1, 3),
       ('Employee 4', 'employee4@example.com', '0900000004', '004', 1, 4),
       ('Employee 5', 'employee5@example.com', '0900000005', '005', 1, 5),
       ('Employee 6', 'employee6@example.com', '0900000006', '006', 1, 6),
       ('Employee 7', 'employee7@example.com', '0900000007', '007', 1, 7),
       ('Employee 8', 'employee8@example.com', '0900000008', '008', 1, 8),
       ('Employee 9', 'employee9@example.com', '0900000009', '009', 1, 9),
       ('Employee 10', 'employee10@example.com', '0900000010', '010', 1, 10);
INSERT INTO user_info (full_name, email, phone, identity, department_id, account_id)
VALUES
        ('Employee 11', 'employee11@example.com', '0900000011', '011', 1, 11),
       ('Employee 12', 'employee12@example.com', '0900000012', '012', 1, 12),
       ('Employee 13', 'employee13@example.com', '0900000013', '013', 1, 13),
       ('Employee 14', 'employee14@example.com', '0900000014', '014', 1, 14),
       ('Employee 15', 'employee15@example.com', '0900000015', '015', 1, 15),
       ('Employee 16', 'employee16@example.com', '0900000016', '016', 1, 16),
       ('Employee 17', 'employee17@example.com', '0900000017', '017', 1, 17),
       ('Employee 18', 'employee18@example.com', '0900000018', '018', 1, 18),
       ('Employee 19', 'employee19@example.com', '0900000019', '019', 1, 19),
       ('Employee 20', 'employee20@example.com', '0900000020', '020', 1, 20),
       ('Employee 21', 'employee21@example.com', '0900000021', '021', 1, 21),
       ('Employee 22', 'employee22@example.com', '0900000022', '022', 1, 22),
       ('Employee 23', 'employee23@example.com', '0900000023', '023', 1, 23),
       ('Employee 24', 'employee24@example.com', '0900000024', '024', 1, 24),
       ('Employee 25', 'employee25@example.com', '0900000025', '025', 1, 25),
       ('Employee 26', 'employee26@example.com', '0900000026', '026', 1, 26),
       ('Employee 27', 'employee27@example.com', '0900000027', '027', 1, 27),
       ('Employee 28', 'employee28@example.com', '0900000028', '028', 1, 28),
       ('Employee 29', 'employee29@example.com', '0900000029', '029', 1, 29),
       ('Employee 30', 'employee30@example.com', '0900000030', '030', 1, 30);
INSERT INTO user_info (full_name, email, phone, identity, department_id, account_id)
VALUES
       ('Employee 31', 'employee31@example.com', '0900000031', '031', 1, 31),
       ('Employee 32', 'employee32@example.com', '0900000032', '032', 1, 32),
       ('Employee 33', 'employee33@example.com', '0900000033', '033', 1, 33),
       ('Employee 34', 'employee34@example.com', '0900000034', '034', 1, 34),
       ('Employee 35', 'employee35@example.com', '0900000035', '035', 1, 35),
       ('Employee 36', 'employee36@example.com', '0900000036', '036', 1, 36),
       ('Employee 37', 'employee37@example.com', '0900000037', '037', 1, 37),
       ('Employee 38', 'employee38@example.com', '0900000038', '038', 1, 38),
       ('Employee 39', 'employee39@example.com', '0900000039', '039', 1, 39),
       ('Employee 40', 'employee40@example.com', '0900000040', '040', 1, 40),
       ('Employee 41', 'employee41@example.com', '0900000041', '041', 1, 41),
       ('Employee 42', 'employee42@example.com', '0900000042', '042', 1, 42),
       ('Employee 43', 'employee43@example.com', '0900000043', '043', 1, 43),
       ('Employee 44', 'employee44@example.com', '0900000044', '044', 1, 44),
       ('Employee 45', 'employee45@example.com', '0900000045', '045', 1, 45),
       ('Employee 46', 'employee46@example.com', '0900000046', '046', 1, 46),
       ('Employee 47', 'employee47@example.com', '0900000047', '047', 1, 47),
       ('Employee 48', 'employee48@example.com', '0900000048', '048', 1, 48),
       ('Employee 49', 'employee49@example.com', '0900000049', '049', 1, 49),
       ('Employee 50', 'employee50@example.com', '0900000050', '050', 1, 50);
INSERT INTO user_info (full_name, email, phone, identity, department_id, account_id)
VALUES
       ('Employee 51', 'employee51@example.com', '0900000051', '051', 1, 51),
       ('Employee 52', 'employee52@example.com', '0900000052', '052', 1, 52),
       ('Employee 53', 'employee53@example.com', '0900000053', '053', 1, 53),
       ('Employee 54', 'employee54@example.com', '0900000054', '054', 1, 54),
       ('Employee 55', 'employee55@example.com', '0900000055', '055', 1, 55),
       ('Employee 56', 'employee56@example.com', '0900000056', '056', 1, 56),
       ('Employee 57', 'employee57@example.com', '0900000057', '057', 1, 57),
       ('Employee 58', 'employee58@example.com', '0900000058', '058', 1, 58),
       ('Employee 59', 'employee59@example.com', '0900000059', '059', 1, 59),
       ('Employee 60', 'employee60@example.com', '0900000060', '060', 1, 60),
       ('Employee 61', 'employee61@example.com', '0900000061', '061', 1, 61),
       ('Employee 62', 'employee62@example.com', '0900000062', '062', 1, 62),
       ('Employee 63', 'employee63@example.com', '0900000063', '063', 1, 63),
       ('Employee 64', 'employee64@example.com', '0900000064', '064', 1, 64),
       ('Employee 65', 'employee65@example.com', '0900000065', '065', 1, 65),
       ('Employee 66', 'employee66@example.com', '0900000066', '066', 1, 66),
       ('Employee 67', 'employee67@example.com', '0900000067', '067', 1, 67),
       ('Employee 68', 'employee68@example.com', '0900000068', '068', 1, 68),
       ('Employee 69', 'employee69@example.com', '0900000069', '069', 1, 69),
       ('Employee 70', 'employee70@example.com', '0900000070', '070', 1, 70);
INSERT INTO user_info (full_name, email, phone, identity, department_id, account_id)
VALUES
       ('Employee 71', 'employee71@example.com', '0900000071', '071', 1, 71),
       ('Employee 72', 'employee72@example.com', '0900000072', '072', 1, 72),
       ('Employee 73', 'employee73@example.com', '0900000073', '073', 1, 73),
       ('Employee 74', 'employee74@example.com', '0900000074', '074', 1, 74),
       ('Employee 75', 'employee75@example.com', '0900000075', '075', 1, 75),
       ('Employee 76', 'employee76@example.com', '0900000076', '076', 1, 76),
       ('Employee 77', 'employee77@example.com', '0900000077', '077', 1, 77),
       ('Employee 78', 'employee78@example.com', '0900000078', '078', 1, 78),
       ('Employee 79', 'employee79@example.com', '0900000079', '079', 1, 79),
       ('Employee 80', 'employee80@example.com', '0900000080', '080', 1, 80),
       ('Employee 81', 'employee81@example.com', '0900000081', '081', 1, 81),
       ('Employee 82', 'employee82@example.com', '0900000082', '082', 1, 82),
       ('Employee 83', 'employee83@example.com', '0900000083', '083', 1, 83),
       ('Employee 84', 'employee84@example.com', '0900000084', '084', 1, 84),
       ('Employee 85', 'employee85@example.com', '0900000085', '085', 1, 85),
       ('Employee 86', 'employee86@example.com', '0900000086', '086', 1, 86),
       ('Employee 87', 'employee87@example.com', '0900000087', '087', 1, 87),
       ('Employee 88', 'employee88@example.com', '0900000088', '088', 1, 88),
       ('Employee 89', 'employee89@example.com', '0900000089', '089', 1, 89),
       ('Employee 90', 'employee90@example.com', '0900000090', '090', 1, 90);
INSERT INTO user_info (full_name, email, phone, identity, department_id, account_id)
VALUES
       ('Employee 91', 'employee91@example.com', '0900000091', '091', 1, 91),
       ('Employee 92', 'employee92@example.com', '0900000092', '092', 1, 92),
       ('Employee 93', 'employee93@example.com', '0900000093', '093', 1, 93),
       ('Employee 94', 'employee94@example.com', '0900000094', '094', 1, 94),
       ('Employee 95', 'employee95@example.com', '0900000095', '095', 1, 95),
       ('Employee 96', 'employee96@example.com', '0900000096', '096', 1, 96),
       ('Employee 97', 'employee97@example.com', '0900000097', '097', 1, 97),
       ('Employee 98', 'employee98@example.com', '0900000098', '098', 1, 98),
       ('Employee 99', 'employee99@example.com', '0900000099', '099', 1, 99),
       ('Employee 100', 'employee100@example.com', '0900000100', '100', 1, 100);
INSERT INTO user_info (full_name, email, phone, identity, department_id, account_id)
VALUES
       ('Employee 101', 'employee101@example.com', '0900000101', '101', 1, 101),
       ('Employee 102', 'employee102@example.com', '0900000102', '102', 1, 102),
       ('Employee 103', 'employee103@example.com', '0900000103', '103', 1, 103),
       ('Employee 104', 'employee104@example.com', '0900000104', '104', 1, 104),
       ('Employee 105', 'employee105@example.com', '0900000105', '105', 1, 105),
       ('Employee 106', 'employee106@example.com', '0900000106', '106', 1, 106),
       ('Employee 107', 'employee107@example.com', '0900000107', '107', 1, 107),
       ('Employee 108', 'employee108@example.com', '0900000108', '108', 1, 108),
       ('Employee 109', 'employee109@example.com', '0900000109', '109', 1, 109),
       ('Employee 110', 'employee110@example.com', '0900000110', '110', 1, 110);
INSERT INTO user_info (full_name, email, phone, identity, department_id, account_id)
VALUES
       ('Employee 111', 'employee111@example.com', '0900000111', '111', 1, 111),
       ('Employee 112', 'employee112@example.com', '0900000112', '112', 1, 112),
       ('Employee 113', 'employee113@example.com', '0900000113', '113', 1, 113),
       ('Employee 114', 'employee114@example.com', '0900000114', '114', 1, 114),
       ('Employee 115', 'employee115@example.com', '0900000115', '115', 1, 115),
       ('Employee 116', 'employee116@example.com', '0900000116', '116', 1, 116),
       ('Employee 117', 'employee117@example.com', '0900000117', '117', 1, 117),
       ('Employee 118', 'employee118@example.com', '0900000118', '118', 1, 118),
       ('Employee 119', 'employee119@example.com', '0900000119', '119', 1, 119),
       ('Employee 120', 'employee120@example.com', '0900000120', '120', 1, 120);
INSERT INTO user_info (full_name, email, phone, identity, department_id, account_id)
VALUES
       ('Lead 1', 'levandung.it03@gmail.com', '0910000001', '121', 2, 121),
       ('Lead 2', 'lead2@example.com', '0910000002', '122', 2, 122),
       ('Lead 3', 'lead3@example.com', '0910000003', '123', 2, 123),
       ('PM 1', 'pm1@example.com', '0920000001', '123', 3, 124),
       ('ADMIN', 'admin@example.com', '0920000001', '125', 3, 125);

-- Tạo các Groups
INSERT INTO `group` (created_by_id, name, active, created_time, updated_time)
VALUES
    (14, 'Group Alpha', 1, NOW(), NOW()),
    (14, 'Group Beta', 1, NOW(), NOW());

INSERT INTO group_has_users (joined_user_info_id, group_id, role, involved_time, active)
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
    AUTO_INCREMENT = 126;
ALTER TABLE user_info
    AUTO_INCREMENT = 126;
ALTER TABLE department
    AUTO_INCREMENT = 4;
ALTER TABLE `group`
    AUTO_INCREMENT = 3;
ALTER TABLE group_has_users
    AUTO_INCREMENT = 9;

-- COMMIT nếu cần
