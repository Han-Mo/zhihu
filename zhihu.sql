/*
 Navicat Premium Data Transfer

 Source Server         : mac
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : localhost:3306
 Source Schema         : zhihu

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 20/02/2019 16:20:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for answers
-- ----------------------------
DROP TABLE IF EXISTS `answers`;
CREATE TABLE `answers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `question_id` int(10) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `votes_count` int(11) NOT NULL DEFAULT '0',
  `comments_count` int(11) NOT NULL DEFAULT '0',
  `is_hidden` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'F',
  `close_comment` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'F',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `answers_user_id_index` (`user_id`),
  KEY `answers_question_id_index` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of answers
-- ----------------------------
BEGIN;
INSERT INTO `answers` VALUES (1, 1, 4, '<p>这是( ⊙o⊙ )千真万确的</p>', 0, 0, 'F', 'F', '2019-02-12 08:54:39', '2019-02-12 08:54:39');
INSERT INTO `answers` VALUES (2, 1, 4, '<p>这是( ⊙o⊙ )千真万确的吗</p>', 0, 0, 'F', 'F', '2019-02-12 08:57:34', '2019-02-12 08:57:34');
INSERT INTO `answers` VALUES (3, 1, 4, '<p>sadsafdfgtfhssrtdtdr<br/></p>', 0, 0, 'F', 'F', '2019-02-12 08:59:30', '2019-02-12 08:59:30');
INSERT INTO `answers` VALUES (4, 2, 1, '<p>hahah</p>', 1, 0, 'F', 'F', '2019-02-18 02:06:46', '2019-02-19 02:23:05');
INSERT INTO `answers` VALUES (5, 2, 1, '<p>hahah</p>', 0, 0, 'F', 'F', '2019-02-18 09:33:17', '2019-02-18 09:40:14');
COMMIT;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentable_id` int(10) unsigned NOT NULL,
  `commentable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `level` smallint(6) NOT NULL DEFAULT '1',
  `is_hidden` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'F',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of comments
-- ----------------------------
BEGIN;
INSERT INTO `comments` VALUES (1, 2, 'questions', 1, 'App\\Question', NULL, 1, 'F', '2019-02-18 08:00:48', '2019-02-18 08:00:48');
INSERT INTO `comments` VALUES (2, 2, 'answer', 4, 'App\\Answer', NULL, 1, 'F', '2019-02-18 08:01:00', '2019-02-18 08:01:00');
INSERT INTO `comments` VALUES (3, 2, 'test', 1, 'App\\Question', NULL, 1, 'F', '2019-02-18 08:45:27', '2019-02-18 08:45:27');
INSERT INTO `comments` VALUES (4, 2, '??', 1, 'App\\Question', NULL, 1, 'F', '2019-02-18 09:20:01', '2019-02-18 09:20:01');
INSERT INTO `comments` VALUES (5, 2, 'test', 4, 'App\\Answer', NULL, 1, 'F', '2019-02-18 09:21:10', '2019-02-18 09:21:10');
COMMIT;

-- ----------------------------
-- Table structure for followers
-- ----------------------------
DROP TABLE IF EXISTS `followers`;
CREATE TABLE `followers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `follower_id` int(10) unsigned NOT NULL,
  `followed_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `followers_follower_id_index` (`follower_id`),
  KEY `followers_followed_id_index` (`followed_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of followers
-- ----------------------------
BEGIN;
INSERT INTO `followers` VALUES (6, 2, 1, '2019-02-15 08:56:09', '2019-02-15 08:56:09');
COMMIT;

-- ----------------------------
-- Table structure for messages
-- ----------------------------
DROP TABLE IF EXISTS `messages`;
CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_user_id` int(10) unsigned NOT NULL,
  `to_user_id` int(10) unsigned NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_read` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'F',
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `dialog_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of messages
-- ----------------------------
BEGIN;
INSERT INTO `messages` VALUES (1, 2, 1, 'sb', 'T', '2019-02-19 08:39:14', '2019-02-18 06:31:54', '2019-02-19 08:39:14', 21);
INSERT INTO `messages` VALUES (2, 2, 1, 'wo cuo le', 'T', '2019-02-19 08:39:14', '2019-02-18 06:33:59', '2019-02-19 08:39:14', 21);
INSERT INTO `messages` VALUES (3, 2, 1, '???', 'T', '2019-02-19 08:39:14', '2019-02-19 02:42:44', '2019-02-19 08:39:14', 21);
INSERT INTO `messages` VALUES (4, 2, 3, '123???', 'F', NULL, '2019-02-19 02:42:44', '2019-02-19 02:42:44', 23);
INSERT INTO `messages` VALUES (5, 1, 2, '??', 'T', '2019-02-19 08:39:14', '2019-02-19 07:46:14', '2019-02-19 08:39:14', 21);
INSERT INTO `messages` VALUES (6, 3, 1, 'sb ??', 'T', '2019-02-19 09:35:03', '2019-02-19 07:46:14', '2019-02-19 09:35:03', 31);
INSERT INTO `messages` VALUES (7, 2, 1, 'hahahah', 'T', '2019-02-20 03:16:57', '2019-02-20 03:04:18', '2019-02-20 03:16:57', 21);
INSERT INTO `messages` VALUES (8, 2, 1, 'hi', 'T', '2019-02-20 03:40:06', '2019-02-20 03:29:44', '2019-02-20 03:40:06', 21);
COMMIT;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_01_17_035800_create_user_tabl', 1);
INSERT INTO `migrations` VALUES (4, '2019_01_24_081108_create_questions_table', 2);
INSERT INTO `migrations` VALUES (5, '2019_01_28_074831_create_topics_table', 3);
INSERT INTO `migrations` VALUES (6, '2019_01_28_080749_create_questions_topics_table', 3);
INSERT INTO `migrations` VALUES (7, '2019_02_12_075957_create_answers_table', 4);
INSERT INTO `migrations` VALUES (8, '2019_02_14_024305_create_user_question_table', 5);
INSERT INTO `migrations` VALUES (9, '2019_02_15_012014_add_api_token_to_users', 6);
INSERT INTO `migrations` VALUES (10, '2019_02_15_022459_create_followers_table', 7);
INSERT INTO `migrations` VALUES (11, '2019_02_15_071141_create_notifications_table', 8);
INSERT INTO `migrations` VALUES (12, '2019_02_18_013820_create_votes_table', 9);
INSERT INTO `migrations` VALUES (13, '2019_02_18_023052_create_messages_table', 10);
INSERT INTO `migrations` VALUES (14, '2019_02_18_063854_create_comments_table', 11);
INSERT INTO `migrations` VALUES (15, '2019_02_19_055524_add_dialog_id_to_messages', 12);
COMMIT;

-- ----------------------------
-- Table structure for notifications
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of notifications
-- ----------------------------
BEGIN;
INSERT INTO `notifications` VALUES ('159fa97e-b670-4776-8b0b-a5b3b1fa4ca2', 'App\\Notifications\\NewMessageNotification', 'App\\User', 1, '{\"name\":\"han\",\"dialog\":\"21\"}', '2019-02-20 03:43:23', '2019-02-20 03:29:44', '2019-02-20 03:43:23');
INSERT INTO `notifications` VALUES ('19acff75-b7b9-4302-8723-0b7d9094c3be', 'App\\Notifications\\NewUserFollowNotification', 'App\\User', 1, '{\"name\":\"han\"}', NULL, '2019-02-15 08:56:09', '2019-02-15 08:56:09');
INSERT INTO `notifications` VALUES ('6f182986-76fc-4272-baf9-47a26fa2f7ad', 'App\\Notifications\\NewUserFollowNotification', 'App\\User', 1, '{\"name\":\"han\"}', NULL, '2019-02-15 07:18:56', '2019-02-15 07:18:56');
INSERT INTO `notifications` VALUES ('84e8c918-6974-45a6-8899-05595dd324d7', 'App\\Notifications\\NewMessageNotification', 'App\\User', 1, '{\"name\":\"han\",\"dialog\":\"21\"}', NULL, '2019-02-20 03:04:18', '2019-02-20 03:04:18');
INSERT INTO `notifications` VALUES ('b9f802a0-b568-48c1-84b0-70ccb9b820a5', 'App\\Notifications\\NewUserFollowNotification', 'App\\User', 1, '{\"name\":\"han\"}', NULL, '2019-02-15 07:18:06', '2019-02-15 07:18:06');
INSERT INTO `notifications` VALUES ('e096f4e0-dade-4759-a710-c6512d20cf7c', 'App\\Notifications\\NewUserFollowNotification', 'App\\User', 1, '{\"name\":\"han\"}', NULL, '2019-02-15 08:54:15', '2019-02-15 08:54:15');
INSERT INTO `notifications` VALUES ('e41ae7c2-9cec-45a9-8c33-cbd53f7694a3', 'App\\Notifications\\NewUserFollowNotification', 'App\\User', 1, '{\"name\":\"han\"}', NULL, '2019-02-15 08:56:04', '2019-02-15 08:56:04');
INSERT INTO `notifications` VALUES ('ede43707-728f-47c8-acdf-9668dbcfc9bc', 'App\\Notifications\\NewUserFollowNotification', 'App\\User', 1, '{\"name\":\"han\"}', NULL, '2019-02-15 07:18:00', '2019-02-15 07:18:00');
COMMIT;

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for question_topic
-- ----------------------------
DROP TABLE IF EXISTS `question_topic`;
CREATE TABLE `question_topic` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int(10) unsigned NOT NULL,
  `topic_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `question_topic_question_id_index` (`question_id`),
  KEY `question_topic_topic_id_index` (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of question_topic
-- ----------------------------
BEGIN;
INSERT INTO `question_topic` VALUES (1, 6, 1, '2019-02-01 07:01:53', '2019-02-01 07:01:53');
INSERT INTO `question_topic` VALUES (2, 6, 14, '2019-02-01 07:01:53', '2019-02-01 07:01:53');
INSERT INTO `question_topic` VALUES (3, 6, 6, '2019-02-01 08:08:55', '2019-02-01 08:08:55');
COMMIT;

-- ----------------------------
-- Table structure for questions
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `comments_count` int(11) NOT NULL DEFAULT '0',
  `followers_count` int(11) NOT NULL DEFAULT '1',
  `answers_count` int(11) NOT NULL DEFAULT '0',
  `close_comment` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'F',
  `is_hidden` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'F',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of questions
-- ----------------------------
BEGIN;
INSERT INTO `questions` VALUES (1, 'asdasd', '<p>asdasddgcvcx</p>', 1, 0, 2, 2, 'F', 'F', '2019-01-25 02:08:25', '2019-02-19 02:23:26');
INSERT INTO `questions` VALUES (2, 'asdasd', '<p>asdasddgcvcx</p>', 1, 0, 1, 0, 'F', 'F', '2019-01-25 02:10:44', '2019-01-25 02:10:44');
INSERT INTO `questions` VALUES (3, 'test123', '<p>adsfdasfadsfasdcdsafdsafdsf</p>', 1, 0, 2, 0, 'F', 'F', '2019-01-28 06:02:17', '2019-02-15 02:17:47');
COMMIT;

-- ----------------------------
-- Table structure for topics
-- ----------------------------
DROP TABLE IF EXISTS `topics`;
CREATE TABLE `topics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `questions_count` int(11) NOT NULL DEFAULT '0',
  `followers_count` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of topics
-- ----------------------------
BEGIN;
INSERT INTO `topics` VALUES (1, 'Yii2', 'Animi quae vero ut facilis reiciendis eos blanditiis. Velit eaque aliquid omnis facilis. Veritatis accusantium magnam modi qui. Velit a eum ipsam sit. Et officiis repellendus veniam.', 1, 0, '2019-01-29 02:21:11', '2019-01-29 02:21:11');
INSERT INTO `topics` VALUES (2, 'java', 'Dolorum enim omnis aut. Enim iste dolor expedita numquam iure illum non vitae. Dolorem omnis cumque ipsam molestiae velit reprehenderit. Qui similique qui dignissimos sit nobis dolorum aperiam.', 1, 0, '2019-01-29 02:21:11', '2019-01-29 02:21:11');
INSERT INTO `topics` VALUES (3, 'PHP', 'Debitis officiis modi mollitia nihil et sunt eligendi. Quo in et ut aliquid voluptatem assumenda. Ipsum necessitatibus labore libero qui nihil. Ipsum itaque rerum quisquam qui qui labore deleniti voluptas. Quia aut eligendi qui.', 1, 0, '2019-01-29 02:21:11', '2019-01-29 02:21:11');
INSERT INTO `topics` VALUES (4, 'Laravel', 'A dicta aut quasi incidunt. Nemo iusto ullam in animi veritatis. Aut distinctio sit excepturi dolorum rem.', 1, 0, '2019-01-29 02:21:11', '2019-01-29 02:21:11');
INSERT INTO `topics` VALUES (5, 'google', 'Nobis sed accusantium et voluptate soluta. Ipsa voluptatem necessitatibus itaque eveniet. Omnis asperiores perferendis reiciendis est sit voluptatum. Natus vero impedit nihil et quae.', 1, 0, '2019-01-29 02:21:11', '2019-01-29 02:21:11');
INSERT INTO `topics` VALUES (6, 'vuejs', 'Id eos voluptatem et modi labore sed est. Reiciendis deleniti ut rerum nesciunt. Nihil repellendus nostrum debitis at voluptas. Amet rerum alias vel sed.', 1, 0, '2019-01-29 02:21:11', '2019-01-29 02:21:11');
INSERT INTO `topics` VALUES (7, 'thinkphp', 'Incidunt voluptas molestiae sit rem quia est. Dolor sed nesciunt cupiditate ut cumque eos. Maiores rerum quasi quia et vitae est aut.', 1, 0, '2019-01-29 02:21:11', '2019-01-29 02:21:11');
INSERT INTO `topics` VALUES (8, 'js', 'Quia ut maxime ab aut illum laborum nemo. Dolor itaque aut doloribus deserunt inventore consectetur. Deserunt et eius quis id consequatur.', 1, 0, '2019-01-29 02:21:11', '2019-01-29 02:21:11');
INSERT INTO `topics` VALUES (9, 'aws', 'Provident tempora numquam dicta aperiam quis qui. Doloremque tenetur consequatur molestiae eos veniam. Sit quas asperiores id ipsam aut illo.', 1, 0, '2019-01-29 02:21:11', '2019-01-29 02:21:11');
INSERT INTO `topics` VALUES (10, 'apple', 'Magni fugit quia molestias. Tempore quo tenetur quia magnam perspiciatis eum. Veniam facere qui dolores officia minima nesciunt.', 1, 0, '2019-01-29 02:21:11', '2019-01-29 02:21:11');
INSERT INTO `topics` VALUES (11, 'css', 'Corrupti ad doloremque beatae autem. Sit nisi minima explicabo cumque non in. Rem excepturi unde dolores. Optio ut reprehenderit reiciendis aliquam et placeat facere.', 1, 0, '2019-01-29 02:21:11', '2019-01-29 02:21:11');
INSERT INTO `topics` VALUES (12, 'country', NULL, 1, 0, '2019-02-01 06:56:49', '2019-02-01 06:56:49');
INSERT INTO `topics` VALUES (13, 'country', NULL, 1, 0, '2019-02-01 07:00:13', '2019-02-01 07:00:13');
INSERT INTO `topics` VALUES (14, 'country', NULL, 1, 0, '2019-02-01 07:01:53', '2019-02-01 07:01:53');
COMMIT;

-- ----------------------------
-- Table structure for user_question
-- ----------------------------
DROP TABLE IF EXISTS `user_question`;
CREATE TABLE `user_question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `question_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_question_user_id_index` (`user_id`),
  KEY `user_question_question_id_index` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_question
-- ----------------------------
BEGIN;
INSERT INTO `user_question` VALUES (29, 1, 4, '2019-02-15 01:51:51', '2019-02-15 01:51:51');
INSERT INTO `user_question` VALUES (30, 1, 5, '2019-02-15 02:10:02', '2019-02-15 02:10:02');
INSERT INTO `user_question` VALUES (40, 1, 3, '2019-02-15 02:17:47', '2019-02-15 02:17:47');
INSERT INTO `user_question` VALUES (42, 2, 1, '2019-02-19 02:23:26', '2019-02-19 02:23:26');
COMMIT;

-- ----------------------------
-- Table structure for user_tabl
-- ----------------------------
DROP TABLE IF EXISTS `user_tabl`;
CREATE TABLE `user_tabl` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `confirmation_token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` smallint(6) NOT NULL DEFAULT '0',
  `questions_count` int(11) NOT NULL DEFAULT '0',
  `answers_count` int(11) NOT NULL DEFAULT '0',
  `comments_count` int(11) NOT NULL DEFAULT '0',
  `favorites_count` int(11) NOT NULL DEFAULT '0',
  `likes_count` int(11) NOT NULL DEFAULT '0',
  `followers_count` int(11) NOT NULL DEFAULT '0',
  `followings_count` int(11) NOT NULL DEFAULT '0',
  `settings` json DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `api_token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_name_unique` (`name`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_api_token_unique` (`api_token`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES (1, 'mxhan', 'mxhan2250@gmail.com', '$2y$10$obGX67uzBoMKOTp06VDByubYqIMtCRXPRX00W2BXWRXtd02gXDhtG', 'avatars/2723af598220bac00e70dbce95283335', 'XdHyxkCxB5Qd3IzlCGG6bpIGSImmdNB0OEDeIq10', 1, 0, 0, 0, 0, 0, 0, 0, '{\"bio\": \"asdasd\", \"city\": \"cs\"}', 'ZUMQ510A2GTQY9NSXtMXSPhsLQccW7fHz3OZo6L9J733MElsHxXt1U2YQLgE', '2019-01-18 06:23:04', '2019-02-20 08:17:31', 'ebntzCKh0XVoSv1sFiOyzAULqruezrWxSlrXogHrvythEWJdRuHETiXDJOCD');
INSERT INTO `users` VALUES (2, 'han', '56252648@163.com', '$2y$10$fyS.8djO8H1QUHPuWE9FBOT3icpWxuEcuoJ7i4T4A22X0xhrxJoIG', '/images/avatars/default.png', 'XdHyxkCxB5Qd3IzlCGG6bpIGSImmdNB0OEDeIq10', 1, 0, 0, 0, 0, 0, 0, 0, '{}', 'WhAoEP7ciSrVUxDqBUXWYE180XE5Jj1OgyLQgPWR92Dx5lsX1pXj9xW9RoSa', '2019-01-18 06:23:04', '2019-01-24 03:04:11', 'ebntzCKh0XVoSv1sFiOyzAULqruezrWxSlrXogHrvythEWJdRuHETiXDJOxd');
INSERT INTO `users` VALUES (3, 'han2', '56252648@test.com', '$2y$10$fyS.8djO8H1QUHPuWE9FBOT3icpWxuEcuoJ7i4T4A22X0xhrxJoIG', '/images/avatars/default.png', 'XdHyxkCxB5Qd3IzlCGG6bpIGSImmdNB0OEDeIq10', 1, 0, 0, 0, 0, 0, 0, 0, '{}', '2YAPXTHuCbNF1FSgsX4qyyYNQ9VoQny0InFm2vs6zgi2hGQAGwRTMzLuYVz4', '2019-01-18 06:23:04', '2019-01-24 03:04:11', 'ebntzCKh0XVoSv1sFiOyzAULqruezrWxSlrXogHrvythEWJdRuHETiXDJOxc');
COMMIT;

-- ----------------------------
-- Table structure for votes
-- ----------------------------
DROP TABLE IF EXISTS `votes`;
CREATE TABLE `votes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `answer_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `votes_user_id_index` (`user_id`),
  KEY `votes_answer_id_index` (`answer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of votes
-- ----------------------------
BEGIN;
INSERT INTO `votes` VALUES (3, 2, 4, '2019-02-19 02:23:05', '2019-02-19 02:23:05');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
