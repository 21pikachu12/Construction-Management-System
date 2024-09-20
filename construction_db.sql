-- phpMyAdmin SQL Dump
-- version 4.1.6
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2024 at 10:57 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `construction_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=57 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add prottable', 7, 'add_prottable'),
(26, 'Can change prottable', 7, 'change_prottable'),
(27, 'Can delete prottable', 7, 'delete_prottable'),
(28, 'Can view prottable', 7, 'view_prottable'),
(29, 'Can add subconttable', 8, 'add_subconttable'),
(30, 'Can change subconttable', 8, 'change_subconttable'),
(31, 'Can delete subconttable', 8, 'delete_subconttable'),
(32, 'Can view subconttable', 8, 'view_subconttable'),
(33, 'Can add workertable', 9, 'add_workertable'),
(34, 'Can change workertable', 9, 'change_workertable'),
(35, 'Can delete workertable', 9, 'delete_workertable'),
(36, 'Can view workertable', 9, 'view_workertable'),
(37, 'Can add pro_assign_sub', 10, 'add_pro_assign_sub'),
(38, 'Can change pro_assign_sub', 10, 'change_pro_assign_sub'),
(39, 'Can delete pro_assign_sub', 10, 'delete_pro_assign_sub'),
(40, 'Can view pro_assign_sub', 10, 'view_pro_assign_sub'),
(41, 'Can add pro_assign_worker', 11, 'add_pro_assign_worker'),
(42, 'Can change pro_assign_worker', 11, 'change_pro_assign_worker'),
(43, 'Can delete pro_assign_worker', 11, 'delete_pro_assign_worker'),
(44, 'Can view pro_assign_worker', 11, 'view_pro_assign_worker'),
(45, 'Can add expenses_tbl', 12, 'add_expenses_tbl'),
(46, 'Can change expenses_tbl', 12, 'change_expenses_tbl'),
(47, 'Can delete expenses_tbl', 12, 'delete_expenses_tbl'),
(48, 'Can view expenses_tbl', 12, 'view_expenses_tbl'),
(49, 'Can add documents_tbl', 13, 'add_documents_tbl'),
(50, 'Can change documents_tbl', 13, 'change_documents_tbl'),
(51, 'Can delete documents_tbl', 13, 'delete_documents_tbl'),
(52, 'Can view documents_tbl', 13, 'view_documents_tbl'),
(53, 'Can add worker_wages', 14, 'add_worker_wages'),
(54, 'Can change worker_wages', 14, 'change_worker_wages'),
(55, 'Can delete worker_wages', 14, 'delete_worker_wages'),
(56, 'Can view worker_wages', 14, 'view_worker_wages');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `construction_documents_tbl`
--

CREATE TABLE IF NOT EXISTS `construction_documents_tbl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `contract_file` varchar(500) NOT NULL,
  `permit_file` varchar(500) NOT NULL,
  `design_file` varchar(500) NOT NULL,
  `other` varchar(500) NOT NULL,
  `project_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `construction_documen_project_id_6b7fe950_fk_construct` (`project_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `construction_documents_tbl`
--

INSERT INTO `construction_documents_tbl` (`id`, `contract_file`, `permit_file`, `design_file`, `other`, `project_id`) VALUES
(1, 'loginform1_p-1.png', 'maxresdefault_8FgFRFd.jpg', 'html-template-preview-87500_hW4PBKl.jpg', 'IMG-20210326-WA0129.jpg', 2);

-- --------------------------------------------------------

--
-- Table structure for table `construction_expenses_tbl`
--

CREATE TABLE IF NOT EXISTS `construction_expenses_tbl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `details` varchar(500) NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `project_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `construction_expense_project_id_486fa753_fk_construct` (`project_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `construction_expenses_tbl`
--

INSERT INTO `construction_expenses_tbl` (`id`, `details`, `date`, `amount`, `project_id`) VALUES
(1, 'Wage 5000,cement10000,equipment charges 2000', '2024-03-06', '17000.00', 2),
(2, 'Wage 3000,\nEquipments 5000,\nwater 3000,\ncement 4000', '2024-03-07', '15000.00', 2),
(3, 'cement-2000\r\nEquipments -1000\r\nwater-1000', '2024-03-09', '40000.00', 2),
(4, 'Cement -2000\r\nequipment-2000', '2024-03-09', '4000.00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `construction_prottable`
--

CREATE TABLE IF NOT EXISTS `construction_prottable` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `project` varchar(150) NOT NULL,
  `location` varchar(150) NOT NULL,
  `address` varchar(150) NOT NULL,
  `description` varchar(150) NOT NULL,
  `start_date` date NOT NULL,
  `pdf_file` varchar(120) NOT NULL,
  `status` varchar(120) NOT NULL,
  `estimated_price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `construction_prottable`
--

INSERT INTO `construction_prottable` (`id`, `project`, `location`, `address`, `description`, `start_date`, `pdf_file`, `status`, `estimated_price`) VALUES
(1, 'Project 1', 'ernakulam', 'Palarivattom', 'House Work', '2024-03-04', 'Business Analytics.pdf', 'Assigned', '100000.00'),
(2, 'Project 2', 'Palarivattom', 'Ernakulam', 'Store Work', '2024-03-05', 'maxresdefault.jpg', 'Assigned', '1000000.00'),
(3, 'Project 3', 'Ernakulam', 'Kakkanad', 'Work for House', '2024-03-07', 'html-template-preview-87500.jpg', 'Assigned', '2000000.00');

-- --------------------------------------------------------

--
-- Table structure for table `construction_pro_assign_sub`
--

CREATE TABLE IF NOT EXISTS `construction_pro_assign_sub` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) NOT NULL,
  `sub_con_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `construction_pro_ass_project_id_079ed90e_fk_construct` (`project_id`),
  KEY `construction_pro_ass_sub_con_id_ddb851eb_fk_construct` (`sub_con_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `construction_pro_assign_sub`
