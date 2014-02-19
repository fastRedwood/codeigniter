
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

