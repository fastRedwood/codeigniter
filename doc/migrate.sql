
--
-- 数据库: `ci_dev`
--

-- --------------------------------------------------------

--
-- 表的结构 `user`
--


CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `salt` varchar(32) DEFAULT NULL,
  `createdTime` int(11) DEFAULT NULL,
  `emailVerified` tinyint(4) NOT NULL DEFAULT '0',
  `locked` tinyint(3) unsigned DEFAULT '0',
  `group_id` int(11) DEFAULT '2' COMMENT '1：admin，2：user',
  `loginTime` int(11) NOT NULL DEFAULT '0',
  `createdIp` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;
-- admin 用户
INSERT INTO `user` (`id`, `username`, `email`, `password`, `salt`, `createdTime`, `emailVerified`, `locked`, `group_id`, `loginTime`, `createdIp`) VALUES
(1, NULL, 'admin@admin.com', 'e93d0297c3213b1ebf0b33b1cdfd444f', '7yedgjf2tx8g8804gk84googsog088k', 1392781980, 0, 0, 1, 0, '127.0.0.1');



CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `last_activity_idx` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