--

INSERT INTO `construction_pro_assign_sub` (`id`, `project_id`, `sub_con_id`) VALUES
(1, 1, 2),
(2, 2, 1),
(3, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `construction_pro_assign_worker`
--

CREATE TABLE IF NOT EXISTS `construction_pro_assign_worker` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `project_id` bigint(20) NOT NULL,
  `worker_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `construction_pro_ass_project_id_9ac86040_fk_construct` (`project_id`),
  KEY `construction_pro_ass_worker_id_bce7d8c7_fk_construct` (`worker_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `construction_pro_assign_worker`
--

INSERT INTO `construction_pro_assign_worker` (`id`, `project_id`, `worker_id`) VALUES
(1, 2, 2),
(2, 2, 1),
(3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `construction_subconttable`
--

CREATE TABLE IF NOT EXISTS `construction_subconttable` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `number` varchar(150) NOT NULL,
  `address` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `construction_subconttable`
--

INSERT INTO `construction_subconttable` (`id`, `name`, `email`, `password`, `number`, `address`) VALUES
(1, 'Sub Contractor 1', 's1@gmail.com', '123', '9645277457', 'Ernakulam'),
(2, 'Sub Contractor 2', 's2@gmail.com', '123', '9645277457', 'Ernakulam');

-- --------------------------------------------------------

--
-- Table structure for table `construction_workertable`
--

CREATE TABLE IF NOT EXISTS `construction_workertable` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(150) NOT NULL,
  `number` varchar(150) NOT NULL,
  `address` varchar(150) NOT NULL,
  `status` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `construction_workertable`
--

INSERT INTO `construction_workertable` (`id`, `name`, `email`, `password`, `number`, `address`, `status`) VALUES
(1, 'Worker 1', 'w1@gmail.com', '123', '9645277457', 'Ernakulam', 'not_available'),
(2, 'Worker 2', 'w2@gmail.com', '123', '9645277457', 'Ernakulam', 'not_available'),
(3, 'Worker 3', 'w3@gmail.com', '123', '9645277457', 'Ernakulam', 'not_available');

-- --------------------------------------------------------

--
-- Table structure for table `construction_worker_wages`
--

CREATE TABLE IF NOT EXISTS `construction_worker_wages` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `hour` varchar(500) NOT NULL,
  `project_id` bigint(20) NOT NULL,
  `worker_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `construction_worker__project_id_ae074eff_fk_construct` (`project_id`),
  KEY `construction_worker__worker_id_371ebb40_fk_construct` (`worker_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `construction_worker_wages`
--

INSERT INTO `construction_worker_wages` (`id`, `date`, `amount`, `hour`, `project_id`, `worker_id`) VALUES
(1, '2024-03-06', '1000.00', '9', 2, 2),
(4, '2024-03-08', '1000.00', '9', 2, 2),
(5, '2024-03-08', '1000.00', '9', 2, 1),
(6, '2024-03-07', '1000.00', '9', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(13, 'construction', 'documents_tbl'),
(12, 'construction', 'expenses_tbl'),
(7, 'construction', 'prottable'),
(10, 'construction', 'pro_assign_sub'),
(11, 'construction', 'pro_assign_worker'),
(8, 'construction', 'subconttable'),
(9, 'construction', 'workertable'),
(14, 'construction', 'worker_wages'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-03-04 13:59:14.328954'),
(2, 'auth', '0001_initial', '2024-03-04 13:59:14.854614'),
(3, 'admin', '0001_initial', '2024-03-04 13:59:14.994089'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-03-04 13:59:14.994089'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-03-04 13:59:15.015059'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-03-04 13:59:15.079388'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-03-04 13:59:15.101589'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-03-04 13:59:15.135464'),
(9, 'auth', '0004_alter_user_username_opts', '2024-03-04 13:59:15.149487'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-03-04 13:59:15.180441'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-03-04 13:59:15.182953'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-03-04 13:59:15.182953'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-03-04 13:59:15.216062'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-03-04 13:59:15.237405'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-03-04 13:59:15.277460'),
(16, 'auth', '0011_update_proxy_permissions', '2024-03-04 13:59:15.282867'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-03-04 13:59:15.320051'),
(18, 'construction', '0001_initial', '2024-03-04 13:59:15.591547'),
(19, 'sessions', '0001_initial', '2024-03-04 13:59:15.634069'),
(20, 'construction', '0002_prottable_status', '2024-03-04 14:07:20.738609'),
(21, 'construction', '0003_pro_assign_sub', '2024-03-04 14:41:56.849640'),
(22, 'construction', '0004_workertable_status', '2024-03-04 15:21:53.816583'),
(23, 'construction', '0005_pro_assign_worker', '2024-03-05 07:58:11.927331'),
(24, 'construction', '0006_auto_20240305_1503', '2024-03-05 09:33:30.614488'),
(25, 'construction', '0007_auto_20240305_1755', '2024-03-05 12:25:07.621182'),
(26, 'construction', '0008_alter_pro_assign_worker_worker', '2024-03-05 16:15:57.723661'),
(27, 'construction', '0009_prottable_estimated_price', '2024-03-05 16:51:18.572751'),
(28, 'construction', '0010_expenses_tbl', '2024-03-05 17:23:01.286542'),
(29, 'construction', '0011_documents_tbl', '2024-03-06 05:21:33.505137'),
(30, 'construction', '0012_worker_wages', '2024-03-06 07:18:05.997044');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('9wenuyslq3771kydmutbxiqp99l9oxrp', '.eJyrVkrOzyspSkwuyS9ySM9NzMzRS87PVbLCLqyDJIyiRqkWAO-vGxM:1riWtB:WmxH98rvtvOQJxhqGgHqDneZQg_zXgP02KFgdR6hutM', '2024-03-22 09:51:41.242633'),
('k3jrsafseosvcv7yo6c19wb2gcfqhuc8', 'eyJjaWQiOjEsInVzZXJ0eXBlIjoiU1VCLUNPTlRSQUNUT1IifQ:1rhA2D:PhNVBqcOccW-xvQ-XjDcpDlipQEd1B6FIQzcde5W_M8', '2024-03-18 15:15:21.490625'),
('kztqh99rieai89q1a50d6livxpprtfh9', 'eyJjaWQiOjEsInVzZXJ0eXBlIjoiU1VCLUNPTlRSQUNUT1IifQ:1rhOfE:C4GsJhB9o-81W5pE-IAY3uPpV24nNj3PfBJ12ApyNR4', '2024-03-19 06:52:36.537071'),
('mdwtuk5tp5u6cu1t9d04753m2xjbb07d', '.eJyrVkrOzyspSkwuyS9ySM9NzMzRS87PVbLCLqyDJIyiRqkWAO-vGxM:1rhpXG:ZLhkjJ5Ru6bHoyrtJ8gqp-sJfO-qtMs7j6DdSDEXwZM', '2024-03-20 11:34:10.242935'),
('ss4e1b1hrvp7euzxda8wdezgw1wv6jms', '.eJyrVkrOzyspSkwuyS9ySM9NzMzRS87PVbLCLqyDJIyiRqkWAO-vGxM:1rhiPH:EOTsxAmnYP_8oUOG1mzL2rdzeepRccIVGkDKpk-CR1Q', '2024-03-20 03:57:27.735447');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `construction_documents_tbl`
--
ALTER TABLE `construction_documents_tbl`
  ADD CONSTRAINT `construction_documen_project_id_6b7fe950_fk_construct` FOREIGN KEY (`project_id`) REFERENCES `construction_prottable` (`id`);

--
-- Constraints for table `construction_expenses_tbl`
--
ALTER TABLE `construction_expenses_tbl`
  ADD CONSTRAINT `construction_expense_project_id_486fa753_fk_construct` FOREIGN KEY (`project_id`) REFERENCES `construction_prottable` (`id`);

--
-- Constraints for table `construction_pro_assign_sub`
--
ALTER TABLE `construction_pro_assign_sub`
  ADD CONSTRAINT `construction_pro_ass_project_id_079ed90e_fk_construct` FOREIGN KEY (`project_id`) REFERENCES `construction_prottable` (`id`),
  ADD CONSTRAINT `construction_pro_ass_sub_con_id_ddb851eb_fk_construct` FOREIGN KEY (`sub_con_id`) REFERENCES `construction_subconttable` (`id`);

--
-- Constraints for table `construction_pro_assign_worker`
--
ALTER TABLE `construction_pro_assign_worker`
  ADD CONSTRAINT `construction_pro_ass_project_id_9ac86040_fk_construct` FOREIGN KEY (`project_id`) REFERENCES `construction_prottable` (`id`),
  ADD CONSTRAINT `construction_pro_ass_worker_id_bce7d8c7_fk_construct` FOREIGN KEY (`worker_id`) REFERENCES `construction_workertable` (`id`);

--
-- Constraints for table `construction_worker_wages`
--
ALTER TABLE `construction_worker_wages`
  ADD CONSTRAINT `construction_worker__project_id_ae074eff_fk_construct` FOREIGN KEY (`project_id`) REFERENCES `construction_prottable` (`id`),
  ADD CONSTRAINT `construction_worker__worker_id_371ebb40_fk_construct` FOREIGN KEY (`worker_id`) REFERENCES `construction_workertable` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
