SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for buyer
-- ----------------------------
DROP TABLE IF EXISTS `buyer`;
CREATE TABLE `buyer`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'pk_id',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '买家名称',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '邮箱',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码盐值',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除(1为已删除 默认为0)',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 208 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of buyer
-- ----------------------------
INSERT INTO `buyer` VALUES (1, 'wzf', '859986320@qq.com', '57c3cb70f14ca167abc6dc3bde5d1cd8', 'hXFkAGtHgP', 0, '2022-12-13 02:32:22', '2022-12-19 04:36:24');
INSERT INTO `buyer` VALUES (2, '默认用户', '974500760@qq.com', '8273f95983e4e5a0b94d63898d992117', 'gXj9hfiwtj', 0, '2022-12-19 04:38:58', '2022-12-19 04:38:58');
INSERT INTO `buyer` VALUES (3, '默认用户', '1351279889@qq.com', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 17:19:53', '2022-12-29 17:19:53');
INSERT INTO `buyer` VALUES (107, '秒杀测试账号1', '123456@qq.com1', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (108, '秒杀测试账号2', '123456@qq.com2', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (109, '秒杀测试账号3', '123456@qq.com3', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (110, '秒杀测试账号4', '123456@qq.com4', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (111, '秒杀测试账号5', '123456@qq.com5', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (112, '秒杀测试账号6', '123456@qq.com6', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (113, '秒杀测试账号7', '123456@qq.com7', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (114, '秒杀测试账号8', '123456@qq.com8', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (115, '秒杀测试账号9', '123456@qq.com9', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (116, '秒杀测试账号10', '123456@qq.com10', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (117, '秒杀测试账号11', '123456@qq.com11', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (118, '秒杀测试账号12', '123456@qq.com12', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (119, '秒杀测试账号13', '123456@qq.com13', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (120, '秒杀测试账号14', '123456@qq.com14', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (121, '秒杀测试账号15', '123456@qq.com15', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (122, '秒杀测试账号16', '123456@qq.com16', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (123, '秒杀测试账号17', '123456@qq.com17', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (124, '秒杀测试账号18', '123456@qq.com18', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (125, '秒杀测试账号19', '123456@qq.com19', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (126, '秒杀测试账号20', '123456@qq.com20', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (127, '秒杀测试账号21', '123456@qq.com21', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (128, '秒杀测试账号22', '123456@qq.com22', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (129, '秒杀测试账号23', '123456@qq.com23', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (130, '秒杀测试账号24', '123456@qq.com24', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (131, '秒杀测试账号25', '123456@qq.com25', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (132, '秒杀测试账号26', '123456@qq.com26', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (133, '秒杀测试账号27', '123456@qq.com27', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (134, '秒杀测试账号28', '123456@qq.com28', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (135, '秒杀测试账号29', '123456@qq.com29', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (136, '秒杀测试账号30', '123456@qq.com30', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (137, '秒杀测试账号31', '123456@qq.com31', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (138, '秒杀测试账号32', '123456@qq.com32', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (139, '秒杀测试账号33', '123456@qq.com33', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (140, '秒杀测试账号34', '123456@qq.com34', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (141, '秒杀测试账号35', '123456@qq.com35', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (142, '秒杀测试账号36', '123456@qq.com36', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (143, '秒杀测试账号37', '123456@qq.com37', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (144, '秒杀测试账号38', '123456@qq.com38', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (145, '秒杀测试账号39', '123456@qq.com39', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (146, '秒杀测试账号40', '123456@qq.com40', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (147, '秒杀测试账号41', '123456@qq.com41', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (148, '秒杀测试账号42', '123456@qq.com42', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (149, '秒杀测试账号43', '123456@qq.com43', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (150, '秒杀测试账号44', '123456@qq.com44', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (151, '秒杀测试账号45', '123456@qq.com45', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (152, '秒杀测试账号46', '123456@qq.com46', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (153, '秒杀测试账号47', '123456@qq.com47', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (154, '秒杀测试账号48', '123456@qq.com48', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (155, '秒杀测试账号49', '123456@qq.com49', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (156, '秒杀测试账号50', '123456@qq.com50', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (157, '秒杀测试账号51', '123456@qq.com51', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (158, '秒杀测试账号52', '123456@qq.com52', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (159, '秒杀测试账号53', '123456@qq.com53', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (160, '秒杀测试账号54', '123456@qq.com54', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (161, '秒杀测试账号55', '123456@qq.com55', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (162, '秒杀测试账号56', '123456@qq.com56', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (163, '秒杀测试账号57', '123456@qq.com57', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (164, '秒杀测试账号58', '123456@qq.com58', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (165, '秒杀测试账号59', '123456@qq.com59', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (166, '秒杀测试账号60', '123456@qq.com60', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (167, '秒杀测试账号61', '123456@qq.com61', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (168, '秒杀测试账号62', '123456@qq.com62', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (169, '秒杀测试账号63', '123456@qq.com63', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (170, '秒杀测试账号64', '123456@qq.com64', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (171, '秒杀测试账号65', '123456@qq.com65', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (172, '秒杀测试账号66', '123456@qq.com66', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (173, '秒杀测试账号67', '123456@qq.com67', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (174, '秒杀测试账号68', '123456@qq.com68', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (175, '秒杀测试账号69', '123456@qq.com69', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (176, '秒杀测试账号70', '123456@qq.com70', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (177, '秒杀测试账号71', '123456@qq.com71', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (178, '秒杀测试账号72', '123456@qq.com72', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (179, '秒杀测试账号73', '123456@qq.com73', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (180, '秒杀测试账号74', '123456@qq.com74', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (181, '秒杀测试账号75', '123456@qq.com75', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (182, '秒杀测试账号76', '123456@qq.com76', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (183, '秒杀测试账号77', '123456@qq.com77', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (184, '秒杀测试账号78', '123456@qq.com78', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (185, '秒杀测试账号79', '123456@qq.com79', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (186, '秒杀测试账号80', '123456@qq.com80', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:03', '2022-12-29 19:50:03');
INSERT INTO `buyer` VALUES (187, '秒杀测试账号81', '123456@qq.com81', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:04', '2022-12-29 19:50:04');
INSERT INTO `buyer` VALUES (188, '秒杀测试账号82', '123456@qq.com82', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:04', '2022-12-29 19:50:04');
INSERT INTO `buyer` VALUES (189, '秒杀测试账号83', '123456@qq.com83', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:04', '2022-12-29 19:50:04');
INSERT INTO `buyer` VALUES (190, '秒杀测试账号84', '123456@qq.com84', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:04', '2022-12-29 19:50:04');
INSERT INTO `buyer` VALUES (191, '秒杀测试账号85', '123456@qq.com85', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:04', '2022-12-29 19:50:04');
INSERT INTO `buyer` VALUES (192, '秒杀测试账号86', '123456@qq.com86', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:04', '2022-12-29 19:50:04');
INSERT INTO `buyer` VALUES (193, '秒杀测试账号87', '123456@qq.com87', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:04', '2022-12-29 19:50:04');
INSERT INTO `buyer` VALUES (194, '秒杀测试账号88', '123456@qq.com88', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:04', '2022-12-29 19:50:04');
INSERT INTO `buyer` VALUES (195, '秒杀测试账号89', '123456@qq.com89', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:04', '2022-12-29 19:50:04');
INSERT INTO `buyer` VALUES (196, '秒杀测试账号90', '123456@qq.com90', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:04', '2022-12-29 19:50:04');
INSERT INTO `buyer` VALUES (197, '秒杀测试账号91', '123456@qq.com91', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:04', '2022-12-29 19:50:04');
INSERT INTO `buyer` VALUES (198, '秒杀测试账号92', '123456@qq.com92', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:04', '2022-12-29 19:50:04');
INSERT INTO `buyer` VALUES (199, '秒杀测试账号93', '123456@qq.com93', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:04', '2022-12-29 19:50:04');
INSERT INTO `buyer` VALUES (200, '秒杀测试账号94', '123456@qq.com94', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:04', '2022-12-29 19:50:04');
INSERT INTO `buyer` VALUES (201, '秒杀测试账号95', '123456@qq.com95', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:04', '2022-12-29 19:50:04');
INSERT INTO `buyer` VALUES (202, '秒杀测试账号96', '123456@qq.com96', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:04', '2022-12-29 19:50:04');
INSERT INTO `buyer` VALUES (203, '秒杀测试账号97', '123456@qq.com97', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:04', '2022-12-29 19:50:04');
INSERT INTO `buyer` VALUES (204, '秒杀测试账号98', '123456@qq.com98', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:04', '2022-12-29 19:50:04');
INSERT INTO `buyer` VALUES (205, '秒杀测试账号99', '123456@qq.com99', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:04', '2022-12-29 19:50:04');
INSERT INTO `buyer` VALUES (206, '秒杀测试账号100', '123456@qq.com100', 'c4ea8871aa0b8766c459e04dce2802f5', 'KWpm6dD98x', 0, '2022-12-29 19:50:04', '2022-12-29 19:50:04');
INSERT INTO `buyer` VALUES (207, '默认用户', '18719460946@163.com', '27e06dd392b4d15b5940ff7f77e3314f', '7ETCXWA0X3', 0, '2022-12-29 20:53:43', '2022-12-29 20:53:43');

-- ----------------------------
-- Table structure for buyer_notice
-- ----------------------------
DROP TABLE IF EXISTS `buyer_notice`;
CREATE TABLE `buyer_notice`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'pk_id',
  `buyer_id` bigint NOT NULL COMMENT '用户id',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '通知',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除(1为已删除 默认为0)',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 131 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of buyer_notice
-- ----------------------------
INSERT INTO `buyer_notice` VALUES (1, 2, '您购买的商品[南瓜]部分售罄，为您抢购到50件', 0, '2022-12-28 20:58:06', '2022-12-28 20:58:06');
INSERT INTO `buyer_notice` VALUES (2, 1, '您的订单[4]已发货，请注意查收', 0, '2022-12-29 19:29:16', '2022-12-29 19:29:16');
INSERT INTO `buyer_notice` VALUES (3, 1, '您的订单[6]已发货，请注意查收', 0, '2022-12-29 19:29:28', '2022-12-29 19:29:28');
INSERT INTO `buyer_notice` VALUES (12, 143, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02');
INSERT INTO `buyer_notice` VALUES (13, 154, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-29 20:00:04', '2022-12-29 20:00:04');
INSERT INTO `buyer_notice` VALUES (14, 137, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-29 20:00:06', '2022-12-29 20:00:06');
INSERT INTO `buyer_notice` VALUES (15, 186, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-29 20:00:08', '2022-12-29 20:00:08');
INSERT INTO `buyer_notice` VALUES (16, 160, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-29 20:00:10', '2022-12-29 20:00:10');
INSERT INTO `buyer_notice` VALUES (17, 162, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-29 20:00:12', '2022-12-29 20:00:12');
INSERT INTO `buyer_notice` VALUES (18, 126, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-29 20:00:14', '2022-12-29 20:00:14');
INSERT INTO `buyer_notice` VALUES (19, 122, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-29 20:00:16', '2022-12-29 20:00:16');
INSERT INTO `buyer_notice` VALUES (20, 164, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-29 20:00:18', '2022-12-29 20:00:18');
INSERT INTO `buyer_notice` VALUES (21, 196, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-29 20:00:20', '2022-12-29 20:00:20');
INSERT INTO `buyer_notice` VALUES (22, 157, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-29 20:00:22', '2022-12-29 20:00:22');
INSERT INTO `buyer_notice` VALUES (23, 200, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-29 20:00:24', '2022-12-29 20:00:24');
INSERT INTO `buyer_notice` VALUES (24, 189, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-29 20:00:26', '2022-12-29 20:00:26');
INSERT INTO `buyer_notice` VALUES (25, 176, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-29 20:00:28', '2022-12-29 20:00:28');
INSERT INTO `buyer_notice` VALUES (26, 140, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-29 20:00:30', '2022-12-29 20:00:30');
INSERT INTO `buyer_notice` VALUES (27, 192, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-29 20:00:32', '2022-12-29 20:00:32');
INSERT INTO `buyer_notice` VALUES (28, 197, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-29 20:00:34', '2022-12-29 20:00:34');
INSERT INTO `buyer_notice` VALUES (29, 110, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-29 20:00:36', '2022-12-29 20:00:36');
INSERT INTO `buyer_notice` VALUES (30, 165, '您购买的商品[秒杀测试商品]部分售罄，为您抢购到6件', 0, '2022-12-29 20:00:38', '2022-12-29 20:00:38');
INSERT INTO `buyer_notice` VALUES (31, 163, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-29 20:00:40', '2022-12-29 20:00:40');
INSERT INTO `buyer_notice` VALUES (32, 112, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-29 20:00:42', '2022-12-29 20:00:42');
INSERT INTO `buyer_notice` VALUES (33, 205, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-29 20:00:44', '2022-12-29 20:00:44');
INSERT INTO `buyer_notice` VALUES (34, 128, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-29 20:00:46', '2022-12-29 20:00:46');
INSERT INTO `buyer_notice` VALUES (35, 187, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-29 20:00:48', '2022-12-29 20:00:48');
INSERT INTO `buyer_notice` VALUES (36, 188, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-29 20:00:50', '2022-12-29 20:00:50');
INSERT INTO `buyer_notice` VALUES (37, 156, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-29 20:00:52', '2022-12-29 20:00:52');
INSERT INTO `buyer_notice` VALUES (38, 107, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-29 20:00:54', '2022-12-29 20:00:54');
INSERT INTO `buyer_notice` VALUES (39, 198, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-29 20:00:56', '2022-12-29 20:00:56');
INSERT INTO `buyer_notice` VALUES (40, 186, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40');
INSERT INTO `buyer_notice` VALUES (41, 173, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:29:42', '2022-12-30 01:29:42');
INSERT INTO `buyer_notice` VALUES (42, 183, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:29:44', '2022-12-30 01:29:44');
INSERT INTO `buyer_notice` VALUES (43, 204, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:29:46', '2022-12-30 01:29:46');
INSERT INTO `buyer_notice` VALUES (44, 154, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:29:48', '2022-12-30 01:29:48');
INSERT INTO `buyer_notice` VALUES (45, 163, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:29:50', '2022-12-30 01:29:50');
INSERT INTO `buyer_notice` VALUES (46, 120, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:29:52', '2022-12-30 01:29:52');
INSERT INTO `buyer_notice` VALUES (47, 128, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:29:54', '2022-12-30 01:29:54');
INSERT INTO `buyer_notice` VALUES (48, 147, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:29:56', '2022-12-30 01:29:56');
INSERT INTO `buyer_notice` VALUES (49, 205, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:29:58', '2022-12-30 01:29:58');
INSERT INTO `buyer_notice` VALUES (50, 202, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:30:00', '2022-12-30 01:30:00');
INSERT INTO `buyer_notice` VALUES (51, 179, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:30:02', '2022-12-30 01:30:02');
INSERT INTO `buyer_notice` VALUES (52, 192, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:30:04', '2022-12-30 01:30:04');
INSERT INTO `buyer_notice` VALUES (53, 195, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:30:06', '2022-12-30 01:30:06');
INSERT INTO `buyer_notice` VALUES (54, 122, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:30:08', '2022-12-30 01:30:08');
INSERT INTO `buyer_notice` VALUES (55, 169, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:30:10', '2022-12-30 01:30:10');
INSERT INTO `buyer_notice` VALUES (56, 187, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:30:12', '2022-12-30 01:30:12');
INSERT INTO `buyer_notice` VALUES (57, 176, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:30:14', '2022-12-30 01:30:14');
INSERT INTO `buyer_notice` VALUES (58, 113, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:30:16', '2022-12-30 01:30:16');
INSERT INTO `buyer_notice` VALUES (59, 164, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:30:18', '2022-12-30 01:30:18');
INSERT INTO `buyer_notice` VALUES (60, 201, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:30:20', '2022-12-30 01:30:20');
INSERT INTO `buyer_notice` VALUES (61, 146, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:30:22', '2022-12-30 01:30:22');
INSERT INTO `buyer_notice` VALUES (62, 196, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:30:24', '2022-12-30 01:30:24');
INSERT INTO `buyer_notice` VALUES (63, 174, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:30:26', '2022-12-30 01:30:26');
INSERT INTO `buyer_notice` VALUES (64, 178, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:30:28', '2022-12-30 01:30:28');
INSERT INTO `buyer_notice` VALUES (65, 206, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:30:30', '2022-12-30 01:30:30');
INSERT INTO `buyer_notice` VALUES (66, 161, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:30:32', '2022-12-30 01:30:32');
INSERT INTO `buyer_notice` VALUES (67, 168, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:30:34', '2022-12-30 01:30:34');
INSERT INTO `buyer_notice` VALUES (68, 199, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:30:36', '2022-12-30 01:30:36');
INSERT INTO `buyer_notice` VALUES (69, 165, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:30:38', '2022-12-30 01:30:38');
INSERT INTO `buyer_notice` VALUES (70, 118, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:30:40', '2022-12-30 01:30:40');
INSERT INTO `buyer_notice` VALUES (71, 124, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:30:42', '2022-12-30 01:30:42');
INSERT INTO `buyer_notice` VALUES (72, 171, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:30:44', '2022-12-30 01:30:44');
INSERT INTO `buyer_notice` VALUES (73, 203, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:30:46', '2022-12-30 01:30:46');
INSERT INTO `buyer_notice` VALUES (74, 149, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:30:48', '2022-12-30 01:30:48');
INSERT INTO `buyer_notice` VALUES (75, 148, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:30:50', '2022-12-30 01:30:50');
INSERT INTO `buyer_notice` VALUES (76, 185, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:30:52', '2022-12-30 01:30:52');
INSERT INTO `buyer_notice` VALUES (77, 132, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:30:54', '2022-12-30 01:30:54');
INSERT INTO `buyer_notice` VALUES (78, 140, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:30:56', '2022-12-30 01:30:56');
INSERT INTO `buyer_notice` VALUES (79, 194, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:30:58', '2022-12-30 01:30:58');
INSERT INTO `buyer_notice` VALUES (80, 189, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:31:00', '2022-12-30 01:31:00');
INSERT INTO `buyer_notice` VALUES (81, 131, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:31:02', '2022-12-30 01:31:02');
INSERT INTO `buyer_notice` VALUES (82, 121, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:31:04', '2022-12-30 01:31:04');
INSERT INTO `buyer_notice` VALUES (83, 193, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:31:06', '2022-12-30 01:31:06');
INSERT INTO `buyer_notice` VALUES (84, 184, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:31:08', '2022-12-30 01:31:08');
INSERT INTO `buyer_notice` VALUES (85, 110, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:31:10', '2022-12-30 01:31:10');
INSERT INTO `buyer_notice` VALUES (86, 158, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:31:12', '2022-12-30 01:31:12');
INSERT INTO `buyer_notice` VALUES (87, 119, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:31:14', '2022-12-30 01:31:14');
INSERT INTO `buyer_notice` VALUES (88, 160, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:31:16', '2022-12-30 01:31:16');
INSERT INTO `buyer_notice` VALUES (89, 114, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:31:18', '2022-12-30 01:31:18');
INSERT INTO `buyer_notice` VALUES (90, 182, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:31:20', '2022-12-30 01:31:20');
INSERT INTO `buyer_notice` VALUES (91, 117, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:31:22', '2022-12-30 01:31:22');
INSERT INTO `buyer_notice` VALUES (92, 180, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:31:24', '2022-12-30 01:31:24');
INSERT INTO `buyer_notice` VALUES (93, 191, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:31:26', '2022-12-30 01:31:26');
INSERT INTO `buyer_notice` VALUES (94, 126, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:31:28', '2022-12-30 01:31:28');
INSERT INTO `buyer_notice` VALUES (95, 200, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:31:30', '2022-12-30 01:31:30');
INSERT INTO `buyer_notice` VALUES (96, 138, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:31:32', '2022-12-30 01:31:32');
INSERT INTO `buyer_notice` VALUES (97, 190, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:31:34', '2022-12-30 01:31:34');
INSERT INTO `buyer_notice` VALUES (98, 123, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:31:36', '2022-12-30 01:31:36');
INSERT INTO `buyer_notice` VALUES (99, 188, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:31:38', '2022-12-30 01:31:38');
INSERT INTO `buyer_notice` VALUES (100, 156, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:31:40', '2022-12-30 01:31:40');
INSERT INTO `buyer_notice` VALUES (101, 136, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:31:42', '2022-12-30 01:31:42');
INSERT INTO `buyer_notice` VALUES (102, 107, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:31:44', '2022-12-30 01:31:44');
INSERT INTO `buyer_notice` VALUES (103, 115, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:31:46', '2022-12-30 01:31:46');
INSERT INTO `buyer_notice` VALUES (104, 116, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:31:48', '2022-12-30 01:31:48');
INSERT INTO `buyer_notice` VALUES (105, 197, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:31:50', '2022-12-30 01:31:50');
INSERT INTO `buyer_notice` VALUES (106, 109, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:31:52', '2022-12-30 01:31:52');
INSERT INTO `buyer_notice` VALUES (107, 177, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:31:54', '2022-12-30 01:31:54');
INSERT INTO `buyer_notice` VALUES (108, 145, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:31:56', '2022-12-30 01:31:56');
INSERT INTO `buyer_notice` VALUES (109, 198, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:31:58', '2022-12-30 01:31:58');
INSERT INTO `buyer_notice` VALUES (110, 162, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:32:00', '2022-12-30 01:32:00');
INSERT INTO `buyer_notice` VALUES (111, 139, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:32:02', '2022-12-30 01:32:02');
INSERT INTO `buyer_notice` VALUES (112, 125, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:32:04', '2022-12-30 01:32:04');
INSERT INTO `buyer_notice` VALUES (113, 141, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:32:06', '2022-12-30 01:32:06');
INSERT INTO `buyer_notice` VALUES (114, 127, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:32:08', '2022-12-30 01:32:08');
INSERT INTO `buyer_notice` VALUES (115, 130, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:32:10', '2022-12-30 01:32:10');
INSERT INTO `buyer_notice` VALUES (116, 172, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:32:12', '2022-12-30 01:32:12');
INSERT INTO `buyer_notice` VALUES (117, 167, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:32:14', '2022-12-30 01:32:14');
INSERT INTO `buyer_notice` VALUES (118, 181, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:32:16', '2022-12-30 01:32:16');
INSERT INTO `buyer_notice` VALUES (119, 170, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:32:18', '2022-12-30 01:32:18');
INSERT INTO `buyer_notice` VALUES (120, 159, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:32:20', '2022-12-30 01:32:20');
INSERT INTO `buyer_notice` VALUES (121, 166, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:32:22', '2022-12-30 01:32:22');
INSERT INTO `buyer_notice` VALUES (122, 152, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:32:24', '2022-12-30 01:32:24');
INSERT INTO `buyer_notice` VALUES (123, 157, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:32:26', '2022-12-30 01:32:26');
INSERT INTO `buyer_notice` VALUES (124, 112, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:32:28', '2022-12-30 01:32:28');
INSERT INTO `buyer_notice` VALUES (125, 153, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:32:30', '2022-12-30 01:32:30');
INSERT INTO `buyer_notice` VALUES (126, 142, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:32:32', '2022-12-30 01:32:32');
INSERT INTO `buyer_notice` VALUES (127, 151, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:32:34', '2022-12-30 01:32:34');
INSERT INTO `buyer_notice` VALUES (128, 143, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:32:36', '2022-12-30 01:32:36');
INSERT INTO `buyer_notice` VALUES (129, 129, '您购买的商品[秒杀测试商品]已售罄', 0, '2022-12-30 01:32:38', '2022-12-30 01:32:38');
INSERT INTO `buyer_notice` VALUES (130, 133, '您购买的商品[秒杀测试商品]部分售罄，为您抢购到5件', 0, '2022-12-30 01:32:40', '2022-12-30 01:32:40');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'pk_id',
  `seller_id` bigint NOT NULL COMMENT '卖家id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品名称',
  `describe` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '商品简介',
  `stock` int NOT NULL COMMENT '库存',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除(1为已删除 默认为0)',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (3, 1, '草莓', '新鲜草莓', 50, 0, '2022-12-28 17:40:59', '2022-12-28 17:40:59');
INSERT INTO `goods` VALUES (4, 1, '南瓜', '南瓜', 50, 0, '2022-12-28 17:44:39', '2022-12-28 17:44:39');
INSERT INTO `goods` VALUES (5, 2, '西瓜', '大西瓜', 50, 0, '2022-12-29 17:30:22', '2022-12-29 17:30:22');
INSERT INTO `goods` VALUES (6, 2, '苹果', '大苹果', 100, 0, '2022-12-29 17:30:49', '2022-12-29 17:30:49');
INSERT INTO `goods` VALUES (7, 2, '香蕉', '大香蕉', 150, 0, '2022-12-29 17:31:07', '2022-12-29 17:31:07');
INSERT INTO `goods` VALUES (8, 1, '秒杀测试商品', '秒杀测试商品', 100, 0, '2022-12-29 19:54:41', '2022-12-29 19:54:41');
INSERT INTO `goods` VALUES (9, 1, '秒杀测试商品', '秒杀测试商品', 100, 0, '2022-12-30 00:48:44', '2022-12-30 00:48:44');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'pk_id',
  `buyer_id` bigint NOT NULL COMMENT '买家id',
  `seller` bigint NOT NULL COMMENT '卖家id',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除(1为已删除 默认为0)',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '订单状态 -1 为已取消 0为待支付 1为已支付',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (1, 2, 1, 0, '2022-12-28 20:58:04', '2022-12-29 16:20:24', 1);
INSERT INTO `order` VALUES (2, 2, 1, 0, '2022-12-28 22:01:57', '2022-12-29 16:44:19', -1);
INSERT INTO `order` VALUES (3, 2, 1, 0, '2022-12-29 13:58:59', '2022-12-29 13:58:59', 0);
INSERT INTO `order` VALUES (4, 1, 1, 0, '2022-12-29 17:22:43', '2022-12-29 19:31:39', 2);
INSERT INTO `order` VALUES (5, 3, 1, 0, '2022-12-29 17:50:00', '2022-12-29 17:50:00', 0);
INSERT INTO `order` VALUES (6, 1, 1, 0, '2022-12-29 19:20:52', '2022-12-29 19:29:27', 2);
INSERT INTO `order` VALUES (8, 157, 1, 0, '2022-12-29 19:59:59', '2022-12-29 19:59:59', 0);
INSERT INTO `order` VALUES (9, 183, 1, 0, '2022-12-29 19:59:59', '2022-12-29 19:59:59', 0);
INSERT INTO `order` VALUES (10, 156, 1, 0, '2022-12-29 19:59:59', '2022-12-29 19:59:59', 0);
INSERT INTO `order` VALUES (11, 166, 1, 0, '2022-12-29 20:00:00', '2022-12-29 20:00:00', 0);
INSERT INTO `order` VALUES (12, 160, 1, 0, '2022-12-29 20:00:00', '2022-12-29 20:00:00', 0);
INSERT INTO `order` VALUES (13, 132, 1, 0, '2022-12-29 20:00:00', '2022-12-29 20:00:00', 0);
INSERT INTO `order` VALUES (14, 159, 1, 0, '2022-12-29 20:00:00', '2022-12-29 20:00:00', 0);
INSERT INTO `order` VALUES (15, 108, 1, 0, '2022-12-29 20:00:01', '2022-12-29 20:00:01', 0);
INSERT INTO `order` VALUES (16, 147, 1, 0, '2022-12-29 20:00:01', '2022-12-29 20:00:01', 0);
INSERT INTO `order` VALUES (17, 130, 1, 0, '2022-12-29 20:00:01', '2022-12-29 20:00:01', 0);
INSERT INTO `order` VALUES (18, 183, 1, 0, '2022-12-29 20:00:01', '2022-12-29 20:00:01', 0);
INSERT INTO `order` VALUES (19, 116, 1, 0, '2022-12-29 20:00:01', '2022-12-29 20:00:01', 0);
INSERT INTO `order` VALUES (20, 166, 1, 0, '2022-12-29 20:00:01', '2022-12-29 20:00:01', 0);
INSERT INTO `order` VALUES (21, 206, 1, 0, '2022-12-29 20:00:01', '2022-12-29 20:00:01', 0);
INSERT INTO `order` VALUES (22, 173, 1, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02', 0);
INSERT INTO `order` VALUES (23, 153, 1, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02', 0);
INSERT INTO `order` VALUES (24, 195, 1, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02', 0);
INSERT INTO `order` VALUES (25, 179, 1, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02', 0);
INSERT INTO `order` VALUES (26, 177, 1, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02', 0);
INSERT INTO `order` VALUES (27, 155, 1, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02', 0);
INSERT INTO `order` VALUES (28, 112, 1, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02', 0);
INSERT INTO `order` VALUES (29, 165, 1, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02', 0);
INSERT INTO `order` VALUES (30, 188, 1, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02', 0);
INSERT INTO `order` VALUES (31, 187, 1, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02', 0);
INSERT INTO `order` VALUES (32, 163, 1, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02', 0);
INSERT INTO `order` VALUES (33, 205, 1, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02', 0);
INSERT INTO `order` VALUES (34, 107, 1, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02', 0);
INSERT INTO `order` VALUES (35, 198, 1, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02', 0);
INSERT INTO `order` VALUES (36, 156, 1, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02', 0);
INSERT INTO `order` VALUES (37, 128, 1, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02', 0);
INSERT INTO `order` VALUES (38, 110, 1, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02', 0);
INSERT INTO `order` VALUES (39, 197, 1, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02', 0);
INSERT INTO `order` VALUES (40, 192, 1, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02', 0);
INSERT INTO `order` VALUES (41, 140, 1, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02', 0);
INSERT INTO `order` VALUES (42, 176, 1, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02', 0);
INSERT INTO `order` VALUES (43, 189, 1, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02', 0);
INSERT INTO `order` VALUES (44, 200, 1, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02', 0);
INSERT INTO `order` VALUES (45, 157, 1, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02', 0);
INSERT INTO `order` VALUES (46, 143, 1, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02', 0);
INSERT INTO `order` VALUES (47, 196, 1, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02', 0);
INSERT INTO `order` VALUES (48, 164, 1, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02', 0);
INSERT INTO `order` VALUES (49, 126, 1, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02', 0);
INSERT INTO `order` VALUES (50, 122, 1, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02', 0);
INSERT INTO `order` VALUES (51, 162, 1, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02', 0);
INSERT INTO `order` VALUES (52, 160, 1, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02', 0);
INSERT INTO `order` VALUES (53, 186, 1, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02', 0);
INSERT INTO `order` VALUES (54, 137, 1, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02', 0);
INSERT INTO `order` VALUES (55, 154, 1, 0, '2022-12-29 20:00:04', '2022-12-29 20:00:04', 0);
INSERT INTO `order` VALUES (56, 108, 1, 0, '2022-12-30 01:29:37', '2022-12-30 01:29:37', 0);
INSERT INTO `order` VALUES (57, 135, 1, 0, '2022-12-30 01:29:37', '2022-12-30 01:29:37', 0);
INSERT INTO `order` VALUES (58, 134, 1, 0, '2022-12-30 01:29:37', '2022-12-30 01:29:37', 0);
INSERT INTO `order` VALUES (59, 134, 1, 0, '2022-12-30 01:29:38', '2022-12-30 01:29:38', 0);
INSERT INTO `order` VALUES (60, 150, 1, 0, '2022-12-30 01:29:38', '2022-12-30 01:29:38', 0);
INSERT INTO `order` VALUES (61, 111, 1, 0, '2022-12-30 01:29:38', '2022-12-30 01:29:38', 0);
INSERT INTO `order` VALUES (62, 155, 1, 0, '2022-12-30 01:29:39', '2022-12-30 01:29:39', 0);
INSERT INTO `order` VALUES (63, 144, 1, 0, '2022-12-30 01:29:39', '2022-12-30 01:29:39', 0);
INSERT INTO `order` VALUES (64, 137, 1, 0, '2022-12-30 01:29:39', '2022-12-30 01:29:39', 0);
INSERT INTO `order` VALUES (65, 133, 1, 0, '2022-12-30 01:29:39', '2022-12-30 01:29:39', 0);
INSERT INTO `order` VALUES (66, 129, 1, 0, '2022-12-30 01:29:39', '2022-12-30 01:29:39', 0);
INSERT INTO `order` VALUES (67, 143, 1, 0, '2022-12-30 01:29:39', '2022-12-30 01:29:39', 0);
INSERT INTO `order` VALUES (68, 151, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (69, 142, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (70, 153, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (71, 112, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (72, 157, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (73, 152, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (74, 166, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (75, 159, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (76, 181, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (77, 170, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (78, 167, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (79, 172, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (80, 130, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (81, 141, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (82, 127, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (83, 125, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (84, 139, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (85, 162, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (86, 198, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (87, 145, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (88, 177, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (89, 109, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (90, 197, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (91, 116, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (92, 115, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (93, 107, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (94, 136, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (95, 186, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (96, 156, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (97, 188, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (98, 123, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (99, 138, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (100, 190, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (101, 200, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (102, 117, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (103, 126, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (104, 191, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (105, 180, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (106, 182, 1, 0, '2022-12-30 01:29:40', '2022-12-30 01:29:40', 0);
INSERT INTO `order` VALUES (107, 114, 1, 0, '2022-12-30 01:29:42', '2022-12-30 01:29:42', 0);
INSERT INTO `order` VALUES (108, 160, 1, 0, '2022-12-30 01:29:42', '2022-12-30 01:29:42', 0);
INSERT INTO `order` VALUES (109, 119, 1, 0, '2022-12-30 01:29:42', '2022-12-30 01:29:42', 0);
INSERT INTO `order` VALUES (110, 158, 1, 0, '2022-12-30 01:29:42', '2022-12-30 01:29:42', 0);
INSERT INTO `order` VALUES (111, 173, 1, 0, '2022-12-30 01:29:42', '2022-12-30 01:29:42', 0);
INSERT INTO `order` VALUES (112, 110, 1, 0, '2022-12-30 01:29:42', '2022-12-30 01:29:42', 0);
INSERT INTO `order` VALUES (113, 184, 1, 0, '2022-12-30 01:29:42', '2022-12-30 01:29:42', 0);
INSERT INTO `order` VALUES (114, 193, 1, 0, '2022-12-30 01:29:42', '2022-12-30 01:29:42', 0);
INSERT INTO `order` VALUES (115, 121, 1, 0, '2022-12-30 01:29:42', '2022-12-30 01:29:42', 0);
INSERT INTO `order` VALUES (116, 131, 1, 0, '2022-12-30 01:29:42', '2022-12-30 01:29:42', 0);
INSERT INTO `order` VALUES (117, 189, 1, 0, '2022-12-30 01:29:43', '2022-12-30 01:29:43', 0);
INSERT INTO `order` VALUES (118, 194, 1, 0, '2022-12-30 01:29:43', '2022-12-30 01:29:43', 0);
INSERT INTO `order` VALUES (119, 140, 1, 0, '2022-12-30 01:29:43', '2022-12-30 01:29:43', 0);
INSERT INTO `order` VALUES (120, 132, 1, 0, '2022-12-30 01:29:43', '2022-12-30 01:29:43', 0);
INSERT INTO `order` VALUES (121, 185, 1, 0, '2022-12-30 01:29:43', '2022-12-30 01:29:43', 0);
INSERT INTO `order` VALUES (122, 148, 1, 0, '2022-12-30 01:29:43', '2022-12-30 01:29:43', 0);
INSERT INTO `order` VALUES (123, 149, 1, 0, '2022-12-30 01:29:43', '2022-12-30 01:29:43', 0);
INSERT INTO `order` VALUES (124, 203, 1, 0, '2022-12-30 01:29:43', '2022-12-30 01:29:43', 0);
INSERT INTO `order` VALUES (125, 171, 1, 0, '2022-12-30 01:29:43', '2022-12-30 01:29:43', 0);
INSERT INTO `order` VALUES (126, 124, 1, 0, '2022-12-30 01:29:43', '2022-12-30 01:29:43', 0);
INSERT INTO `order` VALUES (127, 118, 1, 0, '2022-12-30 01:29:43', '2022-12-30 01:29:43', 0);
INSERT INTO `order` VALUES (128, 165, 1, 0, '2022-12-30 01:29:43', '2022-12-30 01:29:43', 0);
INSERT INTO `order` VALUES (129, 199, 1, 0, '2022-12-30 01:29:44', '2022-12-30 01:29:44', 0);
INSERT INTO `order` VALUES (130, 168, 1, 0, '2022-12-30 01:29:44', '2022-12-30 01:29:44', 0);
INSERT INTO `order` VALUES (131, 183, 1, 0, '2022-12-30 01:29:44', '2022-12-30 01:29:44', 0);
INSERT INTO `order` VALUES (132, 161, 1, 0, '2022-12-30 01:29:44', '2022-12-30 01:29:44', 0);
INSERT INTO `order` VALUES (133, 206, 1, 0, '2022-12-30 01:29:44', '2022-12-30 01:29:44', 0);
INSERT INTO `order` VALUES (134, 178, 1, 0, '2022-12-30 01:29:44', '2022-12-30 01:29:44', 0);
INSERT INTO `order` VALUES (135, 174, 1, 0, '2022-12-30 01:29:44', '2022-12-30 01:29:44', 0);
INSERT INTO `order` VALUES (136, 196, 1, 0, '2022-12-30 01:29:44', '2022-12-30 01:29:44', 0);
INSERT INTO `order` VALUES (137, 146, 1, 0, '2022-12-30 01:29:45', '2022-12-30 01:29:45', 0);
INSERT INTO `order` VALUES (138, 201, 1, 0, '2022-12-30 01:29:45', '2022-12-30 01:29:45', 0);
INSERT INTO `order` VALUES (139, 164, 1, 0, '2022-12-30 01:29:45', '2022-12-30 01:29:45', 0);
INSERT INTO `order` VALUES (140, 113, 1, 0, '2022-12-30 01:29:45', '2022-12-30 01:29:45', 0);
INSERT INTO `order` VALUES (141, 176, 1, 0, '2022-12-30 01:29:45', '2022-12-30 01:29:45', 0);
INSERT INTO `order` VALUES (142, 187, 1, 0, '2022-12-30 01:29:45', '2022-12-30 01:29:45', 0);
INSERT INTO `order` VALUES (143, 204, 1, 0, '2022-12-30 01:29:45', '2022-12-30 01:29:45', 0);
INSERT INTO `order` VALUES (144, 169, 1, 0, '2022-12-30 01:29:47', '2022-12-30 01:29:47', 0);
INSERT INTO `order` VALUES (145, 122, 1, 0, '2022-12-30 01:29:47', '2022-12-30 01:29:47', 0);
INSERT INTO `order` VALUES (146, 195, 1, 0, '2022-12-30 01:29:47', '2022-12-30 01:29:47', 0);
INSERT INTO `order` VALUES (147, 192, 1, 0, '2022-12-30 01:29:47', '2022-12-30 01:29:47', 0);
INSERT INTO `order` VALUES (148, 179, 1, 0, '2022-12-30 01:29:47', '2022-12-30 01:29:47', 0);
INSERT INTO `order` VALUES (149, 154, 1, 0, '2022-12-30 01:29:47', '2022-12-30 01:29:47', 0);
INSERT INTO `order` VALUES (150, 163, 1, 0, '2022-12-30 01:29:49', '2022-12-30 01:29:49', 0);
INSERT INTO `order` VALUES (151, 202, 1, 0, '2022-12-30 01:29:50', '2022-12-30 01:29:50', 0);
INSERT INTO `order` VALUES (152, 120, 1, 0, '2022-12-30 01:29:51', '2022-12-30 01:29:51', 0);
INSERT INTO `order` VALUES (153, 128, 1, 0, '2022-12-30 01:29:52', '2022-12-30 01:29:52', 0);
INSERT INTO `order` VALUES (154, 147, 1, 0, '2022-12-30 01:29:55', '2022-12-30 01:29:55', 0);
INSERT INTO `order` VALUES (155, 205, 1, 0, '2022-12-30 01:29:57', '2022-12-30 01:29:57', 0);

-- ----------------------------
-- Table structure for order_goods
-- ----------------------------
DROP TABLE IF EXISTS `order_goods`;
CREATE TABLE `order_goods`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'pk_id',
  `order_id` bigint NULL DEFAULT NULL COMMENT '订单id',
  `goods_id` bigint NULL DEFAULT NULL COMMENT '商品id',
  `quantity` bigint NULL DEFAULT NULL COMMENT '购买数量',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除(1为已删除 默认为0)',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_goods
-- ----------------------------
INSERT INTO `order_goods` VALUES (1, 1, 4, 50, 0, '2022-12-28 20:58:04', '2022-12-28 20:58:04');
INSERT INTO `order_goods` VALUES (2, 2, 3, 15, 0, '2022-12-28 22:01:57', '2022-12-28 22:01:57');
INSERT INTO `order_goods` VALUES (3, 3, 3, 1, 0, '2022-12-29 13:58:59', '2022-12-29 13:58:59');
INSERT INTO `order_goods` VALUES (4, 4, 3, 1, 0, '2022-12-29 17:22:43', '2022-12-29 17:22:43');
INSERT INTO `order_goods` VALUES (5, 5, 3, 1, 0, '2022-12-29 17:50:00', '2022-12-29 17:50:00');
INSERT INTO `order_goods` VALUES (6, 6, 3, 10, 0, '2022-12-29 19:20:52', '2022-12-29 19:20:52');
INSERT INTO `order_goods` VALUES (8, 9, 8, 6, 0, '2022-12-29 19:59:59', '2022-12-29 19:59:59');
INSERT INTO `order_goods` VALUES (9, 8, 8, 4, 0, '2022-12-29 19:59:59', '2022-12-29 19:59:59');
INSERT INTO `order_goods` VALUES (10, 10, 8, 1, 0, '2022-12-29 19:59:59', '2022-12-29 19:59:59');
INSERT INTO `order_goods` VALUES (11, 11, 8, 2, 0, '2022-12-29 20:00:00', '2022-12-29 20:00:00');
INSERT INTO `order_goods` VALUES (12, 13, 8, 3, 0, '2022-12-29 20:00:00', '2022-12-29 20:00:00');
INSERT INTO `order_goods` VALUES (13, 12, 8, 5, 0, '2022-12-29 20:00:00', '2022-12-29 20:00:00');
INSERT INTO `order_goods` VALUES (14, 14, 8, 8, 0, '2022-12-29 20:00:00', '2022-12-29 20:00:00');
INSERT INTO `order_goods` VALUES (15, 15, 8, 2, 0, '2022-12-29 20:00:01', '2022-12-29 20:00:01');
INSERT INTO `order_goods` VALUES (16, 16, 8, 10, 0, '2022-12-29 20:00:01', '2022-12-29 20:00:01');
INSERT INTO `order_goods` VALUES (17, 17, 8, 1, 0, '2022-12-29 20:00:01', '2022-12-29 20:00:01');
INSERT INTO `order_goods` VALUES (18, 18, 8, 6, 0, '2022-12-29 20:00:01', '2022-12-29 20:00:01');
INSERT INTO `order_goods` VALUES (19, 19, 8, 7, 0, '2022-12-29 20:00:01', '2022-12-29 20:00:01');
INSERT INTO `order_goods` VALUES (20, 20, 8, 5, 0, '2022-12-29 20:00:01', '2022-12-29 20:00:01');
INSERT INTO `order_goods` VALUES (21, 21, 8, 2, 0, '2022-12-29 20:00:01', '2022-12-29 20:00:01');
INSERT INTO `order_goods` VALUES (22, 22, 8, 3, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02');
INSERT INTO `order_goods` VALUES (23, 24, 8, 6, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02');
INSERT INTO `order_goods` VALUES (24, 23, 8, 8, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02');
INSERT INTO `order_goods` VALUES (25, 26, 8, 8, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02');
INSERT INTO `order_goods` VALUES (26, 25, 8, 1, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02');
INSERT INTO `order_goods` VALUES (27, 27, 8, 6, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02');
INSERT INTO `order_goods` VALUES (28, 29, 8, 6, 0, '2022-12-29 20:00:02', '2022-12-29 20:00:02');
INSERT INTO `order_goods` VALUES (29, 56, 9, 3, 0, '2022-12-30 01:29:37', '2022-12-30 01:29:37');
INSERT INTO `order_goods` VALUES (30, 57, 9, 14, 0, '2022-12-30 01:29:37', '2022-12-30 01:29:37');
INSERT INTO `order_goods` VALUES (31, 58, 9, 14, 0, '2022-12-30 01:29:37', '2022-12-30 01:29:37');
INSERT INTO `order_goods` VALUES (32, 59, 9, 8, 0, '2022-12-30 01:29:38', '2022-12-30 01:29:38');
INSERT INTO `order_goods` VALUES (33, 60, 9, 12, 0, '2022-12-30 01:29:38', '2022-12-30 01:29:38');
INSERT INTO `order_goods` VALUES (34, 61, 9, 14, 0, '2022-12-30 01:29:38', '2022-12-30 01:29:38');
INSERT INTO `order_goods` VALUES (35, 62, 9, 8, 0, '2022-12-30 01:29:39', '2022-12-30 01:29:39');
INSERT INTO `order_goods` VALUES (36, 63, 9, 11, 0, '2022-12-30 01:29:39', '2022-12-30 01:29:39');
INSERT INTO `order_goods` VALUES (37, 64, 9, 11, 0, '2022-12-30 01:29:39', '2022-12-30 01:29:39');
INSERT INTO `order_goods` VALUES (38, 65, 9, 5, 0, '2022-12-30 01:29:39', '2022-12-30 01:29:39');

-- ----------------------------
-- Table structure for seller
-- ----------------------------
DROP TABLE IF EXISTS `seller`;
CREATE TABLE `seller`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'pk_id',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '店铺名称',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '邮箱',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `salt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码盐值',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除(1为已删除 默认为0)',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of seller
-- ----------------------------
INSERT INTO `seller` VALUES (1, '默认用户', '974500760@qq.com', 'ffce4555c3c24805b62fb9860709ae48', '47COtqibGm', 0, '2022-12-19 05:14:24', '2022-12-19 05:14:24');
INSERT INTO `seller` VALUES (2, '默认用户', '1351279889@qq.com', 'fea8b244a661f3b7e851dcfb6da35c79', 'LjmisRkkn0', 0, '2022-12-29 16:06:49', '2022-12-29 16:06:49');
INSERT INTO `seller` VALUES (3, '默认用户', '859986320@qq.com', 'ffce4555c3c24805b62fb9860709ae48', '47COtqibGm', 0, '2022-12-29 17:37:41', '2022-12-29 17:37:46');
INSERT INTO `seller` VALUES (4, '默认用户', '18719460946@163.com', 'c416fc281bdd39fe8cb65422952fd67d', '1z7K4xhXUV', 0, '2022-12-29 17:44:39', '2022-12-29 17:44:39');

-- ----------------------------
-- Table structure for seller_notice
-- ----------------------------
DROP TABLE IF EXISTS `seller_notice`;
CREATE TABLE `seller_notice`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'pk_id',
  `seller_id` bigint NOT NULL COMMENT '用户id',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '通知',
  `is_deleted` tinyint NOT NULL DEFAULT 0 COMMENT '逻辑删除(1为已删除 默认为0)',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of seller_notice
-- ----------------------------
INSERT INTO `seller_notice` VALUES (1, 1, '您有新的订单 订单id为:[4]', 0, '2022-12-29 17:57:41', '2022-12-29 17:57:41');
INSERT INTO `seller_notice` VALUES (34, 1, '您有新的订单 订单id为:[6]', 0, '2022-12-29 19:21:00', '2022-12-29 19:21:00');

SET FOREIGN_KEY_CHECKS = 1;
