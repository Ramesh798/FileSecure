-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 25, 2022 at 02:19 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `filesecure`
--
CREATE DATABASE IF NOT EXISTS `filesecure` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `filesecure`;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

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
(25, 'Can add owner model', 7, 'add_ownermodel'),
(26, 'Can change owner model', 7, 'change_ownermodel'),
(27, 'Can delete owner model', 7, 'delete_ownermodel'),
(28, 'Can view owner model', 7, 'view_ownermodel'),
(29, 'Can add upload documents model', 8, 'add_uploaddocumentsmodel'),
(30, 'Can change upload documents model', 8, 'change_uploaddocumentsmodel'),
(31, 'Can delete upload documents model', 8, 'delete_uploaddocumentsmodel'),
(32, 'Can view upload documents model', 8, 'view_uploaddocumentsmodel'),
(33, 'Can add user model', 9, 'add_usermodel'),
(34, 'Can change user model', 9, 'change_usermodel'),
(35, 'Can delete user model', 9, 'delete_usermodel'),
(36, 'Can view user model', 9, 'view_usermodel'),
(37, 'Can add download request model', 10, 'add_downloadrequestmodel'),
(38, 'Can change download request model', 10, 'change_downloadrequestmodel'),
(39, 'Can delete download request model', 10, 'delete_downloadrequestmodel'),
(40, 'Can view download request model', 10, 'view_downloadrequestmodel'),
(41, 'Can add downloads model', 11, 'add_downloadsmodel'),
(42, 'Can change downloads model', 11, 'change_downloadsmodel'),
(43, 'Can delete downloads model', 11, 'delete_downloadsmodel'),
(44, 'Can view downloads model', 11, 'view_downloadsmodel');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'ownerapp', 'ownermodel'),
(8, 'ownerapp', 'uploaddocumentsmodel'),
(6, 'sessions', 'session'),
(10, 'userapp', 'downloadrequestmodel'),
(11, 'userapp', 'downloadsmodel'),
(9, 'userapp', 'usermodel');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-06-25 05:52:53.194899'),
(2, 'auth', '0001_initial', '2022-06-25 05:52:53.888976'),
(3, 'admin', '0001_initial', '2022-06-25 05:52:54.053088'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-06-25 05:52:54.068914'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-06-25 05:52:54.079882'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-06-25 05:52:54.195587'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-06-25 05:52:54.265480'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-06-25 05:52:54.320145'),
(9, 'auth', '0004_alter_user_username_opts', '2022-06-25 05:52:54.330114'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-06-25 05:52:54.390952'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-06-25 05:52:54.394941'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-06-25 05:52:54.406909'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-06-25 05:52:54.466202'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-06-25 05:52:54.530095'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-06-25 05:52:54.593924'),
(16, 'auth', '0011_update_proxy_permissions', '2022-06-25 05:52:54.617860'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-06-25 05:52:54.671700'),
(18, 'sessions', '0001_initial', '2022-06-25 05:52:54.742967'),
(19, 'ownerapp', '0001_initial', '2022-06-25 05:53:17.465366'),
(20, 'userapp', '0001_initial', '2022-06-25 05:53:34.470615'),
(21, 'userapp', '0002_downloadsmodel_req_id', '2022-06-25 06:23:48.059465'),
(22, 'ownerapp', '0002_uploaddocumentsmodel_download_rank', '2022-06-25 10:45:11.316710'),
(23, 'userapp', '0003_remove_downloadsmodel_download_rank', '2022-06-25 10:45:22.515020');

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
('dweglxs9z68h3s6hxejchk8fiuwg593m', '.eJyrVkpJzc1XsrLQUcovz0stis9MUbIy1FFKyU8GM010lEqLU5WsTME0RNqoFgDPnBC5:1o56Yi:fAnrfr7ExiX2TmGUFlWRZtaIdPuLLw24yF-LOf8iUh4', '2022-07-09 14:14:48.380373');

-- --------------------------------------------------------

--
-- Table structure for table `document_downloads`
--

CREATE TABLE IF NOT EXISTS `document_downloads` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `doc_id` int(11) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `downloaded_date` date DEFAULT NULL,
  `req_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`download_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Dumping data for table `document_downloads`
--

INSERT INTO `document_downloads` (`download_id`, `user_id`, `doc_id`, `status`, `downloaded_date`, `req_id`) VALUES
(1, 1, 1, 'downloaded', '2022-06-25', 1),
(2, 2, 1, 'downloaded', '2022-06-25', 2),
(3, 2, 2, 'downloaded', '2022-06-25', 3),
(4, 2, 3, 'downloaded', '2022-06-25', 4),
(11, 2, 3, 'downloaded', '2022-06-25', 4),
(12, 2, 3, 'downloaded', '2022-06-25', 4),
(13, 4, 4, 'downloaded', '2022-06-25', 5),
(14, 2, 3, 'downloaded', '2022-06-25', 4);

-- --------------------------------------------------------

--
-- Table structure for table `owner_details`
--

CREATE TABLE IF NOT EXISTS `owner_details` (
  `owner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `profile` varchar(100) DEFAULT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `cpwd` varchar(20) DEFAULT NULL,
  `reg_date` date NOT NULL,
  `otp` longtext,
  `status` varchar(20) NOT NULL,
  `verification` varchar(20) NOT NULL,
  PRIMARY KEY (`owner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `owner_details`
--

INSERT INTO `owner_details` (`owner_id`, `name`, `mobile`, `email`, `profile`, `pwd`, `cpwd`, `reg_date`, `otp`, `status`, `verification`) VALUES
(1, 'kumbham ramesh', 7981751867, 'krg4585@gmail.com', 'owner/29musk-1-mediumSquareAt3X.jpg', 'ramesh', 'ramesh', '2022-06-25', '1884', 'Accepted', 'verified'),
(2, 'tharun sai', 8788831212, 'saitharun581@gmail.com', 'owner/img369.jpg', 'tharun', 'tharun', '2022-06-25', '8229', 'Accepted', 'verified'),
(3, 'mark', 9999999999, 'mark@gmail.com', 'owner/Screenshot_3.png', 'mark', 'mark', '2022-06-25', '4331', 'pending', 'pending'),
(7, 'john', 8888888888, 'fazalsirprojects@gmail.com', 'owner/download.jfif', 'john', 'john', '2022-06-25', '6949', 'Accepted', 'verified'),
(8, 'Goutham', 7981751867, 'KRG45@gmail.com', 'owner/Screenshot_3_pFr8f1c.png', '', '', '2022-06-25', '3718', 'pending', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `upload_documents`
--

CREATE TABLE IF NOT EXISTS `upload_documents` (
  `doc_id` int(11) NOT NULL AUTO_INCREMENT,
  `document` varchar(100) DEFAULT NULL,
  `doc_type` longtext,
  `doc_size` bigint(20) DEFAULT NULL,
  `description` longtext,
  `doc_name` longtext,
  `enc_doc_name` longtext,
  `random_keys` longtext,
  `file_enc_key` longtext,
  `file_data` longtext,
  `upload_date` date NOT NULL,
  `status` longtext NOT NULL,
  `owner_id` int(11) DEFAULT NULL,
  `download_rank` int(11) DEFAULT NULL,
  PRIMARY KEY (`doc_id`),
  KEY `upload_documents_owner_id_add59dd9_fk_owner_details_owner_id` (`owner_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `upload_documents`
--

INSERT INTO `upload_documents` (`doc_id`, `document`, `doc_type`, `doc_size`, `description`, `doc_name`, `enc_doc_name`, `random_keys`, `file_enc_key`, `file_data`, `upload_date`, `status`, `owner_id`, `download_rank`) VALUES
(1, 'files/account activated.txt', 'text/plain', 1064, 'account activated', 'account activated.txt', 'account activated2.txt', 'learn,logic,check', 'F8tmbKsWtGjLOEWkLwsP39Kj3MH7CJVzGxTgD32GMf0=', 'gAAAAABitqPZYA_hUr0hnqF4i7D3vw-EAEXaSJsT8H5VKIOklvoNNwi2mVWCPsAiVOgVW4Er3-TgwVTTRjk6Yvd2d6LwtfOeLHK0SrbOKB02NiOIIvRQgI5-0vfYyYMh83ecnCZBNgvtDBkSQYkz0-AMOXZbYgAUSxhi2nGSvNJDuT5l4DKlGaOtkExG8C3rIvnlxMmyqOJBvozU9ldf_sWkZWnZ6-_8XnSQ5K1JYOcxVnDUkoGJXfydWtBDAizDgn2SeQJKBhGaF1kBSlp-_p1vW9jwwdpN744hs21flGDjsa2wRZVl2arnAjITN3TN3TraglDqrAA4Wsh8fbpH0lDkkRbN04EA7qNqIGSZIIT73kq5wZs0OWz1JlSfmpVzjMwFoooK2u5IGApdL_LiS7XUQeq3AfP5pG9DkC9EUcTZOtUJzOVUChfHU5HZzqpXTw8SJtPKbBYvkq1jfKW_ShbefERK-a_rey0YfEyTmZ2_CcC_Et0aIAviVfmoWrRHQZ4-PK1fmLITr11IVDoEs_ZhcM0wixdHA1C1svTCCW3xoHLy6XfgSzm4xG6wk7eZ_7XHPUXUWq0opQEbqWlcHEMRt200_PBayuCYPxZPIQPAzLi03Tf748yIcAplPSjcDqUjX5GAivrFMYBR9_QtZD49Nx5VdCsLyvzyCq2zj6h5y39HtMMIR7pjllkDk6_DnioaoifHuJg1V0xviyOqV5EsRjdnauyyBRGMnoIaHT_mLy6_PS8fB_Jq4aMV-CGQz0V2XDZT7oWGGNVBQsg7e0iwfk4Ow3Rk02wZiFPQ_LWxfxonfK7hLf5dyY02Wv6QF1fAVx4CXAp0VnS9KMlfyOaQFgCxF15HlIGlzjx7MsWNCSMZ9MZ8SW48hBLed_KZ2VEeEqhu5foUOZ8qWUN1gA0FjTTCo1sl1pMIL02qGE1at6rjHtNOcZfcQ7dehOt1JQVKHaLL0BfSgsUXUMRhaC0Xp6h1WgfmeojKMNI7PMEoC6eiRS63YGxS1n3xJYgeIyMZ081NJwRp97VFHr1HKyk8xajURSQhCzZVrjk1JiGkYUvWRr6CCxyx536SSYw81kX4opZjLbq0gmHcj1CzNWahQDhDsi3uhaRGA4oNHiEnOuUvq_6lEKfFbWWZkCzMEOIDn6JeqA5JPuW8OGrdd4yNJC4vREbIE47ecAwRfs4Pu-GzHcIDH-VfjnGouymSMmoV-IHJ_H0WpB_ybEe0jcWov97qFSdvHKmeFuIT3lpdNrJkKx_JGZXQig36kntXcZ1S9cwePyhSGYmXhD0286oMScFsjmQ2EorqwLmGxhLDpUDEQL7wOJ38IkIFW_mqYBhcmhCp3xUp7hg6zEMkX2lCuChEWcqseyOpjSzydmlHYlHaL4tZBtj-TM43WfmoG5XgL575FKuYC9LCDSw02xaZVqonm92PbB8CTt-UbpSAl4-lbBugZjTEjfqyxRgrNTVb98Tml_Z4qiCLhtWehtTGIPXMRhoBiA==', '2022-06-25', 'Accepted', 1, 2),
(2, 'files/frontend design.txt', 'text/plain', 193, 'front-end designing...', 'frontend design.txt', 'frontend design3.txt', 'front,end,develop', '8Htnjv80cbtyM4_A2ogCKYblcHA4ndBMXtdQVwhayws=', 'gAAAAABitrio_xZQ3FGooexefj08-BmlELO_9xDd_NsRmL97x2ehsg7B6AVMXupJ5hN6ndSK2tVNyZtnAkOr1ivRfCcBf9qC82P37K4MeXaQ_ODKVbniwO11zFfZaDP4XdLNQ6vop6MhZs8js0eNMQwn9a23DQj5HmGUIQhifFJptlio9LMLN2qprPxpVJ1hkvxJR4QslMHFMuV1NLX35lSdpWmZ36UDPaRxvA7tmH8UMctEiXSgED-bYpe7QkXAt7o78ixNe-q_r0eHwdYKv8ZprxMmFQNzjYOR7uLXImxLGkqUqyF2gHKhcNFvdWt2_h0MWrKrPpCeDR48Q2JN0YMZiJWlJJy7Ow==', '2022-06-25', 'Accepted', 1, 1),
(3, 'files/js validations.txt', 'text/plain', 5435, 'javascript validations', 'js validations.txt', 'js validations4.txt', 'javascript,js,name', 'UOdOyWqRR1lh-GA9FINdHuaM_V8DUYQkCecO8zIUSos=', 'gAAAAABittJ4suHfDi7mXs5db-JAD4shAFo7PYXhFl3y32-sBYfZFAueHJZcmOaOD6gkJ5CDRN8nJj1M8Zs3YgIBieqGOWOdDh0KTYx76kJfTadTzxwRGOMAF9XPFeYBts6huXmZMk1rGUACPMThQ_vhB1Gr5K9-QHFaGPPAaUFwdhp5Du6ntnIcyTbK9olKXrCzSdE-BjzicEreSLy7mtrGQfZ7VRtFvme2jh6ZIuT5TcdglpXPVw7GTrQNI9gy4iO__faHaE1Fkl1Yy-1UuZf16hNznvyLWyV7V2rBX9n2Q2qLsONQyQc8Y3pLdqDxl8TQ-rkIxAulIppUPn6Uhcs_2sYpKZ7lCuC4g7vTtGovtgJvGZGIwgBGeBSbW7rXuQHstqApQYUtn2YjjGdXIJ5MUk87oS-PsDUSr7pawaABoXu4LlMX4us0jkZmnfYsvKMNM7IjAw99YtorMOUi9Js0fF3UM3oN35e6uncQvikmgCk7DpdxIeOECCMOTFvKyx3BkupxsD80vMOSs42CDbFpz7MdyvN_GWhujSxqFAUt2n5iN-LpXMzH_seZR4LX2Ub_G38b6K1pcfrMxotCqUilY33AAFjSM-GDZ9yEV7NHSjak8KBDaCDDa5e8talS3hXr6VL7rHVa9U64wvthIRPJmqZyLMTfb1KbaBDZBWSjU8-z3bPR2Qcvf2_MLfv24GxTeUa1UQkVO2REr20ooUzkV87qB5_ovhkWZkm9zDNoLDCeleMcDD4YkerbZMom3_AZj2gZEf6xApu2omNbjpgCiJc1A7mXXkxGlFnxT0-1AN7q60rj04DzwT5mSORm9rUBAcUQrYGqyQe8JR_WJPxQW8nAVRNiPSjW_zdmX-H_JF-ED5v9o1UdupsANcTBQMUMu2sotph9E1uK7vaWRnVSVZ5M-3-cgbeN69PzlKlHMFeliOUz3kM9xhdyBzH-QI5B_9N0m1HLkWKKmJbP6g1FkdJL2k7VSLFSoF3NVVeBDObN__8DR6U7H_iQhjZgyfSrHdSzbzJ5MHxaGH9sKVRizqoYF60JfdjL499hUr-arq5xq4SJ0UFrcudDfxOojR7sy4fPM26X5o87HkOyOzlmM-fpsxlEt2msoyxQUw6HbbdPyFexkX4DuZXonD28Bl6OgnIYSzM_u5I_v1TuttId-NdsumO51OEmf4Z1YoGBJsPaLsm5RU7kPJLH706YtNkxm1g28MDR3nXF88VlXjNbWxzZWU71LxGg3LAJQ7TdcSgHiVRwnsEPCIGcnaM_9z3Fk2YX8B2Xo4J2Z_VixKbVN0EdTt2ubhwxXFBh7G4RAff3OyZL5QwQ-THEKb_dPh2Pq0UlkObvMocY01u7JbzKvKzRRh75wEORvuuFJKcVyxw9647NHCN9MnHO0dnRb-Lccqa3_ijc0Ip2OzeJQ-bU0ZLC07fl4ebuV5OxErnd46zVo0m07oBRD4sPYrKssZguoD3i6uAIHesaQbS9HgAwJq522qfaP9-OmEZT_IiSWEMahqxWdU6CHOM6FNTt-wdvAlEN7ghlkTEj6Pgi9rnYSGBEKjnReDeK5IrYjIiRcPSGvtpblaxTDVgwL5rUqnaAy6EmkHX9HApQLJkNw9qXuFb4kXP0WIRdFV2BIAw0Z6ZHF30IueBg3XC7mZ9G0Puga3gOHIo_DfmJ7n3IP2FJqEiM19Y7DA9E5WV6SZoe9aBOKFCBWIU8u11d1Ek0Sa_B7N0K0KaYZHOTO0a6mARvJvOnt--3M0mcVvZzeL70rLKwp-unBRTXkV2dzks544kdp2nZZc7RA_Chj31Kb8I1WEY0dxYCoFzzWBjt2gje3CXQmgLLlcuFvE_cFFK2_gO_GHThugRjrziyRWy2f46l5rpLHloeaN_mvHXz8Z6UeSjUOJToGoD48rOvtNxU9iGVO4AG3ta24GT2L3hAnqSIHQI9n3WmBiC8eF3VaHQeJBXfbaG57TkCkvZeawEXCP_XC-mJzl6KPXqMRjUwenfWhDih5k-JI4zVKyO37PMxImIF-wjB_zzWGLiqCk7prGxMN5j5pGgsRkNe0fP6VDF-RUDw0Q2D-Uj_mQ1nKogvnuP28WGRc18cSFTdZ3oEwvtTKQoj9lmOE6KCC0BeAbcygWjjhttKATRqgRm9rpNy6VUHuvnHkt4QxizoaJjOyCLoWZJ-9fyKSybC4ejM_MjMOmD1UT4Q2_fpp82b1LrGQtR4Ygu_oQK57tzFF4158LF2KF6xiVMqELiuHIZkhCnWXNPem7UgOEdg2vWqdwgUkvyO-SmOo6BA4PkqQ9NO4hNHywmltt2qzI6yg93h6rGMJTd0YhdDhO5HeNkG_w79eqVyYt43L2SyN3tzBtgt9CKYbtqnwdYHWlvzeBb3PGVdl4A4E58WmxPHGK97Uv75QuytQigPpbjYal5TMIPb51jgQyJCXpIZQoeOFAT4BU9XzRmqcluk6kEU9f3tOYd_qbI3FJ3QZObCGeOKLWD3io0nKghUy7xY5pgrzBvVLziUOIqJDeNfqXJOLo0fLay4IvJ3QKqtQy8CGHvggNtskjmlG2ggMM-0cDDWZhGs5HQIGrRPh43vvTu4jc9TZm1Yloj8mM5_t8Ns9K-qDzekxwLUQaAR_7-L90z4FaQ2z1AzS7btQAzRjveqnDEmEWHMZ3GmrMAFEalJqcG27VD8wQQRrRPsXwj_krz3lhfjTZjPlJTid8C5Pd3kAuiHV_IBU9ycDzbcL1KgQMk8irbBHjlbRvH9em8x44NxEo2-7wkFA0Xi3M2qD3YUKmYMdhllj1EyoY3ghgDmRtPpq0nhZ-fM0pZw4fOQ7svWiiuJy08GEU5dQp_nXgnDJTS7rK3bwEzUyfhFRx_E1qP3N6qLsxmc16vb-0m_6MnHNkX2ADKqok1_azw4y-u89lWdbmJtvPIDWqtmarfVWPJNYXaifK8CSDZKSS1_6WNLoA9kDXvQkXTD-rHhIdgTS9YXSCTVlbXfR2oNCYLwR8sNnmD6Fex_-9RSpawa8jNOePmO0WsqC2nT1kQ5N6jA_jedH-m1-ThtRuRcul4aCR89DjzUTeq2Ivm55spuCho3t7CgsD-YYFCFwEp_RH53ZEO0lmtdxV9sQxexE3cCaK45aXomMW0efldgUrxc8_OCJGjbU88Zb3hVgP-MUcJ5_sKA3uXYqFnMh9OOcQNx-b9hxk0R-Brpz4RGeft-SccfK7Qta-1Z6igzKxqhA60XfiiuS7ztagtOMApAqy8mvhVwPZZVkeNigl9JXdiCE_58L49M0292Cx0HAWRIbTYnQquWyIUK98RXIGHfz6Hi0y_PJ8OkBYWr5PfC3cMR6PLMcq3LovmQ53g03ncAfq4HT8YPxcknFg57aY8Jawr4NX-z6TrA5lG3x7UYy-Qd-GABCmCii1c40WPl7hRn76SeLfath6Ki9lVApoNJvKjccpJLlo_oFk2CsR85rTnSlfkiw2YIX0U_9htN1CZ_HZpCc0odH1y2iSHAxqWXvqXQ7zWxbSpFBjfBA8EEtnJRlEUqJ9tMRBGL35dp8JZn_vkJNxMDZnlArOnhiZvG7_VbQ1kU_YCnCExf3V49kKOLGlhPLJr7CYoxU3h0dCXmZdKpPl2lc4PIGzog9Evjt3cK3AeZDG5-ukhmCJUdasXzNlygUIBs96f4mcM1PKYuFxBvKZgchFFRzRPL6sxjOAq0m8_GaHwzSpQQewa6s0RXmQOzx6banBBT5UIVbIYtFPPh-5avhcBUIpp5A2yfcr0IWrca5TkbjWBeZqDQgv-dRKzcccZdl1ZWtCgafOaTCXJiPGoH8jFRQr2jLFfuAhgpC7VEaZSavRcyNHCCWPGfXTe7pw_7znI0NVq6JbLavP61tBMDAE0S2BkC-dnHEdS_5AfS4GT1biJv0x438wc4kIIaNettXFot_LbrG38PJyEsT0pbImPq8Vt_xD0LqaCwSXUzrxGY0jHjqqbu1Q9NUZPOsC9F3hE_RQqJePHR7TorfT0G9e6UDMdr3j-aRDczqtKvzXfItd_ij24ZYbe1q9xoauYgrCCdOfRTI3Uc1kD9KQfWjlnELC7pJ0rZNVtHeoO4czwudWzn2bWfZ2fzrQGmMKhJ0-Nl9Y-g-wcLqBjODQoILGyDOXyWTmDKZt9A4R-4vk3kzJT0ffiM21F3hpOZgroSSVSbmn8cKSf7oY6_si9vfTaj1Yhe37Xuab3229ywVI-rzYfdyBjNtJqY7mo1nuc3Hx_9_ek8wavH59B0WokvAjPZnZC5tnoAdX7G0d7ioSZTtFzTedpxzIJ-xkRJeeYTyj-jgM9A_1NK4PNNuw7wKO-G0SUxmBd9ExnzhijHsbtNOKoyqyNKFw1v-bFUektfdgRoh_XlQa_Twag404yRyZEcElNCqb0hM2oFzvu_p6yCYPxv6JxDkux90wN6qQo6vWzZv1yapLSSOBvTC07a1ihWaiNwvmxaAcl-PEqEBYFYk62Pz0zgsI4eW3U4Mmzm4kcKES5p1U6AevEepk5kSfEpk5YRxro6by62Z6StdRoo7F6ajNzhch12lQcERZd1oyr1Aul72sUZx2HqSnNqkeJ5UkyNb5spm4IcpenjZ2XVjiIEcnc2S5OroQZzDx-61InFecmbuTQL-wfJBWMCY6X_Bvs8Z98xz7VIQ1-_uAiaJy2EBYaCu2KV5AikVvH19eoTo98wzqNOhRyQV1EnmUsUlEbPUzS7jPtvZEjvMlC4NfZH5TawdVDa9HszkIwqFd9DHT0lgyNzTsffOOBPm5t2plvkGfVdScM4nENNbalrEIRryzDf868ZuPHFXzCVLWsSKqbySO2zSOqdO6dP_T2qiWeF-LK75opT-fr-X2MF6QlK1flcEzeFt5qZp4AdiCr3Vji2bKebuw8a9xsLlE0SRQZQWKnLNKZBidT5P-Eao5IuWnH3jWCQhhBd_wDdJxCpa3P8Rv_wT0wogYbR0PahNkrDMULhUTR75sv3IAZ0Ak8EYe2HLVnxUbqGWVdCv7ykN9W117yEcyx84RZqy1qBuLlvINGC8rSjZGmPjJER_nZ1VIIZyl2ySb63lW5Jk17jqL-bM32S9-StPBnaMxbJTgVchD7u2u5GLPNNyFQryKBFWSUOBbc-b4qnmjrkoWV58ghiRihofwWMcug3M-CVrM4bZ8R4omGdMCP6vpzM3NJ0YExwQ5VJVdikwQwsum_5O6tCQLFEmnP2arAowG6Py-Wm5hOZLKOmtrTfXAqo4vvVOEew43Z1qyM-mq_K8zwjXRGEKQJDhvpUImtzWTTe0IYBQd7QYZV-FOM1mttaaIhEIKkZv5THia5WT3or9IrLMx9aaIk1skLhuHfPIBDnIAU-9VHLfkkVaea09ZoIfqJM_sF50Z2GOlJQxcPJlB0Xd-OlllBA5Pu739IIBsdVWhfsgiLxOLzHyJJxlBzin5t_Jde1yTfA4ocrO7n1_HsXoXbY08J3TXax_iZ8wHRyqr0fPlmO6ke5ildmn9kBr2fpQhcu5PkA2Gw7--iNGyUI_TUB0fA4WmCVJxQrIq4qdEhCUWaU2TejtiiqPZ0sVa3DUTEVCiyROoRPOVEtfnOgUMu3ENUw0ZJoCqqFRso-zYiMntfw6CM_UIPnfps2J9fK8fK197oKXyR6-3D77be2DRGTH23AnyqUs0N6P5APBq2J3-op5Uv2_qP2jqNDI1eZ7HKi1D_AewwpN4qGAuc6P-TD9MyJ2QJYH56zZfjg3tC5-Lf9UW51SmJ4A9ffdrQHsYEL30a2zaQkUOIXYxxOm_SMf31fuLEAV_EjtcjgPeuHH8eY8fy-tIcevqMH8h2GlVX0FSwEc4jQUcigijuLywVquDL3i1yGu9FjFQMYPdsLRrEoT6l9KQhHDLZInDZgSO9n0Ov_ATL6lQgdmwxyhpW-0qXhvTwKEIW9ghWjVxwShbEksHr_wzQLXBz96z3W3FbzGtuGrWVxdLCbDdrcSjQVJq2om1DL9nTk-LCZKrBxyMVm9IjdQbyhLq9UIbc2bArL4A3bEdNsD0xPP1UWzAXOm5hmZ3MaLDPq-QZ-VX6PbR7-jAujoOmxFXtj9tljaVbqlvpIyYjBsTQgUW4c9zmuBCLt7p3nOe6rRB9oxRCt8ZmNgERdGYBqTkcpFiSFQWfEq0dfTIqiyJD8mHZklf6NA_Jv62UDZfm_rlLm2Bs6P1El-c-ID6bBCLoy16D9g3udgpXhUTLtk2-j_Q90nxK8qJqQKKUQPVC7ly4E1D0p5e9qmHTQ1kSPWGX1_l5dcfl7yiaI1eWHaFmxStX6bT1YZbqMZhTA1SOk5aJVr0Bq6RdkrY0UiDFjxVqoEVIbEgy1LRi0r5-qtiR2PTEJA93VJ0euH4LhOaL7YlcdoNBcCcqld5ujDNrczqvJ2Up6P1wkgsHC8SwrB-3RKN1PvfMQQ0yvbLRJF4hKZgQFSeisb4YaHrh1_nrARWZM_0RLkg_rrR3obo-XeiOXEX4e_8tNheinK2bUEUjN2wJ6UGCedtwqLLM9CG90o4xBl0V5YlDQgvFmpRYpEGgVkShsaZn-j4HkRPITYbspeny_FQIMrg5hELJ9Uin2XCi3bt8dLLoh-GZEbp5Vo-y6NRP28VdcCt6Apqpd6S0B4ODE0PU7pRWf-XS975xX4FuM_7AT3h0VFLSZWXYUWSHw8ACY8JLcP0x3U0BMEK4oPIC-vPbo6lAGGtejIcKhm7jUZgKqb_R6GoG8tADHcbyMahFMh8LhsU0AfAolkK8eOzwfHihl70HgmQo7_K53CSNkspbWA9mDzTkDwEpjUTxko34XPjuVeL_I-r_Pl3_A8gtbqPqlNaTz7yWJkjWcDPnfOFNzRzBKHF4tUOFFfoFcKF-0TbcScdOSiPgKj4Kfp3_oQSjStNd3hyEoyUZT_YUsLgop8FvhPk-bB48USdu8bv6Id2Ke9v_Vi6kbNC3YqdDY6ZReRHkMwy3fsMehEX6d3sucPwlnHXhPw5A-8sWBZR51pGHqrAoOfucxTAXUjwwcmszkRYMdX2Xkw2uSW4hgVP2yFbWBZyhNDa627y056C2qBTSgFoOVE-5ilU02b-38JD7-BpXmg5ISyKLuY1LTa1yvNqQ3ymxYz38Mmi-7zftWy03aYP-hnmXHJIDtHDStTLCMduTVxR8zkFVqouzy8Kt97tbjnMZQly-yH72nRjI-1C8Dj8HHT_LxbzISH9eA0aIiri865AgNCptoa_aIsF5rvyhsa0Y2t6b6OnTp_UMymCVB_T1uX1k91EafVkZ47icSIEBI-SLQaLi2nHeoS_MT-brRNXtFkFaPEuq6zVAt-s7PYRi-1g==', '2022-06-25', 'Accepted', 1, 4),
(4, 'files/basic concepts.txt', 'text/plain', 116, 'wwww', 'basic concepts.txt', 'basic concepts5.txt', 'event', 'F8vCQFtKaEPHhxy56r9P-wafnAEngPsMSQyl3NnnROg=', 'gAAAAABitvhzORIP8783LMFeWiXiwLYFGgklWefUtzy0zz_ueSglc86Cdcup08D0uNwKP50LRS5UOid8HuDIkICcHRRJJANbnh9-0pcakA7YzlI9syEguN8ihIv6T_41n7LXYDMbDSetH59bEhnc7vVcztiY0UmGVrysvFv0z-jKg2BNUOWX5QKP2uM-Ml0l_QuLU9bnHgW4Q9LUdcIgkugpD6bzgy9Sci3RLZCmgbAIhV6L1XkPLeQ=', '2022-06-25', 'Accepted', 7, NULL),
(5, 'files/tech sites.txt', 'text/plain', 477, 'tech-sites', 'tech sites.txt', NULL, 'developer', '0x9RkRO40i_2GGYcMVNM3oqTV8yZZe8QueFd3uKsXdI=', 'gAAAAABitxOojzO75-f8Ak4OD4pJW4pnqjUgZY7DlQCgqMhr_Wb1BwUQfPfqU8qeuc9HA7Vx9wIUHIbmSF673bQo7g8ao-XNuAa9TjdwchzagXPomX-v5bILO1K5UM2EGkdxIvs4F6o6Bqbe7e45q0QlcMv-2qIxak7ykiP5r3Wu2WtxKvX8xpS6e2AbqAHtUhz7GfbM_iWw0AS_KDCE-4aK1C97fBOp3fdpamp2lIafs2LsJcUSWj1n2J5c0iIZVDcFX83UTLyf-_wxGOxEPzvKB1O6a_jhL1rm5TFiKXLRJ23kQm_UAdrxFfXXVE8JBfkcrFEVZkVt2FuLN0-toyyoan478itHTVSgRRjzVH9C2TFM6KB23mIihw78DW8v5e08grsSSR483d117MDDa828HsjOCv2RD6S6udBTs-NOCTNFV6l2ZtCf8jO9KemH9NmTaiNzsZBjeVNf0XkXPLxDL1iPiUajCnUYOqya0JAU_xv38kuRGA3EJYqXqjdz6TR89ZjSPkH8kIT93nJuuHkMT81vcmtuwch747EJnna0nNzUfQU3L52G1a7jolygC7xoAfReICmDEQzjOUVC1e_4RwFzNUliwjXqo9F5wpV1k13g01dxtpKP5hd1H3HH1fctdt5vFSvHP5iJ0meg5uKj3ryKA3F-0ANjpYADkG69qVHCBNNgLZan_-CDnZlawgm3k0Rdwdx4', '2022-06-25', 'pending', 1, NULL),
(6, 'files/basic concepts_nH76kvj.txt', 'text/plain', 116, 'basic\r\n', 'basic concepts.txt', NULL, 'adada', 'Y1FC8M6zcfOJt1UbCySIX0dgHUn5qO1axoXZhuEF_Rw=', 'gAAAAABitxZK5VaJMR4FtEJlwYeHLbYVBnvIYOdbQQPYtuuZ0-GSoRXUP1RIlMo4rI2WESA1iHGtx5A3T0PwJILnJweaRRLcd8v0-iXaF_QHEYiDewtSGtMXMcGyyhnOEZSki7KsCFOVDiIzR5Og9LMG0sDe4Ke6kpo-JmdVZxBNr_wtxKQ-d_I4Z83pr1YYA3tJB_pHBxX0kMsEnJuASfcSKRVcEmARDdgi9p6b9ouTyI_HE5sCfLEtwAQZ1GX8XnPpWFDIZK7_xrZTKXKr4uYysX7F3-kGoRGD-B-XFh7C4zx5EeaIP1ujA8S_NqJwfXXU7ZYfQbqH22mXMcQT8-S08sA9PHXoCoHmVvgqEE40sIZMQfgVksDVFwazFrgFjigHWAYRw7RqOGSmvVhQywFHw_13NGJ0kQ==', '2022-06-25', 'pending', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE IF NOT EXISTS `user_details` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  `mobile` bigint(20) NOT NULL,
  `email` varchar(254) NOT NULL,
  `profile` varchar(100) DEFAULT NULL,
  `pwd` varchar(20) DEFAULT NULL,
  `cpwd` varchar(20) DEFAULT NULL,
  `reg_date` date NOT NULL,
  `otp` longtext,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`user_id`, `name`, `mobile`, `email`, `profile`, `pwd`, `cpwd`, `reg_date`, `otp`, `status`) VALUES
(1, 'tharun', 9876543210, 'saitharun581@gmail.com', 'user/img370_EcUEp7x.jpg', 'tharun', 'tharun', '2022-06-25', '9073', 'verified'),
(2, 'ramesh k', 7981751867, 'krg4585@gmail.com', 'user/download_HLLwsMc.jfif', 'ramesh123', 'ramesh123', '2022-06-25', '9393', 'verified'),
(4, 'sam', 9999999999000, 'fazalsirprojects@gmail.com', 'user/download_tnLJpiT.jfif', 'sam', 'sam', '2022-06-25', '2708', 'verified');

-- --------------------------------------------------------

--
-- Table structure for table `user_download_requests`
--

CREATE TABLE IF NOT EXISTS `user_download_requests` (
  `request_id` int(11) NOT NULL AUTO_INCREMENT,
  `owner_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `doc_id` int(11) DEFAULT NULL,
  `document` varchar(100) NOT NULL,
  `doc_name` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `doc_size` bigint(20) DEFAULT NULL,
  `doc_type` varchar(300) NOT NULL,
  `file_enc_key` longtext,
  `secure_key` varchar(100) DEFAULT NULL,
  `request_status` varchar(50) DEFAULT NULL,
  `download_status` varchar(200) DEFAULT NULL,
  `requested_date` date DEFAULT NULL,
  PRIMARY KEY (`request_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `user_download_requests`
--

INSERT INTO `user_download_requests` (`request_id`, `owner_id`, `user_id`, `doc_id`, `document`, `doc_name`, `description`, `doc_size`, `doc_type`, `file_enc_key`, `secure_key`, `request_status`, `download_status`, `requested_date`) VALUES
(1, 1, 1, 1, 'files/account activated.txt', 'account activated.txt', 'account activated', 1064, 'text/plain', 'F8tmbKsWtGjLOEWkLwsP39Kj3MH7CJVzGxTgD32GMf0=', 'S+NuoO_q1?', 'request_accepted', 'Downloaded', '2022-06-25'),
(2, 1, 2, 1, 'files/account activated.txt', 'account activated.txt', 'account activated', 1064, 'text/plain', 'F8tmbKsWtGjLOEWkLwsP39Kj3MH7CJVzGxTgD32GMf0=', 'w6tVhZ0T^1', 'request_accepted', 'decrypted', '2022-06-25'),
(3, 1, 2, 2, 'files/frontend design.txt', 'frontend design.txt', 'front-end designing...', 193, 'text/plain', '8Htnjv80cbtyM4_A2ogCKYblcHA4ndBMXtdQVwhayws=', 'b78%L(z%%3', 'request_accepted', 'decrypted', '2022-06-25'),
(4, 1, 2, 3, 'files/js validations.txt', 'js validations.txt', 'javascript validations', 5435, 'text/plain', 'UOdOyWqRR1lh-GA9FINdHuaM_V8DUYQkCecO8zIUSos=', 'a+1$31~Okk', 'request_accepted', 'pending', '2022-06-25'),
(5, 7, 4, 4, 'files/basic concepts.txt', 'basic concepts.txt', 'wwww', 116, 'text/plain', 'F8vCQFtKaEPHhxy56r9P-wafnAEngPsMSQyl3NnnROg=', '^8tA~KTuRD', 'request_accepted', 'pending', '2022-06-25');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

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
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `upload_documents`
--
ALTER TABLE `upload_documents`
  ADD CONSTRAINT `upload_documents_owner_id_add59dd9_fk_owner_details_owner_id` FOREIGN KEY (`owner_id`) REFERENCES `owner_details` (`owner_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
