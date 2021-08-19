/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : strongshop

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 12/08/2021 10:44:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for st_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `st_admin_log`;
CREATE TABLE `st_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '路由',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作描述',
  `log_original` json NULL COMMENT '字段变更前内容',
  `log_dirty` json NULL COMMENT '字段变更后内容',
  `admin_user_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '操作用户',
  `created_at` timestamp(0) NULL DEFAULT NULL COMMENT '添加时间',
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for st_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `st_admin_menu`;
CREATE TABLE `st_admin_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `level` int(1) UNSIGNED NULL DEFAULT 1 COMMENT '等级 1 一级菜单, 2 二级菜单, 3 三级菜单',
  `parent_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '上级菜单',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单名称',
  `route_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '菜单跳转地址',
  `status` int(1) UNSIGNED NULL DEFAULT 1 COMMENT '状态 1开启,2禁用',
  `sort` int(11) NULL DEFAULT 100 COMMENT '排序',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 128 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_admin_menu
-- ----------------------------
INSERT INTO `st_admin_menu` VALUES (1, 1, 0, '权限管理', NULL, 1, 2001, '2021-01-06 03:37:40', '2021-05-21 20:10:57');
INSERT INTO `st_admin_menu` VALUES (2, 2, 1, '菜单管理', 'admin/adminMenu/index', 1, 200, '2021-01-06 03:38:18', '2021-01-06 03:38:18');
INSERT INTO `st_admin_menu` VALUES (3, 3, 2, '列表查看', 'admin/adminMenu/index', 1, 200, '2021-01-06 04:50:41', '2021-01-06 04:50:41');
INSERT INTO `st_admin_menu` VALUES (4, 3, 2, '添加', 'admin/adminMenu/create', 1, 200, '2021-01-06 04:51:07', '2021-01-06 04:51:07');
INSERT INTO `st_admin_menu` VALUES (5, 3, 2, '更新', 'admin/adminMenu/update', 1, 200, '2021-01-06 04:51:24', '2021-01-06 04:51:24');
INSERT INTO `st_admin_menu` VALUES (6, 3, 2, '删除', 'admin/adminMenu/destroy', 1, 200, '2021-01-06 04:51:52', '2021-01-06 04:59:28');
INSERT INTO `st_admin_menu` VALUES (7, 1, 0, '产品管理', NULL, 1, 2000, '2021-01-06 05:05:27', '2021-05-21 20:08:34');
INSERT INTO `st_admin_menu` VALUES (8, 2, 7, '产品列表', 'admin/product/index', 1, 200, '2021-01-06 05:06:02', '2021-01-28 15:17:44');
INSERT INTO `st_admin_menu` VALUES (10, 3, 8, '查看', 'admin/product/index', 1, 200, '2021-01-06 05:07:49', '2021-01-18 16:50:20');
INSERT INTO `st_admin_menu` VALUES (11, 3, 8, '添加', 'admin/product/create', 1, 200, '2021-01-06 05:08:02', '2021-02-22 12:57:19');
INSERT INTO `st_admin_menu` VALUES (12, 3, 8, '更新', 'admin/product/update', 1, 200, '2021-01-06 05:08:18', '2021-02-22 12:57:29');
INSERT INTO `st_admin_menu` VALUES (13, 3, 8, '删除', 'admin/product/destroy', 1, 200, '2021-01-06 05:08:37', '2021-02-22 12:57:39');
INSERT INTO `st_admin_menu` VALUES (14, 2, 1, '账号管理', 'admin/adminUser/index', 1, 200, '2021-01-06 05:21:14', '2021-01-13 15:24:51');
INSERT INTO `st_admin_menu` VALUES (15, 3, 14, '查看', 'admin/adminUser/index', 1, 200, '2021-01-06 05:22:05', '2021-01-06 05:22:05');
INSERT INTO `st_admin_menu` VALUES (16, 3, 14, '更新', 'admin/adminUser/update', 1, 200, '2021-01-06 05:22:45', '2021-01-06 05:22:45');
INSERT INTO `st_admin_menu` VALUES (17, 3, 14, '删除', 'admin/adminUser/destroy', 1, 200, '2021-01-06 07:08:39', '2021-01-06 07:08:39');
INSERT INTO `st_admin_menu` VALUES (18, 2, 1, '角色管理', 'admin/adminRole/index', 1, 200, '2021-01-06 07:09:58', '2021-01-06 07:30:04');
INSERT INTO `st_admin_menu` VALUES (19, 3, 18, '查看', 'admin/adminRole/index', 1, 200, '2021-01-06 07:10:18', '2021-01-06 07:30:12');
INSERT INTO `st_admin_menu` VALUES (20, 3, 18, '添加', 'admin/adminRole/create', 1, 200, '2021-01-06 07:10:30', '2021-01-06 07:30:20');
INSERT INTO `st_admin_menu` VALUES (21, 3, 18, '更新', 'admin/adminRole/update', 1, 200, '2021-01-06 07:10:48', '2021-01-06 07:30:28');
INSERT INTO `st_admin_menu` VALUES (22, 3, 18, '删除', 'admin/adminRole/destroy', 1, 200, '2021-01-06 07:11:02', '2021-01-06 07:30:53');
INSERT INTO `st_admin_menu` VALUES (23, 2, 1, '操作日志', 'admin/adminLog/index', 1, 200, '2021-01-07 13:40:48', '2021-01-07 13:40:48');
INSERT INTO `st_admin_menu` VALUES (24, 3, 23, '删除', 'admin/adminLog/destroy', 1, 200, '2021-01-07 13:41:44', '2021-01-07 13:41:44');
INSERT INTO `st_admin_menu` VALUES (25, 3, 23, '查看', 'admin/adminLog/index', 1, 200, '2021-01-08 02:27:07', '2021-01-08 02:27:07');
INSERT INTO `st_admin_menu` VALUES (26, 3, 18, '分配权限', 'admin/adminRole/assignPermissions', 1, 200, '2021-01-08 13:08:33', '2021-01-08 13:08:33');
INSERT INTO `st_admin_menu` VALUES (36, 1, 0, '主页', NULL, 1, 99999, '2021-01-08 14:59:46', '2021-01-09 13:58:51');
INSERT INTO `st_admin_menu` VALUES (37, 2, 36, '面板', 'admin/index/panel', 1, 200, '2021-01-08 16:38:33', '2021-01-08 16:42:17');
INSERT INTO `st_admin_menu` VALUES (38, 3, 14, '创建', 'admin/adminUser/create', 1, 200, '2021-01-13 15:25:40', '2021-01-13 15:25:40');
INSERT INTO `st_admin_menu` VALUES (41, 2, 1, 'Telescope', 'admin/telescope/{view?}', 1, 200, '2021-01-19 17:19:57', '2021-08-08 14:03:18');
INSERT INTO `st_admin_menu` VALUES (42, 2, 7, '产品分类', 'admin/product/category/index', 1, 200, '2021-01-28 15:29:46', '2021-02-22 12:57:57');
INSERT INTO `st_admin_menu` VALUES (43, 3, 42, '查看', 'admin/product/category/index', 1, 200, '2021-01-28 15:30:17', '2021-01-28 15:38:29');
INSERT INTO `st_admin_menu` VALUES (44, 3, 42, '创建', 'admin/product/category/create', 1, 200, '2021-01-28 15:30:34', '2021-01-28 15:38:42');
INSERT INTO `st_admin_menu` VALUES (45, 3, 42, '更新', 'admin/product/category/update', 1, 200, '2021-01-28 15:30:53', '2021-01-28 15:38:55');
INSERT INTO `st_admin_menu` VALUES (46, 3, 42, '删除', 'admin/product/category/destroy', 1, 200, '2021-01-28 15:31:10', '2021-01-28 15:39:06');
INSERT INTO `st_admin_menu` VALUES (47, 1, 0, '文章管理', NULL, 1, 1500, '2021-02-22 11:32:46', '2021-05-21 20:09:33');
INSERT INTO `st_admin_menu` VALUES (48, 2, 7, '产品规格', 'admin/product/spec/index', 1, 200, '2021-02-22 11:35:43', '2021-02-22 13:24:13');
INSERT INTO `st_admin_menu` VALUES (49, 3, 48, '规格组查看', 'admin/product/specGroup/index', 1, 200, '2021-02-22 12:59:16', '2021-02-22 13:21:47');
INSERT INTO `st_admin_menu` VALUES (50, 3, 48, '规格组创建', 'admin/product/specGroup/create', 1, 200, '2021-02-22 12:59:39', '2021-02-22 13:21:56');
INSERT INTO `st_admin_menu` VALUES (51, 3, 48, '更新规格组', 'admin/product/specGroup/update', 1, 200, '2021-02-22 13:00:04', '2021-02-22 13:22:06');
INSERT INTO `st_admin_menu` VALUES (52, 3, 48, '删除规格组', 'admin/product/specGroup/destroy', 1, 200, '2021-02-22 13:00:26', '2021-02-22 13:22:17');
INSERT INTO `st_admin_menu` VALUES (53, 3, 48, '查看规格', 'admin/product/spec/index', 1, 200, '2021-02-22 13:22:51', '2021-02-22 13:22:51');
INSERT INTO `st_admin_menu` VALUES (54, 3, 48, '创建规格', 'admin/product/spec/create', 1, 200, '2021-02-22 13:23:22', '2021-02-22 13:23:22');
INSERT INTO `st_admin_menu` VALUES (55, 3, 48, '更新规格', 'admin/product/spec/update', 1, 200, '2021-02-22 13:23:38', '2021-02-22 13:23:38');
INSERT INTO `st_admin_menu` VALUES (56, 3, 48, '删除规格', 'admin/product/spec/destroy', 1, 200, '2021-02-22 13:23:56', '2021-02-22 13:23:56');
INSERT INTO `st_admin_menu` VALUES (57, 2, 7, '产品品牌', 'admin/product/brand/index', 1, 200, '2021-03-15 14:38:53', '2021-03-15 14:38:53');
INSERT INTO `st_admin_menu` VALUES (58, 3, 57, '列表查看', 'admin/product/brand/index', 1, 200, '2021-03-15 14:39:18', '2021-03-15 14:39:18');
INSERT INTO `st_admin_menu` VALUES (59, 3, 57, '创建', 'admin/product/brand/create', 1, 200, '2021-03-15 14:39:45', '2021-03-15 14:39:45');
INSERT INTO `st_admin_menu` VALUES (60, 3, 57, '修改', 'admin/product/brand/update', 1, 200, '2021-03-15 14:40:02', '2021-03-15 14:40:02');
INSERT INTO `st_admin_menu` VALUES (61, 3, 57, '删除', 'admin/product/brand/destroy', 1, 200, '2021-03-15 14:40:50', '2021-03-15 14:40:50');
INSERT INTO `st_admin_menu` VALUES (62, 1, 0, '订单管理', NULL, 1, 1800, '2021-05-20 13:54:11', '2021-05-21 20:09:05');
INSERT INTO `st_admin_menu` VALUES (63, 2, 62, '订单列表', 'admin/order/index', 1, 200, '2021-05-20 13:54:36', '2021-05-20 13:55:15');
INSERT INTO `st_admin_menu` VALUES (64, 2, 63, '更新订单', 'admin/order/update', 1, 200, '2021-05-20 13:54:56', '2021-05-20 13:54:56');
INSERT INTO `st_admin_menu` VALUES (65, 2, 63, '删除订单', 'admin/order/destroy', 1, 200, '2021-05-20 13:55:53', '2021-05-20 13:55:53');
INSERT INTO `st_admin_menu` VALUES (66, 2, 63, '取消订单', 'admin/order/cancel', 1, 200, '2021-05-20 13:56:35', '2021-05-20 13:56:35');
INSERT INTO `st_admin_menu` VALUES (68, 3, 63, '查看订单产品', 'admin/order/products', 1, 200, '2021-05-20 14:00:41', '2021-05-20 14:00:41');
INSERT INTO `st_admin_menu` VALUES (69, 3, 63, '查看列表', 'admin/order/index', 1, 200, '2021-05-20 14:02:49', '2021-05-20 14:02:49');
INSERT INTO `st_admin_menu` VALUES (72, 1, 0, '会员管理', NULL, 1, 1900, '2021-05-20 16:44:51', '2021-05-21 20:08:51');
INSERT INTO `st_admin_menu` VALUES (73, 2, 72, '会员列表', 'admin/user/index', 1, 300, '2021-05-20 16:45:23', '2021-06-01 11:26:57');
INSERT INTO `st_admin_menu` VALUES (74, 3, 73, '查看', 'admin/user/index', 1, 200, '2021-05-20 16:45:45', '2021-05-20 16:45:45');
INSERT INTO `st_admin_menu` VALUES (75, 3, 73, '更新', 'admin/user/update', 1, 200, '2021-05-20 16:46:01', '2021-05-20 16:46:01');
INSERT INTO `st_admin_menu` VALUES (76, 3, 73, '删除', 'admin/user/destroy', 1, 200, '2021-05-20 16:46:21', '2021-05-20 16:46:21');
INSERT INTO `st_admin_menu` VALUES (77, 2, 47, '文章分类', 'admin/article/category/index', 1, 200, '2021-05-28 16:48:03', '2021-05-28 16:48:03');
INSERT INTO `st_admin_menu` VALUES (78, 3, 77, '文章分类查看', 'admin/article/category/index', 1, 200, '2021-05-28 16:48:46', '2021-05-28 16:49:22');
INSERT INTO `st_admin_menu` VALUES (79, 3, 77, '文章分类创建', 'admin/article/category/create', 1, 200, '2021-05-28 16:49:51', '2021-05-28 16:49:51');
INSERT INTO `st_admin_menu` VALUES (80, 3, 77, '文章分类更新', 'admin/article/category/update', 1, 200, '2021-05-28 16:50:13', '2021-05-28 16:50:13');
INSERT INTO `st_admin_menu` VALUES (81, 3, 77, '文章分类删除', 'admin/article/category/destroy', 1, 200, '2021-05-28 16:50:33', '2021-05-28 16:50:33');
INSERT INTO `st_admin_menu` VALUES (82, 2, 47, '文章列表', 'admin/article/article/index', 1, 200, '2021-05-28 16:53:27', '2021-05-28 16:53:27');
INSERT INTO `st_admin_menu` VALUES (83, 3, 82, '查看文章', 'admin/article/article/index', 1, 200, '2021-05-28 16:54:00', '2021-05-28 16:54:00');
INSERT INTO `st_admin_menu` VALUES (84, 3, 82, '创建文章', 'admin/article/article/create', 1, 200, '2021-05-28 16:54:19', '2021-05-28 16:54:19');
INSERT INTO `st_admin_menu` VALUES (85, 3, 82, '更新文章', 'admin/article/article/update', 1, 200, '2021-05-28 16:54:32', '2021-05-28 16:54:32');
INSERT INTO `st_admin_menu` VALUES (86, 3, 82, '删除文章', 'admin/article/article/destroy', 1, 200, '2021-05-28 16:54:49', '2021-05-28 16:54:49');
INSERT INTO `st_admin_menu` VALUES (87, 2, 72, '意见反馈', 'admin/user/feedback/index', 1, 200, '2021-05-29 10:58:33', '2021-05-29 10:58:33');
INSERT INTO `st_admin_menu` VALUES (88, 3, 87, '查看', 'admin/user/feedback/index', 1, 200, '2021-05-29 10:58:54', '2021-05-29 10:58:54');
INSERT INTO `st_admin_menu` VALUES (89, 3, 87, '回复', 'admin/user/feedback/update', 1, 200, '2021-05-29 10:59:10', '2021-05-29 10:59:10');
INSERT INTO `st_admin_menu` VALUES (90, 3, 87, '删除', 'admin/user/feedback/destroy', 1, 200, '2021-05-29 10:59:41', '2021-05-29 10:59:41');
INSERT INTO `st_admin_menu` VALUES (91, 2, 72, '会员等级', 'admin/user/userRank/index', 1, 230, '2021-06-01 11:26:43', '2021-06-01 11:26:43');
INSERT INTO `st_admin_menu` VALUES (92, 3, 91, '查看', 'admin/user/userRank/index', 1, 200, '2021-06-01 11:27:27', '2021-06-01 11:27:27');
INSERT INTO `st_admin_menu` VALUES (93, 3, 91, '更新', 'admin/user/userRank/update', 1, 200, '2021-06-01 11:27:41', '2021-06-01 11:27:41');
INSERT INTO `st_admin_menu` VALUES (94, 3, 91, '删除', 'admin/user/userRank/desctroy', 1, 200, '2021-06-01 11:28:01', '2021-06-01 11:28:01');
INSERT INTO `st_admin_menu` VALUES (95, 3, 91, '创建', 'admin/user/userRank/create', 1, 200, '2021-06-01 11:28:21', '2021-06-01 11:28:21');
INSERT INTO `st_admin_menu` VALUES (103, 1, 0, '网站设置', NULL, 1, 200, '2021-08-01 20:43:33', '2021-08-01 20:43:33');
INSERT INTO `st_admin_menu` VALUES (104, 2, 103, '配送方式', 'admin/shippingOption/index', 1, 200, '2021-08-01 20:44:13', '2021-08-01 20:44:13');
INSERT INTO `st_admin_menu` VALUES (105, 2, 103, '支付方式', 'admin/paymentOption/index', 1, 200, '2021-08-02 09:52:12', '2021-08-02 09:52:12');
INSERT INTO `st_admin_menu` VALUES (106, 3, 105, '查看', 'admin/paymentOption/index', 1, 200, '2021-08-02 09:52:26', '2021-08-02 09:52:26');
INSERT INTO `st_admin_menu` VALUES (107, 3, 105, '添加', 'admin/paymentOption/create', 1, 200, '2021-08-02 09:52:40', '2021-08-02 09:52:40');
INSERT INTO `st_admin_menu` VALUES (108, 3, 105, '更新', 'admin/paymentOption/update', 1, 200, '2021-08-02 09:52:53', '2021-08-02 09:52:53');
INSERT INTO `st_admin_menu` VALUES (109, 2, 103, '地区管理', 'admin/region/regionCountry/index', 1, 200, '2021-08-07 10:26:57', '2021-08-07 10:26:57');
INSERT INTO `st_admin_menu` VALUES (110, 3, 109, '国家列表', 'admin/region/regionCountry/index', 1, 200, '2021-08-07 11:06:47', '2021-08-07 11:07:15');
INSERT INTO `st_admin_menu` VALUES (111, 3, 109, '国家查看', 'admin/region/regionCountry/show', 1, 200, '2021-08-07 11:07:29', '2021-08-07 11:07:29');
INSERT INTO `st_admin_menu` VALUES (112, 3, 109, '国家更新', 'admin/region/regionCountry/update', 1, 200, '2021-08-07 11:07:48', '2021-08-07 11:07:48');
INSERT INTO `st_admin_menu` VALUES (113, 3, 109, '国家删除', 'admin/region/regionCountry/destroy', 1, 200, '2021-08-07 11:08:08', '2021-08-07 11:08:08');
INSERT INTO `st_admin_menu` VALUES (114, 3, 109, '大陆列表', 'admin/region/regionContinent/index', 1, 200, '2021-08-07 11:08:29', '2021-08-07 11:08:29');
INSERT INTO `st_admin_menu` VALUES (115, 3, 109, '大陆更新', 'admin/region/regionContinent/update', 1, 200, '2021-08-07 11:08:43', '2021-08-07 11:08:43');
INSERT INTO `st_admin_menu` VALUES (116, 3, 109, '大陆删除', 'admin/region/regionContinent/destroy', 1, 200, '2021-08-07 11:09:01', '2021-08-07 11:09:01');
INSERT INTO `st_admin_menu` VALUES (117, 3, 109, '大陆添加', 'admin/region/regionContinent/create', 1, 200, '2021-08-07 11:09:21', '2021-08-07 11:09:21');
INSERT INTO `st_admin_menu` VALUES (118, 3, 109, '国家添加', 'admin/region/regionCountry/create', 1, 201, '2021-08-07 11:09:38', '2021-08-07 11:10:29');
INSERT INTO `st_admin_menu` VALUES (120, 2, 103, '网站设置', 'admin/webconfig/save/config', 1, 300, '2021-08-07 13:06:43', '2021-08-07 14:54:05');
INSERT INTO `st_admin_menu` VALUES (121, 3, 63, '关闭订单', 'admin/order/confirm/close', 1, 200, '2021-08-08 13:56:21', '2021-08-08 13:56:21');
INSERT INTO `st_admin_menu` VALUES (122, 3, 63, '确认订单付款', 'admin/order/confirm/paid', 1, 200, '2021-08-08 13:56:43', '2021-08-08 13:56:43');
INSERT INTO `st_admin_menu` VALUES (123, 3, 63, '确认订单发货', 'admin/order/confirm/shipped', 1, 200, '2021-08-08 13:56:52', '2021-08-08 13:56:52');
INSERT INTO `st_admin_menu` VALUES (124, 3, 63, '确认订单退货', 'admin/order/confirm/returned', 1, 200, '2021-08-08 13:57:05', '2021-08-08 13:57:05');
INSERT INTO `st_admin_menu` VALUES (125, 3, 63, '确认订单完成', 'admin/order/confirm/done', 1, 200, '2021-08-08 13:57:14', '2021-08-08 13:57:14');
INSERT INTO `st_admin_menu` VALUES (126, 3, 63, '打印订单', 'admin/order/print', 1, 200, '2021-08-08 13:57:23', '2021-08-08 13:57:23');
INSERT INTO `st_admin_menu` VALUES (127, 3, 63, '订单详情', 'admin/order/show', 1, 200, '2021-08-08 13:57:31', '2021-08-08 13:57:31');

-- ----------------------------
-- Table structure for st_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `st_admin_role`;
CREATE TABLE `st_admin_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '角色描述',
  `permissions` json NULL COMMENT '拥有的权限(route_url)',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_admin_role
-- ----------------------------
INSERT INTO `st_admin_role` VALUES (1, '管理员', 'd', '{\"menu_id\": [\"36\", \"37\", \"1\", \"2\", \"3\", \"4\", \"5\", \"6\", \"14\", \"15\", \"16\", \"17\", \"38\", \"18\", \"19\", \"20\", \"21\", \"22\", \"26\", \"23\", \"24\", \"25\", \"7\", \"8\", \"10\", \"11\", \"12\", \"13\", \"40\"], \"menu_route_url\": [\"admin/index/panel\", \"admin/adminMenu/index\", \"admin/adminMenu/index\", \"admin/adminMenu/create\", \"admin/adminMenu/update\", \"admin/adminMenu/destroy\", \"admin/adminUser/index\", \"admin/adminUser/index\", \"admin/adminUser/update\", \"admin/adminUser/destroy\", \"admin/adminUser/create\", \"admin/adminRole/index\", \"admin/adminRole/index\", \"admin/adminRole/create\", \"admin/adminRole/update\", \"admin/adminRole/destroy\", \"admin/adminRole/assignPermissions\", \"admin/adminLog/index\", \"admin/adminLog/destroy\", \"admin/adminLog/index\", \"admin/goods/index\", \"admin/product/index\", \"admin/goods/create\", \"admin/goods/update\", \"admin/goods/destroy\", \"admin/product/test\"]}', '2021-01-06 08:18:36', '2021-01-18 21:24:55');
INSERT INTO `st_admin_role` VALUES (2, '编辑', 'd', '{\"menu_id\": [\"36\", \"37\", \"1\", \"2\", \"3\", \"14\", \"15\", \"18\", \"19\", \"23\", \"24\", \"25\", \"41\", \"7\", \"8\", \"10\", \"11\", \"42\", \"43\", \"44\", \"48\", \"49\", \"50\", \"53\", \"54\", \"57\", \"58\", \"59\", \"72\", \"73\", \"74\", \"91\", \"92\", \"87\", \"88\", \"89\", \"62\", \"63\", \"64\", \"68\", \"69\", \"121\", \"122\", \"123\", \"124\", \"125\", \"126\", \"127\", \"47\", \"77\", \"78\", \"79\", \"82\", \"83\", \"84\", \"103\", \"104\", \"105\", \"106\", \"109\", \"110\", \"111\", \"114\"], \"menu_route_url\": [\"admin/index/panel\", \"admin/adminMenu/index\", \"admin/adminMenu/index\", \"admin/adminUser/index\", \"admin/adminUser/index\", \"admin/adminRole/index\", \"admin/adminRole/index\", \"admin/adminLog/index\", \"admin/adminLog/destroy\", \"admin/adminLog/index\", \"admin/telescope/{view?}\", \"admin/product/index\", \"admin/product/index\", \"admin/product/create\", \"admin/product/category/index\", \"admin/product/category/index\", \"admin/product/category/create\", \"admin/product/spec/index\", \"admin/product/specGroup/index\", \"admin/product/specGroup/create\", \"admin/product/spec/index\", \"admin/product/spec/create\", \"admin/product/brand/index\", \"admin/product/brand/index\", \"admin/product/brand/create\", \"admin/user/index\", \"admin/user/index\", \"admin/user/userRank/index\", \"admin/user/userRank/index\", \"admin/user/feedback/index\", \"admin/user/feedback/index\", \"admin/user/feedback/update\", \"admin/order/index\", \"admin/order/update\", \"admin/order/products\", \"admin/order/index\", \"admin/order/confirm/close\", \"admin/order/confirm/paid\", \"admin/order/confirm/shipped\", \"admin/order/confirm/returned\", \"admin/order/confirm/done\", \"admin/order/print\", \"admin/order/show\", \"admin/article/category/index\", \"admin/article/category/index\", \"admin/article/category/create\", \"admin/article/article/index\", \"admin/article/article/index\", \"admin/article/article/create\", \"admin/shippingOption/index\", \"admin/paymentOption/index\", \"admin/paymentOption/index\", \"admin/region/regionCountry/index\", \"admin/region/regionCountry/index\", \"admin/region/regionCountry/show\", \"admin/region/regionContinent/index\"]}', '2021-01-06 08:19:12', '2021-08-08 14:05:33');

-- ----------------------------
-- Table structure for st_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `st_admin_user`;
CREATE TABLE `st_admin_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '登录名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录密码',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '记住登录',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '姓名',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '邮箱',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像',
  `introduction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '介绍',
  `status` int(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态 1 启用, 2 禁用',
  `last_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最近一次登录ip',
  `last_at` datetime(0) NULL DEFAULT NULL COMMENT '最近一次登录时间',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_user_name`(`user_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_admin_user
-- ----------------------------
INSERT INTO `st_admin_user` VALUES (1, 'admin', '$2y$10$znghW0tuweBpm7tJwWJsOO4WItC1RcGGNgIfbvN9rAaMzqIN6sUHG', 'jVXJ2zGAM7MyPBzqjt62fONoZzeNncENHKdXtGiIpq49YZeeXHfEdexGdrR2', 'Admin', 'admin@qq.com', NULL, 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif', NULL, 1, '127.0.0.1', '2021-08-11 15:06:28', '2020-04-13 10:18:10', '2021-08-11 15:06:28');
INSERT INTO `st_admin_user` VALUES (19, 'demo', '$2y$10$3Wflp52wsoJeGdvwbMutHeoYr2b1W8ozofq/Todsng1MimxbsWSWK', 'gxj11VQS5WQzezUh4YrdRFzXOXnTqHOPubq1zwebP1y9NTEWmYAhJxTP0DeJ', 'demo', '', '', '', '', 1, '127.0.0.1', '2021-08-08 14:04:29', '2021-08-08 13:51:48', '2021-08-08 14:04:29');

-- ----------------------------
-- Table structure for st_admin_user_role
-- ----------------------------
DROP TABLE IF EXISTS `st_admin_user_role`;
CREATE TABLE `st_admin_user_role`  (
  `admin_user_id` int(11) NOT NULL,
  `admin_role_id` int(11) NOT NULL,
  PRIMARY KEY (`admin_user_id`, `admin_role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_admin_user_role
-- ----------------------------
INSERT INTO `st_admin_user_role` VALUES (1, 1);
INSERT INTO `st_admin_user_role` VALUES (19, 2);

-- ----------------------------
-- Table structure for st_article
-- ----------------------------
DROP TABLE IF EXISTS `st_article`;
CREATE TABLE `st_article`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL DEFAULT 0 COMMENT '文章分类id',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `cover_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '封面图',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容',
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '作者',
  `status` int(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态 1开启,2禁用',
  `sort` int(11) NULL DEFAULT 100 COMMENT '排序',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  `meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'meta 关键字',
  `meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'meta 描述',
  `origin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '内容来源',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `cate_id`(`category_id`, `title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for st_brand
-- ----------------------------
DROP TABLE IF EXISTS `st_brand`;
CREATE TABLE `st_brand`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '品牌名称',
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '品牌logo',
  `more` json NULL COMMENT '更多其他配置',
  `status` int(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态 1开启,2禁用',
  `sort` int(11) NULL DEFAULT 100 COMMENT '排序',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `title`(`title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '品牌表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_brand
-- ----------------------------
INSERT INTO `st_brand` VALUES (1, '耐克', '/storage/202103/4BFxWMmCMxQixHbeVWcGC6KMzHqFQJWVei8EopoO.png', NULL, 1, 201, '2021-03-15 15:01:06', '2021-03-15 16:11:24');
INSERT INTO `st_brand` VALUES (2, '李宁', '/storage/202103/UURNBaYZYI5bVCf46TUTKF9YqNjOhautQbYRZ7lU.png', NULL, 1, 200, '2021-03-15 15:04:42', '2021-03-15 16:11:13');

-- ----------------------------
-- Table structure for st_category
-- ----------------------------
DROP TABLE IF EXISTS `st_category`;
CREATE TABLE `st_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `type` int(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '类型：1 产品分类，2 文章分类',
  `level` int(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '等级 1 一级, 2 二级, 3 三级',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级id',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `status` int(1) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态 1开启,2禁用',
  `sort` int(11) NULL DEFAULT 200 COMMENT '排序',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'meta 关键字',
  `meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'meta 描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_category
-- ----------------------------
INSERT INTO `st_category` VALUES (1, 1, 1, 0, '电子产品', 1, 100, '2021-03-15 15:24:20', '2021-03-15 15:29:41', NULL, NULL);
INSERT INTO `st_category` VALUES (2, 1, 2, 1, '电脑', 1, 200, '2021-03-15 15:24:29', '2021-03-15 15:24:29', NULL, NULL);
INSERT INTO `st_category` VALUES (3, 1, 2, 1, '手机', 1, 200, '2021-03-15 15:24:37', '2021-03-15 15:24:37', NULL, NULL);
INSERT INTO `st_category` VALUES (4, 1, 2, 1, '平板', 1, 200, '2021-03-15 15:24:46', '2021-03-15 15:24:46', NULL, NULL);
INSERT INTO `st_category` VALUES (5, 1, 1, 0, '女装', 1, 200, '2021-03-15 15:25:07', '2021-03-15 15:25:07', NULL, NULL);
INSERT INTO `st_category` VALUES (6, 1, 2, 5, '连衣裙', 1, 200, '2021-03-15 15:25:19', '2021-03-15 15:25:19', NULL, NULL);
INSERT INTO `st_category` VALUES (7, 1, 2, 5, '上衣', 1, 200, '2021-03-15 15:25:31', '2021-03-15 15:25:31', NULL, NULL);
INSERT INTO `st_category` VALUES (8, 1, 2, 5, '外套', 1, 200, '2021-03-15 15:25:39', '2021-03-15 15:25:39', NULL, NULL);
INSERT INTO `st_category` VALUES (9, 1, 3, 6, '短袖连衣裙', 1, 200, '2021-03-15 15:25:50', '2021-03-15 15:25:50', NULL, NULL);
INSERT INTO `st_category` VALUES (10, 1, 3, 6, '牛仔连衣裙', 1, 200, '2021-03-15 15:25:56', '2021-03-15 15:25:56', NULL, NULL);
INSERT INTO `st_category` VALUES (11, 1, 3, 7, '卫衣', 1, 200, '2021-03-15 15:26:02', '2021-03-15 15:26:02', NULL, NULL);
INSERT INTO `st_category` VALUES (12, 1, 3, 7, '毛衣', 1, 200, '2021-03-15 15:26:13', '2021-03-15 15:26:13', NULL, NULL);
INSERT INTO `st_category` VALUES (13, 1, 3, 7, '针织衫', 1, 200, '2021-03-15 15:26:21', '2021-03-15 15:26:21', NULL, NULL);
INSERT INTO `st_category` VALUES (14, 1, 1, 0, '男装', 1, 200, '2021-03-15 15:26:29', '2021-03-15 15:26:29', NULL, NULL);
INSERT INTO `st_category` VALUES (15, 1, 2, 14, 'T恤', 1, 200, '2021-03-15 15:26:39', '2021-03-15 15:26:39', NULL, NULL);
INSERT INTO `st_category` VALUES (16, 1, 2, 14, '鞋子', 1, 200, '2021-03-15 15:26:46', '2021-03-15 15:26:46', NULL, NULL);
INSERT INTO `st_category` VALUES (17, 1, 2, 14, '牛仔裤', 1, 200, '2021-03-15 15:26:54', '2021-03-15 15:26:54', NULL, NULL);
INSERT INTO `st_category` VALUES (18, 1, 2, 14, '羽绒服', 1, 200, '2021-03-15 15:27:01', '2021-03-15 15:27:01', NULL, NULL);
INSERT INTO `st_category` VALUES (19, 1, 2, 14, '风衣', 1, 200, '2021-03-15 15:27:07', '2021-03-15 15:27:07', NULL, NULL);
INSERT INTO `st_category` VALUES (20, 1, 2, 14, '大衣', 1, 200, '2021-03-15 15:27:14', '2021-03-15 15:27:14', NULL, NULL);
INSERT INTO `st_category` VALUES (21, 1, 2, 14, '夹克', 1, 200, '2021-03-15 15:27:21', '2021-03-15 15:27:21', NULL, NULL);
INSERT INTO `st_category` VALUES (22, 1, 3, 15, '嘻哈T恤', 1, 200, '2021-03-15 15:27:28', '2021-03-15 15:27:28', NULL, NULL);
INSERT INTO `st_category` VALUES (23, 1, 3, 15, '短袖体恤', 1, 200, '2021-03-15 15:27:35', '2021-03-15 15:27:35', NULL, NULL);
INSERT INTO `st_category` VALUES (24, 1, 3, 15, '商务T恤', 1, 200, '2021-03-15 15:27:42', '2021-03-15 15:27:42', NULL, NULL);
INSERT INTO `st_category` VALUES (25, 1, 3, 15, '条纹T恤', 1, 200, '2021-03-15 15:27:54', '2021-03-15 15:27:54', NULL, NULL);
INSERT INTO `st_category` VALUES (26, 1, 3, 16, '运动鞋', 1, 200, '2021-03-15 15:28:28', '2021-03-15 15:28:28', NULL, NULL);
INSERT INTO `st_category` VALUES (27, 1, 3, 16, '凉鞋', 1, 200, '2021-03-15 15:28:36', '2021-03-15 15:28:36', NULL, NULL);
INSERT INTO `st_category` VALUES (28, 1, 3, 16, '休闲鞋', 1, 200, '2021-03-15 15:28:43', '2021-03-15 15:28:43', NULL, NULL);
INSERT INTO `st_category` VALUES (29, 2, 1, 0, '系统文章', 1, 200, '2021-05-28 16:51:06', '2021-05-28 16:51:06', NULL, NULL);
INSERT INTO `st_category` VALUES (30, 2, 2, 29, '博客', 1, 200, '2021-05-29 08:53:13', '2021-05-29 08:53:13', NULL, NULL);
INSERT INTO `st_category` VALUES (31, 2, 1, 0, '行业新闻', 1, 200, '2021-05-29 08:53:29', '2021-05-29 08:53:29', NULL, NULL);

-- ----------------------------
-- Table structure for st_failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `st_failed_jobs`;
CREATE TABLE `st_failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for st_jobs
-- ----------------------------
DROP TABLE IF EXISTS `st_jobs`;
CREATE TABLE `st_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED NULL DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `st_jobs_queue_index`(`queue`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for st_notifications
-- ----------------------------
DROP TABLE IF EXISTS `st_notifications`;
CREATE TABLE `st_notifications`  (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `st_notifications_notifiable_type_notifiable_id_index`(`notifiable_type`, `notifiable_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for st_order
-- ----------------------------
DROP TABLE IF EXISTS `st_order`;
CREATE TABLE `st_order`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '会员id',
  `order_no` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单编号',
  `currency_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '结算货币',
  `currency_rate` decimal(10, 6) UNSIGNED NOT NULL DEFAULT 1.000000 COMMENT '结算货币转换率',
  `products_amount` decimal(10, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '产品总额',
  `weight_total` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '产品总重量：g',
  `shipping_fee` decimal(10, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '配送费用',
  `handling_fee` decimal(10, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '支付费用 （支付手续费）',
  `tax_fee` decimal(10, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '税收费用',
  `discount_amount` decimal(10, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '优惠金额',
  `used_credits_amount` decimal(10, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '积分金额',
  `order_amount` decimal(10, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '订单金额 （应付金额）',
  `paid_amount` decimal(10, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '已付金额',
  `order_status` int(11) NOT NULL DEFAULT 0 COMMENT '订单状态：10 待支付，12 已支付/待发货，13 支付失败，14 支付异常，20 已发货/待收货，22 已收货，24 退货中，26 已退货，30 已完成，40 已取消（会员取消），42 已关闭(管理员关闭)',
  `pay_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '支付备注',
  `shipping_option_id` int(11) NOT NULL DEFAULT 0 COMMENT '配送id',
  `tracking_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '物流跟踪单号',
  `shipping_remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '配送备注：可填写具体配送公司等信息，此信息在前台订单详情显示',
  `payment_option_id` int(11) NOT NULL DEFAULT 0 COMMENT '支付id',
  `transaction_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '支付平台流水号id',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '订单备注',
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名',
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '联系电话',
  `fax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '传真',
  `country_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '国家',
  `state_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '省',
  `state_other` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '其他省',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '城市',
  `address_line_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '地址1',
  `address_line_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '地址2',
  `postal_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '邮编',
  `billing_first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名(账单)',
  `billing_last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓(账单)',
  `billing_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'Email(账单)',
  `billing_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '联系电话(账单)',
  `billing_fax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '传真(账单)',
  `billing_country_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '国家(账单)',
  `billing_state_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '省(账单)',
  `billing_state_other` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '其他省(账单)',
  `billing_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '城市(账单)',
  `billing_address_line_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '地址1(账单)',
  `billing_address_line_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '地址2(账单)',
  `billing_postal_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '邮编(账单)',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  `paid_at` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `received_at` datetime(0) NULL DEFAULT NULL COMMENT '确认收货时间',
  `canceled_at` datetime(0) NULL DEFAULT NULL COMMENT '取消订单时间',
  `returned_at` datetime(0) NULL DEFAULT NULL COMMENT '退货时间',
  `shipped_at` datetime(0) NULL DEFAULT NULL COMMENT '发货时间',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '来源',
  `http_referer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'HTTP_REFERER',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_no`(`order_no`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_order
-- ----------------------------
INSERT INTO `st_order` VALUES (1, 1, '20210808125221504', 'CNY', 6.394500, 997.479, 1000, 40.317, 95.918, 226.743, 0.000, 0.000, 1360.457, 0.000, 10, '', 30, '', '', 1, '', '快点发货！', 'strong', 'shop', 'strongshop@qq.com', '083294829382', '083294829382', 'GB', '', 'Sunderland', 'Zhengzhou', 'dizhi1002 10.', 'dizhi1002 12.', 'F4234', 'strong', 'shop', 'strongshop@qq.com', '083294829382', '083294829382', 'GB', '', 'Sunderland', 'Zhengzhou', 'dizhi1002 10.', 'dizhi1002 12.', 'F4234', '2021-08-08 12:52:09', '2021-08-08 12:52:09', NULL, NULL, NULL, NULL, NULL, NULL, '', '');
INSERT INTO `st_order` VALUES (2, 1, 'ST20210808125681108', 'CNY', 6.394500, 3254.801, 0, 0.000, 95.918, 670.144, 0.000, 0.000, 4020.863, 0.000, 10, '', 30, '', '', 1, '', '', 'strong', 'shop', 'strongshop@qq.com', '083294829382', '083294829382', 'GB', '', 'Sunderland', 'Zhengzhou', 'dizhi1002 10.', 'dizhi1002 12.', 'F4234', 'strong', 'shop', 'strongshop@qq.com', '083294829382', '083294829382', 'GB', '', 'Sunderland', 'Zhengzhou', 'dizhi1002 10.', 'dizhi1002 12.', 'F4234', '2021-08-08 12:56:22', '2021-08-08 12:56:22', NULL, NULL, NULL, NULL, NULL, NULL, '', '');

-- ----------------------------
-- Table structure for st_order_product
-- ----------------------------
DROP TABLE IF EXISTS `st_order_product`;
CREATE TABLE `st_order_product`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` int(10) NOT NULL DEFAULT 0 COMMENT '订单id',
  `product_id` int(10) NOT NULL COMMENT '产品id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '产品标题',
  `sku` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SKU',
  `weight` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '重量：g',
  `currency_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '结算货币',
  `currency_rate` decimal(10, 6) UNSIGNED NOT NULL DEFAULT 1.000000 COMMENT '结算货币转换率',
  `original_price` decimal(10, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '原价：元',
  `sale_price` decimal(10, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '售价：元',
  `img_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '产品封面图',
  `specs` json NULL COMMENT '已选规格',
  `qty` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '已购数量',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '订单产品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_order_product
-- ----------------------------
INSERT INTO `st_order_product` VALUES (1, 1, 10, 'Cotton Valueweight Tee T-Shirt-purple-xxxl', 'tshirt100-01-xxxl', 0, 'CNY', 6.394500, 498.771, 428.432, 'http://www.strongshop.local/storage/202103/uHRk5LQQ1CYfdHpVTdvqVZB1Dp0aqENC8VOsYk48_thumb.jpg', '[{\"name\": \"颜色\", \"value\": \"Purple\"}, {\"name\": \"尺寸\", \"value\": \"XXXL\"}]', 2, '2021-08-08 12:52:09', NULL);
INSERT INTO `st_order_product` VALUES (2, 1, 1, 'Womens Mini Dress Batwing Boat Neck Long Sleeve Tunic Shift Dress Black-S', 'dress100-01-s', 1000, 'CNY', 6.394500, 204.624, 140.615, 'http://www.strongshop.local/storage/202103/rx0xVDd18IOOT5sxAT7M9QAQUFCczeFJWhAz2p8g_thumb.jpg', '[{\"name\": \"颜色\", \"value\": \"Black\"}, {\"name\": \"尺寸\", \"value\": \"S\"}]', 1, '2021-08-08 12:52:09', NULL);
INSERT INTO `st_order_product` VALUES (3, 2, 13, 'Google Pixel 3a  phone balck-64g', 'phone100-01-64g', 0, 'CNY', 6.394500, 3625.682, 3254.801, 'http://www.strongshop.local/storage/202103/jNtVfXo4gtqoV1uPJ7sSNOaT1NynCKECnv8tPlyc_thumb.jpg', '[{\"name\": \"颜色\", \"value\": \"Black\"}, {\"name\": \"容量\", \"value\": \"64g\"}]', 1, '2021-08-08 12:56:22', NULL);

-- ----------------------------
-- Table structure for st_password_resets
-- ----------------------------
DROP TABLE IF EXISTS `st_password_resets`;
CREATE TABLE `st_password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `st_password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for st_payment_option
-- ----------------------------
DROP TABLE IF EXISTS `st_payment_option`;
CREATE TABLE `st_payment_option`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '支付名称',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '描述',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '状态：1 启动，2 禁用',
  `more` json NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '支付方式' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_payment_option
-- ----------------------------
INSERT INTO `st_payment_option` VALUES (1, 'PayPal', '', 'paypal', 1, '{\"rate\": \"15\", \"business\": \"kaykay012-business@sina.cn\", \"currency\": \"USD\"}', NULL, '2021-08-07 19:58:38');

-- ----------------------------
-- Table structure for st_product
-- ----------------------------
DROP TABLE IF EXISTS `st_product`;
CREATE TABLE `st_product`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '产品id',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '产品标题',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '产品简介',
  `details` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '产品详情',
  `meta_keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'meta 关键字',
  `meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'meta 描述',
  `spu` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SPU',
  `sku` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'SKU',
  `stock` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '库存',
  `stock_status` int(11) NOT NULL DEFAULT 1 COMMENT '库存状态 1 有库存，2 无库存',
  `original_price` decimal(10, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '原价：元',
  `sale_price` decimal(10, 3) UNSIGNED NOT NULL DEFAULT 0.000 COMMENT '售价：元',
  `wholesale_set` json NULL COMMENT '批发设置',
  `img_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '产品封面图',
  `img_spec` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '产品规格图',
  `img_photos` json NULL COMMENT '产品相册',
  `long` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '产品长度',
  `width` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '产品宽度',
  `high` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '产品高度',
  `weight` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '重量：克',
  `volume_weight` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '体积重：克',
  `click_num` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '点击数 查看数',
  `sale_num` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '销售数量',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '状态：1 上架(显示)，2 下架(不显示)',
  `hidden` int(11) NOT NULL DEFAULT 2 COMMENT '是否强制隐藏：1 是，2 否 (如果是则在产品列表中不显示)',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '产品备注：仅后台看到',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  `related_sku` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '相关产品',
  `related_accessories_sku` varchar(999) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关配件',
  `brand_id` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '所属品牌id',
  `spec_group_id` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '规格组id',
  `is_hot` int(11) NULL DEFAULT 2 COMMENT '热卖 1 是，2 否',
  `is_new` int(11) NULL DEFAULT 2 COMMENT '新品 1 是，2 否',
  `is_recommend` int(11) NULL DEFAULT 2 COMMENT '推荐 1 是，2 否',
  `more` json NULL COMMENT '更多配置',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `sku`(`sku`) USING BTREE,
  FULLTEXT INDEX `title`(`title`)
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '产品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_product
-- ----------------------------
INSERT INTO `st_product` VALUES (1, 'Womens Mini Dress Batwing Boat Neck Long Sleeve Tunic Shift Dress Black-S', '', '<ul><li>好产品</li><li>中国造</li><li>Made In China</li></ul><p><img src=\"http://www.strongshop.local/storage/202108/i0Jwue7WMfPxSyQtpUZU0SuRTAeYpOXj9BQ2vjBQ.jpg\" alt=\"s-l1600 (10).jpg\" style=\"max-width:100%;\" contenteditable=\"false\"/></p><ul><li><br/></li></ul>', '', '', 'dress100', 'dress100-01-s', 99, 1, 28.594, 21.995, '{\"num\": [\"1\", \"5\", \"10\"], \"price\": [\"21.995\", \"19.324\", \"15.382\"]}', '/storage/202103/rx0xVDd18IOOT5sxAT7M9QAQUFCczeFJWhAz2p8g.jpg', '/storage/202103/rx0xVDd18IOOT5sxAT7M9QAQUFCczeFJWhAz2p8g.jpg', '[{\"src\": \"/storage/202103/rx0xVDd18IOOT5sxAT7M9QAQUFCczeFJWhAz2p8g.jpg\", \"title\": \"s-l1600 (9).jpg\", \"isImgSpec\": true, \"isImgCover\": true}, {\"src\": \"/storage/202103/79X5gtRNM3YDHatmgrWjCuNdJE1qPRWhRueXyXva.jpg\", \"title\": \"s-l1600 (10).jpg\", \"isImgSpec\": false, \"isImgCover\": false}]', 0, 0, 0, 1000, 0, 30, 0, 1, 2, '', '2021-03-15 15:45:05', '2021-08-11 15:09:17', NULL, 'dress100-02-m', 'dress100-02-m,tshirt100-01-xxxl', 0, 1, 1, 1, 1, '[]');
INSERT INTO `st_product` VALUES (2, 'Womens Mini Dress Batwing Boat Neck Long Sleeve Tunic Shift Dress Red-S', '', NULL, '', '', 'dress100', 'dress100-02-s', 55, 1, 55.000, 45.000, '{\"num\": [], \"price\": []}', '/storage/202103/LgLF3A9bJ8SJq0gqhrtHTrJKf7EieaxPmxulQsLF.jpg', '', '[{\"src\": \"/storage/202103/LgLF3A9bJ8SJq0gqhrtHTrJKf7EieaxPmxulQsLF.jpg\", \"title\": \"s-l1600 (4).jpg\"}, {\"src\": \"/storage/202103/kcxiKFnPGFpkiINNP1xpAtfCiOk1Vfvr4GGg9KJO.jpg\", \"title\": \"s-l1600 (5).jpg\"}]', 0, 0, 0, 630, 0, 77, 0, 1, 2, '', '2021-03-15 15:54:03', '2021-08-08 12:35:09', NULL, '', NULL, 0, 1, 1, 1, 1, NULL);
INSERT INTO `st_product` VALUES (3, 'Womens Mini Dress Batwing Boat Neck Long Sleeve Tunic Shift Dress Black-M', '', NULL, '', '', 'dress100', 'dress100-01-m', 55, 1, 78.000, 45.660, '{\"num\": [], \"price\": []}', '/storage/202103/XWeecxlCNoas5htxv6c68OzJjYwMfRZ1tQ8JoJgJ.jpg', '', '[{\"src\": \"/storage/202103/XWeecxlCNoas5htxv6c68OzJjYwMfRZ1tQ8JoJgJ.jpg\", \"title\": \"s-l1600 (10).jpg\"}]', 0, 0, 0, 0, 0, 10, 0, 1, 2, '', '2021-03-15 15:58:03', '2021-08-08 12:57:42', NULL, '', NULL, 0, 1, 1, 1, 1, NULL);
INSERT INTO `st_product` VALUES (4, 'Womens Mini Dress Batwing Boat Neck Long Sleeve Tunic Shift Dress Red-M', '', NULL, '', '', 'dress100', 'dress100-02-m', 89, 1, 67.000, 56.000, '{\"num\": [], \"price\": []}', '/storage/202103/iDxurNtiTIMbBn2Kfd9f11EM6cI3MARQv64D9qXo.jpg', '', '[{\"src\": \"/storage/202103/iDxurNtiTIMbBn2Kfd9f11EM6cI3MARQv64D9qXo.jpg\", \"title\": \"s-l1600 (5).jpg\"}]', 0, 0, 0, 200, 0, 9, 0, 1, 2, '', '2021-03-15 15:59:43', '2021-08-08 17:34:42', NULL, '', NULL, 0, 1, 1, 1, 1, NULL);
INSERT INTO `st_product` VALUES (5, 'Womens Mini Dress Batwing Boat Neck Long Sleeve Tunic Shift Dress Cappuccino-S', '', NULL, '', '', 'dress100', 'dress100-03-s', 45, 1, 55.000, 45.000, '{\"num\": [], \"price\": []}', '/storage/202103/3bYf4PWe4QpcPIFYUQ2ehpo012jT3esnEoAvHp4d.jpg', '', '[{\"src\": \"/storage/202103/3bYf4PWe4QpcPIFYUQ2ehpo012jT3esnEoAvHp4d.jpg\", \"title\": \"s-l1600 (6).jpg\"}]', 0, NULL, 0, 2000, 0, 4, 0, 1, 2, '', '2021-03-15 16:02:00', '2021-05-26 18:33:01', NULL, '', NULL, 0, 1, 1, 1, 1, NULL);
INSERT INTO `st_product` VALUES (6, 'Womens Mini Dress Batwing Boat Neck Long Sleeve Tunic Shift Dress Cappuccino-M', '', NULL, '', '', 'dress100', 'dress100-03-m', 66, 1, 78.000, 67.000, '{\"num\": [], \"price\": []}', '/storage/202103/0cNvrdjKAQWebiMU8KIiXjLVctmuyLYumoGlOgMm.jpg', '', '[{\"src\": \"/storage/202103/0cNvrdjKAQWebiMU8KIiXjLVctmuyLYumoGlOgMm.jpg\", \"title\": \"s-l1600 (7).jpg\"}]', 0, 0, 0, 500, 0, 4, 0, 1, 2, '', '2021-03-15 16:03:46', '2021-05-26 18:32:51', NULL, '', NULL, 0, 1, 1, 1, 1, NULL);
INSERT INTO `st_product` VALUES (7, 'Womens Mini Dress Batwing Boat Neck Long Sleeve Tunic Shift Dress Cappuccino-L', '', NULL, '', '', 'dress100', 'dress100-03-l', 800, 1, 90.000, 78.000, '{\"num\": [], \"price\": []}', '/storage/202103/r1g3ARlVM5bXGdSOJfnaweRNTkbWStb7dAtnS8pm.jpg', '', '[{\"src\": \"/storage/202103/r1g3ARlVM5bXGdSOJfnaweRNTkbWStb7dAtnS8pm.jpg\", \"title\": \"s-l1600 (8).jpg\"}]', 0, 0, 0, 0, 0, 3, 0, 1, 2, '', '2021-03-15 16:04:59', '2021-05-24 15:50:38', NULL, '', NULL, 0, 1, 1, 1, 1, NULL);
INSERT INTO `st_product` VALUES (8, 'womens dress gray-s', '', NULL, '', '', 'dress100', 'dress100-04-s', 89, 1, 39.000, 30.000, '{\"num\": [], \"price\": []}', '/storage/202103/cFOPjw1BzGTysSBLE9sfycpDRsMoVNCNfaA5cT8p.jpg', '', '[{\"src\": \"/storage/202103/cFOPjw1BzGTysSBLE9sfycpDRsMoVNCNfaA5cT8p.jpg\", \"title\": \"s-l1600 (2).jpg\"}, {\"src\": \"/storage/202103/nKPsH7UyVBudUzw8loCmqN1BqKjeZkTBFX4VyJQe.jpg\", \"title\": \"s-l1600 (3).jpg\"}]', 0, 0, 0, 300, 0, 7, 0, 1, 2, '', '2021-03-17 09:57:53', '2021-08-08 11:41:45', NULL, '', NULL, 0, 1, 2, 1, 2, NULL);
INSERT INTO `st_product` VALUES (9, 'womens dress gray-xxl   22222', '', NULL, '', '', 'dress100', 'dress100-04-xxl', 89, 1, 56.000, 45.000, '{\"num\": [], \"price\": []}', '/storage/202103/biUUUUjQOOMroQtM0FQSdbq9aAd0saUpKXGR26Np.jpg', '', '[{\"src\": \"/storage/202103/biUUUUjQOOMroQtM0FQSdbq9aAd0saUpKXGR26Np.jpg\", \"title\": \"s-l1600 (3).jpg\"}, {\"src\": \"/storage/202103/koCiVHGMkpAaXUSVvSlh7Sqm3BgIRwODOucMCLBg.jpg\", \"title\": \"s-l1600 (2).jpg\"}]', 0, 0, 0, 600, 0, 5, 0, 1, 2, '', '2021-03-17 09:59:03', '2021-05-24 14:11:26', NULL, '', NULL, 0, 1, 1, 1, 1, NULL);
INSERT INTO `st_product` VALUES (10, 'Cotton Valueweight Tee T-Shirt-purple-xxxl', '', NULL, '', '', 'tshirt100', 'tshirt100-01-xxxl', 678, 1, 78.000, 67.000, '{\"num\": [], \"price\": []}', '/storage/202103/uHRk5LQQ1CYfdHpVTdvqVZB1Dp0aqENC8VOsYk48.jpg', '', '[{\"src\": \"/storage/202103/uHRk5LQQ1CYfdHpVTdvqVZB1Dp0aqENC8VOsYk48.jpg\", \"title\": \"s-l1600 (2).jpg\"}]', 0, 0, 0, 0, 0, 8, 0, 1, 2, '', '2021-03-17 10:07:25', '2021-08-08 11:45:46', NULL, '', NULL, 0, 1, 1, 1, 1, NULL);
INSERT INTO `st_product` VALUES (11, 'Cotton Valueweight Tee T-Shirt-red-xxl', '', NULL, '', '', 'tshirt100', 'tshirt100-02-xxl', 4352, 1, 67.000, 45.000, '{\"num\": [], \"price\": []}', '/storage/202103/DjQu6ZQRzEWQ0FFapLxD7ZU4NYtraBHooTK2TlNr.jpg', '', '[{\"src\": \"/storage/202103/DjQu6ZQRzEWQ0FFapLxD7ZU4NYtraBHooTK2TlNr.jpg\", \"title\": \"s-l1600 (1).jpg\"}]', 0, 0, 0, 400, 0, 5, 0, 1, 2, '', '2021-03-17 10:09:29', '2021-08-08 12:35:24', NULL, '', NULL, 0, 1, 1, 1, 1, NULL);
INSERT INTO `st_product` VALUES (12, 'Cotton Valueweight Tee T-Shirt-xl', '', NULL, '', '', 'tshirt100', 'tshirt100-03-xl', 56, 1, 66.000, 34.000, '{\"num\": [], \"price\": []}', '/storage/202103/8Lk9bjhQbE7S7jm3PgePvwiGZxnZpa6owkVs8O3w.jpg', '', '[{\"src\": \"/storage/202103/8Lk9bjhQbE7S7jm3PgePvwiGZxnZpa6owkVs8O3w.jpg\", \"title\": \"s-l1600.jpg\"}]', 0, 0, 0, 0, 0, 4, 0, 1, 2, '', '2021-03-17 10:11:04', '2021-06-02 09:17:58', NULL, '', NULL, 0, 1, 1, 1, 1, NULL);
INSERT INTO `st_product` VALUES (13, 'Google Pixel 3a  phone balck-64g', '', NULL, '', '', 'phone100', 'phone100-01-64g', 56, 1, 567.000, 509.000, '{\"num\": [], \"price\": []}', '/storage/202103/jNtVfXo4gtqoV1uPJ7sSNOaT1NynCKECnv8tPlyc.jpg', '', '[{\"src\": \"/storage/202103/jNtVfXo4gtqoV1uPJ7sSNOaT1NynCKECnv8tPlyc.jpg\", \"title\": \"s-l1600.jpg\"}, {\"src\": \"/storage/202103/gr8Vzp2KsaY86cwc9B9UnpNuMAXD1ZhEJzW69Lak.jpg\", \"title\": \"s-l1600 (1).jpg\"}]', 0, 0, 0, 0, 0, 8, 0, 1, 2, '', '2021-03-17 10:20:36', '2021-08-08 12:55:45', NULL, '', NULL, 0, 2, 1, 1, 1, NULL);
INSERT INTO `st_product` VALUES (14, 'Google Pixel 3a phone balck-64g', '', NULL, '', '', 'phone100', 'phone100-01-128g', 323, 1, 567.000, 409.000, '{\"num\": [], \"price\": []}', '/storage/202103/eTZYd2Byn8i2L4mMpTeDyXGMvlBtSBdFetBqWGVH.jpg', '', '[{\"src\": \"/storage/202103/eTZYd2Byn8i2L4mMpTeDyXGMvlBtSBdFetBqWGVH.jpg\", \"title\": \"s-l1600 (3).jpg\"}, {\"src\": \"/storage/202103/002bqFGA9018uxnBSczCEi5jaOUbTLImxO2SQcvE.jpg\", \"title\": \"s-l1600 (2).jpg\"}]', 0, 0, 0, 0, 0, 3, 0, 1, 2, '', '2021-03-17 10:21:35', '2021-05-27 16:43:24', NULL, '', NULL, 0, 2, 1, 1, 1, NULL);
INSERT INTO `st_product` VALUES (15, 'Mens Jogging Gym Shoes shoes200 xxl', '', NULL, '', '', 'shoes200', 'shoes200-xxl', 55, 1, 67.000, 56.000, '{\"num\": [], \"price\": []}', '/storage/202103/pFBevDxjysJe5canNs015sPgonRSGvHmHII8o2vk.jpg', '', '[{\"src\": \"/storage/202103/pFBevDxjysJe5canNs015sPgonRSGvHmHII8o2vk.jpg\", \"title\": \"s-l1600.jpg\"}, {\"src\": \"/storage/202103/hoILL8tt2PtcBjFqrTfogIOLJEy9IETaXfRtvAnC.jpg\", \"title\": \"s-l1600 (4).jpg\"}]', 0, 0, 0, 260, 0, 2, 0, 1, 2, '', '2021-03-17 10:26:53', '2021-05-27 17:09:44', NULL, '', NULL, 0, 1, 1, 2, 2, NULL);
INSERT INTO `st_product` VALUES (16, 'Mens Jogging Gym Shoes shoes200 xxxl', '', NULL, '', '', 'shoes200', 'shoes200-xxxl', 56, 1, 67.000, 45.000, '{\"num\": [], \"price\": []}', '/storage/202103/xnEBNCd199XkWQOYqfeS7KpeHTzKh2NluWSOTdoO.jpg', '', '[{\"src\": \"/storage/202103/xnEBNCd199XkWQOYqfeS7KpeHTzKh2NluWSOTdoO.jpg\", \"title\": \"s-l1600 (1).jpg\"}, {\"src\": \"/storage/202103/ln9OACBPi9Wbf5JZMr3tyW4JmAQKz3OlD9BaY0JI.jpg\", \"title\": \"s-l1600 (2).jpg\"}]', 0, 0, 0, 350, 0, 0, 0, 1, 2, '', '2021-03-17 10:27:55', '2021-05-24 14:11:00', NULL, '', NULL, 0, 1, 1, 1, 1, NULL);
INSERT INTO `st_product` VALUES (17, 'Mens Jogging Gym Shoes shoes200 xl', '', NULL, '', '', 'shoes200', 'shoes200-xl', 45, 1, 67.000, 55.000, '{\"num\": [\"1\", \"5\", \"10\"], \"price\": [\"55\", \"44\", \"33.21\"]}', '/storage/202103/R5EPkzwid5eY5iZOH4erUvUGIg0zrTFDEycOUnyc.jpg', '', '[{\"src\": \"/storage/202103/R5EPkzwid5eY5iZOH4erUvUGIg0zrTFDEycOUnyc.jpg\", \"title\": \"s-l1600 (3).jpg\"}]', 0, 0, 0, 500, 0, 14, 0, 1, 2, '', '2021-03-17 10:28:55', '2021-05-26 15:29:33', NULL, '', NULL, 0, 1, 1, 1, 1, NULL);
INSERT INTO `st_product` VALUES (18, 'HP NoteBook Pro 14 Inch Laptop, 12GB RAM, 256GB SSD, Windows 10 Home, Intel computer notebook', '', NULL, '', '', 'computer100', 'computer100-i5', 66, 1, 789.000, 678.000, '{\"num\": [], \"price\": []}', '/storage/202103/P4yNh7Yxwihhanw3F9CYznXIroArgxLwYzlcBdpC.jpg', '', '[{\"src\": \"/storage/202103/P4yNh7Yxwihhanw3F9CYznXIroArgxLwYzlcBdpC.jpg\", \"title\": \"s-l500.jpg\"}]', 0, 0, 0, 2000, 0, 3, 0, 1, 2, '', '2021-03-18 11:18:59', '2021-06-02 13:45:34', NULL, '', NULL, 0, 3, 1, 1, 1, NULL);
INSERT INTO `st_product` VALUES (19, 'Computer PC Notebook i7', '', NULL, '', '', 'computer100', 'computer100-i7', 45, 1, 8.610, 6.920, '{\"num\": [], \"price\": []}', '/storage/202103/ZnSdcrojCxu2OfDPPDakN7AOJiOKSJnlZOUuHu9r.jpg', '', '[{\"src\": \"/storage/202103/ZnSdcrojCxu2OfDPPDakN7AOJiOKSJnlZOUuHu9r.jpg\", \"title\": \"s-l500 (1).jpg\"}]', 0, 0, 0, 1500, 0, 2, 0, 1, 2, '', '2021-03-18 11:21:22', '2021-05-27 16:48:13', NULL, '', NULL, 0, 3, 1, 1, 1, NULL);
INSERT INTO `st_product` VALUES (20, 'apple ipad 64g 111', '', NULL, '', '', 'ipad', 'ipad01', 23, 1, 456.000, 236.000, '{\"num\": [], \"price\": []}', '/storage/202103/nR8HrdtiK5izffyeNGN9iggj6TrWd5CDAafOB4t9.jpg', '', '[{\"src\": \"/storage/202103/nR8HrdtiK5izffyeNGN9iggj6TrWd5CDAafOB4t9.jpg\", \"title\": \"s-l500 (2).jpg\"}]', 2, 3, 0, 15, 0, 3, 0, 1, 2, '', '2021-03-18 11:27:57', '2021-05-24 17:31:24', NULL, '', NULL, 0, 4, 1, 1, 1, NULL);
INSERT INTO `st_product` VALUES (21, 'Hua Wei Pad 128g 1111', '', '<p>New Test</p><p>Good Value<img src=\"/storage/202105/gPTcTdFuL3BuTPeZwHZ24yCfVAY0PT7qImCqfJRP.png\" alt=\"QQ截图20210512111930.png\"><br></p>', '', '', 'ipad', 'ipad02', 453, 1, 23.670, 22.290, '{\"num\": [\"1\", \"30\", \"50\"], \"price\": [\"23.67\", \"22.8\", \"19.8\"]}', '/storage/202103/V1B5uPDtERa5GRJ4xBe5izcNE2xlWMhP3oQKKg0e.png', '', '[{\"src\": \"/storage/202103/V1B5uPDtERa5GRJ4xBe5izcNE2xlWMhP3oQKKg0e.png\", \"title\": \"s-l1600.png\"}, {\"src\": \"/storage/202105/7QmyeF8C1NTzOAd3ob7rcgGRfOkPKXEvoXLMfCJY.png\", \"title\": \"QQ截图20210512111750.png\"}]', 0, 0, 0, 200, 0, 2, 0, 1, 2, '', '2021-03-18 11:29:13', '2021-05-25 12:59:46', NULL, '', NULL, 0, 4, 2, 2, 2, NULL);

-- ----------------------------
-- Table structure for st_product_category
-- ----------------------------
DROP TABLE IF EXISTS `st_product_category`;
CREATE TABLE `st_product_category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '产品-分类 关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_product_category
-- ----------------------------
INSERT INTO `st_product_category` VALUES (1, 1, 5);
INSERT INTO `st_product_category` VALUES (2, 1, 6);
INSERT INTO `st_product_category` VALUES (3, 1, 9);
INSERT INTO `st_product_category` VALUES (4, 2, 5);
INSERT INTO `st_product_category` VALUES (5, 2, 6);
INSERT INTO `st_product_category` VALUES (6, 2, 9);
INSERT INTO `st_product_category` VALUES (7, 3, 5);
INSERT INTO `st_product_category` VALUES (8, 3, 6);
INSERT INTO `st_product_category` VALUES (9, 3, 9);
INSERT INTO `st_product_category` VALUES (10, 4, 5);
INSERT INTO `st_product_category` VALUES (11, 4, 6);
INSERT INTO `st_product_category` VALUES (12, 4, 9);
INSERT INTO `st_product_category` VALUES (13, 5, 5);
INSERT INTO `st_product_category` VALUES (14, 5, 6);
INSERT INTO `st_product_category` VALUES (15, 5, 9);
INSERT INTO `st_product_category` VALUES (16, 6, 5);
INSERT INTO `st_product_category` VALUES (17, 6, 6);
INSERT INTO `st_product_category` VALUES (18, 6, 9);
INSERT INTO `st_product_category` VALUES (19, 7, 5);
INSERT INTO `st_product_category` VALUES (20, 7, 6);
INSERT INTO `st_product_category` VALUES (21, 7, 9);
INSERT INTO `st_product_category` VALUES (22, 8, 5);
INSERT INTO `st_product_category` VALUES (23, 8, 6);
INSERT INTO `st_product_category` VALUES (24, 8, 9);
INSERT INTO `st_product_category` VALUES (25, 9, 5);
INSERT INTO `st_product_category` VALUES (26, 9, 6);
INSERT INTO `st_product_category` VALUES (27, 9, 9);
INSERT INTO `st_product_category` VALUES (28, 10, 14);
INSERT INTO `st_product_category` VALUES (29, 10, 15);
INSERT INTO `st_product_category` VALUES (30, 10, 24);
INSERT INTO `st_product_category` VALUES (31, 11, 14);
INSERT INTO `st_product_category` VALUES (32, 11, 15);
INSERT INTO `st_product_category` VALUES (33, 11, 24);
INSERT INTO `st_product_category` VALUES (34, 12, 14);
INSERT INTO `st_product_category` VALUES (35, 12, 15);
INSERT INTO `st_product_category` VALUES (36, 12, 24);
INSERT INTO `st_product_category` VALUES (37, 13, 1);
INSERT INTO `st_product_category` VALUES (38, 13, 3);
INSERT INTO `st_product_category` VALUES (39, 14, 1);
INSERT INTO `st_product_category` VALUES (40, 14, 3);
INSERT INTO `st_product_category` VALUES (41, 15, 14);
INSERT INTO `st_product_category` VALUES (42, 15, 16);
INSERT INTO `st_product_category` VALUES (43, 15, 28);
INSERT INTO `st_product_category` VALUES (44, 16, 14);
INSERT INTO `st_product_category` VALUES (45, 16, 16);
INSERT INTO `st_product_category` VALUES (46, 16, 28);
INSERT INTO `st_product_category` VALUES (47, 17, 14);
INSERT INTO `st_product_category` VALUES (48, 17, 16);
INSERT INTO `st_product_category` VALUES (49, 17, 26);
INSERT INTO `st_product_category` VALUES (50, 18, 1);
INSERT INTO `st_product_category` VALUES (51, 18, 2);
INSERT INTO `st_product_category` VALUES (52, 19, 1);
INSERT INTO `st_product_category` VALUES (53, 19, 2);
INSERT INTO `st_product_category` VALUES (54, 20, 1);
INSERT INTO `st_product_category` VALUES (55, 20, 4);
INSERT INTO `st_product_category` VALUES (56, 21, 1);
INSERT INTO `st_product_category` VALUES (57, 21, 4);
INSERT INTO `st_product_category` VALUES (58, 22, 1);
INSERT INTO `st_product_category` VALUES (59, 22, 2);
INSERT INTO `st_product_category` VALUES (60, 22, 3);
INSERT INTO `st_product_category` VALUES (61, 22, 4);

-- ----------------------------
-- Table structure for st_product_spec
-- ----------------------------
DROP TABLE IF EXISTS `st_product_spec`;
CREATE TABLE `st_product_spec`  (
  `product_id` int(11) NOT NULL DEFAULT 0 COMMENT '产品id',
  `spec_id` int(11) NOT NULL DEFAULT 0 COMMENT '规格id',
  `spec_type` int(11) NOT NULL DEFAULT 1 COMMENT '规格类型：1 价格规格，2 普通规格',
  `spec_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '规格值',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_product_spec
-- ----------------------------
INSERT INTO `st_product_spec` VALUES (1, 1, 1, 'Black', '2021-03-15 15:50:39', '2021-03-15 16:02:13');
INSERT INTO `st_product_spec` VALUES (1, 2, 1, 'S', '2021-03-15 15:50:39', '2021-03-15 16:02:13');
INSERT INTO `st_product_spec` VALUES (2, 1, 1, 'Red', '2021-03-15 15:54:03', '2021-03-15 16:02:21');
INSERT INTO `st_product_spec` VALUES (2, 2, 1, 'S', '2021-03-15 15:54:03', '2021-03-15 16:02:21');
INSERT INTO `st_product_spec` VALUES (3, 1, 1, 'Black', '2021-03-15 15:58:03', '2021-03-15 15:58:03');
INSERT INTO `st_product_spec` VALUES (3, 2, 1, 'M', '2021-03-15 15:58:03', '2021-03-15 15:58:03');
INSERT INTO `st_product_spec` VALUES (4, 1, 1, 'Red', '2021-03-15 15:59:43', '2021-03-15 16:02:33');
INSERT INTO `st_product_spec` VALUES (4, 2, 1, 'M', '2021-03-15 15:59:43', '2021-03-15 16:02:33');
INSERT INTO `st_product_spec` VALUES (5, 1, 1, 'Cappuccino', '2021-03-15 16:02:00', '2021-03-15 16:02:00');
INSERT INTO `st_product_spec` VALUES (5, 2, 1, 'S', '2021-03-15 16:02:00', '2021-03-15 16:02:00');
INSERT INTO `st_product_spec` VALUES (6, 1, 1, 'Cappuccino', '2021-03-15 16:03:47', '2021-03-15 16:03:47');
INSERT INTO `st_product_spec` VALUES (6, 2, 1, 'M', '2021-03-15 16:03:47', '2021-03-15 16:03:47');
INSERT INTO `st_product_spec` VALUES (7, 1, 1, 'Cappuccino', '2021-03-15 16:04:59', '2021-03-15 16:04:59');
INSERT INTO `st_product_spec` VALUES (7, 2, 1, 'L', '2021-03-15 16:04:59', '2021-03-15 16:04:59');
INSERT INTO `st_product_spec` VALUES (8, 1, 1, 'Ashen', '2021-03-17 09:57:53', '2021-03-17 09:57:53');
INSERT INTO `st_product_spec` VALUES (8, 2, 1, 'S', '2021-03-17 09:57:53', '2021-03-17 09:57:53');
INSERT INTO `st_product_spec` VALUES (9, 1, 1, 'Ashen', '2021-03-17 09:59:03', '2021-03-17 09:59:20');
INSERT INTO `st_product_spec` VALUES (9, 2, 1, 'XXL', '2021-03-17 09:59:03', '2021-03-17 09:59:20');
INSERT INTO `st_product_spec` VALUES (10, 1, 1, 'Purple', '2021-03-17 10:07:25', '2021-03-17 10:11:40');
INSERT INTO `st_product_spec` VALUES (10, 2, 1, 'XXXL', '2021-03-17 10:07:25', '2021-03-17 10:11:40');
INSERT INTO `st_product_spec` VALUES (11, 1, 1, 'Red', '2021-03-17 10:09:30', '2021-03-17 10:11:52');
INSERT INTO `st_product_spec` VALUES (11, 2, 1, 'XXL', '2021-03-17 10:09:30', '2021-03-17 10:11:52');
INSERT INTO `st_product_spec` VALUES (12, 1, 1, 'Black', '2021-03-17 10:11:04', '2021-03-17 10:12:02');
INSERT INTO `st_product_spec` VALUES (12, 2, 1, 'XL', '2021-03-17 10:11:04', '2021-03-17 10:12:02');
INSERT INTO `st_product_spec` VALUES (13, 3, 1, 'Black', '2021-03-17 10:20:36', '2021-03-17 10:20:36');
INSERT INTO `st_product_spec` VALUES (13, 4, 1, '64g', '2021-03-17 10:20:36', '2021-03-17 10:20:36');
INSERT INTO `st_product_spec` VALUES (14, 3, 1, 'White', '2021-03-17 10:21:35', '2021-03-17 10:21:35');
INSERT INTO `st_product_spec` VALUES (14, 4, 1, '128g', '2021-03-17 10:21:35', '2021-03-17 10:21:35');
INSERT INTO `st_product_spec` VALUES (15, 1, 1, 'Black', '2021-03-17 10:26:53', '2021-03-17 10:26:53');
INSERT INTO `st_product_spec` VALUES (15, 2, 1, 'XXL', '2021-03-17 10:26:53', '2021-03-17 10:26:53');
INSERT INTO `st_product_spec` VALUES (16, 1, 1, 'Blue', '2021-03-17 10:27:55', '2021-03-17 10:27:55');
INSERT INTO `st_product_spec` VALUES (16, 2, 1, 'XXXL', '2021-03-17 10:27:55', '2021-03-17 10:27:55');
INSERT INTO `st_product_spec` VALUES (17, 1, 1, 'Red', '2021-03-17 10:28:55', '2021-03-17 12:42:28');
INSERT INTO `st_product_spec` VALUES (17, 2, 1, 'XL', '2021-03-17 10:28:55', '2021-03-17 12:42:28');
INSERT INTO `st_product_spec` VALUES (18, 5, 1, 'i5', NULL, NULL);
INSERT INTO `st_product_spec` VALUES (19, 5, 1, 'i7', NULL, NULL);
INSERT INTO `st_product_spec` VALUES (20, 6, 1, 'silver', NULL, NULL);
INSERT INTO `st_product_spec` VALUES (20, 7, 1, '64g', NULL, NULL);
INSERT INTO `st_product_spec` VALUES (20, 8, 1, 'apple', NULL, NULL);
INSERT INTO `st_product_spec` VALUES (247, 1, 1, 'Red', NULL, NULL);
INSERT INTO `st_product_spec` VALUES (247, 2, 1, 'S', NULL, NULL);
INSERT INTO `st_product_spec` VALUES (247, 9, 2, '', NULL, NULL);
INSERT INTO `st_product_spec` VALUES (245, 1, 1, 'Black', NULL, NULL);
INSERT INTO `st_product_spec` VALUES (245, 2, 1, 'S', NULL, NULL);
INSERT INTO `st_product_spec` VALUES (245, 9, 2, '', NULL, NULL);
INSERT INTO `st_product_spec` VALUES (490, 1, 1, 'Graphite', NULL, NULL);
INSERT INTO `st_product_spec` VALUES (490, 2, 1, 'S', NULL, NULL);
INSERT INTO `st_product_spec` VALUES (490, 9, 2, '', NULL, NULL);
INSERT INTO `st_product_spec` VALUES (489, 1, 1, 'Cappuccino', NULL, NULL);
INSERT INTO `st_product_spec` VALUES (489, 2, 1, 'M', NULL, NULL);
INSERT INTO `st_product_spec` VALUES (489, 9, 2, '', NULL, NULL);
INSERT INTO `st_product_spec` VALUES (487, 1, 1, 'Black', NULL, NULL);
INSERT INTO `st_product_spec` VALUES (487, 2, 1, 'M', NULL, NULL);
INSERT INTO `st_product_spec` VALUES (487, 9, 2, '', NULL, NULL);
INSERT INTO `st_product_spec` VALUES (1, 9, 2, '', NULL, NULL);

-- ----------------------------
-- Table structure for st_region_city
-- ----------------------------
DROP TABLE IF EXISTS `st_region_city`;
CREATE TABLE `st_region_city`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `country` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `city_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cn_city` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cn_state` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cn_country` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `country_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11362 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_region_city
-- ----------------------------
INSERT INTO `st_region_city` VALUES (6143, 'Albania', NULL, 'Elbasan', NULL, 'EL', '爱尔巴桑', NULL, '阿尔巴尼亚', 'ALB');
INSERT INTO `st_region_city` VALUES (6144, 'Albania', NULL, 'Diber', NULL, 'DI', '迪勃拉', NULL, '阿尔巴尼亚', 'ALB');
INSERT INTO `st_region_city` VALUES (6145, 'Albania', NULL, 'Tirane', NULL, 'TR', '地拉那', NULL, '阿尔巴尼亚', 'ALB');
INSERT INTO `st_region_city` VALUES (6146, 'Albania', NULL, 'Durres', NULL, 'DR', '都拉斯', NULL, '阿尔巴尼亚', 'ALB');
INSERT INTO `st_region_city` VALUES (6147, 'Albania', NULL, 'Vlore', NULL, 'VL', '发罗拉', NULL, '阿尔巴尼亚', 'ALB');
INSERT INTO `st_region_city` VALUES (6148, 'Albania', NULL, 'Fier', NULL, 'FR', '费里', NULL, '阿尔巴尼亚', 'ALB');
INSERT INTO `st_region_city` VALUES (6149, 'Albania', NULL, 'Gjirokaster', NULL, 'GJ', '吉诺卡斯特', NULL, '阿尔巴尼亚', 'ALB');
INSERT INTO `st_region_city` VALUES (6150, 'Albania', NULL, 'Korce', NULL, 'KO', '科尔察', NULL, '阿尔巴尼亚', 'ALB');
INSERT INTO `st_region_city` VALUES (6151, 'Albania', NULL, 'Kukes', NULL, 'KU', '库克斯', NULL, '阿尔巴尼亚', 'ALB');
INSERT INTO `st_region_city` VALUES (6152, 'Albania', NULL, 'Lezhe', NULL, 'LE', '莱什', NULL, '阿尔巴尼亚', 'ALB');
INSERT INTO `st_region_city` VALUES (6153, 'Albania', NULL, 'Berat', NULL, 'BR', '培拉特', NULL, '阿尔巴尼亚', 'ALB');
INSERT INTO `st_region_city` VALUES (6154, 'Albania', NULL, 'Shkoder', NULL, 'SH', '斯库台', NULL, '阿尔巴尼亚', 'ALB');
INSERT INTO `st_region_city` VALUES (6155, 'Algeria', NULL, 'Adrar', NULL, 'ADR', '阿德拉尔', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6156, 'Algeria', NULL, 'Alger', NULL, 'ALG', '阿尔及尔', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6157, 'Algeria', NULL, 'Ain Defla', NULL, 'ADE', '艾因·德夫拉', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6158, 'Algeria', NULL, 'Ain Temouchent', NULL, 'ATE', '艾因·蒂姆尚特', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6159, 'Algeria', NULL, 'Annaba', NULL, 'AAE', '安纳巴', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6160, 'Algeria', NULL, 'Oran', NULL, 'ORA', '奥兰', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6161, 'Algeria', NULL, 'Batna', NULL, 'BAT', '巴特纳', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6162, 'Algeria', NULL, 'Bejaia', NULL, 'BJA', '贝贾亚', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6163, 'Algeria', NULL, 'Bechar', NULL, 'BEC', '贝沙尔', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6164, 'Algeria', NULL, 'El Bayadh', NULL, 'EBA', '贝伊德', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6165, 'Algeria', NULL, 'Biskra', NULL, 'BIS', '比斯克拉', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6166, 'Algeria', NULL, 'Bordj Bou Arreridj', NULL, 'BOR', '布尔吉·布阿雷里吉', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6167, 'Algeria', NULL, 'Blida', NULL, 'BLI', '布利达', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6168, 'Algeria', NULL, 'Boumerdes', NULL, 'BOU', '布迈德斯', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6169, 'Algeria', NULL, 'Bouira', NULL, 'BOA', '布依拉', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6170, 'Algeria', NULL, 'Tipaza', NULL, 'TIP', '蒂巴扎', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6171, 'Algeria', NULL, 'Tissemsilt', NULL, 'TIS', '蒂斯姆西勒特', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6172, 'Algeria', NULL, 'Ghardaia', NULL, 'GHA', '盖尔达耶', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6173, 'Algeria', NULL, 'Guelma', NULL, 'GUE', '盖尔马', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6174, 'Algeria', NULL, 'Khenchela', NULL, 'KHE', '罕西拉', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6175, 'Algeria', NULL, 'Relizane', NULL, 'REL', '赫利赞', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6176, 'Algeria', NULL, 'Jijel', NULL, 'JIJ', '吉杰尔', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6177, 'Algeria', NULL, 'Djelfa', NULL, 'DJE', '杰勒法', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6178, 'Algeria', NULL, 'Constantine', NULL, 'CZL', '君士坦丁', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6179, 'Algeria', NULL, 'Laghouat', NULL, 'LAG', '拉格瓦特', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6180, 'Algeria', NULL, 'Mascara', NULL, 'MUA', '马斯卡拉', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6181, 'Algeria', NULL, 'Medea', NULL, 'MED', '麦迪亚', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6182, 'Algeria', NULL, 'Mila', NULL, 'MIL', '密拉', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6183, 'Algeria', NULL, 'Mostaganem', NULL, 'MOS', '莫斯塔加纳姆', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6184, 'Algeria', NULL, 'Msila', NULL, 'MSI', '姆西拉', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6185, 'Algeria', NULL, 'Naama', NULL, 'NAA', '纳阿马', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6186, 'Algeria', NULL, 'Setif', NULL, 'SET', '塞蒂夫', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6187, 'Algeria', NULL, 'Saida', NULL, 'SAI', '赛伊达', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6188, 'Algeria', NULL, 'Skikda', NULL, 'SKI', '斯基克达', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6189, 'Algeria', NULL, 'Souk Ahras', NULL, 'SAH', '苏克·阿赫拉斯', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6190, 'Algeria', NULL, 'El Tarf', NULL, 'ETA', '塔里夫', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6191, 'Algeria', NULL, 'Tamanghasset', NULL, 'TAM', '塔曼拉塞特', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6192, 'Algeria', NULL, 'Tebessa', NULL, 'TEB', '特贝萨', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6193, 'Algeria', NULL, 'Tlemcen', NULL, 'TLE', '特莱姆森', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6194, 'Algeria', NULL, 'Tizi Ouzou', NULL, 'IOU', '提济乌祖', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6195, 'Algeria', NULL, 'Tiaret', NULL, 'TIA', '提亚雷特', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6196, 'Algeria', NULL, 'Tindouf', NULL, 'TIN', '廷杜夫', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6197, 'Algeria', NULL, 'El Oued', NULL, 'EOU', '瓦德', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6198, 'Algeria', NULL, 'Ouargla', NULL, 'OUA', '瓦尔格拉', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6199, 'Algeria', NULL, 'Oum el Bouaghi', NULL, 'OEB', '乌姆布阿基', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6200, 'Algeria', NULL, 'Sidi Bel Abbes', NULL, 'SBA', '西迪贝勒阿贝斯', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6201, 'Algeria', NULL, 'Chlef', NULL, 'CHL', '谢里夫', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6202, 'Algeria', NULL, 'Illizi', NULL, 'ILL', '伊利齐', NULL, '阿尔及利亚', 'DZA');
INSERT INTO `st_region_city` VALUES (6203, 'Afghanistan', NULL, 'Herat', NULL, 'HEA', '赫拉特', NULL, '阿富汗', 'AFG');
INSERT INTO `st_region_city` VALUES (6204, 'Afghanistan', NULL, 'Kabul', NULL, 'KBL', '喀布尔', NULL, '阿富汗', 'AFG');
INSERT INTO `st_region_city` VALUES (6205, 'Afghanistan', NULL, 'Kandahar', NULL, 'KDH', '坎大哈', NULL, '阿富汗', 'AFG');
INSERT INTO `st_region_city` VALUES (6206, 'Afghanistan', NULL, 'Mazar-i Sharif', NULL, 'MZR', '马扎里沙里夫', NULL, '阿富汗', 'AFG');
INSERT INTO `st_region_city` VALUES (6207, 'Argentina', NULL, 'Parana', NULL, 'PRA', '巴拉那', NULL, '阿根廷', 'ARG');
INSERT INTO `st_region_city` VALUES (6208, 'Argentina', NULL, 'Viedma', NULL, 'VDM', '别德马', NULL, '阿根廷', 'ARG');
INSERT INTO `st_region_city` VALUES (6209, 'Argentina', NULL, 'Posadas', NULL, 'PSS', '波萨达斯', NULL, '阿根廷', 'ARG');
INSERT INTO `st_region_city` VALUES (6210, 'Argentina', NULL, 'Bahia Blanca', NULL, 'BHI', '布兰卡港', NULL, '阿根廷', 'ARG');
INSERT INTO `st_region_city` VALUES (6211, 'Argentina', NULL, 'Buenos Aires', NULL, 'BUE', '布宜诺斯艾利斯', NULL, '阿根廷', 'ARG');
INSERT INTO `st_region_city` VALUES (6212, 'Argentina', NULL, 'Formosa', NULL, 'FMA', '福莫萨', NULL, '阿根廷', 'ARG');
INSERT INTO `st_region_city` VALUES (6213, 'Argentina', NULL, 'Jujuy', NULL, 'JUJ', '胡胡伊', NULL, '阿根廷', 'ARG');
INSERT INTO `st_region_city` VALUES (6214, 'Argentina', NULL, 'Catamarca', NULL, 'CTC', '卡塔马卡', NULL, '阿根廷', 'ARG');
INSERT INTO `st_region_city` VALUES (6215, 'Argentina', NULL, 'Cordoba', NULL, 'COR', '科尔多瓦', NULL, '阿根廷', 'ARG');
INSERT INTO `st_region_city` VALUES (6216, 'Argentina', NULL, 'Corrientes', NULL, 'CNQ', '科连特斯', NULL, '阿根廷', 'ARG');
INSERT INTO `st_region_city` VALUES (6217, 'Argentina', NULL, 'Villa Krause', NULL, 'VLK', '克劳斯城', NULL, '阿根廷', 'ARG');
INSERT INTO `st_region_city` VALUES (6218, 'Argentina', NULL, 'Concordia', NULL, 'COC', '肯考迪娅', NULL, '阿根廷', 'ARG');
INSERT INTO `st_region_city` VALUES (6219, 'Argentina', NULL, 'La Rioja', NULL, 'IRJ', '拉里奥哈', NULL, '阿根廷', 'ARG');
INSERT INTO `st_region_city` VALUES (6220, 'Argentina', NULL, 'La Plata', NULL, 'LPG', '拉普拉塔', NULL, '阿根廷', 'ARG');
INSERT INTO `st_region_city` VALUES (6221, 'Argentina', NULL, 'Resistencia', NULL, 'RES', '雷西斯滕匹亚', NULL, '阿根廷', 'ARG');
INSERT INTO `st_region_city` VALUES (6222, 'Argentina', NULL, 'Rio Gallegos', NULL, 'RGL', '里奥加耶戈斯', NULL, '阿根廷', 'ARG');
INSERT INTO `st_region_city` VALUES (6223, 'Argentina', NULL, 'Rio Cuarto', NULL, 'RCU', '里奥夸尔托', NULL, '阿根廷', 'ARG');
INSERT INTO `st_region_city` VALUES (6224, 'Argentina', NULL, 'Comodoro Rivadavia', NULL, 'CRD', '里瓦达维亚海军准将城', NULL, '阿根廷', 'ARG');
INSERT INTO `st_region_city` VALUES (6225, 'Argentina', NULL, 'Rosario', NULL, 'ROS', '罗萨里奥', NULL, '阿根廷', 'ARG');
INSERT INTO `st_region_city` VALUES (6226, 'Argentina', NULL, 'Rawson', NULL, 'RWO', '罗森', NULL, '阿根廷', 'ARG');
INSERT INTO `st_region_city` VALUES (6227, 'Argentina', NULL, 'Mar del Plata', NULL, 'MDQ', '马德普拉塔', NULL, '阿根廷', 'ARG');
INSERT INTO `st_region_city` VALUES (6228, 'Argentina', NULL, 'Mendoza', NULL, 'MDZ', '门多萨', NULL, '阿根廷', 'ARG');
INSERT INTO `st_region_city` VALUES (6229, 'Argentina', NULL, 'Neuquen', NULL, 'NQN', '内乌肯', NULL, '阿根廷', 'ARG');
INSERT INTO `st_region_city` VALUES (6230, 'Argentina', NULL, 'Salta', NULL, 'SLA', '萨尔塔', NULL, '阿根廷', 'ARG');
INSERT INTO `st_region_city` VALUES (6231, 'Argentina', NULL, 'Santiago del Estero', NULL, 'SDE', '圣地亚哥-德尔埃斯特罗', NULL, '阿根廷', 'ARG');
INSERT INTO `st_region_city` VALUES (6232, 'Argentina', NULL, 'Santa Fe', NULL, 'SFN', '圣菲', NULL, '阿根廷', 'ARG');
INSERT INTO `st_region_city` VALUES (6233, 'Argentina', NULL, 'San Juan', NULL, 'UAQ', '圣胡安', NULL, '阿根廷', 'ARG');
INSERT INTO `st_region_city` VALUES (6234, 'Argentina', NULL, 'San Rafael', NULL, 'AFA', '圣拉斐尔', NULL, '阿根廷', 'ARG');
INSERT INTO `st_region_city` VALUES (6235, 'Argentina', NULL, 'San Luis', NULL, 'LUQ', '圣路易斯', NULL, '阿根廷', 'ARG');
INSERT INTO `st_region_city` VALUES (6236, 'Argentina', NULL, 'Santa Rosa', NULL, 'RSA', '圣罗莎', NULL, '阿根廷', 'ARG');
INSERT INTO `st_region_city` VALUES (6237, 'Argentina', NULL, 'San Miguel de Tucuman', NULL, 'SMC', '圣米格尔-德图库曼', NULL, '阿根廷', 'ARG');
INSERT INTO `st_region_city` VALUES (6238, 'Argentina', NULL, 'San Nicolas', NULL, 'SNS', '圣尼古拉斯', NULL, '阿根廷', 'ARG');
INSERT INTO `st_region_city` VALUES (6239, 'Argentina', NULL, 'Trelew', NULL, 'REL', '特雷利乌', NULL, '阿根廷', 'ARG');
INSERT INTO `st_region_city` VALUES (6240, 'Argentina', NULL, 'Ushuaia', NULL, 'USH', '乌斯怀亚', NULL, '阿根廷', 'ARG');
INSERT INTO `st_region_city` VALUES (6241, 'United Arab Emirates', NULL, 'Abu Dhabi', NULL, 'AZ', '阿布扎比', NULL, '阿拉伯联合酋长国', 'ARE');
INSERT INTO `st_region_city` VALUES (6242, 'United Arab Emirates', NULL, 'Al l\'Ayn', NULL, 'AL', '艾因', NULL, '阿拉伯联合酋长国', 'ARE');
INSERT INTO `st_region_city` VALUES (6243, 'United Arab Emirates', NULL, 'Dubai', NULL, 'DU', '迪拜', NULL, '阿拉伯联合酋长国', 'ARE');
INSERT INTO `st_region_city` VALUES (6244, 'United Arab Emirates', NULL, 'Ash Shariqah', NULL, 'SH', '沙迦', NULL, '阿拉伯联合酋长国', 'ARE');
INSERT INTO `st_region_city` VALUES (6245, 'Oman', NULL, 'Al-Batinah', NULL, 'BA', '巴提奈地区', NULL, '阿曼', 'OMN');
INSERT INTO `st_region_city` VALUES (6246, 'Oman', NULL, 'Az-Zahirah', NULL, 'ZA', '达希莱地区', NULL, '阿曼', 'OMN');
INSERT INTO `st_region_city` VALUES (6247, 'Oman', NULL, 'Ash-Sharqiyah', NULL, 'SH', '东部地区', NULL, '阿曼', 'OMN');
INSERT INTO `st_region_city` VALUES (6248, 'Oman', NULL, 'Masqat', NULL, 'MA', '马斯喀特省', NULL, '阿曼', 'OMN');
INSERT INTO `st_region_city` VALUES (6249, 'Oman', NULL, 'Musandam', NULL, 'MU', '穆桑达姆省', NULL, '阿曼', 'OMN');
INSERT INTO `st_region_city` VALUES (6250, 'Oman', NULL, 'Ad-Dakhiliyah', NULL, 'DA', '内地地区', NULL, '阿曼', 'OMN');
INSERT INTO `st_region_city` VALUES (6251, 'Oman', NULL, 'Al-Wusta', NULL, 'WU', '中部地区', NULL, '阿曼', 'OMN');
INSERT INTO `st_region_city` VALUES (6252, 'Oman', NULL, 'Zufar', NULL, 'ZU', '佐法尔省', NULL, '阿曼', 'OMN');
INSERT INTO `st_region_city` VALUES (6253, 'Azerbaijan', NULL, 'Abseron', NULL, 'ABS', '阿布歇隆', NULL, '阿塞拜疆', 'AZE');
INSERT INTO `st_region_city` VALUES (6254, 'Azerbaijan', NULL, 'Xacmaz', NULL, 'XAC', '哈奇马斯', NULL, '阿塞拜疆', 'AZE');
INSERT INTO `st_region_city` VALUES (6255, 'Azerbaijan', NULL, 'Kalbacar', NULL, 'KAL', '卡尔巴卡尔', NULL, '阿塞拜疆', 'AZE');
INSERT INTO `st_region_city` VALUES (6256, 'Azerbaijan', NULL, 'Qazax', NULL, 'QAZ', '卡扎赫', NULL, '阿塞拜疆', 'AZE');
INSERT INTO `st_region_city` VALUES (6257, 'Azerbaijan', NULL, 'Lankaran', NULL, 'LAN', '连科兰', NULL, '阿塞拜疆', 'AZE');
INSERT INTO `st_region_city` VALUES (6258, 'Azerbaijan', NULL, 'Mil-Qarabax', NULL, 'MQA', '密尔-卡拉巴赫', NULL, '阿塞拜疆', 'AZE');
INSERT INTO `st_region_city` VALUES (6259, 'Azerbaijan', NULL, 'Mugan-Salyan', NULL, 'MSA', '穆甘-萨连', NULL, '阿塞拜疆', 'AZE');
INSERT INTO `st_region_city` VALUES (6260, 'Azerbaijan', NULL, 'Nagorni-Qarabax', NULL, 'NQA', '纳戈尔诺－卡拉巴赫', NULL, '阿塞拜疆', 'AZE');
INSERT INTO `st_region_city` VALUES (6261, 'Azerbaijan', NULL, 'Naxcivan', NULL, 'NX', '纳希切万', NULL, '阿塞拜疆', 'AZE');
INSERT INTO `st_region_city` VALUES (6262, 'Azerbaijan', NULL, 'Priaraks', NULL, 'PRI', '普利亚拉克斯', NULL, '阿塞拜疆', 'AZE');
INSERT INTO `st_region_city` VALUES (6263, 'Azerbaijan', NULL, 'Saki', NULL, 'SA', '舍基', NULL, '阿塞拜疆', 'AZE');
INSERT INTO `st_region_city` VALUES (6264, 'Azerbaijan', NULL, 'Sumqayit', NULL, 'SMC', '苏姆盖特', NULL, '阿塞拜疆', 'AZE');
INSERT INTO `st_region_city` VALUES (6265, 'Azerbaijan', NULL, 'Sirvan', NULL, 'SIR', '锡尔万', NULL, '阿塞拜疆', 'AZE');
INSERT INTO `st_region_city` VALUES (6266, 'Azerbaijan', NULL, 'Ganca', NULL, 'GA', '占贾', NULL, '阿塞拜疆', 'AZE');
INSERT INTO `st_region_city` VALUES (6267, 'Egypt', NULL, 'Aswan', NULL, 'ASW', '阿斯旺', NULL, '埃及', 'EGY');
INSERT INTO `st_region_city` VALUES (6268, 'Egypt', NULL, 'Al Ghurdaqah', NULL, 'GBY', '古尔代盖', NULL, '埃及', 'EGY');
INSERT INTO `st_region_city` VALUES (6269, 'Egypt', NULL, 'Cairo', NULL, 'CAI', '开罗', NULL, '埃及', 'EGY');
INSERT INTO `st_region_city` VALUES (6270, 'Egypt', NULL, 'Shubra al Khaymah', NULL, 'SKH', '苏布拉开马', NULL, '埃及', 'EGY');
INSERT INTO `st_region_city` VALUES (6271, 'Egypt', NULL, 'Alexandria', NULL, 'ALY', '亚历山大', NULL, '埃及', 'EGY');
INSERT INTO `st_region_city` VALUES (6272, 'Ethiopia', NULL, 'Afar', NULL, 'AF', '阿法尔', NULL, '埃塞俄比亚', 'ETH');
INSERT INTO `st_region_city` VALUES (6273, 'Ethiopia', NULL, 'Amara', NULL, 'AH', '阿姆哈拉', NULL, '埃塞俄比亚', 'ETH');
INSERT INTO `st_region_city` VALUES (6274, 'Ethiopia', NULL, 'Oromiya', NULL, 'OR', '奥罗米亚', NULL, '埃塞俄比亚', 'ETH');
INSERT INTO `st_region_city` VALUES (6275, 'Ethiopia', NULL, 'Binshangul Gumuz', NULL, 'BG', '宾香古尔', NULL, '埃塞俄比亚', 'ETH');
INSERT INTO `st_region_city` VALUES (6276, 'Ethiopia', NULL, 'Dire Dawa', NULL, 'DD', '德雷达瓦', NULL, '埃塞俄比亚', 'ETH');
INSERT INTO `st_region_city` VALUES (6277, 'Ethiopia', NULL, 'Gambela Hizboch', NULL, 'GB', '甘贝拉各族', NULL, '埃塞俄比亚', 'ETH');
INSERT INTO `st_region_city` VALUES (6278, 'Ethiopia', NULL, 'Hareri  Hizb', NULL, 'HR', '哈勒里民族', NULL, '埃塞俄比亚', 'ETH');
INSERT INTO `st_region_city` VALUES (6279, 'Ethiopia', NULL, 'YeDebub Biheroch', NULL, 'SN', '南方各族', NULL, '埃塞俄比亚', 'ETH');
INSERT INTO `st_region_city` VALUES (6280, 'Ethiopia', NULL, 'Sumale', NULL, 'SM', '索马里', NULL, '埃塞俄比亚', 'ETH');
INSERT INTO `st_region_city` VALUES (6281, 'Ethiopia', NULL, 'Tigray', NULL, 'TG', '提格雷', NULL, '埃塞俄比亚', 'ETH');
INSERT INTO `st_region_city` VALUES (6282, 'Ethiopia', NULL, 'Adis abeba', NULL, 'AA', '亚的斯亚贝巴', NULL, '埃塞俄比亚', 'ETH');
INSERT INTO `st_region_city` VALUES (6283, 'Ireland', NULL, 'Offaly', NULL, 'OF', '奥法利', NULL, '爱尔兰', 'IRL');
INSERT INTO `st_region_city` VALUES (6284, 'Ireland', NULL, 'Tipperary', NULL, 'TP', '蒂珀雷里', NULL, '爱尔兰', 'IRL');
INSERT INTO `st_region_city` VALUES (6285, 'Ireland', NULL, 'Dublin', NULL, 'DB', '都柏林', NULL, '爱尔兰', 'IRL');
INSERT INTO `st_region_city` VALUES (6286, 'Ireland', NULL, 'Donegal', NULL, 'DG', '多内加尔', NULL, '爱尔兰', 'IRL');
INSERT INTO `st_region_city` VALUES (6287, 'Ireland', NULL, 'Galway', NULL, 'GW', '戈尔韦', NULL, '爱尔兰', 'IRL');
INSERT INTO `st_region_city` VALUES (6288, 'Ireland', NULL, 'Kildare', NULL, 'KD', '基尔代尔', NULL, '爱尔兰', 'IRL');
INSERT INTO `st_region_city` VALUES (6289, 'Ireland', NULL, 'Kilkenny', NULL, 'KK', '基尔肯尼', NULL, '爱尔兰', 'IRL');
INSERT INTO `st_region_city` VALUES (6290, 'Ireland', NULL, 'Cavan', NULL, 'CV', '卡范', NULL, '爱尔兰', 'IRL');
INSERT INTO `st_region_city` VALUES (6291, 'Ireland', NULL, 'Carlow', NULL, 'CW', '卡洛', NULL, '爱尔兰', 'IRL');
INSERT INTO `st_region_city` VALUES (6292, 'Ireland', NULL, 'Kerry', NULL, 'KR', '凯里', NULL, '爱尔兰', 'IRL');
INSERT INTO `st_region_city` VALUES (6293, 'Ireland', NULL, 'Cork', NULL, 'CK', '科克', NULL, '爱尔兰', 'IRL');
INSERT INTO `st_region_city` VALUES (6294, 'Ireland', NULL, 'Clare', NULL, 'CL', '克莱尔', NULL, '爱尔兰', 'IRL');
INSERT INTO `st_region_city` VALUES (6295, 'Ireland', NULL, 'Longford', NULL, 'LF', '朗福德', NULL, '爱尔兰', 'IRL');
INSERT INTO `st_region_city` VALUES (6296, 'Ireland', NULL, 'Louth', NULL, 'LT', '劳斯', NULL, '爱尔兰', 'IRL');
INSERT INTO `st_region_city` VALUES (6297, 'Ireland', NULL, 'Laois', NULL, 'LA', '崂斯', NULL, '爱尔兰', 'IRL');
INSERT INTO `st_region_city` VALUES (6298, 'Ireland', NULL, 'Limerick', NULL, 'LM', '利默里克', NULL, '爱尔兰', 'IRL');
INSERT INTO `st_region_city` VALUES (6299, 'Ireland', NULL, 'Leitrim', NULL, 'LR', '利特里姆', NULL, '爱尔兰', 'IRL');
INSERT INTO `st_region_city` VALUES (6300, 'Ireland', NULL, 'Roscommon', NULL, 'RC', '罗斯康芒', NULL, '爱尔兰', 'IRL');
INSERT INTO `st_region_city` VALUES (6301, 'Ireland', NULL, 'Mayo', NULL, 'MY', '梅奥', NULL, '爱尔兰', 'IRL');
INSERT INTO `st_region_city` VALUES (6302, 'Ireland', NULL, 'Meath', NULL, 'MT', '米斯', NULL, '爱尔兰', 'IRL');
INSERT INTO `st_region_city` VALUES (6303, 'Ireland', NULL, 'Monaghan', NULL, 'MG', '莫内根', NULL, '爱尔兰', 'IRL');
INSERT INTO `st_region_city` VALUES (6304, 'Ireland', NULL, 'Sligo', NULL, 'SL', '斯莱戈', NULL, '爱尔兰', 'IRL');
INSERT INTO `st_region_city` VALUES (6305, 'Ireland', NULL, 'Wicklow', NULL, 'WK', '威克洛', NULL, '爱尔兰', 'IRL');
INSERT INTO `st_region_city` VALUES (6306, 'Ireland', NULL, 'Wexford', NULL, 'WX', '韦克斯福德', NULL, '爱尔兰', 'IRL');
INSERT INTO `st_region_city` VALUES (6307, 'Ireland', NULL, 'Waterford', NULL, 'WF', '沃特福德', NULL, '爱尔兰', 'IRL');
INSERT INTO `st_region_city` VALUES (6308, 'Ireland', NULL, 'Westmeath', NULL, 'WM', '西米斯', NULL, '爱尔兰', 'IRL');
INSERT INTO `st_region_city` VALUES (6309, 'Estonia', NULL, 'Polva', NULL, '65', '贝尔瓦', NULL, '爱沙尼亚', 'EST');
INSERT INTO `st_region_city` VALUES (6310, 'Estonia', NULL, 'Harju', NULL, '37', '哈留', NULL, '爱沙尼亚', 'EST');
INSERT INTO `st_region_city` VALUES (6311, 'Estonia', NULL, 'Rapla', NULL, '70', '拉普拉', NULL, '爱沙尼亚', 'EST');
INSERT INTO `st_region_city` VALUES (6312, 'Estonia', NULL, 'Laane', NULL, '57', '里亚内', NULL, '爱沙尼亚', 'EST');
INSERT INTO `st_region_city` VALUES (6313, 'Estonia', NULL, 'Parnu', NULL, '67', '帕尔努', NULL, '爱沙尼亚', 'EST');
INSERT INTO `st_region_city` VALUES (6314, 'Estonia', NULL, 'Saare', NULL, '74', '萨雷', NULL, '爱沙尼亚', 'EST');
INSERT INTO `st_region_city` VALUES (6315, 'Estonia', NULL, 'Tartu', NULL, '78', '塔尔图', NULL, '爱沙尼亚', 'EST');
INSERT INTO `st_region_city` VALUES (6316, 'Estonia', NULL, 'Valga', NULL, '82', '瓦尔加', NULL, '爱沙尼亚', 'EST');
INSERT INTO `st_region_city` VALUES (6317, 'Estonia', NULL, 'Viljandi', NULL, '84', '维良地', NULL, '爱沙尼亚', 'EST');
INSERT INTO `st_region_city` VALUES (6318, 'Estonia', NULL, 'Laane-Viru', NULL, '59', '维鲁', NULL, '爱沙尼亚', 'EST');
INSERT INTO `st_region_city` VALUES (6319, 'Estonia', NULL, 'Voru', NULL, '86', '沃鲁', NULL, '爱沙尼亚', 'EST');
INSERT INTO `st_region_city` VALUES (6320, 'Estonia', NULL, 'Hiiu', NULL, '39', '希尤', NULL, '爱沙尼亚', 'EST');
INSERT INTO `st_region_city` VALUES (6321, 'Estonia', NULL, 'Jarva', NULL, '51', '耶尔韦', NULL, '爱沙尼亚', 'EST');
INSERT INTO `st_region_city` VALUES (6322, 'Estonia', NULL, 'Jogeva', NULL, '49', '耶盖瓦', NULL, '爱沙尼亚', 'EST');
INSERT INTO `st_region_city` VALUES (6323, 'Estonia', NULL, 'Ida-Viru', NULL, '44', '依达－维鲁', NULL, '爱沙尼亚', 'EST');
INSERT INTO `st_region_city` VALUES (6324, 'Andorra', NULL, 'Andorra la Vella', NULL, '7', '安道尔城', NULL, '安道尔', 'AND');
INSERT INTO `st_region_city` VALUES (6325, 'Andorra', NULL, 'Ordino', NULL, '5', '奥尔迪诺', NULL, '安道尔', 'AND');
INSERT INTO `st_region_city` VALUES (6326, 'Andorra', NULL, 'Encamp', NULL, '3', '恩坎普', NULL, '安道尔', 'AND');
INSERT INTO `st_region_city` VALUES (6327, 'Andorra', NULL, 'Canillo', NULL, '2', '卡尼略', NULL, '安道尔', 'AND');
INSERT INTO `st_region_city` VALUES (6328, 'Andorra', NULL, 'Escaldes-Engordany', NULL, '8', '莱塞斯卡尔德－恩戈尔达', NULL, '安道尔', 'AND');
INSERT INTO `st_region_city` VALUES (6329, 'Andorra', NULL, 'La Massana', NULL, '4', '马萨纳', NULL, '安道尔', 'AND');
INSERT INTO `st_region_city` VALUES (6330, 'Andorra', NULL, 'Sant Julia de Laria', NULL, '6', '圣胡利娅－德洛里亚', NULL, '安道尔', 'AND');
INSERT INTO `st_region_city` VALUES (6331, 'Angola', NULL, 'Cuanza Norte', NULL, 'CNO', '北宽扎', NULL, '安哥拉', 'AGO');
INSERT INTO `st_region_city` VALUES (6332, 'Angola', NULL, 'Lunda Norte', NULL, 'LNO', '北隆达', NULL, '安哥拉', 'AGO');
INSERT INTO `st_region_city` VALUES (6333, 'Angola', NULL, 'Bengo', NULL, 'BGO', '本戈', NULL, '安哥拉', 'AGO');
INSERT INTO `st_region_city` VALUES (6334, 'Angola', NULL, 'Benguela', NULL, 'BGU', '本格拉', NULL, '安哥拉', 'AGO');
INSERT INTO `st_region_city` VALUES (6335, 'Angola', NULL, 'Bie', NULL, 'BIE', '比耶', NULL, '安哥拉', 'AGO');
INSERT INTO `st_region_city` VALUES (6336, 'Angola', NULL, 'Cabinda', NULL, 'CAB', '卡宾达', NULL, '安哥拉', 'AGO');
INSERT INTO `st_region_city` VALUES (6337, 'Angola', NULL, 'Cunene', NULL, 'CNN', '库内内', NULL, '安哥拉', 'AGO');
INSERT INTO `st_region_city` VALUES (6338, 'Angola', NULL, 'Cuando Cubango', NULL, 'CCU', '宽多库邦戈', NULL, '安哥拉', 'AGO');
INSERT INTO `st_region_city` VALUES (6339, 'Angola', NULL, 'Luanda', NULL, 'LUA', '罗安达', NULL, '安哥拉', 'AGO');
INSERT INTO `st_region_city` VALUES (6340, 'Angola', NULL, 'Malanje', NULL, 'MAL', '马兰热', NULL, '安哥拉', 'AGO');
INSERT INTO `st_region_city` VALUES (6341, 'Angola', NULL, 'Moxico', NULL, 'MOX', '莫希科', NULL, '安哥拉', 'AGO');
INSERT INTO `st_region_city` VALUES (6342, 'Angola', NULL, 'Namibe', NULL, 'NAM', '纳米贝', NULL, '安哥拉', 'AGO');
INSERT INTO `st_region_city` VALUES (6343, 'Angola', NULL, 'Cuanza Sul', NULL, 'CUS', '南宽扎', NULL, '安哥拉', 'AGO');
INSERT INTO `st_region_city` VALUES (6344, 'Angola', NULL, 'Lunda Sul', NULL, 'LSU', '南隆达', NULL, '安哥拉', 'AGO');
INSERT INTO `st_region_city` VALUES (6345, 'Angola', NULL, 'Huambo', NULL, 'HUA', '万博', NULL, '安哥拉', 'AGO');
INSERT INTO `st_region_city` VALUES (6346, 'Angola', NULL, 'Huila', NULL, 'HUI', '威拉', NULL, '安哥拉', 'AGO');
INSERT INTO `st_region_city` VALUES (6347, 'Angola', NULL, 'Uige', NULL, 'UIG', '威热', NULL, '安哥拉', 'AGO');
INSERT INTO `st_region_city` VALUES (6348, 'Angola', NULL, 'Zaire', NULL, 'ZAI', '扎伊尔', NULL, '安哥拉', 'AGO');
INSERT INTO `st_region_city` VALUES (6349, 'Austria', NULL, 'Burgenland', NULL, 'BUR', '布尔根兰', NULL, '奥地利', 'AUT');
INSERT INTO `st_region_city` VALUES (6350, 'Austria', NULL, 'Tyrol', NULL, 'TYR', '蒂罗尔', NULL, '奥地利', 'AUT');
INSERT INTO `st_region_city` VALUES (6351, 'Austria', NULL, 'Vorarlberg', NULL, 'VOR', '福拉尔贝格', NULL, '奥地利', 'AUT');
INSERT INTO `st_region_city` VALUES (6352, 'Austria', NULL, 'Carinthia', NULL, 'CAT', '克恩顿', NULL, '奥地利', 'AUT');
INSERT INTO `st_region_city` VALUES (6353, 'Austria', NULL, 'Salzburg', NULL, 'SZG', '萨尔茨堡', NULL, '奥地利', 'AUT');
INSERT INTO `st_region_city` VALUES (6354, 'Austria', NULL, 'Upper Austria', NULL, 'UAU', '上奥地利', NULL, '奥地利', 'AUT');
INSERT INTO `st_region_city` VALUES (6355, 'Austria', NULL, 'Styria', NULL, 'STY', '施蒂利亚', NULL, '奥地利', 'AUT');
INSERT INTO `st_region_city` VALUES (6356, 'Austria', NULL, 'Vienna', NULL, 'VDD', '维也纳', NULL, '奥地利', 'AUT');
INSERT INTO `st_region_city` VALUES (6357, 'Austria', NULL, 'Lower Austria', NULL, 'LAU', '下奥地利', NULL, '奥地利', 'AUT');
INSERT INTO `st_region_city` VALUES (6358, 'Papua New Guinea', NULL, 'Northern', NULL, 'NO', '北部', NULL, '巴布亚新几内亚', 'PNG');
INSERT INTO `st_region_city` VALUES (6359, 'Papua New Guinea', NULL, 'Bougainville', NULL, 'BV', '布干维尔', NULL, '巴布亚新几内亚', 'PNG');
INSERT INTO `st_region_city` VALUES (6360, 'Papua New Guinea', NULL, 'Eastern Highlands', NULL, 'EH', '东部高地', NULL, '巴布亚新几内亚', 'PNG');
INSERT INTO `st_region_city` VALUES (6361, 'Papua New Guinea', NULL, 'East Sepik', NULL, 'ES', '东塞皮克', NULL, '巴布亚新几内亚', 'PNG');
INSERT INTO `st_region_city` VALUES (6362, 'Papua New Guinea', NULL, 'East New Britain', NULL, 'EB', '东新不列颠', NULL, '巴布亚新几内亚', 'PNG');
INSERT INTO `st_region_city` VALUES (6363, 'Papua New Guinea', NULL, 'Enga', NULL, 'EN', '恩加', NULL, '巴布亚新几内亚', 'PNG');
INSERT INTO `st_region_city` VALUES (6364, 'Papua New Guinea', NULL, 'Gulf', NULL, 'GU', '海湾', NULL, '巴布亚新几内亚', 'PNG');
INSERT INTO `st_region_city` VALUES (6365, 'Papua New Guinea', NULL, 'Madang', NULL, 'MD', '马当', NULL, '巴布亚新几内亚', 'PNG');
INSERT INTO `st_region_city` VALUES (6366, 'Papua New Guinea', NULL, 'Manus', NULL, 'MN', '马努斯', NULL, '巴布亚新几内亚', 'PNG');
INSERT INTO `st_region_city` VALUES (6367, 'Papua New Guinea', NULL, 'Milne Bay', NULL, 'MB', '米尔恩湾', NULL, '巴布亚新几内亚', 'PNG');
INSERT INTO `st_region_city` VALUES (6368, 'Papua New Guinea', NULL, 'Port Moresby', NULL, 'NC', '莫尔兹比港', NULL, '巴布亚新几内亚', 'PNG');
INSERT INTO `st_region_city` VALUES (6369, 'Papua New Guinea', NULL, 'Morobe', NULL, 'MR', '莫罗贝', NULL, '巴布亚新几内亚', 'PNG');
INSERT INTO `st_region_city` VALUES (6370, 'Papua New Guinea', NULL, 'Southern Highlands', NULL, 'SH', '南部高地', NULL, '巴布亚新几内亚', 'PNG');
INSERT INTO `st_region_city` VALUES (6371, 'Papua New Guinea', NULL, 'Simbu', NULL, 'SI', '钦布', NULL, '巴布亚新几内亚', 'PNG');
INSERT INTO `st_region_city` VALUES (6372, 'Papua New Guinea', NULL, 'Sandaun', NULL, 'SA', '桑道恩', NULL, '巴布亚新几内亚', 'PNG');
INSERT INTO `st_region_city` VALUES (6373, 'Papua New Guinea', NULL, 'Western', NULL, 'WE', '西部', NULL, '巴布亚新几内亚', 'PNG');
INSERT INTO `st_region_city` VALUES (6374, 'Papua New Guinea', NULL, 'Western Highlands', NULL, 'WH', '西部高地', NULL, '巴布亚新几内亚', 'PNG');
INSERT INTO `st_region_city` VALUES (6375, 'Papua New Guinea', NULL, 'West New Britain', NULL, 'WB', '西新不列颠', NULL, '巴布亚新几内亚', 'PNG');
INSERT INTO `st_region_city` VALUES (6376, 'Papua New Guinea', NULL, 'New Ireland', NULL, 'NI', '新爱尔兰', NULL, '巴布亚新几内亚', 'PNG');
INSERT INTO `st_region_city` VALUES (6377, 'Pakistan', NULL, 'Peshawar', NULL, 'PEW', '白沙瓦', NULL, '巴基斯坦', 'PAK');
INSERT INTO `st_region_city` VALUES (6378, 'Pakistan', NULL, 'Faisalabad', NULL, 'LYP', '费萨拉巴德', NULL, '巴基斯坦', 'PAK');
INSERT INTO `st_region_city` VALUES (6379, 'Pakistan', NULL, 'Gujranwala', NULL, 'GUJ', '故吉软瓦拉', NULL, '巴基斯坦', 'PAK');
INSERT INTO `st_region_city` VALUES (6380, 'Pakistan', NULL, 'Hyderabad', NULL, 'HDD', '海德拉巴', NULL, '巴基斯坦', 'PAK');
INSERT INTO `st_region_city` VALUES (6381, 'Pakistan', NULL, 'Karachi', NULL, 'KCT', '卡拉奇', NULL, '巴基斯坦', 'PAK');
INSERT INTO `st_region_city` VALUES (6382, 'Pakistan', NULL, 'Lahore', NULL, 'LHE', '拉合尔', NULL, '巴基斯坦', 'PAK');
INSERT INTO `st_region_city` VALUES (6383, 'Pakistan', NULL, 'Rawalpindi', NULL, 'RWP', '拉瓦尔品第', NULL, '巴基斯坦', 'PAK');
INSERT INTO `st_region_city` VALUES (6384, 'Pakistan', NULL, 'Multan', NULL, 'MUX', '木尔坦', NULL, '巴基斯坦', 'PAK');
INSERT INTO `st_region_city` VALUES (6385, 'Pakistan', NULL, 'Islamabad', NULL, 'ISB', '伊斯兰堡', NULL, '巴基斯坦', 'PAK');
INSERT INTO `st_region_city` VALUES (6386, 'Paraguay', NULL, 'Amambay', NULL, 'AM', '阿曼拜', NULL, '巴拉圭', 'PRY');
INSERT INTO `st_region_city` VALUES (6387, 'Paraguay', NULL, 'Presidente Hayes', NULL, 'PH', '阿耶斯总统省', NULL, '巴拉圭', 'PRY');
INSERT INTO `st_region_city` VALUES (6388, 'Paraguay', NULL, 'Paraguari', NULL, 'PA', '巴拉瓜里', NULL, '巴拉圭', 'PRY');
INSERT INTO `st_region_city` VALUES (6389, 'Paraguay', NULL, 'Boqueron', NULL, 'BO', '博克龙', NULL, '巴拉圭', 'PRY');
INSERT INTO `st_region_city` VALUES (6390, 'Paraguay', NULL, 'Guaira', NULL, 'GU', '瓜伊拉', NULL, '巴拉圭', 'PRY');
INSERT INTO `st_region_city` VALUES (6391, 'Paraguay', NULL, 'Caaguazu', NULL, 'CG', '卡瓜苏', NULL, '巴拉圭', 'PRY');
INSERT INTO `st_region_city` VALUES (6392, 'Paraguay', NULL, 'Canindeyu', NULL, 'CN', '卡嫩迪尤', NULL, '巴拉圭', 'PRY');
INSERT INTO `st_region_city` VALUES (6393, 'Paraguay', NULL, 'Caazapa', NULL, 'CZ', '卡萨帕', NULL, '巴拉圭', 'PRY');
INSERT INTO `st_region_city` VALUES (6394, 'Paraguay', NULL, 'Concepcion', NULL, 'CC', '康塞普西翁', NULL, '巴拉圭', 'PRY');
INSERT INTO `st_region_city` VALUES (6395, 'Paraguay', NULL, 'Cordillera', NULL, 'CD', '科迪勒拉', NULL, '巴拉圭', 'PRY');
INSERT INTO `st_region_city` VALUES (6396, 'Paraguay', NULL, 'Misiones', NULL, 'MI', '米西奥内斯', NULL, '巴拉圭', 'PRY');
INSERT INTO `st_region_city` VALUES (6397, 'Paraguay', NULL, 'Neembucu', NULL, 'NE', '涅恩布库', NULL, '巴拉圭', 'PRY');
INSERT INTO `st_region_city` VALUES (6398, 'Paraguay', NULL, 'Alto Paraguay', NULL, 'AG', '上巴拉圭', NULL, '巴拉圭', 'PRY');
INSERT INTO `st_region_city` VALUES (6399, 'Paraguay', NULL, 'Alto Parana', NULL, 'AN', '上巴拉那', NULL, '巴拉圭', 'PRY');
INSERT INTO `st_region_city` VALUES (6400, 'Paraguay', NULL, 'San Pedro', NULL, 'SP', '圣佩德罗', NULL, '巴拉圭', 'PRY');
INSERT INTO `st_region_city` VALUES (6401, 'Paraguay', NULL, 'Asuncion', NULL, 'AS', '亚松森特别区', NULL, '巴拉圭', 'PRY');
INSERT INTO `st_region_city` VALUES (6402, 'Paraguay', NULL, 'Itapua', NULL, 'IT', '伊塔普亚', NULL, '巴拉圭', 'PRY');
INSERT INTO `st_region_city` VALUES (6403, 'Paraguay', NULL, 'Central', NULL, 'CE', '中央', NULL, '巴拉圭', 'PRY');
INSERT INTO `st_region_city` VALUES (6404, 'Palestinian Authority', NULL, 'Gaza Strip', NULL, 'GZ', '加沙地带', NULL, '巴勒斯坦', 'PSE');
INSERT INTO `st_region_city` VALUES (6405, 'Palestinian Authority', NULL, 'West Bank', NULL, 'WE', '西岸', NULL, '巴勒斯坦', 'PSE');
INSERT INTO `st_region_city` VALUES (6406, 'Bahrain', NULL, 'Ash-Shamaliyah', NULL, '5', '北部', NULL, '巴林', 'BHR');
INSERT INTO `st_region_city` VALUES (6407, 'Bahrain', NULL, 'Al-Hadd', NULL, '1', '哈德', NULL, '巴林', 'BHR');
INSERT INTO `st_region_city` VALUES (6408, 'Bahrain', NULL, 'Hammad', NULL, '12', '哈马德', NULL, '巴林', 'BHR');
INSERT INTO `st_region_city` VALUES (6409, 'Bahrain', NULL, 'Ar-Rifa', NULL, '9', '里法', NULL, '巴林', 'BHR');
INSERT INTO `st_region_city` VALUES (6410, 'Bahrain', NULL, 'Al-Manamah', NULL, '3', '麦纳麦', NULL, '巴林', 'BHR');
INSERT INTO `st_region_city` VALUES (6411, 'Bahrain', NULL, 'Al-Muharraq', NULL, '2', '穆哈拉格', NULL, '巴林', 'BHR');
INSERT INTO `st_region_city` VALUES (6412, 'Bahrain', NULL, 'Al-Gharbiyah', NULL, '10', '西部', NULL, '巴林', 'BHR');
INSERT INTO `st_region_city` VALUES (6413, 'Bahrain', NULL, 'Isa', NULL, '8', '伊萨城', NULL, '巴林', 'BHR');
INSERT INTO `st_region_city` VALUES (6414, 'Bahrain', NULL, 'Al-Wusta', NULL, '7', '中部', NULL, '巴林', 'BHR');
INSERT INTO `st_region_city` VALUES (6415, 'Brazil', NULL, 'Acre', NULL, 'AC', '阿克里', NULL, '巴西', 'BRA');
INSERT INTO `st_region_city` VALUES (6416, 'Brazil', NULL, 'Alagoas', NULL, 'AL', '阿拉戈斯', NULL, '巴西', 'BRA');
INSERT INTO `st_region_city` VALUES (6417, 'Brazil', NULL, 'Amapa', NULL, 'AP', '阿马帕', NULL, '巴西', 'BRA');
INSERT INTO `st_region_city` VALUES (6418, 'Brazil', NULL, 'Parana', NULL, 'PR', '巴拉那', NULL, '巴西', 'BRA');
INSERT INTO `st_region_city` VALUES (6419, 'Brazil', NULL, 'Brasilia', NULL, 'BSB', '巴西利亚', NULL, '巴西', 'BRA');
INSERT INTO `st_region_city` VALUES (6420, 'Brazil', NULL, 'Bahia', NULL, 'BA', '巴伊亚', NULL, '巴西', 'BRA');
INSERT INTO `st_region_city` VALUES (6421, 'Brazil', NULL, 'Rio Grande do Norte', NULL, 'RN', '北里奥格兰德', NULL, '巴西', 'BRA');
INSERT INTO `st_region_city` VALUES (6422, 'Brazil', NULL, 'Pernambuco', NULL, 'PE', '伯南布哥', NULL, '巴西', 'BRA');
INSERT INTO `st_region_city` VALUES (6423, 'Brazil', NULL, 'Goias', NULL, 'GO', '戈亚斯', NULL, '巴西', 'BRA');
INSERT INTO `st_region_city` VALUES (6424, 'Brazil', NULL, 'Rondonia', NULL, 'RO', '朗多尼亚', NULL, '巴西', 'BRA');
INSERT INTO `st_region_city` VALUES (6425, 'Brazil', NULL, 'Rio de Janeiro', NULL, 'RJ', '里约热内卢', NULL, '巴西', 'BRA');
INSERT INTO `st_region_city` VALUES (6426, 'Brazil', NULL, 'Roraima', NULL, 'RR', '罗赖马', NULL, '巴西', 'BRA');
INSERT INTO `st_region_city` VALUES (6427, 'Brazil', NULL, 'Maranhao', NULL, 'MA', '马拉尼昂', NULL, '巴西', 'BRA');
INSERT INTO `st_region_city` VALUES (6428, 'Brazil', NULL, 'Mato Grosso', NULL, 'MT', '马托格罗索', NULL, '巴西', 'BRA');
INSERT INTO `st_region_city` VALUES (6429, 'Brazil', NULL, 'Minas Gerais', NULL, 'MG', '米纳斯吉拉斯', NULL, '巴西', 'BRA');
INSERT INTO `st_region_city` VALUES (6430, 'Brazil', NULL, 'Rio Grande do Sul', NULL, 'RS', '南里奥格兰德', NULL, '巴西', 'BRA');
INSERT INTO `st_region_city` VALUES (6431, 'Brazil', NULL, 'Mato Grosso do Sul', NULL, 'MS', '南马托格罗索', NULL, '巴西', 'BRA');
INSERT INTO `st_region_city` VALUES (6432, 'Brazil', NULL, 'Para', NULL, 'PA', '帕拉', NULL, '巴西', 'BRA');
INSERT INTO `st_region_city` VALUES (6433, 'Brazil', NULL, 'Paraiba', NULL, 'PB', '帕拉伊巴', NULL, '巴西', 'BRA');
INSERT INTO `st_region_city` VALUES (6434, 'Brazil', NULL, 'Piaui', NULL, 'PI', '皮奥伊', NULL, '巴西', 'BRA');
INSERT INTO `st_region_city` VALUES (6435, 'Brazil', NULL, 'Ceara', NULL, 'CE', '塞阿拉', NULL, '巴西', 'BRA');
INSERT INTO `st_region_city` VALUES (6436, 'Brazil', NULL, 'Sergipe', NULL, 'SE', '塞尔希培', NULL, '巴西', 'BRA');
INSERT INTO `st_region_city` VALUES (6437, 'Brazil', NULL, 'Espirito Santo', NULL, 'ES', '圣埃斯皮里图', NULL, '巴西', 'BRA');
INSERT INTO `st_region_city` VALUES (6438, 'Brazil', NULL, 'Sao Paulo', NULL, 'SP', '圣保罗', NULL, '巴西', 'BRA');
INSERT INTO `st_region_city` VALUES (6439, 'Brazil', NULL, 'Santa Catarina', NULL, 'SC', '圣卡塔琳娜', NULL, '巴西', 'BRA');
INSERT INTO `st_region_city` VALUES (6440, 'Brazil', NULL, 'Tocantins', NULL, 'TO', '托坎廷斯', NULL, '巴西', 'BRA');
INSERT INTO `st_region_city` VALUES (6441, 'Brazil', NULL, 'Amazonas', NULL, 'AM', '亚马孙', NULL, '巴西', 'BRA');
INSERT INTO `st_region_city` VALUES (6442, 'White Russia', NULL, 'Bresckaja', NULL, 'BR', '布列斯特', NULL, '白俄罗斯', 'BLR');
INSERT INTO `st_region_city` VALUES (6443, 'White Russia', NULL, 'Homelskaja', NULL, 'HO', '戈梅利', NULL, '白俄罗斯', 'BLR');
INSERT INTO `st_region_city` VALUES (6444, 'White Russia', NULL, 'Hrodzenskaja', NULL, 'HR', '格罗德诺', NULL, '白俄罗斯', 'BLR');
INSERT INTO `st_region_city` VALUES (6445, 'White Russia', NULL, 'Minsk', NULL, 'MI', '明斯克市', NULL, '白俄罗斯', 'BLR');
INSERT INTO `st_region_city` VALUES (6446, 'White Russia', NULL, 'Mahileuskaja', NULL, 'MA', '莫吉廖夫', NULL, '白俄罗斯', 'BLR');
INSERT INTO `st_region_city` VALUES (6447, 'White Russia', NULL, 'Vicebskaja', NULL, 'VI', '维捷布斯克', NULL, '白俄罗斯', 'BLR');
INSERT INTO `st_region_city` VALUES (6448, 'Bulgaria', NULL, 'Burgas', NULL, 'BOJ', '布尔加斯', NULL, '保加利亚', 'BGR');
INSERT INTO `st_region_city` VALUES (6449, 'Bulgaria', NULL, 'Khaskovo', NULL, 'KHO', '卡斯科伏', NULL, '保加利亚', 'BGR');
INSERT INTO `st_region_city` VALUES (6450, 'Bulgaria', NULL, 'Ruse', NULL, 'ROU', '鲁塞', NULL, '保加利亚', 'BGR');
INSERT INTO `st_region_city` VALUES (6451, 'Bulgaria', NULL, 'Lovech', NULL, 'LVP', '洛维奇', NULL, '保加利亚', 'BGR');
INSERT INTO `st_region_city` VALUES (6452, 'Bulgaria', NULL, 'Montana', NULL, 'OZA', '蒙塔纳', NULL, '保加利亚', 'BGR');
INSERT INTO `st_region_city` VALUES (6453, 'Bulgaria', NULL, 'Plovdiv', NULL, 'PDV', '普罗夫迪夫', NULL, '保加利亚', 'BGR');
INSERT INTO `st_region_city` VALUES (6454, 'Bulgaria', NULL, 'Sofiya', NULL, 'SOF', '索非亚', NULL, '保加利亚', 'BGR');
INSERT INTO `st_region_city` VALUES (6455, 'Bulgaria', NULL, 'Grad Sofiya', NULL, 'GSO', '索非亚市', NULL, '保加利亚', 'BGR');
INSERT INTO `st_region_city` VALUES (6456, 'Bulgaria', NULL, 'Varna', NULL, 'VAR', '瓦尔纳', NULL, '保加利亚', 'BGR');
INSERT INTO `st_region_city` VALUES (6457, 'Benin', NULL, 'Alibori', NULL, 'AL', '阿黎博里', NULL, '贝宁', 'BEN');
INSERT INTO `st_region_city` VALUES (6458, 'Benin', NULL, 'Atakora', NULL, 'AK', '阿塔科拉', NULL, '贝宁', 'BEN');
INSERT INTO `st_region_city` VALUES (6459, 'Benin', NULL, 'Littoral', NULL, 'LI', '滨海', NULL, '贝宁', 'BEN');
INSERT INTO `st_region_city` VALUES (6460, 'Benin', NULL, 'Bohicon', NULL, 'BOH', '波希康市', NULL, '贝宁', 'BEN');
INSERT INTO `st_region_city` VALUES (6461, 'Benin', NULL, 'Borgou', NULL, 'BO', '博尔古', NULL, '贝宁', 'BEN');
INSERT INTO `st_region_city` VALUES (6462, 'Benin', NULL, 'Atlantique', NULL, 'AQ', '大西洋', NULL, '贝宁', 'BEN');
INSERT INTO `st_region_city` VALUES (6463, 'Benin', NULL, 'Plateau', NULL, 'PL', '高原', NULL, '贝宁', 'BEN');
INSERT INTO `st_region_city` VALUES (6464, 'Benin', NULL, 'Kouffo', NULL, 'KO', '库福', NULL, '贝宁', 'BEN');
INSERT INTO `st_region_city` VALUES (6465, 'Benin', NULL, 'Mono', NULL, 'MO', '莫诺', NULL, '贝宁', 'BEN');
INSERT INTO `st_region_city` VALUES (6466, 'Benin', NULL, 'Collines', NULL, 'CO', '丘陵', NULL, '贝宁', 'BEN');
INSERT INTO `st_region_city` VALUES (6467, 'Benin', NULL, 'Oueme', NULL, 'OU', '韦梅', NULL, '贝宁', 'BEN');
INSERT INTO `st_region_city` VALUES (6468, 'Benin', NULL, 'Donga', NULL, 'DO', '峡谷', NULL, '贝宁', 'BEN');
INSERT INTO `st_region_city` VALUES (6469, 'Benin', NULL, 'Zou', NULL, 'ZO', '祖', NULL, '贝宁', 'BEN');
INSERT INTO `st_region_city` VALUES (6470, 'Belgium', NULL, 'Hainaut', NULL, 'WHT', '埃诺', NULL, '比利时', 'BEL');
INSERT INTO `st_region_city` VALUES (6471, 'Belgium', NULL, 'Antwerpen', NULL, 'VAN', '安特卫普', NULL, '比利时', 'BEL');
INSERT INTO `st_region_city` VALUES (6472, 'Belgium', NULL, 'Brabant-Wallone', NULL, 'WBR', '布拉班特-瓦隆', NULL, '比利时', 'BEL');
INSERT INTO `st_region_city` VALUES (6473, 'Belgium', NULL, 'Brussels', NULL, 'BRU', '布鲁塞尔', NULL, '比利时', 'BEL');
INSERT INTO `st_region_city` VALUES (6474, 'Belgium', NULL, 'Oost-Vlaanderen', NULL, 'VOV', '东佛兰德', NULL, '比利时', 'BEL');
INSERT INTO `st_region_city` VALUES (6475, 'Belgium', NULL, 'Vlaams-Brabant', NULL, 'VBR', '佛兰芒-布拉班特', NULL, '比利时', 'BEL');
INSERT INTO `st_region_city` VALUES (6476, 'Belgium', NULL, 'Liege', NULL, 'WLG', '列日', NULL, '比利时', 'BEL');
INSERT INTO `st_region_city` VALUES (6477, 'Belgium', NULL, 'Limburg', NULL, 'VLI', '林堡', NULL, '比利时', 'BEL');
INSERT INTO `st_region_city` VALUES (6478, 'Belgium', NULL, 'Luxembourg', NULL, 'WLX', '卢森堡', NULL, '比利时', 'BEL');
INSERT INTO `st_region_city` VALUES (6479, 'Belgium', NULL, 'Namur', NULL, 'WNA', '那慕尔', NULL, '比利时', 'BEL');
INSERT INTO `st_region_city` VALUES (6480, 'Belgium', NULL, 'West-Vlaanderen', NULL, 'VWV', '西佛兰德', NULL, '比利时', 'BEL');
INSERT INTO `st_region_city` VALUES (6481, 'Poland', NULL, 'Elbląg', NULL, 'ELB', '埃尔布隆格', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6482, 'Poland', NULL, 'Olsztyn', NULL, 'OLS', '奥尔什丁', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6483, 'Poland', NULL, 'Ostrołeka', NULL, 'OSS', '奥斯特罗文卡', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6484, 'Poland', NULL, 'Bydgoszcz', NULL, 'BZG', '比得哥什', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6485, 'Poland', NULL, 'Piotrkow', NULL, 'PIO', '彼得库夫', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6486, 'Poland', NULL, 'Bytom', NULL, 'BYT', '比托姆', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6487, 'Poland', NULL, 'Biała Podlaska', NULL, 'BAP', '比亚瓦波德拉斯卡', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6488, 'Poland', NULL, 'Białystok', NULL, 'BIA', '比亚维斯托克', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6489, 'Poland', NULL, 'Opole', NULL, 'OPO', '波莱', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6490, 'Poland', NULL, 'Poznan', NULL, 'POZ', '波兹南', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6491, 'Poland', NULL, 'Dabrowa Gornicza', NULL, 'DAB', '达布罗瓦戈尼察', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6492, 'Poland', NULL, 'Gorzow Wlkp', NULL, 'GOW', '大波兰地区戈茹夫', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6493, 'Poland', NULL, 'Wroclaw', NULL, 'WRO', '弗罗茨瓦夫', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6494, 'Poland', NULL, 'Wlocławek', NULL, 'WLO', '弗沃茨瓦韦克', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6495, 'Poland', NULL, 'Gdansk', NULL, 'GDN', '格但斯克', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6496, 'Poland', NULL, 'Gdynia', NULL, 'GDY', '格丁尼亚', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6497, 'Poland', NULL, 'Gliwice', NULL, 'GWC', '格利维采', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6498, 'Poland', NULL, 'Grudziadz', NULL, 'GRU', '格鲁琼兹', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6499, 'Poland', NULL, 'Chełm', NULL, 'CHO', '海乌姆', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6500, 'Poland', NULL, 'Warszawa', NULL, 'WAW', '华沙', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6501, 'Poland', NULL, 'Chorzow', NULL, 'CHZ', '霍茹夫', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6502, 'Poland', NULL, 'Kalisz', NULL, 'KAL', '卡利什', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6503, 'Poland', NULL, 'Katowice', NULL, 'KTW', '卡托维兹', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6504, 'Poland', NULL, 'Kielce', NULL, 'KLC', '凯尔采', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6505, 'Poland', NULL, 'Konin', NULL, 'KON', '科宁', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6506, 'Poland', NULL, 'Koszalin', NULL, 'OSZ', '科沙林', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6507, 'Poland', NULL, 'Krakow', NULL, 'KRK', '克拉科夫', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6508, 'Poland', NULL, 'Krosno', NULL, 'KRO', '克罗斯诺', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6509, 'Poland', NULL, 'Radom', NULL, 'RDM', '拉多姆', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6510, 'Poland', NULL, 'Legnica', NULL, 'LEG', '莱格尼察', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6511, 'Poland', NULL, 'Leszno', NULL, 'LEZ', '莱什诺', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6512, 'Poland', NULL, 'Lublin', NULL, 'LUL', '卢布林', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6513, 'Poland', NULL, 'Ruda Sl', NULL, 'RDS', '鲁达', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6514, 'Poland', NULL, 'Lodz', NULL, 'LOD', '罗兹', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6515, 'Poland', NULL, 'Zielona Gora', NULL, 'IEG', '绿山城', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6516, 'Poland', NULL, 'Mysłowice', NULL, 'MYL', '米什洛维采', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6517, 'Poland', NULL, 'Piła', NULL, 'PIL', '皮瓦', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6518, 'Poland', NULL, 'Przemysl', NULL, 'PRZ', '普热梅希尔', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6519, 'Poland', NULL, 'Plock', NULL, 'PLO', '普沃茨克', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6520, 'Poland', NULL, 'Ciechanow', NULL, 'CIE', '切哈努夫', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6521, 'Poland', NULL, 'Rzeszow', NULL, 'RZE', '热舒夫', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6522, 'Poland', NULL, 'Szczecin', NULL, 'SZZ', '什切青', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6523, 'Poland', NULL, 'Skierniewice', NULL, 'SKI', '斯凯尔涅维采', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6524, 'Poland', NULL, 'Slupsk', NULL, 'SLP', '斯武普斯克', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6525, 'Poland', NULL, 'Suwałki', NULL, 'SWL', '苏瓦乌基', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6526, 'Poland', NULL, 'Sopot', NULL, 'SOP', '索波特', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6527, 'Poland', NULL, 'Sosnowiec', NULL, 'SWC', '索斯诺维茨', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6528, 'Poland', NULL, 'Tarnow', NULL, 'TAR', '塔尔努夫', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6529, 'Poland', NULL, 'Tarnobrzeg', NULL, 'QEP', '塔尔诺布热格', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6530, 'Poland', NULL, 'Tychy', NULL, 'TYY', '特切', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6531, 'Poland', NULL, 'Torun', NULL, 'TOR', '托伦', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6532, 'Poland', NULL, 'Walbrzych', NULL, 'WZH', '瓦乌布日赫', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6533, 'Poland', NULL, 'Lomza', NULL, 'QOY', '沃姆扎', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6534, 'Poland', NULL, 'Siemianowice Sl', NULL, 'SOW', '希米亚诺维采', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6535, 'Poland', NULL, 'Swinoujscie', NULL, 'SWI', '希维诺乌伊希切', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6536, 'Poland', NULL, 'Swietochłowice', NULL, 'SWT', '希维托赫洛维采', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6537, 'Poland', NULL, 'Siedlce', NULL, 'SDC', '谢德尔采', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6538, 'Poland', NULL, 'Sieradz', NULL, 'SIR', '谢拉兹', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6539, 'Poland', NULL, 'Nowy Sacz', NULL, 'NOW', '新松奇', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6540, 'Poland', NULL, 'Jaworzno', NULL, 'JAW', '雅沃兹诺', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6541, 'Poland', NULL, 'Jelenia Gora', NULL, 'JEG', '耶莱尼亚古拉', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6542, 'Poland', NULL, 'Zabrze', NULL, 'ZAB', '扎布热', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6543, 'Poland', NULL, 'Zamosc', NULL, 'ZAM', '扎莫希奇', NULL, '波兰', 'POL');
INSERT INTO `st_region_city` VALUES (6544, 'Bolivia', NULL, 'El Alto', NULL, 'ALT', '奥尔托', NULL, '玻利维亚', 'BOL');
INSERT INTO `st_region_city` VALUES (6545, 'Bolivia', NULL, 'Oruro', NULL, 'ORU', '奥鲁罗', NULL, '玻利维亚', 'BOL');
INSERT INTO `st_region_city` VALUES (6546, 'Bolivia', NULL, 'El Beni', NULL, 'BEN', '贝尼', NULL, '玻利维亚', 'BOL');
INSERT INTO `st_region_city` VALUES (6547, 'Bolivia', NULL, 'Potosi', NULL, 'POI', '波多西', NULL, '玻利维亚', 'BOL');
INSERT INTO `st_region_city` VALUES (6548, 'Bolivia', NULL, 'Quillacollo', NULL, 'QUI', '基拉科洛', NULL, '玻利维亚', 'BOL');
INSERT INTO `st_region_city` VALUES (6549, 'Bolivia', NULL, 'Cochabamba', NULL, 'CBB', '科恰班巴', NULL, '玻利维亚', 'BOL');
INSERT INTO `st_region_city` VALUES (6550, 'Bolivia', NULL, 'La Paz', NULL, 'LPB', '拉巴斯', NULL, '玻利维亚', 'BOL');
INSERT INTO `st_region_city` VALUES (6551, 'Bolivia', NULL, 'Pando', NULL, 'PAN', '潘多', NULL, '玻利维亚', 'BOL');
INSERT INTO `st_region_city` VALUES (6552, 'Bolivia', NULL, 'Chuquisaca', NULL, 'CHU', '丘基萨卡', NULL, '玻利维亚', 'BOL');
INSERT INTO `st_region_city` VALUES (6553, 'Bolivia', NULL, 'Sacaba', NULL, 'SAC', '萨卡巴', NULL, '玻利维亚', 'BOL');
INSERT INTO `st_region_city` VALUES (6554, 'Bolivia', NULL, 'Santa Cruz', NULL, 'SRZ', '圣克鲁斯', NULL, '玻利维亚', 'BOL');
INSERT INTO `st_region_city` VALUES (6555, 'Bolivia', NULL, 'Tarija', NULL, 'TJA', '塔里哈', NULL, '玻利维亚', 'BOL');
INSERT INTO `st_region_city` VALUES (6556, 'Bosnia and Herzegovina', NULL, 'Posavski', NULL, 'FPO', '波萨维纳', NULL, '波斯尼亚和黑塞哥维那', 'BIH');
INSERT INTO `st_region_city` VALUES (6557, 'Bosnia and Herzegovina', NULL, 'Bosansko-Podrinjski', NULL, 'FBP', '波斯尼亚－波德里涅', NULL, '波斯尼亚和黑塞哥维那', 'BIH');
INSERT INTO `st_region_city` VALUES (6558, 'Bosnia and Herzegovina', NULL, 'Tomislavgrad', NULL, 'FTO', '多米斯拉夫格勒', NULL, '波斯尼亚和黑塞哥维那', 'BIH');
INSERT INTO `st_region_city` VALUES (6559, 'Bosnia and Herzegovina', NULL, 'Hercegovacko-Neretvanski', NULL, 'FHN', '黑塞哥维那－涅雷特瓦', NULL, '波斯尼亚和黑塞哥维那', 'BIH');
INSERT INTO `st_region_city` VALUES (6560, 'Bosnia and Herzegovina', NULL, 'Sarajevo', NULL, 'FSA', '萨拉热窝', NULL, '波斯尼亚和黑塞哥维那', 'BIH');
INSERT INTO `st_region_city` VALUES (6561, 'Bosnia and Herzegovina', NULL, 'Tuzlanski-Podrinjski', NULL, 'FTU', '图兹拉－波德里涅', NULL, '波斯尼亚和黑塞哥维那', 'BIH');
INSERT INTO `st_region_city` VALUES (6562, 'Bosnia and Herzegovina', NULL, 'Unsko-Sanski', NULL, 'FUS', '乌纳－萨纳', NULL, '波斯尼亚和黑塞哥维那', 'BIH');
INSERT INTO `st_region_city` VALUES (6563, 'Bosnia and Herzegovina', NULL, 'Hercegovacko-Bosanski', NULL, 'FHB', '西波斯尼亚', NULL, '波斯尼亚和黑塞哥维那', 'BIH');
INSERT INTO `st_region_city` VALUES (6564, 'Bosnia and Herzegovina', NULL, 'Zapadno-Hercegovaki', NULL, 'FZH', '西黑塞哥维那', NULL, '波斯尼亚和黑塞哥维那', 'BIH');
INSERT INTO `st_region_city` VALUES (6565, 'Bosnia and Herzegovina', NULL, 'Zenicko-Dobojski', NULL, 'FZE', '泽尼察－多博伊', NULL, '波斯尼亚和黑塞哥维那', 'BIH');
INSERT INTO `st_region_city` VALUES (6566, 'Bosnia and Herzegovina', NULL, 'Srednjo-Bosanski', NULL, 'FSB', '中波斯尼亚', NULL, '波斯尼亚和黑塞哥维那', 'BIH');
INSERT INTO `st_region_city` VALUES (6567, 'Belize', NULL, 'Belize', NULL, 'BZ', '伯利兹', NULL, '伯利兹', 'BLZ');
INSERT INTO `st_region_city` VALUES (6568, 'Belize', NULL, 'Orange Walk', NULL, 'OW', '橘园', NULL, '伯利兹', 'BLZ');
INSERT INTO `st_region_city` VALUES (6569, 'Belize', NULL, 'Cayo', NULL, 'CY', '卡约', NULL, '伯利兹', 'BLZ');
INSERT INTO `st_region_city` VALUES (6570, 'Belize', NULL, 'Corozal', NULL, 'CR', '科罗萨尔', NULL, '伯利兹', 'BLZ');
INSERT INTO `st_region_city` VALUES (6571, 'Belize', NULL, 'Stann Creek', NULL, 'SC', '斯坦港', NULL, '伯利兹', 'BLZ');
INSERT INTO `st_region_city` VALUES (6572, 'Belize', NULL, 'Toledo', NULL, 'TO', '托莱多', NULL, '伯利兹', 'BLZ');
INSERT INTO `st_region_city` VALUES (6573, 'Burkina Faso', NULL, 'Bale', NULL, 'BAL', '巴雷', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6574, 'Burkina Faso', NULL, 'Bam', NULL, 'BAM', '巴姆', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6575, 'Burkina Faso', NULL, 'Banwa', NULL, 'BAN', '巴瓦', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6576, 'Burkina Faso', NULL, 'Bazega', NULL, 'BAZ', '巴泽加', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6577, 'Burkina Faso', NULL, 'Poni', NULL, 'PON', '波尼', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6578, 'Burkina Faso', NULL, 'Boulgou', NULL, 'BLG', '布尔古', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6579, 'Burkina Faso', NULL, 'Boulkiemde', NULL, 'BOK', '布尔基恩德', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6580, 'Burkina Faso', NULL, 'Bougouriba', NULL, 'BOR', '布古里巴', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6581, 'Burkina Faso', NULL, 'Ganzourgou', NULL, 'GAN', '冈祖尔古', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6582, 'Burkina Faso', NULL, 'Gourma', NULL, 'GOU', '古尔马', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6583, 'Burkina Faso', NULL, 'Ziro', NULL, 'ZIR', '济罗', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6584, 'Burkina Faso', NULL, 'Kadiogo', NULL, 'KAD', '卡焦戈', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6585, 'Burkina Faso', NULL, 'Kenedougou', NULL, 'KEN', '凯内杜古', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6586, 'Burkina Faso', NULL, 'Komondjari', NULL, 'KOO', '科蒙加里', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6587, 'Burkina Faso', NULL, 'Comoe', NULL, 'COM', '科莫埃', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6588, 'Burkina Faso', NULL, 'Kompienga', NULL, 'KOP', '孔皮恩加', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6589, 'Burkina Faso', NULL, 'Kossi', NULL, 'KOS', '孔西', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6590, 'Burkina Faso', NULL, 'Koulpelogo', NULL, 'KOL', '库尔佩罗戈', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6591, 'Burkina Faso', NULL, 'Kourweogo', NULL, 'KOW', '库尔维奥戈', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6592, 'Burkina Faso', NULL, 'Kouritenga', NULL, 'KOT', '库里滕加', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6593, 'Burkina Faso', NULL, 'Leraba', NULL, 'LER', '雷拉巴', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6594, 'Burkina Faso', NULL, 'Loroum', NULL, 'LOR', '罗卢姆', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6595, 'Burkina Faso', NULL, 'Mouhoun', NULL, 'MOU', '穆翁', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6596, 'Burkina Faso', NULL, 'Namentenga', NULL, 'NAM', '纳门滕加', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6597, 'Burkina Faso', NULL, 'Nahouri', NULL, 'NAH', '纳乌里', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6598, 'Burkina Faso', NULL, 'Nayala', NULL, 'NAY', '纳亚拉', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6599, 'Burkina Faso', NULL, 'Gnagna', NULL, 'GNA', '尼亚尼亚', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6600, 'Burkina Faso', NULL, 'Noumbiel', NULL, 'NOU', '努姆比埃尔', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6601, 'Burkina Faso', NULL, 'Passore', NULL, 'PAS', '帕索雷', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6602, 'Burkina Faso', NULL, 'Seno', NULL, 'SEN', '塞诺', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6603, 'Burkina Faso', NULL, 'Sanguie', NULL, 'SAG', '桑吉', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6604, 'Burkina Faso', NULL, 'Sanmatenga', NULL, 'SAM', '桑马滕加', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6605, 'Burkina Faso', NULL, 'Sourou', NULL, 'SOR', '苏鲁', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6606, 'Burkina Faso', NULL, 'Soum', NULL, 'SOM', '苏姆', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6607, 'Burkina Faso', NULL, 'Tapoa', NULL, 'TAP', '塔波阿', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6608, 'Burkina Faso', NULL, 'Tuy', NULL, 'TUY', '图伊', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6609, 'Burkina Faso', NULL, 'Houet', NULL, 'HOU', '乌埃', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6610, 'Burkina Faso', NULL, 'Oubritenga', NULL, 'OUB', '乌布里滕加', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6611, 'Burkina Faso', NULL, 'Oudalan', NULL, 'OUD', '乌达兰', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6612, 'Burkina Faso', NULL, 'Sissili', NULL, 'SIS', '锡西里', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6613, 'Burkina Faso', NULL, 'Yagha', NULL, 'YAG', '亚加', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6614, 'Burkina Faso', NULL, 'Yatenga', NULL, 'YAT', '亚滕加', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6615, 'Burkina Faso', NULL, 'Ioba', NULL, 'IOA', '伊奥巴', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6616, 'Burkina Faso', NULL, 'Zoundweogo', NULL, 'ZOW', '宗德韦奥戈', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6617, 'Burkina Faso', NULL, 'Zondoma', NULL, 'ZOD', '宗多马', NULL, '布基纳法索', 'BFA');
INSERT INTO `st_region_city` VALUES (6618, 'Burundi', NULL, 'Bubanza', NULL, 'BB', '布班扎', NULL, '布隆迪', 'BDI');
INSERT INTO `st_region_city` VALUES (6619, 'Burundi', NULL, 'Bururi', NULL, 'BR', '布鲁里', NULL, '布隆迪', 'BDI');
INSERT INTO `st_region_city` VALUES (6620, 'Burundi', NULL, 'Bujumbura Mairie', NULL, 'BM', '布琼布拉城市', NULL, '布隆迪', 'BDI');
INSERT INTO `st_region_city` VALUES (6621, 'Burundi', NULL, 'Bujumbura Rural', NULL, 'BU', '布琼布拉乡村', NULL, '布隆迪', 'BDI');
INSERT INTO `st_region_city` VALUES (6622, 'Burundi', NULL, 'Ngozi', NULL, 'NG', '恩戈齐', NULL, '布隆迪', 'BDI');
INSERT INTO `st_region_city` VALUES (6623, 'Burundi', NULL, 'Kirundo', NULL, 'KI', '基龙多', NULL, '布隆迪', 'BDI');
INSERT INTO `st_region_city` VALUES (6624, 'Burundi', NULL, 'Gitega', NULL, 'GI', '基特加', NULL, '布隆迪', 'BDI');
INSERT INTO `st_region_city` VALUES (6625, 'Burundi', NULL, 'Karuzi', NULL, 'KR', '卡鲁济', NULL, '布隆迪', 'BDI');
INSERT INTO `st_region_city` VALUES (6626, 'Burundi', NULL, 'Kayanza', NULL, 'KY', '卡扬扎', NULL, '布隆迪', 'BDI');
INSERT INTO `st_region_city` VALUES (6627, 'Burundi', NULL, 'Cankuzo', NULL, 'CA', '坎库佐', NULL, '布隆迪', 'BDI');
INSERT INTO `st_region_city` VALUES (6628, 'Burundi', NULL, 'Rutana', NULL, 'RT', '鲁塔纳', NULL, '布隆迪', 'BDI');
INSERT INTO `st_region_city` VALUES (6629, 'Burundi', NULL, 'Ruyigi', NULL, 'RY', '鲁伊吉', NULL, '布隆迪', 'BDI');
INSERT INTO `st_region_city` VALUES (6630, 'Burundi', NULL, 'Makamba', NULL, 'MA', '马坎巴', NULL, '布隆迪', 'BDI');
INSERT INTO `st_region_city` VALUES (6631, 'Burundi', NULL, 'Muramvya', NULL, 'MU', '穆拉姆维亚', NULL, '布隆迪', 'BDI');
INSERT INTO `st_region_city` VALUES (6632, 'Burundi', NULL, 'Mwaro', NULL, 'MW', '穆瓦洛', NULL, '布隆迪', 'BDI');
INSERT INTO `st_region_city` VALUES (6633, 'Burundi', NULL, 'Muyinga', NULL, 'MY', '穆因加', NULL, '布隆迪', 'BDI');
INSERT INTO `st_region_city` VALUES (6634, 'Burundi', NULL, 'Cibitoke', NULL, 'CI', '锡比托凯', NULL, '布隆迪', 'BDI');
INSERT INTO `st_region_city` VALUES (6635, 'North Korea', NULL, 'Haeju', NULL, 'HAE', '海州', NULL, '朝鲜', 'PRK');
INSERT INTO `st_region_city` VALUES (6636, 'North Korea', NULL, 'Hyesan', NULL, 'HYE', '惠山', NULL, '朝鲜', 'PRK');
INSERT INTO `st_region_city` VALUES (6637, 'North Korea', NULL, 'Kanggye', NULL, 'KAN', '江界', NULL, '朝鲜', 'PRK');
INSERT INTO `st_region_city` VALUES (6638, 'North Korea', NULL, 'Kaesong', NULL, 'KSN', '开城', NULL, '朝鲜', 'PRK');
INSERT INTO `st_region_city` VALUES (6639, 'North Korea', NULL, 'Naseon', NULL, 'NAS', '罗先', NULL, '朝鲜', 'PRK');
INSERT INTO `st_region_city` VALUES (6640, 'North Korea', NULL, 'Namp\'o', NULL, 'NAM', '南浦', NULL, '朝鲜', 'PRK');
INSERT INTO `st_region_city` VALUES (6641, 'North Korea', NULL, 'Pyongyang', NULL, 'FNJ', '平壤', NULL, '朝鲜', 'PRK');
INSERT INTO `st_region_city` VALUES (6642, 'North Korea', NULL, 'Ch\'ongjin', NULL, 'CHO', '清津', NULL, '朝鲜', 'PRK');
INSERT INTO `st_region_city` VALUES (6643, 'North Korea', NULL, 'Sariwon', NULL, 'SAR', '沙里院', NULL, '朝鲜', 'PRK');
INSERT INTO `st_region_city` VALUES (6644, 'North Korea', NULL, 'Hamhung', NULL, 'HAM', '咸兴', NULL, '朝鲜', 'PRK');
INSERT INTO `st_region_city` VALUES (6645, 'North Korea', NULL, 'Sinuiju', NULL, 'SII', '新义州', NULL, '朝鲜', 'PRK');
INSERT INTO `st_region_city` VALUES (6646, 'North Korea', NULL, 'Wonsan', NULL, 'WON', '元山', NULL, '朝鲜', 'PRK');
INSERT INTO `st_region_city` VALUES (6647, 'Denmark', NULL, 'Aarhus', NULL, 'AR', '奥胡斯', NULL, '丹麦', 'DNK');
INSERT INTO `st_region_city` VALUES (6648, 'Denmark', NULL, 'Nordjylland', NULL, 'VSV', '北日德兰', NULL, '丹麦', 'DNK');
INSERT INTO `st_region_city` VALUES (6649, 'Denmark', NULL, 'Bornholm', NULL, 'BO', '博恩霍尔姆', NULL, '丹麦', 'DNK');
INSERT INTO `st_region_city` VALUES (6650, 'Denmark', NULL, 'Frederiksborg', NULL, 'FRE', '菲特烈堡', NULL, '丹麦', 'DNK');
INSERT INTO `st_region_city` VALUES (6651, 'Denmark', NULL, 'Fyn', NULL, 'FY', '菲茵', NULL, '丹麦', 'DNK');
INSERT INTO `st_region_city` VALUES (6652, 'Denmark', NULL, 'Copenhagen', NULL, 'CPH', '哥本哈根', NULL, '丹麦', 'DNK');
INSERT INTO `st_region_city` VALUES (6653, 'Denmark', NULL, 'Ribe', NULL, 'RIB', '里伯', NULL, '丹麦', 'DNK');
INSERT INTO `st_region_city` VALUES (6654, 'Denmark', NULL, 'Ringkoebing', NULL, 'RKG', '灵克宾', NULL, '丹麦', 'DNK');
INSERT INTO `st_region_city` VALUES (6655, 'Denmark', NULL, 'Roskilde', NULL, 'RKE', '罗斯基勒', NULL, '丹麦', 'DNK');
INSERT INTO `st_region_city` VALUES (6656, 'Denmark', NULL, 'Soenderjylland', NULL, 'VBI', '南日德兰', NULL, '丹麦', 'DNK');
INSERT INTO `st_region_city` VALUES (6657, 'Denmark', NULL, 'Storstroem', NULL, 'ST', '斯多斯特姆', NULL, '丹麦', 'DNK');
INSERT INTO `st_region_city` VALUES (6658, 'Denmark', NULL, 'Viborg', NULL, 'VIB', '维堡', NULL, '丹麦', 'DNK');
INSERT INTO `st_region_city` VALUES (6659, 'Denmark', NULL, 'Vejle', NULL, 'VEJ', '维厄勒', NULL, '丹麦', 'DNK');
INSERT INTO `st_region_city` VALUES (6660, 'Denmark', NULL, 'Vestsjaelland', NULL, 'VS', '西希兰', NULL, '丹麦', 'DNK');
INSERT INTO `st_region_city` VALUES (6661, 'Germany', NULL, 'Arnsberg', NULL, 'ARN', '阿恩斯贝格', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6662, 'Germany', NULL, 'Erfurt', NULL, 'ERF', '爱尔福特', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6663, 'Germany', NULL, 'Ansbach', NULL, 'ANS', '安斯巴格', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6664, 'Germany', NULL, 'Augsburg', NULL, 'AGB', '奥格斯堡', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6665, 'Germany', NULL, 'Berlin', NULL, 'BE', '柏林', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6666, 'Germany', NULL, 'Bayreuth', NULL, 'BYU', '拜伊罗特', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6667, 'Germany', NULL, 'Bielefeld', NULL, 'BFE', '比勒费尔德', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6668, 'Germany', NULL, 'Potsdam', NULL, 'POT', '波茨坦', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6669, 'Germany', NULL, 'Bochum', NULL, 'BOM', '波鸿', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6670, 'Germany', NULL, 'Bremen', NULL, 'HB', '不来梅', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6671, 'Germany', NULL, 'Brunswick', NULL, 'BRW', '不伦瑞克', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6672, 'Germany', NULL, 'Darmstadt', NULL, 'DAR', '达姆施塔特', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6673, 'Germany', NULL, 'Detmold', NULL, 'DET', '代特莫尔特', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6674, 'Germany', NULL, 'Dresden', NULL, 'DRS', '德累斯顿', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6675, 'Germany', NULL, 'Dessau', NULL, 'DES', '德绍', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6676, 'Germany', NULL, 'Dusseldorf', NULL, 'DUS', '杜塞尔多夫', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6677, 'Germany', NULL, 'Frankfurt', NULL, 'FFO', '法兰克福', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6678, 'Germany', NULL, 'Freiburg', NULL, 'FBG', '弗赖堡', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6679, 'Germany', NULL, 'Halle', NULL, 'HAE', '哈雷', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6680, 'Germany', NULL, 'Hamburg', NULL, 'HH', '汉堡', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6681, 'Germany', NULL, 'Hannover', NULL, 'HAJ', '汉诺威', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6682, 'Germany', NULL, 'Kiel', NULL, 'KEL', '基尔', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6683, 'Germany', NULL, 'GieBen', NULL, 'GBN', '吉森', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6684, 'Germany', NULL, 'Karlsruhe', NULL, 'KAE', '卡尔斯鲁厄', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6685, 'Germany', NULL, 'Kassel', NULL, 'KAS', '卡塞尔', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6686, 'Germany', NULL, 'Chemnitz', NULL, 'CHE', '开姆尼斯', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6687, 'Germany', NULL, 'Koblenz', NULL, 'KOB', '科布伦次', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6688, 'Germany', NULL, 'Cologne', NULL, 'CGN', '科隆', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6689, 'Germany', NULL, 'Leipzig', NULL, 'LEJ', '莱比锡', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6690, 'Germany', NULL, 'Landshut', NULL, 'LDH', '兰茨胡特', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6691, 'Germany', NULL, 'Luneburg', NULL, 'LBG', '吕讷堡', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6692, 'Germany', NULL, 'Magdeburg', NULL, 'MAG', '马格德堡', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6693, 'Germany', NULL, 'Mannheim', NULL, 'MHG', '曼海姆', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6694, 'Germany', NULL, 'Mainz', NULL, 'MAI', '美因兹', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6695, 'Germany', NULL, 'Muenster', NULL, 'MUN', '明斯特', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6696, 'Germany', NULL, 'Munich', NULL, 'MUC', '慕尼黑', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6697, 'Germany', NULL, 'Nuremberg', NULL, 'NUE', '纽伦堡', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6698, 'Germany', NULL, 'Schwerin', NULL, 'SWH', '什未林', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6699, 'Germany', NULL, 'Stuttgart', NULL, 'STR', '斯图加特', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6700, 'Germany', NULL, 'Trier', NULL, 'TRI', '特里尔', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6701, 'Germany', NULL, 'Wiesbaden', NULL, 'WIB', '威斯巴登', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6702, 'Germany', NULL, 'Wuerzburg', NULL, 'WUG', '维尔茨堡', NULL, '德国', 'DEU');
INSERT INTO `st_region_city` VALUES (6703, 'Timor-Leste', NULL, 'Aileu', NULL, 'AL', '阿伊莱乌', NULL, '东帝汶', 'TLS');
INSERT INTO `st_region_city` VALUES (6704, 'Timor-Leste', NULL, 'Ainaro', NULL, 'AN', '阿伊纳罗', NULL, '东帝汶', 'TLS');
INSERT INTO `st_region_city` VALUES (6705, 'Timor-Leste', NULL, 'Ermera', NULL, 'ER', '埃尔梅拉', NULL, '东帝汶', 'TLS');
INSERT INTO `st_region_city` VALUES (6706, 'Timor-Leste', NULL, 'Ambeno', NULL, 'AM', '安贝诺', NULL, '东帝汶', 'TLS');
INSERT INTO `st_region_city` VALUES (6707, 'Timor-Leste', NULL, 'Baucau', NULL, 'BA', '包考', NULL, '东帝汶', 'TLS');
INSERT INTO `st_region_city` VALUES (6708, 'Timor-Leste', NULL, 'Bobonaro', NULL, 'BO', '博博纳罗', NULL, '东帝汶', 'TLS');
INSERT INTO `st_region_city` VALUES (6709, 'Timor-Leste', NULL, 'Dili', NULL, 'DI', '帝力', NULL, '东帝汶', 'TLS');
INSERT INTO `st_region_city` VALUES (6710, 'Timor-Leste', NULL, 'Kovalima', NULL, 'KO', '科瓦利马', NULL, '东帝汶', 'TLS');
INSERT INTO `st_region_city` VALUES (6711, 'Timor-Leste', NULL, 'Lautem', NULL, 'LA', '劳滕', NULL, '东帝汶', 'TLS');
INSERT INTO `st_region_city` VALUES (6712, 'Timor-Leste', NULL, 'Liquica', NULL, 'LI', '利基卡', NULL, '东帝汶', 'TLS');
INSERT INTO `st_region_city` VALUES (6713, 'Timor-Leste', NULL, 'Manatuto', NULL, 'MT', '马纳图托', NULL, '东帝汶', 'TLS');
INSERT INTO `st_region_city` VALUES (6714, 'Timor-Leste', NULL, 'Manofahi', NULL, 'MF', '马努法伊', NULL, '东帝汶', 'TLS');
INSERT INTO `st_region_city` VALUES (6715, 'Timor-Leste', NULL, 'Viqueque', NULL, 'VI', '维克克', NULL, '东帝汶', 'TLS');
INSERT INTO `st_region_city` VALUES (6716, 'Togo', NULL, 'Maritime', NULL, 'M', '滨海区', NULL, '多哥', 'TGO');
INSERT INTO `st_region_city` VALUES (6717, 'Togo', NULL, 'Savanes', NULL, 'S', '草原区', NULL, '多哥', 'TGO');
INSERT INTO `st_region_city` VALUES (6718, 'Togo', NULL, 'Plateaux', NULL, 'P', '高原区', NULL, '多哥', 'TGO');
INSERT INTO `st_region_city` VALUES (6719, 'Togo', NULL, 'Kara', NULL, 'K', '卡拉区', NULL, '多哥', 'TGO');
INSERT INTO `st_region_city` VALUES (6720, 'Togo', NULL, 'Centre', NULL, 'C', '中部区', NULL, '多哥', 'TGO');
INSERT INTO `st_region_city` VALUES (6721, 'Russia', NULL, 'Abakan', NULL, 'ABA', '阿巴坎', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6722, 'Russia', NULL, 'Arkhangelsk', NULL, 'ARK', '阿尔汉格尔斯克', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6723, 'Russia', NULL, 'Aginskoye', NULL, 'AGI', '阿金斯科耶', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6724, 'Russia', NULL, 'Anadyr', NULL, 'DYR', '阿纳德尔', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6725, 'Russia', NULL, 'Astrakhan', NULL, 'AST', '阿斯特拉罕', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6726, 'Russia', NULL, 'Elista', NULL, 'ESL', '埃利斯塔', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6727, 'Russia', NULL, 'Orel', NULL, 'ORL', '奥廖尔', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6728, 'Russia', NULL, 'Orenburg', NULL, 'ORE', '奥伦堡', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6729, 'Russia', NULL, 'Barnaul', NULL, 'BAX', '巴尔瑙尔', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6730, 'Russia', NULL, 'Penza', NULL, 'PNZ', '奔萨', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6731, 'Russia', NULL, 'Petropavlovsk-Kamchatskiy', NULL, 'PKC', '彼得罗巴甫洛夫斯克', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6732, 'Russia', NULL, 'Petrozavodsk', NULL, 'PES', '彼得罗扎沃茨克', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6733, 'Russia', NULL, 'Perm', NULL, 'PER', '彼尔姆', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6734, 'Russia', NULL, 'Birobidzan', NULL, 'BBZ', '比罗比詹', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6735, 'Russia', NULL, 'Belgorod', NULL, 'BEL', '别尔哥罗德', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6736, 'Russia', NULL, 'Chabarovsk', NULL, 'COK', '伯力', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6737, 'Russia', NULL, 'Blagoveshchensk', NULL, 'BQS', '布拉戈维申斯克', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6738, 'Russia', NULL, 'Bryansk', NULL, 'BRY', '布良斯克', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6739, 'Russia', NULL, 'Chelyabinsk', NULL, 'CHE', '车里雅宾斯克', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6740, 'Russia', NULL, 'Chita', NULL, 'CHI', '赤塔', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6741, 'Russia', NULL, 'Rostov-na-Donu', NULL, 'ROS', '顿河畔罗斯托夫', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6742, 'Russia', NULL, 'Omsk', NULL, 'OMS', '鄂木斯克', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6743, 'Russia', NULL, 'Volgograd', NULL, 'VOG', '伏尔加格勒', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6744, 'Russia', NULL, 'Vladimir', NULL, 'VMR', '弗拉基米尔', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6745, 'Russia', NULL, 'Vladikavkaz', NULL, 'VLA', '弗拉季高加索', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6746, 'Russia', NULL, 'Gorno-Altajsk', NULL, 'GOA', '戈尔诺－阿尔泰斯克', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6747, 'Russia', NULL, 'Grozny', NULL, 'GRV', '格罗兹尼', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6748, 'Russia', NULL, 'Vladivostok', NULL, 'VVO', '海参崴', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6749, 'Russia', NULL, 'Khanty-Mansiysk', NULL, 'KHM', '汉特－曼西斯克', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6750, 'Russia', NULL, 'Kirov', NULL, 'KIR', '基洛夫', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6751, 'Russia', NULL, 'Kaliningrad', NULL, 'KGD', '加里宁格勒', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6752, 'Russia', NULL, 'Kazan', NULL, 'KZN', '喀山', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6753, 'Russia', NULL, 'Kaluga', NULL, 'KLF', '卡卢加', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6754, 'Russia', NULL, 'Kostroma', NULL, 'KOS', '科斯特罗马', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6755, 'Russia', NULL, 'Krasnodar', NULL, 'KRR', '克拉斯诺达尔', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6756, 'Russia', NULL, 'Krasnojarsk', NULL, 'KYA', '克拉斯诺亚尔斯克', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6757, 'Russia', NULL, 'Kemerovo', NULL, 'KEM', '克麦罗沃', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6758, 'Russia', NULL, 'Kyzyl', NULL, 'KYZ', '克孜勒', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6759, 'Russia', NULL, 'Kudymkar', NULL, 'KUD', '库德姆卡尔', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6760, 'Russia', NULL, 'Kurgan', NULL, 'KRO', '库尔干', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6761, 'Russia', NULL, 'Kursk', NULL, 'URS', '库尔斯克', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6762, 'Russia', NULL, 'Lipeck', NULL, 'LIP', '利佩茨克', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6763, 'Russia', NULL, 'Ryazan', NULL, 'RYA', '梁赞', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6764, 'Russia', NULL, 'Makhachkala', NULL, 'MCX', '马哈奇卡拉', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6765, 'Russia', NULL, 'Magadan', NULL, 'MAG', '马加丹', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6766, 'Russia', NULL, 'Magas', NULL, 'IN', '马加斯', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6767, 'Russia', NULL, 'Maykop', NULL, 'MAY', '迈科普', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6768, 'Russia', NULL, 'Murmansk', NULL, 'MMK', '摩尔曼斯克', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6769, 'Russia', NULL, 'Moscow', NULL, 'MOW', '莫斯科', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6770, 'Russia', NULL, 'Nalchik', NULL, 'NAL', '纳尔奇克', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6771, 'Russia', NULL, 'Naryan-Mar', NULL, 'NNM', '纳里扬马尔', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6772, 'Russia', NULL, 'Juzno-Sachalinsk', NULL, 'JSA', '南萨哈林斯克', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6773, 'Russia', NULL, 'Velikij Novgorod', NULL, 'VUS', '诺夫哥罗德', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6774, 'Russia', NULL, 'Palana', NULL, 'PAL', '帕拉纳', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6775, 'Russia', NULL, 'Pskov', NULL, 'PSK', '普斯科夫', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6776, 'Russia', NULL, 'Cheboksary', NULL, 'CSY', '切博克萨雷', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6777, 'Russia', NULL, 'Cherkessk', NULL, 'CKS', '切尔克斯克', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6778, 'Russia', NULL, 'Tyumen', NULL, 'TYU', '秋明', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6779, 'Russia', NULL, 'Saratov', NULL, 'SAR', '萨拉托夫', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6780, 'Russia', NULL, 'Saransk', NULL, 'SKX', '萨兰斯克', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6781, 'Russia', NULL, 'Salekhard', NULL, 'SLY', '萨列哈尔德', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6782, 'Russia', NULL, 'Samara', NULL, 'SAM', '萨马拉', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6783, 'Russia', NULL, 'Syktyvkar', NULL, 'SCW', '瑟克特夫卡尔', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6784, 'Russia', NULL, 'St. Peterburg', NULL, 'SPE', '圣彼得堡', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6785, 'Russia', NULL, 'Smolensk', NULL, 'LNX', '斯摩棱斯克', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6786, 'Russia', NULL, 'Stavropol', NULL, 'STA', '斯塔夫罗波尔', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6787, 'Russia', NULL, 'Tambov', NULL, 'TAM', '坦波夫', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6788, 'Russia', NULL, 'Tver', NULL, 'TVE', '特维尔', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6789, 'Russia', NULL, 'Tula', NULL, 'TUL', '图拉', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6790, 'Russia', NULL, 'Tomsk', NULL, 'TOM', '托木斯克', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6791, 'Russia', NULL, 'Voronezh', NULL, 'VOR', '沃罗涅什', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6792, 'Russia', NULL, 'Vologda', NULL, 'VLG', '沃洛格达', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6793, 'Russia', NULL, 'Ufa', NULL, 'UFA', '乌法', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6794, 'Russia', NULL, 'Ulan-Ude', NULL, 'UUD', '乌兰乌德', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6795, 'Russia', NULL, 'Uljanovsk', NULL, 'ULY', '乌里扬诺夫斯克', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6796, 'Russia', NULL, 'Ust-Ordynsky', NULL, 'UOB', '乌斯季奥尔登斯基', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6797, 'Russia', NULL, 'Niznij Novgorod', NULL, 'GOJ', '下诺夫哥罗德', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6798, 'Russia', NULL, 'Novosibirsk', NULL, 'NVS', '新西伯利亚', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6799, 'Russia', NULL, 'Jakutsk', NULL, 'JAK', '雅库茨克', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6800, 'Russia', NULL, 'Jaroslavl', NULL, 'JAR', '雅罗斯拉夫尔', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6801, 'Russia', NULL, 'Jekaterinburg', NULL, 'JEK', '叶卡捷林堡', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6802, 'Russia', NULL, 'Irkutsk', NULL, 'IKT', '伊尔库茨克', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6803, 'Russia', NULL, 'Izhevsk', NULL, 'IJK', '伊热夫斯克', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6804, 'Russia', NULL, 'Ivanovo', NULL, 'IVO', '伊万诺沃', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6805, 'Russia', NULL, 'Yoshkar-Ola', NULL, 'YOL', '约什卡尔奥拉', NULL, '俄罗斯', 'RUS');
INSERT INTO `st_region_city` VALUES (6806, 'Ecuador', NULL, 'Azuay', NULL, 'A', '阿苏艾', NULL, '厄瓜多尔', 'ECU');
INSERT INTO `st_region_city` VALUES (6807, 'Ecuador', NULL, 'El Oro', NULL, 'O', '埃尔奥罗', NULL, '厄瓜多尔', 'ECU');
INSERT INTO `st_region_city` VALUES (6808, 'Ecuador', NULL, 'Esmeraldas', NULL, 'E', '埃斯梅拉尔达斯', NULL, '厄瓜多尔', 'ECU');
INSERT INTO `st_region_city` VALUES (6809, 'Ecuador', NULL, 'Bolivar', NULL, 'B', '玻利瓦尔', NULL, '厄瓜多尔', 'ECU');
INSERT INTO `st_region_city` VALUES (6810, 'Ecuador', NULL, 'Guayas', NULL, 'G', '瓜亚斯', NULL, '厄瓜多尔', 'ECU');
INSERT INTO `st_region_city` VALUES (6811, 'Ecuador', NULL, 'Galapagos', NULL, 'W', '加拉帕戈斯', NULL, '厄瓜多尔', 'ECU');
INSERT INTO `st_region_city` VALUES (6812, 'Ecuador', NULL, 'Carchi', NULL, 'C', '卡尔奇', NULL, '厄瓜多尔', 'ECU');
INSERT INTO `st_region_city` VALUES (6813, 'Ecuador', NULL, 'Canar', NULL, 'F', '卡尼亚尔', NULL, '厄瓜多尔', 'ECU');
INSERT INTO `st_region_city` VALUES (6814, 'Ecuador', NULL, 'Cotopaxi', NULL, 'X', '科托帕希', NULL, '厄瓜多尔', 'ECU');
INSERT INTO `st_region_city` VALUES (6815, 'Ecuador', NULL, 'Loja', NULL, 'L', '洛哈', NULL, '厄瓜多尔', 'ECU');
INSERT INTO `st_region_city` VALUES (6816, 'Ecuador', NULL, 'Los Rios', NULL, 'R', '洛斯里奥斯', NULL, '厄瓜多尔', 'ECU');
INSERT INTO `st_region_city` VALUES (6817, 'Ecuador', NULL, 'Manabi', NULL, 'M', '马纳比', NULL, '厄瓜多尔', 'ECU');
INSERT INTO `st_region_city` VALUES (6818, 'Ecuador', NULL, 'Morona-Santiago', NULL, 'S', '莫罗纳－圣地亚哥', NULL, '厄瓜多尔', 'ECU');
INSERT INTO `st_region_city` VALUES (6819, 'Ecuador', NULL, 'Napo, Orellana', NULL, 'D', '纳波，奥雷利亚纳', NULL, '厄瓜多尔', 'ECU');
INSERT INTO `st_region_city` VALUES (6820, 'Ecuador', NULL, 'Pastaza', NULL, 'Y', '帕斯塔萨', NULL, '厄瓜多尔', 'ECU');
INSERT INTO `st_region_city` VALUES (6821, 'Ecuador', NULL, 'Pichincha', NULL, 'P', '皮钦查', NULL, '厄瓜多尔', 'ECU');
INSERT INTO `st_region_city` VALUES (6822, 'Ecuador', NULL, 'Chimborazo', NULL, 'H', '钦博拉索', NULL, '厄瓜多尔', 'ECU');
INSERT INTO `st_region_city` VALUES (6823, 'Ecuador', NULL, 'Zamora-Chinchipe', NULL, 'Z', '萨莫拉－钦奇佩', NULL, '厄瓜多尔', 'ECU');
INSERT INTO `st_region_city` VALUES (6824, 'Ecuador', NULL, 'Sucumbios', NULL, 'U', '苏昆毕奥斯', NULL, '厄瓜多尔', 'ECU');
INSERT INTO `st_region_city` VALUES (6825, 'Ecuador', NULL, 'Tungurahua', NULL, 'T', '通古拉瓦', NULL, '厄瓜多尔', 'ECU');
INSERT INTO `st_region_city` VALUES (6826, 'Ecuador', NULL, 'Imbabura', NULL, 'I', '因巴布拉', NULL, '厄瓜多尔', 'ECU');
INSERT INTO `st_region_city` VALUES (6827, 'Eritrea', NULL, 'Anseba', NULL, 'KE', '安塞巴', NULL, '厄立特里亚', 'ERI');
INSERT INTO `st_region_city` VALUES (6828, 'Eritrea', NULL, 'Semenawi Keyih Bahri', NULL, 'SK', '北红海', NULL, '厄立特里亚', 'ERI');
INSERT INTO `st_region_city` VALUES (6829, 'Eritrea', NULL, 'Gash Barka', NULL, 'BR', '加什·巴尔卡', NULL, '厄立特里亚', 'ERI');
INSERT INTO `st_region_city` VALUES (6830, 'Eritrea', NULL, 'Debub', NULL, 'DE', '南部', NULL, '厄立特里亚', 'ERI');
INSERT INTO `st_region_city` VALUES (6831, 'Eritrea', NULL, 'Debubawi Keyih Bahri', NULL, 'DK', '南红海', NULL, '厄立特里亚', 'ERI');
INSERT INTO `st_region_city` VALUES (6832, 'Eritrea', NULL, 'Maekel', NULL, 'MA', '中部', NULL, '厄立特里亚', 'ERI');
INSERT INTO `st_region_city` VALUES (6833, 'France', NULL, 'Arles', NULL, 'ARL', '阿尔勒', NULL, '法国', 'FRA');
INSERT INTO `st_region_city` VALUES (6834, 'France', NULL, 'Ajaccio', NULL, 'AJA', '阿雅克修', NULL, '法国', 'FRA');
INSERT INTO `st_region_city` VALUES (6835, 'France', NULL, 'Aix-en-Provence', NULL, 'QXB', '艾克斯', NULL, '法国', 'FRA');
INSERT INTO `st_region_city` VALUES (6836, 'France', NULL, 'Orleans', NULL, 'ORR', '奥尔良', NULL, '法国', 'FRA');
INSERT INTO `st_region_city` VALUES (6837, 'France', NULL, 'Paris', NULL, 'PAR', '巴黎', NULL, '法国', 'FRA');
INSERT INTO `st_region_city` VALUES (6838, 'France', NULL, 'Besancon', NULL, 'BSN', '贝桑松', NULL, '法国', 'FRA');
INSERT INTO `st_region_city` VALUES (6839, 'France', NULL, 'Dijon', NULL, 'DIJ', '第戎', NULL, '法国', 'FRA');
INSERT INTO `st_region_city` VALUES (6840, 'France', NULL, 'Frejus', NULL, 'FRJ', '弗雷瑞斯', NULL, '法国', 'FRA');
INSERT INTO `st_region_city` VALUES (6841, 'France', NULL, 'Caen', NULL, 'CFR', '卡昂', NULL, '法国', 'FRA');
INSERT INTO `st_region_city` VALUES (6842, 'France', NULL, 'Rennes', NULL, 'RNS', '雷恩', NULL, '法国', 'FRA');
INSERT INTO `st_region_city` VALUES (6843, 'France', NULL, 'Lyon', NULL, 'LIO', '里昂', NULL, '法国', 'FRA');
INSERT INTO `st_region_city` VALUES (6844, 'France', NULL, 'Lille', NULL, 'LLE', '里尔', NULL, '法国', 'FRA');
INSERT INTO `st_region_city` VALUES (6845, 'France', NULL, 'Limoges', NULL, 'LIG', '利摩日', NULL, '法国', 'FRA');
INSERT INTO `st_region_city` VALUES (6846, 'France', NULL, 'Rouen', NULL, 'URO', '鲁昂', NULL, '法国', 'FRA');
INSERT INTO `st_region_city` VALUES (6847, 'France', NULL, 'Marseille', NULL, 'MRS', '马赛', NULL, '法国', 'FRA');
INSERT INTO `st_region_city` VALUES (6848, 'France', NULL, 'Metz', NULL, 'MZM', '梅斯', NULL, '法国', 'FRA');
INSERT INTO `st_region_city` VALUES (6849, 'France', NULL, 'Montpellier', NULL, 'MPL', '蒙彼利埃', NULL, '法国', 'FRA');
INSERT INTO `st_region_city` VALUES (6850, 'France', NULL, 'Nantes', NULL, 'NTE', '南特', NULL, '法国', 'FRA');
INSERT INTO `st_region_city` VALUES (6851, 'France', NULL, 'Nice', NULL, 'NCE', '尼斯', NULL, '法国', 'FRA');
INSERT INTO `st_region_city` VALUES (6852, 'France', NULL, 'Chalons-en-Champagne', NULL, 'CSM', '沙隆', NULL, '法国', 'FRA');
INSERT INTO `st_region_city` VALUES (6853, 'France', NULL, 'Toulouse', NULL, 'TLS', '图卢兹', NULL, '法国', 'FRA');
INSERT INTO `st_region_city` VALUES (6854, 'France', NULL, 'Valence', NULL, 'VAA', '瓦朗斯', NULL, '法国', 'FRA');
INSERT INTO `st_region_city` VALUES (6855, 'France', NULL, 'Amiens', NULL, 'AMI', '亚眠', NULL, '法国', 'FRA');
INSERT INTO `st_region_city` VALUES (6856, 'Philippines', NULL, 'Davao', NULL, 'DOR', '达沃', NULL, '菲律宾', 'PHL');
INSERT INTO `st_region_city` VALUES (6857, 'Philippines', NULL, 'Caloocan', NULL, 'CAO', '卡卢坎', NULL, '菲律宾', 'PHL');
INSERT INTO `st_region_city` VALUES (6858, 'Philippines', NULL, 'Manila', NULL, 'MNL', '马尼拉', NULL, '菲律宾', 'PHL');
INSERT INTO `st_region_city` VALUES (6859, 'Philippines', NULL, 'Cebu', NULL, 'CEB', '宿务', NULL, '菲律宾', 'PHL');
INSERT INTO `st_region_city` VALUES (6860, 'Finland', NULL, 'Espoo', NULL, 'ESP', '埃斯波', NULL, '芬兰', 'FIN');
INSERT INTO `st_region_city` VALUES (6861, 'Finland', NULL, 'Oulu', NULL, 'OLU', '奥卢', NULL, '芬兰', 'FIN');
INSERT INTO `st_region_city` VALUES (6862, 'Finland', NULL, 'Pori', NULL, 'POR', '波里', NULL, '芬兰', 'FIN');
INSERT INTO `st_region_city` VALUES (6863, 'Finland', NULL, 'Porvoo', NULL, 'PRV', '博尔沃', NULL, '芬兰', 'FIN');
INSERT INTO `st_region_city` VALUES (6864, 'Finland', NULL, 'Hameenlinna', NULL, 'HMY', '海门林纳', NULL, '芬兰', 'FIN');
INSERT INTO `st_region_city` VALUES (6865, 'Finland', NULL, 'Helsinki', NULL, 'HEL', '赫尔辛基', NULL, '芬兰', 'FIN');
INSERT INTO `st_region_city` VALUES (6866, 'Finland', NULL, 'Kajaani', NULL, 'KAJ', '卡亚尼', NULL, '芬兰', 'FIN');
INSERT INTO `st_region_city` VALUES (6867, 'Finland', NULL, 'Kokkola', NULL, 'KOK', '科科拉', NULL, '芬兰', 'FIN');
INSERT INTO `st_region_city` VALUES (6868, 'Finland', NULL, 'Kotka', NULL, 'KTK', '科特卡', NULL, '芬兰', 'FIN');
INSERT INTO `st_region_city` VALUES (6869, 'Finland', NULL, 'Kuopio', NULL, 'KUO', '库奥皮奥', NULL, '芬兰', 'FIN');
INSERT INTO `st_region_city` VALUES (6870, 'Finland', NULL, 'Lahti', NULL, 'LHI', '拉赫蒂', NULL, '芬兰', 'FIN');
INSERT INTO `st_region_city` VALUES (6871, 'Finland', NULL, 'Lappeenranta', NULL, 'LPP', '拉彭兰塔', NULL, '芬兰', 'FIN');
INSERT INTO `st_region_city` VALUES (6872, 'Finland', NULL, 'Rovaniemi', NULL, 'RVN', '罗瓦涅米', NULL, '芬兰', 'FIN');
INSERT INTO `st_region_city` VALUES (6873, 'Finland', NULL, 'Mariehamn', NULL, 'MHQ', '玛丽港', NULL, '芬兰', 'FIN');
INSERT INTO `st_region_city` VALUES (6874, 'Finland', NULL, 'Mikkeli', NULL, 'MIK', '米凯利', NULL, '芬兰', 'FIN');
INSERT INTO `st_region_city` VALUES (6875, 'Finland', NULL, 'Tampere', NULL, 'TMP', '坦佩雷', NULL, '芬兰', 'FIN');
INSERT INTO `st_region_city` VALUES (6876, 'Finland', NULL, 'Turku', NULL, 'TKU', '图尔库', NULL, '芬兰', 'FIN');
INSERT INTO `st_region_city` VALUES (6877, 'Finland', NULL, 'Vaasa', NULL, 'VAA', '瓦萨', NULL, '芬兰', 'FIN');
INSERT INTO `st_region_city` VALUES (6878, 'Finland', NULL, 'Vantaa', NULL, 'VAT', '万塔', NULL, '芬兰', 'FIN');
INSERT INTO `st_region_city` VALUES (6879, 'Finland', NULL, 'Joensuu', NULL, 'JOE', '约恩苏', NULL, '芬兰', 'FIN');
INSERT INTO `st_region_city` VALUES (6880, 'Cape Verde', NULL, 'Paul', NULL, 'PA', '保尔', NULL, '佛得角', 'CPV');
INSERT INTO `st_region_city` VALUES (6881, 'Cape Verde', NULL, 'Porto Novo', NULL, 'PN', '波多诺伏', NULL, '佛得角', 'CPV');
INSERT INTO `st_region_city` VALUES (6882, 'Cape Verde', NULL, 'Boa Vista', NULL, 'BV', '博阿维斯塔岛', NULL, '佛得角', 'CPV');
INSERT INTO `st_region_city` VALUES (6883, 'Cape Verde', NULL, 'Brava', NULL, 'BR', '布拉瓦岛', NULL, '佛得角', 'CPV');
INSERT INTO `st_region_city` VALUES (6884, 'Cape Verde', NULL, 'Ribeira Grande', NULL, 'RG', '大里贝拉', NULL, '佛得角', 'CPV');
INSERT INTO `st_region_city` VALUES (6885, 'Cape Verde', NULL, 'Fogo', NULL, 'FO', '福古岛', NULL, '佛得角', 'CPV');
INSERT INTO `st_region_city` VALUES (6886, 'Cape Verde', NULL, 'Maio', NULL, 'MA', '马尤岛', NULL, '佛得角', 'CPV');
INSERT INTO `st_region_city` VALUES (6887, 'Cape Verde', NULL, 'Mosteiros', NULL, 'MO', '莫斯特罗', NULL, '佛得角', 'CPV');
INSERT INTO `st_region_city` VALUES (6888, 'Cape Verde', NULL, 'Praia', NULL, 'PR', '普拉亚', NULL, '佛得角', 'CPV');
INSERT INTO `st_region_city` VALUES (6889, 'Cape Verde', NULL, 'Sal', NULL, 'SL', '萨尔岛', NULL, '佛得角', 'CPV');
INSERT INTO `st_region_city` VALUES (6890, 'Cape Verde', NULL, 'Santo Antao', NULL, 'SA', '圣安唐岛', NULL, '佛得角', 'CPV');
INSERT INTO `st_region_city` VALUES (6891, 'Cape Verde', NULL, 'Santiago', NULL, 'IA', '圣地亚哥岛', NULL, '佛得角', 'CPV');
INSERT INTO `st_region_city` VALUES (6892, 'Cape Verde', NULL, 'Sao Domingos', NULL, 'SD', '圣多明戈', NULL, '佛得角', 'CPV');
INSERT INTO `st_region_city` VALUES (6893, 'Cape Verde', NULL, 'Sao Filipe', NULL, 'SF', '圣菲利普', NULL, '佛得角', 'CPV');
INSERT INTO `st_region_city` VALUES (6894, 'Cape Verde', NULL, 'Santa Catarina', NULL, 'CA', '圣卡塔琳娜', NULL, '佛得角', 'CPV');
INSERT INTO `st_region_city` VALUES (6895, 'Cape Verde', NULL, 'Santa Cruz', NULL, 'CR', '圣克鲁斯', NULL, '佛得角', 'CPV');
INSERT INTO `st_region_city` VALUES (6896, 'Cape Verde', NULL, 'Sao Miguel', NULL, 'SM', '圣米戈尔', NULL, '佛得角', 'CPV');
INSERT INTO `st_region_city` VALUES (6897, 'Cape Verde', NULL, 'Sao Nicolau', NULL, 'SN', '圣尼古拉岛', NULL, '佛得角', 'CPV');
INSERT INTO `st_region_city` VALUES (6898, 'Cape Verde', NULL, 'Sao Vicente', NULL, 'SV', '圣维森特岛', NULL, '佛得角', 'CPV');
INSERT INTO `st_region_city` VALUES (6899, 'Cape Verde', NULL, 'Tarrafal', NULL, 'TA', '塔拉法尔', NULL, '佛得角', 'CPV');
INSERT INTO `st_region_city` VALUES (6900, 'Colombia', NULL, 'Arauca', NULL, 'ARA', '阿劳卡', NULL, '哥伦比亚', 'COL');
INSERT INTO `st_region_city` VALUES (6901, 'Colombia', NULL, 'Antioquia', NULL, 'ANT', '安提奥基亚', NULL, '哥伦比亚', 'COL');
INSERT INTO `st_region_city` VALUES (6902, 'Colombia', NULL, 'Norte de Santander', NULL, 'NDS', '北桑坦德', NULL, '哥伦比亚', 'COL');
INSERT INTO `st_region_city` VALUES (6903, 'Colombia', NULL, 'Bogota', NULL, 'BDC', '波哥大首都区', NULL, '哥伦比亚', 'COL');
INSERT INTO `st_region_city` VALUES (6904, 'Colombia', NULL, 'Bolivar', NULL, 'BOL', '博利瓦尔', NULL, '哥伦比亚', 'COL');
INSERT INTO `st_region_city` VALUES (6905, 'Colombia', NULL, 'Boyaca', NULL, 'BOY', '博亚卡', NULL, '哥伦比亚', 'COL');
INSERT INTO `st_region_city` VALUES (6906, 'Colombia', NULL, 'Atlantico', NULL, 'ATL', '大西洋', NULL, '哥伦比亚', 'COL');
INSERT INTO `st_region_city` VALUES (6907, 'Colombia', NULL, 'Guaviare', NULL, 'GVR', '瓜维亚雷', NULL, '哥伦比亚', 'COL');
INSERT INTO `st_region_city` VALUES (6908, 'Colombia', NULL, 'La Guajira', NULL, 'GJR', '瓜希拉', NULL, '哥伦比亚', 'COL');
INSERT INTO `st_region_city` VALUES (6909, 'Colombia', NULL, 'Guainia', NULL, 'GNA', '瓜伊尼亚', NULL, '哥伦比亚', 'COL');
INSERT INTO `st_region_city` VALUES (6910, 'Colombia', NULL, 'Quindio', NULL, 'QUI', '金迪奥', NULL, '哥伦比亚', 'COL');
INSERT INTO `st_region_city` VALUES (6911, 'Colombia', NULL, 'Caldas', NULL, 'CAL', '卡尔达斯', NULL, '哥伦比亚', 'COL');
INSERT INTO `st_region_city` VALUES (6912, 'Colombia', NULL, 'Caqueta', NULL, 'CAQ', '卡克塔', NULL, '哥伦比亚', 'COL');
INSERT INTO `st_region_city` VALUES (6913, 'Colombia', NULL, 'Casanare', NULL, 'CAS', '卡萨纳雷', NULL, '哥伦比亚', 'COL');
INSERT INTO `st_region_city` VALUES (6914, 'Colombia', NULL, 'Cauca', NULL, 'CAU', '考卡', NULL, '哥伦比亚', 'COL');
INSERT INTO `st_region_city` VALUES (6915, 'Colombia', NULL, 'Valle del Cauca', NULL, 'VDC', '考卡山谷', NULL, '哥伦比亚', 'COL');
INSERT INTO `st_region_city` VALUES (6916, 'Colombia', NULL, 'Cordoba', NULL, 'COR', '科尔多巴', NULL, '哥伦比亚', 'COL');
INSERT INTO `st_region_city` VALUES (6917, 'Colombia', NULL, 'Cundinamarca', NULL, 'CAM', '昆迪纳马卡', NULL, '哥伦比亚', 'COL');
INSERT INTO `st_region_city` VALUES (6918, 'Colombia', NULL, 'Risaralda', NULL, 'RIS', '利萨拉尔达', NULL, '哥伦比亚', 'COL');
INSERT INTO `st_region_city` VALUES (6919, 'Colombia', NULL, 'Magdalena', NULL, 'MAG', '马格达雷那', NULL, '哥伦比亚', 'COL');
INSERT INTO `st_region_city` VALUES (6920, 'Colombia', NULL, 'Meta', NULL, 'MET', '梅塔', NULL, '哥伦比亚', 'COL');
INSERT INTO `st_region_city` VALUES (6921, 'Colombia', NULL, 'Narino', NULL, 'NAR', '纳里尼奥', NULL, '哥伦比亚', 'COL');
INSERT INTO `st_region_city` VALUES (6922, 'Colombia', NULL, 'Putumayo', NULL, 'PUT', '普图马约', NULL, '哥伦比亚', 'COL');
INSERT INTO `st_region_city` VALUES (6923, 'Colombia', NULL, 'Choco', NULL, 'CHO', '乔科', NULL, '哥伦比亚', 'COL');
INSERT INTO `st_region_city` VALUES (6924, 'Colombia', NULL, 'Cesar', NULL, 'CES', '塞萨尔', NULL, '哥伦比亚', 'COL');
INSERT INTO `st_region_city` VALUES (6925, 'Colombia', NULL, 'Santander', NULL, 'SAN', '桑坦德', NULL, '哥伦比亚', 'COL');
INSERT INTO `st_region_city` VALUES (6926, 'Colombia', NULL, 'San Andres y Providencia', NULL, 'SAP', '圣安德烈斯-普罗维登西亚', NULL, '哥伦比亚', 'COL');
INSERT INTO `st_region_city` VALUES (6927, 'Colombia', NULL, 'Sucre', NULL, 'SUC', '苏克雷', NULL, '哥伦比亚', 'COL');
INSERT INTO `st_region_city` VALUES (6928, 'Colombia', NULL, 'Tolima', NULL, 'TOL', '托利马', NULL, '哥伦比亚', 'COL');
INSERT INTO `st_region_city` VALUES (6929, 'Colombia', NULL, 'Vichada', NULL, 'VIC', '维查达', NULL, '哥伦比亚', 'COL');
INSERT INTO `st_region_city` VALUES (6930, 'Colombia', NULL, 'Vaupes', NULL, 'VAU', '沃佩斯', NULL, '哥伦比亚', 'COL');
INSERT INTO `st_region_city` VALUES (6931, 'Colombia', NULL, 'Huila', NULL, 'HUI', '乌伊拉', NULL, '哥伦比亚', 'COL');
INSERT INTO `st_region_city` VALUES (6932, 'Colombia', NULL, 'Amazonas', NULL, 'AMZ', '亚马孙', NULL, '哥伦比亚', 'COL');
INSERT INTO `st_region_city` VALUES (6933, 'Costa Rica', NULL, 'Alajuela', NULL, 'A', '阿拉胡埃拉', NULL, '哥斯达黎加', 'CRI');
INSERT INTO `st_region_city` VALUES (6934, 'Costa Rica', NULL, 'Heredia', NULL, 'H', '埃雷迪亚', NULL, '哥斯达黎加', 'CRI');
INSERT INTO `st_region_city` VALUES (6935, 'Costa Rica', NULL, 'Guanacaste', NULL, 'G', '瓜纳卡斯特', NULL, '哥斯达黎加', 'CRI');
INSERT INTO `st_region_city` VALUES (6936, 'Costa Rica', NULL, 'Cartago', NULL, 'C', '卡塔戈', NULL, '哥斯达黎加', 'CRI');
INSERT INTO `st_region_city` VALUES (6937, 'Costa Rica', NULL, 'Limon', NULL, 'L', '利蒙', NULL, '哥斯达黎加', 'CRI');
INSERT INTO `st_region_city` VALUES (6938, 'Costa Rica', NULL, 'Puntarenas', NULL, 'P', '蓬塔雷纳斯', NULL, '哥斯达黎加', 'CRI');
INSERT INTO `st_region_city` VALUES (6939, 'Costa Rica', NULL, 'San Jose', NULL, 'SJ', '圣何塞', NULL, '哥斯达黎加', 'CRI');
INSERT INTO `st_region_city` VALUES (6940, 'Cuba', NULL, 'Holguin', NULL, '11', '奥尔金', NULL, '古巴', 'CUB');
INSERT INTO `st_region_city` VALUES (6941, 'Cuba', NULL, 'Pinar del Rio', NULL, '1', '比那尔德里奥', NULL, '古巴', 'CUB');
INSERT INTO `st_region_city` VALUES (6942, 'Cuba', NULL, 'Villa Clara', NULL, '5', '比亚克拉拉', NULL, '古巴', 'CUB');
INSERT INTO `st_region_city` VALUES (6943, 'Cuba', NULL, 'Granma', NULL, '12', '格拉玛', NULL, '古巴', 'CUB');
INSERT INTO `st_region_city` VALUES (6944, 'Cuba', NULL, 'Guantanamo', NULL, '14', '关塔那摩', NULL, '古巴', 'CUB');
INSERT INTO `st_region_city` VALUES (6945, 'Cuba', NULL, 'La Habana', NULL, '2', '哈瓦那', NULL, '古巴', 'CUB');
INSERT INTO `st_region_city` VALUES (6946, 'Cuba', NULL, 'Ciudad de la Habana', NULL, '3', '哈瓦那城', NULL, '古巴', 'CUB');
INSERT INTO `st_region_city` VALUES (6947, 'Cuba', NULL, 'Camaguey', NULL, '9', '卡马圭', NULL, '古巴', 'CUB');
INSERT INTO `st_region_city` VALUES (6948, 'Cuba', NULL, 'Las Tunas', NULL, '10', '拉斯图纳斯', NULL, '古巴', 'CUB');
INSERT INTO `st_region_city` VALUES (6949, 'Cuba', NULL, 'Matanzas', NULL, '4', '马坦萨斯', NULL, '古巴', 'CUB');
INSERT INTO `st_region_city` VALUES (6950, 'Cuba', NULL, 'Mayari', NULL, 'MAY', '马亚里', NULL, '古巴', 'CUB');
INSERT INTO `st_region_city` VALUES (6951, 'Cuba', NULL, 'Manzanillo', NULL, 'MZO', '曼萨尼罗', NULL, '古巴', 'CUB');
INSERT INTO `st_region_city` VALUES (6952, 'Cuba', NULL, 'Isla de la Juventud', NULL, '99', '青年岛特区', NULL, '古巴', 'CUB');
INSERT INTO `st_region_city` VALUES (6953, 'Cuba', NULL, 'Santiago de Cuba', NULL, '13', '圣地亚哥', NULL, '古巴', 'CUB');
INSERT INTO `st_region_city` VALUES (6954, 'Cuba', NULL, 'Sancti Spiritus', NULL, '7', '圣斯皮里图斯', NULL, '古巴', 'CUB');
INSERT INTO `st_region_city` VALUES (6955, 'Cuba', NULL, 'Cienfuegos', NULL, '6', '西恩富戈斯', NULL, '古巴', 'CUB');
INSERT INTO `st_region_city` VALUES (6956, 'Cuba', NULL, 'Ciego de Avila', NULL, '8', '谢戈德阿维拉', NULL, '古巴', 'CUB');
INSERT INTO `st_region_city` VALUES (6957, 'Guyana', NULL, 'Essequibo Islands-West Demerara', NULL, 'EW', '埃塞奎博群岛-西德梅拉拉', NULL, '圭亚那', 'GUY');
INSERT INTO `st_region_city` VALUES (6958, 'Guyana', NULL, 'Barima-Waini', NULL, 'BW', '巴里马-瓦伊尼', NULL, '圭亚那', 'GUY');
INSERT INTO `st_region_city` VALUES (6959, 'Guyana', NULL, 'Pomeroon-Supenaam', NULL, 'PM', '波默伦-苏佩纳姆', NULL, '圭亚那', 'GUY');
INSERT INTO `st_region_city` VALUES (6960, 'Guyana', NULL, 'Potaro-Siparuni', NULL, 'PI', '波塔罗-锡帕鲁尼', NULL, '圭亚那', 'GUY');
INSERT INTO `st_region_city` VALUES (6961, 'Guyana', NULL, 'Demerara-Mahaica', NULL, 'DM', '德梅拉拉-马海卡', NULL, '圭亚那', 'GUY');
INSERT INTO `st_region_city` VALUES (6962, 'Guyana', NULL, 'East Berbice-Corentyne', NULL, 'EC', '东伯比斯-科兰太因', NULL, '圭亚那', 'GUY');
INSERT INTO `st_region_city` VALUES (6963, 'Guyana', NULL, 'Cuyuni-Mazaruni', NULL, 'CM', '库尤尼-马扎鲁尼', NULL, '圭亚那', 'GUY');
INSERT INTO `st_region_city` VALUES (6964, 'Guyana', NULL, 'Mahaica-Berbice', NULL, 'MB', '马海卡-伯比斯', NULL, '圭亚那', 'GUY');
INSERT INTO `st_region_city` VALUES (6965, 'Guyana', NULL, 'Upper Demerara-Berbice', NULL, 'UD', '上德梅拉拉-伯比斯', NULL, '圭亚那', 'GUY');
INSERT INTO `st_region_city` VALUES (6966, 'Guyana', NULL, 'Upper Takutu-Upper Essequibo', NULL, 'UT', '上塔库图-上埃塞奎博', NULL, '圭亚那', 'GUY');
INSERT INTO `st_region_city` VALUES (6967, 'Kazakhstan', NULL, 'Arkalyk', NULL, 'AYK', '阿尔卡累克', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (6968, 'Kazakhstan', NULL, 'Aqmola', NULL, 'AKM', '阿克莫拉', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (6969, 'Kazakhstan', NULL, 'Aksu', NULL, 'AKS', '阿克苏', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (6970, 'Kazakhstan', NULL, 'Aqtobe', NULL, 'AKT', '阿克托别', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (6971, 'Kazakhstan', NULL, 'Almaty', NULL, 'ALA', '阿拉木图', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (6972, 'Kazakhstan', NULL, 'Arys', NULL, 'ARY', '阿雷斯', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (6973, 'Kazakhstan', NULL, 'Astana', NULL, 'AST', '阿斯塔纳市', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (6974, 'Kazakhstan', NULL, 'Atyrau', NULL, 'ATY', '阿特劳', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (6975, 'Kazakhstan', NULL, 'Ekibastuz', NULL, 'EKB', '埃基巴斯图兹', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (6976, 'Kazakhstan', NULL, 'Balkhash', NULL, 'BXH', '巴尔喀什', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (6977, 'Kazakhstan', NULL, 'Pavlodar', NULL, 'PAV', '巴甫洛达尔', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (6978, 'Kazakhstan', NULL, 'Soltustik Qazaqstan', NULL, 'SEV', '北哈萨克斯坦', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (6979, 'Kazakhstan', NULL, 'Shyghys Qazaqstan', NULL, 'VOS', '东哈萨克斯坦', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (6980, 'Kazakhstan', NULL, 'Zyryanovsk', NULL, 'ZYR', '济良诺夫斯克', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (6981, 'Kazakhstan', NULL, 'Zhambyl', NULL, 'DMB', '江布尔', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (6982, 'Kazakhstan', NULL, 'Zhezkazgan', NULL, 'DZH', '杰兹卡兹甘', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (6983, 'Kazakhstan', NULL, 'Qaraghandy', NULL, 'KAR', '卡拉干达', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (6984, 'Kazakhstan', NULL, 'Karazhal', NULL, 'KZO', '卡拉扎尔', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (6985, 'Kazakhstan', NULL, 'Kapchagay', NULL, 'KAP', '卡普恰盖', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (6986, 'Kazakhstan', NULL, 'Qostanay', NULL, 'KST', '科斯塔奈', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (6987, 'Kazakhstan', NULL, 'Qyzylorda', NULL, 'KZY', '克孜勒奥尔达', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (6988, 'Kazakhstan', NULL, 'Kentau', NULL, 'KEN', '肯套', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (6989, 'Kazakhstan', NULL, 'Kurchatov', NULL, 'KUR', '库尔恰托夫', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (6990, 'Kazakhstan', NULL, 'Lisakovsk', NULL, 'LKK', '利萨科夫斯克', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (6991, 'Kazakhstan', NULL, 'Leninogorsk', NULL, 'LEN', '列宁诺戈尔斯克', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (6992, 'Kazakhstan', NULL, 'Rudny', NULL, 'RUD', '鲁德内', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (6993, 'Kazakhstan', NULL, 'Mangghystau', NULL, 'MAN', '曼格斯套', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (6994, 'Kazakhstan', NULL, 'Ongtustik Qazaqstan', NULL, 'KGT', '南哈萨克斯坦', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (6995, 'Kazakhstan', NULL, 'Saran', NULL, 'SAR', '萨兰', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (6996, 'Kazakhstan', NULL, 'Semey', NULL, 'SEM', '塞梅伊', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (6997, 'Kazakhstan', NULL, 'Shakhtinsk', NULL, 'SAK', '沙赫京斯克', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (6998, 'Kazakhstan', NULL, 'Stepnogorsk', NULL, 'STE', '斯捷普诺戈尔斯克', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (6999, 'Kazakhstan', NULL, 'Tekeli', NULL, 'TEK', '铁克利', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (7000, 'Kazakhstan', NULL, 'Temirtau', NULL, 'TEM', '铁米尔套', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (7001, 'Kazakhstan', NULL, 'Turkestan', NULL, 'TUR', '突厥斯坦', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (7002, 'Kazakhstan', NULL, 'Batys Qazaqstan', NULL, 'ZAP', '西哈萨克斯坦', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (7003, 'Kazakhstan', NULL, 'Zhanaozen', NULL, 'ZHA', '扎纳奥津', NULL, '哈萨克斯坦', 'KAZ');
INSERT INTO `st_region_city` VALUES (7004, 'Netherlands', NULL, 'Almere', NULL, 'AER', '阿尔梅勒', NULL, '荷兰', 'NLD');
INSERT INTO `st_region_city` VALUES (7005, 'Netherlands', NULL, 'Amersfoort', NULL, 'AME', '阿默斯福特', NULL, '荷兰', 'NLD');
INSERT INTO `st_region_city` VALUES (7006, 'Netherlands', NULL, 'Amsterdam', NULL, 'AMS', '阿姆斯特丹', NULL, '荷兰', 'NLD');
INSERT INTO `st_region_city` VALUES (7007, 'Netherlands', NULL, 'Arnhem', NULL, 'ARN', '阿纳姆', NULL, '荷兰', 'NLD');
INSERT INTO `st_region_city` VALUES (7008, 'Netherlands', NULL, 'Apeldoorn', NULL, 'APE', '阿珀尔多伦', NULL, '荷兰', 'NLD');
INSERT INTO `st_region_city` VALUES (7009, 'Netherlands', NULL, 'Assen', NULL, 'ASS', '阿森', NULL, '荷兰', 'NLD');
INSERT INTO `st_region_city` VALUES (7010, 'Netherlands', NULL, 'Ede', NULL, 'EDE', '埃德', NULL, '荷兰', 'NLD');
INSERT INTO `st_region_city` VALUES (7011, 'Netherlands', NULL, 'Emmen', NULL, 'EMM', '埃门', NULL, '荷兰', 'NLD');
INSERT INTO `st_region_city` VALUES (7012, 'Netherlands', NULL, 'Eindhoven', NULL, 'EIN', '埃因霍芬', NULL, '荷兰', 'NLD');
INSERT INTO `st_region_city` VALUES (7013, 'Netherlands', NULL, 'Breda', NULL, 'BRD', '布雷达', NULL, '荷兰', 'NLD');
INSERT INTO `st_region_city` VALUES (7014, 'Netherlands', NULL, 'Tilburg', NULL, 'TLB', '蒂尔堡', NULL, '荷兰', 'NLD');
INSERT INTO `st_region_city` VALUES (7015, 'Netherlands', NULL, 'Dordrecht', NULL, 'DOR', '多德雷赫特', NULL, '荷兰', 'NLD');
INSERT INTO `st_region_city` VALUES (7016, 'Netherlands', NULL, 'Enschede', NULL, 'ENS', '恩斯赫德', NULL, '荷兰', 'NLD');
INSERT INTO `st_region_city` VALUES (7017, 'Netherlands', NULL, 'Groningen', NULL, 'GRQ', '格罗宁根', NULL, '荷兰', 'NLD');
INSERT INTO `st_region_city` VALUES (7018, 'Netherlands', NULL, 'Haarlem', NULL, 'HRA', '哈勒姆', NULL, '荷兰', 'NLD');
INSERT INTO `st_region_city` VALUES (7019, 'Netherlands', NULL, 'Hague', NULL, 'HAG', '海牙', NULL, '荷兰', 'NLD');
INSERT INTO `st_region_city` VALUES (7020, 'Netherlands', NULL, 'Hoofddorp', NULL, 'HFD', '霍夫多尔普', NULL, '荷兰', 'NLD');
INSERT INTO `st_region_city` VALUES (7021, 'Netherlands', NULL, 'Leiden', NULL, 'LID', '莱顿', NULL, '荷兰', 'NLD');
INSERT INTO `st_region_city` VALUES (7022, 'Netherlands', NULL, 'Lelystad', NULL, 'LEY', '莱利斯塔德', NULL, '荷兰', 'NLD');
INSERT INTO `st_region_city` VALUES (7023, 'Netherlands', NULL, 'Rotterdam', NULL, 'RTM', '鹿特丹', NULL, '荷兰', 'NLD');
INSERT INTO `st_region_city` VALUES (7024, 'Netherlands', NULL, 'Leeuwarden', NULL, 'LWR', '吕伐登', NULL, '荷兰', 'NLD');
INSERT INTO `st_region_city` VALUES (7025, 'Netherlands', NULL, 'Maastricht', NULL, 'MST', '马斯特里赫特', NULL, '荷兰', 'NLD');
INSERT INTO `st_region_city` VALUES (7026, 'Netherlands', NULL, 'Middelburg', NULL, 'MDL', '米德尔堡', NULL, '荷兰', 'NLD');
INSERT INTO `st_region_city` VALUES (7027, 'Netherlands', NULL, 'Nijmegen', NULL, 'NIJ', '奈梅亨', NULL, '荷兰', 'NLD');
INSERT INTO `st_region_city` VALUES (7028, 'Netherlands', NULL, '\'s-Hertogenbosch', NULL, 'HTB', '斯海尔托亨博思', NULL, '荷兰', 'NLD');
INSERT INTO `st_region_city` VALUES (7029, 'Netherlands', NULL, 'Utrecht', NULL, 'UTC', '乌得勒支', NULL, '荷兰', 'NLD');
INSERT INTO `st_region_city` VALUES (7030, 'Netherlands', NULL, 'Zwolle', NULL, 'ZWO', '兹沃勒', NULL, '荷兰', 'NLD');
INSERT INTO `st_region_city` VALUES (7031, 'Netherlands', NULL, 'Zoetermeer', NULL, 'ZTM', '佐特尔梅', NULL, '荷兰', 'NLD');
INSERT INTO `st_region_city` VALUES (7032, 'Honduras', NULL, 'Atlantida', NULL, 'AT', '阿特兰蒂达', NULL, '洪都拉斯', 'HND');
INSERT INTO `st_region_city` VALUES (7033, 'Honduras', NULL, 'El Paraiso', NULL, 'PA', '埃尔帕拉伊索', NULL, '洪都拉斯', 'HND');
INSERT INTO `st_region_city` VALUES (7034, 'Honduras', NULL, 'Ocotepeque', NULL, 'OC', '奥科特佩克', NULL, '洪都拉斯', 'HND');
INSERT INTO `st_region_city` VALUES (7035, 'Honduras', NULL, 'Olancho', NULL, 'OL', '奥兰乔', NULL, '洪都拉斯', 'HND');
INSERT INTO `st_region_city` VALUES (7036, 'Honduras', NULL, 'Francisco Morazan', NULL, 'FM', '弗朗西斯科-莫拉桑', NULL, '洪都拉斯', 'HND');
INSERT INTO `st_region_city` VALUES (7037, 'Honduras', NULL, 'Gracias a Dios', NULL, 'GD', '格拉西亚斯-阿迪奥斯', NULL, '洪都拉斯', 'HND');
INSERT INTO `st_region_city` VALUES (7038, 'Honduras', NULL, 'Islas de la Bahia', NULL, 'IB', '海湾群岛', NULL, '洪都拉斯', 'HND');
INSERT INTO `st_region_city` VALUES (7039, 'Honduras', NULL, 'Cortes', NULL, 'CR', '科尔特斯', NULL, '洪都拉斯', 'HND');
INSERT INTO `st_region_city` VALUES (7040, 'Honduras', NULL, 'Colon', NULL, 'CL', '科隆', NULL, '洪都拉斯', 'HND');
INSERT INTO `st_region_city` VALUES (7041, 'Honduras', NULL, 'Comayagua', NULL, 'CM', '科马亚瓜', NULL, '洪都拉斯', 'HND');
INSERT INTO `st_region_city` VALUES (7042, 'Honduras', NULL, 'Copan', NULL, 'CP', '科潘', NULL, '洪都拉斯', 'HND');
INSERT INTO `st_region_city` VALUES (7043, 'Honduras', NULL, 'La Paz', NULL, 'PZ', '拉巴斯', NULL, '洪都拉斯', 'HND');
INSERT INTO `st_region_city` VALUES (7044, 'Honduras', NULL, 'Lempira', NULL, 'LE', '伦皮拉', NULL, '洪都拉斯', 'HND');
INSERT INTO `st_region_city` VALUES (7045, 'Honduras', NULL, 'Choluteca', NULL, 'CH', '乔卢特卡', NULL, '洪都拉斯', 'HND');
INSERT INTO `st_region_city` VALUES (7046, 'Honduras', NULL, 'Choloma', NULL, 'CHO', '乔罗马', NULL, '洪都拉斯', 'HND');
INSERT INTO `st_region_city` VALUES (7047, 'Honduras', NULL, 'Valle', NULL, 'VA', '山谷', NULL, '洪都拉斯', 'HND');
INSERT INTO `st_region_city` VALUES (7048, 'Honduras', NULL, 'Santa Barbara', NULL, 'SB', '圣巴巴拉', NULL, '洪都拉斯', 'HND');
INSERT INTO `st_region_city` VALUES (7049, 'Honduras', NULL, 'Intibuca', NULL, 'IN', '因蒂布卡', NULL, '洪都拉斯', 'HND');
INSERT INTO `st_region_city` VALUES (7050, 'Honduras', NULL, 'Yoro', NULL, 'YO', '约罗', NULL, '洪都拉斯', 'HND');
INSERT INTO `st_region_city` VALUES (7051, 'Kiribati', NULL, 'Phoenix Islands', NULL, 'PHO', '菲尼克斯群岛', NULL, '基里巴斯', 'KIR');
INSERT INTO `st_region_city` VALUES (7052, 'Kiribati', NULL, 'Gilberts Islands', NULL, 'GIL', '吉尔伯特群岛', NULL, '基里巴斯', 'KIR');
INSERT INTO `st_region_city` VALUES (7053, 'Kiribati', NULL, 'Line Islands', NULL, 'LIN', '莱恩群岛', NULL, '基里巴斯', 'KIR');
INSERT INTO `st_region_city` VALUES (7054, 'Djibouti', NULL, 'Ali Sabih', NULL, 'S', '阿里萨比赫区', NULL, '吉布提', 'DJI');
INSERT INTO `st_region_city` VALUES (7055, 'Djibouti', NULL, 'Obock', NULL, 'O', '奥博克区', NULL, '吉布提', 'DJI');
INSERT INTO `st_region_city` VALUES (7056, 'Djibouti', NULL, 'Dikhil', NULL, 'K', '迪基勒区', NULL, '吉布提', 'DJI');
INSERT INTO `st_region_city` VALUES (7057, 'Djibouti', NULL, 'Tadjoura', NULL, 'T', '塔朱拉区', NULL, '吉布提', 'DJI');
INSERT INTO `st_region_city` VALUES (7058, 'Kyrgyzstan', NULL, 'Osh', NULL, 'O', '奥什', NULL, '吉尔吉斯斯坦', 'KGZ');
INSERT INTO `st_region_city` VALUES (7059, 'Kyrgyzstan', NULL, 'Batken', NULL, 'B', '巴特肯', NULL, '吉尔吉斯斯坦', 'KGZ');
INSERT INTO `st_region_city` VALUES (7060, 'Kyrgyzstan', NULL, 'Bishkek', NULL, 'GB', '比什凯克市', NULL, '吉尔吉斯斯坦', 'KGZ');
INSERT INTO `st_region_city` VALUES (7061, 'Kyrgyzstan', NULL, 'Chuy', NULL, 'C', '楚河', NULL, '吉尔吉斯斯坦', 'KGZ');
INSERT INTO `st_region_city` VALUES (7062, 'Kyrgyzstan', NULL, 'Jalal-Abad', NULL, 'J', '贾拉拉巴德', NULL, '吉尔吉斯斯坦', 'KGZ');
INSERT INTO `st_region_city` VALUES (7063, 'Kyrgyzstan', NULL, 'Karabalta', NULL, 'KBA', '卡拉巴尔塔', NULL, '吉尔吉斯斯坦', 'KGZ');
INSERT INTO `st_region_city` VALUES (7064, 'Kyrgyzstan', NULL, 'Kara-Kol', NULL, 'KKO', '卡拉库尔', NULL, '吉尔吉斯斯坦', 'KGZ');
INSERT INTO `st_region_city` VALUES (7065, 'Kyrgyzstan', NULL, 'Kant', NULL, 'KAN', '坎特', NULL, '吉尔吉斯斯坦', 'KGZ');
INSERT INTO `st_region_city` VALUES (7066, 'Kyrgyzstan', NULL, 'Kok-Jangak', NULL, 'KJ', '科克扬加克', NULL, '吉尔吉斯斯坦', 'KGZ');
INSERT INTO `st_region_city` VALUES (7067, 'Kyrgyzstan', NULL, 'Mailuu-Suu', NULL, 'MS', '迈利赛', NULL, '吉尔吉斯斯坦', 'KGZ');
INSERT INTO `st_region_city` VALUES (7068, 'Kyrgyzstan', NULL, 'Naryn', NULL, 'N', '纳伦', NULL, '吉尔吉斯斯坦', 'KGZ');
INSERT INTO `st_region_city` VALUES (7069, 'Kyrgyzstan', NULL, 'Suluktu', NULL, 'SU', '苏卢克图', NULL, '吉尔吉斯斯坦', 'KGZ');
INSERT INTO `st_region_city` VALUES (7070, 'Kyrgyzstan', NULL, 'Talas', NULL, 'T', '塔拉斯', NULL, '吉尔吉斯斯坦', 'KGZ');
INSERT INTO `st_region_city` VALUES (7071, 'Kyrgyzstan', NULL, 'Tash-Kumyr', NULL, 'TK', '塔什库梅尔', NULL, '吉尔吉斯斯坦', 'KGZ');
INSERT INTO `st_region_city` VALUES (7072, 'Kyrgyzstan', NULL, 'Uzgen', NULL, 'UG', '乌兹根', NULL, '吉尔吉斯斯坦', 'KGZ');
INSERT INTO `st_region_city` VALUES (7073, 'Kyrgyzstan', NULL, 'Ysyk-Kol', NULL, 'Y', '伊塞克湖', NULL, '吉尔吉斯斯坦', 'KGZ');
INSERT INTO `st_region_city` VALUES (7074, 'Guinea', NULL, 'Boke', NULL, 'BOK', '博凯', NULL, '几内亚', 'GIN');
INSERT INTO `st_region_city` VALUES (7075, 'Guinea', NULL, 'Nzerekore', NULL, 'NZR', '恩泽雷科雷', NULL, '几内亚', 'GIN');
INSERT INTO `st_region_city` VALUES (7076, 'Guinea', NULL, 'Faranah', NULL, 'FRN', '法拉纳', NULL, '几内亚', 'GIN');
INSERT INTO `st_region_city` VALUES (7077, 'Guinea', NULL, 'Kindia', NULL, 'KND', '金迪亚', NULL, '几内亚', 'GIN');
INSERT INTO `st_region_city` VALUES (7078, 'Guinea', NULL, 'Kankan', NULL, 'KNK', '康康', NULL, '几内亚', 'GIN');
INSERT INTO `st_region_city` VALUES (7079, 'Guinea', NULL, 'Conakry', NULL, 'CNK', '科纳克里', NULL, '几内亚', 'GIN');
INSERT INTO `st_region_city` VALUES (7080, 'Guinea', NULL, 'Labe', NULL, 'LAB', '拉贝', NULL, '几内亚', 'GIN');
INSERT INTO `st_region_city` VALUES (7081, 'Guinea', NULL, 'Mamou', NULL, 'MAM', '玛木', NULL, '几内亚', 'GIN');
INSERT INTO `st_region_city` VALUES (7082, 'Canada', NULL, 'Abbotsford', NULL, 'ABB', '阿伯茨福', NULL, '加拿大', 'CAN');
INSERT INTO `st_region_city` VALUES (7083, 'Canada', NULL, 'Edmonton', NULL, 'EDM', '埃德蒙顿', NULL, '加拿大', 'CAN');
INSERT INTO `st_region_city` VALUES (7084, 'Canada', NULL, 'Oshawa', NULL, 'OSH', '奥沙瓦', NULL, '加拿大', 'CAN');
INSERT INTO `st_region_city` VALUES (7085, 'Canada', NULL, 'Barrie', NULL, 'BAR', '巴里', NULL, '加拿大', 'CAN');
INSERT INTO `st_region_city` VALUES (7086, 'Canada', NULL, 'Cape Breton', NULL, 'CBR', '布列塔尼角', NULL, '加拿大', 'CAN');
INSERT INTO `st_region_city` VALUES (7087, 'Canada', NULL, 'Toronto', NULL, 'TOR', '多伦多', NULL, '加拿大', 'CAN');
INSERT INTO `st_region_city` VALUES (7088, 'Canada', NULL, 'Fredericton', NULL, 'FRE', '弗雷德里顿', NULL, '加拿大', 'CAN');
INSERT INTO `st_region_city` VALUES (7089, 'Canada', NULL, 'Guelph', NULL, 'GLP', '圭尔夫', NULL, '加拿大', 'CAN');
INSERT INTO `st_region_city` VALUES (7090, 'Canada', NULL, 'Halifax', NULL, 'HAL', '哈利法克斯', NULL, '加拿大', 'CAN');
INSERT INTO `st_region_city` VALUES (7091, 'Canada', NULL, 'Hamilton', NULL, 'HAM', '哈密尔顿', NULL, '加拿大', 'CAN');
INSERT INTO `st_region_city` VALUES (7092, 'Canada', NULL, 'Whitehorse', NULL, 'YXY', '怀特霍斯', NULL, '加拿大', 'CAN');
INSERT INTO `st_region_city` VALUES (7093, 'Canada', NULL, 'Kelowna', NULL, 'KWL', '基劳纳', NULL, '加拿大', 'CAN');
INSERT INTO `st_region_city` VALUES (7094, 'Canada', NULL, 'Brampton', NULL, 'BRP', '基奇纳', NULL, '加拿大', 'CAN');
INSERT INTO `st_region_city` VALUES (7095, 'Canada', NULL, 'Kingston', NULL, 'KGN', '金斯敦', NULL, '加拿大', 'CAN');
INSERT INTO `st_region_city` VALUES (7096, 'Canada', NULL, 'Calgary', NULL, 'CAL', '卡里加里', NULL, '加拿大', 'CAN');
INSERT INTO `st_region_city` VALUES (7097, 'Canada', NULL, 'Quebec', NULL, 'QUE', '魁北克', NULL, '加拿大', 'CAN');
INSERT INTO `st_region_city` VALUES (7098, 'Canada', NULL, 'Regina', NULL, 'REG', '里贾纳', NULL, '加拿大', 'CAN');
INSERT INTO `st_region_city` VALUES (7099, 'Canada', NULL, 'London', NULL, 'LOD', '伦敦', NULL, '加拿大', 'CAN');
INSERT INTO `st_region_city` VALUES (7100, 'Canada', NULL, 'Montreal', NULL, 'MTR', '蒙特利尔', NULL, '加拿大', 'CAN');
INSERT INTO `st_region_city` VALUES (7101, 'Canada', NULL, 'Sudbury', NULL, 'SUD', '萨德伯里', NULL, '加拿大', 'CAN');
INSERT INTO `st_region_city` VALUES (7102, 'Canada', NULL, 'Saskatoon', NULL, 'SAK', '萨斯卡通', NULL, '加拿大', 'CAN');
INSERT INTO `st_region_city` VALUES (7103, 'Canada', NULL, 'Trois-Rivieres', NULL, 'TRR', '三河城', NULL, '加拿大', 'CAN');
INSERT INTO `st_region_city` VALUES (7104, 'Canada', NULL, 'Thunder Bay', NULL, 'THU', '桑德贝', NULL, '加拿大', 'CAN');
INSERT INTO `st_region_city` VALUES (7105, 'Canada', NULL, 'Sherbrooke', NULL, 'SBE', '舍布鲁克', NULL, '加拿大', 'CAN');
INSERT INTO `st_region_city` VALUES (7106, 'Canada', NULL, 'St. Catharines', NULL, 'SCA', '圣卡塔琳娜', NULL, '加拿大', 'CAN');
INSERT INTO `st_region_city` VALUES (7107, 'Canada', NULL, 'Saint-John\'s', NULL, 'SJB', '圣约翰斯', NULL, '加拿大', 'CAN');
INSERT INTO `st_region_city` VALUES (7108, 'Canada', NULL, 'Victoria', NULL, 'VIC', '维多利亚', NULL, '加拿大', 'CAN');
INSERT INTO `st_region_city` VALUES (7109, 'Canada', NULL, 'Vancouver', NULL, 'VAN', '温哥华', NULL, '加拿大', 'CAN');
INSERT INTO `st_region_city` VALUES (7110, 'Canada', NULL, 'Winnipeg', NULL, 'WNP', '温尼伯', NULL, '加拿大', 'CAN');
INSERT INTO `st_region_city` VALUES (7111, 'Canada', NULL, 'Windsor', NULL, 'WDR', '温莎', NULL, '加拿大', 'CAN');
INSERT INTO `st_region_city` VALUES (7112, 'Canada', NULL, 'Ottawa', NULL, 'OTT', '渥太华', NULL, '加拿大', 'CAN');
INSERT INTO `st_region_city` VALUES (7113, 'Canada', NULL, 'Charlottetown', NULL, 'CHA', '夏洛特敦', NULL, '加拿大', 'CAN');
INSERT INTO `st_region_city` VALUES (7114, 'Canada', NULL, 'Yellowknife', NULL, 'YZF', '耶洛奈夫', NULL, '加拿大', 'CAN');
INSERT INTO `st_region_city` VALUES (7115, 'Canada', NULL, 'Iqaluit', NULL, 'IQL', '伊魁特', NULL, '加拿大', 'CAN');
INSERT INTO `st_region_city` VALUES (7116, 'Ghana', NULL, 'Ashanti', NULL, 'AS', '阿散蒂', NULL, '加纳', 'GHA');
INSERT INTO `st_region_city` VALUES (7117, 'Ghana', NULL, 'Obuasi', NULL, 'OBU', '奥布阿西', NULL, '加纳', 'GHA');
INSERT INTO `st_region_city` VALUES (7118, 'Ghana', NULL, 'Northern', NULL, 'NO', '北部', NULL, '加纳', 'GHA');
INSERT INTO `st_region_city` VALUES (7119, 'Ghana', NULL, 'Brong Ahafo', NULL, 'BA', '布朗阿哈福', NULL, '加纳', 'GHA');
INSERT INTO `st_region_city` VALUES (7120, 'Ghana', NULL, 'Greater Accra', NULL, 'GA', '大阿克拉', NULL, '加纳', 'GHA');
INSERT INTO `st_region_city` VALUES (7121, 'Ghana', NULL, 'Eastern', NULL, 'EA', '东部', NULL, '加纳', 'GHA');
INSERT INTO `st_region_city` VALUES (7122, 'Ghana', NULL, 'Upper East', NULL, 'UE', '上东部', NULL, '加纳', 'GHA');
INSERT INTO `st_region_city` VALUES (7123, 'Ghana', NULL, 'Upper West', NULL, 'UW', '上西部', NULL, '加纳', 'GHA');
INSERT INTO `st_region_city` VALUES (7124, 'Ghana', NULL, 'Volta', NULL, 'VO', '沃尔特', NULL, '加纳', 'GHA');
INSERT INTO `st_region_city` VALUES (7125, 'Ghana', NULL, 'Western', NULL, 'WE', '西部', NULL, '加纳', 'GHA');
INSERT INTO `st_region_city` VALUES (7126, 'Ghana', NULL, 'Central', NULL, 'CE', '中部', NULL, '加纳', 'GHA');
INSERT INTO `st_region_city` VALUES (7127, 'Gabon', NULL, 'Ogooue-Lolo', NULL, 'OL', '奥果韦-洛洛', NULL, '加蓬', 'GAB');
INSERT INTO `st_region_city` VALUES (7128, 'Gabon', NULL, 'Ogooue-Ivindo', NULL, 'OI', '奥果韦-伊温多', NULL, '加蓬', 'GAB');
INSERT INTO `st_region_city` VALUES (7129, 'Gabon', NULL, 'Ogooue-Maritime', NULL, 'OM', '滨海奥果韦', NULL, '加蓬', 'GAB');
INSERT INTO `st_region_city` VALUES (7130, 'Gabon', NULL, 'Ngounie', NULL, 'NG', '恩古涅', NULL, '加蓬', 'GAB');
INSERT INTO `st_region_city` VALUES (7131, 'Gabon', NULL, 'Estuaire', NULL, 'ES', '河口', NULL, '加蓬', 'GAB');
INSERT INTO `st_region_city` VALUES (7132, 'Gabon', NULL, 'Nyanga', NULL, 'NY', '尼扬加', NULL, '加蓬', 'GAB');
INSERT INTO `st_region_city` VALUES (7133, 'Gabon', NULL, 'Haut-Ogooue', NULL, 'HO', '上奥果韦', NULL, '加蓬', 'GAB');
INSERT INTO `st_region_city` VALUES (7134, 'Gabon', NULL, 'Woleu-Ntem', NULL, 'WN', '沃勒-恩特姆', NULL, '加蓬', 'GAB');
INSERT INTO `st_region_city` VALUES (7135, 'Gabon', NULL, 'Moyen-Ogooue', NULL, 'MO', '中奥果韦', NULL, '加蓬', 'GAB');
INSERT INTO `st_region_city` VALUES (7136, 'Cambodia', NULL, 'Otdar Mean Chey', NULL, 'OC', '奥多棉吉', NULL, '柬埔寨', 'KHM');
INSERT INTO `st_region_city` VALUES (7137, 'Cambodia', NULL, 'Krong Keb', NULL, 'KB', '白马市', NULL, '柬埔寨', 'KHM');
INSERT INTO `st_region_city` VALUES (7138, 'Cambodia', NULL, 'Preah Vihear', NULL, 'PR', '柏威夏', NULL, '柬埔寨', 'KHM');
INSERT INTO `st_region_city` VALUES (7139, 'Cambodia', NULL, 'Krong Pailin', NULL, 'PL', '拜林市', NULL, '柬埔寨', 'KHM');
INSERT INTO `st_region_city` VALUES (7140, 'Cambodia', NULL, 'Banteay Mean Chey', NULL, 'BM', '班迭棉吉', NULL, '柬埔寨', 'KHM');
INSERT INTO `st_region_city` VALUES (7141, 'Cambodia', NULL, 'Kampong Chhnang', NULL, 'KZC', '磅清扬', NULL, '柬埔寨', 'KHM');
INSERT INTO `st_region_city` VALUES (7142, 'Cambodia', NULL, 'Kampong Spoe', NULL, 'KO', '磅士卑', NULL, '柬埔寨', 'KHM');
INSERT INTO `st_region_city` VALUES (7143, 'Cambodia', NULL, 'Kampong Thum', NULL, 'KZK', '磅同', NULL, '柬埔寨', 'KHM');
INSERT INTO `st_region_city` VALUES (7144, 'Cambodia', NULL, 'Kampong Cham', NULL, 'KM', '磅湛', NULL, '柬埔寨', 'KHM');
INSERT INTO `st_region_city` VALUES (7145, 'Cambodia', NULL, 'Prey Veng', NULL, 'PG', '波罗勉', NULL, '柬埔寨', 'KHM');
INSERT INTO `st_region_city` VALUES (7146, 'Cambodia', NULL, 'Takev', NULL, 'TK', '茶胶', NULL, '柬埔寨', 'KHM');
INSERT INTO `st_region_city` VALUES (7147, 'Cambodia', NULL, 'Svay Rieng', NULL, 'SVR', '柴桢', NULL, '柬埔寨', 'KHM');
INSERT INTO `st_region_city` VALUES (7148, 'Cambodia', NULL, 'Kandal', NULL, 'KL', '干丹', NULL, '柬埔寨', 'KHM');
INSERT INTO `st_region_city` VALUES (7149, 'Cambodia', NULL, 'Kaoh Kong', NULL, 'KKZ', '戈公', NULL, '柬埔寨', 'KHM');
INSERT INTO `st_region_city` VALUES (7150, 'Cambodia', NULL, 'Kampot', NULL, 'KMT', '贡布', NULL, '柬埔寨', 'KHM');
INSERT INTO `st_region_city` VALUES (7151, 'Cambodia', NULL, 'Phnum Penh', NULL, 'PNH', '金边市', NULL, '柬埔寨', 'KHM');
INSERT INTO `st_region_city` VALUES (7152, 'Cambodia', NULL, 'Kracheh', NULL, 'KH', '桔井', NULL, '柬埔寨', 'KHM');
INSERT INTO `st_region_city` VALUES (7153, 'Cambodia', NULL, 'Rotanak Kiri', NULL, 'RBE', '腊塔纳基里', NULL, '柬埔寨', 'KHM');
INSERT INTO `st_region_city` VALUES (7154, 'Cambodia', NULL, 'Bat Dambang', NULL, 'BA', '马德望', NULL, '柬埔寨', 'KHM');
INSERT INTO `st_region_city` VALUES (7155, 'Cambodia', NULL, 'Mondol Kiri', NULL, 'MWV', '蒙多基里', NULL, '柬埔寨', 'KHM');
INSERT INTO `st_region_city` VALUES (7156, 'Cambodia', NULL, 'Pouthĭsat', NULL, 'PO', '菩萨', NULL, '柬埔寨', 'KHM');
INSERT INTO `st_region_city` VALUES (7157, 'Cambodia', NULL, 'Stoeng Treng', NULL, 'TNX', '上丁', NULL, '柬埔寨', 'KHM');
INSERT INTO `st_region_city` VALUES (7158, 'Cambodia', NULL, 'Krong Preah', NULL, 'KA', '西哈努克市', NULL, '柬埔寨', 'KHM');
INSERT INTO `st_region_city` VALUES (7159, 'Cambodia', NULL, 'Siem Reab', NULL, 'REP', '暹粒', NULL, '柬埔寨', 'KHM');
INSERT INTO `st_region_city` VALUES (7160, 'Czech Republic', NULL, 'Olomoucky', NULL, 'OL', '奥洛穆茨', NULL, '捷克共和国', 'CZE');
INSERT INTO `st_region_city` VALUES (7161, 'Czech Republic', NULL, 'Plzensky', NULL, 'PL', '比尔森', NULL, '捷克共和国', 'CZE');
INSERT INTO `st_region_city` VALUES (7162, 'Czech Republic', NULL, 'Prague', NULL, 'PR', '布拉格直辖市', NULL, '捷克共和国', 'CZE');
INSERT INTO `st_region_city` VALUES (7163, 'Czech Republic', NULL, 'Kralovehradecky', NULL, 'KR', '赫拉德茨-克拉洛韦', NULL, '捷克共和国', 'CZE');
INSERT INTO `st_region_city` VALUES (7164, 'Czech Republic', NULL, 'Karlovarsky', NULL, 'KA', '卡罗维发利', NULL, '捷克共和国', 'CZE');
INSERT INTO `st_region_city` VALUES (7165, 'Czech Republic', NULL, 'Liberecky', NULL, 'LI', '利贝雷克', NULL, '捷克共和国', 'CZE');
INSERT INTO `st_region_city` VALUES (7166, 'Czech Republic', NULL, 'Moravskoslezsky', NULL, 'MO', '摩拉维亚-西里西亚', NULL, '捷克共和国', 'CZE');
INSERT INTO `st_region_city` VALUES (7167, 'Czech Republic', NULL, 'Jihomoravsky', NULL, 'JC', '南摩拉维亚', NULL, '捷克共和国', 'CZE');
INSERT INTO `st_region_city` VALUES (7168, 'Czech Republic', NULL, 'Pardubicky', NULL, 'PA', '帕尔杜比采', NULL, '捷克共和国', 'CZE');
INSERT INTO `st_region_city` VALUES (7169, 'Czech Republic', NULL, 'Vysocina', NULL, 'VY', '维索基纳', NULL, '捷克共和国', 'CZE');
INSERT INTO `st_region_city` VALUES (7170, 'Czech Republic', NULL, 'Ustecky', NULL, 'US', '乌斯季', NULL, '捷克共和国', 'CZE');
INSERT INTO `st_region_city` VALUES (7171, 'Czech Republic', NULL, 'Stredocesky', NULL, 'ST', '中捷克', NULL, '捷克共和国', 'CZE');
INSERT INTO `st_region_city` VALUES (7172, 'Czech Republic', NULL, 'Zlinsky', NULL, 'ZL', '兹林', NULL, '捷克共和国', 'CZE');
INSERT INTO `st_region_city` VALUES (7173, 'Zimbabwe', NULL, 'Matabeleland North', NULL, 'MN', '北马塔贝莱兰', NULL, '津巴布韦', 'ZWE');
INSERT INTO `st_region_city` VALUES (7174, 'Zimbabwe', NULL, 'Bulawayo', NULL, 'BU', '布拉瓦约', NULL, '津巴布韦', 'ZWE');
INSERT INTO `st_region_city` VALUES (7175, 'Zimbabwe', NULL, 'Mashonaland East', NULL, 'ME', '东马绍纳兰', NULL, '津巴布韦', 'ZWE');
INSERT INTO `st_region_city` VALUES (7176, 'Zimbabwe', NULL, 'Harare', NULL, 'HA', '哈拉雷', NULL, '津巴布韦', 'ZWE');
INSERT INTO `st_region_city` VALUES (7177, 'Zimbabwe', NULL, 'Manicaland', NULL, 'ML', '马尼卡兰', NULL, '津巴布韦', 'ZWE');
INSERT INTO `st_region_city` VALUES (7178, 'Zimbabwe', NULL, 'Masvingo', NULL, 'MV', '马斯温戈', NULL, '津巴布韦', 'ZWE');
INSERT INTO `st_region_city` VALUES (7179, 'Zimbabwe', NULL, 'Matabeleland South', NULL, 'MS', '南马塔贝莱兰', NULL, '津巴布韦', 'ZWE');
INSERT INTO `st_region_city` VALUES (7180, 'Zimbabwe', NULL, 'Mashonaland West', NULL, 'MW', '西马绍纳兰', NULL, '津巴布韦', 'ZWE');
INSERT INTO `st_region_city` VALUES (7181, 'Zimbabwe', NULL, 'Midlands', NULL, 'MD', '中部', NULL, '津巴布韦', 'ZWE');
INSERT INTO `st_region_city` VALUES (7182, 'Zimbabwe', NULL, 'Mashonaland Central', NULL, 'MC', '中马绍纳兰', NULL, '津巴布韦', 'ZWE');
INSERT INTO `st_region_city` VALUES (7183, 'Cameroon', NULL, 'Adamaoua', NULL, 'ADA', '阿达马瓦', NULL, '喀麦隆', 'CMR');
INSERT INTO `st_region_city` VALUES (7184, 'Cameroon', NULL, 'Nord', NULL, 'NOR', '北部', NULL, '喀麦隆', 'CMR');
INSERT INTO `st_region_city` VALUES (7185, 'Cameroon', NULL, 'Extreme-Nord', NULL, 'EXN', '北端', NULL, '喀麦隆', 'CMR');
INSERT INTO `st_region_city` VALUES (7186, 'Cameroon', NULL, 'Littoral', NULL, 'LIT', '滨海', NULL, '喀麦隆', 'CMR');
INSERT INTO `st_region_city` VALUES (7187, 'Cameroon', NULL, 'Est', NULL, 'EST', '东部', NULL, '喀麦隆', 'CMR');
INSERT INTO `st_region_city` VALUES (7188, 'Cameroon', NULL, 'Sud', NULL, 'SUD', '南部', NULL, '喀麦隆', 'CMR');
INSERT INTO `st_region_city` VALUES (7189, 'Cameroon', NULL, 'Nord-Oueste', NULL, 'NOT', '西北', NULL, '喀麦隆', 'CMR');
INSERT INTO `st_region_city` VALUES (7190, 'Cameroon', NULL, 'Ouest', NULL, 'OUE', '西部', NULL, '喀麦隆', 'CMR');
INSERT INTO `st_region_city` VALUES (7191, 'Cameroon', NULL, 'Sud-Oueste', NULL, 'SOU', '西南', NULL, '喀麦隆', 'CMR');
INSERT INTO `st_region_city` VALUES (7192, 'Cameroon', NULL, 'Centre', NULL, 'CEN', '中央', NULL, '喀麦隆', 'CMR');
INSERT INTO `st_region_city` VALUES (7193, 'Qatar', NULL, 'Madinat ach Shamal', NULL, 'MS', '北部', NULL, '卡塔尔', 'QAT');
INSERT INTO `st_region_city` VALUES (7194, 'Qatar', NULL, 'Ad Dawhah', NULL, 'DW', '多哈', NULL, '卡塔尔', 'QAT');
INSERT INTO `st_region_city` VALUES (7195, 'Qatar', NULL, 'Al Ghuwariyah', NULL, 'GW', '古韦里耶', NULL, '卡塔尔', 'QAT');
INSERT INTO `st_region_city` VALUES (7196, 'Qatar', NULL, 'Al Khawr', NULL, 'KR', '豪尔', NULL, '卡塔尔', 'QAT');
INSERT INTO `st_region_city` VALUES (7197, 'Qatar', NULL, 'Jariyan al Batnah', NULL, 'JB', '杰里扬拜特奈', NULL, '卡塔尔', 'QAT');
INSERT INTO `st_region_city` VALUES (7198, 'Qatar', NULL, 'Ar Rayyan', NULL, 'RN', '赖扬', NULL, '卡塔尔', 'QAT');
INSERT INTO `st_region_city` VALUES (7199, 'Qatar', NULL, 'Al Wakrah', NULL, 'WK', '沃克拉', NULL, '卡塔尔', 'QAT');
INSERT INTO `st_region_city` VALUES (7200, 'Qatar', NULL, 'Umm Salal', NULL, 'UL', '乌姆锡拉勒', NULL, '卡塔尔', 'QAT');
INSERT INTO `st_region_city` VALUES (7201, 'Qatar', NULL, 'Al Jumaliyah', NULL, 'JM', '朱迈利耶', NULL, '卡塔尔', 'QAT');
INSERT INTO `st_region_city` VALUES (7202, 'Cote d\'Ivoire', NULL, 'Agnebi', NULL, 'AG', '阿涅比', NULL, '科特迪瓦', 'CIV');
INSERT INTO `st_region_city` VALUES (7203, 'Cote d\'Ivoire', NULL, 'Bafing', NULL, 'BF', '巴芬', NULL, '科特迪瓦', 'CIV');
INSERT INTO `st_region_city` VALUES (7204, 'Cote d\'Ivoire', NULL, 'Vallee du Bandama', NULL, 'VB', '邦达马河谷', NULL, '科特迪瓦', 'CIV');
INSERT INTO `st_region_city` VALUES (7205, 'Cote d\'Ivoire', NULL, 'Denguele', NULL, 'DE', '登盖莱', NULL, '科特迪瓦', 'CIV');
INSERT INTO `st_region_city` VALUES (7206, 'Cote d\'Ivoire', NULL, 'Nzi-Comoe', NULL, 'NC', '恩济－科莫埃', NULL, '科特迪瓦', 'CIV');
INSERT INTO `st_region_city` VALUES (7207, 'Cote d\'Ivoire', NULL, 'Fromager', NULL, 'FR', '弗罗马格尔', NULL, '科特迪瓦', 'CIV');
INSERT INTO `st_region_city` VALUES (7208, 'Cote d\'Ivoire', NULL, 'Lacs', NULL, 'LC', '湖泊', NULL, '科特迪瓦', 'CIV');
INSERT INTO `st_region_city` VALUES (7209, 'Cote d\'Ivoire', NULL, 'Marahoue', NULL, 'MR', '马拉韦', NULL, '科特迪瓦', 'CIV');
INSERT INTO `st_region_city` VALUES (7210, 'Cote d\'Ivoire', NULL, 'Sud-Bandama', NULL, 'SB', '南邦达马', NULL, '科特迪瓦', 'CIV');
INSERT INTO `st_region_city` VALUES (7211, 'Cote d\'Ivoire', NULL, 'Sud-Comoe', NULL, 'SC', '南科莫埃', NULL, '科特迪瓦', 'CIV');
INSERT INTO `st_region_city` VALUES (7212, 'Cote d\'Ivoire', NULL, 'Haut-Sassandra', NULL, 'HT', '萨桑德拉', NULL, '科特迪瓦', 'CIV');
INSERT INTO `st_region_city` VALUES (7213, 'Cote d\'Ivoire', NULL, 'Savanes', NULL, 'SV', '萨瓦纳', NULL, '科特迪瓦', 'CIV');
INSERT INTO `st_region_city` VALUES (7214, 'Cote d\'Ivoire', NULL, 'Montagnes', NULL, 'DH', '山地', NULL, '科特迪瓦', 'CIV');
INSERT INTO `st_region_city` VALUES (7215, 'Cote d\'Ivoire', NULL, 'Worodougou', NULL, 'WR', '沃罗杜古', NULL, '科特迪瓦', 'CIV');
INSERT INTO `st_region_city` VALUES (7216, 'Cote d\'Ivoire', NULL, 'Bas-Sassandra', NULL, 'BS', '下萨桑德拉', NULL, '科特迪瓦', 'CIV');
INSERT INTO `st_region_city` VALUES (7217, 'Cote d\'Ivoire', NULL, 'Lagunes', NULL, 'LG', '泻湖', NULL, '科特迪瓦', 'CIV');
INSERT INTO `st_region_city` VALUES (7218, 'Cote d\'Ivoire', NULL, 'Zanzan', NULL, 'ZA', '赞赞', NULL, '科特迪瓦', 'CIV');
INSERT INTO `st_region_city` VALUES (7219, 'Cote d\'Ivoire', NULL, 'Moyen-Cavally', NULL, 'MV', '中卡瓦利', NULL, '科特迪瓦', 'CIV');
INSERT INTO `st_region_city` VALUES (7220, 'Cote d\'Ivoire', NULL, 'Moyen-Comoe', NULL, 'MC', '中科莫埃', NULL, '科特迪瓦', 'CIV');
INSERT INTO `st_region_city` VALUES (7221, 'Croatia', NULL, 'Osjecko-Baranjska', NULL, '14', '奥西耶克-巴拉尼亚', NULL, '克罗地亚', 'HRV');
INSERT INTO `st_region_city` VALUES (7222, 'Croatia', NULL, 'Bjelovarsko-Bilogorska', NULL, '7', '别洛瓦尔-比洛戈拉', NULL, '克罗地亚', 'HRV');
INSERT INTO `st_region_city` VALUES (7223, 'Croatia', NULL, 'Primorsko-Goranska', NULL, '8', '滨海和山区', NULL, '克罗地亚', 'HRV');
INSERT INTO `st_region_city` VALUES (7224, 'Croatia', NULL, 'Pozega-Slavonia', NULL, '11', '波热加-斯拉沃尼亚', NULL, '克罗地亚', 'HRV');
INSERT INTO `st_region_city` VALUES (7225, 'Croatia', NULL, 'Brodsko-Posavska', NULL, '12', '布罗德-波萨维纳', NULL, '克罗地亚', 'HRV');
INSERT INTO `st_region_city` VALUES (7226, 'Croatia', NULL, 'Dubrovacko-Neretvanska', NULL, '19', '杜布罗夫斯克-内雷特瓦', NULL, '克罗地亚', 'HRV');
INSERT INTO `st_region_city` VALUES (7227, 'Croatia', NULL, 'Karlovacka', NULL, '4', '卡尔洛瓦茨', NULL, '克罗地亚', 'HRV');
INSERT INTO `st_region_city` VALUES (7228, 'Croatia', NULL, 'Koprivnicko-Krizevacka', NULL, '6', '科普里夫尼察-克里热夫齐', NULL, '克罗地亚', 'HRV');
INSERT INTO `st_region_city` VALUES (7229, 'Croatia', NULL, 'Krapinsko-Zagorska', NULL, '2', '克拉皮纳-扎戈列', NULL, '克罗地亚', 'HRV');
INSERT INTO `st_region_city` VALUES (7230, 'Croatia', NULL, 'Licko-Senjska', NULL, '9', '利卡-塞尼', NULL, '克罗地亚', 'HRV');
INSERT INTO `st_region_city` VALUES (7231, 'Croatia', NULL, 'Medimurska', NULL, '20', '梅吉穆列', NULL, '克罗地亚', 'HRV');
INSERT INTO `st_region_city` VALUES (7232, 'Croatia', NULL, 'Zagrebacka', NULL, '1', '萨格勒布', NULL, '克罗地亚', 'HRV');
INSERT INTO `st_region_city` VALUES (7233, 'Croatia', NULL, 'Grad Zagreb', NULL, '21', '萨格勒布市', NULL, '克罗地亚', 'HRV');
INSERT INTO `st_region_city` VALUES (7234, 'Croatia', NULL, 'Splitsko-Dalmatinska', NULL, '17', '斯普利特-达尔马提亚', NULL, '克罗地亚', 'HRV');
INSERT INTO `st_region_city` VALUES (7235, 'Croatia', NULL, 'Varazdinska', NULL, '5', '瓦拉日丁', NULL, '克罗地亚', 'HRV');
INSERT INTO `st_region_city` VALUES (7236, 'Croatia', NULL, 'Viroviticko-Podravska', NULL, '10', '维罗维蒂察-波德拉维纳', NULL, '克罗地亚', 'HRV');
INSERT INTO `st_region_city` VALUES (7237, 'Croatia', NULL, 'Vukovarsko-Srijemska', NULL, '16', '武科瓦尔-斯里耶姆', NULL, '克罗地亚', 'HRV');
INSERT INTO `st_region_city` VALUES (7238, 'Croatia', NULL, 'Sibensko-Kninska', NULL, '15', '希贝尼克-克宁', NULL, '克罗地亚', 'HRV');
INSERT INTO `st_region_city` VALUES (7239, 'Croatia', NULL, 'Sisacko-Moslavacka', NULL, '3', '锡萨克-莫斯拉维纳', NULL, '克罗地亚', 'HRV');
INSERT INTO `st_region_city` VALUES (7240, 'Croatia', NULL, 'Istarska', NULL, '18', '伊斯特拉', NULL, '克罗地亚', 'HRV');
INSERT INTO `st_region_city` VALUES (7241, 'Croatia', NULL, 'Zadarska', NULL, '13', '扎达尔', NULL, '克罗地亚', 'HRV');
INSERT INTO `st_region_city` VALUES (7242, 'Kenya', NULL, 'Elgeyo-Marakwet', NULL, 'EMA', '埃尔格约-马拉奎特', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7243, 'Kenya', NULL, 'Baringo', NULL, 'BAR', '巴林戈', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7244, 'Kenya', NULL, 'Bungoma', NULL, 'BUN', '邦戈马', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7245, 'Kenya', NULL, 'Bomet', NULL, 'BOM', '博美特', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7246, 'Kenya', NULL, 'Busia', NULL, 'BUS', '布希亚', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7247, 'Kenya', NULL, 'Embu', NULL, 'EMB', '恩布', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7248, 'Kenya', NULL, 'Homa Bay', NULL, 'HOB', '霍马湾', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7249, 'Kenya', NULL, 'Kiambu', NULL, 'KIA', '基安布', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7250, 'Kenya', NULL, 'Kilifi', NULL, 'KIL', '基里菲', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7251, 'Kenya', NULL, 'Kirinyaga', NULL, 'KIR', '基里尼亚加', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7252, 'Kenya', NULL, 'Kisumu', NULL, 'KIS', '基苏木', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7253, 'Kenya', NULL, 'Kitui', NULL, 'KIT', '基图伊', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7254, 'Kenya', NULL, 'Kisii', NULL, 'KII', '基西', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7255, 'Kenya', NULL, 'Garissa', NULL, 'GAS', '加里萨', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7256, 'Kenya', NULL, 'Kakamega', NULL, 'KAK', '卡卡梅加', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7257, 'Kenya', NULL, 'Kajiado', NULL, 'KAJ', '卡耶亚多', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7258, 'Kenya', NULL, 'Kericho', NULL, 'KEY', '凯里乔', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7259, 'Kenya', NULL, 'Kwale', NULL, 'KWA', '夸勒', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7260, 'Kenya', NULL, 'Lamu', NULL, 'LAU', '拉木', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7261, 'Kenya', NULL, 'Laikipia', NULL, 'LAI', '莱基皮亚', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7262, 'Kenya', NULL, 'Machakos', NULL, 'MAC', '马查科斯', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7263, 'Kenya', NULL, 'Makueni', NULL, 'MAK', '马瓜尼', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7264, 'Kenya', NULL, 'Marsabit', NULL, 'RBT', '马萨布布', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7265, 'Kenya', NULL, 'Mandera', NULL, 'MAN', '曼德拉', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7266, 'Kenya', NULL, 'Meru', NULL, 'MER', '梅鲁', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7267, 'Kenya', NULL, 'Mombasa', NULL, 'MOM', '蒙巴萨', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7268, 'Kenya', NULL, 'Migori', NULL, 'MIG', '米戈利', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7269, 'Kenya', NULL, 'Muranga', NULL, 'MUR', '穆兰卡', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7270, 'Kenya', NULL, 'Nakuru', NULL, 'NUU', '纳库鲁', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7271, 'Kenya', NULL, 'Narok', NULL, 'NAR', '纳罗克', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7272, 'Kenya', NULL, 'Nandi', NULL, 'NAN', '南迪', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7273, 'Kenya', NULL, 'Nairobi', NULL, 'NA', '内罗毕', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7274, 'Kenya', NULL, 'Nithi', NULL, 'NIT', '尼蒂', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7275, 'Kenya', NULL, 'Nyamira', NULL, 'NYM', '尼亚米拉', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7276, 'Kenya', NULL, 'Nyandarua', NULL, 'NYN', '年达鲁阿', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7277, 'Kenya', NULL, 'Nyeri', NULL, 'NYE', '涅里', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7278, 'Kenya', NULL, 'Samburu', NULL, 'UAS', '桑布卢', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7279, 'Kenya', NULL, 'Tana River', NULL, 'TRI', '塔纳河', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7280, 'Kenya', NULL, 'Taita-Taveta', NULL, 'TTA', '泰塔塔维塔', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7281, 'Kenya', NULL, 'Trans-Nzoia', NULL, 'TNZ', '特兰斯-恩佐亚', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7282, 'Kenya', NULL, 'Turkana', NULL, 'TUR', '图尔卡纳', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7283, 'Kenya', NULL, 'Wajir', NULL, 'WJR', '瓦吉尔', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7284, 'Kenya', NULL, 'Uasin Gishu', NULL, 'UGI', '瓦辛基苏', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7285, 'Kenya', NULL, 'Vihiga', NULL, 'VIH', '韦希加', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7286, 'Kenya', NULL, 'West Pokot', NULL, 'WPO', '西波克特', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7287, 'Kenya', NULL, 'Siaya', NULL, 'SIA', '夏亚', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7288, 'Kenya', NULL, 'Isiolo', NULL, 'ISI', '伊希约洛', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7289, 'Kenya', NULL, 'Central', NULL, 'CE', '中央', NULL, '肯尼亚', 'KEN');
INSERT INTO `st_region_city` VALUES (7290, 'Latvia', NULL, 'Aluksnes', NULL, 'ALU', '阿卢克斯内', NULL, '拉脱维亚', 'LVA');
INSERT INTO `st_region_city` VALUES (7291, 'Latvia', NULL, 'Aizkraukles', NULL, 'AIZ', '爱兹克劳克雷', NULL, '拉脱维亚', 'LVA');
INSERT INTO `st_region_city` VALUES (7292, 'Latvia', NULL, 'Ogres', NULL, 'OGR', '奥格雷', NULL, '拉脱维亚', 'LVA');
INSERT INTO `st_region_city` VALUES (7293, 'Latvia', NULL, 'Balvu', NULL, 'BAL', '巴尔维', NULL, '拉脱维亚', 'LVA');
INSERT INTO `st_region_city` VALUES (7294, 'Latvia', NULL, 'Bauskas', NULL, 'BAU', '包斯卡', NULL, '拉脱维亚', 'LVA');
INSERT INTO `st_region_city` VALUES (7295, 'Latvia', NULL, 'Cesu', NULL, 'CES', '采西斯', NULL, '拉脱维亚', 'LVA');
INSERT INTO `st_region_city` VALUES (7296, 'Latvia', NULL, 'Dobeles', NULL, 'DOB', '多贝莱', NULL, '拉脱维亚', 'LVA');
INSERT INTO `st_region_city` VALUES (7297, 'Latvia', NULL, 'Gulbenes', NULL, 'GUL', '古尔贝内', NULL, '拉脱维亚', 'LVA');
INSERT INTO `st_region_city` VALUES (7298, 'Latvia', NULL, 'Jekabpils', NULL, 'JEK', '杰卡布皮尔斯', NULL, '拉脱维亚', 'LVA');
INSERT INTO `st_region_city` VALUES (7299, 'Latvia', NULL, 'Kraslavas', NULL, 'KRA', '克拉斯拉瓦', NULL, '拉脱维亚', 'LVA');
INSERT INTO `st_region_city` VALUES (7300, 'Latvia', NULL, 'Kuldigas', NULL, 'KUL', '库尔迪加', NULL, '拉脱维亚', 'LVA');
INSERT INTO `st_region_city` VALUES (7301, 'Latvia', NULL, 'Rezeknes', NULL, 'RZR', '雷泽克内', NULL, '拉脱维亚', 'LVA');
INSERT INTO `st_region_city` VALUES (7302, 'Latvia', NULL, 'Rigas', NULL, 'RGA', '里加', NULL, '拉脱维亚', 'LVA');
INSERT INTO `st_region_city` VALUES (7303, 'Latvia', NULL, 'Liepajas', NULL, 'LPK', '利耶帕亚', NULL, '拉脱维亚', 'LVA');
INSERT INTO `st_region_city` VALUES (7304, 'Latvia', NULL, 'Limbazu', NULL, 'LIM', '林巴济', NULL, '拉脱维亚', 'LVA');
INSERT INTO `st_region_city` VALUES (7305, 'Latvia', NULL, 'Ludzas', NULL, 'LUD', '卢扎', NULL, '拉脱维亚', 'LVA');
INSERT INTO `st_region_city` VALUES (7306, 'Latvia', NULL, 'Madonas', NULL, 'MAD', '马多纳', NULL, '拉脱维亚', 'LVA');
INSERT INTO `st_region_city` VALUES (7307, 'Latvia', NULL, 'Preilu', NULL, 'PRE', '普雷利', NULL, '拉脱维亚', 'LVA');
INSERT INTO `st_region_city` VALUES (7308, 'Latvia', NULL, 'Saldus', NULL, 'SAL', '萨尔杜斯', NULL, '拉脱维亚', 'LVA');
INSERT INTO `st_region_city` VALUES (7309, 'Latvia', NULL, 'Talsu', NULL, 'TAL', '塔尔西', NULL, '拉脱维亚', 'LVA');
INSERT INTO `st_region_city` VALUES (7310, 'Latvia', NULL, 'Daugavpils', NULL, 'DGR', '陶格夫皮尔斯', NULL, '拉脱维亚', 'LVA');
INSERT INTO `st_region_city` VALUES (7311, 'Latvia', NULL, 'Tukuma', NULL, 'TUK', '图库马', NULL, '拉脱维亚', 'LVA');
INSERT INTO `st_region_city` VALUES (7312, 'Latvia', NULL, 'Valkas', NULL, 'VLK', '瓦尔加', NULL, '拉脱维亚', 'LVA');
INSERT INTO `st_region_city` VALUES (7313, 'Latvia', NULL, 'Valmieras', NULL, 'VLM', '瓦尔米耶拉', NULL, '拉脱维亚', 'LVA');
INSERT INTO `st_region_city` VALUES (7314, 'Latvia', NULL, 'Ventspils', NULL, 'VSL', '文茨皮尔斯', NULL, '拉脱维亚', 'LVA');
INSERT INTO `st_region_city` VALUES (7315, 'Latvia', NULL, 'Jelgavas', NULL, 'JGR', '叶尔加瓦', NULL, '拉脱维亚', 'LVA');
INSERT INTO `st_region_city` VALUES (7316, 'Lesotho', NULL, 'Berea', NULL, 'D', '伯里亚', NULL, '莱索托', 'LSO');
INSERT INTO `st_region_city` VALUES (7317, 'Lesotho', NULL, 'Butha-Buthe', NULL, 'B', '布塔布泰', NULL, '莱索托', 'LSO');
INSERT INTO `st_region_city` VALUES (7318, 'Lesotho', NULL, 'Quthing', NULL, 'G', '古廷', NULL, '莱索托', 'LSO');
INSERT INTO `st_region_city` VALUES (7319, 'Lesotho', NULL, 'Qachas Nek', NULL, 'H', '加查斯内克', NULL, '莱索托', 'LSO');
INSERT INTO `st_region_city` VALUES (7320, 'Lesotho', NULL, 'Leribe', NULL, 'C', '莱里贝', NULL, '莱索托', 'LSO');
INSERT INTO `st_region_city` VALUES (7321, 'Lesotho', NULL, 'Mafeteng', NULL, 'E', '马费滕', NULL, '莱索托', 'LSO');
INSERT INTO `st_region_city` VALUES (7322, 'Lesotho', NULL, 'Maseru', NULL, 'A', '马塞卢', NULL, '莱索托', 'LSO');
INSERT INTO `st_region_city` VALUES (7323, 'Lesotho', NULL, 'Mohales Hoek', NULL, 'F', '莫哈莱斯胡克', NULL, '莱索托', 'LSO');
INSERT INTO `st_region_city` VALUES (7324, 'Lesotho', NULL, 'Mokhotlong', NULL, 'J', '莫霍特隆', NULL, '莱索托', 'LSO');
INSERT INTO `st_region_city` VALUES (7325, 'Lesotho', NULL, 'Thaba-Tseka', NULL, 'K', '塔巴采卡', NULL, '莱索托', 'LSO');
INSERT INTO `st_region_city` VALUES (7326, 'Laos', NULL, 'Attapu', NULL, 'AT', '阿速坡', NULL, '老挝', 'LAO');
INSERT INTO `st_region_city` VALUES (7327, 'Laos', NULL, 'Bolikhamxai', NULL, 'BL', '波里坎赛', NULL, '老挝', 'LAO');
INSERT INTO `st_region_city` VALUES (7328, 'Laos', NULL, 'Bokeo', NULL, 'BK', '博乔', NULL, '老挝', 'LAO');
INSERT INTO `st_region_city` VALUES (7329, 'Laos', NULL, 'Xiangkhoang', NULL, 'XI', '川圹', NULL, '老挝', 'LAO');
INSERT INTO `st_region_city` VALUES (7330, 'Laos', NULL, 'Phongsali', NULL, 'PH', '丰沙里', NULL, '老挝', 'LAO');
INSERT INTO `st_region_city` VALUES (7331, 'Laos', NULL, 'Khammouan', NULL, 'KH', '甘蒙', NULL, '老挝', 'LAO');
INSERT INTO `st_region_city` VALUES (7332, 'Laos', NULL, 'Houaphan', NULL, 'HO', '华潘', NULL, '老挝', 'LAO');
INSERT INTO `st_region_city` VALUES (7333, 'Laos', NULL, 'Louangphrabang', NULL, 'LP', '琅勃拉邦', NULL, '老挝', 'LAO');
INSERT INTO `st_region_city` VALUES (7334, 'Laos', NULL, 'Louang Namtha', NULL, 'LM', '琅南塔', NULL, '老挝', 'LAO');
INSERT INTO `st_region_city` VALUES (7335, 'Laos', NULL, 'Xaisomboun', NULL, 'XN', '赛宋本行政特区', NULL, '老挝', 'LAO');
INSERT INTO `st_region_city` VALUES (7336, 'Laos', NULL, 'Xekong', NULL, 'XE', '色贡', NULL, '老挝', 'LAO');
INSERT INTO `st_region_city` VALUES (7337, 'Laos', NULL, 'Saravan', NULL, 'SL', '沙拉湾', NULL, '老挝', 'LAO');
INSERT INTO `st_region_city` VALUES (7338, 'Laos', NULL, 'Savannakhet', NULL, 'SV', '沙湾拿吉', NULL, '老挝', 'LAO');
INSERT INTO `st_region_city` VALUES (7339, 'Laos', NULL, 'Xaignabouri', NULL, 'XA', '沙耶武里', NULL, '老挝', 'LAO');
INSERT INTO `st_region_city` VALUES (7340, 'Laos', NULL, 'Vientiane', NULL, 'VI', '万象', NULL, '老挝', 'LAO');
INSERT INTO `st_region_city` VALUES (7341, 'Laos', NULL, 'Oudomxai', NULL, 'OU', '乌多姆赛', NULL, '老挝', 'LAO');
INSERT INTO `st_region_city` VALUES (7342, 'Laos', NULL, 'Champasak', NULL, 'CH', '占巴塞', NULL, '老挝', 'LAO');
INSERT INTO `st_region_city` VALUES (7343, 'Lebanon', NULL, 'Ash-Shamal', NULL, 'AS', '北部', NULL, '黎巴嫩', 'LBN');
INSERT INTO `st_region_city` VALUES (7344, 'Lebanon', NULL, 'Al-Biqa', NULL, 'BI', '贝卡', NULL, '黎巴嫩', 'LBN');
INSERT INTO `st_region_city` VALUES (7345, 'Lebanon', NULL, 'Bayrut', NULL, 'BA', '贝鲁特', NULL, '黎巴嫩', 'LBN');
INSERT INTO `st_region_city` VALUES (7346, 'Lebanon', NULL, 'Jabal Lubnan', NULL, 'JL', '黎巴嫩山', NULL, '黎巴嫩', 'LBN');
INSERT INTO `st_region_city` VALUES (7347, 'Lebanon', NULL, 'An-Nabatiyah', NULL, 'NA', '奈拜提耶市', NULL, '黎巴嫩', 'LBN');
INSERT INTO `st_region_city` VALUES (7348, 'Lebanon', NULL, 'Al-Janub', NULL, 'JA', '南部', NULL, '黎巴嫩', 'LBN');
INSERT INTO `st_region_city` VALUES (7349, 'Liberia', NULL, 'Gbarpolu', NULL, 'GBA', '巴波卢', NULL, '利比里亚', 'LBR');
INSERT INTO `st_region_city` VALUES (7350, 'Liberia', NULL, 'Bong', NULL, 'BG', '邦', NULL, '利比里亚', 'LBR');
INSERT INTO `st_region_city` VALUES (7351, 'Liberia', NULL, 'Bopolu', NULL, 'BOP', '博波卢', NULL, '利比里亚', 'LBR');
INSERT INTO `st_region_city` VALUES (7352, 'Liberia', NULL, 'Bomi', NULL, 'BM', '博米', NULL, '利比里亚', 'LBR');
INSERT INTO `st_region_city` VALUES (7353, 'Liberia', NULL, 'Grand Bassa', NULL, 'GB', '大巴萨', NULL, '利比里亚', 'LBR');
INSERT INTO `st_region_city` VALUES (7354, 'Liberia', NULL, 'Grand Gedeh', NULL, 'GG', '大吉德', NULL, '利比里亚', 'LBR');
INSERT INTO `st_region_city` VALUES (7355, 'Liberia', NULL, 'Grand Cape Mount', NULL, 'CM', '大角山', NULL, '利比里亚', 'LBR');
INSERT INTO `st_region_city` VALUES (7356, 'Liberia', NULL, 'Grand Kru', NULL, 'GK', '大克鲁', NULL, '利比里亚', 'LBR');
INSERT INTO `st_region_city` VALUES (7357, 'Liberia', NULL, 'Fish Town', NULL, 'FT', '菲什敦', NULL, '利比里亚', 'LBR');
INSERT INTO `st_region_city` VALUES (7358, 'Liberia', NULL, 'River Gee', NULL, 'RG', '吉河', NULL, '利比里亚', 'LBR');
INSERT INTO `st_region_city` VALUES (7359, 'Liberia', NULL, 'River Cess', NULL, 'RI', '里弗塞斯', NULL, '利比里亚', 'LBR');
INSERT INTO `st_region_city` VALUES (7360, 'Liberia', NULL, 'Lofa', NULL, 'LO', '洛法', NULL, '利比里亚', 'LBR');
INSERT INTO `st_region_city` VALUES (7361, 'Liberia', NULL, 'Margibi', NULL, 'MG', '马吉比', NULL, '利比里亚', 'LBR');
INSERT INTO `st_region_city` VALUES (7362, 'Liberia', NULL, 'Maryland', NULL, 'MY', '马里兰', NULL, '利比里亚', 'LBR');
INSERT INTO `st_region_city` VALUES (7363, 'Liberia', NULL, 'Montserrado', NULL, 'MO', '蒙特塞拉多', NULL, '利比里亚', 'LBR');
INSERT INTO `st_region_city` VALUES (7364, 'Liberia', NULL, 'Nimba', NULL, 'NI', '宁巴', NULL, '利比里亚', 'LBR');
INSERT INTO `st_region_city` VALUES (7365, 'Liberia', NULL, 'Sinoe', NULL, 'SI', '锡诺', NULL, '利比里亚', 'LBR');
INSERT INTO `st_region_city` VALUES (7366, 'Lithuania', NULL, 'Alytus', NULL, 'AL', '阿利图斯', NULL, '立陶宛', 'LTU');
INSERT INTO `st_region_city` VALUES (7367, 'Lithuania', NULL, 'Kaunas', NULL, 'KA', '考纳斯', NULL, '立陶宛', 'LTU');
INSERT INTO `st_region_city` VALUES (7368, 'Lithuania', NULL, 'Klaipeda', NULL, 'KL', '克莱佩达', NULL, '立陶宛', 'LTU');
INSERT INTO `st_region_city` VALUES (7369, 'Lithuania', NULL, 'Marijampole', NULL, 'MA', '马里扬泊列', NULL, '立陶宛', 'LTU');
INSERT INTO `st_region_city` VALUES (7370, 'Lithuania', NULL, 'Panevezys', NULL, 'PA', '帕涅韦日斯', NULL, '立陶宛', 'LTU');
INSERT INTO `st_region_city` VALUES (7371, 'Lithuania', NULL, 'Taurages', NULL, 'TA', '陶拉格', NULL, '立陶宛', 'LTU');
INSERT INTO `st_region_city` VALUES (7372, 'Lithuania', NULL, 'Telsiu', NULL, 'TE', '特尔希艾', NULL, '立陶宛', 'LTU');
INSERT INTO `st_region_city` VALUES (7373, 'Lithuania', NULL, 'Vilnius', NULL, 'VI', '维尔纽斯', NULL, '立陶宛', 'LTU');
INSERT INTO `st_region_city` VALUES (7374, 'Lithuania', NULL, 'Utenos', NULL, 'UT', '乌田纳', NULL, '立陶宛', 'LTU');
INSERT INTO `st_region_city` VALUES (7375, 'Lithuania', NULL, 'Siauliai', NULL, 'SI', '希奥利艾', NULL, '立陶宛', 'LTU');
INSERT INTO `st_region_city` VALUES (7376, 'Lithuania', NULL, 'Akmenes', NULL, 'AKM', '亚克曼', NULL, '立陶宛', 'LTU');
INSERT INTO `st_region_city` VALUES (7377, 'Luxembourg', NULL, 'Diekirch', NULL, 'DD', '迪基希', NULL, '卢森堡', 'LUX');
INSERT INTO `st_region_city` VALUES (7378, 'Luxembourg', NULL, 'Grevenmacher', NULL, 'GG', '格雷文马赫', NULL, '卢森堡', 'LUX');
INSERT INTO `st_region_city` VALUES (7379, 'Luxembourg', NULL, 'Luxembourg', NULL, 'LL', '卢森堡', NULL, '卢森堡', 'LUX');
INSERT INTO `st_region_city` VALUES (7380, 'Rwanda', NULL, 'Byumba', NULL, 'BY', '比温巴', NULL, '卢旺达', 'RWA');
INSERT INTO `st_region_city` VALUES (7381, 'Rwanda', NULL, 'Butare', NULL, 'BU', '布塔雷', NULL, '卢旺达', 'RWA');
INSERT INTO `st_region_city` VALUES (7382, 'Rwanda', NULL, 'Nyanza', NULL, 'NY', '恩延扎', NULL, '卢旺达', 'RWA');
INSERT INTO `st_region_city` VALUES (7383, 'Rwanda', NULL, 'Kibungo', NULL, 'KG', '基本古', NULL, '卢旺达', 'RWA');
INSERT INTO `st_region_city` VALUES (7384, 'Rwanda', NULL, 'Kibuye', NULL, 'KY', '基布耶', NULL, '卢旺达', 'RWA');
INSERT INTO `st_region_city` VALUES (7385, 'Rwanda', NULL, 'Kigali-Ngali', NULL, 'KR', '基加利-恩加利', NULL, '卢旺达', 'RWA');
INSERT INTO `st_region_city` VALUES (7386, 'Rwanda', NULL, 'Kigali-Ville', NULL, 'KV', '基加利市', NULL, '卢旺达', 'RWA');
INSERT INTO `st_region_city` VALUES (7387, 'Rwanda', NULL, 'Gikongoro', NULL, 'GK', '吉孔戈罗', NULL, '卢旺达', 'RWA');
INSERT INTO `st_region_city` VALUES (7388, 'Rwanda', NULL, 'Gisenyi', NULL, 'GS', '吉塞尼', NULL, '卢旺达', 'RWA');
INSERT INTO `st_region_city` VALUES (7389, 'Rwanda', NULL, 'Gitarama', NULL, 'GT', '吉塔拉马', NULL, '卢旺达', 'RWA');
INSERT INTO `st_region_city` VALUES (7390, 'Rwanda', NULL, 'Kabuga', NULL, 'KA', '卡布加', NULL, '卢旺达', 'RWA');
INSERT INTO `st_region_city` VALUES (7391, 'Rwanda', NULL, 'Rwamagana', NULL, 'RW', '卢瓦马加纳', NULL, '卢旺达', 'RWA');
INSERT INTO `st_region_city` VALUES (7392, 'Rwanda', NULL, 'Ruhango', NULL, 'RH', '鲁汉戈', NULL, '卢旺达', 'RWA');
INSERT INTO `st_region_city` VALUES (7393, 'Rwanda', NULL, 'Ruhengeri', NULL, 'RU', '鲁亨盖里', NULL, '卢旺达', 'RWA');
INSERT INTO `st_region_city` VALUES (7394, 'Rwanda', NULL, 'Cyangugu', NULL, 'CY', '尚古古', NULL, '卢旺达', 'RWA');
INSERT INTO `st_region_city` VALUES (7395, 'Rwanda', NULL, 'Umutara', NULL, 'UM', '乌姆塔拉', NULL, '卢旺达', 'RWA');
INSERT INTO `st_region_city` VALUES (7396, 'Romania', NULL, 'Alba Iulia', NULL, 'AL', '阿尔巴尤利亚', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7397, 'Romania', NULL, 'Arad', NULL, 'AR', '阿拉德', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7398, 'Romania', NULL, 'Oradea', NULL, 'OR', '奥拉迪亚', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7399, 'Romania', NULL, 'Bacau', NULL, 'BA', '巴克乌', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7400, 'Romania', NULL, 'Baia Mare', NULL, 'BM', '巴亚马雷', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7401, 'Romania', NULL, 'Bistrita', NULL, 'BN', '比斯特里察', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7402, 'Romania', NULL, 'Botosani', NULL, 'BO', '博托沙尼', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7403, 'Romania', NULL, 'Bucuresti', NULL, 'BC', '布加勒斯特', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7404, 'Romania', NULL, 'Brasov', NULL, 'BS', '布拉索夫', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7405, 'Romania', NULL, 'Braila', NULL, 'BL', '布勒伊拉', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7406, 'Romania', NULL, 'Buzau', NULL, 'BZ', '布泽乌', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7407, 'Romania', NULL, 'Drobeta-Turnu Severin', NULL, 'DT', '德罗贝塔-塞维林堡', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7408, 'Romania', NULL, 'Deva', NULL, 'DE', '德瓦', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7409, 'Romania', NULL, 'Timisoara', NULL, 'TI', '蒂米什瓦拉', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7410, 'Romania', NULL, 'Focsani', NULL, 'FO', '福克沙尼', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7411, 'Romania', NULL, 'Galati', NULL, 'GL', '加拉茨', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7412, 'Romania', NULL, 'Giurgiu', NULL, 'GG', '久尔久', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7413, 'Romania', NULL, 'Constanta', NULL, 'CT', '康斯坦察', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7414, 'Romania', NULL, 'Craiova', NULL, 'DO', '克拉约瓦', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7415, 'Romania', NULL, 'Calarasi', NULL, 'CR', '克勒拉希', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7416, 'Romania', NULL, 'Cluj-Napoca', NULL, 'CN', '克卢日纳波卡', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7417, 'Romania', NULL, 'XRimnicu Vilcea', NULL, 'VI', '勒姆尼库沃尔恰', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7418, 'Romania', NULL, 'Resita', NULL, 'RE', '雷希察', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7419, 'Romania', NULL, 'Miercurea-Ciuc', NULL, 'MC', '梅尔库里亚丘克', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7420, 'Romania', NULL, 'Pitesti', NULL, 'PI', '皮特什蒂', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7421, 'Romania', NULL, 'Piatra Neamt', NULL, 'PN', '皮亚特拉尼亚姆茨', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7422, 'Romania', NULL, 'Ploiesti', NULL, 'PL', '普洛耶什蒂', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7423, 'Romania', NULL, 'Satu Mare', NULL, 'SM', '萨图·马雷', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7424, 'Romania', NULL, 'Sfantu-Gheorghe', NULL, 'SG', '圣格奥尔基', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7425, 'Romania', NULL, 'Slatina', NULL, 'ST', '斯拉蒂纳', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7426, 'Romania', NULL, 'Slobozia', NULL, 'SB', '斯洛博齐亚', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7427, 'Romania', NULL, 'Suceava', NULL, 'SU', '苏恰瓦', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7428, 'Romania', NULL, 'Targovişte', NULL, 'TA', '特尔戈维什泰', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7429, 'Romania', NULL, 'Tirgu Mures', NULL, 'TM', '特尔古穆列什', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7430, 'Romania', NULL, 'Tirgu-Jiu', NULL, 'TJ', '特尔古日乌', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7431, 'Romania', NULL, 'Tulcea', NULL, 'TU', '图尔恰', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7432, 'Romania', NULL, 'Vaslui', NULL, 'VA', '瓦斯卢伊', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7433, 'Romania', NULL, 'Sibiu', NULL, 'SO', '锡比乌', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7434, 'Romania', NULL, 'Iasi', NULL, 'IS', '雅西', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7435, 'Romania', NULL, 'Alexandria', NULL, 'AD', '亚厉山德里亚', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7436, 'Romania', NULL, 'Zalau', NULL, 'ZA', '扎勒乌', NULL, '罗马尼亚', 'ROU');
INSERT INTO `st_region_city` VALUES (7437, 'Madagascar', NULL, 'Antsiranana', NULL, 'AS', '安齐拉纳纳', NULL, '马达加斯加', 'MDG');
INSERT INTO `st_region_city` VALUES (7438, 'Madagascar', NULL, 'Fianarantsoa', NULL, 'FN', '菲亚纳兰楚阿', NULL, '马达加斯加', 'MDG');
INSERT INTO `st_region_city` VALUES (7439, 'Madagascar', NULL, 'Mahajanga', NULL, 'MJ', '马哈赞加', NULL, '马达加斯加', 'MDG');
INSERT INTO `st_region_city` VALUES (7440, 'Madagascar', NULL, 'Antananarivo', NULL, 'AN', '塔那那利佛', NULL, '马达加斯加', 'MDG');
INSERT INTO `st_region_city` VALUES (7441, 'Madagascar', NULL, 'Toamasina', NULL, 'TM', '图阿马西拉', NULL, '马达加斯加', 'MDG');
INSERT INTO `st_region_city` VALUES (7442, 'Madagascar', NULL, 'Toliary', NULL, 'TL', '图利亚拉', NULL, '马达加斯加', 'MDG');
INSERT INTO `st_region_city` VALUES (7443, 'Maldives', NULL, 'Addu Atoll', NULL, 'ADD', '阿杜', NULL, '马尔代夫', 'MDV');
INSERT INTO `st_region_city` VALUES (7444, 'Maldives', NULL, 'North Ari Atoll', NULL, 'AAD', '北阿里', NULL, '马尔代夫', 'MDV');
INSERT INTO `st_region_city` VALUES (7445, 'Maldives', NULL, 'North Thiladhunmathi', NULL, 'THD', '北蒂拉杜马蒂', NULL, '马尔代夫', 'MDV');
INSERT INTO `st_region_city` VALUES (7446, 'Maldives', NULL, 'North Maalhosmadhulu', NULL, 'MAD', '北马洛斯马杜卢', NULL, '马尔代夫', 'MDV');
INSERT INTO `st_region_city` VALUES (7447, 'Maldives', NULL, 'North Miladhunmadhulu', NULL, 'MLD', '北米拉杜马杜卢', NULL, '马尔代夫', 'MDV');
INSERT INTO `st_region_city` VALUES (7448, 'Maldives', NULL, 'North Nilandhe Atoll', NULL, 'NAD', '北尼兰杜', NULL, '马尔代夫', 'MDV');
INSERT INTO `st_region_city` VALUES (7449, 'Maldives', NULL, 'North Huvadhu Atoll', NULL, 'HAD', '北苏瓦迪瓦', NULL, '马尔代夫', 'MDV');
INSERT INTO `st_region_city` VALUES (7450, 'Maldives', NULL, 'Faadhippolhu', NULL, 'FAA', '法迪福卢', NULL, '马尔代夫', 'MDV');
INSERT INTO `st_region_city` VALUES (7451, 'Maldives', NULL, 'Felidhu Atoll', NULL, 'FEA', '费利杜', NULL, '马尔代夫', 'MDV');
INSERT INTO `st_region_city` VALUES (7452, 'Maldives', NULL, 'Foammulah', NULL, 'FMU', '福阿穆拉库', NULL, '马尔代夫', 'MDV');
INSERT INTO `st_region_city` VALUES (7453, 'Maldives', NULL, 'Hadhdhunmathi', NULL, 'HDH', '哈杜马蒂', NULL, '马尔代夫', 'MDV');
INSERT INTO `st_region_city` VALUES (7454, 'Maldives', NULL, 'Kolhumadulu', NULL, 'KLH', '科卢马杜卢', NULL, '马尔代夫', 'MDV');
INSERT INTO `st_region_city` VALUES (7455, 'Maldives', NULL, 'Male', NULL, 'MAL', '马累', NULL, '马尔代夫', 'MDV');
INSERT INTO `st_region_city` VALUES (7456, 'Maldives', NULL, 'Male Atoll', NULL, 'MAA', '马累岛', NULL, '马尔代夫', 'MDV');
INSERT INTO `st_region_city` VALUES (7457, 'Maldives', NULL, 'Mulakatholhu', NULL, 'MUA', '穆拉库', NULL, '马尔代夫', 'MDV');
INSERT INTO `st_region_city` VALUES (7458, 'Maldives', NULL, 'South Ari Atoll', NULL, 'AAU', '南阿里', NULL, '马尔代夫', 'MDV');
INSERT INTO `st_region_city` VALUES (7459, 'Maldives', NULL, 'South Thiladhunmathi', NULL, 'THU', '南蒂拉杜马蒂', NULL, '马尔代夫', 'MDV');
INSERT INTO `st_region_city` VALUES (7460, 'Maldives', NULL, 'South Maalhosmadulu', NULL, 'MAU', '南马洛斯马杜卢', NULL, '马尔代夫', 'MDV');
INSERT INTO `st_region_city` VALUES (7461, 'Maldives', NULL, 'South Miladhunmadhulu', NULL, 'MLU', '南米拉杜马杜卢', NULL, '马尔代夫', 'MDV');
INSERT INTO `st_region_city` VALUES (7462, 'Maldives', NULL, 'South Nilandhe Atoll', NULL, 'NAU', '南尼兰杜', NULL, '马尔代夫', 'MDV');
INSERT INTO `st_region_city` VALUES (7463, 'Maldives', NULL, 'South Huvadhu Atoll', NULL, 'HAU', '南苏瓦迪瓦', NULL, '马尔代夫', 'MDV');
INSERT INTO `st_region_city` VALUES (7464, 'Malawi', NULL, 'Northern', NULL, 'N', '北部区', NULL, '马拉维', 'MWI');
INSERT INTO `st_region_city` VALUES (7465, 'Malawi', NULL, 'Southern', NULL, 'S', '南部区', NULL, '马拉维', 'MWI');
INSERT INTO `st_region_city` VALUES (7466, 'Malawi', NULL, 'Central', NULL, 'C', '中央区', NULL, '马拉维', 'MWI');
INSERT INTO `st_region_city` VALUES (7467, 'Mali', NULL, 'Bamako', NULL, 'CD', '巴马科首都区', NULL, '马里', 'MLI');
INSERT INTO `st_region_city` VALUES (7468, 'Mali', NULL, 'Kidal', NULL, 'KD', '基达尔', NULL, '马里', 'MLI');
INSERT INTO `st_region_city` VALUES (7469, 'Mali', NULL, 'Gao', NULL, 'GA', '加奥', NULL, '马里', 'MLI');
INSERT INTO `st_region_city` VALUES (7470, 'Mali', NULL, 'Kayes', NULL, 'KY', '卡伊', NULL, '马里', 'MLI');
INSERT INTO `st_region_city` VALUES (7471, 'Mali', NULL, 'Koulikoro', NULL, 'KL', '库利科罗', NULL, '马里', 'MLI');
INSERT INTO `st_region_city` VALUES (7472, 'Mali', NULL, 'Mopti', NULL, 'MP', '莫普提', NULL, '马里', 'MLI');
INSERT INTO `st_region_city` VALUES (7473, 'Mali', NULL, 'Segou', NULL, 'SG', '塞古', NULL, '马里', 'MLI');
INSERT INTO `st_region_city` VALUES (7474, 'Mali', NULL, 'Tombouctou', NULL, 'TB', '通布图', NULL, '马里', 'MLI');
INSERT INTO `st_region_city` VALUES (7475, 'Mali', NULL, 'Sikasso', NULL, 'SK', '锡卡索', NULL, '马里', 'MLI');
INSERT INTO `st_region_city` VALUES (7476, 'Mauritania', NULL, 'Adrar', NULL, 'AD', '阿德拉尔', NULL, '毛里塔尼亚', 'MRT');
INSERT INTO `st_region_city` VALUES (7477, 'Mauritania', NULL, 'El-Acaba', NULL, 'AS', '阿萨巴', NULL, '毛里塔尼亚', 'MRT');
INSERT INTO `st_region_city` VALUES (7478, 'Mauritania', NULL, 'Brakna', NULL, 'BR', '卜拉克纳', NULL, '毛里塔尼亚', 'MRT');
INSERT INTO `st_region_city` VALUES (7479, 'Mauritania', NULL, 'Hodh el-Gharbi', NULL, 'HG', '东胡德', NULL, '毛里塔尼亚', 'MRT');
INSERT INTO `st_region_city` VALUES (7480, 'Mauritania', NULL, 'Gorgol', NULL, 'GO', '戈尔戈勒', NULL, '毛里塔尼亚', 'MRT');
INSERT INTO `st_region_city` VALUES (7481, 'Mauritania', NULL, 'Guidimaka', NULL, 'GM', '吉迪马卡', NULL, '毛里塔尼亚', 'MRT');
INSERT INTO `st_region_city` VALUES (7482, 'Mauritania', NULL, 'Dakhlet Nouadhibou', NULL, 'DN', '努瓦迪布湾', NULL, '毛里塔尼亚', 'MRT');
INSERT INTO `st_region_city` VALUES (7483, 'Mauritania', NULL, 'Nouakchott', NULL, 'NO', '努瓦克肖特特区', NULL, '毛里塔尼亚', 'MRT');
INSERT INTO `st_region_city` VALUES (7484, 'Mauritania', NULL, 'Tagant', NULL, 'TA', '塔甘特', NULL, '毛里塔尼亚', 'MRT');
INSERT INTO `st_region_city` VALUES (7485, 'Mauritania', NULL, 'Trarza', NULL, 'TR', '特拉扎', NULL, '毛里塔尼亚', 'MRT');
INSERT INTO `st_region_city` VALUES (7486, 'Mauritania', NULL, 'Tiris Zemmour', NULL, 'TZ', '提里斯-宰穆尔', NULL, '毛里塔尼亚', 'MRT');
INSERT INTO `st_region_city` VALUES (7487, 'Mauritania', NULL, 'Hodh ech-Chargui', NULL, 'HC', '西胡德', NULL, '毛里塔尼亚', 'MRT');
INSERT INTO `st_region_city` VALUES (7488, 'Mauritania', NULL, 'Inchiri', NULL, 'IN', '因希里', NULL, '毛里塔尼亚', 'MRT');
INSERT INTO `st_region_city` VALUES (7489, 'American Samoa', NULL, 'Aana', NULL, 'AAN', '阿纳', NULL, '美属萨摩亚', 'ASM');
INSERT INTO `st_region_city` VALUES (7490, 'American Samoa', NULL, 'Atua', NULL, 'ATU', '阿图阿', NULL, '美属萨摩亚', 'ASM');
INSERT INTO `st_region_city` VALUES (7491, 'American Samoa', NULL, 'Aigaile Tai', NULL, 'AIT', '艾加伊勒泰', NULL, '美属萨摩亚', 'ASM');
INSERT INTO `st_region_city` VALUES (7492, 'American Samoa', NULL, 'Faasaleleaga', NULL, 'FAA', '法塞莱莱阿加', NULL, '美属萨摩亚', 'ASM');
INSERT INTO `st_region_city` VALUES (7493, 'American Samoa', NULL, 'Gagaifomauga', NULL, 'GFG', '加盖福毛加', NULL, '美属萨摩亚', 'ASM');
INSERT INTO `st_region_city` VALUES (7494, 'American Samoa', NULL, 'Gagaemauga', NULL, 'GMG', '加加埃毛加', NULL, '美属萨摩亚', 'ASM');
INSERT INTO `st_region_city` VALUES (7495, 'American Samoa', NULL, 'Palauli', NULL, 'PAL', '帕劳利', NULL, '美属萨摩亚', 'ASM');
INSERT INTO `st_region_city` VALUES (7496, 'American Samoa', NULL, 'Satupaitea', NULL, 'SAT', '萨图帕伊泰阿', NULL, '美属萨摩亚', 'ASM');
INSERT INTO `st_region_city` VALUES (7497, 'American Samoa', NULL, 'Savaii', NULL, 'SAV', '萨瓦伊岛', NULL, '美属萨摩亚', 'ASM');
INSERT INTO `st_region_city` VALUES (7498, 'American Samoa', NULL, 'Tuamasaga', NULL, 'TUA', '图阿马萨加', NULL, '美属萨摩亚', 'ASM');
INSERT INTO `st_region_city` VALUES (7499, 'American Samoa', NULL, 'Vaao Fonoti', NULL, 'VAF', '瓦奥福诺蒂', NULL, '美属萨摩亚', 'ASM');
INSERT INTO `st_region_city` VALUES (7500, 'American Samoa', NULL, 'Vaisigano', NULL, 'VAI', '韦西加诺', NULL, '美属萨摩亚', 'ASM');
INSERT INTO `st_region_city` VALUES (7501, 'American Samoa', NULL, 'Upolu', NULL, 'UPO', '乌波卢岛', NULL, '美属萨摩亚', 'ASM');
INSERT INTO `st_region_city` VALUES (7502, 'Mongolia', NULL, 'Bayanhongor', NULL, '69', '巴彦洪格尔', NULL, '蒙古', 'MNG');
INSERT INTO `st_region_city` VALUES (7503, 'Mongolia', NULL, 'Bayan-Ulgiy', NULL, '71', '巴彦乌勒盖', NULL, '蒙古', 'MNG');
INSERT INTO `st_region_city` VALUES (7504, 'Mongolia', NULL, 'Bulgan', NULL, '67', '布尔干', NULL, '蒙古', 'MNG');
INSERT INTO `st_region_city` VALUES (7505, 'Mongolia', NULL, 'Darhan-Uul', NULL, '37', '达尔汗乌勒', NULL, '蒙古', 'MNG');
INSERT INTO `st_region_city` VALUES (7506, 'Mongolia', NULL, 'Dornod', NULL, '61', '东方', NULL, '蒙古', 'MNG');
INSERT INTO `st_region_city` VALUES (7507, 'Mongolia', NULL, 'Dornogovi', NULL, '63', '东戈壁', NULL, '蒙古', 'MNG');
INSERT INTO `st_region_city` VALUES (7508, 'Mongolia', NULL, 'Orhon', NULL, '35', '鄂尔浑', NULL, '蒙古', 'MNG');
INSERT INTO `st_region_city` VALUES (7509, 'Mongolia', NULL, 'Govi-Altay', NULL, '65', '戈壁阿尔泰', NULL, '蒙古', 'MNG');
INSERT INTO `st_region_city` VALUES (7510, 'Mongolia', NULL, 'Govisumber', NULL, '64', '戈壁苏木贝尔', NULL, '蒙古', 'MNG');
INSERT INTO `st_region_city` VALUES (7511, 'Mongolia', NULL, 'Arhangay', NULL, '73', '后杭爱', NULL, '蒙古', 'MNG');
INSERT INTO `st_region_city` VALUES (7512, 'Mongolia', NULL, 'Hovd', NULL, '43', '科布多', NULL, '蒙古', 'MNG');
INSERT INTO `st_region_city` VALUES (7513, 'Mongolia', NULL, 'Hentiy', NULL, '39', '肯特', NULL, '蒙古', 'MNG');
INSERT INTO `st_region_city` VALUES (7514, 'Mongolia', NULL, 'Hovsgol', NULL, '41', '库苏古尔', NULL, '蒙古', 'MNG');
INSERT INTO `st_region_city` VALUES (7515, 'Mongolia', NULL, 'Umnogovi', NULL, 'UMN', '南戈壁', NULL, '蒙古', 'MNG');
INSERT INTO `st_region_city` VALUES (7516, 'Mongolia', NULL, 'Uvorhangay', NULL, 'UVO', '前杭爱', NULL, '蒙古', 'MNG');
INSERT INTO `st_region_city` VALUES (7517, 'Mongolia', NULL, 'Selenge', NULL, '49', '色楞格', NULL, '蒙古', 'MNG');
INSERT INTO `st_region_city` VALUES (7518, 'Mongolia', NULL, 'Suhbaatar', NULL, '51', '苏赫巴托尔', NULL, '蒙古', 'MNG');
INSERT INTO `st_region_city` VALUES (7519, 'Mongolia', NULL, 'Uvs', NULL, '46', '乌布苏', NULL, '蒙古', 'MNG');
INSERT INTO `st_region_city` VALUES (7520, 'Mongolia', NULL, 'Ulaanbaatar hot', NULL, '1', '乌兰巴托市', NULL, '蒙古', 'MNG');
INSERT INTO `st_region_city` VALUES (7521, 'Mongolia', NULL, 'Dzavhan', NULL, '57', '扎布汗', NULL, '蒙古', 'MNG');
INSERT INTO `st_region_city` VALUES (7522, 'Mongolia', NULL, 'Dundgovi', NULL, '59', '中戈壁', NULL, '蒙古', 'MNG');
INSERT INTO `st_region_city` VALUES (7523, 'Mongolia', NULL, 'Tov', NULL, '47', '中央', NULL, '蒙古', 'MNG');
INSERT INTO `st_region_city` VALUES (7524, 'Bangladesh', NULL, 'Dhaka', NULL, 'DAC', '达卡', NULL, '孟加拉', 'BGD');
INSERT INTO `st_region_city` VALUES (7525, 'Bangladesh', NULL, 'Chittagong', NULL, 'CGP', '吉大港', NULL, '孟加拉', 'BGD');
INSERT INTO `st_region_city` VALUES (7526, 'Bangladesh', NULL, 'Khulna', NULL, 'KHL', '库尔纳', NULL, '孟加拉', 'BGD');
INSERT INTO `st_region_city` VALUES (7527, 'Peru', NULL, 'Arequipa', NULL, 'AR', '阿雷基帕', NULL, '秘鲁', 'PER');
INSERT INTO `st_region_city` VALUES (7528, 'Peru', NULL, 'Apurimac', NULL, 'AP', '阿普里马克', NULL, '秘鲁', 'PER');
INSERT INTO `st_region_city` VALUES (7529, 'Peru', NULL, 'Ayacucho', NULL, 'AY', '阿亚库乔', NULL, '秘鲁', 'PER');
INSERT INTO `st_region_city` VALUES (7530, 'Peru', NULL, 'Ancash', NULL, 'AN', '安卡什', NULL, '秘鲁', 'PER');
INSERT INTO `st_region_city` VALUES (7531, 'Peru', NULL, 'Juliaca', NULL, 'JUL', '胡利亚卡', NULL, '秘鲁', 'PER');
INSERT INTO `st_region_city` VALUES (7532, 'Peru', NULL, 'Junin', NULL, 'JU', '胡宁', NULL, '秘鲁', 'PER');
INSERT INTO `st_region_city` VALUES (7533, 'Peru', NULL, 'Cajamarca', NULL, 'CJ', '卡哈马卡', NULL, '秘鲁', 'PER');
INSERT INTO `st_region_city` VALUES (7534, 'Peru', NULL, 'Callao', NULL, 'CL', '卡亚俄', NULL, '秘鲁', 'PER');
INSERT INTO `st_region_city` VALUES (7535, 'Peru', NULL, 'Cusco', NULL, 'CU', '库斯科', NULL, '秘鲁', 'PER');
INSERT INTO `st_region_city` VALUES (7536, 'Peru', NULL, 'La Libertad', NULL, 'LD', '拉利伯塔德', NULL, '秘鲁', 'PER');
INSERT INTO `st_region_city` VALUES (7537, 'Peru', NULL, 'Lambayeque', NULL, 'LY', '兰巴耶克', NULL, '秘鲁', 'PER');
INSERT INTO `st_region_city` VALUES (7538, 'Peru', NULL, 'Lima', NULL, 'LI', '利马', NULL, '秘鲁', 'PER');
INSERT INTO `st_region_city` VALUES (7539, 'Peru', NULL, 'Loreto', NULL, 'LO', '洛雷托', NULL, '秘鲁', 'PER');
INSERT INTO `st_region_city` VALUES (7540, 'Peru', NULL, 'Madre de Dios', NULL, 'MD', '马德雷德迪奥斯', NULL, '秘鲁', 'PER');
INSERT INTO `st_region_city` VALUES (7541, 'Peru', NULL, 'Moquegua', NULL, 'MO', '莫克瓜', NULL, '秘鲁', 'PER');
INSERT INTO `st_region_city` VALUES (7542, 'Peru', NULL, 'Pasco', NULL, 'PA', '帕斯科', NULL, '秘鲁', 'PER');
INSERT INTO `st_region_city` VALUES (7543, 'Peru', NULL, 'Piura', NULL, 'PI', '皮乌拉', NULL, '秘鲁', 'PER');
INSERT INTO `st_region_city` VALUES (7544, 'Peru', NULL, 'Puno', NULL, 'PU', '普诺', NULL, '秘鲁', 'PER');
INSERT INTO `st_region_city` VALUES (7545, 'Peru', NULL, 'Chimbote', NULL, 'CHM', '钦博特', NULL, '秘鲁', 'PER');
INSERT INTO `st_region_city` VALUES (7546, 'Peru', NULL, 'Chincha Alta', NULL, 'CHI', '钦查阿尔塔', NULL, '秘鲁', 'PER');
INSERT INTO `st_region_city` VALUES (7547, 'Peru', NULL, 'San Martin', NULL, 'SM', '圣马丁', NULL, '秘鲁', 'PER');
INSERT INTO `st_region_city` VALUES (7548, 'Peru', NULL, 'Sullana', NULL, 'SUL', '苏拉纳', NULL, '秘鲁', 'PER');
INSERT INTO `st_region_city` VALUES (7549, 'Peru', NULL, 'Tacna', NULL, 'TA', '塔克纳', NULL, '秘鲁', 'PER');
INSERT INTO `st_region_city` VALUES (7550, 'Peru', NULL, 'Tumbes', NULL, 'TU', '通贝斯', NULL, '秘鲁', 'PER');
INSERT INTO `st_region_city` VALUES (7551, 'Peru', NULL, 'Huanuco', NULL, 'HO', '瓦努科', NULL, '秘鲁', 'PER');
INSERT INTO `st_region_city` VALUES (7552, 'Peru', NULL, 'Huancavelica', NULL, 'HV', '万卡维利卡', NULL, '秘鲁', 'PER');
INSERT INTO `st_region_city` VALUES (7553, 'Peru', NULL, 'Ucayali', NULL, 'UC', '乌卡亚利', NULL, '秘鲁', 'PER');
INSERT INTO `st_region_city` VALUES (7554, 'Peru', NULL, 'Amazonas', NULL, 'AM', '亚马孙', NULL, '秘鲁', 'PER');
INSERT INTO `st_region_city` VALUES (7555, 'Peru', NULL, 'Ica', NULL, 'IC', '伊卡', NULL, '秘鲁', 'PER');
INSERT INTO `st_region_city` VALUES (7556, 'Myanmar', NULL, 'Bago', NULL, 'BG', '勃固省', NULL, '缅甸', 'MMR');
INSERT INTO `st_region_city` VALUES (7557, 'Myanmar', NULL, 'Shan', NULL, 'SH', '掸邦', NULL, '缅甸', 'MMR');
INSERT INTO `st_region_city` VALUES (7558, 'Myanmar', NULL, 'Tanintharyi', NULL, 'TN', '德林达依省', NULL, '缅甸', 'MMR');
INSERT INTO `st_region_city` VALUES (7559, 'Myanmar', NULL, 'Kayin', NULL, 'KN', '克伦邦', NULL, '缅甸', 'MMR');
INSERT INTO `st_region_city` VALUES (7560, 'Myanmar', NULL, 'Kachin', NULL, 'KC', '克钦邦', NULL, '缅甸', 'MMR');
INSERT INTO `st_region_city` VALUES (7561, 'Myanmar', NULL, 'Kayah', NULL, 'KH', '克耶邦', NULL, '缅甸', 'MMR');
INSERT INTO `st_region_city` VALUES (7562, 'Myanmar', NULL, 'Magway', NULL, 'MG', '马圭省', NULL, '缅甸', 'MMR');
INSERT INTO `st_region_city` VALUES (7563, 'Myanmar', NULL, 'Mandalay', NULL, 'MD', '曼德勒省', NULL, '缅甸', 'MMR');
INSERT INTO `st_region_city` VALUES (7564, 'Myanmar', NULL, 'Mon', NULL, 'MN', '孟邦', NULL, '缅甸', 'MMR');
INSERT INTO `st_region_city` VALUES (7565, 'Myanmar', NULL, 'Chin', NULL, 'CH', '钦邦', NULL, '缅甸', 'MMR');
INSERT INTO `st_region_city` VALUES (7566, 'Myanmar', NULL, 'Rakhine', NULL, 'RK', '若开邦', NULL, '缅甸', 'MMR');
INSERT INTO `st_region_city` VALUES (7567, 'Myanmar', NULL, 'Sagaing', NULL, 'SG', '实皆省', NULL, '缅甸', 'MMR');
INSERT INTO `st_region_city` VALUES (7568, 'Myanmar', NULL, 'Yangon', NULL, 'YG', '仰光省', NULL, '缅甸', 'MMR');
INSERT INTO `st_region_city` VALUES (7569, 'Myanmar', NULL, 'Ayeyarwady', NULL, 'AY', '伊洛瓦底省', NULL, '缅甸', 'MMR');
INSERT INTO `st_region_city` VALUES (7570, 'Morocco', NULL, 'Tangier', NULL, 'TGR', '丹吉尔', NULL, '摩洛哥', 'MAR');
INSERT INTO `st_region_city` VALUES (7571, 'Morocco', NULL, 'Tetouan', NULL, 'TET', '得土安', NULL, '摩洛哥', 'MAR');
INSERT INTO `st_region_city` VALUES (7572, 'Morocco', NULL, 'Fes', NULL, 'FES', '非斯', NULL, '摩洛哥', 'MAR');
INSERT INTO `st_region_city` VALUES (7573, 'Morocco', NULL, 'Casablanca', NULL, 'CBL', '卡萨布兰卡', NULL, '摩洛哥', 'MAR');
INSERT INTO `st_region_city` VALUES (7574, 'Morocco', NULL, 'Rabat', NULL, 'RSA', '拉巴特', NULL, '摩洛哥', 'MAR');
INSERT INTO `st_region_city` VALUES (7575, 'Morocco', NULL, 'Marrakech', NULL, 'MRK', '马拉喀什', NULL, '摩洛哥', 'MAR');
INSERT INTO `st_region_city` VALUES (7576, 'Morocco', NULL, 'Meknes', NULL, 'MKN', '梅克内斯', NULL, '摩洛哥', 'MAR');
INSERT INTO `st_region_city` VALUES (7577, 'Morocco', NULL, 'Oujda', NULL, 'OUJ', '乌季达', NULL, '摩洛哥', 'MAR');
INSERT INTO `st_region_city` VALUES (7578, 'Morocco', NULL, 'Western Sahara', NULL, 'WSH', '西撒哈拉', NULL, '摩洛哥', 'MAR');
INSERT INTO `st_region_city` VALUES (7579, 'Mexico', NULL, 'Aguascalientes', NULL, 'AGU', '阿瓜斯卡连斯特', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7580, 'Mexico', NULL, 'Acapulco', NULL, 'ACA', '阿卡普尔科', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7581, 'Mexico', NULL, 'Hermosillo', NULL, 'HMO', '埃莫西约', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7582, 'Mexico', NULL, 'Campeche', NULL, 'CAM', '埃佩切', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7583, 'Mexico', NULL, 'Obregon', NULL, 'OBR', '奥夫雷贡城', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7584, 'Mexico', NULL, 'Orizaba', NULL, 'ORI', '奥里萨巴', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7585, 'Mexico', NULL, 'Valles', NULL, 'VHM', '巴利城', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7586, 'Mexico', NULL, 'Puerto Vallarta', NULL, 'PVR', '巴亚尔塔港', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7587, 'Mexico', NULL, 'Villahermosa', NULL, 'VSA', '比利亚埃尔莫萨', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7588, 'Mexico', NULL, 'Poza Rica de Hidalgo', NULL, 'PRH', '波萨里卡', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7589, 'Mexico', NULL, 'Tijuana', NULL, 'TIJ', '蒂华纳', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7590, 'Mexico', NULL, 'Durango', NULL, 'DUR', '杜兰戈', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7591, 'Mexico', NULL, 'Ensenada', NULL, 'ESE', '恩塞纳达', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7592, 'Mexico', NULL, 'Guadalajara', NULL, 'GDL', '瓜达拉哈拉', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7593, 'Mexico', NULL, 'Guanajuato', NULL, 'GUA', '瓜纳华托', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7594, 'Mexico', NULL, 'Jalapa', NULL, 'JAL', '哈拉帕', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7595, 'Mexico', NULL, 'Juarez', NULL, 'JUZ', '华雷斯', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7596, 'Mexico', NULL, 'Benito Juare', NULL, 'BJU', '华雷斯港', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7597, 'Mexico', NULL, 'Carmen', NULL, 'CAR', '卡门', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7598, 'Mexico', NULL, 'Colima', NULL, 'COL', '科利马', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7599, 'Mexico', NULL, 'Queretaro', NULL, 'QUE', '克雷塔罗', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7600, 'Mexico', NULL, 'Cuernavaca', NULL, 'CVC', '库埃纳瓦卡', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7601, 'Mexico', NULL, 'Culiacan', NULL, 'CUL', '库利阿坎', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7602, 'Mexico', NULL, 'Coatzacoalcos', NULL, 'COA', '夸察夸拉克斯', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7603, 'Mexico', NULL, 'La Paz', NULL, 'LAP', '拉巴斯', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7604, 'Mexico', NULL, 'Leon', NULL, 'LEN', '莱昂', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7605, 'Mexico', NULL, 'Reynosa', NULL, 'REX', '雷诺萨', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7606, 'Mexico', NULL, 'Los Mochis', NULL, 'LMM', '洛斯莫奇斯', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7607, 'Mexico', NULL, 'Mazatlan', NULL, 'MZT', '马萨特兰', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7608, 'Mexico', NULL, 'Matamoros', NULL, 'MAM', '马塔莫罗斯', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7609, 'Mexico', NULL, 'Merida', NULL, 'MID', '梅里达', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7610, 'Mexico', NULL, 'Monclova', NULL, 'LOV', '蒙克洛瓦', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7611, 'Mexico', NULL, 'Monterrey', NULL, 'MTY', '蒙特雷', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7612, 'Mexico', NULL, 'Morelia', NULL, 'MLM', '莫雷利亚', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7613, 'Mexico', NULL, 'Mexico City', NULL, 'MEX', '墨西哥城', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7614, 'Mexico', NULL, 'Mexicali', NULL, 'MXL', '墨西卡利', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7615, 'Mexico', NULL, 'Nogales', NULL, 'NOG', '诺加莱斯', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7616, 'Mexico', NULL, 'Pachuca', NULL, 'PAC', '帕丘卡', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7617, 'Mexico', NULL, 'Puebla', NULL, 'PUE', '普埃布拉', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7618, 'Mexico', NULL, 'Chilpancingo', NULL, 'CHI', '奇尔潘辛戈', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7619, 'Mexico', NULL, 'Chihuahua', NULL, 'CHH', '奇瓦瓦', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7620, 'Mexico', NULL, 'Cheturnal', NULL, 'CTM', '切图马尔', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7621, 'Mexico', NULL, 'Saltillo', NULL, 'SLW', '萨尔蒂约', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7622, 'Mexico', NULL, 'Zacatecas', NULL, 'ZAC', '萨卡特卡斯', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7623, 'Mexico', NULL, 'Celaya', NULL, 'CLY', '塞拉亚', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7624, 'Mexico', NULL, 'San Luis Potosi', NULL, 'SLP', '圣路易斯波托亚', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7625, 'Mexico', NULL, 'Tapachula', NULL, 'TAP', '塔帕丘拉', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7626, 'Mexico', NULL, 'Tampico', NULL, 'TAM', '坦皮科', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7627, 'Mexico', NULL, 'Tlaxcala', NULL, 'TLA', '特拉斯卡拉', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7628, 'Mexico', NULL, 'Tepic', NULL, 'TPQ', '特皮克', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7629, 'Mexico', NULL, 'Tehuacan', NULL, 'TCN', '特瓦坎', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7630, 'Mexico', NULL, 'Tuxtla Gutierrez', NULL, 'TGZ', '图斯特拉-古铁雷斯', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7631, 'Mexico', NULL, 'Torreon', NULL, 'TRC', '托雷翁', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7632, 'Mexico', NULL, 'Toluca', NULL, 'TLC', '托卢卡', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7633, 'Mexico', NULL, 'Oaxaca', NULL, 'OAX', '瓦哈卡', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7634, 'Mexico', NULL, 'Victoria', NULL, 'VIC', '维多利亚城', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7635, 'Mexico', NULL, 'Veracruz', NULL, 'VER', '韦拉克鲁斯', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7636, 'Mexico', NULL, 'Uruapan', NULL, 'UPN', '乌鲁阿潘', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7637, 'Mexico', NULL, 'Nuevo Laredo', NULL, 'NLE', '新拉雷多', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7638, 'Mexico', NULL, 'Irapuato', NULL, 'IRP', '伊拉普阿托', NULL, '墨西哥', 'MEX');
INSERT INTO `st_region_city` VALUES (7639, 'Namibia', NULL, 'Erongo', NULL, 'ER', '埃龙戈', NULL, '纳米比亚', 'NAM');
INSERT INTO `st_region_city` VALUES (7640, 'Namibia', NULL, 'Ohangwena', NULL, 'OW', '奥汉圭纳', NULL, '纳米比亚', 'NAM');
INSERT INTO `st_region_city` VALUES (7641, 'Namibia', NULL, 'Okavango', NULL, 'KV', '奥卡万戈', NULL, '纳米比亚', 'NAM');
INSERT INTO `st_region_city` VALUES (7642, 'Namibia', NULL, 'Omaheke', NULL, 'OK', '奥马赫科', NULL, '纳米比亚', 'NAM');
INSERT INTO `st_region_city` VALUES (7643, 'Namibia', NULL, 'Omusati', NULL, 'OT', '奥姆沙蒂', NULL, '纳米比亚', 'NAM');
INSERT INTO `st_region_city` VALUES (7644, 'Namibia', NULL, 'Otjozondjupa', NULL, 'OJ', '奥乔宗蒂约巴', NULL, '纳米比亚', 'NAM');
INSERT INTO `st_region_city` VALUES (7645, 'Namibia', NULL, 'Oshana', NULL, 'ON', '奥沙纳', NULL, '纳米比亚', 'NAM');
INSERT INTO `st_region_city` VALUES (7646, 'Namibia', NULL, 'Oshikoto', NULL, 'OO', '奥希科托', NULL, '纳米比亚', 'NAM');
INSERT INTO `st_region_city` VALUES (7647, 'Namibia', NULL, 'Hardap', NULL, 'HA', '哈达普', NULL, '纳米比亚', 'NAM');
INSERT INTO `st_region_city` VALUES (7648, 'Namibia', NULL, 'Khomas', NULL, 'KH', '霍马斯', NULL, '纳米比亚', 'NAM');
INSERT INTO `st_region_city` VALUES (7649, 'Namibia', NULL, 'Karas', NULL, 'KR', '卡拉斯', NULL, '纳米比亚', 'NAM');
INSERT INTO `st_region_city` VALUES (7650, 'Namibia', NULL, 'Caprivi', NULL, 'CA', '卡普里维', NULL, '纳米比亚', 'NAM');
INSERT INTO `st_region_city` VALUES (7651, 'Namibia', NULL, 'Kunene', NULL, 'KU', '库内内', NULL, '纳米比亚', 'NAM');
INSERT INTO `st_region_city` VALUES (7652, 'South Africa', NULL, 'Upington', NULL, 'UTN', '阿平顿', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7653, 'South Africa', NULL, 'Mount Ayliff', NULL, 'MAY', '艾利弗山', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7654, 'South Africa', NULL, 'Pietermaritzburg', NULL, 'PZB', '彼德马里茨堡', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7655, 'South Africa', NULL, 'Pietersburg', NULL, 'PTG', '彼德斯堡', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7656, 'South Africa', NULL, 'Pretoria', NULL, 'PRY', '比勒陀利亚', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7657, 'South Africa', NULL, 'Bisho', NULL, 'BIY', '比索', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7658, 'South Africa', NULL, 'Bredasdorp', NULL, 'BDD', '布雷达斯多普', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7659, 'South Africa', NULL, 'Bloemfontein', NULL, 'BFN', '布隆方丹', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7660, 'South Africa', NULL, 'Bronkhorstspruit', NULL, 'BHT', '布隆克斯特斯普利特', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7661, 'South Africa', NULL, 'De Aar', NULL, 'DAA', '德阿尔', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7662, 'South Africa', NULL, 'Durban', NULL, 'DUR', '德班', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7663, 'South Africa', NULL, 'Dundee', NULL, 'DUN', '邓迪', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7664, 'South Africa', NULL, 'Barkley East', NULL, 'BAE', '东巴克利', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7665, 'South Africa', NULL, 'East London', NULL, 'ELS', '东伦敦', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7666, 'South Africa', NULL, 'Vryburg', NULL, 'VRU', '弗雷堡', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7667, 'South Africa', NULL, 'Vereeniging', NULL, 'VGG', '弗里尼欣', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7668, 'South Africa', NULL, 'Groblersdal', NULL, 'GBD', '格罗布莱斯达尔', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7669, 'South Africa', NULL, 'Giyani', NULL, 'GIY', '基雅尼', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7670, 'South Africa', NULL, 'Kimberley', NULL, 'KIM', '金伯利', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7671, 'South Africa', NULL, 'Cape Town', NULL, 'CPT', '开普敦', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7672, 'South Africa', NULL, 'Klerksdorp', NULL, 'KXE', '克莱克斯多普', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7673, 'South Africa', NULL, 'Kuruman', NULL, 'KMH', '库鲁曼', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7674, 'South Africa', NULL, 'Queenstown', NULL, 'UTW', '昆士敦', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7675, 'South Africa', NULL, 'Ladysmith', NULL, 'LAY', '莱迪史密斯', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7676, 'South Africa', NULL, 'Randfontein', NULL, 'RFT', '兰德方丹', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7677, 'South Africa', NULL, 'Richards Bay', NULL, 'RCB', '理查兹湾', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7678, 'South Africa', NULL, 'Rustenburg', NULL, 'RSB', '利斯滕堡', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7679, 'South Africa', NULL, 'Middelburg', NULL, 'MDB', '米德尔堡', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7680, 'South Africa', NULL, 'Mkuze', NULL, 'MZQ', '姆库泽', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7681, 'South Africa', NULL, 'Moorreesburg', NULL, 'MOO', '穆里斯堡', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7682, 'South Africa', NULL, 'Nelspruit', NULL, 'NLP', '内尔斯普雷特', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7683, 'South Africa', NULL, 'Nylstroom', NULL, 'NYL', '尼尔斯特隆', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7684, 'South Africa', NULL, 'Newcastle', NULL, 'NCS', '纽卡斯尔', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7685, 'South Africa', NULL, 'George', NULL, 'GRJ', '乔治', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7686, 'South Africa', NULL, 'Sasolburg', NULL, 'SAS', '萨索尔堡', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7687, 'South Africa', NULL, 'Secunda', NULL, 'ZEC', '瑟孔达', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7688, 'South Africa', NULL, 'Ixopo', NULL, 'IXO', '特克索波', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7689, 'South Africa', NULL, 'Trompsburg', NULL, 'TPB', '特隆普斯堡', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7690, 'South Africa', NULL, 'Springbok', NULL, 'SBU', '跳羚', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7691, 'South Africa', NULL, 'Thulamahashe', NULL, 'TLH', '图拉马哈谢', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7692, 'South Africa', NULL, 'Thohoyandou', NULL, 'THY', '托霍延杜', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7693, 'South Africa', NULL, 'Witsieshoek', NULL, 'WSH', '韦茨肖克', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7694, 'South Africa', NULL, 'Welkom', NULL, 'WEL', '韦尔科姆', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7695, 'South Africa', NULL, 'Ulundi', NULL, 'ULD', '乌伦迪', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7696, 'South Africa', NULL, 'Umtata', NULL, 'UTT', '乌姆塔塔', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7697, 'South Africa', NULL, 'Worcester', NULL, 'WOR', '伍斯特', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7698, 'South Africa', NULL, 'Beaufort West', NULL, 'BEW', '西博福特', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7699, 'South Africa', NULL, 'Port Shepstone', NULL, 'PSS', '谢普斯通港', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7700, 'South Africa', NULL, 'Port Elizabeth', NULL, 'PLZ', '伊丽莎白港', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7701, 'South Africa', NULL, 'Johannesburg', NULL, 'JNB', '约翰内斯堡', NULL, '南非', 'ZAF');
INSERT INTO `st_region_city` VALUES (7702, 'Nepal', NULL, 'Bagmati', NULL, 'BA', '巴格马蒂', NULL, '尼泊尔', 'NPL');
INSERT INTO `st_region_city` VALUES (7703, 'Nepal', NULL, 'Dhawalagiri', NULL, 'DH', '道拉吉里', NULL, '尼泊尔', 'NPL');
INSERT INTO `st_region_city` VALUES (7704, 'Nepal', NULL, 'Gandaki', NULL, 'GA', '甘达基', NULL, '尼泊尔', 'NPL');
INSERT INTO `st_region_city` VALUES (7705, 'Nepal', NULL, 'Kosi', NULL, 'KO', '戈西', NULL, '尼泊尔', 'NPL');
INSERT INTO `st_region_city` VALUES (7706, 'Nepal', NULL, 'Karnali', NULL, 'KA', '格尔纳利', NULL, '尼泊尔', 'NPL');
INSERT INTO `st_region_city` VALUES (7707, 'Nepal', NULL, 'Janakpur', NULL, 'JA', '贾纳克布尔', NULL, '尼泊尔', 'NPL');
INSERT INTO `st_region_city` VALUES (7708, 'Nepal', NULL, 'Rapti', NULL, 'RA', '拉布蒂', NULL, '尼泊尔', 'NPL');
INSERT INTO `st_region_city` VALUES (7709, 'Nepal', NULL, 'Lumbini', NULL, 'LU', '蓝毗尼', NULL, '尼泊尔', 'NPL');
INSERT INTO `st_region_city` VALUES (7710, 'Nepal', NULL, 'Mahakali', NULL, 'MA', '马哈卡利', NULL, '尼泊尔', 'NPL');
INSERT INTO `st_region_city` VALUES (7711, 'Nepal', NULL, 'Mechi', NULL, 'ME', '梅吉', NULL, '尼泊尔', 'NPL');
INSERT INTO `st_region_city` VALUES (7712, 'Nepal', NULL, 'Narayani', NULL, 'NA', '纳拉亚尼', NULL, '尼泊尔', 'NPL');
INSERT INTO `st_region_city` VALUES (7713, 'Nepal', NULL, 'Bheri', NULL, 'BH', '佩里', NULL, '尼泊尔', 'NPL');
INSERT INTO `st_region_city` VALUES (7714, 'Nepal', NULL, 'Sogarmatha', NULL, 'SA', '萨加玛塔', NULL, '尼泊尔', 'NPL');
INSERT INTO `st_region_city` VALUES (7715, 'Nepal', NULL, 'Seti', NULL, 'SE', '塞蒂', NULL, '尼泊尔', 'NPL');
INSERT INTO `st_region_city` VALUES (7716, 'Nicaragua', NULL, 'Esteli', NULL, 'ES', '埃斯特利', NULL, '尼加拉瓜', 'NIC');
INSERT INTO `st_region_city` VALUES (7717, 'Nicaragua', NULL, 'Atlantico Norte', NULL, 'AN', '北大西洋', NULL, '尼加拉瓜', 'NIC');
INSERT INTO `st_region_city` VALUES (7718, 'Nicaragua', NULL, 'Boaco', NULL, 'BO', '博阿科', NULL, '尼加拉瓜', 'NIC');
INSERT INTO `st_region_city` VALUES (7719, 'Nicaragua', NULL, 'Granada', NULL, 'GR', '格拉纳达', NULL, '尼加拉瓜', 'NIC');
INSERT INTO `st_region_city` VALUES (7720, 'Nicaragua', NULL, 'Carazo', NULL, 'CA', '卡拉索', NULL, '尼加拉瓜', 'NIC');
INSERT INTO `st_region_city` VALUES (7721, 'Nicaragua', NULL, 'Leon', NULL, 'LE', '莱昂', NULL, '尼加拉瓜', 'NIC');
INSERT INTO `st_region_city` VALUES (7722, 'Nicaragua', NULL, 'Rivas', NULL, 'RV', '里瓦斯', NULL, '尼加拉瓜', 'NIC');
INSERT INTO `st_region_city` VALUES (7723, 'Nicaragua', NULL, 'Madriz', NULL, 'MD', '马德里斯', NULL, '尼加拉瓜', 'NIC');
INSERT INTO `st_region_city` VALUES (7724, 'Nicaragua', NULL, 'Managua', NULL, 'MN', '马那瓜', NULL, '尼加拉瓜', 'NIC');
INSERT INTO `st_region_city` VALUES (7725, 'Nicaragua', NULL, 'Masaya', NULL, 'MS', '马萨亚', NULL, '尼加拉瓜', 'NIC');
INSERT INTO `st_region_city` VALUES (7726, 'Nicaragua', NULL, 'Matagalpa', NULL, 'MT', '马塔加尔帕', NULL, '尼加拉瓜', 'NIC');
INSERT INTO `st_region_city` VALUES (7727, 'Nicaragua', NULL, 'Atlantico Sur', NULL, 'AS', '南大西洋', NULL, '尼加拉瓜', 'NIC');
INSERT INTO `st_region_city` VALUES (7728, 'Nicaragua', NULL, 'Chinandega', NULL, 'CD', '奇南德加', NULL, '尼加拉瓜', 'NIC');
INSERT INTO `st_region_city` VALUES (7729, 'Nicaragua', NULL, 'Chontales', NULL, 'CT', '琼塔莱斯', NULL, '尼加拉瓜', 'NIC');
INSERT INTO `st_region_city` VALUES (7730, 'Nicaragua', NULL, 'Rio San Juan', NULL, 'SJ', '圣胡安河', NULL, '尼加拉瓜', 'NIC');
INSERT INTO `st_region_city` VALUES (7731, 'Nicaragua', NULL, 'Jinotega', NULL, 'JI', '希诺特加', NULL, '尼加拉瓜', 'NIC');
INSERT INTO `st_region_city` VALUES (7732, 'Nicaragua', NULL, 'Nueva Segovia', NULL, 'NS', '新塞哥维亚', NULL, '尼加拉瓜', 'NIC');
INSERT INTO `st_region_city` VALUES (7733, 'Niger', NULL, 'Agadez', NULL, 'AJY', '阿加德兹', NULL, '尼日尔', 'NER');
INSERT INTO `st_region_city` VALUES (7734, 'Niger', NULL, 'Diffa', NULL, 'DIF', '迪法', NULL, '尼日尔', 'NER');
INSERT INTO `st_region_city` VALUES (7735, 'Niger', NULL, 'Tillaberi', NULL, 'TIL', '蒂拉贝里', NULL, '尼日尔', 'NER');
INSERT INTO `st_region_city` VALUES (7736, 'Niger', NULL, 'Dosso', NULL, 'DSS', '多索', NULL, '尼日尔', 'NER');
INSERT INTO `st_region_city` VALUES (7737, 'Niger', NULL, 'Zinder', NULL, 'ZND', '津德尔', NULL, '尼日尔', 'NER');
INSERT INTO `st_region_city` VALUES (7738, 'Niger', NULL, 'Maradi', NULL, 'MFQ', '马拉迪', NULL, '尼日尔', 'NER');
INSERT INTO `st_region_city` VALUES (7739, 'Niger', NULL, 'Niamey C.U.', NULL, 'NIM', '尼亚美市', NULL, '尼日尔', 'NER');
INSERT INTO `st_region_city` VALUES (7740, 'Niger', NULL, 'Tahoua', NULL, 'THZ', '塔瓦', NULL, '尼日尔', 'NER');
INSERT INTO `st_region_city` VALUES (7741, 'Nigeria', NULL, 'Abuja', NULL, 'ABV', '阿比亚', NULL, '尼日利亚', 'NGA');
INSERT INTO `st_region_city` VALUES (7742, 'Nigeria', NULL, 'Ogbomosho', NULL, 'OGB', '奥博莫绍', NULL, '尼日利亚', 'NGA');
INSERT INTO `st_region_city` VALUES (7743, 'Nigeria', NULL, 'Kano', NULL, 'KAN', '卡诺', NULL, '尼日利亚', 'NGA');
INSERT INTO `st_region_city` VALUES (7744, 'Nigeria', NULL, 'Lagos', NULL, 'LOS', '拉各斯', NULL, '尼日利亚', 'NGA');
INSERT INTO `st_region_city` VALUES (7745, 'Nigeria', NULL, 'Ibadan', NULL, 'IBA', '伊巴丹', NULL, '尼日利亚', 'NGA');
INSERT INTO `st_region_city` VALUES (7746, 'Norway', NULL, 'Akershus', NULL, '2', '阿克什胡斯', NULL, '挪威', 'NOR');
INSERT INTO `st_region_city` VALUES (7747, 'Norway', NULL, 'Oppland', NULL, '5', '奥普兰', NULL, '挪威', 'NOR');
INSERT INTO `st_region_city` VALUES (7748, 'Norway', NULL, 'Oslo', NULL, '3', '奥斯陆市', NULL, '挪威', 'NOR');
INSERT INTO `st_region_city` VALUES (7749, 'Norway', NULL, 'Nord-Trondelag', NULL, '17', '北特伦德拉格', NULL, '挪威', 'NOR');
INSERT INTO `st_region_city` VALUES (7750, 'Norway', NULL, 'Buskerud', NULL, '6', '布斯克吕', NULL, '挪威', 'NOR');
INSERT INTO `st_region_city` VALUES (7751, 'Norway', NULL, 'Aust-Agder', NULL, '9', '东阿格德尔', NULL, '挪威', 'NOR');
INSERT INTO `st_region_city` VALUES (7752, 'Norway', NULL, 'Ostfold', NULL, '1', '东福尔', NULL, '挪威', 'NOR');
INSERT INTO `st_region_city` VALUES (7753, 'Norway', NULL, 'Finnmark', NULL, '20', '芬马克', NULL, '挪威', 'NOR');
INSERT INTO `st_region_city` VALUES (7754, 'Norway', NULL, 'Hedmark', NULL, '4', '海德马克', NULL, '挪威', 'NOR');
INSERT INTO `st_region_city` VALUES (7755, 'Norway', NULL, 'Hordaland', NULL, '12', '霍达兰', NULL, '挪威', 'NOR');
INSERT INTO `st_region_city` VALUES (7756, 'Norway', NULL, 'Rogaland', NULL, '11', '罗加兰', NULL, '挪威', 'NOR');
INSERT INTO `st_region_city` VALUES (7757, 'Norway', NULL, 'More og Romsdal', NULL, '15', '默勒－鲁姆斯达尔', NULL, '挪威', 'NOR');
INSERT INTO `st_region_city` VALUES (7758, 'Norway', NULL, 'Sor-Trondelag', NULL, '16', '南特伦德拉格', NULL, '挪威', 'NOR');
INSERT INTO `st_region_city` VALUES (7759, 'Norway', NULL, 'Nordland', NULL, '18', '诺尔兰', NULL, '挪威', 'NOR');
INSERT INTO `st_region_city` VALUES (7760, 'Norway', NULL, 'Sogn og Fjordane', NULL, '14', '松恩－菲尤拉讷', NULL, '挪威', 'NOR');
INSERT INTO `st_region_city` VALUES (7761, 'Norway', NULL, 'Telemark', NULL, '8', '泰勒马克', NULL, '挪威', 'NOR');
INSERT INTO `st_region_city` VALUES (7762, 'Norway', NULL, 'Troms', NULL, '19', '特罗姆斯', NULL, '挪威', 'NOR');
INSERT INTO `st_region_city` VALUES (7763, 'Norway', NULL, 'Vest-Agder', NULL, '10', '西阿格德尔', NULL, '挪威', 'NOR');
INSERT INTO `st_region_city` VALUES (7764, 'Norway', NULL, 'Vestfold', NULL, '7', '西福尔', NULL, '挪威', 'NOR');
INSERT INTO `st_region_city` VALUES (7765, 'Portugal', NULL, 'Alentejo Litoral', NULL, 'ALL', '滨海阿连特茹', NULL, '葡萄牙', 'PRT');
INSERT INTO `st_region_city` VALUES (7766, 'Portugal', NULL, 'Pinhal Litoral', NULL, 'PLT', '滨海皮尼亚尔', NULL, '葡萄牙', 'PRT');
INSERT INTO `st_region_city` VALUES (7767, 'Portugal', NULL, 'Porto', NULL, 'VDP', '波尔图', NULL, '葡萄牙', 'PRT');
INSERT INTO `st_region_city` VALUES (7768, 'Portugal', NULL, 'Douro', NULL, 'MDR', '杜罗', NULL, '葡萄牙', 'PRT');
INSERT INTO `st_region_city` VALUES (7769, 'Portugal', NULL, 'Entre Douro e Vouga', NULL, 'EDV', '恩特拉杜罗伏日', NULL, '葡萄牙', 'PRT');
INSERT INTO `st_region_city` VALUES (7770, 'Portugal', NULL, 'Faro', NULL, 'FAO', '法鲁', NULL, '葡萄牙', 'PRT');
INSERT INTO `st_region_city` VALUES (7771, 'Portugal', NULL, 'Funchal', NULL, 'FUN', '丰沙尔', NULL, '葡萄牙', 'PRT');
INSERT INTO `st_region_city` VALUES (7772, 'Portugal', NULL, 'Cavado', NULL, 'CAV', '卡瓦多', NULL, '葡萄牙', 'PRT');
INSERT INTO `st_region_city` VALUES (7773, 'Portugal', NULL, 'Cova da Beira', NULL, 'CLB', '科瓦贝拉', NULL, '葡萄牙', 'PRT');
INSERT INTO `st_region_city` VALUES (7774, 'Portugal', NULL, 'Lisboa', NULL, 'LIS', '里斯本', NULL, '葡萄牙', 'PRT');
INSERT INTO `st_region_city` VALUES (7775, 'Portugal', NULL, 'Leziria do Tejo', NULL, 'LTE', '利巴特茹', NULL, '葡萄牙', 'PRT');
INSERT INTO `st_region_city` VALUES (7776, 'Portugal', NULL, 'Medio Tejo', NULL, 'MTE', '梅地奥特茹', NULL, '葡萄牙', 'PRT');
INSERT INTO `st_region_city` VALUES (7777, 'Portugal', NULL, 'Minho-Lima', NULL, 'MLI', '米尼奥-利马', NULL, '葡萄牙', 'PRT');
INSERT INTO `st_region_city` VALUES (7778, 'Portugal', NULL, 'Beira Interior Norte', NULL, 'BIN', '内贝拉北', NULL, '葡萄牙', 'PRT');
INSERT INTO `st_region_city` VALUES (7779, 'Portugal', NULL, 'Beira Interior Sul', NULL, 'BIS', '内贝拉南', NULL, '葡萄牙', 'PRT');
INSERT INTO `st_region_city` VALUES (7780, 'Portugal', NULL, 'Pinhal Interior Norte', NULL, 'PIN', '内皮尼亚尔北', NULL, '葡萄牙', 'PRT');
INSERT INTO `st_region_city` VALUES (7781, 'Portugal', NULL, 'Pinhal Interior Sul', NULL, 'PIS', '内皮尼亚尔南', NULL, '葡萄牙', 'PRT');
INSERT INTO `st_region_city` VALUES (7782, 'Portugal', NULL, 'Ponta Delgada', NULL, 'PDL', '蓬塔德尔加达', NULL, '葡萄牙', 'PRT');
INSERT INTO `st_region_city` VALUES (7783, 'Portugal', NULL, 'Peninsula de Setubal', NULL, 'PSE', '塞图巴尔半岛', NULL, '葡萄牙', 'PRT');
INSERT INTO `st_region_city` VALUES (7784, 'Portugal', NULL, 'Serra da Estrela', NULL, 'SES', '山后', NULL, '葡萄牙', 'PRT');
INSERT INTO `st_region_city` VALUES (7785, 'Portugal', NULL, 'Alto Alentejo', NULL, 'AAT', '上阿连特茹', NULL, '葡萄牙', 'PRT');
INSERT INTO `st_region_city` VALUES (7786, 'Portugal', NULL, 'Alto Tros-os-Montes', NULL, 'ATM', '上特拉斯山', NULL, '葡萄牙', 'PRT');
INSERT INTO `st_region_city` VALUES (7787, 'Portugal', NULL, 'Tamega', NULL, 'TAM', '塔梅加', NULL, '葡萄牙', 'PRT');
INSERT INTO `st_region_city` VALUES (7788, 'Portugal', NULL, 'Ave', NULL, 'AES', '万福', NULL, '葡萄牙', 'PRT');
INSERT INTO `st_region_city` VALUES (7789, 'Portugal', NULL, 'Oeste', NULL, 'OES', '西部', NULL, '葡萄牙', 'PRT');
INSERT INTO `st_region_city` VALUES (7790, 'Portugal', NULL, 'Baixo Alentejo', NULL, 'BAL', '下阿连特茹', NULL, '葡萄牙', 'PRT');
INSERT INTO `st_region_city` VALUES (7791, 'Portugal', NULL, 'Baixo Vouga', NULL, 'BVO', '下伏日', NULL, '葡萄牙', 'PRT');
INSERT INTO `st_region_city` VALUES (7792, 'Portugal', NULL, 'Baixo Mondego', NULL, 'BMO', '下蒙德古', NULL, '葡萄牙', 'PRT');
INSERT INTO `st_region_city` VALUES (7793, 'Portugal', NULL, 'Alentejo Central', NULL, 'ALC', '中阿连特茹', NULL, '葡萄牙', 'PRT');
INSERT INTO `st_region_city` VALUES (7794, 'Japan', NULL, 'Ehime', NULL, '38', '爱媛', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7795, 'Japan', NULL, 'Aichi', NULL, '23', '爱知', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7796, 'Japan', NULL, 'Hokkaido', NULL, '1', '北海道', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7797, 'Japan', NULL, 'Hyogo', NULL, '28', '兵库', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7798, 'Japan', NULL, 'Okinawa', NULL, '47', '冲绳', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7799, 'Japan', NULL, 'Ibaraki', NULL, '8', '茨城', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7800, 'Japan', NULL, 'Osaka', NULL, '27', '大阪', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7801, 'Japan', NULL, 'Oita', NULL, '44', '大分', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7802, 'Japan', NULL, 'Shimane', NULL, '32', '岛根', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7803, 'Japan', NULL, 'Tokushima', NULL, '36', '徳岛', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7804, 'Japan', NULL, 'Tokyo', NULL, '13', '东京', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7805, 'Japan', NULL, 'Fukushima', NULL, '7', '福岛', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7806, 'Japan', NULL, 'Fukuoka', NULL, '40', '福冈', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7807, 'Japan', NULL, 'Fukui', NULL, '18', '福井', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7808, 'Japan', NULL, 'Toyama', NULL, '16', '富山', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7809, 'Japan', NULL, 'Okayama', NULL, '33', '冈山', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7810, 'Japan', NULL, 'Kochi', NULL, '39', '高知', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7811, 'Japan', NULL, 'Miyagi', NULL, '4', '宮城', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7812, 'Japan', NULL, 'Miyazaki', NULL, '45', '宫崎', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7813, 'Japan', NULL, 'Hiroshima', NULL, '34', '广岛', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7814, 'Japan', NULL, 'Wakayama', NULL, '30', '和歌山', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7815, 'Japan', NULL, 'Kyoto', NULL, '26', '京都', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7816, 'Japan', NULL, 'Shizuoka', NULL, '22', '静冈', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7817, 'Japan', NULL, 'Tochigi', NULL, '9', '枥木', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7818, 'Japan', NULL, 'Kagoshima', NULL, '46', '鹿儿岛', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7819, 'Japan', NULL, 'Nara', NULL, '29', '奈良', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7820, 'Japan', NULL, 'Tottori', NULL, '31', '鸟取', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7821, 'Japan', NULL, 'Gifu', NULL, '21', '岐阜', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7822, 'Japan', NULL, 'Saitama', NULL, '11', '埼玉', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7823, 'Japan', NULL, 'Chiba', NULL, '12', '千叶', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7824, 'Japan', NULL, 'Aomori', NULL, '2', '青森', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7825, 'Japan', NULL, 'Akita', NULL, '5', '秋田', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7826, 'Japan', NULL, 'Gunma', NULL, '10', '群马', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7827, 'Japan', NULL, 'Mie', NULL, '24', '三重', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7828, 'Japan', NULL, 'Yamaguchi', NULL, '35', '山口', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7829, 'Japan', NULL, 'Yamanashi', NULL, '19', '山梨', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7830, 'Japan', NULL, 'Yamagata', NULL, '6', '山形', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7831, 'Japan', NULL, 'Kanagawa', NULL, '14', '神奈川', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7832, 'Japan', NULL, 'Ishikawa', NULL, '17', '石川', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7833, 'Japan', NULL, 'Kagawa', NULL, '37', '香川', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7834, 'Japan', NULL, 'Niigata', NULL, '15', '新潟', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7835, 'Japan', NULL, 'Kumamoto', NULL, '43', '熊本', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7836, 'Japan', NULL, 'Iwate', NULL, '3', '岩手', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7837, 'Japan', NULL, 'Nagasaki', NULL, '42', '长崎', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7838, 'Japan', NULL, 'Nagano', NULL, '20', '长野', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7839, 'Japan', NULL, 'Shiga', NULL, '25', '滋贺', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7840, 'Japan', NULL, 'Saga', NULL, '41', '佐贺', NULL, '日本', 'JPN');
INSERT INTO `st_region_city` VALUES (7841, 'Sweden', NULL, 'Norrbottens', NULL, 'BD', '北博滕', NULL, '瑞典', 'SWE');
INSERT INTO `st_region_city` VALUES (7842, 'Sweden', NULL, 'Blekinge', NULL, 'K', '布莱金厄', NULL, '瑞典', 'SWE');
INSERT INTO `st_region_city` VALUES (7843, 'Sweden', NULL, 'Dalarnas', NULL, 'DLN', '达拉纳', NULL, '瑞典', 'SWE');
INSERT INTO `st_region_city` VALUES (7844, 'Sweden', NULL, 'Ustergotland', NULL, 'UGL', '东约特兰', NULL, '瑞典', 'SWE');
INSERT INTO `st_region_city` VALUES (7845, 'Sweden', NULL, 'Orebro', NULL, 'T', '厄勒布鲁', NULL, '瑞典', 'SWE');
INSERT INTO `st_region_city` VALUES (7846, 'Sweden', NULL, 'Gotlands', NULL, 'I', '哥得兰', NULL, '瑞典', 'SWE');
INSERT INTO `st_region_city` VALUES (7847, 'Sweden', NULL, 'Hallands', NULL, 'N', '哈兰', NULL, '瑞典', 'SWE');
INSERT INTO `st_region_city` VALUES (7848, 'Sweden', NULL, 'Kalmar', NULL, 'H', '卡尔马', NULL, '瑞典', 'SWE');
INSERT INTO `st_region_city` VALUES (7849, 'Sweden', NULL, 'Kronobergs', NULL, 'G', '克鲁努贝里', NULL, '瑞典', 'SWE');
INSERT INTO `st_region_city` VALUES (7850, 'Sweden', NULL, 'Sodermanlands', NULL, 'D', '南曼兰', NULL, '瑞典', 'SWE');
INSERT INTO `st_region_city` VALUES (7851, 'Sweden', NULL, 'Stockholms', NULL, 'AB', '斯德哥尔摩', NULL, '瑞典', 'SWE');
INSERT INTO `st_region_city` VALUES (7852, 'Sweden', NULL, 'Skane', NULL, 'M', '斯科耐', NULL, '瑞典', 'SWE');
INSERT INTO `st_region_city` VALUES (7853, 'Sweden', NULL, 'Varmlands', NULL, 'S', '韦姆兰', NULL, '瑞典', 'SWE');
INSERT INTO `st_region_city` VALUES (7854, 'Sweden', NULL, 'Uppsala', NULL, 'C', '乌普萨拉', NULL, '瑞典', 'SWE');
INSERT INTO `st_region_city` VALUES (7855, 'Sweden', NULL, 'Vasterbottens', NULL, 'AC', '西博滕', NULL, '瑞典', 'SWE');
INSERT INTO `st_region_city` VALUES (7856, 'Sweden', NULL, 'Vastmanlands', NULL, 'U', '西曼兰', NULL, '瑞典', 'SWE');
INSERT INTO `st_region_city` VALUES (7857, 'Sweden', NULL, 'Vasternorrlands', NULL, 'Y', '西诺尔兰', NULL, '瑞典', 'SWE');
INSERT INTO `st_region_city` VALUES (7858, 'Sweden', NULL, 'Vastra Gotalands', NULL, 'O', '西约特兰', NULL, '瑞典', 'SWE');
INSERT INTO `st_region_city` VALUES (7859, 'Sweden', NULL, 'Jonkopings', NULL, 'F', '延雪平', NULL, '瑞典', 'SWE');
INSERT INTO `st_region_city` VALUES (7860, 'Sweden', NULL, 'Gavleborgs', NULL, 'X', '耶夫勒堡', NULL, '瑞典', 'SWE');
INSERT INTO `st_region_city` VALUES (7861, 'Sweden', NULL, 'Jamtlands', NULL, 'Z', '耶姆特兰', NULL, '瑞典', 'SWE');
INSERT INTO `st_region_city` VALUES (7862, 'Switzerland', NULL, 'Aargau', NULL, 'AG', '阿尔高', NULL, '瑞士', 'CHE');
INSERT INTO `st_region_city` VALUES (7863, 'Switzerland', NULL, 'Basel－Sstadt', NULL, 'BS', '巴塞尔城市', NULL, '瑞士', 'CHE');
INSERT INTO `st_region_city` VALUES (7864, 'Switzerland', NULL, 'Basel Landschaft', NULL, 'BL', '巴塞尔乡村', NULL, '瑞士', 'CHE');
INSERT INTO `st_region_city` VALUES (7865, 'Switzerland', NULL, 'Bern', NULL, 'BE', '伯尔尼', NULL, '瑞士', 'CHE');
INSERT INTO `st_region_city` VALUES (7866, 'Switzerland', NULL, 'Zug', NULL, 'ZG', '楚格', NULL, '瑞士', 'CHE');
INSERT INTO `st_region_city` VALUES (7867, 'Switzerland', NULL, 'Freiburg', NULL, 'FR', '弗里堡', NULL, '瑞士', 'CHE');
INSERT INTO `st_region_city` VALUES (7868, 'Switzerland', NULL, 'Glarus', NULL, 'GL', '格拉鲁斯', NULL, '瑞士', 'CHE');
INSERT INTO `st_region_city` VALUES (7869, 'Switzerland', NULL, 'Graubünden', NULL, 'GR', '格劳宾登', NULL, '瑞士', 'CHE');
INSERT INTO `st_region_city` VALUES (7870, 'Switzerland', NULL, 'Luzern', NULL, 'LU', '卢塞恩', NULL, '瑞士', 'CHE');
INSERT INTO `st_region_city` VALUES (7871, 'Switzerland', NULL, 'Lausanne', NULL, 'LA', '洛桑', NULL, '瑞士', 'CHE');
INSERT INTO `st_region_city` VALUES (7872, 'Switzerland', NULL, 'Neuchatel', NULL, 'NE', '纳沙泰尔', NULL, '瑞士', 'CHE');
INSERT INTO `st_region_city` VALUES (7873, 'Switzerland', NULL, 'Appenzell Innerrhodn', NULL, 'AI', '内阿彭策尔', NULL, '瑞士', 'CHE');
INSERT INTO `st_region_city` VALUES (7874, 'Switzerland', NULL, 'Geneve', NULL, 'GE', '日内瓦', NULL, '瑞士', 'CHE');
INSERT INTO `st_region_city` VALUES (7875, 'Switzerland', NULL, 'Jura', NULL, 'JU', '汝拉', NULL, '瑞士', 'CHE');
INSERT INTO `st_region_city` VALUES (7876, 'Switzerland', NULL, 'Schaffhausen', NULL, 'SH', '沙夫豪森', NULL, '瑞士', 'CHE');
INSERT INTO `st_region_city` VALUES (7877, 'Switzerland', NULL, 'Obwalden', NULL, 'OW', '上瓦尔登', NULL, '瑞士', 'CHE');
INSERT INTO `st_region_city` VALUES (7878, 'Switzerland', NULL, 'St.Gallen', NULL, 'SG', '圣加仑', NULL, '瑞士', 'CHE');
INSERT INTO `st_region_city` VALUES (7879, 'Switzerland', NULL, 'Schwyz', NULL, 'SZ', '施维茨', NULL, '瑞士', 'CHE');
INSERT INTO `st_region_city` VALUES (7880, 'Switzerland', NULL, 'Zurich', NULL, 'ZH', '苏黎世', NULL, '瑞士', 'CHE');
INSERT INTO `st_region_city` VALUES (7881, 'Switzerland', NULL, 'Solothurn', NULL, 'SO', '索洛图恩', NULL, '瑞士', 'CHE');
INSERT INTO `st_region_city` VALUES (7882, 'Switzerland', NULL, 'Ticino', NULL, 'TI', '提契诺', NULL, '瑞士', 'CHE');
INSERT INTO `st_region_city` VALUES (7883, 'Switzerland', NULL, 'Thurgau', NULL, 'TG', '图尔高', NULL, '瑞士', 'CHE');
INSERT INTO `st_region_city` VALUES (7884, 'Switzerland', NULL, 'Wallis', NULL, 'VS', '瓦莱', NULL, '瑞士', 'CHE');
INSERT INTO `st_region_city` VALUES (7885, 'Switzerland', NULL, 'Appenzell Ausserrhon', NULL, 'AR', '外阿彭策尔', NULL, '瑞士', 'CHE');
INSERT INTO `st_region_city` VALUES (7886, 'Switzerland', NULL, 'Vaud', NULL, 'VD', '沃', NULL, '瑞士', 'CHE');
INSERT INTO `st_region_city` VALUES (7887, 'Switzerland', NULL, 'Uri', NULL, 'UR', '乌里', NULL, '瑞士', 'CHE');
INSERT INTO `st_region_city` VALUES (7888, 'Switzerland', NULL, 'Nidwalden', NULL, 'NW', '下瓦尔登', NULL, '瑞士', 'CHE');
INSERT INTO `st_region_city` VALUES (7889, 'El Salvador', NULL, 'Apopa', NULL, 'APO', '阿波帕', NULL, '萨尔瓦多', 'SLV');
INSERT INTO `st_region_city` VALUES (7890, 'El Salvador', NULL, 'Ahuachapan', NULL, 'AH', '阿瓦查潘', NULL, '萨尔瓦多', 'SLV');
INSERT INTO `st_region_city` VALUES (7891, 'El Salvador', NULL, 'Litoral', NULL, 'LI', '滨海', NULL, '萨尔瓦多', 'SLV');
INSERT INTO `st_region_city` VALUES (7892, 'El Salvador', NULL, 'Chalatenango', NULL, 'CH', '查拉特南戈', NULL, '萨尔瓦多', 'SLV');
INSERT INTO `st_region_city` VALUES (7893, 'El Salvador', NULL, 'Delgado', NULL, 'DE', '德尔加多', NULL, '萨尔瓦多', 'SLV');
INSERT INTO `st_region_city` VALUES (7894, 'El Salvador', NULL, 'Kie-Ntem', NULL, 'KN', '基埃-恩特姆', NULL, '萨尔瓦多', 'SLV');
INSERT INTO `st_region_city` VALUES (7895, 'El Salvador', NULL, 'Cabanas', NULL, 'CA', '卡瓦尼亚斯', NULL, '萨尔瓦多', 'SLV');
INSERT INTO `st_region_city` VALUES (7896, 'El Salvador', NULL, 'Cuscatlan', NULL, 'CU', '库斯卡特兰', NULL, '萨尔瓦多', 'SLV');
INSERT INTO `st_region_city` VALUES (7897, 'El Salvador', NULL, 'La Paz', NULL, 'PZ', '拉巴斯', NULL, '萨尔瓦多', 'SLV');
INSERT INTO `st_region_city` VALUES (7898, 'El Salvador', NULL, 'La Libertad', NULL, 'LB', '拉利伯塔德', NULL, '萨尔瓦多', 'SLV');
INSERT INTO `st_region_city` VALUES (7899, 'El Salvador', NULL, 'La Union', NULL, 'UN', '拉乌尼翁', NULL, '萨尔瓦多', 'SLV');
INSERT INTO `st_region_city` VALUES (7900, 'El Salvador', NULL, 'Mejicanos', NULL, 'MEJ', '梅基卡诺斯', NULL, '萨尔瓦多', 'SLV');
INSERT INTO `st_region_city` VALUES (7901, 'El Salvador', NULL, 'Morazan', NULL, 'MO', '莫拉桑', NULL, '萨尔瓦多', 'SLV');
INSERT INTO `st_region_city` VALUES (7902, 'El Salvador', NULL, 'Santa Ana', NULL, 'SA', '圣安娜', NULL, '萨尔瓦多', 'SLV');
INSERT INTO `st_region_city` VALUES (7903, 'El Salvador', NULL, 'San Miguel', NULL, 'SM', '圣米格尔', NULL, '萨尔瓦多', 'SLV');
INSERT INTO `st_region_city` VALUES (7904, 'El Salvador', NULL, 'San Salvador', NULL, 'SS', '圣萨尔瓦多', NULL, '萨尔瓦多', 'SLV');
INSERT INTO `st_region_city` VALUES (7905, 'El Salvador', NULL, 'San Vicente', NULL, 'SV', '圣维森特', NULL, '萨尔瓦多', 'SLV');
INSERT INTO `st_region_city` VALUES (7906, 'El Salvador', NULL, 'Sonsonate', NULL, 'SO', '松索纳特', NULL, '萨尔瓦多', 'SLV');
INSERT INTO `st_region_city` VALUES (7907, 'El Salvador', NULL, 'Soyapango', NULL, 'SOY', '索亚潘戈', NULL, '萨尔瓦多', 'SLV');
INSERT INTO `st_region_city` VALUES (7908, 'El Salvador', NULL, 'Wele-Nzas', NULL, 'WN', '韦莱-恩萨斯', NULL, '萨尔瓦多', 'SLV');
INSERT INTO `st_region_city` VALUES (7909, 'El Salvador', NULL, 'Usulutan', NULL, 'US', '乌苏卢坦', NULL, '萨尔瓦多', 'SLV');
INSERT INTO `st_region_city` VALUES (7910, 'El Salvador', NULL, 'Ilopango', NULL, 'IL', '伊洛潘戈', NULL, '萨尔瓦多', 'SLV');
INSERT INTO `st_region_city` VALUES (7911, 'El Salvador', NULL, 'Centro Sur', NULL, 'CS', '中南', NULL, '萨尔瓦多', 'SLV');
INSERT INTO `st_region_city` VALUES (7912, 'Serbia,Montenegro', NULL, 'Beograd', NULL, 'BEG', '贝尔格莱德', NULL, '塞尔维亚,黑山', 'SCG');
INSERT INTO `st_region_city` VALUES (7913, 'Serbia,Montenegro', NULL, 'Podgorica', NULL, 'POD', '波德戈里察', NULL, '塞尔维亚,黑山', 'SCG');
INSERT INTO `st_region_city` VALUES (7914, 'Serbia,Montenegro', NULL, 'Kragujevac', NULL, 'KGV', '克拉古涅瓦茨', NULL, '塞尔维亚,黑山', 'SCG');
INSERT INTO `st_region_city` VALUES (7915, 'Serbia,Montenegro', NULL, 'Nis', NULL, 'INI', '尼什', NULL, '塞尔维亚,黑山', 'SCG');
INSERT INTO `st_region_city` VALUES (7916, 'Serbia,Montenegro', NULL, 'Novi Sad', NULL, 'NVS', '诺维萨德', NULL, '塞尔维亚,黑山', 'SCG');
INSERT INTO `st_region_city` VALUES (7917, 'Serbia,Montenegro', NULL, 'Pristina', NULL, 'PRN', '普里什蒂纳', NULL, '塞尔维亚,黑山', 'SCG');
INSERT INTO `st_region_city` VALUES (7918, 'Serbia,Montenegro', NULL, 'Subotica', NULL, 'SUB', '苏博蒂察', NULL, '塞尔维亚,黑山', 'SCG');
INSERT INTO `st_region_city` VALUES (7919, 'Serbia,Montenegro', NULL, 'Zemun', NULL, 'ZEM', '泽蒙', NULL, '塞尔维亚,黑山', 'SCG');
INSERT INTO `st_region_city` VALUES (7920, 'Sierra Leone', NULL, 'Northern', NULL, 'N', '北部', NULL, '塞拉利昂', 'SLE');
INSERT INTO `st_region_city` VALUES (7921, 'Sierra Leone', NULL, 'Eastern', NULL, 'E', '东部', NULL, '塞拉利昂', 'SLE');
INSERT INTO `st_region_city` VALUES (7922, 'Sierra Leone', NULL, 'Southern', NULL, 'S', '南部', NULL, '塞拉利昂', 'SLE');
INSERT INTO `st_region_city` VALUES (7923, 'Sierra Leone', NULL, 'Western', NULL, 'W', '西部区', NULL, '塞拉利昂', 'SLE');
INSERT INTO `st_region_city` VALUES (7924, 'Senegal', NULL, 'Dakar', NULL, 'DA', '达喀尔', NULL, '塞内加尔', 'SEN');
INSERT INTO `st_region_city` VALUES (7925, 'Senegal', NULL, 'Fatick', NULL, 'FA', '法蒂克', NULL, '塞内加尔', 'SEN');
INSERT INTO `st_region_city` VALUES (7926, 'Senegal', NULL, 'Ziguinchor', NULL, 'ZI', '济金绍尔', NULL, '塞内加尔', 'SEN');
INSERT INTO `st_region_city` VALUES (7927, 'Senegal', NULL, 'Thies', NULL, 'TH', '捷斯', NULL, '塞内加尔', 'SEN');
INSERT INTO `st_region_city` VALUES (7928, 'Senegal', NULL, 'Diourbel', NULL, 'DI', '久尔贝勒', NULL, '塞内加尔', 'SEN');
INSERT INTO `st_region_city` VALUES (7929, 'Senegal', NULL, 'Kaolack', NULL, 'KA', '考拉克', NULL, '塞内加尔', 'SEN');
INSERT INTO `st_region_city` VALUES (7930, 'Senegal', NULL, 'Kolda', NULL, 'KO', '科尔达', NULL, '塞内加尔', 'SEN');
INSERT INTO `st_region_city` VALUES (7931, 'Senegal', NULL, 'Louga', NULL, 'LO', '卢加', NULL, '塞内加尔', 'SEN');
INSERT INTO `st_region_city` VALUES (7932, 'Senegal', NULL, 'Matam', NULL, 'MA', '马塔姆', NULL, '塞内加尔', 'SEN');
INSERT INTO `st_region_city` VALUES (7933, 'Senegal', NULL, 'Saint-Louis', NULL, 'SL', '圣路易', NULL, '塞内加尔', 'SEN');
INSERT INTO `st_region_city` VALUES (7934, 'Senegal', NULL, 'Tambacounda', NULL, 'TA', '坦巴昆达', NULL, '塞内加尔', 'SEN');
INSERT INTO `st_region_city` VALUES (7935, 'Cyprus', NULL, 'Famagusta', NULL, '4', '法马古斯塔', NULL, '塞浦路斯', 'CYP');
INSERT INTO `st_region_city` VALUES (7936, 'Cyprus', NULL, 'Kyrenia', NULL, '6', '凯里尼亚', NULL, '塞浦路斯', 'CYP');
INSERT INTO `st_region_city` VALUES (7937, 'Cyprus', NULL, 'Larnaca', NULL, '3', '拉纳卡', NULL, '塞浦路斯', 'CYP');
INSERT INTO `st_region_city` VALUES (7938, 'Cyprus', NULL, 'Limassol', NULL, '2', '利马索尔', NULL, '塞浦路斯', 'CYP');
INSERT INTO `st_region_city` VALUES (7939, 'Cyprus', NULL, 'Nicosia', NULL, '1', '尼科西亚', NULL, '塞浦路斯', 'CYP');
INSERT INTO `st_region_city` VALUES (7940, 'Cyprus', NULL, 'Pafos', NULL, '5', '帕福斯', NULL, '塞浦路斯', 'CYP');
INSERT INTO `st_region_city` VALUES (7941, 'Saudi Arabia', NULL, 'Arar', NULL, 'ARA', '阿尔阿尔', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `st_region_city` VALUES (7942, 'Saudi Arabia', NULL, 'Abha', NULL, 'AHB', '艾卜哈', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `st_region_city` VALUES (7943, 'Saudi Arabia', NULL, 'Al Bahah', NULL, 'BH', '巴哈', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `st_region_city` VALUES (7944, 'Saudi Arabia', NULL, 'Buraydah', NULL, 'BUR', '布赖代', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `st_region_city` VALUES (7945, 'Saudi Arabia', NULL, 'Dammam', NULL, 'DAM', '达曼', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `st_region_city` VALUES (7946, 'Saudi Arabia', NULL, 'Hafar al-Batin', NULL, 'HBT', '哈费尔巴廷', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `st_region_city` VALUES (7947, 'Saudi Arabia', NULL, 'Hail', NULL, 'HL', '哈伊勒', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `st_region_city` VALUES (7948, 'Saudi Arabia', NULL, 'Khamis Mushayt', NULL, 'KMX', '海米斯穆谢特', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `st_region_city` VALUES (7949, 'Saudi Arabia', NULL, 'Al-Kharj', NULL, 'AKH', '海耶', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `st_region_city` VALUES (7950, 'Saudi Arabia', NULL, 'Al-Hufuf', NULL, 'HFF', '胡富夫', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `st_region_city` VALUES (7951, 'Saudi Arabia', NULL, 'Jiddah', NULL, 'JED', '吉达', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `st_region_city` VALUES (7952, 'Saudi Arabia', NULL, 'Jizan', NULL, 'JZ', '吉赞', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `st_region_city` VALUES (7953, 'Saudi Arabia', NULL, 'Riyad', NULL, 'RD', '利雅得', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `st_region_city` VALUES (7954, 'Saudi Arabia', NULL, 'Medina', NULL, 'MED', '麦地那', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `st_region_city` VALUES (7955, 'Saudi Arabia', NULL, 'Makkah', NULL, 'ML', '麦加', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `st_region_city` VALUES (7956, 'Saudi Arabia', NULL, 'Al-Mubarraz', NULL, 'MBR', '姆巴拉兹', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `st_region_city` VALUES (7957, 'Saudi Arabia', NULL, 'Najran', NULL, 'NR', '纳季兰', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `st_region_city` VALUES (7958, 'Saudi Arabia', NULL, 'Sakaka', NULL, 'SAK', '塞卡卡', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `st_region_city` VALUES (7959, 'Saudi Arabia', NULL, 'Tabuk', NULL, 'TB', '塔布克', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `st_region_city` VALUES (7960, 'Saudi Arabia', NULL, 'At Tarif', NULL, 'TAR', '塔伊夫', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `st_region_city` VALUES (7961, 'Saudi Arabia', NULL, 'Yanbu al-Bahr', NULL, 'YNB', '延布', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `st_region_city` VALUES (7962, 'Saudi Arabia', NULL, 'Al-Jubayl', NULL, 'JBI', '朱拜勒', NULL, '沙特阿拉伯', 'SAU');
INSERT INTO `st_region_city` VALUES (7963, 'Sri Lanka', NULL, 'Anuradhapura', NULL, 'ADP', '阿努拉德普勒', NULL, '斯里兰卡', 'LKA');
INSERT INTO `st_region_city` VALUES (7964, 'Sri Lanka', NULL, 'Ampara', NULL, 'AMP', '安帕赖', NULL, '斯里兰卡', 'LKA');
INSERT INTO `st_region_city` VALUES (7965, 'Sri Lanka', NULL, 'Badulla', NULL, 'BAD', '巴杜勒', NULL, '斯里兰卡', 'LKA');
INSERT INTO `st_region_city` VALUES (7966, 'Sri Lanka', NULL, 'Batticaloa', NULL, 'BTC', '拜蒂克洛', NULL, '斯里兰卡', 'LKA');
INSERT INTO `st_region_city` VALUES (7967, 'Sri Lanka', NULL, 'Polonnaruwa', NULL, 'POL', '波隆纳鲁沃', NULL, '斯里兰卡', 'LKA');
INSERT INTO `st_region_city` VALUES (7968, 'Sri Lanka', NULL, 'Hambantota', NULL, 'HBA', '汉班托特', NULL, '斯里兰卡', 'LKA');
INSERT INTO `st_region_city` VALUES (7969, 'Sri Lanka', NULL, 'Kilinochchi', NULL, 'KIL', '基里诺奇', NULL, '斯里兰卡', 'LKA');
INSERT INTO `st_region_city` VALUES (7970, 'Sri Lanka', NULL, 'Galle', NULL, 'GAL', '加勒', NULL, '斯里兰卡', 'LKA');
INSERT INTO `st_region_city` VALUES (7971, 'Sri Lanka', NULL, 'Gampaha', NULL, 'GAM', '加姆珀哈', NULL, '斯里兰卡', 'LKA');
INSERT INTO `st_region_city` VALUES (7972, 'Sri Lanka', NULL, 'Jaffna', NULL, 'JAF', '贾夫纳', NULL, '斯里兰卡', 'LKA');
INSERT INTO `st_region_city` VALUES (7973, 'Sri Lanka', NULL, 'Kalutara', NULL, 'KLT', '卡卢特勒', NULL, '斯里兰卡', 'LKA');
INSERT INTO `st_region_city` VALUES (7974, 'Sri Lanka', NULL, 'Kegalle', NULL, 'KEG', '凯格勒', NULL, '斯里兰卡', 'LKA');
INSERT INTO `st_region_city` VALUES (7975, 'Sri Lanka', NULL, 'Kandy', NULL, 'KAN', '康提', NULL, '斯里兰卡', 'LKA');
INSERT INTO `st_region_city` VALUES (7976, 'Sri Lanka', NULL, 'Colombo', NULL, 'CMB', '科伦坡', NULL, '斯里兰卡', 'LKA');
INSERT INTO `st_region_city` VALUES (7977, 'Sri Lanka', NULL, 'Kurunegala', NULL, 'KUR', '库鲁内格勒', NULL, '斯里兰卡', 'LKA');
INSERT INTO `st_region_city` VALUES (7978, 'Sri Lanka', NULL, 'Ratnapura', NULL, 'RAT', '拉特纳普勒', NULL, '斯里兰卡', 'LKA');
INSERT INTO `st_region_city` VALUES (7979, 'Sri Lanka', NULL, 'Mannar', NULL, 'MAN', '马纳尔', NULL, '斯里兰卡', 'LKA');
INSERT INTO `st_region_city` VALUES (7980, 'Sri Lanka', NULL, 'Matale', NULL, 'MAT', '马特莱', NULL, '斯里兰卡', 'LKA');
INSERT INTO `st_region_city` VALUES (7981, 'Sri Lanka', NULL, 'Matara', NULL, 'MAA', '马特勒', NULL, '斯里兰卡', 'LKA');
INSERT INTO `st_region_city` VALUES (7982, 'Sri Lanka', NULL, 'Monaragala', NULL, 'MON', '莫讷勒格勒', NULL, '斯里兰卡', 'LKA');
INSERT INTO `st_region_city` VALUES (7983, 'Sri Lanka', NULL, 'Mullathivu', NULL, 'MUL', '穆莱蒂武', NULL, '斯里兰卡', 'LKA');
INSERT INTO `st_region_city` VALUES (7984, 'Sri Lanka', NULL, 'Nuwara Eliya', NULL, 'NUE', '努沃勒埃利耶', NULL, '斯里兰卡', 'LKA');
INSERT INTO `st_region_city` VALUES (7985, 'Sri Lanka', NULL, 'Puttalam', NULL, 'PUT', '普塔勒姆', NULL, '斯里兰卡', 'LKA');
INSERT INTO `st_region_city` VALUES (7986, 'Sri Lanka', NULL, 'Trincomalee', NULL, 'TRR', '亭可马里', NULL, '斯里兰卡', 'LKA');
INSERT INTO `st_region_city` VALUES (7987, 'Sri Lanka', NULL, 'Vavuniya', NULL, 'VAV', '瓦武尼亚', NULL, '斯里兰卡', 'LKA');
INSERT INTO `st_region_city` VALUES (7988, 'Slovakia', NULL, 'Banskobystricky', NULL, 'BBY', '班斯卡-比斯特里察', NULL, '斯洛伐克', 'SVK');
INSERT INTO `st_region_city` VALUES (7989, 'Slovakia', NULL, 'Bratislavsky', NULL, 'BTS', '布拉迪斯拉发', NULL, '斯洛伐克', 'SVK');
INSERT INTO `st_region_city` VALUES (7990, 'Slovakia', NULL, 'Koricky', NULL, 'KOR', '科希策', NULL, '斯洛伐克', 'SVK');
INSERT INTO `st_region_city` VALUES (7991, 'Slovakia', NULL, 'Nitriansky', NULL, 'NRA', '尼特拉', NULL, '斯洛伐克', 'SVK');
INSERT INTO `st_region_city` VALUES (7992, 'Slovakia', NULL, 'Prerovsky', NULL, 'POV', '普雷绍夫', NULL, '斯洛伐克', 'SVK');
INSERT INTO `st_region_city` VALUES (7993, 'Slovakia', NULL, 'Rilinsky', NULL, 'RIL', '日利纳', NULL, '斯洛伐克', 'SVK');
INSERT INTO `st_region_city` VALUES (7994, 'Slovakia', NULL, 'Trnavsky', NULL, 'TNA', '特尔纳瓦', NULL, '斯洛伐克', 'SVK');
INSERT INTO `st_region_city` VALUES (7995, 'Slovakia', NULL, 'Trenriansky', NULL, 'TRE', '特伦钦', NULL, '斯洛伐克', 'SVK');
INSERT INTO `st_region_city` VALUES (7996, 'Slovenia', NULL, 'Obalno-kraska', NULL, 'OKR', '奥巴尔诺-克拉', NULL, '斯洛文尼亚', 'SVN');
INSERT INTO `st_region_city` VALUES (7997, 'Slovenia', NULL, 'Osrednjeslovenska', NULL, 'OSR', '奥斯雷德涅斯洛文', NULL, '斯洛文尼亚', 'SVN');
INSERT INTO `st_region_city` VALUES (7998, 'Slovenia', NULL, 'Podravska', NULL, 'POD', '波德拉夫', NULL, '斯洛文尼亚', 'SVN');
INSERT INTO `st_region_city` VALUES (7999, 'Slovenia', NULL, 'Pomurska', NULL, 'POM', '波穆尔', NULL, '斯洛文尼亚', 'SVN');
INSERT INTO `st_region_city` VALUES (8000, 'Slovenia', NULL, 'Dolenjska', NULL, 'DLJ', '多雷尼', NULL, '斯洛文尼亚', 'SVN');
INSERT INTO `st_region_city` VALUES (8001, 'Slovenia', NULL, 'Gorenjska', NULL, 'GSZ', '戈雷尼', NULL, '斯洛文尼亚', 'SVN');
INSERT INTO `st_region_city` VALUES (8002, 'Slovenia', NULL, 'Goriska', NULL, 'GSK', '戈里', NULL, '斯洛文尼亚', 'SVN');
INSERT INTO `st_region_city` VALUES (8003, 'Slovenia', NULL, 'Koroska', NULL, 'KOR', '科洛', NULL, '斯洛文尼亚', 'SVN');
INSERT INTO `st_region_city` VALUES (8004, 'Slovenia', NULL, 'Notranjsko-kraska', NULL, 'NKR', '诺特拉尼', NULL, '斯洛文尼亚', 'SVN');
INSERT INTO `st_region_city` VALUES (8005, 'Slovenia', NULL, 'Savinjska', NULL, 'SAV', '萨维尼', NULL, '斯洛文尼亚', 'SVN');
INSERT INTO `st_region_city` VALUES (8006, 'Slovenia', NULL, 'Spodnjeposavska', NULL, 'SPO', '斯波德涅波萨夫', NULL, '斯洛文尼亚', 'SVN');
INSERT INTO `st_region_city` VALUES (8007, 'Slovenia', NULL, 'Zasavska', NULL, 'ZAS', '扎萨夫', NULL, '斯洛文尼亚', 'SVN');
INSERT INTO `st_region_city` VALUES (8008, 'Sudan', NULL, 'Ash-Shamaliyah', NULL, 'ASH', '北部', NULL, '苏丹', 'SDN');
INSERT INTO `st_region_city` VALUES (8009, 'Sudan', NULL, 'Al-Istiwaiyah', NULL, 'SIS', '赤道', NULL, '苏丹', 'SDN');
INSERT INTO `st_region_city` VALUES (8010, 'Sudan', NULL, 'Darfur', NULL, 'SDA', '达尔富尔', NULL, '苏丹', 'SDN');
INSERT INTO `st_region_city` VALUES (8011, 'Sudan', NULL, 'Ash-Sharqiyah', NULL, 'SHA', '东部', NULL, '苏丹', 'SDN');
INSERT INTO `st_region_city` VALUES (8012, 'Sudan', NULL, 'Bahr al-Ghazal', NULL, 'SBG', '加扎勒河', NULL, '苏丹', 'SDN');
INSERT INTO `st_region_city` VALUES (8013, 'Sudan', NULL, 'Al-Khartum', NULL, 'KRT', '喀土穆', NULL, '苏丹', 'SDN');
INSERT INTO `st_region_city` VALUES (8014, 'Sudan', NULL, 'Kurdufan', NULL, 'GKU', '科尔多凡', NULL, '苏丹', 'SDN');
INSERT INTO `st_region_city` VALUES (8015, 'Sudan', NULL, 'Aali an-Nil', NULL, 'ANB', '上尼罗', NULL, '苏丹', 'SDN');
INSERT INTO `st_region_city` VALUES (8016, 'Sudan', NULL, 'Al Wasta', NULL, 'WDH', '中部', NULL, '苏丹', 'SDN');
INSERT INTO `st_region_city` VALUES (8017, 'Suriname', NULL, 'Brokopondo', NULL, 'BR', '布罗科蓬多', NULL, '苏里南', 'SUR');
INSERT INTO `st_region_city` VALUES (8018, 'Suriname', NULL, 'Coronie', NULL, 'CR', '科罗尼', NULL, '苏里南', 'SUR');
INSERT INTO `st_region_city` VALUES (8019, 'Suriname', NULL, 'Commewijne', NULL, 'CM', '科默韦讷', NULL, '苏里南', 'SUR');
INSERT INTO `st_region_city` VALUES (8020, 'Suriname', NULL, 'Marowijne', NULL, 'MA', '马罗韦讷', NULL, '苏里南', 'SUR');
INSERT INTO `st_region_city` VALUES (8021, 'Suriname', NULL, 'Nickerie', NULL, 'NI', '尼克里', NULL, '苏里南', 'SUR');
INSERT INTO `st_region_city` VALUES (8022, 'Suriname', NULL, 'Para', NULL, 'PA', '帕拉', NULL, '苏里南', 'SUR');
INSERT INTO `st_region_city` VALUES (8023, 'Suriname', NULL, 'Paramaribo', NULL, 'PM', '帕拉马里博', NULL, '苏里南', 'SUR');
INSERT INTO `st_region_city` VALUES (8024, 'Suriname', NULL, 'Saramacca', NULL, 'SA', '萨拉马卡', NULL, '苏里南', 'SUR');
INSERT INTO `st_region_city` VALUES (8025, 'Suriname', NULL, 'Wanica', NULL, 'WA', '瓦尼卡', NULL, '苏里南', 'SUR');
INSERT INTO `st_region_city` VALUES (8026, 'Suriname', NULL, 'Sipaliwini', NULL, 'SI', '西帕里韦尼', NULL, '苏里南', 'SUR');
INSERT INTO `st_region_city` VALUES (8027, 'Solomon Islands', NULL, 'Guadalcanal', NULL, 'GC', '瓜达尔卡纳尔', NULL, '所罗门群岛', 'SLB');
INSERT INTO `st_region_city` VALUES (8028, 'Solomon Islands', NULL, 'Honiara', NULL, 'HO', '霍尼亚拉', NULL, '所罗门群岛', 'SLB');
INSERT INTO `st_region_city` VALUES (8029, 'Solomon Islands', NULL, 'Rennell and Bellona', NULL, 'RB', '拉纳尔和贝罗纳', NULL, '所罗门群岛', 'SLB');
INSERT INTO `st_region_city` VALUES (8030, 'Solomon Islands', NULL, 'Makira', NULL, 'MK', '马基拉', NULL, '所罗门群岛', 'SLB');
INSERT INTO `st_region_city` VALUES (8031, 'Solomon Islands', NULL, 'Malaita', NULL, 'ML', '马莱塔', NULL, '所罗门群岛', 'SLB');
INSERT INTO `st_region_city` VALUES (8032, 'Solomon Islands', NULL, 'Choiseul', NULL, 'CH', '乔伊索', NULL, '所罗门群岛', 'SLB');
INSERT INTO `st_region_city` VALUES (8033, 'Solomon Islands', NULL, 'Temotu', NULL, 'TM', '泰莫图', NULL, '所罗门群岛', 'SLB');
INSERT INTO `st_region_city` VALUES (8034, 'Solomon Islands', NULL, 'Western', NULL, 'WE', '西部', NULL, '所罗门群岛', 'SLB');
INSERT INTO `st_region_city` VALUES (8035, 'Solomon Islands', NULL, 'Isabel', NULL, 'IS', '伊萨贝尔', NULL, '所罗门群岛', 'SLB');
INSERT INTO `st_region_city` VALUES (8036, 'Solomon Islands', NULL, 'Central Islands', NULL, 'CE', '中部群岛', NULL, '所罗门群岛', 'SLB');
INSERT INTO `st_region_city` VALUES (8037, 'Tajikistan', NULL, 'Dushanbe', NULL, 'DYU', '杜尚别', NULL, '塔吉克斯坦', 'TJK');
INSERT INTO `st_region_city` VALUES (8038, 'Tajikistan', NULL, 'Khorugh', NULL, 'KHO', '霍罗格', NULL, '塔吉克斯坦', 'TJK');
INSERT INTO `st_region_city` VALUES (8039, 'Tajikistan', NULL, 'Kanibadam', NULL, 'KAN', '卡尼巴达姆', NULL, '塔吉克斯坦', 'TJK');
INSERT INTO `st_region_city` VALUES (8040, 'Tajikistan', NULL, 'Kofarnihon', NULL, 'KOF', '科法尔尼洪', NULL, '塔吉克斯坦', 'TJK');
INSERT INTO `st_region_city` VALUES (8041, 'Tajikistan', NULL, 'Khujand', NULL, 'KHU', '苦盏', NULL, '塔吉克斯坦', 'TJK');
INSERT INTO `st_region_city` VALUES (8042, 'Tajikistan', NULL, 'Kurgan-Tjube', NULL, 'KTJ', '库尔干-秋别', NULL, '塔吉克斯坦', 'TJK');
INSERT INTO `st_region_city` VALUES (8043, 'Tajikistan', NULL, 'Kulob', NULL, 'KLB', '库洛布', NULL, '塔吉克斯坦', 'TJK');
INSERT INTO `st_region_city` VALUES (8044, 'Tajikistan', NULL, 'Rogun', NULL, 'RGU', '洛贡', NULL, '塔吉克斯坦', 'TJK');
INSERT INTO `st_region_city` VALUES (8045, 'Tajikistan', NULL, 'Nurek', NULL, 'NUR', '努雷克', NULL, '塔吉克斯坦', 'TJK');
INSERT INTO `st_region_city` VALUES (8046, 'Tajikistan', NULL, 'Pendzhikent', NULL, 'PJK', '彭吉肯特', NULL, '塔吉克斯坦', 'TJK');
INSERT INTO `st_region_city` VALUES (8047, 'Tajikistan', NULL, 'Sarband', NULL, 'SBA', '萨班特', NULL, '塔吉克斯坦', 'TJK');
INSERT INTO `st_region_city` VALUES (8048, 'Tajikistan', NULL, 'Taboshar', NULL, 'TBS', '塔博沙尔', NULL, '塔吉克斯坦', 'TJK');
INSERT INTO `st_region_city` VALUES (8049, 'Tajikistan', NULL, 'Tursunzade', NULL, 'TSZ', '图尔孙扎德', NULL, '塔吉克斯坦', 'TJK');
INSERT INTO `st_region_city` VALUES (8050, 'Tajikistan', NULL, 'Ura-Tjube', NULL, 'UTJ', '乌拉秋别', NULL, '塔吉克斯坦', 'TJK');
INSERT INTO `st_region_city` VALUES (8051, 'Tajikistan', NULL, 'Isfara', NULL, 'ISF', '伊斯法拉', NULL, '塔吉克斯坦', 'TJK');
INSERT INTO `st_region_city` VALUES (8052, 'Thailand', NULL, 'Amnat Charoen', NULL, '37', '安纳乍能', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8053, 'Thailand', NULL, 'Prachuap Khiri Khan', NULL, '77', '巴蜀', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8054, 'Thailand', NULL, 'Pathum Thani', NULL, '13', '巴吞他尼', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8055, 'Thailand', NULL, 'Prachin Buri', NULL, '25', '巴真', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8056, 'Thailand', NULL, 'Kanchanaburi', NULL, '71', '北碧', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8057, 'Thailand', NULL, 'Saraburi', NULL, '19', '北标', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8058, 'Thailand', NULL, 'Pattani', NULL, '94', '北大年', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8059, 'Thailand', NULL, 'Samut Prakan', NULL, '11', '北揽', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8060, 'Thailand', NULL, 'Nakhon Sawan', NULL, '60', '北榄坡', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8061, 'Thailand', NULL, 'Chachoengsao', NULL, '24', '北柳', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8062, 'Thailand', NULL, 'Phetchabun', NULL, '76', '碧差汶', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8063, 'Thailand', NULL, 'Phatthalung', NULL, '93', '博达伦', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8064, 'Thailand', NULL, 'Chai Nat', NULL, '18', '猜那', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8065, 'Thailand', NULL, 'Chaiyaphum', NULL, '36', '猜也奔', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8066, 'Thailand', NULL, 'Uttaradit', NULL, '53', '程逸', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8067, 'Thailand', NULL, 'Chumphon', NULL, '86', '春蓬', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8068, 'Thailand', NULL, 'Chon Buri', NULL, '20', '春武里', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8069, 'Thailand', NULL, 'Tak', NULL, '63', '达', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8070, 'Thailand', NULL, 'Trat', NULL, '23', '达叻', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8071, 'Thailand', NULL, 'Phra Nakhon Si Ayutthaya', NULL, '14', '大城', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8072, 'Thailand', NULL, 'Trang', NULL, '92', '董里', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8073, 'Thailand', NULL, 'Phetchaburi', NULL, '78', '佛丕', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8074, 'Thailand', NULL, 'Nakhon Pathom', NULL, '73', '佛统', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8075, 'Thailand', NULL, 'Kamphaeng Phet', NULL, '62', '甘烹碧', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8076, 'Thailand', NULL, 'Ang Thong', NULL, '15', '红统', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8077, 'Thailand', NULL, 'Lop Buri', NULL, '16', '华富里', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8078, 'Thailand', NULL, 'Kalasin', NULL, '46', '加拉信', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8079, 'Thailand', NULL, 'Krabi', NULL, '81', '甲米', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8080, 'Thailand', NULL, 'Chanthaburi', NULL, '22', '尖竹汶', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8081, 'Thailand', NULL, 'Khon Kaen', NULL, '40', '孔敬', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8082, 'Thailand', NULL, 'Rayong', NULL, '21', '拉农', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8083, 'Thailand', NULL, 'Nong Khai', NULL, '43', '廊开', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8084, 'Thailand', NULL, 'Nong Bua Lamphu', NULL, '39', '廊莫那浦', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8085, 'Thailand', NULL, 'Ratchaburi', NULL, '70', '叻丕', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8086, 'Thailand', NULL, 'Loei', NULL, '42', '黎', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8087, 'Thailand', NULL, 'Roi Et', NULL, '45', '黎逸', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8088, 'Thailand', NULL, 'Samut Sakhon', NULL, '74', '龙仔厝', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8089, 'Thailand', NULL, 'Ranong', NULL, '85', '罗勇', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8090, 'Thailand', NULL, 'Nakhon Si Thammarat', NULL, '80', '洛坤', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8091, 'Thailand', NULL, 'Maha Sarakham', NULL, '44', '玛哈沙拉堪', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8092, 'Thailand', NULL, 'Bangkok', NULL, '10', '曼谷', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8093, 'Thailand', NULL, 'Mukdahan', NULL, '49', '莫达汉', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8094, 'Thailand', NULL, 'Nakhon Nayok', NULL, '26', '那空那育', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8095, 'Thailand', NULL, 'Nakhon Phanom', NULL, '48', '那空帕农', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8096, 'Thailand', NULL, 'Nan', NULL, '55', '难', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8097, 'Thailand', NULL, 'Lamphun', NULL, '51', '南奔', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8098, 'Thailand', NULL, 'Nonthaburi', NULL, '12', '暖武里', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8099, 'Thailand', NULL, 'Phrae', NULL, '54', '帕', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8100, 'Thailand', NULL, 'Phayao', NULL, '56', '帕尧', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8101, 'Thailand', NULL, 'Phangnga', NULL, '82', '攀牙', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8102, 'Thailand', NULL, 'Phitsanulok', NULL, '65', '彭世洛', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8103, 'Thailand', NULL, 'Phichit', NULL, '66', '披集', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8104, 'Thailand', NULL, 'Phuket', NULL, '83', '普吉', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8105, 'Thailand', NULL, 'Chiang Rai', NULL, '57', '清莱', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8106, 'Thailand', NULL, 'Chiang Mai', NULL, '50', '清迈', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8107, 'Thailand', NULL, 'Sakon Nakhon', NULL, '47', '色军', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8108, 'Thailand', NULL, 'Satun', NULL, '91', '沙敦', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8109, 'Thailand', NULL, 'Sa Kaeo', NULL, '27', '沙缴', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8110, 'Thailand', NULL, 'Si sa ket', NULL, '33', '四色菊', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8111, 'Thailand', NULL, 'Songkhla', NULL, '90', '宋卡', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8112, 'Thailand', NULL, 'Sukhothai', NULL, '64', '素可泰', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8113, 'Thailand', NULL, 'Surat Thani', NULL, '84', '素叻', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8114, 'Thailand', NULL, 'Surin', NULL, '32', '素林', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8115, 'Thailand', NULL, 'Suphan Buri', NULL, '72', '素攀武里', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8116, 'Thailand', NULL, 'Narathiwat', NULL, '96', '陶公', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8117, 'Thailand', NULL, 'Udon Thani', NULL, '41', '乌隆', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8118, 'Thailand', NULL, 'Uthai Thani', NULL, '61', '乌泰他尼', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8119, 'Thailand', NULL, 'Ubon Ratchathani', NULL, '34', '乌汶', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8120, 'Thailand', NULL, 'Buri Ram', NULL, '31', '武里南', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8121, 'Thailand', NULL, 'Sing Buri', NULL, '17', '信武里', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8122, 'Thailand', NULL, 'Yasothon', NULL, '35', '耶梭通', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8123, 'Thailand', NULL, 'Yala', NULL, '95', '也拉', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8124, 'Thailand', NULL, 'Mae Hong Son', NULL, '58', '夜丰颂', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8125, 'Thailand', NULL, 'Samut Songkhram', NULL, '75', '夜功', NULL, '泰国', 'THA');
INSERT INTO `st_region_city` VALUES (8126, 'Tanzania', NULL, 'Arusha', NULL, 'AR', '阿鲁沙', NULL, '坦桑尼亚', 'TZA');
INSERT INTO `st_region_city` VALUES (8127, 'Tanzania', NULL, 'Kaskazini Pemba', NULL, 'PN', '奔巴北', NULL, '坦桑尼亚', 'TZA');
INSERT INTO `st_region_city` VALUES (8128, 'Tanzania', NULL, 'Kusini Pemba', NULL, 'PS', '奔巴南', NULL, '坦桑尼亚', 'TZA');
INSERT INTO `st_region_city` VALUES (8129, 'Tanzania', NULL, 'Pwani', NULL, 'PW', '滨海', NULL, '坦桑尼亚', 'TZA');
INSERT INTO `st_region_city` VALUES (8130, 'Tanzania', NULL, 'Dar es Salaam', NULL, 'DS', '达累斯萨拉姆', NULL, '坦桑尼亚', 'TZA');
INSERT INTO `st_region_city` VALUES (8131, 'Tanzania', NULL, 'Dodoma', NULL, 'DO', '多多马', NULL, '坦桑尼亚', 'TZA');
INSERT INTO `st_region_city` VALUES (8132, 'Tanzania', NULL, 'Kigoma', NULL, 'KI', '基戈马', NULL, '坦桑尼亚', 'TZA');
INSERT INTO `st_region_city` VALUES (8133, 'Tanzania', NULL, 'Kagera', NULL, 'KA', '卡盖拉', NULL, '坦桑尼亚', 'TZA');
INSERT INTO `st_region_city` VALUES (8134, 'Tanzania', NULL, 'Lindi', NULL, 'LN', '林迪', NULL, '坦桑尼亚', 'TZA');
INSERT INTO `st_region_city` VALUES (8135, 'Tanzania', NULL, 'Rukwa', NULL, 'RK', '鲁夸', NULL, '坦桑尼亚', 'TZA');
INSERT INTO `st_region_city` VALUES (8136, 'Tanzania', NULL, 'Ruvuma', NULL, 'RV', '鲁伍马', NULL, '坦桑尼亚', 'TZA');
INSERT INTO `st_region_city` VALUES (8137, 'Tanzania', NULL, 'Mara', NULL, 'MR', '马腊', NULL, '坦桑尼亚', 'TZA');
INSERT INTO `st_region_city` VALUES (8138, 'Tanzania', NULL, 'Manyara', NULL, 'MY', '曼亚拉', NULL, '坦桑尼亚', 'TZA');
INSERT INTO `st_region_city` VALUES (8139, 'Tanzania', NULL, 'Morogoro', NULL, 'MO', '莫洛戈罗', NULL, '坦桑尼亚', 'TZA');
INSERT INTO `st_region_city` VALUES (8140, 'Tanzania', NULL, 'Mbeya', NULL, 'MB', '姆贝亚', NULL, '坦桑尼亚', 'TZA');
INSERT INTO `st_region_city` VALUES (8141, 'Tanzania', NULL, 'Mtwara', NULL, 'MT', '姆特瓦拉', NULL, '坦桑尼亚', 'TZA');
INSERT INTO `st_region_city` VALUES (8142, 'Tanzania', NULL, 'Mwanza', NULL, 'MW', '姆万扎', NULL, '坦桑尼亚', 'TZA');
INSERT INTO `st_region_city` VALUES (8143, 'Tanzania', NULL, 'Kilimanjaro', NULL, 'KJ', '乞力马扎罗', NULL, '坦桑尼亚', 'TZA');
INSERT INTO `st_region_city` VALUES (8144, 'Tanzania', NULL, 'Zanzibar', NULL, 'ZN', '桑给巴尔', NULL, '坦桑尼亚', 'TZA');
INSERT INTO `st_region_city` VALUES (8145, 'Tanzania', NULL, 'Kaskazini Unguja', NULL, 'UN', '桑给巴尔北', NULL, '坦桑尼亚', 'TZA');
INSERT INTO `st_region_city` VALUES (8146, 'Tanzania', NULL, 'Kusini Unguja', NULL, 'US', '桑给巴尔南', NULL, '坦桑尼亚', 'TZA');
INSERT INTO `st_region_city` VALUES (8147, 'Tanzania', NULL, 'Mjini Magharibi', NULL, 'MM', '桑给巴尔市和西', NULL, '坦桑尼亚', 'TZA');
INSERT INTO `st_region_city` VALUES (8148, 'Tanzania', NULL, 'Tabora', NULL, 'TB', '塔波拉', NULL, '坦桑尼亚', 'TZA');
INSERT INTO `st_region_city` VALUES (8149, 'Tanzania', NULL, 'Tanga', NULL, 'TN', '坦噶', NULL, '坦桑尼亚', 'TZA');
INSERT INTO `st_region_city` VALUES (8150, 'Tanzania', NULL, 'Singida', NULL, 'SI', '辛吉达', NULL, '坦桑尼亚', 'TZA');
INSERT INTO `st_region_city` VALUES (8151, 'Tanzania', NULL, 'Shinyanga', NULL, 'SH', '欣延加', NULL, '坦桑尼亚', 'TZA');
INSERT INTO `st_region_city` VALUES (8152, 'Tanzania', NULL, 'Iringa', NULL, 'IR', '伊林加', NULL, '坦桑尼亚', 'TZA');
INSERT INTO `st_region_city` VALUES (8153, 'Tonga', NULL, 'Eua', NULL, 'E', '埃瓦', NULL, '汤加', 'TON');
INSERT INTO `st_region_city` VALUES (8154, 'Tonga', NULL, 'Haapai', NULL, 'H', '哈派', NULL, '汤加', 'TON');
INSERT INTO `st_region_city` VALUES (8155, 'Tonga', NULL, 'Niuas', NULL, 'N', '纽阿斯', NULL, '汤加', 'TON');
INSERT INTO `st_region_city` VALUES (8156, 'Tonga', NULL, 'Tongatapu', NULL, 'T', '汤加塔布', NULL, '汤加', 'TON');
INSERT INTO `st_region_city` VALUES (8157, 'Tonga', NULL, 'Vavau', NULL, 'V', '瓦瓦乌', NULL, '汤加', 'TON');
INSERT INTO `st_region_city` VALUES (8158, 'Tunisia', NULL, 'Ariana', NULL, 'AR', '艾尔亚奈', NULL, '突尼斯', 'TUN');
INSERT INTO `st_region_city` VALUES (8159, 'Tunisia', NULL, 'Beja', NULL, 'BJ', '巴杰', NULL, '突尼斯', 'TUN');
INSERT INTO `st_region_city` VALUES (8160, 'Tunisia', NULL, 'Ben Arous', NULL, 'BA', '本阿鲁斯', NULL, '突尼斯', 'TUN');
INSERT INTO `st_region_city` VALUES (8161, 'Tunisia', NULL, 'Bizerte', NULL, 'BI', '比塞大', NULL, '突尼斯', 'TUN');
INSERT INTO `st_region_city` VALUES (8162, 'Tunisia', NULL, 'Kebili', NULL, 'KB', '吉比利', NULL, '突尼斯', 'TUN');
INSERT INTO `st_region_city` VALUES (8163, 'Tunisia', NULL, 'Gabes', NULL, 'GB', '加贝斯', NULL, '突尼斯', 'TUN');
INSERT INTO `st_region_city` VALUES (8164, 'Tunisia', NULL, 'Gafsa', NULL, 'GF', '加夫萨', NULL, '突尼斯', 'TUN');
INSERT INTO `st_region_city` VALUES (8165, 'Tunisia', NULL, 'Jendouba', NULL, 'JE', '坚杜拜', NULL, '突尼斯', 'TUN');
INSERT INTO `st_region_city` VALUES (8166, 'Tunisia', NULL, 'Le Kef', NULL, 'LK', '卡夫', NULL, '突尼斯', 'TUN');
INSERT INTO `st_region_city` VALUES (8167, 'Tunisia', NULL, 'Kasserine', NULL, 'KS', '卡塞林', NULL, '突尼斯', 'TUN');
INSERT INTO `st_region_city` VALUES (8168, 'Tunisia', NULL, 'Kairouan', NULL, 'KR', '凯鲁万', NULL, '突尼斯', 'TUN');
INSERT INTO `st_region_city` VALUES (8169, 'Tunisia', NULL, 'Mahdia', NULL, 'MH', '马赫迪耶', NULL, '突尼斯', 'TUN');
INSERT INTO `st_region_city` VALUES (8170, 'Tunisia', NULL, 'Manouba', NULL, 'MN', '马努巴', NULL, '突尼斯', 'TUN');
INSERT INTO `st_region_city` VALUES (8171, 'Tunisia', NULL, 'Medenine', NULL, 'ME', '梅德宁', NULL, '突尼斯', 'TUN');
INSERT INTO `st_region_city` VALUES (8172, 'Tunisia', NULL, 'Monastir', NULL, 'MO', '莫纳斯提尔', NULL, '突尼斯', 'TUN');
INSERT INTO `st_region_city` VALUES (8173, 'Tunisia', NULL, 'Nabeul', NULL, 'NA', '纳布勒', NULL, '突尼斯', 'TUN');
INSERT INTO `st_region_city` VALUES (8174, 'Tunisia', NULL, 'Sfax', NULL, 'SF', '斯法克斯', NULL, '突尼斯', 'TUN');
INSERT INTO `st_region_city` VALUES (8175, 'Tunisia', NULL, 'Sousse', NULL, 'SO', '苏塞', NULL, '突尼斯', 'TUN');
INSERT INTO `st_region_city` VALUES (8176, 'Tunisia', NULL, 'Tataouine', NULL, 'TA', '泰塔温', NULL, '突尼斯', 'TUN');
INSERT INTO `st_region_city` VALUES (8177, 'Tunisia', NULL, 'Tunis', NULL, 'TU', '突尼斯', NULL, '突尼斯', 'TUN');
INSERT INTO `st_region_city` VALUES (8178, 'Tunisia', NULL, 'Tozeur', NULL, 'TO', '托泽尔', NULL, '突尼斯', 'TUN');
INSERT INTO `st_region_city` VALUES (8179, 'Tunisia', NULL, 'Sidi Bouzid', NULL, 'SD', '西迪布济德', NULL, '突尼斯', 'TUN');
INSERT INTO `st_region_city` VALUES (8180, 'Tunisia', NULL, 'Siliana', NULL, 'SL', '锡勒亚奈', NULL, '突尼斯', 'TUN');
INSERT INTO `st_region_city` VALUES (8181, 'Tunisia', NULL, 'Zaghouan', NULL, 'ZA', '宰格万', NULL, '突尼斯', 'TUN');
INSERT INTO `st_region_city` VALUES (8182, 'Turkey', NULL, 'Adana', NULL, 'ADA', '阿达纳', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8183, 'Turkey', NULL, 'Adiyaman', NULL, 'ADI', '阿德亚曼', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8184, 'Turkey', NULL, 'Ardahan', NULL, 'ARD', '阿尔达罕', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8185, 'Turkey', NULL, 'Artvin', NULL, 'ART', '阿尔特温', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8186, 'Turkey', NULL, 'Afyon', NULL, 'AFY', '阿菲永', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8187, 'Turkey', NULL, 'Aksaray', NULL, 'AKS', '阿克萨赖', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8188, 'Turkey', NULL, 'Agri', NULL, 'AGR', '阿勒', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8189, 'Turkey', NULL, 'Amasya', NULL, 'AMA', '阿马西亚', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8190, 'Turkey', NULL, 'Edirne', NULL, 'EDI', '埃迪尔内', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8191, 'Turkey', NULL, 'Erzincan', NULL, 'EZC', '埃尔津詹', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8192, 'Turkey', NULL, 'Erzurum', NULL, 'EZR', '埃尔祖鲁姆', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8193, 'Turkey', NULL, 'Elazig', NULL, 'ELA', '埃拉泽', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8194, 'Turkey', NULL, 'Eskisehir', NULL, 'ESK', '埃斯基谢希尔', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8195, 'Turkey', NULL, 'Aydin', NULL, 'AYI', '艾登', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8196, 'Turkey', NULL, 'Ankara', NULL, 'ANK', '安卡拉', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8197, 'Turkey', NULL, 'Antalya', NULL, 'ANT', '安塔利亚', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8198, 'Turkey', NULL, 'Ordu', NULL, 'ORD', '奥尔杜', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8199, 'Turkey', NULL, 'Bartin', NULL, 'BAR', '巴尔腾', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8200, 'Turkey', NULL, 'Balikesir', NULL, 'BAL', '巴勒克埃西尔', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8201, 'Turkey', NULL, 'Batman', NULL, 'BAT', '巴特曼', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8202, 'Turkey', NULL, 'Bayburt', NULL, 'BAY', '巴伊布尔特', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8203, 'Turkey', NULL, 'Bilecik', NULL, 'BIL', '比莱吉克', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8204, 'Turkey', NULL, 'Bitlis', NULL, 'BIT', '比特利斯', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8205, 'Turkey', NULL, 'Bingol', NULL, 'BIN', '宾格尔', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8206, 'Turkey', NULL, 'Bolu', NULL, 'BOL', '博卢', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8207, 'Turkey', NULL, 'Burdur', NULL, 'BRD', '布尔杜尔', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8208, 'Turkey', NULL, 'Bursa', NULL, 'BRS', '布尔萨', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8209, 'Turkey', NULL, 'Cankiri', NULL, 'CKR', '昌克勒', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8210, 'Turkey', NULL, 'Denizli', NULL, 'DEN', '代尼兹利', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8211, 'Turkey', NULL, 'Diyarbakir', NULL, 'DIY', '迪亚巴克尔', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8212, 'Turkey', NULL, 'Van', NULL, 'VAN', '凡', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8213, 'Turkey', NULL, 'Hakkari', NULL, 'HKR', '哈卡里', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8214, 'Turkey', NULL, 'Hatay', NULL, 'HTY', '哈塔伊', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8215, 'Turkey', NULL, 'Kilis', NULL, 'KLS', '基利斯', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8216, 'Turkey', NULL, 'Giresun', NULL, 'GIR', '吉雷松', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8217, 'Turkey', NULL, 'Gaziantep', NULL, 'GAZ', '加济安泰普', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8218, 'Turkey', NULL, 'Gumushane', NULL, 'GMS', '居米什哈内', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8219, 'Turkey', NULL, 'Kars', NULL, 'KRS', '卡尔斯', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8220, 'Turkey', NULL, 'Kahraman Maras', NULL, 'KAH', '卡赫拉曼马拉什', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8221, 'Turkey', NULL, 'Karabuk', NULL, 'KRB', '卡拉比克', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8222, 'Turkey', NULL, 'Karaman', NULL, 'KRM', '卡拉曼', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8223, 'Turkey', NULL, 'Kastamonu', NULL, 'KAS', '卡斯塔莫努', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8224, 'Turkey', NULL, 'Kayseri', NULL, 'KAY', '开塞利', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8225, 'Turkey', NULL, 'Kocaeli', NULL, 'KOC', '科贾埃利', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8226, 'Turkey', NULL, 'Kirklareli', NULL, 'KLR', '柯克拉雷利', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8227, 'Turkey', NULL, 'Konya', NULL, 'KON', '科尼亚', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8228, 'Turkey', NULL, 'Kirsehir', NULL, 'KRH', '克尔谢希尔', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8229, 'Turkey', NULL, 'Kirikkale', NULL, 'KRK', '克勒克卡莱', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8230, 'Turkey', NULL, 'Urfa', NULL, 'URF', '拉飞', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8231, 'Turkey', NULL, 'Rize', NULL, 'RIZ', '里泽', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8232, 'Turkey', NULL, 'Mardin', NULL, 'MAR', '马尔丁', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8233, 'Turkey', NULL, 'Malatya', NULL, 'MAL', '马拉蒂亚', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8234, 'Turkey', NULL, 'Manisa', NULL, 'MAN', '马尼萨', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8235, 'Turkey', NULL, 'Mugla', NULL, 'MUG', '穆拉', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8236, 'Turkey', NULL, 'Mus', NULL, 'MUS', '穆什', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8237, 'Turkey', NULL, 'Nevsehir', NULL, 'NEV', '内夫谢希尔', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8238, 'Turkey', NULL, 'Nigde', NULL, 'NIG', '尼代', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8239, 'Turkey', NULL, 'Canakkale', NULL, 'CKL', '恰纳卡莱', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8240, 'Turkey', NULL, 'Corum', NULL, 'COR', '乔鲁姆', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8241, 'Turkey', NULL, 'Kutahya', NULL, 'KUT', '屈塔希亚', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8242, 'Turkey', NULL, 'Sakarya', NULL, 'SAK', '萨卡里亚', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8243, 'Turkey', NULL, 'Samsun', NULL, 'SAM', '萨姆松', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8244, 'Turkey', NULL, 'Tekirdag', NULL, 'TEL', '泰基尔达', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8245, 'Turkey', NULL, 'Trabzon', NULL, 'TRA', '特拉布宗', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8246, 'Turkey', NULL, 'Tunceli', NULL, 'TUN', '通杰利', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8247, 'Turkey', NULL, 'Tokat', NULL, 'TOK', '托卡特', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8248, 'Turkey', NULL, 'Usak', NULL, 'USK', '乌萨克', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8249, 'Turkey', NULL, 'Sirnak', NULL, 'SIR', '锡尔纳克', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8250, 'Turkey', NULL, 'Siirt', NULL, 'SII', '锡尔特', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8251, 'Turkey', NULL, 'Sinop', NULL, 'SIN', '锡诺普', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8252, 'Turkey', NULL, 'Sivas', NULL, 'SIV', '锡瓦斯', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8253, 'Turkey', NULL, 'Igdir', NULL, 'IGD', '伊迪尔', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8254, 'Turkey', NULL, 'Icel', NULL, 'ICE', '伊切尔', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8255, 'Turkey', NULL, 'Isparta', NULL, 'ISP', '伊斯帕尔塔', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8256, 'Turkey', NULL, 'Istanbul', NULL, 'IST', '伊斯坦布尔', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8257, 'Turkey', NULL, 'Izmir', NULL, 'IZM', '伊兹密尔', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8258, 'Turkey', NULL, 'Yozgat', NULL, 'YOZ', '约兹加特', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8259, 'Turkey', NULL, 'Zonguldak', NULL, 'ZON', '宗古尔达克', NULL, '土耳其', 'TUR');
INSERT INTO `st_region_city` VALUES (8260, 'Turkmenistan', NULL, 'Ahal', NULL, 'A', '阿哈尔', NULL, '土库曼斯坦', 'TKM');
INSERT INTO `st_region_city` VALUES (8261, 'Turkmenistan', NULL, 'Ashgabat', NULL, 'ASB', '阿什哈巴德市', NULL, '土库曼斯坦', 'TKM');
INSERT INTO `st_region_city` VALUES (8262, 'Turkmenistan', NULL, 'Balkan', NULL, 'B', '巴尔坎', NULL, '土库曼斯坦', 'TKM');
INSERT INTO `st_region_city` VALUES (8263, 'Turkmenistan', NULL, 'Dashoguz', NULL, 'D', '达沙古兹', NULL, '土库曼斯坦', 'TKM');
INSERT INTO `st_region_city` VALUES (8264, 'Turkmenistan', NULL, 'Lebap', NULL, 'L', '列巴普', NULL, '土库曼斯坦', 'TKM');
INSERT INTO `st_region_city` VALUES (8265, 'Turkmenistan', NULL, 'Mary', NULL, 'M', '马雷', NULL, '土库曼斯坦', 'TKM');
INSERT INTO `st_region_city` VALUES (8266, 'Turkmenistan', NULL, 'Nebitdag', NULL, 'NEB', '涅比特达格', NULL, '土库曼斯坦', 'TKM');
INSERT INTO `st_region_city` VALUES (8267, 'Vanuatu', NULL, 'Malampa', NULL, 'MA', '马朗帕', NULL, '瓦努阿图', 'VUT');
INSERT INTO `st_region_city` VALUES (8268, 'Vanuatu', NULL, 'Penama', NULL, 'PE', '彭纳马', NULL, '瓦努阿图', 'VUT');
INSERT INTO `st_region_city` VALUES (8269, 'Vanuatu', NULL, 'Sanma', NULL, 'SA', '桑马', NULL, '瓦努阿图', 'VUT');
INSERT INTO `st_region_city` VALUES (8270, 'Vanuatu', NULL, 'Tafea', NULL, 'TA', '塔菲阿', NULL, '瓦努阿图', 'VUT');
INSERT INTO `st_region_city` VALUES (8271, 'Vanuatu', NULL, 'Torba', NULL, 'TO', '托尔巴', NULL, '瓦努阿图', 'VUT');
INSERT INTO `st_region_city` VALUES (8272, 'Vanuatu', NULL, 'Shefa', NULL, 'SH', '谢法', NULL, '瓦努阿图', 'VUT');
INSERT INTO `st_region_city` VALUES (8273, 'Guatemala', NULL, 'El Progreso', NULL, 'PR', '埃尔普罗格雷索', NULL, '危地马拉', 'GTM');
INSERT INTO `st_region_city` VALUES (8274, 'Guatemala', NULL, 'Escuintla', NULL, 'ES', '埃斯昆特拉', NULL, '危地马拉', 'GTM');
INSERT INTO `st_region_city` VALUES (8275, 'Guatemala', NULL, 'Jalapa', NULL, 'JA', '哈拉帕', NULL, '危地马拉', 'GTM');
INSERT INTO `st_region_city` VALUES (8276, 'Guatemala', NULL, 'Jutiapa', NULL, 'JU', '胡蒂亚帕', NULL, '危地马拉', 'GTM');
INSERT INTO `st_region_city` VALUES (8277, 'Guatemala', NULL, 'Quiche', NULL, 'QC', '基切', NULL, '危地马拉', 'GTM');
INSERT INTO `st_region_city` VALUES (8278, 'Guatemala', NULL, 'Quetzaltenango', NULL, 'QZ', '克萨尔特南戈', NULL, '危地马拉', 'GTM');
INSERT INTO `st_region_city` VALUES (8279, 'Guatemala', NULL, 'Retalhuleu', NULL, 'RE', '雷塔卢莱乌', NULL, '危地马拉', 'GTM');
INSERT INTO `st_region_city` VALUES (8280, 'Guatemala', NULL, 'Mixco', NULL, 'MIX', '米克斯科', NULL, '危地马拉', 'GTM');
INSERT INTO `st_region_city` VALUES (8281, 'Guatemala', NULL, 'Peten', NULL, 'PE', '佩滕', NULL, '危地马拉', 'GTM');
INSERT INTO `st_region_city` VALUES (8282, 'Guatemala', NULL, 'Chiquimula', NULL, 'CQ', '奇基穆拉', NULL, '危地马拉', 'GTM');
INSERT INTO `st_region_city` VALUES (8283, 'Guatemala', NULL, 'Chimaltenango', NULL, 'CM', '奇马尔特南戈', NULL, '危地马拉', 'GTM');
INSERT INTO `st_region_city` VALUES (8284, 'Guatemala', NULL, 'Zacapa', NULL, 'ZA', '萨卡帕', NULL, '危地马拉', 'GTM');
INSERT INTO `st_region_city` VALUES (8285, 'Guatemala', NULL, 'Sacatepequez', NULL, 'ST', '萨卡特佩克斯', NULL, '危地马拉', 'GTM');
INSERT INTO `st_region_city` VALUES (8286, 'Guatemala', NULL, 'Alta Verapaz', NULL, 'AV', '上韦拉帕斯', NULL, '危地马拉', 'GTM');
INSERT INTO `st_region_city` VALUES (8287, 'Guatemala', NULL, 'Santa Rosa', NULL, 'SR', '圣罗莎', NULL, '危地马拉', 'GTM');
INSERT INTO `st_region_city` VALUES (8288, 'Guatemala', NULL, 'San Marcos', NULL, 'SM', '圣马科斯', NULL, '危地马拉', 'GTM');
INSERT INTO `st_region_city` VALUES (8289, 'Guatemala', NULL, 'Suchitepequez', NULL, 'SU', '苏奇特佩克斯', NULL, '危地马拉', 'GTM');
INSERT INTO `st_region_city` VALUES (8290, 'Guatemala', NULL, 'Solola', NULL, 'SO', '索洛拉', NULL, '危地马拉', 'GTM');
INSERT INTO `st_region_city` VALUES (8291, 'Guatemala', NULL, 'Totonicapan', NULL, 'TO', '托托尼卡潘', NULL, '危地马拉', 'GTM');
INSERT INTO `st_region_city` VALUES (8292, 'Guatemala', NULL, 'Guatemala', NULL, 'GU', '危地马拉', NULL, '危地马拉', 'GTM');
INSERT INTO `st_region_city` VALUES (8293, 'Guatemala', NULL, 'Huehuetenango', NULL, 'HU', '韦韦特南戈', NULL, '危地马拉', 'GTM');
INSERT INTO `st_region_city` VALUES (8294, 'Guatemala', NULL, 'Baja Verapaz', NULL, 'BV', '下韦拉帕斯', NULL, '危地马拉', 'GTM');
INSERT INTO `st_region_city` VALUES (8295, 'Guatemala', NULL, 'Villa Nueva', NULL, 'VIN', '新城', NULL, '危地马拉', 'GTM');
INSERT INTO `st_region_city` VALUES (8296, 'Guatemala', NULL, 'Izabal', NULL, 'IZ', '伊萨瓦尔', NULL, '危地马拉', 'GTM');
INSERT INTO `st_region_city` VALUES (8297, 'Venezuela', NULL, 'Aragua', NULL, 'D', '阿拉瓜', NULL, '委内瑞拉', 'VEN');
INSERT INTO `st_region_city` VALUES (8298, 'Venezuela', NULL, 'Delta Amacuro', NULL, 'Y', '阿马库罗三角洲', NULL, '委内瑞拉', 'VEN');
INSERT INTO `st_region_city` VALUES (8299, 'Venezuela', NULL, 'Apure', NULL, 'C', '阿普雷', NULL, '委内瑞拉', 'VEN');
INSERT INTO `st_region_city` VALUES (8300, 'Venezuela', NULL, 'Anzoategui', NULL, 'B', '安索阿特吉', NULL, '委内瑞拉', 'VEN');
INSERT INTO `st_region_city` VALUES (8301, 'Venezuela', NULL, 'Barinas', NULL, 'E', '巴里纳斯', NULL, '委内瑞拉', 'VEN');
INSERT INTO `st_region_city` VALUES (8302, 'Venezuela', NULL, 'Bolivar', NULL, 'F', '玻利瓦尔', NULL, '委内瑞拉', 'VEN');
INSERT INTO `st_region_city` VALUES (8303, 'Venezuela', NULL, 'Portuguesa', NULL, 'P', '波图格萨', NULL, '委内瑞拉', 'VEN');
INSERT INTO `st_region_city` VALUES (8304, 'Venezuela', NULL, 'Falcon', NULL, 'I', '法尔孔', NULL, '委内瑞拉', 'VEN');
INSERT INTO `st_region_city` VALUES (8305, 'Venezuela', NULL, 'Guarico', NULL, 'J', '瓜里科', NULL, '委内瑞拉', 'VEN');
INSERT INTO `st_region_city` VALUES (8306, 'Venezuela', NULL, 'Caracas', NULL, 'A', '加拉加斯', NULL, '委内瑞拉', 'VEN');
INSERT INTO `st_region_city` VALUES (8307, 'Venezuela', NULL, 'Carabobo', NULL, 'G', '卡拉沃沃', NULL, '委内瑞拉', 'VEN');
INSERT INTO `st_region_city` VALUES (8308, 'Venezuela', NULL, 'Cojedes', NULL, 'H', '科赫德斯', NULL, '委内瑞拉', 'VEN');
INSERT INTO `st_region_city` VALUES (8309, 'Venezuela', NULL, 'Lara', NULL, 'K', '拉腊', NULL, '委内瑞拉', 'VEN');
INSERT INTO `st_region_city` VALUES (8310, 'Venezuela', NULL, 'Dependencias Federales', NULL, 'W', '联邦属地', NULL, '委内瑞拉', 'VEN');
INSERT INTO `st_region_city` VALUES (8311, 'Venezuela', NULL, 'Merida', NULL, 'L', '梅里达', NULL, '委内瑞拉', 'VEN');
INSERT INTO `st_region_city` VALUES (8312, 'Venezuela', NULL, 'Miranda', NULL, 'M', '米兰达', NULL, '委内瑞拉', 'VEN');
INSERT INTO `st_region_city` VALUES (8313, 'Venezuela', NULL, 'Monagas', NULL, 'N', '莫纳加斯', NULL, '委内瑞拉', 'VEN');
INSERT INTO `st_region_city` VALUES (8314, 'Venezuela', NULL, 'Sucre', NULL, 'R', '苏克雷', NULL, '委内瑞拉', 'VEN');
INSERT INTO `st_region_city` VALUES (8315, 'Venezuela', NULL, 'Zulia', NULL, 'V', '苏利亚', NULL, '委内瑞拉', 'VEN');
INSERT INTO `st_region_city` VALUES (8316, 'Venezuela', NULL, 'Tachira', NULL, 'S', '塔奇拉', NULL, '委内瑞拉', 'VEN');
INSERT INTO `st_region_city` VALUES (8317, 'Venezuela', NULL, 'Trujillo', NULL, 'T', '特鲁希略', NULL, '委内瑞拉', 'VEN');
INSERT INTO `st_region_city` VALUES (8318, 'Venezuela', NULL, 'Estado Nueva Esparta', NULL, 'O', '新埃斯帕塔', NULL, '委内瑞拉', 'VEN');
INSERT INTO `st_region_city` VALUES (8319, 'Venezuela', NULL, 'Yaracuy', NULL, 'U', '亚拉奎', NULL, '委内瑞拉', 'VEN');
INSERT INTO `st_region_city` VALUES (8320, 'Venezuela', NULL, 'Amazonas', NULL, 'Z', '亚马孙', NULL, '委内瑞拉', 'VEN');
INSERT INTO `st_region_city` VALUES (8321, 'Uganda', NULL, 'Arua', NULL, 'ARU', '阿鲁阿', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8322, 'Uganda', NULL, 'Apac', NULL, 'APC', '阿帕克', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8323, 'Uganda', NULL, 'Adjumani', NULL, 'ADJ', '阿朱马尼', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8324, 'Uganda', NULL, 'Bundibugyo', NULL, 'BUN', '本迪布焦', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8325, 'Uganda', NULL, 'Bugiri', NULL, 'BUG', '布吉里', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8326, 'Uganda', NULL, 'Busia', NULL, 'BUS', '布西亚', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8327, 'Uganda', NULL, 'Bushenyi', NULL, 'BSH', '布谢尼', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8328, 'Uganda', NULL, 'Ntungamo', NULL, 'NTU', '恩通加莫', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8329, 'Uganda', NULL, 'Gulu', NULL, 'GUL', '古卢', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8330, 'Uganda', NULL, 'Hoima', NULL, 'HOI', '霍伊马', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8331, 'Uganda', NULL, 'Kibaale', NULL, 'KBA', '基巴莱', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8332, 'Uganda', NULL, 'Kiboga', NULL, 'KIB', '基博加', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8333, 'Uganda', NULL, 'Kyenjojo', NULL, 'KYE', '基恩乔乔', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8334, 'Uganda', NULL, 'Kisoro', NULL, 'KIS', '基索罗', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8335, 'Uganda', NULL, 'Kitgum', NULL, 'KIT', '基特古姆', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8336, 'Uganda', NULL, 'Jinja', NULL, 'JIN', '金贾', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8337, 'Uganda', NULL, 'Kabale', NULL, 'KBL', '卡巴莱', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8338, 'Uganda', NULL, 'Kabarole', NULL, 'KAR', '卡巴罗莱', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8339, 'Uganda', NULL, 'Kaberamaido', NULL, 'KAB', '卡贝拉马伊多', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8340, 'Uganda', NULL, 'Kalangala', NULL, 'KAL', '卡兰加拉', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8341, 'Uganda', NULL, 'Kamwenge', NULL, 'KAM', '卡姆文盖', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8342, 'Uganda', NULL, 'Kamuli', NULL, 'KML', '卡穆利', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8343, 'Uganda', NULL, 'Kanungu', NULL, 'KAN', '卡农古', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8344, 'Uganda', NULL, 'Kapchorwa', NULL, 'KPC', '卡普乔鲁瓦', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8345, 'Uganda', NULL, 'Kasese', NULL, 'KAS', '卡塞塞', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8346, 'Uganda', NULL, 'Katakwi', NULL, 'KTK', '卡塔奎', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8347, 'Uganda', NULL, 'Kayunga', NULL, 'KAY', '卡永加', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8348, 'Uganda', NULL, 'Kampala', NULL, 'KMP', '坎帕拉', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8349, 'Uganda', NULL, 'Kotido', NULL, 'KOT', '科蒂多', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8350, 'Uganda', NULL, 'Kumi', NULL, 'KUM', '库米', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8351, 'Uganda', NULL, 'Rakai', NULL, 'RAK', '拉卡伊', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8352, 'Uganda', NULL, 'Lira', NULL, 'LIR', '利拉', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8353, 'Uganda', NULL, 'Luwero', NULL, 'LUW', '卢韦罗', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8354, 'Uganda', NULL, 'Rukungiri', NULL, 'RUK', '鲁昆吉里', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8355, 'Uganda', NULL, 'Masaka', NULL, 'MAS', '马萨卡', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8356, 'Uganda', NULL, 'Masindi', NULL, 'MSN', '马辛迪', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8357, 'Uganda', NULL, 'Mayuge', NULL, 'MAY', '马尤盖', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8358, 'Uganda', NULL, 'Moroto', NULL, 'MRT', '莫罗托', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8359, 'Uganda', NULL, 'Moyo', NULL, 'MOY', '莫约', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8360, 'Uganda', NULL, 'Mbarara', NULL, 'MBR', '姆巴拉拉', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8361, 'Uganda', NULL, 'Mbale', NULL, 'MBA', '姆巴莱', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8362, 'Uganda', NULL, 'Mpigi', NULL, 'MPI', '姆皮吉', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8363, 'Uganda', NULL, 'Mubende', NULL, 'MUB', '穆本德', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8364, 'Uganda', NULL, 'Mukono', NULL, 'MUK', '穆科诺', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8365, 'Uganda', NULL, 'Nakapiripirit', NULL, 'NAK', '纳卡皮里皮里特', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8366, 'Uganda', NULL, 'Nakasongola', NULL, 'NKS', '纳卡松戈拉', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8367, 'Uganda', NULL, 'Nebbi', NULL, 'NEB', '内比', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8368, 'Uganda', NULL, 'Pader', NULL, 'PAD', '帕德尔', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8369, 'Uganda', NULL, 'Pallisa', NULL, 'PAL', '帕利萨', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8370, 'Uganda', NULL, 'Sembabule', NULL, 'SEM', '森巴布莱', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8371, 'Uganda', NULL, 'Soroti', NULL, 'SOR', '索罗提', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8372, 'Uganda', NULL, 'Tororo', NULL, 'TOR', '托罗罗', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8373, 'Uganda', NULL, 'Wakiso', NULL, 'WAK', '瓦基索', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8374, 'Uganda', NULL, 'Sironko', NULL, 'SIR', '锡龙科', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8375, 'Uganda', NULL, 'Iganga', NULL, 'IGA', '伊甘加', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8376, 'Uganda', NULL, 'Yumbe', NULL, 'YUM', '永贝', NULL, '乌干达', 'UGA');
INSERT INTO `st_region_city` VALUES (8377, 'Ukraine', NULL, 'Odessa', NULL, '51', '敖德萨', NULL, '乌克兰', 'UKR');
INSERT INTO `st_region_city` VALUES (8378, 'Ukraine', NULL, 'Poltava', NULL, '53', '波尔塔瓦', NULL, '乌克兰', 'UKR');
INSERT INTO `st_region_city` VALUES (8379, 'Ukraine', NULL, 'Dnipropetrovsk', NULL, '12', '第聂伯罗波得罗夫斯克', NULL, '乌克兰', 'UKR');
INSERT INTO `st_region_city` VALUES (8380, 'Ukraine', NULL, 'Donetsk', NULL, '14', '顿涅茨克', NULL, '乌克兰', 'UKR');
INSERT INTO `st_region_city` VALUES (8381, 'Ukraine', NULL, 'Kharkiv', NULL, '63', '哈尔科夫', NULL, '乌克兰', 'UKR');
INSERT INTO `st_region_city` VALUES (8382, 'Ukraine', NULL, 'Khersonsrka', NULL, '65', '赫尔松州', NULL, '乌克兰', 'UKR');
INSERT INTO `st_region_city` VALUES (8383, 'Ukraine', NULL, 'Khmelnytsky', NULL, '68', '赫梅利尼茨基', NULL, '乌克兰', 'UKR');
INSERT INTO `st_region_city` VALUES (8384, 'Ukraine', NULL, 'Kyiv', NULL, '30', '基辅', NULL, '乌克兰', 'UKR');
INSERT INTO `st_region_city` VALUES (8385, 'Ukraine', NULL, 'Kirovohrad', NULL, '35', '基洛夫格勒', NULL, '乌克兰', 'UKR');
INSERT INTO `st_region_city` VALUES (8386, 'Ukraine', NULL, 'Ternopil', NULL, '61', '捷尔诺波尔', NULL, '乌克兰', 'UKR');
INSERT INTO `st_region_city` VALUES (8387, 'Ukraine', NULL, 'Respublika Krym', NULL, '43', '克里米亚自治共和国', NULL, '乌克兰', 'UKR');
INSERT INTO `st_region_city` VALUES (8388, 'Ukraine', NULL, 'Lviv', NULL, '46', '利沃夫', NULL, '乌克兰', 'UKR');
INSERT INTO `st_region_city` VALUES (8389, 'Ukraine', NULL, 'Luhansk', NULL, '9', '卢甘斯克', NULL, '乌克兰', 'UKR');
INSERT INTO `st_region_city` VALUES (8390, 'Ukraine', NULL, 'Rivne', NULL, '56', '罗夫诺', NULL, '乌克兰', 'UKR');
INSERT INTO `st_region_city` VALUES (8391, 'Ukraine', NULL, 'Mykolayiv', NULL, '48', '尼古拉耶夫', NULL, '乌克兰', 'UKR');
INSERT INTO `st_region_city` VALUES (8392, 'Ukraine', NULL, 'Cherkasy', NULL, '71', '切尔卡瑟', NULL, '乌克兰', 'UKR');
INSERT INTO `st_region_city` VALUES (8393, 'Ukraine', NULL, 'Chernihiv', NULL, '74', '切尔尼戈夫', NULL, '乌克兰', 'UKR');
INSERT INTO `st_region_city` VALUES (8394, 'Ukraine', NULL, 'Chernivtsi', NULL, '77', '切尔诺夫策', NULL, '乌克兰', 'UKR');
INSERT INTO `st_region_city` VALUES (8395, 'Ukraine', NULL, 'Zhytomyr', NULL, '18', '日托米尔', NULL, '乌克兰', 'UKR');
INSERT INTO `st_region_city` VALUES (8396, 'Ukraine', NULL, 'Sumy', NULL, '59', '苏梅', NULL, '乌克兰', 'UKR');
INSERT INTO `st_region_city` VALUES (8397, 'Ukraine', NULL, 'Zakarpatska', NULL, '21', '外喀尔巴阡', NULL, '乌克兰', 'UKR');
INSERT INTO `st_region_city` VALUES (8398, 'Ukraine', NULL, 'Vinnytsya', NULL, '5', '文尼察', NULL, '乌克兰', 'UKR');
INSERT INTO `st_region_city` VALUES (8399, 'Ukraine', NULL, 'Volyn', NULL, '7', '沃伦', NULL, '乌克兰', 'UKR');
INSERT INTO `st_region_city` VALUES (8400, 'Ukraine', NULL, 'Ivano-Frankivsk', NULL, '26', '伊万－弗兰科夫州', NULL, '乌克兰', 'UKR');
INSERT INTO `st_region_city` VALUES (8401, 'Ukraine', NULL, 'Zaporizhzhya', NULL, '23', '扎波罗热', NULL, '乌克兰', 'UKR');
INSERT INTO `st_region_city` VALUES (8402, 'Uruguay', NULL, 'Artigas', NULL, 'AR', '阿蒂加斯', NULL, '乌拉圭', 'URY');
INSERT INTO `st_region_city` VALUES (8403, 'Uruguay', NULL, 'Durazno', NULL, 'DU', '杜拉斯诺', NULL, '乌拉圭', 'URY');
INSERT INTO `st_region_city` VALUES (8404, 'Uruguay', NULL, 'Florida', NULL, 'FA', '佛罗里达', NULL, '乌拉圭', 'URY');
INSERT INTO `st_region_city` VALUES (8405, 'Uruguay', NULL, 'Flores', NULL, 'FS', '弗洛雷斯', NULL, '乌拉圭', 'URY');
INSERT INTO `st_region_city` VALUES (8406, 'Uruguay', NULL, 'Canelones', NULL, 'CA', '卡内洛内斯', NULL, '乌拉圭', 'URY');
INSERT INTO `st_region_city` VALUES (8407, 'Uruguay', NULL, 'Colonia', NULL, 'CO', '科洛尼亚', NULL, '乌拉圭', 'URY');
INSERT INTO `st_region_city` VALUES (8408, 'Uruguay', NULL, 'Lavalleja', NULL, 'LA', '拉瓦耶哈', NULL, '乌拉圭', 'URY');
INSERT INTO `st_region_city` VALUES (8409, 'Uruguay', NULL, 'Rivera', NULL, 'RV', '里韦拉', NULL, '乌拉圭', 'URY');
INSERT INTO `st_region_city` VALUES (8410, 'Uruguay', NULL, 'Rocha', NULL, 'RO', '罗恰', NULL, '乌拉圭', 'URY');
INSERT INTO `st_region_city` VALUES (8411, 'Uruguay', NULL, 'Maldonado', NULL, 'MA', '马尔多纳多', NULL, '乌拉圭', 'URY');
INSERT INTO `st_region_city` VALUES (8412, 'Uruguay', NULL, 'Montevideo', NULL, 'MO', '蒙得维的亚', NULL, '乌拉圭', 'URY');
INSERT INTO `st_region_city` VALUES (8413, 'Uruguay', NULL, 'Rio Negro', NULL, 'RN', '内格罗河', NULL, '乌拉圭', 'URY');
INSERT INTO `st_region_city` VALUES (8414, 'Uruguay', NULL, 'Paysandu', NULL, 'PA', '派桑杜', NULL, '乌拉圭', 'URY');
INSERT INTO `st_region_city` VALUES (8415, 'Uruguay', NULL, 'Salto', NULL, 'SL', '萨尔托', NULL, '乌拉圭', 'URY');
INSERT INTO `st_region_city` VALUES (8416, 'Uruguay', NULL, 'Cerro Largo', NULL, 'CL', '塞罗拉尔戈', NULL, '乌拉圭', 'URY');
INSERT INTO `st_region_city` VALUES (8417, 'Uruguay', NULL, 'Treinta y Tres', NULL, 'TT', '三十三人', NULL, '乌拉圭', 'URY');
INSERT INTO `st_region_city` VALUES (8418, 'Uruguay', NULL, 'San Jose', NULL, 'SJ', '圣何塞', NULL, '乌拉圭', 'URY');
INSERT INTO `st_region_city` VALUES (8419, 'Uruguay', NULL, 'Soriano', NULL, 'SO', '索里亚诺', NULL, '乌拉圭', 'URY');
INSERT INTO `st_region_city` VALUES (8420, 'Uruguay', NULL, 'Tacuarembo', NULL, 'TAW', '塔夸伦博', NULL, '乌拉圭', 'URY');
INSERT INTO `st_region_city` VALUES (8421, 'Uzbekistan', NULL, 'Andijon', NULL, 'AN', '安集延', NULL, '乌兹别克斯坦', 'UZB');
INSERT INTO `st_region_city` VALUES (8422, 'Uzbekistan', NULL, 'Buxoro', NULL, 'BU', '布哈拉', NULL, '乌兹别克斯坦', 'UZB');
INSERT INTO `st_region_city` VALUES (8423, 'Uzbekistan', NULL, 'Fargona', NULL, 'FA', '费尔干纳', NULL, '乌兹别克斯坦', 'UZB');
INSERT INTO `st_region_city` VALUES (8424, 'Uzbekistan', NULL, 'Xorazm', NULL, 'XO', '花拉子模', NULL, '乌兹别克斯坦', 'UZB');
INSERT INTO `st_region_city` VALUES (8425, 'Uzbekistan', NULL, 'Jizzax', NULL, 'JI', '吉扎克', NULL, '乌兹别克斯坦', 'UZB');
INSERT INTO `st_region_city` VALUES (8426, 'Uzbekistan', NULL, 'Qoraqalpogiston', NULL, 'QR', '卡拉卡尔帕克斯坦共和国', NULL, '乌兹别克斯坦', 'UZB');
INSERT INTO `st_region_city` VALUES (8427, 'Uzbekistan', NULL, 'Qasqadaryo', NULL, 'QA', '卡什卡达里亚', NULL, '乌兹别克斯坦', 'UZB');
INSERT INTO `st_region_city` VALUES (8428, 'Uzbekistan', NULL, 'Namangan', NULL, 'NG', '纳曼干', NULL, '乌兹别克斯坦', 'UZB');
INSERT INTO `st_region_city` VALUES (8429, 'Uzbekistan', NULL, 'Navoiy', NULL, 'NW', '纳沃伊', NULL, '乌兹别克斯坦', 'UZB');
INSERT INTO `st_region_city` VALUES (8430, 'Uzbekistan', NULL, 'Samarqand', NULL, 'SA', '撒马尔罕', NULL, '乌兹别克斯坦', 'UZB');
INSERT INTO `st_region_city` VALUES (8431, 'Uzbekistan', NULL, 'Surxondaryo', NULL, 'SU', '苏尔汉河', NULL, '乌兹别克斯坦', 'UZB');
INSERT INTO `st_region_city` VALUES (8432, 'Uzbekistan', NULL, 'Toshkent', NULL, 'TK', '塔什干', NULL, '乌兹别克斯坦', 'UZB');
INSERT INTO `st_region_city` VALUES (8433, 'Uzbekistan', NULL, 'Toshkent Shahri', NULL, 'TO', '塔什干市', NULL, '乌兹别克斯坦', 'UZB');
INSERT INTO `st_region_city` VALUES (8434, 'Uzbekistan', NULL, 'Sirdaryo', NULL, 'SI', '锡尔河', NULL, '乌兹别克斯坦', 'UZB');
INSERT INTO `st_region_city` VALUES (8435, 'Spain', NULL, 'Almeria', NULL, 'LEI', '阿尔梅里亚', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8436, 'Spain', NULL, 'Albacete', NULL, 'ALB', '阿尔瓦塞特', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8437, 'Spain', NULL, 'Alava', NULL, 'ALA', '阿拉瓦', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8438, 'Spain', NULL, 'Alicante', NULL, 'ALC', '阿利坎特', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8439, 'Spain', NULL, 'Asturias', NULL, 'AST', '阿斯图利亚斯', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8440, 'Spain', NULL, 'Avila', NULL, 'AVI', '阿维拉', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8441, 'Spain', NULL, 'Orense', NULL, 'ORE', '奥伦塞', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8442, 'Spain', NULL, 'Badajoz', NULL, 'BJZ', '巴达霍斯', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8443, 'Spain', NULL, 'Baleares', NULL, 'BLR', '巴利阿里', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8444, 'Spain', NULL, 'Valladolid', NULL, 'VLL', '巴利亚多利德', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8445, 'Spain', NULL, 'Valencia', NULL, 'VLC', '巴伦西亚', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8446, 'Spain', NULL, 'Barcelona', NULL, 'BCN', '巴塞罗那', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8447, 'Spain', NULL, 'Vizcaya', NULL, 'VSE', '比斯开', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8448, 'Spain', NULL, 'Burgos', NULL, 'BUR', '布尔戈斯', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8449, 'Spain', NULL, 'Granada', NULL, 'GRX', '格拉纳达', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8450, 'Spain', NULL, 'Guadalajara', NULL, 'GUA', '瓜达拉哈拉', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8451, 'Spain', NULL, 'Jaen', NULL, 'JAE', '哈恩', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8452, 'Spain', NULL, 'Gerona', NULL, 'GRO', '赫罗纳', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8453, 'Spain', NULL, 'Guipuzcoa', NULL, 'GUI', '吉普斯夸', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8454, 'Spain', NULL, 'Cadiz', NULL, 'CAD', '加的斯', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8455, 'Spain', NULL, 'Caceres', NULL, 'CCS', '卡塞雷斯', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8456, 'Spain', NULL, 'Cludad Real', NULL, 'CIR', '卡斯蒂利亚', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8457, 'Spain', NULL, 'Castellon', NULL, 'CAS', '卡斯特利翁', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8458, 'Spain', NULL, 'Cordoba', NULL, 'ODB', '科尔多瓦', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8459, 'Spain', NULL, 'Cuenca', NULL, 'CUE', '昆卡', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8460, 'Spain', NULL, 'La Coruna', NULL, 'LCG', '拉科鲁尼亚', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8461, 'Spain', NULL, 'La Rioja', NULL, 'ARL', '拉里奥哈', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8462, 'Spain', NULL, 'Las Palmas', NULL, 'LPA', '拉斯帕尔马斯', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8463, 'Spain', NULL, 'Leon', NULL, 'LEN', '莱昂', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8464, 'Spain', NULL, 'Lleida', NULL, 'LLE', '莱里达', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8465, 'Spain', NULL, 'Provincia de Lugo', NULL, 'LGO', '卢戈', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8466, 'Spain', NULL, 'Madrid', NULL, 'MAD', '马德里', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8467, 'Spain', NULL, 'Malaga', NULL, 'AGP', '马拉加', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8468, 'Spain', NULL, 'Murcia', NULL, 'MJV', '穆尔西亚', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8469, 'Spain', NULL, 'Navarra', NULL, 'NVV', '纳瓦拉', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8470, 'Spain', NULL, 'Palencia', NULL, 'PAC', '帕伦西亚', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8471, 'Spain', NULL, 'Provincia de Pontevedra', NULL, 'PEV', '蓬特韦德拉', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8472, 'Spain', NULL, 'Zaragoza', NULL, 'ZAZ', '萨拉戈萨', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8473, 'Spain', NULL, 'Salamanca', NULL, 'SLM', '萨拉曼卡', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8474, 'Spain', NULL, 'Zamora', NULL, 'ZMR', '萨莫拉', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8475, 'Spain', NULL, 'Segovia', NULL, 'SEG', '塞哥维亚', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8476, 'Spain', NULL, 'Sevilla', NULL, 'SVQ', '塞维利亚', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8477, 'Spain', NULL, 'Santander', NULL, 'SDR', '桑坦德', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8478, 'Spain', NULL, 'Santa Cruz de Tenerife', NULL, 'SCT', '圣克鲁斯-德特内里费', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8479, 'Spain', NULL, 'Soria', NULL, 'SOR', '索里亚', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8480, 'Spain', NULL, 'Tarragona', NULL, 'TAR', '塔拉戈纳', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8481, 'Spain', NULL, 'Teruel', NULL, 'TER', '特鲁埃尔', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8482, 'Spain', NULL, 'Toledo', NULL, 'TOL', '托莱多', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8483, 'Spain', NULL, 'Huelva', NULL, 'HUV', '韦尔瓦', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8484, 'Spain', NULL, 'Huesca', NULL, 'HUC', '韦斯卡', NULL, '西班牙', 'ESP');
INSERT INTO `st_region_city` VALUES (8485, 'Greece', NULL, 'Peiraievs', NULL, 'PRI', '比雷埃夫斯', NULL, '希腊', 'GRC');
INSERT INTO `st_region_city` VALUES (8486, 'Greece', NULL, 'Dodecanese', NULL, 'DO', '多德卡尼斯', NULL, '希腊', 'GRC');
INSERT INTO `st_region_city` VALUES (8487, 'Greece', NULL, 'Chanion', NULL, 'CHQ', '干尼亚', NULL, '希腊', 'GRC');
INSERT INTO `st_region_city` VALUES (8488, 'Greece', NULL, 'Cyclades', NULL, 'CY', '基克拉迪', NULL, '希腊', 'GRC');
INSERT INTO `st_region_city` VALUES (8489, 'Greece', NULL, 'Lasithiou', NULL, 'LST', '拉西锡', NULL, '希腊', 'GRC');
INSERT INTO `st_region_city` VALUES (8490, 'Greece', NULL, 'Lesbos', NULL, 'LES', '莱斯博斯', NULL, '希腊', 'GRC');
INSERT INTO `st_region_city` VALUES (8491, 'Greece', NULL, 'Rethymnis', NULL, 'RET', '雷西姆农', NULL, '希腊', 'GRC');
INSERT INTO `st_region_city` VALUES (8492, 'Greece', NULL, 'Samos', NULL, 'SMI', '萨摩斯', NULL, '希腊', 'GRC');
INSERT INTO `st_region_city` VALUES (8493, 'Greece', NULL, 'Athens', NULL, 'ATH', '雅典', NULL, '希腊', 'GRC');
INSERT INTO `st_region_city` VALUES (8494, 'Greece', NULL, 'Irakleiou', NULL, 'HER', '伊拉克里翁', NULL, '希腊', 'GRC');
INSERT INTO `st_region_city` VALUES (8495, 'New Zealand', NULL, 'Auckland', NULL, 'AUK', '奥克兰', NULL, '新西兰', 'NZL');
INSERT INTO `st_region_city` VALUES (8496, 'New Zealand', NULL, 'North Shore', NULL, 'NSH', '北岸', NULL, '新西兰', 'NZL');
INSERT INTO `st_region_city` VALUES (8497, 'New Zealand', NULL, 'Palmerston North', NULL, 'PMR', '北帕默斯顿', NULL, '新西兰', 'NZL');
INSERT INTO `st_region_city` VALUES (8498, 'New Zealand', NULL, 'Far North', NULL, 'FNR', '北远', NULL, '新西兰', 'NZL');
INSERT INTO `st_region_city` VALUES (8499, 'New Zealand', NULL, 'Blenheim', NULL, 'BHE', '布莱尼姆', NULL, '新西兰', 'NZL');
INSERT INTO `st_region_city` VALUES (8500, 'New Zealand', NULL, 'Dunedin', NULL, 'DUD', '达尼丁', NULL, '新西兰', 'NZL');
INSERT INTO `st_region_city` VALUES (8501, 'New Zealand', NULL, 'Greymouth', NULL, 'GMN', '格雷茅斯', NULL, '新西兰', 'NZL');
INSERT INTO `st_region_city` VALUES (8502, 'New Zealand', NULL, 'Hamilton', NULL, 'HLZ', '哈密尔顿', NULL, '新西兰', 'NZL');
INSERT INTO `st_region_city` VALUES (8503, 'New Zealand', NULL, 'Hastings', NULL, 'HAS', '黑斯廷斯', NULL, '新西兰', 'NZL');
INSERT INTO `st_region_city` VALUES (8504, 'New Zealand', NULL, 'Waitakere', NULL, 'WAE', '怀塔科拉', NULL, '新西兰', 'NZL');
INSERT INTO `st_region_city` VALUES (8505, 'New Zealand', NULL, 'Gisborne', NULL, 'GIS', '吉斯伯恩', NULL, '新西兰', 'NZL');
INSERT INTO `st_region_city` VALUES (8506, 'New Zealand', NULL, 'Kaipara', NULL, 'KAI', '凯帕拉', NULL, '新西兰', 'NZL');
INSERT INTO `st_region_city` VALUES (8507, 'New Zealand', NULL, 'Christchurch', NULL, 'CHC', '克赖斯特彻奇', NULL, '新西兰', 'NZL');
INSERT INTO `st_region_city` VALUES (8508, 'New Zealand', NULL, 'Richmond', NULL, 'RMD', '里士满', NULL, '新西兰', 'NZL');
INSERT INTO `st_region_city` VALUES (8509, 'New Zealand', NULL, 'Manukau', NULL, 'MNK', '马努考', NULL, '新西兰', 'NZL');
INSERT INTO `st_region_city` VALUES (8510, 'New Zealand', NULL, 'Nelson', NULL, 'NSN', '纳尔逊', NULL, '新西兰', 'NZL');
INSERT INTO `st_region_city` VALUES (8511, 'New Zealand', NULL, 'Napier', NULL, 'NPE', '内皮尔', NULL, '新西兰', 'NZL');
INSERT INTO `st_region_city` VALUES (8512, 'New Zealand', NULL, 'Stratford', NULL, 'STR', '斯特拉特福德', NULL, '新西兰', 'NZL');
INSERT INTO `st_region_city` VALUES (8513, 'New Zealand', NULL, 'Taumarunui', NULL, 'TAU', '陶马鲁努伊', NULL, '新西兰', 'NZL');
INSERT INTO `st_region_city` VALUES (8514, 'New Zealand', NULL, 'Whakatane', NULL, 'WHK', '瓦卡塔尼', NULL, '新西兰', 'NZL');
INSERT INTO `st_region_city` VALUES (8515, 'New Zealand', NULL, 'Whangarei', NULL, 'WRE', '旺阿雷', NULL, '新西兰', 'NZL');
INSERT INTO `st_region_city` VALUES (8516, 'New Zealand', NULL, 'Wanganui', NULL, 'WAG', '旺格努伊', NULL, '新西兰', 'NZL');
INSERT INTO `st_region_city` VALUES (8517, 'New Zealand', NULL, 'New Plymouth', NULL, 'NPL', '新普利茅斯', NULL, '新西兰', 'NZL');
INSERT INTO `st_region_city` VALUES (8518, 'New Zealand', NULL, 'Invercargill', NULL, 'IVC', '因弗卡吉尔', NULL, '新西兰', 'NZL');
INSERT INTO `st_region_city` VALUES (8519, 'Hungary', NULL, 'Baranya', NULL, 'BA', '巴兰尼亚', NULL, '匈牙利', 'HUN');
INSERT INTO `st_region_city` VALUES (8520, 'Hungary', NULL, 'Bacs-Kiskun', NULL, 'BK', '巴奇-基什孔', NULL, '匈牙利', 'HUN');
INSERT INTO `st_region_city` VALUES (8521, 'Hungary', NULL, 'Borsod-Abauj-Zemplen', NULL, 'BZ', '包尔绍德-奥包乌伊-曾普伦', NULL, '匈牙利', 'HUN');
INSERT INTO `st_region_city` VALUES (8522, 'Hungary', NULL, 'Bekes', NULL, 'BE', '贝凯什', NULL, '匈牙利', 'HUN');
INSERT INTO `st_region_city` VALUES (8523, 'Hungary', NULL, 'Budapest', NULL, 'BU', '布达佩斯', NULL, '匈牙利', 'HUN');
INSERT INTO `st_region_city` VALUES (8524, 'Hungary', NULL, 'Fejer', NULL, 'FE', '费耶尔', NULL, '匈牙利', 'HUN');
INSERT INTO `st_region_city` VALUES (8525, 'Hungary', NULL, 'Hajdu-Bihar', NULL, 'HB', '豪伊杜-比豪尔', NULL, '匈牙利', 'HUN');
INSERT INTO `st_region_city` VALUES (8526, 'Hungary', NULL, 'Heves', NULL, 'HE', '赫维什', NULL, '匈牙利', 'HUN');
INSERT INTO `st_region_city` VALUES (8527, 'Hungary', NULL, 'Jasz-Nagykun-Szolnok', NULL, 'JN', '加兹-纳杰孔-索尔诺克', NULL, '匈牙利', 'HUN');
INSERT INTO `st_region_city` VALUES (8528, 'Hungary', NULL, 'Gyor-Moson-Sopron', NULL, 'GS', '杰尔-莫松-肖普朗', NULL, '匈牙利', 'HUN');
INSERT INTO `st_region_city` VALUES (8529, 'Hungary', NULL, 'Komarom-Esztergom', NULL, 'KE', '科马罗姆', NULL, '匈牙利', 'HUN');
INSERT INTO `st_region_city` VALUES (8530, 'Hungary', NULL, 'Nograd', NULL, 'NO', '诺格拉德', NULL, '匈牙利', 'HUN');
INSERT INTO `st_region_city` VALUES (8531, 'Hungary', NULL, 'Pest', NULL, 'PE', '佩斯', NULL, '匈牙利', 'HUN');
INSERT INTO `st_region_city` VALUES (8532, 'Hungary', NULL, 'Csongrad', NULL, 'CS', '琼格拉德', NULL, '匈牙利', 'HUN');
INSERT INTO `st_region_city` VALUES (8533, 'Hungary', NULL, 'Somogy', NULL, 'SO', '绍莫吉', NULL, '匈牙利', 'HUN');
INSERT INTO `st_region_city` VALUES (8534, 'Hungary', NULL, 'Szabolcs-Szatmar-Bereg', NULL, 'SZ', '索博尔奇-索特马尔-贝拉格', NULL, '匈牙利', 'HUN');
INSERT INTO `st_region_city` VALUES (8535, 'Hungary', NULL, 'Tolna', NULL, 'TO', '托尔瑙', NULL, '匈牙利', 'HUN');
INSERT INTO `st_region_city` VALUES (8536, 'Hungary', NULL, 'Veszprem', NULL, 'VE', '维斯普雷姆', NULL, '匈牙利', 'HUN');
INSERT INTO `st_region_city` VALUES (8537, 'Hungary', NULL, 'Vas', NULL, 'VA', '沃什', NULL, '匈牙利', 'HUN');
INSERT INTO `st_region_city` VALUES (8538, 'Hungary', NULL, 'Zala', NULL, 'ZA', '佐洛', NULL, '匈牙利', 'HUN');
INSERT INTO `st_region_city` VALUES (8539, 'Syria', NULL, 'Halab', NULL, 'HL', '阿勒颇', NULL, '叙利亚', 'SYR');
INSERT INTO `st_region_city` VALUES (8540, 'Syria', NULL, 'Rif Dimashq', NULL, 'RD', '大马士革', NULL, '叙利亚', 'SYR');
INSERT INTO `st_region_city` VALUES (8541, 'Syria', NULL, 'Madinat Dimashq', NULL, 'DI', '大马士革市', NULL, '叙利亚', 'SYR');
INSERT INTO `st_region_city` VALUES (8542, 'Syria', NULL, 'Dayr az Zawr', NULL, 'DZ', '代尔祖尔', NULL, '叙利亚', 'SYR');
INSERT INTO `st_region_city` VALUES (8543, 'Syria', NULL, 'Dara', NULL, 'DA', '德拉', NULL, '叙利亚', 'SYR');
INSERT INTO `st_region_city` VALUES (8544, 'Syria', NULL, 'Hamah', NULL, 'HM', '哈马', NULL, '叙利亚', 'SYR');
INSERT INTO `st_region_city` VALUES (8545, 'Syria', NULL, 'Al Hasakah', NULL, 'HA', '哈塞克', NULL, '叙利亚', 'SYR');
INSERT INTO `st_region_city` VALUES (8546, 'Syria', NULL, 'Hims', NULL, 'HI', '霍姆斯', NULL, '叙利亚', 'SYR');
INSERT INTO `st_region_city` VALUES (8547, 'Syria', NULL, 'Al Ghab', NULL, 'GH', '加布', NULL, '叙利亚', 'SYR');
INSERT INTO `st_region_city` VALUES (8548, 'Syria', NULL, 'Al-Qamishli', NULL, 'QA', '卡米什利', NULL, '叙利亚', 'SYR');
INSERT INTO `st_region_city` VALUES (8549, 'Syria', NULL, 'Al Qunaytirah', NULL, 'QU', '库奈特拉', NULL, '叙利亚', 'SYR');
INSERT INTO `st_region_city` VALUES (8550, 'Syria', NULL, 'Ar Raqqah', NULL, 'RQ', '拉卡', NULL, '叙利亚', 'SYR');
INSERT INTO `st_region_city` VALUES (8551, 'Syria', NULL, 'Al Ladhiqiyah', NULL, 'LA', '拉塔基亚', NULL, '叙利亚', 'SYR');
INSERT INTO `st_region_city` VALUES (8552, 'Syria', NULL, 'As Suwayda', NULL, 'SU', '苏韦达', NULL, '叙利亚', 'SYR');
INSERT INTO `st_region_city` VALUES (8553, 'Syria', NULL, 'Tartus', NULL, 'TA', '塔尔图斯', NULL, '叙利亚', 'SYR');
INSERT INTO `st_region_city` VALUES (8554, 'Syria', NULL, 'Idlib', NULL, 'ID', '伊德利卜', NULL, '叙利亚', 'SYR');
INSERT INTO `st_region_city` VALUES (8555, 'Jamaica', NULL, 'Portland', NULL, 'POR', '波特兰', NULL, '牙买加', 'JAM');
INSERT INTO `st_region_city` VALUES (8556, 'Jamaica', NULL, 'Hanover', NULL, 'HAN', '汉诺威', NULL, '牙买加', 'JAM');
INSERT INTO `st_region_city` VALUES (8557, 'Jamaica', NULL, 'Kingston', NULL, 'KIN', '金斯敦', NULL, '牙买加', 'JAM');
INSERT INTO `st_region_city` VALUES (8558, 'Jamaica', NULL, 'Clarendon', NULL, 'CLA', '克拉伦登', NULL, '牙买加', 'JAM');
INSERT INTO `st_region_city` VALUES (8559, 'Jamaica', NULL, 'Manchester', NULL, 'MAN', '曼彻斯特', NULL, '牙买加', 'JAM');
INSERT INTO `st_region_city` VALUES (8560, 'Jamaica', NULL, 'St. Andrews', NULL, 'AND', '圣安德鲁斯', NULL, '牙买加', 'JAM');
INSERT INTO `st_region_city` VALUES (8561, 'Jamaica', NULL, 'St. Ann', NULL, 'ANN', '圣安娜', NULL, '牙买加', 'JAM');
INSERT INTO `st_region_city` VALUES (8562, 'Jamaica', NULL, 'St. Catherine', NULL, 'CAT', '圣凯瑟琳', NULL, '牙买加', 'JAM');
INSERT INTO `st_region_city` VALUES (8563, 'Jamaica', NULL, 'St. Mary', NULL, 'MAR', '圣玛丽', NULL, '牙买加', 'JAM');
INSERT INTO `st_region_city` VALUES (8564, 'Jamaica', NULL, 'St. Thomas', NULL, 'THO', '圣托马斯', NULL, '牙买加', 'JAM');
INSERT INTO `st_region_city` VALUES (8565, 'Jamaica', NULL, 'St. Elizabeth', NULL, 'ELI', '圣伊丽莎白', NULL, '牙买加', 'JAM');
INSERT INTO `st_region_city` VALUES (8566, 'Jamaica', NULL, 'St. James', NULL, 'JAM', '圣詹姆斯', NULL, '牙买加', 'JAM');
INSERT INTO `st_region_city` VALUES (8567, 'Jamaica', NULL, 'Trelawny', NULL, 'TRL', '特里洛尼', NULL, '牙买加', 'JAM');
INSERT INTO `st_region_city` VALUES (8568, 'Jamaica', NULL, 'Westmoreland', NULL, 'WML', '西摩兰', NULL, '牙买加', 'JAM');
INSERT INTO `st_region_city` VALUES (8569, 'Armenia', NULL, 'Armavir', NULL, 'ARM', '阿尔马维尔', NULL, '亚美尼亚', 'ARM');
INSERT INTO `st_region_city` VALUES (8570, 'Armenia', NULL, 'Aragacotn', NULL, 'AGT', '阿拉加措特恩', NULL, '亚美尼亚', 'ARM');
INSERT INTO `st_region_city` VALUES (8571, 'Armenia', NULL, 'Ararat', NULL, 'ARA', '阿拉拉特', NULL, '亚美尼亚', 'ARM');
INSERT INTO `st_region_city` VALUES (8572, 'Armenia', NULL, 'Yerevan', NULL, 'EVN', '埃里温市', NULL, '亚美尼亚', 'ARM');
INSERT INTO `st_region_city` VALUES (8573, 'Armenia', NULL, 'Gelarkunik', NULL, 'GEG', '格加尔库尼克', NULL, '亚美尼亚', 'ARM');
INSERT INTO `st_region_city` VALUES (8574, 'Armenia', NULL, 'Kotayk', NULL, 'KOT', '科泰克', NULL, '亚美尼亚', 'ARM');
INSERT INTO `st_region_city` VALUES (8575, 'Armenia', NULL, 'Lorri', NULL, 'LOR', '洛里', NULL, '亚美尼亚', 'ARM');
INSERT INTO `st_region_city` VALUES (8576, 'Armenia', NULL, 'Tavus', NULL, 'TAV', '塔武什', NULL, '亚美尼亚', 'ARM');
INSERT INTO `st_region_city` VALUES (8577, 'Armenia', NULL, 'VayocJor', NULL, 'VAY', '瓦约茨·佐尔', NULL, '亚美尼亚', 'ARM');
INSERT INTO `st_region_city` VALUES (8578, 'Armenia', NULL, 'Shirak', NULL, 'SHI', '希拉克', NULL, '亚美尼亚', 'ARM');
INSERT INTO `st_region_city` VALUES (8579, 'Armenia', NULL, 'Syunik', NULL, 'SYU', '休尼克', NULL, '亚美尼亚', 'ARM');
INSERT INTO `st_region_city` VALUES (8580, 'Yemen', NULL, 'Abyan', NULL, 'AB', '阿比扬', NULL, '也门', 'YEM');
INSERT INTO `st_region_city` VALUES (8581, 'Yemen', NULL, 'Amran Sana', NULL, 'AM', '阿姆兰', NULL, '也门', 'YEM');
INSERT INTO `st_region_city` VALUES (8582, 'Yemen', NULL, 'Al-Bayda', NULL, 'BA', '贝达', NULL, '也门', 'YEM');
INSERT INTO `st_region_city` VALUES (8583, 'Yemen', NULL, 'Ad-Dali', NULL, 'DA', '达利', NULL, '也门', 'YEM');
INSERT INTO `st_region_city` VALUES (8584, 'Yemen', NULL, 'Hadramawt', NULL, 'HD', '哈德拉毛', NULL, '也门', 'YEM');
INSERT INTO `st_region_city` VALUES (8585, 'Yemen', NULL, 'Hajjah', NULL, 'HJ', '哈杰', NULL, '也门', 'YEM');
INSERT INTO `st_region_city` VALUES (8586, 'Yemen', NULL, 'Al-Hudaydah', NULL, 'HU', '荷台达', NULL, '也门', 'YEM');
INSERT INTO `st_region_city` VALUES (8587, 'Yemen', NULL, 'Al-Jawf', NULL, 'JA', '焦夫', NULL, '也门', 'YEM');
INSERT INTO `st_region_city` VALUES (8588, 'Yemen', NULL, 'Lahij', NULL, 'LA', '拉赫季', NULL, '也门', 'YEM');
INSERT INTO `st_region_city` VALUES (8589, 'Yemen', NULL, 'Marib', NULL, 'MA', '马里卜', NULL, '也门', 'YEM');
INSERT INTO `st_region_city` VALUES (8590, 'Yemen', NULL, 'Al-Mahrah', NULL, 'MR', '迈赫拉', NULL, '也门', 'YEM');
INSERT INTO `st_region_city` VALUES (8591, 'Yemen', NULL, 'Al-Mahwit', NULL, 'MW', '迈赫维特', NULL, '也门', 'YEM');
INSERT INTO `st_region_city` VALUES (8592, 'Yemen', NULL, 'Sadah', NULL, 'SD', '萨达', NULL, '也门', 'YEM');
INSERT INTO `st_region_city` VALUES (8593, 'Yemen', NULL, 'Sana', NULL, 'SN', '萨那', NULL, '也门', 'YEM');
INSERT INTO `st_region_city` VALUES (8594, 'Yemen', NULL, 'Seiyun', NULL, 'GXF', '赛文', NULL, '也门', 'YEM');
INSERT INTO `st_region_city` VALUES (8595, 'Yemen', NULL, 'Shabwah', NULL, 'SH', '舍卜沃', NULL, '也门', 'YEM');
INSERT INTO `st_region_city` VALUES (8596, 'Yemen', NULL, 'Taizz', NULL, 'TA', '塔伊兹', NULL, '也门', 'YEM');
INSERT INTO `st_region_city` VALUES (8597, 'Yemen', NULL, 'Ash-Shihr', NULL, 'ASR', '希赫尔', NULL, '也门', 'YEM');
INSERT INTO `st_region_city` VALUES (8598, 'Yemen', NULL, 'Adan', NULL, 'AD', '亚丁', NULL, '也门', 'YEM');
INSERT INTO `st_region_city` VALUES (8599, 'Yemen', NULL, 'Ibb', NULL, 'IB', '伊卜', NULL, '也门', 'YEM');
INSERT INTO `st_region_city` VALUES (8600, 'Yemen', NULL, 'Dhamar', NULL, 'DH', '扎玛尔', NULL, '也门', 'YEM');
INSERT INTO `st_region_city` VALUES (8601, 'Israel', NULL, 'Ashdod', NULL, 'ASH', '阿什杜德', NULL, '以色列', 'ISR');
INSERT INTO `st_region_city` VALUES (8602, 'Israel', NULL, 'Beersheba', NULL, 'BEV', '贝尔谢巴', NULL, '以色列', 'ISR');
INSERT INTO `st_region_city` VALUES (8603, 'Israel', NULL, 'Bat Yam', NULL, 'BAT', '贝特雁', NULL, '以色列', 'ISR');
INSERT INTO `st_region_city` VALUES (8604, 'Israel', NULL, 'Haifa', NULL, 'HFA', '海法', NULL, '以色列', 'ISR');
INSERT INTO `st_region_city` VALUES (8605, 'Israel', NULL, 'Holon', NULL, 'HOL', '霍隆', NULL, '以色列', 'ISR');
INSERT INTO `st_region_city` VALUES (8606, 'Israel', NULL, 'Netanya', NULL, 'NAT', '内坦亚', NULL, '以色列', 'ISR');
INSERT INTO `st_region_city` VALUES (8607, 'Israel', NULL, 'Tel Aviv-Yafo', NULL, 'TLV', '特拉维夫', NULL, '以色列', 'ISR');
INSERT INTO `st_region_city` VALUES (8608, 'Israel', NULL, 'Jerusalem', NULL, 'J', '耶路撒冷', NULL, '以色列', 'ISR');
INSERT INTO `st_region_city` VALUES (8609, 'Italy', NULL, 'Asti', NULL, 'AST', '阿斯蒂', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8610, 'Italy', NULL, 'Ascoli Piceno', NULL, 'ASP', '阿斯科利皮切诺', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8611, 'Italy', NULL, 'Ancona', NULL, 'AOI', '安科纳', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8612, 'Italy', NULL, 'Olbia-Tempio', NULL, 'OLB', '奥尔比亚', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8613, 'Italy', NULL, 'Oristano', NULL, 'QOS', '奥里斯塔诺', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8614, 'Italy', NULL, 'Aosta', NULL, 'AOT', '奥斯塔', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8615, 'Italy', NULL, 'Palermo', NULL, 'PMO', '巴勒莫', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8616, 'Italy', NULL, 'Bari', NULL, 'BRI', '巴里', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8617, 'Italy', NULL, 'Bergamo', NULL, 'BGO', '贝加莫', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8618, 'Italy', NULL, 'Benevento', NULL, 'BEN', '贝内文托', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8619, 'Italy', NULL, 'Pisa', NULL, 'PSA', '比萨', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8620, 'Italy', NULL, 'Pordenone', NULL, 'PRD', '波代诺内', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8621, 'Italy', NULL, 'Potenza', NULL, 'QPO', '波坦察', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8622, 'Italy', NULL, 'Bologna', NULL, 'BLQ', '博洛尼亚', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8623, 'Italy', NULL, 'Biella', NULL, 'BIE', '布拉', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8624, 'Italy', NULL, 'Brescia', NULL, 'BRC', '布雷西亚', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8625, 'Italy', NULL, 'Brindisi', NULL, 'BDS', '布林迪西', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8626, 'Italy', NULL, 'Trieste', NULL, 'TRS', '的里雅斯特', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8627, 'Italy', NULL, 'Turin', NULL, 'TRN', '都灵', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8628, 'Italy', NULL, 'Ferrara', NULL, 'FRR', '费拉拉', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8629, 'Italy', NULL, 'Firenze', NULL, 'FLR', '佛罗伦萨', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8630, 'Italy', NULL, 'Foggia', NULL, 'FOG', '福贾', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8631, 'Italy', NULL, 'Cagliari', NULL, 'CAG', '卡利亚里', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8632, 'Italy', NULL, 'Caserta', NULL, 'CST', '卡塞塔', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8633, 'Italy', NULL, 'Catania', NULL, 'CTA', '卡塔尼亚', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8634, 'Italy', NULL, 'Catanzaro', NULL, 'QCZ', '卡坦扎罗', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8635, 'Italy', NULL, 'Campobasso', NULL, 'COB', '坎波巴索', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8636, 'Italy', NULL, 'Como', NULL, 'CIY', '科摩', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8637, 'Italy', NULL, 'Cosenza', NULL, 'QCS', '科森扎', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8638, 'Italy', NULL, 'Crotone', NULL, 'CRV', '克罗托内', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8639, 'Italy', NULL, 'Cuneo', NULL, 'CUN', '库内奥', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8640, 'Italy', NULL, 'L\'Aquila', NULL, 'LAQ', '拉奎拉', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8641, 'Italy', NULL, 'La Spezia', NULL, 'SPE', '拉斯佩齐亚', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8642, 'Italy', NULL, 'Lecco', NULL, 'LCO', '莱科', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8643, 'Italy', NULL, 'Lecce', NULL, 'LCC', '莱切', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8644, 'Italy', NULL, 'Reggio Emilia', NULL, 'RNE', '雷焦艾米利亚', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8645, 'Italy', NULL, 'Reggio Calabria', NULL, 'REG', '雷焦卡拉布里亚', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8646, 'Italy', NULL, 'Livorno', NULL, 'LIV', '里窝那', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8647, 'Italy', NULL, 'Roma', NULL, 'ROM', '罗马', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8648, 'Italy', NULL, 'Massa-Carrara', NULL, 'MCR', '马萨', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8649, 'Italy', NULL, 'Matera', NULL, 'MTR', '马泰拉', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8650, 'Italy', NULL, 'Monza e Brianza', NULL, 'MZA', '蒙扎', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8651, 'Italy', NULL, 'Milano', NULL, 'MIL', '米兰', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8652, 'Italy', NULL, 'Modena', NULL, 'MOD', '摩德纳', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8653, 'Italy', NULL, 'Messina', NULL, 'MSN', '墨西拿', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8654, 'Italy', NULL, 'Naples', NULL, 'NAP', '那不勒斯', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8655, 'Italy', NULL, 'Nuoro', NULL, 'QNU', '努奥罗', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8656, 'Italy', NULL, 'Novara', NULL, 'NVR', '诺瓦拉', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8657, 'Italy', NULL, 'Parma', NULL, 'PMF', '帕尔马', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8658, 'Italy', NULL, 'Pavia', NULL, 'PAV', '帕维亚', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8659, 'Italy', NULL, 'Perugia', NULL, 'PEG', '佩鲁贾', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8660, 'Italy', NULL, 'Genova', NULL, 'CAX', '热那亚', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8661, 'Italy', NULL, 'Salerno', NULL, 'SAL', '萨莱诺', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8662, 'Italy', NULL, 'Sassari', NULL, 'QSS', '萨萨里', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8663, 'Italy', NULL, 'Savona', NULL, 'SVN', '萨沃纳', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8664, 'Italy', NULL, 'Taranto', NULL, 'TAR', '塔兰托', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8665, 'Italy', NULL, 'Trapani', NULL, 'TPS', '特拉帕尼', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8666, 'Italy', NULL, 'Trento', NULL, 'TRT', '特伦托', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8667, 'Italy', NULL, 'Venice', NULL, 'VCE', '威尼斯', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8668, 'Italy', NULL, 'Vercelli', NULL, 'VRL', '韦尔切利', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8669, 'Italy', NULL, 'Viterbo', NULL, 'VIT', '维泰博', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8670, 'Italy', NULL, 'Udine', NULL, 'UDN', '乌迪内', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8671, 'Italy', NULL, 'Syracuse', NULL, 'SYR', '锡拉库扎', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8672, 'Italy', NULL, 'Siena', NULL, 'SNA', '锡耶纳', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8673, 'Italy', NULL, 'Alessandria', NULL, 'ALE', '亚历山德里亚', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8674, 'Italy', NULL, 'Isernia', NULL, 'ISE', '伊塞尔尼亚', NULL, '意大利', 'ITA');
INSERT INTO `st_region_city` VALUES (8675, 'India', NULL, 'Aizawl', NULL, 'AJL', '艾藻尔', NULL, '印度', 'IND');
INSERT INTO `st_region_city` VALUES (8676, 'India', NULL, 'Bangalore', NULL, 'BLR', '班加罗尔', NULL, '印度', 'IND');
INSERT INTO `st_region_city` VALUES (8677, 'India', NULL, 'Pondicherry', NULL, 'PNY', '本地治里', NULL, '印度', 'IND');
INSERT INTO `st_region_city` VALUES (8678, 'India', NULL, 'Bhopal', NULL, 'BHO', '博帕尔', NULL, '印度', 'IND');
INSERT INTO `st_region_city` VALUES (8679, 'India', NULL, 'Bhubaneswar', NULL, 'BBI', '布巴内斯瓦尔', NULL, '印度', 'IND');
INSERT INTO `st_region_city` VALUES (8680, 'India', NULL, 'Chandigarh', NULL, 'IXC', '昌迪加尔', NULL, '印度', 'IND');
INSERT INTO `st_region_city` VALUES (8681, 'India', NULL, 'Daman', NULL, 'DAM', '达曼', NULL, '印度', 'IND');
INSERT INTO `st_region_city` VALUES (8682, 'India', NULL, 'Diu', NULL, 'DIU', '第乌', NULL, '印度', 'IND');
INSERT INTO `st_region_city` VALUES (8683, 'India', NULL, 'Gangtok', NULL, 'GTO', '甘托克', NULL, '印度', 'IND');
INSERT INTO `st_region_city` VALUES (8684, 'India', NULL, 'Coimbatore', NULL, 'CJB', '哥印拜陀', NULL, '印度', 'IND');
INSERT INTO `st_region_city` VALUES (8685, 'India', NULL, 'Calcutta', NULL, 'CCU', '加尔各答', NULL, '印度', 'IND');
INSERT INTO `st_region_city` VALUES (8686, 'India', NULL, 'Karaikal', NULL, 'KRK', '加里加尔', NULL, '印度', 'IND');
INSERT INTO `st_region_city` VALUES (8687, 'India', NULL, 'Jabalpur', NULL, 'JLR', '贾巴尔普尔', NULL, '印度', 'IND');
INSERT INTO `st_region_city` VALUES (8688, 'India', NULL, 'Jalandhar', NULL, 'JUC', '贾朗达尔', NULL, '印度', 'IND');
INSERT INTO `st_region_city` VALUES (8689, 'India', NULL, 'Jodhpur', NULL, 'JDH', '焦特布尔', NULL, '印度', 'IND');
INSERT INTO `st_region_city` VALUES (8690, 'India', NULL, 'Chennai', NULL, 'MAA', '金奈', NULL, '印度', 'IND');
INSERT INTO `st_region_city` VALUES (8691, 'India', NULL, 'Kavaratti', NULL, 'KVA', '卡瓦拉蒂', NULL, '印度', 'IND');
INSERT INTO `st_region_city` VALUES (8692, 'India', NULL, 'Kohima', NULL, 'KOM', '科希马', NULL, '印度', 'IND');
INSERT INTO `st_region_city` VALUES (8693, 'India', NULL, 'Mahe', NULL, 'MAH', '马埃', NULL, '印度', 'IND');
INSERT INTO `st_region_city` VALUES (8694, 'India', NULL, 'Madurai', NULL, 'IXM', '马杜赖', NULL, '印度', 'IND');
INSERT INTO `st_region_city` VALUES (8695, 'India', NULL, 'Sambalpur', NULL, 'SLR', '森伯尔布尔', NULL, '印度', 'IND');
INSERT INTO `st_region_city` VALUES (8696, 'India', NULL, 'Trivandrum', NULL, 'TRV', '特里凡得琅', NULL, '印度', 'IND');
INSERT INTO `st_region_city` VALUES (8697, 'India', NULL, 'Udaipur', NULL, 'UDR', '乌代布尔', NULL, '印度', 'IND');
INSERT INTO `st_region_city` VALUES (8698, 'India', NULL, 'Shillong', NULL, 'SHL', '西隆', NULL, '印度', 'IND');
INSERT INTO `st_region_city` VALUES (8699, 'India', NULL, 'Silvassa', NULL, 'SIL', '锡尔萨瓦', NULL, '印度', 'IND');
INSERT INTO `st_region_city` VALUES (8700, 'India', NULL, 'New Delhi', NULL, 'ICD', '新德里', NULL, '印度', 'IND');
INSERT INTO `st_region_city` VALUES (8701, 'India', NULL, 'Yanam', NULL, 'SRV', '亚南', NULL, '印度', 'IND');
INSERT INTO `st_region_city` VALUES (8702, 'India', NULL, 'Imphal', NULL, 'IMF', '因帕尔', NULL, '印度', 'IND');
INSERT INTO `st_region_city` VALUES (8703, 'India', NULL, 'Indore', NULL, 'IDR', '印多尔', NULL, '印度', 'IND');
INSERT INTO `st_region_city` VALUES (8704, 'India', NULL, 'Jaipur', NULL, 'JAI', '斋普尔', NULL, '印度', 'IND');
INSERT INTO `st_region_city` VALUES (8705, 'Indonesia', NULL, 'Bali', NULL, 'BA', '巴厘', NULL, '印度尼西亚', 'IDN');
INSERT INTO `st_region_city` VALUES (8706, 'Indonesia', NULL, 'Kepulauan Bangka Belitung', NULL, 'BB', '邦加－勿里洞群岛', NULL, '印度尼西亚', 'IDN');
INSERT INTO `st_region_city` VALUES (8707, 'Indonesia', NULL, 'Sulawesi Utara', NULL, 'SA', '北苏拉威西', NULL, '印度尼西亚', 'IDN');
INSERT INTO `st_region_city` VALUES (8708, 'Indonesia', NULL, 'Sumatera Utara', NULL, 'SU', '北苏门答腊', NULL, '印度尼西亚', 'IDN');
INSERT INTO `st_region_city` VALUES (8709, 'Indonesia', NULL, 'Daerah Tingkat I Kalimantan Barat', NULL, 'KB', '大雅加达首都特区', NULL, '印度尼西亚', 'IDN');
INSERT INTO `st_region_city` VALUES (8710, 'Indonesia', NULL, 'Kalimantan Timur', NULL, 'KI', '东加里曼丹', NULL, '印度尼西亚', 'IDN');
INSERT INTO `st_region_city` VALUES (8711, 'Indonesia', NULL, 'Sulawesi Tenggara', NULL, 'SG', '东南苏拉威西', NULL, '印度尼西亚', 'IDN');
INSERT INTO `st_region_city` VALUES (8712, 'Indonesia', NULL, 'Nusa Tenggara Timur', NULL, 'NT', '东努沙登加拉', NULL, '印度尼西亚', 'IDN');
INSERT INTO `st_region_city` VALUES (8713, 'Indonesia', NULL, 'Java Timur', NULL, 'JI', '东爪哇', NULL, '印度尼西亚', 'IDN');
INSERT INTO `st_region_city` VALUES (8714, 'Indonesia', NULL, 'Riau', NULL, 'RI', '廖内', NULL, '印度尼西亚', 'IDN');
INSERT INTO `st_region_city` VALUES (8715, 'Indonesia', NULL, 'Maluku', NULL, 'MA', '马鲁古', NULL, '印度尼西亚', 'IDN');
INSERT INTO `st_region_city` VALUES (8716, 'Indonesia', NULL, 'Bengkulu', NULL, 'BE', '明古鲁', NULL, '印度尼西亚', 'IDN');
INSERT INTO `st_region_city` VALUES (8717, 'Indonesia', NULL, 'Lampung', NULL, 'LA', '楠榜', NULL, '印度尼西亚', 'IDN');
INSERT INTO `st_region_city` VALUES (8718, 'Indonesia', NULL, 'Kalimantan Selatan', NULL, 'KS', '南加里曼丹', NULL, '印度尼西亚', 'IDN');
INSERT INTO `st_region_city` VALUES (8719, 'Indonesia', NULL, 'Sulawesi Selatan', NULL, 'SN', '南苏拉威西', NULL, '印度尼西亚', 'IDN');
INSERT INTO `st_region_city` VALUES (8720, 'Indonesia', NULL, 'Sumatera Selatan', NULL, 'SS', '南苏门答腊', NULL, '印度尼西亚', 'IDN');
INSERT INTO `st_region_city` VALUES (8721, 'Indonesia', NULL, 'Daerah Istimewa Yogyakarta', NULL, 'YO', '日惹特区', NULL, '印度尼西亚', 'IDN');
INSERT INTO `st_region_city` VALUES (8722, 'Indonesia', NULL, 'Banten', NULL, 'BT', '万丹', NULL, '印度尼西亚', 'IDN');
INSERT INTO `st_region_city` VALUES (8723, 'Indonesia', NULL, 'Nusa Tenggara Barat', NULL, 'NB', '西努沙登加拉', NULL, '印度尼西亚', 'IDN');
INSERT INTO `st_region_city` VALUES (8724, 'Indonesia', NULL, 'Sumatera Barat', NULL, 'SR', '西苏门答腊', NULL, '印度尼西亚', 'IDN');
INSERT INTO `st_region_city` VALUES (8725, 'Indonesia', NULL, 'Java Barat', NULL, 'JB', '西爪哇', NULL, '印度尼西亚', 'IDN');
INSERT INTO `st_region_city` VALUES (8726, 'Indonesia', NULL, 'Jakarta Raya', NULL, 'JK', '雅加达', NULL, '印度尼西亚', 'IDN');
INSERT INTO `st_region_city` VALUES (8727, 'Indonesia', NULL, 'Aceh', NULL, 'AC', '亚齐', NULL, '印度尼西亚', 'IDN');
INSERT INTO `st_region_city` VALUES (8728, 'Indonesia', NULL, 'Irian Jaya', NULL, 'IJ', '伊里安查亚', NULL, '印度尼西亚', 'IDN');
INSERT INTO `st_region_city` VALUES (8729, 'Indonesia', NULL, 'Jambi', NULL, 'JA', '占碑', NULL, '印度尼西亚', 'IDN');
INSERT INTO `st_region_city` VALUES (8730, 'Indonesia', NULL, 'Kalimantan Tengah', NULL, 'KT', '中加里曼丹', NULL, '印度尼西亚', 'IDN');
INSERT INTO `st_region_city` VALUES (8731, 'Indonesia', NULL, 'Sulawesi Tengah', NULL, 'ST', '中苏拉威西', NULL, '印度尼西亚', 'IDN');
INSERT INTO `st_region_city` VALUES (8732, 'Indonesia', NULL, 'Java Tengah', NULL, 'JT', '中爪哇', NULL, '印度尼西亚', 'IDN');
INSERT INTO `st_region_city` VALUES (8733, 'Jordan', NULL, 'Allun', NULL, 'AJ', '阿吉隆', NULL, '约旦', 'JOR');
INSERT INTO `st_region_city` VALUES (8734, 'Jordan', NULL, 'Amman', NULL, 'AM', '安曼', NULL, '约旦', 'JOR');
INSERT INTO `st_region_city` VALUES (8735, 'Jordan', NULL, 'Balqa', NULL, 'BA', '拜勒加', NULL, '约旦', 'JOR');
INSERT INTO `st_region_city` VALUES (8736, 'Jordan', NULL, 'Jarash', NULL, 'JA', '杰拉什', NULL, '约旦', 'JOR');
INSERT INTO `st_region_city` VALUES (8737, 'Jordan', NULL, 'Karak', NULL, 'KA', '卡拉克', NULL, '约旦', 'JOR');
INSERT INTO `st_region_city` VALUES (8738, 'Jordan', NULL, 'Rusayfah', NULL, 'RU', '鲁赛法', NULL, '约旦', 'JOR');
INSERT INTO `st_region_city` VALUES (8739, 'Jordan', NULL, 'Maan', NULL, 'MN', '马安', NULL, '约旦', 'JOR');
INSERT INTO `st_region_city` VALUES (8740, 'Jordan', NULL, 'Madaba', NULL, 'MD', '马德巴', NULL, '约旦', 'JOR');
INSERT INTO `st_region_city` VALUES (8741, 'Jordan', NULL, 'Mafraq', NULL, 'MF', '马夫拉克', NULL, '约旦', 'JOR');
INSERT INTO `st_region_city` VALUES (8742, 'Jordan', NULL, 'Tafiela', NULL, 'TA', '塔菲拉', NULL, '约旦', 'JOR');
INSERT INTO `st_region_city` VALUES (8743, 'Jordan', NULL, 'Aqaba', NULL, 'AQ', '亚喀巴', NULL, '约旦', 'JOR');
INSERT INTO `st_region_city` VALUES (8744, 'Jordan', NULL, 'Irbid', NULL, 'IR', '伊尔比德', NULL, '约旦', 'JOR');
INSERT INTO `st_region_city` VALUES (8745, 'Jordan', NULL, 'Zarqa', NULL, 'ZA', '扎尔卡', NULL, '约旦', 'JOR');
INSERT INTO `st_region_city` VALUES (8746, 'Vietnam', NULL, 'Haiphong', NULL, 'HP', '海防', NULL, '越南', 'VNM');
INSERT INTO `st_region_city` VALUES (8747, 'Vietnam', NULL, 'Hanoi', NULL, 'HI', '河内', NULL, '越南', 'VNM');
INSERT INTO `st_region_city` VALUES (8748, 'Vietnam', NULL, 'Ho Chi Minh City', NULL, 'HC', '胡志明市', NULL, '越南', 'VNM');
INSERT INTO `st_region_city` VALUES (8749, 'Zambia', NULL, 'Northern', NULL, 'NO', '北方', NULL, '赞比亚', 'ZMB');
INSERT INTO `st_region_city` VALUES (8750, 'Zambia', NULL, 'Eastern', NULL, 'EA', '东方', NULL, '赞比亚', 'ZMB');
INSERT INTO `st_region_city` VALUES (8751, 'Zambia', NULL, 'Luapula', NULL, 'LP', '卢阿普拉', NULL, '赞比亚', 'ZMB');
INSERT INTO `st_region_city` VALUES (8752, 'Zambia', NULL, 'Lusaka', NULL, 'LK', '卢萨卡', NULL, '赞比亚', 'ZMB');
INSERT INTO `st_region_city` VALUES (8753, 'Zambia', NULL, 'Southern', NULL, 'SO', '南方', NULL, '赞比亚', 'ZMB');
INSERT INTO `st_region_city` VALUES (8754, 'Zambia', NULL, 'Copperbelt', NULL, 'CB', '铜带', NULL, '赞比亚', 'ZMB');
INSERT INTO `st_region_city` VALUES (8755, 'Zambia', NULL, 'North-Western', NULL, 'NW', '西北', NULL, '赞比亚', 'ZMB');
INSERT INTO `st_region_city` VALUES (8756, 'Zambia', NULL, 'Western', NULL, 'WE', '西方', NULL, '赞比亚', 'ZMB');
INSERT INTO `st_region_city` VALUES (8757, 'Zambia', NULL, 'Central', NULL, 'CE', '中央', NULL, '赞比亚', 'ZMB');
INSERT INTO `st_region_city` VALUES (8758, 'Chile', NULL, 'Region de la Araucania', NULL, 'AR', '阿劳卡尼亚大区', NULL, '智利', 'CHL');
INSERT INTO `st_region_city` VALUES (8759, 'Chile', NULL, 'Region de Atacama', NULL, 'AT', '阿塔卡马大区', NULL, '智利', 'CHL');
INSERT INTO `st_region_city` VALUES (8760, 'Chile', NULL, 'Region de Antofagasta', NULL, 'AN', '安托法加斯塔大区', NULL, '智利', 'CHL');
INSERT INTO `st_region_city` VALUES (8761, 'Chile', NULL, 'Region del Biobio', NULL, 'BI', '比奥比奥大区', NULL, '智利', 'CHL');
INSERT INTO `st_region_city` VALUES (8762, 'Chile', NULL, 'Libertador', NULL, 'LI', '复活节岛', NULL, '智利', 'CHL');
INSERT INTO `st_region_city` VALUES (8763, 'Chile', NULL, 'Region de los Lagos', NULL, 'LL', '湖大区', NULL, '智利', 'CHL');
INSERT INTO `st_region_city` VALUES (8764, 'Chile', NULL, 'Region de Coquimbo', NULL, 'CO', '科金博大区', NULL, '智利', 'CHL');
INSERT INTO `st_region_city` VALUES (8765, 'Chile', NULL, 'Region del Maule', NULL, 'ML', '马乌莱大区', NULL, '智利', 'CHL');
INSERT INTO `st_region_city` VALUES (8766, 'Chile', NULL, 'Magallanes y Antartica Chilena', NULL, 'MA', '麦哲伦-智利南极大区', NULL, '智利', 'CHL');
INSERT INTO `st_region_city` VALUES (8767, 'Chile', NULL, 'Metropolitana de Santiago', NULL, 'RM', '圣地亚哥', NULL, '智利', 'CHL');
INSERT INTO `st_region_city` VALUES (8768, 'Chile', NULL, 'Region de Tarapaca', NULL, 'TA', '塔拉帕卡大区', NULL, '智利', 'CHL');
INSERT INTO `st_region_city` VALUES (8769, 'Chile', NULL, 'Region de Valparaiso', NULL, 'VS', '瓦尔帕莱索大区', NULL, '智利', 'CHL');
INSERT INTO `st_region_city` VALUES (8770, 'Chile', NULL, 'Region de Alsen del General Carlos Ibanez del', NULL, 'AI', '伊瓦涅斯将军的艾森大区', NULL, '智利', 'CHL');
INSERT INTO `st_region_city` VALUES (8771, 'Central African Republic', NULL, 'Bamingui-Bangoran', NULL, 'BB', '巴明吉-班戈兰', NULL, '中非共和国', 'CAF');
INSERT INTO `st_region_city` VALUES (8772, 'Central African Republic', NULL, 'Bangui', NULL, 'BGF', '班吉直辖市', NULL, '中非共和国', 'CAF');
INSERT INTO `st_region_city` VALUES (8773, 'Central African Republic', NULL, 'Bimbo', NULL, 'BI', '宾博', NULL, '中非共和国', 'CAF');
INSERT INTO `st_region_city` VALUES (8774, 'Central African Republic', NULL, 'Kemo', NULL, 'KG', '凯莫', NULL, '中非共和国', 'CAF');
INSERT INTO `st_region_city` VALUES (8775, 'Central African Republic', NULL, 'Lobaye', NULL, 'LB', '洛巴伊', NULL, '中非共和国', 'CAF');
INSERT INTO `st_region_city` VALUES (8776, 'Central African Republic', NULL, 'Mambere-Kadei', NULL, 'HS', '曼贝雷-卡代', NULL, '中非共和国', 'CAF');
INSERT INTO `st_region_city` VALUES (8777, 'Central African Republic', NULL, 'Mbomou', NULL, 'MB', '姆博穆', NULL, '中非共和国', 'CAF');
INSERT INTO `st_region_city` VALUES (8778, 'Central African Republic', NULL, 'Nana-Gribizi', NULL, 'KB', '纳纳-格里比齐', NULL, '中非共和国', 'CAF');
INSERT INTO `st_region_city` VALUES (8779, 'Central African Republic', NULL, 'Nana-Mambere', NULL, 'NM', '纳纳-曼贝雷', NULL, '中非共和国', 'CAF');
INSERT INTO `st_region_city` VALUES (8780, 'Central African Republic', NULL, 'Sangha-Mbaere', NULL, 'SE', '桑加-姆巴埃雷', NULL, '中非共和国', 'CAF');
INSERT INTO `st_region_city` VALUES (8781, 'Central African Republic', NULL, 'Haute-Kotto', NULL, 'HK', '上科托', NULL, '中非共和国', 'CAF');
INSERT INTO `st_region_city` VALUES (8782, 'Central African Republic', NULL, 'Haut-Mbomou', NULL, 'HM', '上姆博穆', NULL, '中非共和国', 'CAF');
INSERT INTO `st_region_city` VALUES (8783, 'Central African Republic', NULL, 'Ouaka', NULL, 'UK', '瓦卡', NULL, '中非共和国', 'CAF');
INSERT INTO `st_region_city` VALUES (8784, 'Central African Republic', NULL, 'Vakaga', NULL, 'VK', '瓦卡加', NULL, '中非共和国', 'CAF');
INSERT INTO `st_region_city` VALUES (8785, 'Central African Republic', NULL, 'Ouham', NULL, 'AC', '瓦姆', NULL, '中非共和国', 'CAF');
INSERT INTO `st_region_city` VALUES (8786, 'Central African Republic', NULL, 'Ouham-Pende', NULL, 'OP', '瓦姆-彭代', NULL, '中非共和国', 'CAF');
INSERT INTO `st_region_city` VALUES (8787, 'Central African Republic', NULL, 'Ombella-Mpoko', NULL, 'MP', '翁贝拉-姆波科', NULL, '中非共和国', 'CAF');
INSERT INTO `st_region_city` VALUES (8788, 'Central African Republic', NULL, 'Basse-Kotto', NULL, 'BK', '下科托', NULL, '中非共和国', 'CAF');
INSERT INTO `st_region_city` VALUES (10238, 'China', 'Beijing', 'Dongcheng', '11', '1', '东城', '北京', '中国', '1');
INSERT INTO `st_region_city` VALUES (10239, 'China', 'Beijing', 'Xicheng', '11', '2', '西城', '北京', '中国', '1');
INSERT INTO `st_region_city` VALUES (10240, 'China', 'Beijing', 'Chaoyang', '11', '5', '朝阳', '北京', '中国', '1');
INSERT INTO `st_region_city` VALUES (10241, 'China', 'Beijing', 'Fengtai', '11', '6', '丰台', '北京', '中国', '1');
INSERT INTO `st_region_city` VALUES (10242, 'China', 'Beijing', 'Shijingshan', '11', '7', '石景山', '北京', '中国', '1');
INSERT INTO `st_region_city` VALUES (10243, 'China', 'Beijing', 'Haidian', '11', '8', '海淀', '北京', '中国', '1');
INSERT INTO `st_region_city` VALUES (10244, 'China', 'Beijing', 'Mentougou', '11', '9', '门头沟', '北京', '中国', '1');
INSERT INTO `st_region_city` VALUES (10245, 'China', 'Beijing', 'Fangshan', '11', '11', '房山', '北京', '中国', '1');
INSERT INTO `st_region_city` VALUES (10246, 'China', 'Beijing', 'Tongzhou', '11', '12', '通州', '北京', '中国', '1');
INSERT INTO `st_region_city` VALUES (10247, 'China', 'Beijing', 'Shunyi', '11', '13', '顺义', '北京', '中国', '1');
INSERT INTO `st_region_city` VALUES (10248, 'China', 'Beijing', 'Changping', '11', '21', '昌平', '北京', '中国', '1');
INSERT INTO `st_region_city` VALUES (10249, 'China', 'Beijing', 'Daxing', '11', '24', '大兴', '北京', '中国', '1');
INSERT INTO `st_region_city` VALUES (10250, 'China', 'Beijing', 'Pinggu', '11', '26', '平谷', '北京', '中国', '1');
INSERT INTO `st_region_city` VALUES (10251, 'China', 'Beijing', 'Huairou', '11', '27', '怀柔', '北京', '中国', '1');
INSERT INTO `st_region_city` VALUES (10252, 'China', 'Beijing', 'Miyun', '11', '28', '密云', '北京', '中国', '1');
INSERT INTO `st_region_city` VALUES (10253, 'China', 'Beijing', 'Yanqing', '11', '29', '延庆', '北京', '中国', '1');
INSERT INTO `st_region_city` VALUES (10254, 'China', 'Tianjin', 'Heping', '12', '1', '和平', '天津', '中国', '1');
INSERT INTO `st_region_city` VALUES (10255, 'China', 'Tianjin', 'Hedong', '12', '2', '河东', '天津', '中国', '1');
INSERT INTO `st_region_city` VALUES (10256, 'China', 'Tianjin', 'Hexi', '12', '3', '河西', '天津', '中国', '1');
INSERT INTO `st_region_city` VALUES (10257, 'China', 'Tianjin', 'Nankai', '12', '4', '南开', '天津', '中国', '1');
INSERT INTO `st_region_city` VALUES (10258, 'China', 'Tianjin', 'Hebei', '12', '5', '河北', '天津', '中国', '1');
INSERT INTO `st_region_city` VALUES (10259, 'China', 'Tianjin', 'Hongqiao', '12', '6', '红桥', '天津', '中国', '1');
INSERT INTO `st_region_city` VALUES (10260, 'China', 'Tianjin', 'Binghaixinqu', '12', '26', '滨海新区', '天津', '中国', '1');
INSERT INTO `st_region_city` VALUES (10261, 'China', 'Tianjin', 'Dongli', '12', '10', '东丽', '天津', '中国', '1');
INSERT INTO `st_region_city` VALUES (10262, 'China', 'Tianjin', 'Xiqing', '12', '11', '西青', '天津', '中国', '1');
INSERT INTO `st_region_city` VALUES (10263, 'China', 'Tianjin', 'Jinnan', '12', '12', '津南', '天津', '中国', '1');
INSERT INTO `st_region_city` VALUES (10264, 'China', 'Tianjin', 'Beichen', '12', '13', '北辰', '天津', '中国', '1');
INSERT INTO `st_region_city` VALUES (10265, 'China', 'Tianjin', 'Ninghe', '12', '21', '宁河', '天津', '中国', '1');
INSERT INTO `st_region_city` VALUES (10266, 'China', 'Tianjin', 'Wuqing', '12', '22', '武清', '天津', '中国', '1');
INSERT INTO `st_region_city` VALUES (10267, 'China', 'Tianjin', 'Jinghai', '12', '23', '静海', '天津', '中国', '1');
INSERT INTO `st_region_city` VALUES (10268, 'China', 'Tianjin', 'Baodi', '12', '24', '宝坻', '天津', '中国', '1');
INSERT INTO `st_region_city` VALUES (10269, 'China', 'Tianjin', 'Jixian', '12', '25', '蓟县', '天津', '中国', '1');
INSERT INTO `st_region_city` VALUES (10270, 'China', 'Hebei', 'Shijiazhuang', '13', '1', '石家庄', '河北', '中国', '1');
INSERT INTO `st_region_city` VALUES (10271, 'China', 'Hebei', 'Tangshan', '13', '2', '唐山', '河北', '中国', '1');
INSERT INTO `st_region_city` VALUES (10272, 'China', 'Hebei', 'Qinhuangdao', '13', '3', '秦皇岛', '河北', '中国', '1');
INSERT INTO `st_region_city` VALUES (10273, 'China', 'Hebei', 'Handan', '13', '4', '邯郸', '河北', '中国', '1');
INSERT INTO `st_region_city` VALUES (10274, 'China', 'Hebei', 'Xingtai', '13', '5', '邢台', '河北', '中国', '1');
INSERT INTO `st_region_city` VALUES (10275, 'China', 'Hebei', 'Baoding', '13', '6', '保定', '河北', '中国', '1');
INSERT INTO `st_region_city` VALUES (10276, 'China', 'Hebei', 'Zhangjiakou', '13', '7', '张家口', '河北', '中国', '1');
INSERT INTO `st_region_city` VALUES (10277, 'China', 'Hebei', 'Chengde', '13', '8', '承德', '河北', '中国', '1');
INSERT INTO `st_region_city` VALUES (10278, 'China', 'Hebei', 'Cangzhou', '13', '9', '沧州', '河北', '中国', '1');
INSERT INTO `st_region_city` VALUES (10279, 'China', 'Hebei', 'Langfang', '13', '10', '廊坊', '河北', '中国', '1');
INSERT INTO `st_region_city` VALUES (10280, 'China', 'Hebei', 'Hengshui', '13', '11', '衡水', '河北', '中国', '1');
INSERT INTO `st_region_city` VALUES (10281, 'China', 'Shanxi', 'Taiyuan', '14', '1', '太原', '山西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10282, 'China', 'Shanxi', 'Datong', '14', '2', '大同', '山西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10283, 'China', 'Shanxi', 'Yangquan', '14', '3', '阳泉', '山西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10284, 'China', 'Shanxi', 'Changzhi', '14', '4', '长治', '山西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10285, 'China', 'Shanxi', 'Jincheng', '14', '5', '晋城', '山西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10286, 'China', 'Shanxi', 'Shuozhou', '14', '6', '朔州', '山西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10287, 'China', 'Shanxi', 'Jinzhong', '14', '7', '晋中', '山西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10288, 'China', 'Shanxi', 'Yuncheng', '14', '8', '运城', '山西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10289, 'China', 'Shanxi', 'Xinzhou', '14', '9', '忻州', '山西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10290, 'China', 'Shanxi', 'Linfen', '14', '10', '临汾', '山西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10291, 'China', 'Shanxi', 'luliang', '14', '11', '吕梁', '山西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10292, 'China', 'Inner Mongolia', 'Hohhot', '15', '1', '呼和浩特', '内蒙古', '中国', '1');
INSERT INTO `st_region_city` VALUES (10293, 'China', 'Inner Mongolia', 'Baotou', '15', '2', '包头', '内蒙古', '中国', '1');
INSERT INTO `st_region_city` VALUES (10294, 'China', 'Inner Mongolia', 'Wuhai', '15', '3', '乌海', '内蒙古', '中国', '1');
INSERT INTO `st_region_city` VALUES (10295, 'China', 'Inner Mongolia', 'Chifeng', '15', '4', '赤峰', '内蒙古', '中国', '1');
INSERT INTO `st_region_city` VALUES (10296, 'China', 'Inner Mongolia', 'Tongliao', '15', '5', '通辽', '内蒙古', '中国', '1');
INSERT INTO `st_region_city` VALUES (10297, 'China', 'Inner Mongolia', 'Ordos', '15', '6', '鄂尔多斯', '内蒙古', '中国', '1');
INSERT INTO `st_region_city` VALUES (10298, 'China', 'Inner Mongolia', 'Hulun Buir', '15', '7', '呼伦贝尔', '内蒙古', '中国', '1');
INSERT INTO `st_region_city` VALUES (10299, 'China', 'Inner Mongolia', 'Bayannur', '15', '8', '巴彦淖尔', '内蒙古', '中国', '1');
INSERT INTO `st_region_city` VALUES (10300, 'China', 'Inner Mongolia', 'Ulan Qab', '15', '9', '乌兰察布', '内蒙古', '中国', '1');
INSERT INTO `st_region_city` VALUES (10301, 'China', 'Inner Mongolia', 'Xing\'an', '15', '22', '兴安', '内蒙古', '中国', '1');
INSERT INTO `st_region_city` VALUES (10302, 'China', 'Inner Mongolia', 'Xilin Gol', '15', '25', '锡林郭勒', '内蒙古', '中国', '1');
INSERT INTO `st_region_city` VALUES (10303, 'China', 'Inner Mongolia', 'Alxa', '15', '29', '阿拉善', '内蒙古', '中国', '1');
INSERT INTO `st_region_city` VALUES (10304, 'China', 'Liaoning', 'Shenyang', '21', '1', '沈阳', '辽宁', '中国', '1');
INSERT INTO `st_region_city` VALUES (10305, 'China', 'Liaoning', 'Dalian', '21', '2', '大连', '辽宁', '中国', '1');
INSERT INTO `st_region_city` VALUES (10306, 'China', 'Liaoning', 'Anshan', '21', '3', '鞍山', '辽宁', '中国', '1');
INSERT INTO `st_region_city` VALUES (10307, 'China', 'Liaoning', 'Fushun', '21', '4', '抚顺', '辽宁', '中国', '1');
INSERT INTO `st_region_city` VALUES (10308, 'China', 'Liaoning', 'Benxi', '21', '5', '本溪', '辽宁', '中国', '1');
INSERT INTO `st_region_city` VALUES (10309, 'China', 'Liaoning', 'Dandong', '21', '6', '丹东', '辽宁', '中国', '1');
INSERT INTO `st_region_city` VALUES (10310, 'China', 'Liaoning', 'Jinzhou', '21', '7', '锦州', '辽宁', '中国', '1');
INSERT INTO `st_region_city` VALUES (10311, 'China', 'Liaoning', 'Yingkou', '21', '8', '营口', '辽宁', '中国', '1');
INSERT INTO `st_region_city` VALUES (10312, 'China', 'Liaoning', 'Fuxin', '21', '9', '阜新', '辽宁', '中国', '1');
INSERT INTO `st_region_city` VALUES (10313, 'China', 'Liaoning', 'Liaoyang', '21', '10', '辽阳', '辽宁', '中国', '1');
INSERT INTO `st_region_city` VALUES (10314, 'China', 'Liaoning', 'Panjin', '21', '11', '盘锦', '辽宁', '中国', '1');
INSERT INTO `st_region_city` VALUES (10315, 'China', 'Liaoning', 'Tieling', '21', '12', '铁岭', '辽宁', '中国', '1');
INSERT INTO `st_region_city` VALUES (10316, 'China', 'Liaoning', 'Chaoyang', '21', '13', '朝阳', '辽宁', '中国', '1');
INSERT INTO `st_region_city` VALUES (10317, 'China', 'Liaoning', 'Huludao', '21', '14', '葫芦岛', '辽宁', '中国', '1');
INSERT INTO `st_region_city` VALUES (10318, 'China', 'Jilin', 'Changchun', '22', '1', '长春', '吉林', '中国', '1');
INSERT INTO `st_region_city` VALUES (10319, 'China', 'Jilin', 'Jilin', '22', '2', '吉林', '吉林', '中国', '1');
INSERT INTO `st_region_city` VALUES (10320, 'China', 'Jilin', 'Siping', '22', '3', '四平', '吉林', '中国', '1');
INSERT INTO `st_region_city` VALUES (10321, 'China', 'Jilin', 'Liaoyuan', '22', '4', '辽源', '吉林', '中国', '1');
INSERT INTO `st_region_city` VALUES (10322, 'China', 'Jilin', 'Tonghua', '22', '5', '通化', '吉林', '中国', '1');
INSERT INTO `st_region_city` VALUES (10323, 'China', 'Jilin', 'Baishan', '22', '6', '白山', '吉林', '中国', '1');
INSERT INTO `st_region_city` VALUES (10324, 'China', 'Jilin', 'Songyuan', '22', '7', '松原', '吉林', '中国', '1');
INSERT INTO `st_region_city` VALUES (10325, 'China', 'Jilin', 'Baicheng', '22', '8', '白城', '吉林', '中国', '1');
INSERT INTO `st_region_city` VALUES (10326, 'China', 'Jilin', 'Yanbian Korean Autonomous Prefecture', '22', '24', '延边', '吉林', '中国', '1');
INSERT INTO `st_region_city` VALUES (10327, 'China', 'Heilongjiang', 'Harbin', '23', '1', '哈尔滨', '黑龙江', '中国', '1');
INSERT INTO `st_region_city` VALUES (10328, 'China', 'Heilongjiang', 'Qiqihar', '23', '2', '齐齐哈尔', '黑龙江', '中国', '1');
INSERT INTO `st_region_city` VALUES (10329, 'China', 'Heilongjiang', 'Jixi', '23', '3', '鸡西', '黑龙江', '中国', '1');
INSERT INTO `st_region_city` VALUES (10330, 'China', 'Heilongjiang', 'Hegang', '23', '4', '鹤岗', '黑龙江', '中国', '1');
INSERT INTO `st_region_city` VALUES (10331, 'China', 'Heilongjiang', 'Shuangyashan', '23', '5', '双鸭山', '黑龙江', '中国', '1');
INSERT INTO `st_region_city` VALUES (10332, 'China', 'Heilongjiang', 'Daqing', '23', '6', '大庆', '黑龙江', '中国', '1');
INSERT INTO `st_region_city` VALUES (10333, 'China', 'Heilongjiang', 'Yichun', '23', '7', '伊春', '黑龙江', '中国', '1');
INSERT INTO `st_region_city` VALUES (10334, 'China', 'Heilongjiang', 'Jiamusi', '23', '8', '佳木斯', '黑龙江', '中国', '1');
INSERT INTO `st_region_city` VALUES (10335, 'China', 'Heilongjiang', 'Qitaihe', '23', '9', '七台河', '黑龙江', '中国', '1');
INSERT INTO `st_region_city` VALUES (10336, 'China', 'Heilongjiang', 'Mudanjiang', '23', '10', '牡丹江', '黑龙江', '中国', '1');
INSERT INTO `st_region_city` VALUES (10337, 'China', 'Heilongjiang', 'Heihe', '23', '11', '黑河', '黑龙江', '中国', '1');
INSERT INTO `st_region_city` VALUES (10338, 'China', 'Heilongjiang', 'Suihua', '23', '12', '绥化', '黑龙江', '中国', '1');
INSERT INTO `st_region_city` VALUES (10339, 'China', 'Heilongjiang', 'Da Hinggan Ling', '23', '27', '大兴安岭', '黑龙江', '中国', '1');
INSERT INTO `st_region_city` VALUES (10340, 'China', 'Shanghai', 'Huangpu', '31', '1', '黄浦', '上海', '中国', '1');
INSERT INTO `st_region_city` VALUES (10341, 'China', 'Shanghai', 'Luwan', '31', '3', '卢湾', '上海', '中国', '1');
INSERT INTO `st_region_city` VALUES (10342, 'China', 'Shanghai', 'Xuhui', '31', '4', '徐汇', '上海', '中国', '1');
INSERT INTO `st_region_city` VALUES (10343, 'China', 'Shanghai', 'Changning', '31', '5', '长宁', '上海', '中国', '1');
INSERT INTO `st_region_city` VALUES (10344, 'China', 'Shanghai', 'Jing\'an', '31', '6', '静安', '上海', '中国', '1');
INSERT INTO `st_region_city` VALUES (10345, 'China', 'Shanghai', 'Putuo', '31', '7', '普陀', '上海', '中国', '1');
INSERT INTO `st_region_city` VALUES (10346, 'China', 'Shanghai', 'Zhabei', '31', '8', '闸北', '上海', '中国', '1');
INSERT INTO `st_region_city` VALUES (10347, 'China', 'Shanghai', 'Hongkou', '31', '9', '虹口', '上海', '中国', '1');
INSERT INTO `st_region_city` VALUES (10348, 'China', 'Shanghai', 'Yangpu', '31', '11', '杨浦', '上海', '中国', '1');
INSERT INTO `st_region_city` VALUES (10349, 'China', 'Shanghai', 'Minhang', '31', '12', '闵行', '上海', '中国', '1');
INSERT INTO `st_region_city` VALUES (10350, 'China', 'Shanghai', 'Baoshan', '31', '13', '宝山', '上海', '中国', '1');
INSERT INTO `st_region_city` VALUES (10351, 'China', 'Shanghai', 'Jiading', '31', '14', '嘉定', '上海', '中国', '1');
INSERT INTO `st_region_city` VALUES (10352, 'China', 'Shanghai', 'Pudong New Area', '31', '15', '浦东新区', '上海', '中国', '1');
INSERT INTO `st_region_city` VALUES (10353, 'China', 'Shanghai', 'Jinshan', '31', '16', '金山', '上海', '中国', '1');
INSERT INTO `st_region_city` VALUES (10354, 'China', 'Shanghai', 'Songjiang', '31', '17', '松江', '上海', '中国', '1');
INSERT INTO `st_region_city` VALUES (10355, 'China', 'Shanghai', 'Fengxian', '31', '26', '奉贤', '上海', '中国', '1');
INSERT INTO `st_region_city` VALUES (10356, 'China', 'Shanghai', 'Qingpu', '31', '29', '青浦', '上海', '中国', '1');
INSERT INTO `st_region_city` VALUES (10357, 'China', 'Shanghai', 'Chongming', '31', '30', '崇明', '上海', '中国', '1');
INSERT INTO `st_region_city` VALUES (10358, 'China', 'Jiangsu', 'Nanjing', '32', '1', '南京', '江苏', '中国', '1');
INSERT INTO `st_region_city` VALUES (10359, 'China', 'Jiangsu', 'Wuxi', '32', '2', '无锡', '江苏', '中国', '1');
INSERT INTO `st_region_city` VALUES (10360, 'China', 'Jiangsu', 'Xuzhou', '32', '3', '徐州', '江苏', '中国', '1');
INSERT INTO `st_region_city` VALUES (10361, 'China', 'Jiangsu', 'Changzhou', '32', '4', '常州', '江苏', '中国', '1');
INSERT INTO `st_region_city` VALUES (10362, 'China', 'Jiangsu', 'Suzhou', '32', '5', '苏州', '江苏', '中国', '1');
INSERT INTO `st_region_city` VALUES (10363, 'China', 'Jiangsu', 'Nantong', '32', '6', '南通', '江苏', '中国', '1');
INSERT INTO `st_region_city` VALUES (10364, 'China', 'Jiangsu', 'Lianyungang', '32', '7', '连云港', '江苏', '中国', '1');
INSERT INTO `st_region_city` VALUES (10365, 'China', 'Jiangsu', 'Huai\'an', '32', '8', '淮安', '江苏', '中国', '1');
INSERT INTO `st_region_city` VALUES (10366, 'China', 'Jiangsu', 'Yancheng', '32', '9', '盐城', '江苏', '中国', '1');
INSERT INTO `st_region_city` VALUES (10367, 'China', 'Jiangsu', 'Yangzhou', '32', '10', '扬州', '江苏', '中国', '1');
INSERT INTO `st_region_city` VALUES (10368, 'China', 'Jiangsu', 'Zhenjiang', '32', '11', '镇江', '江苏', '中国', '1');
INSERT INTO `st_region_city` VALUES (10369, 'China', 'Jiangsu', 'Taizhou', '32', '12', '泰州', '江苏', '中国', '1');
INSERT INTO `st_region_city` VALUES (10370, 'China', 'Jiangsu', 'Suqian', '32', '13', '宿迁', '江苏', '中国', '1');
INSERT INTO `st_region_city` VALUES (10371, 'China', 'Zhejiang', 'Hangzhou', '33', '1', '杭州', '浙江', '中国', '1');
INSERT INTO `st_region_city` VALUES (10372, 'China', 'Zhejiang', 'Ningbo', '33', '2', '宁波', '浙江', '中国', '1');
INSERT INTO `st_region_city` VALUES (10373, 'China', 'Zhejiang', 'Wenzhou', '33', '3', '温州', '浙江', '中国', '1');
INSERT INTO `st_region_city` VALUES (10374, 'China', 'Zhejiang', 'Jiaxing', '33', '4', '嘉兴', '浙江', '中国', '1');
INSERT INTO `st_region_city` VALUES (10375, 'China', 'Zhejiang', 'Huzhou', '33', '5', '湖州', '浙江', '中国', '1');
INSERT INTO `st_region_city` VALUES (10376, 'China', 'Zhejiang', 'Shaoxing', '33', '6', '绍兴', '浙江', '中国', '1');
INSERT INTO `st_region_city` VALUES (10377, 'China', 'Zhejiang', 'Jinhua', '33', '7', '金华', '浙江', '中国', '1');
INSERT INTO `st_region_city` VALUES (10378, 'China', 'Zhejiang', 'Quzhou', '33', '8', '衢州', '浙江', '中国', '1');
INSERT INTO `st_region_city` VALUES (10379, 'China', 'Zhejiang', 'Zhoushan', '33', '9', '舟山', '浙江', '中国', '1');
INSERT INTO `st_region_city` VALUES (10380, 'China', 'Zhejiang', 'Taizhou', '33', '10', '台州', '浙江', '中国', '1');
INSERT INTO `st_region_city` VALUES (10381, 'China', 'Zhejiang', 'Lishui', '33', '11', '丽水', '浙江', '中国', '1');
INSERT INTO `st_region_city` VALUES (10382, 'China', 'Anhui', 'Hefei', '34', '1', '合肥', '安徽', '中国', '1');
INSERT INTO `st_region_city` VALUES (10383, 'China', 'Anhui', 'Wuhu', '34', '2', '芜湖', '安徽', '中国', '1');
INSERT INTO `st_region_city` VALUES (10384, 'China', 'Anhui', 'Bengbu', '34', '3', '蚌埠', '安徽', '中国', '1');
INSERT INTO `st_region_city` VALUES (10385, 'China', 'Anhui', 'Huainan', '34', '4', '淮南', '安徽', '中国', '1');
INSERT INTO `st_region_city` VALUES (10386, 'China', 'Anhui', 'Ma\'anshan', '34', '5', '马鞍山', '安徽', '中国', '1');
INSERT INTO `st_region_city` VALUES (10387, 'China', 'Anhui', 'Huaibei', '34', '6', '淮北', '安徽', '中国', '1');
INSERT INTO `st_region_city` VALUES (10388, 'China', 'Anhui', 'Tongling', '34', '7', '铜陵', '安徽', '中国', '1');
INSERT INTO `st_region_city` VALUES (10389, 'China', 'Anhui', 'Anqing', '34', '8', '安庆', '安徽', '中国', '1');
INSERT INTO `st_region_city` VALUES (10390, 'China', 'Anhui', 'Huangshan', '34', '10', '黄山', '安徽', '中国', '1');
INSERT INTO `st_region_city` VALUES (10391, 'China', 'Anhui', 'Chuzhou', '34', '11', '滁州', '安徽', '中国', '1');
INSERT INTO `st_region_city` VALUES (10392, 'China', 'Anhui', 'Fuyang', '34', '12', '阜阳', '安徽', '中国', '1');
INSERT INTO `st_region_city` VALUES (10393, 'China', 'Anhui', 'Suzhou', '34', '13', '宿州', '安徽', '中国', '1');
INSERT INTO `st_region_city` VALUES (10394, 'China', 'Anhui', 'Lu\'an', '34', '15', '六安', '安徽', '中国', '1');
INSERT INTO `st_region_city` VALUES (10395, 'China', 'Anhui', 'Bozhou', '34', '16', '亳州', '安徽', '中国', '1');
INSERT INTO `st_region_city` VALUES (10396, 'China', 'Anhui', 'Chizhou', '34', '17', '池州', '安徽', '中国', '1');
INSERT INTO `st_region_city` VALUES (10397, 'China', 'Anhui', 'Xuancheng', '34', '18', '宣城', '安徽', '中国', '1');
INSERT INTO `st_region_city` VALUES (10398, 'China', 'Fujian', 'Fuzhou', '35', '1', '福州', '福建', '中国', '1');
INSERT INTO `st_region_city` VALUES (10399, 'China', 'Fujian', 'Xiamen', '35', '2', '厦门', '福建', '中国', '1');
INSERT INTO `st_region_city` VALUES (10400, 'China', 'Fujian', 'Putian', '35', '3', '莆田', '福建', '中国', '1');
INSERT INTO `st_region_city` VALUES (10401, 'China', 'Fujian', 'Sanming', '35', '4', '三明', '福建', '中国', '1');
INSERT INTO `st_region_city` VALUES (10402, 'China', 'Fujian', 'Quanzhou', '35', '5', '泉州', '福建', '中国', '1');
INSERT INTO `st_region_city` VALUES (10403, 'China', 'Fujian', 'Zhangzhou', '35', '6', '漳州', '福建', '中国', '1');
INSERT INTO `st_region_city` VALUES (10404, 'China', 'Fujian', 'Nanping', '35', '7', '南平', '福建', '中国', '1');
INSERT INTO `st_region_city` VALUES (10405, 'China', 'Fujian', 'Longyan', '35', '8', '龙岩', '福建', '中国', '1');
INSERT INTO `st_region_city` VALUES (10406, 'China', 'Fujian', 'Ningde', '35', '9', '宁德', '福建', '中国', '1');
INSERT INTO `st_region_city` VALUES (10407, 'China', 'Jiangxi', 'Nanchang', '36', '1', '南昌', '江西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10408, 'China', 'Jiangxi', 'Jingdezhen', '36', '2', '景德镇', '江西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10409, 'China', 'Jiangxi', 'Pingxiang', '36', '3', '萍乡', '江西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10410, 'China', 'Jiangxi', 'Jiujiang', '36', '4', '九江', '江西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10411, 'China', 'Jiangxi', 'Xinyu', '36', '5', '新余', '江西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10412, 'China', 'Jiangxi', 'Yingtan', '36', '6', '鹰潭', '江西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10413, 'China', 'Jiangxi', 'Ganzhou', '36', '7', '赣州', '江西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10414, 'China', 'Jiangxi', 'Ji\'an', '36', '8', '吉安', '江西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10415, 'China', 'Jiangxi', 'Yichun', '36', '9', '宜春', '江西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10416, 'China', 'Jiangxi', 'Fuzhou', '36', '10', '抚州', '江西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10417, 'China', 'Jiangxi', 'Shangrao', '36', '11', '上饶', '江西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10418, 'China', 'Shandong', 'Jinan', '37', '1', '济南', '山东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10419, 'China', 'Shandong', 'Qingdao', '37', '2', '青岛', '山东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10420, 'China', 'Shandong', 'Zibo', '37', '3', '淄博', '山东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10421, 'China', 'Shandong', 'Zaozhuang', '37', '4', '枣庄', '山东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10422, 'China', 'Shandong', 'Dongying', '37', '5', '东营', '山东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10423, 'China', 'Shandong', 'Yantai', '37', '6', '烟台', '山东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10424, 'China', 'Shandong', 'Weifang', '37', '7', '潍坊', '山东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10425, 'China', 'Shandong', 'Jining', '37', '8', '济宁', '山东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10426, 'China', 'Shandong', 'Tai\'an', '37', '9', '泰安', '山东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10427, 'China', 'Shandong', 'Weihai', '37', '10', '威海', '山东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10428, 'China', 'Shandong', 'Rizhao', '37', '11', '日照', '山东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10429, 'China', 'Shandong', 'Laiwu', '37', '12', '莱芜', '山东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10430, 'China', 'Shandong', 'Linyi', '37', '13', '临沂', '山东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10431, 'China', 'Shandong', 'Dezhou', '37', '14', '德州', '山东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10432, 'China', 'Shandong', 'Liaocheng', '37', '15', '聊城', '山东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10433, 'China', 'Shandong', 'Binzhou', '37', '16', '滨州', '山东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10434, 'China', 'Shandong', 'Heze', '37', '17', '菏泽', '山东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10435, 'China', 'Henan', 'Zhengzhou', '41', '1', '郑州', '河南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10436, 'China', 'Henan', 'Kaifeng', '41', '2', '开封', '河南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10437, 'China', 'Henan', 'Luoyang', '41', '3', '洛阳', '河南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10438, 'China', 'Henan', 'Pingdingshan', '41', '4', '平顶山', '河南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10439, 'China', 'Henan', 'Anyang', '41', '5', '安阳', '河南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10440, 'China', 'Henan', 'Hebi', '41', '6', '鹤壁', '河南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10441, 'China', 'Henan', 'Xinxiang', '41', '7', '新乡', '河南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10442, 'China', 'Henan', 'Jiaozuo', '41', '8', '焦作', '河南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10443, 'China', 'Henan', 'Puyang', '41', '9', '濮阳', '河南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10444, 'China', 'Henan', 'Xuchang', '41', '10', '许昌', '河南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10445, 'China', 'Henan', 'Luohe', '41', '11', '漯河', '河南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10446, 'China', 'Henan', 'Sanmenxia', '41', '12', '三门峡', '河南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10447, 'China', 'Henan', 'Nanyang', '41', '13', '南阳', '河南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10448, 'China', 'Henan', 'Shangqiu', '41', '14', '商丘', '河南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10449, 'China', 'Henan', 'Xinyang', '41', '15', '信阳', '河南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10450, 'China', 'Henan', 'Zhoukou', '41', '16', '周口', '河南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10451, 'China', 'Henan', 'Zhumadian', '41', '17', '驻马店', '河南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10452, 'China', 'Henan', 'Jiyuan', '41', '18', '济源', '河南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10453, 'China', 'Hubei', 'Wuhan', '42', '1', '武汉', '湖北', '中国', '1');
INSERT INTO `st_region_city` VALUES (10454, 'China', 'Hubei', 'Huangshi', '42', '2', '黄石', '湖北', '中国', '1');
INSERT INTO `st_region_city` VALUES (10455, 'China', 'Hubei', 'Shiyan', '42', '3', '十堰', '湖北', '中国', '1');
INSERT INTO `st_region_city` VALUES (10456, 'China', 'Hubei', 'Yichang', '42', '5', '宜昌', '湖北', '中国', '1');
INSERT INTO `st_region_city` VALUES (10457, 'China', 'Hubei', 'Xiangyang', '42', '6', '襄阳', '湖北', '中国', '1');
INSERT INTO `st_region_city` VALUES (10458, 'China', 'Hubei', 'Ezhou', '42', '7', '鄂州', '湖北', '中国', '1');
INSERT INTO `st_region_city` VALUES (10459, 'China', 'Hubei', 'Jingmen', '42', '8', '荆门', '湖北', '中国', '1');
INSERT INTO `st_region_city` VALUES (10460, 'China', 'Hubei', 'Xiaogan', '42', '9', '孝感', '湖北', '中国', '1');
INSERT INTO `st_region_city` VALUES (10461, 'China', 'Hubei', 'Jingzhou', '42', '10', '荆州', '湖北', '中国', '1');
INSERT INTO `st_region_city` VALUES (10462, 'China', 'Hubei', 'Huanggang', '42', '11', '黄冈', '湖北', '中国', '1');
INSERT INTO `st_region_city` VALUES (10463, 'China', 'Hubei', 'Xianning', '42', '12', '咸宁', '湖北', '中国', '1');
INSERT INTO `st_region_city` VALUES (10464, 'China', 'Hubei', 'Suizhou', '42', '13', '随州', '湖北', '中国', '1');
INSERT INTO `st_region_city` VALUES (10465, 'China', 'Hubei', 'Enshi Tujia-Miao Autonomous Prefecture', '42', '28', '恩施', '湖北', '中国', '1');
INSERT INTO `st_region_city` VALUES (10466, 'China', 'Hubei', 'Xiantao', '42', '94', '仙桃', '湖北', '中国', '1');
INSERT INTO `st_region_city` VALUES (10467, 'China', 'Hubei', 'Qianjiang', '42', '95', '潜江', '湖北', '中国', '1');
INSERT INTO `st_region_city` VALUES (10468, 'China', 'Hubei', 'Tianmen', '42', '96', '天门', '湖北', '中国', '1');
INSERT INTO `st_region_city` VALUES (10469, 'China', 'Hubei', 'Shennongjia', '42', 'A21', '神农架', '湖北', '中国', '1');
INSERT INTO `st_region_city` VALUES (10470, 'China', 'Hunan', 'Changsha', '43', '1', '长沙', '湖南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10471, 'China', 'Hunan', 'Zhuzhou', '43', '2', '株洲', '湖南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10472, 'China', 'Hunan', 'Xiangtan', '43', '3', '湘潭', '湖南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10473, 'China', 'Hunan', 'Hengyang', '43', '4', '衡阳', '湖南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10474, 'China', 'Hunan', 'Shaoyang', '43', '5', '邵阳', '湖南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10475, 'China', 'Hunan', 'Yueyang', '43', '6', '岳阳', '湖南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10476, 'China', 'Hunan', 'Changde', '43', '7', '常德', '湖南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10477, 'China', 'Hunan', 'Zhangjiajie', '43', '8', '张家界', '湖南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10478, 'China', 'Hunan', 'Yiyang', '43', '9', '益阳', '湖南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10479, 'China', 'Hunan', 'Chenzhou', '43', '10', '郴州', '湖南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10480, 'China', 'Hunan', 'Yongzhou', '43', '11', '永州', '湖南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10481, 'China', 'Hunan', 'Huaihua', '43', '12', '怀化', '湖南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10482, 'China', 'Hunan', 'Loudi', '43', '13', '娄底', '湖南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10483, 'China', 'Hunan', 'Xiangxi Tujia-Miao Autonomous Prefecture', '43', '31', '湘西', '湖南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10484, 'China', 'Guangdong', 'Guangzhou', '44', '1', '广州', '广东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10485, 'China', 'Guangdong', 'Shaoguan', '44', '2', '韶关', '广东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10486, 'China', 'Guangdong', 'Shenzhen', '44', '3', '深圳', '广东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10487, 'China', 'Guangdong', 'Zhuhai', '44', '4', '珠海', '广东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10488, 'China', 'Guangdong', 'Shantou', '44', '5', '汕头', '广东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10489, 'China', 'Guangdong', 'Foshan', '44', '6', '佛山', '广东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10490, 'China', 'Guangdong', 'Jiangmen', '44', '7', '江门', '广东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10491, 'China', 'Guangdong', 'Zhanjiang', '44', '8', '湛江', '广东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10492, 'China', 'Guangdong', 'Maoming', '44', '9', '茂名', '广东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10493, 'China', 'Guangdong', 'Zhaoqing', '44', '12', '肇庆', '广东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10494, 'China', 'Guangdong', 'Huizhou', '44', '13', '惠州', '广东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10495, 'China', 'Guangdong', 'Meizhou', '44', '14', '梅州', '广东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10496, 'China', 'Guangdong', 'Shanwei', '44', '15', '汕尾', '广东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10497, 'China', 'Guangdong', 'Heyuan', '44', '16', '河源', '广东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10498, 'China', 'Guangdong', 'Yangjiang', '44', '17', '阳江', '广东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10499, 'China', 'Guangdong', 'Qingyuan', '44', '18', '清远', '广东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10500, 'China', 'Guangdong', 'Dongguan', '44', '19', '东莞', '广东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10501, 'China', 'Guangdong', 'Zhongshan', '44', '20', '中山', '广东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10502, 'China', 'Guangdong', 'Chaozhou', '44', '51', '潮州', '广东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10503, 'China', 'Guangdong', 'Jieyang', '44', '52', '揭阳', '广东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10504, 'China', 'Guangdong', 'Yunfu', '44', '53', '云浮', '广东', '中国', '1');
INSERT INTO `st_region_city` VALUES (10505, 'China', 'Guangxi', 'Nanning', '45', '1', '南宁', '广西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10506, 'China', 'Guangxi', 'Liuzhou', '45', '2', '柳州', '广西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10507, 'China', 'Guangxi', 'Guilin', '45', '3', '桂林', '广西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10508, 'China', 'Guangxi', 'Wuzhou', '45', '4', '梧州', '广西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10509, 'China', 'Guangxi', 'Beihai', '45', '5', '北海', '广西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10510, 'China', 'Guangxi', 'Fangchenggang', '45', '6', '防城港', '广西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10511, 'China', 'Guangxi', 'Qinzhou', '45', '7', '钦州', '广西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10512, 'China', 'Guangxi', 'Guigang', '45', '8', '贵港', '广西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10513, 'China', 'Guangxi', 'Yulin', '45', '9', '玉林', '广西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10514, 'China', 'Guangxi', 'Baise', '45', '10', '百色', '广西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10515, 'China', 'Guangxi', 'Hezhou', '45', '11', '贺州', '广西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10516, 'China', 'Guangxi', 'Hechi', '45', '12', '河池', '广西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10517, 'China', 'Guangxi', 'Laibin', '45', '13', '来宾', '广西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10518, 'China', 'Guangxi', 'Chongzuo', '45', '14', '崇左', '广西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10519, 'China', 'Hainan', 'Haikou', '46', '1', '海口', '海南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10520, 'China', 'Hainan', 'Sanya', '46', '2', '三亚', '海南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10521, 'China', 'Hainan', 'Shansha', '46', '3', '三沙', '海南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10522, 'China', 'Hainan', 'Wuzhishan', '46', '91', '五指山', '海南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10523, 'China', 'Hainan', 'Qionghai', '46', '92', '琼海', '海南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10524, 'China', 'Hainan', 'Danzhou', '46', '93', '儋州', '海南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10525, 'China', 'Hainan', 'Wenchang', '46', '95', '文昌', '海南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10526, 'China', 'Hainan', 'Wanning', '46', '96', '万宁', '海南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10527, 'China', 'Hainan', 'Dongfang', '46', '97', '东方', '海南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10528, 'China', 'Hainan', 'Ding\'an', '46', 'A25', '定安', '海南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10529, 'China', 'Hainan', 'Tunchang', '46', 'A26', '屯昌', '海南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10530, 'China', 'Hainan', 'Cengmai', '46', 'A27', '澄迈', '海南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10531, 'China', 'Hainan', 'Lingao', '46', 'A28', '临高', '海南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10532, 'China', 'Hainan', 'Baisha Li Autonomous County', '46', 'A30', '白沙', '海南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10533, 'China', 'Hainan', 'Jiang Li Autonomous County', '46', 'A31', '昌江', '海南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10534, 'China', 'Hainan', 'Ledong Li Autonomous County', '46', 'A33', '乐东', '海南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10535, 'China', 'Hainan', 'Lingshui Li Autonomous County', '46', 'A34', '陵水', '海南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10536, 'China', 'Hainan', 'Baoting Li-Miao Autonomous County', '46', 'A35', '保亭', '海南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10537, 'China', 'Hainan', 'Qiongzhong Li-Miao Autonomous County', '46', 'A36', '琼中', '海南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10538, 'China', 'Chongqing', 'Wanzhou', '50', '1', '万州', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10539, 'China', 'Chongqing', 'Fuling', '50', '2', '涪陵', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10540, 'China', 'Chongqing', 'Yuzhong', '50', '3', '渝中', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10541, 'China', 'Chongqing', 'Dadukou', '50', '4', '大渡口', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10542, 'China', 'Chongqing', 'Jiangbei', '50', '5', '江北', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10543, 'China', 'Chongqing', 'Shapingba', '50', '6', '沙坪坝', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10544, 'China', 'Chongqing', 'Jiulongpo', '50', '7', '九龙坡', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10545, 'China', 'Chongqing', 'Nan\'an', '50', '8', '南岸', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10546, 'China', 'Chongqing', 'Beibei', '50', '9', '北碚', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10547, 'China', 'Chongqing', 'Kaixian', '50', '85', '两江新区', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10548, 'China', 'Chongqing', 'Wansheng', '50', '10', '万盛', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10549, 'China', 'Chongqing', 'Shuangqiao', '50', '11', '双桥', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10550, 'China', 'Chongqing', 'Yubei', '50', '12', '渝北', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10551, 'China', 'Chongqing', 'Ba\'nan', '50', '13', '巴南', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10552, 'China', 'Chongqing', 'Changshou', '50', '21', '长寿', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10553, 'China', 'Chongqing', 'Qijiang', '50', '22', '綦江', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10554, 'China', 'Chongqing', 'Tongnan', '50', '23', '潼南', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10555, 'China', 'Chongqing', 'Tongliang', '50', '24', '铜梁', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10556, 'China', 'Chongqing', 'Dazu', '50', '25', '大足', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10557, 'China', 'Chongqing', 'Rongchang', '50', '26', '荣昌', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10558, 'China', 'Chongqing', 'Bishan', '50', '27', '璧山', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10559, 'China', 'Chongqing', 'Liangping', '50', '28', '梁平', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10560, 'China', 'Chongqing', 'Chengkou', '50', '29', '城口', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10561, 'China', 'Chongqing', 'Fengdu', '50', '30', '丰都', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10562, 'China', 'Chongqing', 'Dianjiang', '50', '31', '垫江', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10563, 'China', 'Chongqing', 'Wulong', '50', '32', '武隆', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10564, 'China', 'Chongqing', 'Zhongxian', '50', '33', '忠县', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10565, 'China', 'Chongqing', 'Kaixian', '50', '34', '开县', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10566, 'China', 'Chongqing', 'Yunyang', '50', '35', '云阳', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10567, 'China', 'Chongqing', 'Fengjie', '50', '36', '奉节', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10568, 'China', 'Chongqing', 'Wushan', '50', '37', '巫山', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10569, 'China', 'Chongqing', 'Wuxi', '50', '38', '巫溪', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10570, 'China', 'Chongqing', 'Qianjiang', '50', '39', '黔江', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10571, 'China', 'Chongqing', 'Shizhu Tujia Autonomous Country', '50', '40', '石柱', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10572, 'China', 'Chongqing', 'Xiushan Tujia-Miao Autonomous Country', '50', '41', '秀山', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10573, 'China', 'Chongqing', 'Youyang Tujia-Miao Autonomous Country', '50', '42', '酉阳', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10574, 'China', 'Chongqing', 'Pengshui Miao-Tujia Autonomous Country', '50', '43', '彭水', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10575, 'China', 'Chongqing', 'Jiangjin', '50', '81', '江津', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10576, 'China', 'Chongqing', 'Hechuan', '50', '82', '合川', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10577, 'China', 'Chongqing', 'Yongchuan', '50', '83', '永川', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10578, 'China', 'Chongqing', 'Liangjiangxinqu', '50', '84', '南川', '重庆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10579, 'China', 'Sichuan', 'Chengdu', '51', '1', '成都', '四川', '中国', '1');
INSERT INTO `st_region_city` VALUES (10580, 'China', 'Sichuan', 'Zigong', '51', '3', '自贡', '四川', '中国', '1');
INSERT INTO `st_region_city` VALUES (10581, 'China', 'Sichuan', 'Panzhihua', '51', '4', '攀枝花', '四川', '中国', '1');
INSERT INTO `st_region_city` VALUES (10582, 'China', 'Sichuan', 'Luzhou', '51', '5', '泸州', '四川', '中国', '1');
INSERT INTO `st_region_city` VALUES (10583, 'China', 'Sichuan', 'Deyang', '51', '6', '德阳', '四川', '中国', '1');
INSERT INTO `st_region_city` VALUES (10584, 'China', 'Sichuan', 'Mianyang', '51', '7', '绵阳', '四川', '中国', '1');
INSERT INTO `st_region_city` VALUES (10585, 'China', 'Sichuan', 'Guangyuan', '51', '8', '广元', '四川', '中国', '1');
INSERT INTO `st_region_city` VALUES (10586, 'China', 'Sichuan', 'Suining', '51', '9', '遂宁', '四川', '中国', '1');
INSERT INTO `st_region_city` VALUES (10587, 'China', 'Sichuan', 'Neijiang', '51', '10', '内江', '四川', '中国', '1');
INSERT INTO `st_region_city` VALUES (10588, 'China', 'Sichuan', 'Leshan', '51', '11', '乐山', '四川', '中国', '1');
INSERT INTO `st_region_city` VALUES (10589, 'China', 'Sichuan', 'Nanchong', '51', '13', '南充', '四川', '中国', '1');
INSERT INTO `st_region_city` VALUES (10590, 'China', 'Sichuan', 'Meishan', '51', '14', '眉山', '四川', '中国', '1');
INSERT INTO `st_region_city` VALUES (10591, 'China', 'Sichuan', 'Yibin', '51', '15', '宜宾', '四川', '中国', '1');
INSERT INTO `st_region_city` VALUES (10592, 'China', 'Sichuan', 'Guang\'an', '51', '16', '广安', '四川', '中国', '1');
INSERT INTO `st_region_city` VALUES (10593, 'China', 'Sichuan', 'Dazhou', '51', '17', '达州', '四川', '中国', '1');
INSERT INTO `st_region_city` VALUES (10594, 'China', 'Sichuan', 'Ya\'an', '51', '18', '雅安', '四川', '中国', '1');
INSERT INTO `st_region_city` VALUES (10595, 'China', 'Sichuan', 'Bazhong', '51', '19', '巴中', '四川', '中国', '1');
INSERT INTO `st_region_city` VALUES (10596, 'China', 'Sichuan', 'Ziyang', '51', '20', '资阳', '四川', '中国', '1');
INSERT INTO `st_region_city` VALUES (10597, 'China', 'Sichuan', 'Aba Tibetan-Qiang Autonomous Prefecture', '51', '32', '阿坝', '四川', '中国', '1');
INSERT INTO `st_region_city` VALUES (10598, 'China', 'Sichuan', 'Garze Tibetan Autonomous Prefecture', '51', '33', '甘孜', '四川', '中国', '1');
INSERT INTO `st_region_city` VALUES (10599, 'China', 'Sichuan', 'Liangshan Yi Autonomous Prefecture', '51', '34', '凉山', '四川', '中国', '1');
INSERT INTO `st_region_city` VALUES (10600, 'China', 'Guizhou', 'Guiyang', '52', '1', '贵阳', '贵州', '中国', '1');
INSERT INTO `st_region_city` VALUES (10601, 'China', 'Guizhou', 'Liupanshui', '52', '2', '六盘水', '贵州', '中国', '1');
INSERT INTO `st_region_city` VALUES (10602, 'China', 'Guizhou', 'Zunyi', '52', '3', '遵义', '贵州', '中国', '1');
INSERT INTO `st_region_city` VALUES (10603, 'China', 'Guizhou', 'Anshun', '52', '4', '安顺', '贵州', '中国', '1');
INSERT INTO `st_region_city` VALUES (10604, 'China', 'Guizhou', 'Tongren', '52', '22', '铜仁', '贵州', '中国', '1');
INSERT INTO `st_region_city` VALUES (10605, 'China', 'Guizhou', 'Qianxinan Buyi-Miao Autonomous Prefecture', '52', '23', '黔西南', '贵州', '中国', '1');
INSERT INTO `st_region_city` VALUES (10606, 'China', 'Guizhou', 'Bijie', '52', '24', '毕节', '贵州', '中国', '1');
INSERT INTO `st_region_city` VALUES (10607, 'China', 'Guizhou', 'Qiandongnan Miao-Dong Autonomous Prefecture', '52', '26', '黔东南', '贵州', '中国', '1');
INSERT INTO `st_region_city` VALUES (10608, 'China', 'Guizhou', 'Qiannan Buyi Autonomous Prefecture', '52', '27', '黔南', '贵州', '中国', '1');
INSERT INTO `st_region_city` VALUES (10609, 'China', 'Yunnan', 'Kunming', '53', '1', '昆明', '云南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10610, 'China', 'Yunnan', 'Qujing', '53', '3', '曲靖', '云南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10611, 'China', 'Yunnan', 'Yuxi', '53', '4', '玉溪', '云南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10612, 'China', 'Yunnan', 'Baoshan', '53', '5', '保山', '云南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10613, 'China', 'Yunnan', 'Zhaotong', '53', '6', '昭通', '云南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10614, 'China', 'Yunnan', 'Lijiang', '53', '7', '丽江', '云南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10615, 'China', 'Yunnan', 'Pu\'er', '53', '8', '普洱', '云南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10616, 'China', 'Yunnan', 'Lincang', '53', '9', '临沧', '云南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10617, 'China', 'Yunnan', 'Chuxiong Yi Autonomous Prefecture', '53', '23', '楚雄', '云南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10618, 'China', 'Yunnan', 'Honghe Hani-Yi Autonomous Prefecture', '53', '25', '红河', '云南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10619, 'China', 'Yunnan', 'Wenshan Zhuang-Miao Autonomous Prefecture', '53', '26', '文山', '云南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10620, 'China', 'Yunnan', 'Xishuangbanna Dai Autonomous Prefecture', '53', '28', '西双版纳', '云南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10621, 'China', 'Yunnan', 'Dali Bai Autonomous Prefecture', '53', '29', '大理', '云南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10622, 'China', 'Yunnan', 'Dehong Dai-Jingpo Autonomous Prefecture', '53', '31', '德宏', '云南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10623, 'China', 'Yunnan', 'Nujiang Lisu Autonomous Prefecture', '53', '33', '怒江', '云南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10624, 'China', 'Yunnan', 'Diqing Tibetan Autonomous Prefecture', '53', '34', '迪庆', '云南', '中国', '1');
INSERT INTO `st_region_city` VALUES (10625, 'China', 'Tibet', 'Lhasa', '54', '1', '拉萨', '西藏', '中国', '1');
INSERT INTO `st_region_city` VALUES (10626, 'China', 'Tibet', 'Qamdo', '54', '21', '昌都', '西藏', '中国', '1');
INSERT INTO `st_region_city` VALUES (10627, 'China', 'Tibet', 'Shannan', '54', '22', '山南', '西藏', '中国', '1');
INSERT INTO `st_region_city` VALUES (10628, 'China', 'Tibet', 'Xigaze', '54', '23', '日喀则', '西藏', '中国', '1');
INSERT INTO `st_region_city` VALUES (10629, 'China', 'Tibet', 'Nagqu', '54', '24', '那曲', '西藏', '中国', '1');
INSERT INTO `st_region_city` VALUES (10630, 'China', 'Tibet', 'Ngari', '54', '25', '阿里', '西藏', '中国', '1');
INSERT INTO `st_region_city` VALUES (10631, 'China', 'Tibet', 'Nyingchi', '54', '26', '林芝', '西藏', '中国', '1');
INSERT INTO `st_region_city` VALUES (10632, 'China', 'Shaanxi', 'Xi\'an', '61', '1', '西安', '陕西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10633, 'China', 'Shaanxi', 'Tongchuan', '61', '2', '铜川', '陕西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10634, 'China', 'Shaanxi', 'Baoji', '61', '3', '宝鸡', '陕西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10635, 'China', 'Shaanxi', 'Xianyang', '61', '4', '咸阳', '陕西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10636, 'China', 'Shaanxi', 'Weinan', '61', '5', '渭南', '陕西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10637, 'China', 'Shaanxi', 'Yan\'an', '61', '6', '延安', '陕西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10638, 'China', 'Shaanxi', 'Hanzhong', '61', '7', '汉中', '陕西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10639, 'China', 'Shaanxi', 'Yulin', '61', '8', '榆林', '陕西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10640, 'China', 'Shaanxi', 'Ankang', '61', '9', '安康', '陕西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10641, 'China', 'Shaanxi', 'Shangluo', '61', '10', '商洛', '陕西', '中国', '1');
INSERT INTO `st_region_city` VALUES (10642, 'China', 'Gansu', 'Lanzhou', '62', '1', '兰州市', '甘肃', '中国', '1');
INSERT INTO `st_region_city` VALUES (10643, 'China', 'Gansu', 'Jinchang', '62', '2', '嘉峪关', '甘肃', '中国', '1');
INSERT INTO `st_region_city` VALUES (10644, 'China', 'Gansu', 'Baiyin', '62', '3', '金昌', '甘肃', '中国', '1');
INSERT INTO `st_region_city` VALUES (10645, 'China', 'Gansu', 'Tianshui', '62', '4', '白银', '甘肃', '中国', '1');
INSERT INTO `st_region_city` VALUES (10646, 'China', 'Gansu', 'Jiayuguan', '62', '5', '天水', '甘肃', '中国', '1');
INSERT INTO `st_region_city` VALUES (10647, 'China', 'Gansu', 'Wuwei', '62', '6', '武威', '甘肃', '中国', '1');
INSERT INTO `st_region_city` VALUES (10648, 'China', 'Gansu', 'Zhangye', '62', '7', '张掖', '甘肃', '中国', '1');
INSERT INTO `st_region_city` VALUES (10649, 'China', 'Gansu', 'Pingliang', '62', '8', '平凉', '甘肃', '中国', '1');
INSERT INTO `st_region_city` VALUES (10650, 'China', 'Gansu', 'Jiuquan', '62', '9', '酒泉', '甘肃', '中国', '1');
INSERT INTO `st_region_city` VALUES (10651, 'China', 'Gansu', 'Qingyang', '62', '10', '庆阳', '甘肃', '中国', '1');
INSERT INTO `st_region_city` VALUES (10652, 'China', 'Gansu', 'Dingxi', '62', '11', '定西', '甘肃', '中国', '1');
INSERT INTO `st_region_city` VALUES (10653, 'China', 'Gansu', 'Longnan', '62', '12', '陇南', '甘肃', '中国', '1');
INSERT INTO `st_region_city` VALUES (10654, 'China', 'Gansu', 'Linxia Hui Autonomous Prefecture', '62', '29', '临夏', '甘肃', '中国', '1');
INSERT INTO `st_region_city` VALUES (10655, 'China', 'Gansu', 'Gannan Tibetan Autonomous Prefecture', '62', '30', '甘南', '甘肃', '中国', '1');
INSERT INTO `st_region_city` VALUES (10656, 'China', 'Qinghai', 'Xining', '63', '1', '西宁', '青海', '中国', '1');
INSERT INTO `st_region_city` VALUES (10657, 'China', 'Qinghai', 'Haidong', '63', '21', '海东', '青海', '中国', '1');
INSERT INTO `st_region_city` VALUES (10658, 'China', 'Qinghai', 'Haibei Tibetan Autonomous Prefecture', '63', '22', '海北', '青海', '中国', '1');
INSERT INTO `st_region_city` VALUES (10659, 'China', 'Qinghai', 'Huangnan Tibetan Autonomous Prefecture', '63', '23', '黄南', '青海', '中国', '1');
INSERT INTO `st_region_city` VALUES (10660, 'China', 'Qinghai', 'Hainan Tibetan Autonomous Prefecture', '63', '25', '海南', '青海', '中国', '1');
INSERT INTO `st_region_city` VALUES (10661, 'China', 'Qinghai', 'Guoluo Tibetan Autonomous Prefecture', '63', '26', '果洛', '青海', '中国', '1');
INSERT INTO `st_region_city` VALUES (10662, 'China', 'Qinghai', 'Yushu Tibetan Autonomous Prefecture', '63', '27', '玉树', '青海', '中国', '1');
INSERT INTO `st_region_city` VALUES (10663, 'China', 'Qinghai', 'Haixi Mongol-Tibetan Autonomous Prefecture', '63', '28', '海西', '青海', '中国', '1');
INSERT INTO `st_region_city` VALUES (10664, 'China', 'Ningxia', 'Yinchuan', '64', '1', '银川', '宁夏', '中国', '1');
INSERT INTO `st_region_city` VALUES (10665, 'China', 'Ningxia', 'Shizuishan', '64', '2', '石嘴山', '宁夏', '中国', '1');
INSERT INTO `st_region_city` VALUES (10666, 'China', 'Ningxia', 'Wuzhong', '64', '3', '吴忠', '宁夏', '中国', '1');
INSERT INTO `st_region_city` VALUES (10667, 'China', 'Ningxia', 'Guyuan', '64', '4', '固原', '宁夏', '中国', '1');
INSERT INTO `st_region_city` VALUES (10668, 'China', 'Ningxia', 'Zhongwei', '64', '5', '中卫', '宁夏', '中国', '1');
INSERT INTO `st_region_city` VALUES (10669, 'China', 'Xinjiang', 'Urumqi', '65', '1', '乌鲁木齐', '新疆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10670, 'China', 'Xinjiang', 'Karamay', '65', '2', '克拉玛依', '新疆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10671, 'China', 'Xinjiang', 'Turpan', '65', '21', '吐鲁番', '新疆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10672, 'China', 'Xinjiang', 'Hami', '65', '22', '哈密', '新疆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10673, 'China', 'Xinjiang', 'Changji Hui Autonomous Prefecture', '65', '23', '昌吉', '新疆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10674, 'China', 'Xinjiang', 'Bortala Mongol Autonomous Prefecture', '65', '27', '博尔塔拉', '新疆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10675, 'China', 'Xinjiang', 'Bayingolin Mongol Autonomous Prefecture', '65', '28', '巴音郭楞', '新疆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10676, 'China', 'Xinjiang', 'Aksu', '65', '29', '阿克苏', '新疆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10677, 'China', 'Xinjiang', 'Kizilsu Kirgiz Autonomous Prefecture', '65', '30', '克孜勒苏', '新疆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10678, 'China', 'Xinjiang', 'Kashi', '65', '31', '喀什', '新疆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10679, 'China', 'Xinjiang', 'Hotan', '65', '32', '和田', '新疆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10680, 'China', 'Xinjiang', 'Ili Kazakh Autonomous Prefecture', '65', '40', '伊犁', '新疆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10681, 'China', 'Xinjiang', 'Tacheng', '65', '42', '塔城', '新疆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10682, 'China', 'Xinjiang', 'Altay', '65', '43', '阿勒泰', '新疆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10683, 'China', 'Xinjiang', 'Shihezi', '65', '91', '石河子', '新疆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10684, 'China', 'Xinjiang', 'Alar', '65', '92', '阿拉尔', '新疆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10685, 'China', 'Xinjiang', 'Tumsuk', '65', '93', '图木舒克', '新疆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10686, 'China', 'Xinjiang', 'Wujiaqu', '65', '94', '五家渠', '新疆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10687, 'China', 'Xinjiang', 'Beitun', '65', '95', '北屯', '新疆', '中国', '1');
INSERT INTO `st_region_city` VALUES (10688, 'China', 'Taiwan', 'Taipei City', '71', '1', '台北市', '台湾', '中国', '1');
INSERT INTO `st_region_city` VALUES (10689, 'China', 'Taiwan', 'Kaohsiung City', '71', '2', '高雄市', '台湾', '中国', '1');
INSERT INTO `st_region_city` VALUES (10690, 'China', 'Taiwan', 'Keelung City', '71', '3', '基隆市', '台湾', '中国', '1');
INSERT INTO `st_region_city` VALUES (10691, 'China', 'Taiwan', 'Taichung City', '71', '4', '台中市', '台湾', '中国', '1');
INSERT INTO `st_region_city` VALUES (10692, 'China', 'Taiwan', 'Tainan City', '71', '5', '台南市', '台湾', '中国', '1');
INSERT INTO `st_region_city` VALUES (10693, 'China', 'Taiwan', 'Hsinchu City', '71', '6', '新竹市', '台湾', '中国', '1');
INSERT INTO `st_region_city` VALUES (10694, 'China', 'Taiwan', 'Chiayi City', '71', '7', '嘉义市', '台湾', '中国', '1');
INSERT INTO `st_region_city` VALUES (10695, 'China', 'Taiwan', 'Taipei County', '71', '8', '台北县', '台湾', '中国', '1');
INSERT INTO `st_region_city` VALUES (10696, 'China', 'Taiwan', 'Ilan County', '71', '9', '宜兰县', '台湾', '中国', '1');
INSERT INTO `st_region_city` VALUES (10697, 'China', 'Taiwan', 'Taoyuan County', '71', '10', '桃园县', '台湾', '中国', '1');
INSERT INTO `st_region_city` VALUES (10698, 'China', 'Taiwan', 'Hsinchu County', '71', '11', '新竹县', '台湾', '中国', '1');
INSERT INTO `st_region_city` VALUES (10699, 'China', 'Taiwan', 'Miaoli County', '71', '12', '苗栗县', '台湾', '中国', '1');
INSERT INTO `st_region_city` VALUES (10700, 'China', 'Taiwan', 'Taichung County', '71', '13', '台中县', '台湾', '中国', '1');
INSERT INTO `st_region_city` VALUES (10701, 'China', 'Taiwan', 'Changhwa County', '71', '14', '彰化县', '台湾', '中国', '1');
INSERT INTO `st_region_city` VALUES (10702, 'China', 'Taiwan', 'Nantou County', '71', '15', '南投县', '台湾', '中国', '1');
INSERT INTO `st_region_city` VALUES (10703, 'China', 'Taiwan', 'Yunnlin County', '71', '16', '云林县', '台湾', '中国', '1');
INSERT INTO `st_region_city` VALUES (10704, 'China', 'Taiwan', 'Chiayi County', '71', '17', '嘉义县', '台湾', '中国', '1');
INSERT INTO `st_region_city` VALUES (10705, 'China', 'Taiwan', 'Tainan County', '71', '18', '台南县', '台湾', '中国', '1');
INSERT INTO `st_region_city` VALUES (10706, 'China', 'Taiwan', 'Kaohsiung County', '71', '19', '高雄县', '台湾', '中国', '1');
INSERT INTO `st_region_city` VALUES (10707, 'China', 'Taiwan', 'Pingtung County', '71', '20', '屏东县', '台湾', '中国', '1');
INSERT INTO `st_region_city` VALUES (10708, 'China', 'Taiwan', 'Taitung County', '71', '22', '台东县', '台湾', '中国', '1');
INSERT INTO `st_region_city` VALUES (10709, 'China', 'Taiwan', 'Hualian County', '71', '23', '花莲县', '台湾', '中国', '1');
INSERT INTO `st_region_city` VALUES (10710, 'China', 'Taiwan', 'Penghu County', '71', '21', '澎湖县', '台湾', '中国', '1');
INSERT INTO `st_region_city` VALUES (10711, 'Australia', 'Northern Territory', 'Palmerston', 'NT', 'PAL', '北帕默斯顿', '北部地区', '澳大利亚', 'AUS');
INSERT INTO `st_region_city` VALUES (10712, 'Australia', 'Northern Territory', 'Darwin', 'NT', 'DRW', '达尔文', '北部地区', '澳大利亚', 'AUS');
INSERT INTO `st_region_city` VALUES (10713, 'Australia', 'Canberra', 'Canberra', 'ACT', 'CBR', '堪培拉', '堪培拉', '澳大利亚', 'AUS');
INSERT INTO `st_region_city` VALUES (10714, 'Australia', 'Queensland', 'Brisbane', 'QLD', 'BNE', '布里斯班', '昆士兰', '澳大利亚', 'AUS');
INSERT INTO `st_region_city` VALUES (10715, 'Australia', 'Queensland', 'Gold Coast', 'QLD', 'OOL', '黄金海岸', '昆士兰', '澳大利亚', 'AUS');
INSERT INTO `st_region_city` VALUES (10716, 'Australia', 'Queensland', 'Cairns', 'QLD', 'CNS', '凯恩斯', '昆士兰', '澳大利亚', 'AUS');
INSERT INTO `st_region_city` VALUES (10717, 'Australia', 'Queensland', 'Caloundra', 'QLD', 'CUD', '日光海岸', '昆士兰', '澳大利亚', 'AUS');
INSERT INTO `st_region_city` VALUES (10718, 'Australia', 'Queensland', 'Townsville', 'QLD', 'TSV', '汤斯维尔', '昆士兰', '澳大利亚', 'AUS');
INSERT INTO `st_region_city` VALUES (10719, 'Australia', 'Queensland', 'Toowoomba', 'QLD', 'TWB', '图文巴', '昆士兰', '澳大利亚', 'AUS');
INSERT INTO `st_region_city` VALUES (10720, 'Australia', 'South Australia', 'Adelaide', 'SA', 'ADL', '阿德莱德', '南澳大利亚', '澳大利亚', 'AUS');
INSERT INTO `st_region_city` VALUES (10721, 'Australia', 'South Australia', 'Port Augusta', 'SA', 'PUG', '奥古斯塔港', '南澳大利亚', '澳大利亚', 'AUS');
INSERT INTO `st_region_city` VALUES (10722, 'Australia', 'South Australia', 'Mount Gambier', 'SA', 'MGB', '甘比亚山', '南澳大利亚', '澳大利亚', 'AUS');
INSERT INTO `st_region_city` VALUES (10723, 'Australia', 'South Australia', 'Whyalla', 'SA', 'WAY', '怀阿拉', '南澳大利亚', '澳大利亚', 'AUS');
INSERT INTO `st_region_city` VALUES (10724, 'Australia', 'South Australia', 'Port Lincoln', 'SA', 'PLO', '林肯港', '南澳大利亚', '澳大利亚', 'AUS');
INSERT INTO `st_region_city` VALUES (10725, 'Australia', 'South Australia', 'Murray Bridge', 'SA', 'MYB', '默里布里奇', '南澳大利亚', '澳大利亚', 'AUS');
INSERT INTO `st_region_city` VALUES (10726, 'Australia', 'South Australia', 'Port Pirie', 'SA', 'PPI', '皮里港', '南澳大利亚', '澳大利亚', 'AUS');
INSERT INTO `st_region_city` VALUES (10727, 'Australia', 'South Australia', 'Victor Harbor', 'SA', 'VHA', '维克托港', '南澳大利亚', '澳大利亚', 'AUS');
INSERT INTO `st_region_city` VALUES (10728, 'Australia', 'Tasmania', 'Burnie', 'TAS', 'BWT', '伯尼港', '塔斯马尼亚', '澳大利亚', 'AUS');
INSERT INTO `st_region_city` VALUES (10729, 'Australia', 'Tasmania', 'Devonport', 'TAS', 'DPO', '德文波特', '塔斯马尼亚', '澳大利亚', 'AUS');
INSERT INTO `st_region_city` VALUES (10730, 'Australia', 'Tasmania', 'Hobart', 'TAS', 'HBA', '霍巴特', '塔斯马尼亚', '澳大利亚', 'AUS');
INSERT INTO `st_region_city` VALUES (10731, 'Australia', 'Tasmania', 'Launceston', 'TAS', 'LST', '朗塞斯顿', '塔斯马尼亚', '澳大利亚', 'AUS');
INSERT INTO `st_region_city` VALUES (10732, 'Australia', 'Victoria', 'Geelong', 'VIC', 'GEX', '吉朗', '维多利亚', '澳大利亚', 'AUS');
INSERT INTO `st_region_city` VALUES (10733, 'Australia', 'Victoria', 'Melbourne', 'VIC', 'MEL', '墨尔本', '维多利亚', '澳大利亚', 'AUS');
INSERT INTO `st_region_city` VALUES (10734, 'Australia', 'Western Australia', 'Albany', 'WA', 'ALH', '奥尔巴尼', '西澳大利亚', '澳大利亚', 'AUS');
INSERT INTO `st_region_city` VALUES (10735, 'Australia', 'Western Australia', 'Bunbury', 'WA', 'BUY', '班伯里', '西澳大利亚', '澳大利亚', 'AUS');
INSERT INTO `st_region_city` VALUES (10736, 'Australia', 'Western Australia', 'Fremantle', 'WA', 'FRE', '弗里曼特尔港', '西澳大利亚', '澳大利亚', 'AUS');
INSERT INTO `st_region_city` VALUES (10737, 'Australia', 'Western Australia', 'Geraldton', 'WA', 'GET', '杰拉尔顿', '西澳大利亚', '澳大利亚', 'AUS');
INSERT INTO `st_region_city` VALUES (10738, 'Australia', 'Western Australia', 'Kalgoorlie', 'WA', 'KGI', '卡尔古利', '西澳大利亚', '澳大利亚', 'AUS');
INSERT INTO `st_region_city` VALUES (10739, 'Australia', 'Western Australia', 'Mandurah', 'WA', 'MDU', '曼哲拉', '西澳大利亚', '澳大利亚', 'AUS');
INSERT INTO `st_region_city` VALUES (10740, 'Australia', 'Western Australia', 'Perth', 'WA', 'PER', '珀斯', '西澳大利亚', '澳大利亚', 'AUS');
INSERT INTO `st_region_city` VALUES (10741, 'Australia', 'New South Wales', 'Newcastle', 'NSW', 'NTL', '纽卡斯尔', '新南威尔士', '澳大利亚', 'AUS');
INSERT INTO `st_region_city` VALUES (10742, 'Australia', 'New South Wales', 'Wollongong', 'NSW', 'WOL', '伍伦贡', '新南威尔士', '澳大利亚', 'AUS');
INSERT INTO `st_region_city` VALUES (10743, 'Australia', 'New South Wales', 'Sydney', 'NSW', 'HBS', '悉尼', '新南威尔士', '澳大利亚', 'AUS');
INSERT INTO `st_region_city` VALUES (10744, 'Korea', 'Daegu', 'Dalseong-gun', '27', 'DSG', '达城郡', '大邱', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10745, 'Korea', 'Daegu', 'Daegu', '27', 'TAE', '大邱', '大邱', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10746, 'Korea', 'Daegu', 'Suseong-gu', '27', 'SUS', '寿城区', '大邱', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10747, 'Korea', 'Gangwon-do', 'Chuncheon', '42', 'CHC', '春川市', '江原道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10748, 'Korea', 'Gangwon-do', 'Donghae', '42', 'TGH', '东海市', '江原道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10749, 'Korea', 'Gangwon-do', 'Goseong County', '42', 'GSG', '高城郡', '江原道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10750, 'Korea', 'Gangwon-do', 'Hoengseong County', '42', 'HSG', '横城郡', '江原道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10751, 'Korea', 'Gangwon-do', 'Hongcheon County', '42', 'HCN', '洪川郡', '江原道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10752, 'Korea', 'Gangwon-do', 'Hwacheon County', '42', 'HCH', '华川郡', '江原道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10753, 'Korea', 'Gangwon-do', 'Gangneung', '42', 'KAG', '江陵市', '江原道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10754, 'Korea', 'Gangwon-do', 'Jeongseon County', '42', 'JSE', '旌善郡', '江原道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10755, 'Korea', 'Gangwon-do', 'Inje County', '42', 'IJE', '麟蹄郡', '江原道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10756, 'Korea', 'Gangwon-do', 'Yeongwol County', '42', 'YWL', '宁越郡', '江原道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10757, 'Korea', 'Gangwon-do', 'Pyeongchang County', '42', 'POG', '平昌郡', '江原道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10758, 'Korea', 'Gangwon-do', 'Samcheok', '42', 'SUK', '三陟市', '江原道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10759, 'Korea', 'Gangwon-do', 'Sokcho', '42', 'SHO', '束草市', '江原道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10760, 'Korea', 'Gangwon-do', 'Taebaek', '42', 'TBK', '太白市', '江原道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10761, 'Korea', 'Gangwon-do', 'Cheorwon County', '42', 'CWN', '铁原郡', '江原道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10762, 'Korea', 'Gangwon-do', 'Yangyang County', '42', 'YNY', '襄阳郡', '江原道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10763, 'Korea', 'Gangwon-do', 'Yanggu County', '42', 'YGU', '杨口郡', '江原道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10764, 'Korea', 'Gangwon-do', 'Wonju', '42', 'WJU', '原州市', '江原道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10765, 'Korea', 'Gyeonggi-do', 'Anseong', '49', 'ASG', '安城市', '京畿道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10766, 'Korea', 'Gyeonggi-do', 'Ansan', '49', 'ASN', '安山市', '京畿道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10767, 'Korea', 'Gyeonggi-do', 'Anyang', '49', 'ANY', '安养市', '京畿道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10768, 'Korea', 'Gyeonggi-do', 'Pocheon', '49', 'POC', '抱川市', '京畿道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10769, 'Korea', 'Gyeonggi-do', 'Seongnam', '49', 'SEO', '城南市', '京畿道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10770, 'Korea', 'Gyeonggi-do', 'Dongducheon', '49', 'DDC', '东豆川市', '京畿道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10771, 'Korea', 'Gyeonggi-do', 'Bucheon', '49', 'BCN', '富川市', '京畿道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10772, 'Korea', 'Gyeonggi-do', 'Goyang', '49', 'GYG', '高阳市', '京畿道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10773, 'Korea', 'Gyeonggi-do', 'Gwangmyeong', '49', 'GMG', '光明市', '京畿道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10774, 'Korea', 'Gyeonggi-do', 'Gwangju', '49', 'KWU', '广州市', '京畿道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10775, 'Korea', 'Gyeonggi-do', 'Gwacheon', '49', 'GCN', '果川市', '京畿道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10776, 'Korea', 'Gyeonggi-do', 'Hanam', '49', 'HNM', '河南市', '京畿道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10777, 'Korea', 'Gyeonggi-do', 'Hwaseong', '49', 'HCH', '华城市', '京畿道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10778, 'Korea', 'Gyeonggi-do', 'Gapyeong County', '49', 'GPG', '加平郡', '京畿道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10779, 'Korea', 'Gyeonggi-do', 'Gimpo', '49', 'GMP', '金浦市', '京畿道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10780, 'Korea', 'Gyeonggi-do', 'Guri', '49', 'GRI', '九里市', '京畿道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10781, 'Korea', 'Gyeonggi-do', 'Gunpo', '49', 'GUN', '军浦市', '京畿道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10782, 'Korea', 'Gyeonggi-do', 'Yeoju County', '49', 'YJU', '骊州郡', '京畿道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10783, 'Korea', 'Gyeonggi-do', 'Icheon', '49', 'ICE', '利川市', '京畿道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10784, 'Korea', 'Gyeonggi-do', 'Yeoncheon County', '49', 'YCN', '涟川郡', '京畿道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10785, 'Korea', 'Gyeonggi-do', 'Yongin', '49', 'YNG', '龙仁市', '京畿道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10786, 'Korea', 'Gyeonggi-do', 'Namyangju', '49', 'NYU', '南杨州市', '京畿道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10787, 'Korea', 'Gyeonggi-do', 'Pyeongtaek', '49', 'PTK', '平泽市', '京畿道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10788, 'Korea', 'Gyeonggi-do', 'Paju', '49', 'PJU', '坡州市', '京畿道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10789, 'Korea', 'Gyeonggi-do', 'Siheung', '49', 'SHE', '始兴市', '京畿道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10790, 'Korea', 'Gyeonggi-do', 'Suwon', '49', 'SUO', '水原市', '京畿道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10791, 'Korea', 'Gyeonggi-do', 'Osan', '49', 'OSN', '乌山市', '京畿道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10792, 'Korea', 'Gyeonggi-do', 'Yangpyeong County', '49', 'YPG', '扬平郡', '京畿道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10793, 'Korea', 'Gyeonggi-do', 'Yangju', '49', 'YYU', '杨州市', '京畿道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10794, 'Korea', 'Gyeonggi-do', 'Uiwang', '49', 'UWN', '仪旺市', '京畿道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10795, 'Korea', 'Gyeonggi-do', 'Uijeongbu', '49', 'UIJ', '议政府市', '京畿道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10796, 'Korea', 'Chungcheongbuk-do', 'Andong', '43', 'ADG', '安东市', '庆尚北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10797, 'Korea', 'Chungcheongbuk-do', 'Bonghwa County', '43', 'BHA', '奉化郡', '庆尚北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10798, 'Korea', 'Chungcheongbuk-do', 'Goryeong County', '43', 'GRG', '高灵郡', '庆尚北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10799, 'Korea', 'Chungcheongbuk-do', 'Gumi', '43', 'KUM', '龟尾市', '庆尚北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10800, 'Korea', 'Chungcheongbuk-do', 'Gimcheon', '43', 'KMC', '金泉市', '庆尚北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10801, 'Korea', 'Chungcheongbuk-do', 'Gunwi County', '43', 'GWI', '军威郡', '庆尚北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10802, 'Korea', 'Chungcheongbuk-do', 'Yecheon County', '43', 'YEC', '醴泉郡', '庆尚北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10803, 'Korea', 'Chungcheongbuk-do', 'Pohang', '43', 'KPO', '浦项市', '庆尚北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10804, 'Korea', 'Chungcheongbuk-do', 'Chilgok County', '43', 'CGK', '漆谷郡', '庆尚北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10805, 'Korea', 'Chungcheongbuk-do', 'Cheongdo County', '43', 'CDO', '淸道郡', '庆尚北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10806, 'Korea', 'Chungcheongbuk-do', 'Cheongsong County', '43', 'CSG', '靑松郡', '庆尚北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10807, 'Korea', 'Chungcheongbuk-do', 'Gyeongsan', '43', 'GYS', '庆山市', '庆尚北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10808, 'Korea', 'Chungcheongbuk-do', 'Gyeongju', '43', 'GJU', '庆州市', '庆尚北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10809, 'Korea', 'Chungcheongbuk-do', 'Yeongju', '43', 'YEJ', '荣州市', '庆尚北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10810, 'Korea', 'Chungcheongbuk-do', 'Sangju', '43', 'SJU', '尙州市', '庆尚北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10811, 'Korea', 'Chungcheongbuk-do', 'Uljin County', '43', 'UJN', '蔚珍郡', '庆尚北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10812, 'Korea', 'Chungcheongbuk-do', 'Mungyeong', '43', 'MGG', '闻庆市', '庆尚北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10813, 'Korea', 'Chungcheongbuk-do', 'Seongju County', '43', 'SEJ', '星州郡', '庆尚北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10814, 'Korea', 'Chungcheongbuk-do', 'Uiseong County', '43', 'USG', '义城郡', '庆尚北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10815, 'Korea', 'Chungcheongbuk-do', 'Yeongyang County', '43', 'YYG', '英阳郡', '庆尚北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10816, 'Korea', 'Chungcheongbuk-do', 'Yeongdeok County', '43', 'YDK', '盈德郡', '庆尚北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10817, 'Korea', 'Chungcheongbuk-do', 'Yeongcheon', '43', 'YCH', '永川市', '庆尚北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10818, 'Korea', 'Chungcheongbuk-do', 'Ulleung County', '43', 'ULG', '郁陵郡', '庆尚北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10819, 'Korea', 'Chungcheongnam-do', 'Changnyeong County', '44', 'CNG', '昌宁郡', '庆尚南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10820, 'Korea', 'Chungcheongnam-do', 'Changwon', '44', 'CHW', '昌原市', '庆尚南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10821, 'Korea', 'Chungcheongnam-do', 'Goseong County', '44', 'GSO', '固城郡', '庆尚南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10822, 'Korea', 'Chungcheongnam-do', 'Hadong County', '44', 'HDG', '河东郡', '庆尚南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10823, 'Korea', 'Chungcheongnam-do', 'Gimhae', '44', 'KMH', '金海市', '庆尚南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10824, 'Korea', 'Chungcheongnam-do', 'Jinju', '44', 'HIN', '晋州市', '庆尚南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10825, 'Korea', 'Chungcheongnam-do', 'Geochang County', '44', 'GCH', '居昌郡', '庆尚南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10826, 'Korea', 'Chungcheongnam-do', 'Geoje', '44', 'KJE', '巨济市', '庆尚南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10827, 'Korea', 'Chungcheongnam-do', 'Yangsan', '44', 'YSN', '梁山市', '庆尚南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10828, 'Korea', 'Chungcheongnam-do', 'Masan', '44', 'MAS', '马山市', '庆尚南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10829, 'Korea', 'Chungcheongnam-do', 'Miryang', '44', 'MIR', '密阳市', '庆尚南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10830, 'Korea', 'Chungcheongnam-do', 'Namhae County', '44', 'NHE', '南海郡', '庆尚南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10831, 'Korea', 'Chungcheongnam-do', 'Sancheong County', '44', 'SCH', '山淸郡', '庆尚南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10832, 'Korea', 'Chungcheongnam-do', 'Sacheon', '44', 'SAH', '泗川市', '庆尚南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10833, 'Korea', 'Chungcheongnam-do', 'Tongyeong', '44', 'TYG', '统营市', '庆尚南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10834, 'Korea', 'Chungcheongnam-do', 'Hapcheon County', '44', 'HCE', '陜川郡', '庆尚南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10835, 'Korea', 'Chungcheongnam-do', 'Haman County', '44', 'HAN', '咸安郡', '庆尚南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10836, 'Korea', 'Chungcheongnam-do', 'Hamyang County', '44', 'HYG', '咸阳郡', '庆尚南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10837, 'Korea', 'Chungcheongnam-do', 'Uiryeong County', '44', 'URG', '宜宁郡', '庆尚南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10838, 'Korea', 'Chungcheongnam-do', 'Jinhae', '44', 'CHF', '鎭海市', '庆尚南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10839, 'Korea', 'Gyeongsangbuk-do', 'Sunchang County', '47', 'SCG', '淳昌郡', '全罗北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10840, 'Korea', 'Gyeongsangbuk-do', 'Buan County', '47', 'PUS', '扶安郡', '全罗北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10841, 'Korea', 'Gyeongsangbuk-do', 'Gochang County', '47', 'GCG', '高敞郡', '全罗北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10842, 'Korea', 'Gyeongsangbuk-do', 'Gimje', '47', 'GJE', '金堤市', '全罗北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10843, 'Korea', 'Gyeongsangbuk-do', 'Jeongeup', '47', 'JEO', '井邑市', '全罗北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10844, 'Korea', 'Gyeongsangbuk-do', 'Muju County', '47', 'MJU', '茂朱郡', '全罗北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10845, 'Korea', 'Gyeongsangbuk-do', 'Namwon', '47', 'NWN', '南原市', '全罗北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10846, 'Korea', 'Gyeongsangbuk-do', 'Jeonju', '47', 'JNJ', '全州市', '全罗北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10847, 'Korea', 'Gyeongsangbuk-do', 'Gunsan', '47', 'KUV', '群山市', '全罗北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10848, 'Korea', 'Gyeongsangbuk-do', 'Imsil County', '47', 'ISL', '任实郡', '全罗北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10849, 'Korea', 'Gyeongsangbuk-do', 'Wanju County', '47', 'WAJ', '完州郡', '全罗北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10850, 'Korea', 'Gyeongsangbuk-do', 'Iksan', '47', 'IKS', '益山市', '全罗北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10851, 'Korea', 'Gyeongsangbuk-do', 'Jangsu County', '47', 'JSU', '长水郡', '全罗北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10852, 'Korea', 'Gyeongsangbuk-do', 'Jinan County', '47', 'JAN', '鎭安郡', '全罗北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10853, 'Korea', 'Gyeongsangnam-do', 'Boseong County', '48', 'BSG', '宝城郡', '全罗南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10854, 'Korea', 'Gyeongsangnam-do', 'Goheung County', '48', 'GHG', '高兴郡', '全罗南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10855, 'Korea', 'Gyeongsangnam-do', 'Gokseong County', '48', 'GSE', '谷城郡', '全罗南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10856, 'Korea', 'Gyeongsangnam-do', 'Wando County', '48', 'WND', '莞岛郡', '全罗南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10857, 'Korea', 'Gyeongsangnam-do', 'Gwangyang', '48', 'KAN', '光阳市', '全罗南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10858, 'Korea', 'Gyeongsangnam-do', 'Haenam County', '48', 'HAE', '海南郡', '全罗南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10859, 'Korea', 'Gyeongsangnam-do', 'Hwasun County', '48', 'HSN', '和顺郡', '全罗南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10860, 'Korea', 'Gyeongsangnam-do', 'Gangjin County', '48', 'GJN', '康津郡', '全罗南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10861, 'Korea', 'Gyeongsangnam-do', 'Yeosu', '48', 'YOS', '丽水市', '全罗南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10862, 'Korea', 'Gyeongsangnam-do', 'Yeonggwang County', '48', 'YGG', '灵光郡', '全罗南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10863, 'Korea', 'Gyeongsangnam-do', 'Yeongam County', '48', 'YAM', '灵岩郡', '全罗南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10864, 'Korea', 'Gyeongsangnam-do', 'Naju', '48', 'NJU', '罗州市', '全罗南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10865, 'Korea', 'Gyeongsangnam-do', 'Mokpo', '48', 'MOK', '木浦市', '全罗南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10866, 'Korea', 'Gyeongsangnam-do', 'Gurye County', '48', 'GRE', '求礼郡', '全罗南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10867, 'Korea', 'Gyeongsangnam-do', 'Suncheon', '48', 'SYS', '顺天市', '全罗南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10868, 'Korea', 'Gyeongsangnam-do', 'Damyang County', '48', 'DYA', '潭阳郡', '全罗南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10869, 'Korea', 'Gyeongsangnam-do', 'Muan County', '48', 'MAN', '务安郡', '全罗南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10870, 'Korea', 'Gyeongsangnam-do', 'Hampyeong County', '48', 'HPG', '咸平郡', '全罗南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10871, 'Korea', 'Gyeongsangnam-do', 'Sinan County', '48', 'SAN', '新安郡', '全罗南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10872, 'Korea', 'Gyeongsangnam-do', 'Jangseong County', '48', 'JSN', '长城郡', '全罗南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10873, 'Korea', 'Gyeongsangnam-do', 'Jangheung County', '48', 'JHG', '长兴郡', '全罗南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10874, 'Korea', 'Gyeongsangnam-do', 'Jindo County', '48', 'JDO', '珍岛郡', '全罗南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10875, 'Korea', 'Jeollabuk-do', 'Boeun County', '45', 'BEN', '报恩郡', '忠清北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10876, 'Korea', 'Jeollabuk-do', 'Jeungpyeong County', '45', 'JYG', '曾坪郡', '忠清北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10877, 'Korea', 'Jeollabuk-do', 'Danyang County', '45', 'DYG', '丹阳郡', '忠清北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10878, 'Korea', 'Jeollabuk-do', 'Jecheon', '45', 'JCH', '堤川市', '忠清北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10879, 'Korea', 'Jeollabuk-do', 'Goesan County', '45', 'GSN', '槐山郡', '忠清北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10880, 'Korea', 'Jeollabuk-do', 'Cheongwon County', '45', 'CWO', '淸原郡', '忠清北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10881, 'Korea', 'Jeollabuk-do', 'Cheongju', '45', 'CJJ', '淸州市', '忠清北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10882, 'Korea', 'Jeollabuk-do', 'Okcheon County', '45', 'OCN', '沃川郡', '忠清北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10883, 'Korea', 'Jeollabuk-do', 'Eumseong County', '45', 'ESG', '阴城郡', '忠清北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10884, 'Korea', 'Jeollabuk-do', 'Yeongdong County', '45', 'YDG', '永同郡', '忠清北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10885, 'Korea', 'Jeollabuk-do', 'Jincheon County', '45', 'JCN', '鎭川郡', '忠清北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10886, 'Korea', 'Jeollabuk-do', 'Chungju', '45', 'CHU', '忠州市', '忠清北道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10887, 'Korea', 'Jeollanam-do', 'Boryeong', '46', 'BOR', '保宁市', '忠清南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10888, 'Korea', 'Jeollanam-do', 'Buyeo County', '46', 'BYO', '扶余郡', '忠清南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10889, 'Korea', 'Jeollanam-do', 'Gongju', '46', 'GOJ', '公州市', '忠清南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10890, 'Korea', 'Jeollanam-do', 'Hongseong County', '46', 'HSE', '洪城郡', '忠清南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10891, 'Korea', 'Jeollanam-do', 'Gyeryong', '46', 'GYE', '鸡龙市', '忠清南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10892, 'Korea', 'Jeollanam-do', 'Geumsan County', '46', 'GSA', '锦山郡', '忠清南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10893, 'Korea', 'Jeollanam-do', 'Yesan County', '46', 'YOS', '礼山郡', '忠清南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10894, 'Korea', 'Jeollanam-do', 'Nonsan', '46', 'NSN', '论山市', '忠清南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10895, 'Korea', 'Jeollanam-do', 'Cheongyang County', '46', 'CYG', '青阳郡', '忠清南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10896, 'Korea', 'Jeollanam-do', 'Seosan', '46', 'SSA', '瑞山市', '忠清南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10897, 'Korea', 'Jeollanam-do', 'Seocheon County', '46', 'SCE', '舒川郡', '忠清南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10898, 'Korea', 'Jeollanam-do', 'Taean County', '46', 'TAN', '泰安郡', '忠清南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10899, 'Korea', 'Jeollanam-do', 'Dangjin County', '46', 'TJI', '唐津郡', '忠清南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10900, 'Korea', 'Jeollanam-do', 'Cheonan', '46', 'CHO', '天安市', '忠清南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10901, 'Korea', 'Jeollanam-do', 'Asan', '46', 'ASA', '牙山市', '忠清南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10902, 'Korea', 'Jeollanam-do', 'Yeongi County', '46', 'YGI', '燕岐郡', '忠清南道', '韩国', 'KOR');
INSERT INTO `st_region_city` VALUES (10903, 'Malaysia', 'Pulau Pinang', 'Butterworth', 'PH', 'BWH', '北海', '槟榔屿', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10904, 'Malaysia', 'Pulau Pinang', 'George Town', 'PH', 'PEN', '槟城', '槟榔屿', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10905, 'Malaysia', 'Pulau Pinang', 'Bukit Mertajam', 'PH', 'BMJ', '大山脚', '槟榔屿', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10906, 'Malaysia', 'Pulau Pinang', 'Nibong Tebal', 'PH', 'NTE', '高渊', '槟榔屿', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10907, 'Malaysia', 'Perlis', 'Kangar', 'PS', 'KGR', '加央', '玻璃市', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10908, 'Malaysia', 'Terengganu', 'Kemaman', 'TR', 'KEM', '甘马挽', '丁加奴', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10909, 'Malaysia', 'Terengganu', 'Kuala Terengganu', 'TR', 'TGG', '瓜拉丁加奴', '丁加奴', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10910, 'Malaysia', 'Terengganu', 'Dungun', 'TR', 'DGN', '龙运', '丁加奴', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10911, 'Malaysia', 'Terengganu', 'Marang', 'TR', 'MAR', '马江', '丁加奴', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10912, 'Malaysia', 'Terengganu', 'Setiu', 'TR', 'SET', '实兆', '丁加奴', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10913, 'Malaysia', 'Terengganu', 'Hulu', 'TR', 'HUL', '乌鲁', '丁加奴', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10914, 'Malaysia', 'Terengganu', 'Besut', 'TR', 'BES', '勿述', '丁加奴', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10915, 'Malaysia', 'Kedah', 'Padang Terap', 'KD', 'PGT', '巴东得腊', '吉打', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10916, 'Malaysia', 'Kedah', 'Pendang', 'KD', 'PEN', '笨筒', '吉打', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10917, 'Malaysia', 'Kedah', 'Langkawi', 'KD', 'LGK', '浮罗交怡', '吉打', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10918, 'Malaysia', 'Kedah', 'Kota Setar', 'KD', 'KOR', '哥打士打', '吉打', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10919, 'Malaysia', 'Kedah', 'Kubang Pasu', 'KD', 'KPA', '古邦巴素', '吉打', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10920, 'Malaysia', 'Kedah', 'Kuala Muda', 'KD', 'KMU', '瓜拉姆达', '吉打', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10921, 'Malaysia', 'Kedah', 'Baling', 'KD', 'BLZ', '华玲', '吉打', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10922, 'Malaysia', 'Kedah', 'Kulim', 'KD', 'KLM', '居林', '吉打', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10923, 'Malaysia', 'Kedah', 'Bandar Baharu', 'KD', 'BMA', '万拉峇鲁', '吉打', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10924, 'Malaysia', 'Kelantan', 'Pasir Putih', 'KN', 'PPU', '巴西富地', '吉兰丹', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10925, 'Malaysia', 'Kelantan', 'Pasir Mas', 'KN', 'PMA', '巴西马', '吉兰丹', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10926, 'Malaysia', 'Kelantan', 'Tanah Merah', 'KN', 'TMR', '丹那美拉', '吉兰丹', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10927, 'Malaysia', 'Kelantan', 'Tumpat', 'KN', 'TUM', '道北', '吉兰丹', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10928, 'Malaysia', 'Kelantan', 'Bachok', 'KN', 'BAC', '登卓', '吉兰丹', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10929, 'Malaysia', 'Kelantan', 'Kota Bharu', 'KN', 'KBR', '哥打巴鲁', '吉兰丹', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10930, 'Malaysia', 'Kelantan', 'Kuala Krai', 'KN', 'KUG', '瓜拉吉赖', '吉兰丹', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10931, 'Malaysia', 'Kelantan', 'Gua Musang', 'KN', 'GMU', '话望生', '吉兰丹', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10932, 'Malaysia', 'Kelantan', 'Machang', 'KN', 'MAC', '马樟', '吉兰丹', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10933, 'Malaysia', 'Kelantan', 'Jeli', 'KN', 'JEL', '日里', '吉兰丹', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10934, 'Malaysia', 'Kuala Lumpur', 'Kuala Lumpur', 'KL', 'KUL', '吉隆坡', '吉隆坡', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10935, 'Malaysia', 'Malacca', 'Melaka', 'ML', 'MEL', '马六甲市', '马六甲', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10936, 'Malaysia', 'Malacca', 'Alor Gajah', 'ML', 'AOG', '亚罗牙也', '马六甲', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10937, 'Malaysia', 'Malacca', 'Jasin', 'ML', 'JAS', '野新', '马六甲', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10938, 'Malaysia', 'Labuan', 'Labuan', 'LB', 'LBU', '纳闽', '纳闽', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10939, 'Malaysia', 'Labuan', 'Victoria', 'LB', 'VIC', '维多利亚', '纳闽', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10940, 'Malaysia', 'Pahang', 'Bera', 'PG', 'BER', '百乐', '彭亨', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10941, 'Malaysia', 'Pahang', 'Pekan', 'PG', 'PEK', '北根', '彭亨', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10942, 'Malaysia', 'Pahang', 'Temerloh', 'PG', 'TEM', '淡马鲁', '彭亨', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10943, 'Malaysia', 'Pahang', 'Jerantut', 'PG', 'JER', '而连突', '彭亨', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10944, 'Malaysia', 'Pahang', 'Kuantan', 'PG', 'KUA', '关丹', '彭亨', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10945, 'Malaysia', 'Pahang', 'Cameron Highlands', 'PG', 'CAH', '金马仑高原', '彭亨', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10946, 'Malaysia', 'Pahang', 'Raub', 'PG', 'RAU', '劳勿', '彭亨', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10947, 'Malaysia', 'Pahang', 'Kuala Lipis', 'PG', 'KUL', '立卑', '彭亨', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10948, 'Malaysia', 'Pahang', 'Maran', 'PG', 'MAR', '马兰', '彭亨', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10949, 'Malaysia', 'Pahang', 'Bentong', 'PG', 'BEN', '文冬', '彭亨', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10950, 'Malaysia', 'Pahang', 'Rompin', 'PG', 'TOM', '云冰', '彭亨', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10951, 'Malaysia', 'Perak', 'Teluk Intan', 'PK', 'TAS', '安顺', '霹雳', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10952, 'Malaysia', 'Perak', 'Tanjung Malim', 'PK', 'TAM', '丹绒马', '霹雳', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10953, 'Malaysia', 'Perak', 'Sungai Siput', 'PK', 'SSP', '和丰', '霹雳', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10954, 'Malaysia', 'Perak', 'Lumut', 'PK', 'LUM', '紅土坎', '霹雳', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10955, 'Malaysia', 'Perak', 'Batu Gajah', 'PK', 'BGA', '华都牙也', '霹雳', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10956, 'Malaysia', 'Perak', 'Kuala Kangsar', 'PK', 'KAR', '江沙', '霹雳', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10957, 'Malaysia', 'Perak', 'Taiping', 'PK', 'TPG', '太平', '霹雳', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10958, 'Malaysia', 'Perak', 'Ipoh', 'PK', 'IPH', '怡保', '霹雳', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10959, 'Malaysia', 'Johor', 'Pontian', 'JH', 'POW', '笨珍', '柔佛', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10960, 'Malaysia', 'Johor', 'Mersing', 'JH', 'MEP', '丰盛港', '柔佛', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10961, 'Malaysia', 'Johor', 'Kota Tinggi', 'JH', 'KTI', '哥打丁宜', '柔佛', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10962, 'Malaysia', 'Johor', 'Kluang', 'JH', 'KLA', '居銮', '柔佛', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10963, 'Malaysia', 'Johor', 'Batu Pahat', 'JH', 'BAT', '峇株巴辖', '柔佛', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10964, 'Malaysia', 'Johor', 'Muar', 'JH', 'MUA', '麻坡', '柔佛', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10965, 'Malaysia', 'Johor', 'Segamat', 'JH', 'SGM', '昔加末', '柔佛', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10966, 'Malaysia', 'Johor', 'Johor Bahru', 'JH', 'JHB', '新山', '柔佛', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10967, 'Malaysia', 'Negeri Sembilan', 'Port Dickson', 'NS', 'PDI', '波德申', '森美兰', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10968, 'Malaysia', 'Negeri Sembilan', 'Tampin', 'NS', 'TAI', '淡边', '森美兰', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10969, 'Malaysia', 'Negeri Sembilan', 'Seremban', 'NS', 'SRB', '芙蓉', '森美兰', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10970, 'Malaysia', 'Negeri Sembilan', 'Kuala Pilah', 'NS', 'KPI', '瓜拉庇劳', '森美兰', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10971, 'Malaysia', 'Negeri Sembilan', 'Rembau', 'NS', 'REM', '林茂', '森美兰', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10972, 'Malaysia', 'Negeri Sembilan', 'Jempol', 'NS', 'JEP', '仁保', '森美兰', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10973, 'Malaysia', 'Negeri Sembilan', 'Jelebu', 'NS', 'JEL', '日叻务', '森美兰', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10974, 'Malaysia', 'Sabah', 'Papar', 'SB', 'PAP', '吧巴', '沙巴', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10975, 'Malaysia', 'Sabah', 'Beaufort', 'SB', 'BEF', '保佛', '沙巴', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10976, 'Malaysia', 'Sabah', 'Beluran', 'SB', 'BEL', '比鲁兰', '沙巴', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10977, 'Malaysia', 'Sabah', 'Pitas', 'SB', 'PIT', '必达士', '沙巴', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10978, 'Malaysia', 'Sabah', 'Penampang', 'SB', 'PMP', '兵南邦', '沙巴', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10979, 'Malaysia', 'Sabah', 'Tambunan', 'SB', 'TAB', '担布南', '沙巴', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10980, 'Malaysia', 'Sabah', 'Tenom', 'SB', 'TEN', '丹南', '沙巴', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10981, 'Malaysia', 'Sabah', 'Tawau', 'SB', 'TAW', '斗湖', '沙巴', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10982, 'Malaysia', 'Sabah', 'Tuaran', 'SB', 'TUR', '斗亚兰', '沙巴', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10983, 'Malaysia', 'Sabah', 'Kota Kinabalu', 'SB', 'BKI', '哥打基纳巴鲁', '沙巴', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10984, 'Malaysia', 'Sabah', 'Kota Marudu', 'SB', 'KMU', '哥打马鲁都', '沙巴', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10985, 'Malaysia', 'Sabah', 'Keningau', 'SB', 'KEG', '根地咬', '沙巴', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10986, 'Malaysia', 'Sabah', 'Kudat', 'SB', 'KUD', '古达', '沙巴', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10987, 'Malaysia', 'Sabah', 'Kota Belud', 'SB', 'KBD', '古打毛律', '沙巴', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10988, 'Malaysia', 'Sabah', 'Kunak', 'SB', 'KUN', '古纳', '沙巴', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10989, 'Malaysia', 'Sabah', 'Kuala Penyu', 'SB', 'KPU', '瓜拉班尤', '沙巴', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10990, 'Malaysia', 'Sabah', 'Kinabatangan', 'SB', 'KBT', '京那巴登岸', '沙巴', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10991, 'Malaysia', 'Sabah', 'Ranau', 'SB', 'RNU', '兰脑', '沙巴', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10992, 'Malaysia', 'Sabah', 'Lahad Datu', 'SB', 'LDU', '拿笃', '沙巴', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10993, 'Malaysia', 'Sabah', 'Nabawan', 'SB', 'NAB', '纳巴湾', '沙巴', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10994, 'Malaysia', 'Sabah', 'Sandakan', 'SB', 'SDK', '山打根', '沙巴', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10995, 'Malaysia', 'Sabah', 'Sipitang', 'SB', 'SPT', '西比陶', '沙巴', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10996, 'Malaysia', 'Sabah', 'Semporna', 'SB', 'SMM', '仙本那', '沙巴', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10997, 'Malaysia', 'Sarawak', 'Kuching', 'SR', 'KCH', '古晋', '沙捞越', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10998, 'Malaysia', 'Sarawak', 'Kapit', 'SR', 'KPI', '加帛', '沙捞越', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (10999, 'Malaysia', 'Sarawak', 'Limbang', 'SR', 'LMN', '林梦', '沙捞越', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (11000, 'Malaysia', 'Sarawak', 'Miri', 'SR', 'MYY', '美里', '沙捞越', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (11001, 'Malaysia', 'Sarawak', 'Bintulu', 'SR', 'BTU', '民都鲁', '沙捞越', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (11002, 'Malaysia', 'Sarawak', 'Mukah', 'SR', 'MKM', '木胶', '沙捞越', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (11003, 'Malaysia', 'Sarawak', 'Betong', 'SR', 'BTG', '木中', '沙捞越', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (11004, 'Malaysia', 'Sarawak', 'Samarahan', 'SR', 'SMH', '三马拉汉', '沙捞越', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (11005, 'Malaysia', 'Sarawak', 'Sri Aman', 'SR', 'SAM', '斯里阿曼', '沙捞越', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (11006, 'Malaysia', 'Sarawak', 'Sarikei', 'SR', 'SAR', '泗里街', '沙捞越', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (11007, 'Malaysia', 'Sarawak', 'Sibu', 'SR', 'SBW', '泗务', '沙捞越', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (11008, 'Malaysia', 'Selangor', 'Petaling', 'SL', 'PJA', '八打灵', '雪兰莪', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (11009, 'Malaysia', 'Selangor', 'Gombak', 'SL', 'GOM', '鹅麦', '雪兰莪', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (11010, 'Malaysia', 'Selangor', 'Kuala Langat', 'SL', 'KLG', '瓜拉冷岳', '雪兰莪', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (11011, 'Malaysia', 'Selangor', 'Kuala Selangor', 'SL', 'KSL', '瓜拉雪兰莪', '雪兰莪', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (11012, 'Malaysia', 'Selangor', 'Sabak Bernam', 'SL', 'SBM', '沙白安南', '雪兰莪', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (11013, 'Malaysia', 'Selangor', 'Hulu Langat', 'SL', 'HUL', '乌鲁冷岳', '雪兰莪', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (11014, 'Malaysia', 'Selangor', 'Hulu Selangor', 'SL', 'HUS', '乌鲁雪兰莪', '雪兰莪', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (11015, 'Malaysia', 'Selangor', 'Sepang', 'SL', 'SEP', '雪邦', '雪兰莪', '马来西亚', 'MYS');
INSERT INTO `st_region_city` VALUES (11016, 'United States', 'Arkansas', 'Fayetteville', 'AR', 'FYV', '费耶特维尔', '阿肯色', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11017, 'United States', 'Arkansas', 'Fort Smith', 'AR', 'FSM', '史密斯堡', '阿肯色', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11018, 'United States', 'Arkansas', 'Little Rock', 'AR', 'LIT', '小石城', '阿肯色', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11019, 'United States', 'Alabama', 'Birmingham', 'AL', 'BHM', '伯明罕', '阿拉巴马', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11020, 'United States', 'Alabama', 'Montgomery', 'AL', 'MGM', '蒙哥马利', '阿拉巴马', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11021, 'United States', 'Alabama', 'Mobile', 'AL', 'MOB', '莫比尔', '阿拉巴马', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11022, 'United States', 'Alaska', 'Anchorage', 'AK', 'ANC', '安克雷奇', '阿拉斯加', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11023, 'United States', 'Alaska', 'Fairbanks', 'AK', 'FAI', '费尔班克斯', '阿拉斯加', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11024, 'United States', 'Alaska', 'Juneau', 'AK', 'JNU', '朱诺', '阿拉斯加', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11025, 'United States', 'Idaho', 'Idaho Falls', 'ID', 'IDA', '爱达荷福尔斯', '爱达荷', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11026, 'United States', 'Idaho', 'Pocatello', 'ID', 'PIH', '波卡特洛', '爱达荷', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11027, 'United States', 'Idaho', 'Boise', 'ID', 'BOI', '博伊西', '爱达荷', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11028, 'United States', 'Idaho', 'Blackfoot', 'ID', 'BLK', '布莱克富特', '爱达荷', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11029, 'United States', 'Idaho', 'Coeur d\'Alene', 'ID', 'COE', '科达伦', '爱达荷', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11030, 'United States', 'Idaho', 'Lewiston', 'ID', 'LWS', '刘易斯顿', '爱达荷', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11031, 'United States', 'Idaho', 'Moscow', 'ID', 'MJL', '莫斯科', '爱达荷', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11032, 'United States', 'Idaho', 'Murphy', 'ID', 'ZMU', '墨菲', '爱达荷', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11033, 'United States', 'Idaho', 'Nampa', 'ID', 'NPA', '楠帕', '爱达荷', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11034, 'United States', 'Idaho', 'Ketchum', 'ID', 'QKM', '岂彻姆', '爱达荷', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11035, 'United States', 'Idaho', 'Sun Valley', 'ID', 'SVY', '森瓦利', '爱达荷', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11036, 'United States', 'Idaho', 'American Falls', 'ID', 'YAF', '亚美利加瀑布城', '爱达荷', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11037, 'United States', 'Iowa', 'Davenport', 'IA', 'DVN', '达文波特', '爱荷华', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11038, 'United States', 'Iowa', 'Des Moines', 'IA', 'DSM', '得梅因', '爱荷华', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11039, 'United States', 'Iowa', 'Cedar Rapids', 'IA', 'CID', '锡达拉皮兹', '爱荷华', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11040, 'United States', 'North Dakota', 'Bismarck', 'ND', 'BIS', '俾斯麦', '北达科他', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11041, 'United States', 'North Dakota', 'Grand Forks', 'ND', 'GFK', '大福克斯', '北达科他', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11042, 'United States', 'North Dakota', 'Fargo', 'ND', 'FAR', '法戈', '北达科他', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11043, 'United States', 'North Dakota', 'Minot', 'ND', 'MOT', '迈诺特', '北达科他', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11044, 'United States', 'North Carolina', 'Asheville', 'NC', 'AEV', '艾许维尔', '北卡罗来纳', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11045, 'United States', 'North Carolina', 'Durham', 'NC', 'DHH', '杜罕', '北卡罗来纳', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11046, 'United States', 'North Carolina', 'Greensboro', 'NC', 'GBO', '格林斯伯勒', '北卡罗来纳', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11047, 'United States', 'North Carolina', 'Chapel Hill', 'NC', 'CHE', '教堂山', '北卡罗来纳', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11048, 'United States', 'North Carolina', 'Raleigh', 'NC', 'RAG', '罗利', '北卡罗来纳', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11049, 'United States', 'North Carolina', 'Raleigh-Durham', 'NC', 'RDU', '洛利杜罕都会区', '北卡罗来纳', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11050, 'United States', 'North Carolina', 'Charlotte', 'NC', 'CRQ', '夏洛特', '北卡罗来纳', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11051, 'United States', 'Pennsylvania', 'Allentown', 'PA', 'AEW', '阿伦敦', '宾夕法尼亚', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11052, 'United States', 'Pennsylvania', 'Philadephia', 'PA', 'PHL', '费城', '宾夕法尼亚', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11053, 'United States', 'Pennsylvania', 'Pittsburgh', 'PA', 'PIT', '匹兹堡', '宾夕法尼亚', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11054, 'United States', 'Texas', 'El Paso', 'TX', 'ELP', '埃尔帕索', '德克萨斯', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11055, 'United States', 'Texas', 'Austin', 'TX', 'AUS', '奥斯汀', '德克萨斯', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11056, 'United States', 'Texas', 'Dallas', 'TX', 'DAL', '达拉斯', '德克萨斯', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11057, 'United States', 'Texas', 'Corpus Christi', 'TX', 'CRP', '哥帕斯基斯蒂', '德克萨斯', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11058, 'United States', 'Texas', 'Galveston', 'TX', 'GLS', '交维斯顿', '德克萨斯', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11059, 'United States', 'Texas', 'Laredo', 'TX', 'LRD', '拉雷多', '德克萨斯', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11060, 'United States', 'Texas', 'McAllen', 'TX', 'TXC', '麦亚伦', '德克萨斯', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11061, 'United States', 'Texas', 'San Antonio', 'TX', 'SAT', '圣安东尼奥', '德克萨斯', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11062, 'United States', 'Texas', 'Houston', 'TX', 'HOU', '休斯敦', '德克萨斯', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11063, 'United States', 'Ohio', 'Dayton', 'OH', 'DYT', '代顿', '俄亥俄', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11064, 'United States', 'Ohio', 'Columbus', 'OH', 'CZX', '哥伦布', '俄亥俄', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11065, 'United States', 'Ohio', 'Cleveland', 'OH', 'CLE', '克利夫兰', '俄亥俄', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11066, 'United States', 'Ohio', 'Toledo', 'OH', 'TOL', '托莱多', '俄亥俄', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11067, 'United States', 'Ohio', 'Cincinnati', 'OH', 'CVG', '辛辛那提', '俄亥俄', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11068, 'United States', 'Oklahoma', 'Oklahoma City', 'OK', 'OKC', '俄克拉荷马城', '俄克拉荷马', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11069, 'United States', 'Oklahoma', 'Norman', 'OK', 'OUN', '诺曼', '俄克拉荷马', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11070, 'United States', 'Oklahoma', 'Tulsa', 'OK', 'TUL', '塔尔萨', '俄克拉荷马', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11071, 'United States', 'Oregon', 'Bend', 'OR', 'BZO', '本德', '俄勒冈', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11072, 'United States', 'Oregon', 'Portland', 'OR', 'PDX', '波特兰', '俄勒冈', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11073, 'United States', 'Oregon', 'The Dalles', 'OR', 'DLS', '达尔斯', '俄勒冈', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11074, 'United States', 'Oregon', 'Dallas', 'OR', 'DAC', '达拉斯', '俄勒冈', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11075, 'United States', 'Oregon', 'Tillamook', 'OR', 'TLM', '蒂拉穆克', '俄勒冈', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11076, 'United States', 'Oregon', 'Grant\'s Pass', 'OR', 'XFX', '格兰茨帕斯', '俄勒冈', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11077, 'United States', 'Oregon', 'Hood River', 'OR', 'HDX', '胡德里弗', '俄勒冈', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11078, 'United States', 'Oregon', 'Crater Lake', 'OR', 'CTR', '火山口湖', '俄勒冈', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11079, 'United States', 'Oregon', 'Corvallis', 'OR', 'YCV', '科瓦利斯', '俄勒冈', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11080, 'United States', 'Oregon', 'Coos Bay', 'OR', 'COB', '库斯贝', '俄勒冈', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11081, 'United States', 'Oregon', 'Medford', 'OR', 'MFR', '梅德福', '俄勒冈', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11082, 'United States', 'Oregon', 'Salem', 'OR', 'SLE', '塞勒姆', '俄勒冈', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11083, 'United States', 'Oregon', 'St Helens', 'OR', 'STH', '圣海伦斯', '俄勒冈', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11084, 'United States', 'Oregon', 'Springfield', 'OR', 'SPY', '斯普林菲尔德', '俄勒冈', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11085, 'United States', 'Oregon', 'Eugene', 'OR', 'EUG', '尤金', '俄勒冈', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11086, 'United States', 'Florida', 'Orlando', 'FL', 'ORL', '奥兰多', '佛罗里达', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11087, 'United States', 'Florida', 'Key West', 'FL', 'EYW', '基韦斯特', '佛罗里达', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11088, 'United States', 'Florida', 'Jacksonville', 'FL', 'JAX', '杰克逊维尔', '佛罗里达', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11089, 'United States', 'Florida', 'Cape Canaveral', 'FL', 'CPV', '卡纳维尔角', '佛罗里达', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11090, 'United States', 'Florida', 'Fort Lauderdale', 'FL', 'FLL', '罗德岱堡', '佛罗里达', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11091, 'United States', 'Florida', 'Miami', 'FL', 'MIA', '迈阿密', '佛罗里达', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11092, 'United States', 'Florida', 'St. Petersburg', 'FL', 'PIE', '圣彼德斯堡市', '佛罗里达', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11093, 'United States', 'Florida', 'Tallahassee', 'FL', 'TLH', '塔拉哈西', '佛罗里达', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11094, 'United States', 'Florida', 'Tampa', 'FL', 'TPA', '坦帕', '佛罗里达', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11095, 'United States', 'Vermont', 'Burlington', 'VT', 'BTV', '伯灵顿', '佛蒙特', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11096, 'United States', 'Vermont', 'Rutland', 'VT', 'RUT', '拉特兰', '佛蒙特', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11097, 'United States', 'Vermont', 'South Burlington', 'VT', 'ZBR', '南伯灵顿', '佛蒙特', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11098, 'United States', 'District of Columbia', 'Washington D.C.', 'DC', 'WAS', '华盛顿哥伦比亚特区', '哥伦比亚特区', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11099, 'United States', 'Washington', 'Spokane', 'WA', 'GEG', '斯波坎', '华盛顿', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11100, 'United States', 'Washington', 'Tacoma', 'WA', 'TTW', '塔科马', '华盛顿', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11101, 'United States', 'Washington', 'Seattle', 'WA', 'SEA', '西雅图', '华盛顿', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11102, 'United States', 'Wyoming', 'Evanston', 'WY', 'EVD', '埃文斯顿', '怀俄明', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11103, 'United States', 'Wyoming', 'Casper', 'WY', 'CPR', '卡斯珀', '怀俄明', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11104, 'United States', 'Wyoming', 'Laramie', 'WY', 'LAR', '拉勒米', '怀俄明', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11105, 'United States', 'Wyoming', 'Rock Springs', 'WY', 'RKS', '罗克斯普林斯', '怀俄明', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11106, 'United States', 'Wyoming', 'Cheyenne', 'WY', 'CYS', '夏延', '怀俄明', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11107, 'United States', 'Wyoming', 'Sheridan', 'WY', 'SHR', '谢里登', '怀俄明', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11108, 'United States', 'California', 'San Francisco', 'CA', 'SFO', '旧金山', '加利福尼亚', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11109, 'United States', 'California', 'Los Angeles', 'CA', 'LAX', '洛杉矶', '加利福尼亚', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11110, 'United States', 'California', 'San Diego', 'CA', 'SAN', '圣迭戈', '加利福尼亚', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11111, 'United States', 'California', 'San Jose', 'CA', 'SJC', '圣何塞', '加利福尼亚', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11112, 'United States', 'Kansas', 'Abilene', 'KS', 'ABZ', '阿比林', '堪萨斯', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11113, 'United States', 'Kansas', 'Overland Park', 'KS', 'OVL', '奥弗兰公园', '堪萨斯', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11114, 'United States', 'Kansas', 'Hutchinson', 'KS', 'HCH', '哈钦森', '堪萨斯', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11115, 'United States', 'Kansas', 'Kansas City', 'KS', 'KCK', '堪萨斯城', '堪萨斯', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11116, 'United States', 'Kansas', 'Leavenworth', 'KS', 'XIA', '莱文沃思', '堪萨斯', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11117, 'United States', 'Kansas', 'Lawrence', 'KS', 'LWC', '劳伦斯', '堪萨斯', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11118, 'United States', 'Kansas', 'Manhattan', 'KS', 'MHK', '曼哈顿', '堪萨斯', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11119, 'United States', 'Kansas', 'Topeka', 'KS', 'TOP', '托皮卡', '堪萨斯', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11120, 'United States', 'Kansas', 'Wichita', 'KS', 'ICT', '威奇托', '堪萨斯', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11121, 'United States', 'Connecticut', 'Bridgeport', 'CT', 'BDR', '布里奇波特', '康涅狄格', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11122, 'United States', 'Connecticut', 'Darien', 'CT', 'DAQ', '达里恩', '康涅狄格', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11123, 'United States', 'Connecticut', 'Greenwich', 'CT', 'GRH', '格林尼治', '康涅狄格', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11124, 'United States', 'Connecticut', 'Hartford', 'CT', 'HFD', '哈特福德', '康涅狄格', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11125, 'United States', 'Connecticut', 'Middletown', 'CT', 'XIN', '米德尔顿', '康涅狄格', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11126, 'United States', 'Connecticut', 'New Haven', 'CT', 'HVN', '纽黑文', '康涅狄格', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11127, 'United States', 'Connecticut', 'Westport', 'CT', 'WPT', '韦斯特波特', '康涅狄格', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11128, 'United States', 'Connecticut', 'Waterbury', 'CT', 'WAT', '沃特伯里', '康涅狄格', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11129, 'United States', 'Connecticut', 'New Britain', 'CT', 'NWT', '新不列颠', '康涅狄格', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11130, 'United States', 'Colorado', 'Aspen', 'CO', 'ASE', '阿斯彭', '科罗拉多', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11131, 'United States', 'Colorado', 'Aurora', 'CO', 'AUX', '奥罗拉', '科罗拉多', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11132, 'United States', 'Colorado', 'Boulder', 'CO', 'WBU', '博尔德', '科罗拉多', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11133, 'United States', 'Colorado', 'Grand Junction', 'CO', 'GJT', '大章克申', '科罗拉多', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11134, 'United States', 'Colorado', 'Denver', 'CO', 'DEN', '丹佛', '科罗拉多', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11135, 'United States', 'Colorado', 'Fort Collins', 'CO', 'FNL', '柯林斯堡', '科罗拉多', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11136, 'United States', 'Colorado', 'Colorado Springs', 'CO', 'COS', '科罗拉多斯普林斯', '科罗拉多', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11137, 'United States', 'Colorado', 'Vail', 'CO', 'VAC', '韦尔', '科罗拉多', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11138, 'United States', 'Kentucky', 'Lexington', 'KY', 'LEX', '列克星敦', '肯塔基', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11139, 'United States', 'Kentucky', 'Louisville', 'KY', 'LUI', '路易斯维尔', '肯塔基', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11140, 'United States', 'Kentucky', 'Owensboro', 'KY', 'OWB', '欧文斯伯勒', '肯塔基', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11141, 'United States', 'Louisiana', 'Baton Rouge', 'LA', 'BTR', '巴吞鲁日', '路易斯安那', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11142, 'United States', 'Louisiana', 'Shreveport', 'LA', 'SHV', '什里夫波特', '路易斯安那', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11143, 'United States', 'Louisiana', 'New Orleans', 'LA', 'MSY', '新奥尔良', '路易斯安那', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11144, 'United States', 'Rhode Island', 'Pawtucket', 'RI', 'PAW', '波塔基特', '罗德岛', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11145, 'United States', 'Rhode Island', 'Cranston', 'RI', 'CQH', '克兰斯顿', '罗德岛', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11146, 'United States', 'Rhode Island', 'Newport', 'RI', 'NPO', '纽波特', '罗德岛', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11147, 'United States', 'Rhode Island', 'Providence', 'RI', 'PVD', '普罗维登斯', '罗德岛', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11148, 'United States', 'Rhode Island', 'Westerly', 'RI', 'WST', '韦斯特利', '罗德岛', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11149, 'United States', 'Rhode Island', 'Woonsocket', 'RI', 'SFN', '文索基特', '罗德岛', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11150, 'United States', 'Rhode Island', 'Warwick', 'RI', 'UZO', '沃威克', '罗德岛', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11151, 'United States', 'Maryland', 'Balitmore', 'MD', 'BAL', '巴尔的摩', '马里兰', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11152, 'United States', 'Maryland', 'Gaithersburg', 'MD', 'GAI', '盖瑟斯堡', '马里兰', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11153, 'United States', 'Maryland', 'Rockville', 'MD', 'RKV', '罗克维尔', '马里兰', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11154, 'United States', 'Massachusetts', 'Boston', 'MA', 'BZD', '波士顿', '马萨诸塞', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11155, 'United States', 'Massachusetts', 'Springfield', 'MA', 'SFY', '斯普林菲尔德', '马萨诸塞', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11156, 'United States', 'Massachusetts', 'Worcester', 'MA', 'ORH', '伍斯特', '马萨诸塞', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11157, 'United States', 'Montana', 'Billings', 'MT', 'BGS', '比灵斯', '蒙大拿', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11158, 'United States', 'Montana', 'Great Falls', 'MT', 'GTF', '大瀑布村', '蒙大拿', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11159, 'United States', 'Montana', 'Missoula', 'MT', 'MSO', '米苏拉', '蒙大拿', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11160, 'United States', 'Missouri', 'Columbia', 'MO', 'COV', '哥伦比亚', '密苏里', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11161, 'United States', 'Missouri', 'Jefferson City', 'MO', 'JEF', '杰佛逊市', '密苏里', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11162, 'United States', 'Missouri', 'Kansas City', 'MO', 'MKC', '堪萨斯城', '密苏里', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11163, 'United States', 'Missouri', 'Sanit Louis', 'MO', 'STL', '圣路易斯', '密苏里', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11164, 'United States', 'Missouri', 'Springfield', 'MO', 'SGF', '斯普林菲尔德', '密苏里', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11165, 'United States', 'Mississippi', 'Biloxi', 'MS', 'BIX', '比洛克西', '密西西比', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11166, 'United States', 'Mississippi', 'Gulfport', 'MS', 'GPT', '格尔夫波特', '密西西比', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11167, 'United States', 'Mississippi', 'Greenville', 'MS', 'GLH', '格林维尔', '密西西比', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11168, 'United States', 'Mississippi', 'Hattiesburg', 'MS', 'HBG', '哈蒂斯堡', '密西西比', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11169, 'United States', 'Mississippi', 'Jackson', 'MS', 'JAN', '杰克逊', '密西西比', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11170, 'United States', 'Mississippi', 'Meridian', 'MS', 'MEI', '默里迪恩', '密西西比', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11171, 'United States', 'Mississippi', 'Vicksburg', 'MS', 'VKS', '维克斯堡', '密西西比', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11172, 'United States', 'Michigan', 'Ann Arbor', 'MI', 'ARB', '安娜堡', '密歇根', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11173, 'United States', 'Michigan', 'Battle Creek', 'MI', 'BTL', '巴特尔克里克', '密歇根', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11174, 'United States', 'Michigan', 'Bay City', 'MI', 'BCY', '贝城', '密歇根', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11175, 'United States', 'Michigan', 'Grand Rapids', 'MI', 'GRR', '大急流城', '密歇根', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11176, 'United States', 'Michigan', 'Dearborn', 'MI', 'DEO', '迪尔伯恩', '密歇根', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11177, 'United States', 'Michigan', 'Detroit', 'MI', 'DET', '底特律', '密歇根', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11178, 'United States', 'Michigan', 'Flint', 'MI', 'FNT', '弗林特', '密歇根', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11179, 'United States', 'Michigan', 'Wyandotte', 'MI', 'WYD', '怀恩多特', '密歇根', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11180, 'United States', 'Michigan', 'Kalamazoo', 'MI', 'AZO', '卡拉马袓', '密歇根', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11181, 'United States', 'Michigan', 'Lansing', 'MI', 'LAN', '兰辛', '密歇根', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11182, 'United States', 'Michigan', 'Muskegon', 'MI', 'MKG', '马斯基根', '密歇根', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11183, 'United States', 'Michigan', 'Pontiac', 'MI', 'PTK', '庞菷亚克', '密歇根', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11184, 'United States', 'Michigan', 'Saginaw', 'MI', 'SGM', '萨吉诺', '密歇根', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11185, 'United States', 'Michigan', 'Sault Ste Marie', 'MI', 'SSM', '苏圣玛丽', '密歇根', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11186, 'United States', 'Michigan', 'Warren', 'MI', 'WAM', '沃伦', '密歇根', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11187, 'United States', 'Michigan', 'Port Huron', 'MI', 'PHN', '休伦港', '密歇根', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11188, 'United States', 'Maine', 'Bangor', 'ME', 'BNQ', '班戈', '缅因', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11189, 'United States', 'Maine', 'Portland', 'ME', 'POL', '波特兰', '缅因', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11190, 'United States', 'Maine', 'Lewiston', 'ME', 'QLW', '刘易斯顿', '缅因', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11191, 'United States', 'Minnesota', 'Rochester', 'MN', 'RST', '罗切斯特', '明尼苏达', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11192, 'United States', 'Minnesota', 'Minneapolis', 'MN', 'MES', '明尼阿波利斯', '明尼苏达', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11193, 'United States', 'Minnesota', 'Saint Paul', 'MN', 'STP', '圣保罗', '明尼苏达', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11194, 'United States', 'South Dakota', 'Aberdeen', 'SD', 'ABK', '阿伯丁', '南达科他', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11195, 'United States', 'South Dakota', 'Rapid City', 'SD', 'RAP', '拉皮德城', '南达科他', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11196, 'United States', 'South Dakota', 'Sioux Falls', 'SD', 'FSD', '苏福尔斯', '南达科他', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11197, 'United States', 'South Carolina', 'North Charleston', 'SC', 'NTS', '北查尔斯顿', '南卡罗来纳', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11198, 'United States', 'South Carolina', 'Charleston', 'SC', 'CHS', '查尔斯顿', '南卡罗来纳', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11199, 'United States', 'South Carolina', 'Columbia', 'SC', 'COV', '哥伦比亚', '南卡罗来纳', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11200, 'United States', 'Nebraska', 'Omaha', 'NE', 'OMA', '奥马哈', '内布拉斯加', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11201, 'United States', 'Nebraska', 'Bellevue', 'NE', 'XDE', '贝尔维尤', '内布拉斯加', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11202, 'United States', 'Nebraska', 'Lincoln', 'NE', 'LNK', '林肯', '内布拉斯加', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11203, 'United States', 'Nevada', 'Elko', 'NV', 'EKO', '埃尔科', '内华达', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11204, 'United States', 'Nevada', 'North Las Vegas', 'NV', 'NVS', '北拉斯维加斯', '内华达', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11205, 'United States', 'Nevada', 'Virginia City', 'NV', 'VGI', '弗吉尼亚城', '内华达', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11206, 'United States', 'Nevada', 'Henderson', 'NV', 'HNZ', '亨德森', '内华达', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11207, 'United States', 'Nevada', 'Carson City', 'NV', 'CSN', '卡森城', '内华达', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11208, 'United States', 'Nevada', 'Las Vegas', 'NV', 'LAS', '拉斯维加斯', '内华达', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11209, 'United States', 'Nevada', 'Reno', 'NV', 'RNO', '里诺', '内华达', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11210, 'United States', 'Nevada', 'Sparks', 'NV', 'SPK', '斯帕克斯', '内华达', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11211, 'United States', 'New York', 'Buffalo', 'NY', 'FFO', '布法罗', '纽约', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11212, 'United States', 'New York', 'Rochester', 'NY', 'ROC', '罗切斯特', '纽约', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11213, 'United States', 'New York', 'New York', 'NY', 'QEE', '纽约市', '纽约', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11214, 'United States', 'Delaware', 'Dover', 'DE', 'DOR', '多佛', '特拉华', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11215, 'United States', 'Delaware', 'Newark', 'DE', 'NWK', '纽瓦克', '特拉华', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11216, 'United States', 'Delaware', 'Wilmington', 'DE', 'ILG', '威明顿', '特拉华', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11217, 'United States', 'Tennessee', 'Bristol', 'TN', 'BSJ', '布利斯托', '田纳西', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11218, 'United States', 'Tennessee', 'Chattanooga', 'TN', 'CHA', '查塔努加', '田纳西', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11219, 'United States', 'Tennessee', 'Kingsport', 'TN', 'TRI', '金斯波特', '田纳西', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11220, 'United States', 'Tennessee', 'Memphis', 'TN', 'MEM', '孟菲斯', '田纳西', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11221, 'United States', 'Tennessee', 'Nashville', 'TN', 'BNA', '纳什维尔', '田纳西', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11222, 'United States', 'Tennessee', 'Knoxville', 'TN', 'TYS', '诺克斯维尔', '田纳西', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11223, 'United States', 'Tennessee', 'Tri-City Area', 'TN', 'YTC', '三城区', '田纳西', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11224, 'United States', 'Tennessee', 'Smyrna', 'TN', 'MQY', '士麦那', '田纳西', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11225, 'United States', 'Tennessee', 'Spring Hill', 'TN', 'RGI', '斯普林希尔', '田纳西', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11226, 'United States', 'Tennessee', 'Johnson City', 'TN', 'JCY', '约翰逊城', '田纳西', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11227, 'United States', 'Wisconsin', 'Appleton', 'WI', 'ATW', '阿普尓顿', '威斯康星', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11228, 'United States', 'Wisconsin', 'Oshkosh', 'WI', 'OSH', '奥什科什', '威斯康星', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11229, 'United States', 'Wisconsin', 'Green Bay', 'WI', 'GBK', '格林贝', '威斯康星', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11230, 'United States', 'Wisconsin', 'Kenosha', 'WI', 'ENW', '基诺沙', '威斯康星', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11231, 'United States', 'Wisconsin', 'LaCrosse', 'WI', 'LSE', '拉克罗斯', '威斯康星', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11232, 'United States', 'Wisconsin', 'Racine', 'WI', 'RAC', '拉辛', '威斯康星', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11233, 'United States', 'Wisconsin', 'Manitowoc', 'WI', 'MTW', '马尼托沃克', '威斯康星', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11234, 'United States', 'Wisconsin', 'Madison', 'WI', 'QMD', '迈迪逊', '威斯康星', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11235, 'United States', 'Wisconsin', 'Milwaukee', 'WI', 'MKE', '密尔沃基', '威斯康星', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11236, 'United States', 'Wisconsin', 'Eau Claire', 'WI', 'EAU', '欧克莱尓', '威斯康星', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11237, 'United States', 'Wisconsin', 'Wausau', 'WI', 'AUW', '沃索', '威斯康星', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11238, 'United States', 'Wisconsin', 'Sheboygan', 'WI', 'SBM', '希博伊根', '威斯康星', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11239, 'United States', 'Virginia', 'Virginia Beach', 'VA', 'VAB', '弗吉尼亚比奇', '维吉尼亚', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11240, 'United States', 'Virginia', 'Norfolk', 'VA', 'ORF', '诺福克', '维吉尼亚', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11241, 'United States', 'Virginia', 'Chesapeake', 'VA', 'HTW', '切萨皮克', '维吉尼亚', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11242, 'United States', 'West Virginia', 'Charleston', 'WV', 'CRW', '查尔斯顿', '西佛吉尼亚', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11243, 'United States', 'West Virginia', 'Huntington', 'WV', 'HNU', '亨廷顿', '西佛吉尼亚', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11244, 'United States', 'West Virginia', 'Parkersburg', 'WV', 'PKB', '帕克斯堡', '西佛吉尼亚', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11245, 'United States', 'Hawaii', 'Kailua', 'HI', 'KHH', '凯卢阿', '夏威夷', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11246, 'United States', 'Hawaii', 'Honolulu', 'HI', 'HNL', '檀香山', '夏威夷', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11247, 'United States', 'Hawaii', 'Hilo', 'HI', 'ITO', '希洛', '夏威夷', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11248, 'United States', 'New Hampshire', 'Concord', 'NH', 'CON', '康科德', '新罕布什尔', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11249, 'United States', 'New Hampshire', 'Manchester', 'NH', 'MHT', '曼彻斯特', '新罕布什尔', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11250, 'United States', 'New Hampshire', 'Nashua', 'NH', 'ASH', '纳舒厄', '新罕布什尔', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11251, 'United States', 'New Mexico', 'Albuquerque', 'NM', 'ABQ', '阿尔伯克基', '新墨西哥', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11252, 'United States', 'New Mexico', 'Las Cruces', 'NM', 'LRU', '拉斯克鲁塞斯', '新墨西哥', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11253, 'United States', 'New Mexico', 'Roswell', 'NM', 'ROW', '罗斯韦尔', '新墨西哥', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11254, 'United States', 'New Mexico', 'Santa Fe', 'NM', 'SAF', '圣菲', '新墨西哥', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11255, 'United States', 'New Jersey', 'Newark', 'NJ', 'NRK', '纽瓦克', '新泽西', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11256, 'United States', 'New Jersey', 'Paterson', 'NJ', 'PAT', '帕特森', '新泽西', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11257, 'United States', 'New Jersey', 'Jersey City', 'NJ', 'JEC', '泽西城', '新泽西', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11258, 'United States', 'Arizona', 'Phoenix', 'AZ', 'PHX', '凤凰城', '亚利桑那', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11259, 'United States', 'Arizona', 'Glendale', 'AZ', 'GDA', '格兰代尔', '亚利桑那', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11260, 'United States', 'Arizona', 'Mesa', 'AZ', 'MQA', '梅萨', '亚利桑那', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11261, 'United States', 'Arizona', 'Scottsdale', 'AZ', 'STZ', '史卡兹代尔', '亚利桑那', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11262, 'United States', 'Arizona', 'Tempe', 'AZ', 'TPE', '坦普', '亚利桑那', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11263, 'United States', 'Arizona', 'Tucson', 'AZ', 'TUC', '图森', '亚利桑那', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11264, 'United States', 'Arizona', 'Yuma', 'AZ', 'YUM', '优玛', '亚利桑那', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11265, 'United States', 'Illinois', 'Alton', 'IL', 'ALN', '奥尔顿', '伊利诺斯', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11266, 'United States', 'Illinois', 'Aurora', 'IL', 'AUZ', '奥罗拉', '伊利诺斯', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11267, 'United States', 'Illinois', 'Bloomington', 'IL', 'BLO', '布卢明顿', '伊利诺斯', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11268, 'United States', 'Illinois', 'Danville', 'IL', 'DVI', '丹维尓', '伊利诺斯', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11269, 'United States', 'Illinois', 'De Kalb', 'IL', 'DEK', '迪卡尔布', '伊利诺斯', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11270, 'United States', 'Illinois', 'Decatur', 'IL', 'DEC', '迪凯持', '伊利诺斯', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11271, 'United States', 'Illinois', 'East St Louis', 'IL', 'ESL', '东圣路易斯', '伊利诺斯', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11272, 'United States', 'Illinois', 'Champaign-Urbana', 'IL', 'CMI', '厄巴纳-香槟', '伊利诺斯', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11273, 'United States', 'Illinois', 'Galesburg', 'IL', 'GSU', '盖尔斯堡', '伊利诺斯', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11274, 'United States', 'Illinois', 'Carbondale', 'IL', 'MDH', '卡本代尔', '伊利诺斯', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11275, 'United States', 'Illinois', 'Rock Island', 'IL', 'RKI', '罗克艾兰', '伊利诺斯', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11276, 'United States', 'Illinois', 'Rockford', 'IL', 'RFD', '罗克福德', '伊利诺斯', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11277, 'United States', 'Illinois', 'Normal', 'IL', 'NOM', '诺黙尔', '伊利诺斯', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11278, 'United States', 'Illinois', 'Peoria', 'IL', 'PLA', '皮奥里亚', '伊利诺斯', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11279, 'United States', 'Illinois', 'Centralia', 'IL', 'CRA', '森特勒利亚', '伊利诺斯', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11280, 'United States', 'Illinois', 'Springfield', 'IL', 'SPI', '斯普林菲尔德', '伊利诺斯', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11281, 'United States', 'Illinois', 'Waukegan', 'IL', 'UGN', '沃其根', '伊利诺斯', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11282, 'United States', 'Illinois', 'Chicago', 'IL', 'CHI', '芝加哥', '伊利诺斯', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11283, 'United States', 'Indiana', 'Evansville', 'IN', 'EVV', '埃文斯维尔', '印第安那', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11284, 'United States', 'Indiana', 'Fort Wayne', 'IN', 'FWA', '韦恩堡', '印第安那', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11285, 'United States', 'Indiana', 'Indianapolis', 'IN', 'IND', '印第安纳波利斯', '印第安那', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11286, 'United States', 'Utah', 'Ogden', 'UT', 'OGD', '奥格登', '犹他', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11287, 'United States', 'Utah', 'Layton', 'UT', 'LTJ', '雷登', '犹他', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11288, 'United States', 'Utah', 'Orem', 'UT', 'OEU', '欧仁', '犹他', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11289, 'United States', 'Utah', 'Park City', 'UT', 'PAC', '帕克城', '犹他', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11290, 'United States', 'Utah', 'Provo', 'UT', 'PVU', '普罗沃', '犹他', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11291, 'United States', 'Utah', 'St.George', 'UT', 'SGU', '圣乔治', '犹他', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11292, 'United States', 'Utah', 'West Valley City', 'UT', 'WVC', '西瓦利城', '犹他', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11293, 'United States', 'Utah', 'Salt Lake City', 'UT', 'SLC', '盐湖城', '犹他', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11294, 'United States', 'Georgia', 'Augusta', 'GA', 'AUT', '奥古斯塔', '佐治亚', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11295, 'United States', 'Georgia', 'Columbus', 'GA', 'CZX', '哥伦布', '佐治亚', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11296, 'United States', 'Georgia', 'Macon', 'GA', 'MCN', '梅肯', '佐治亚', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11297, 'United States', 'Georgia', 'Savannah', 'GA', 'SAV', '沙瓦纳', '佐治亚', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11298, 'United States', 'Georgia', 'Atlanta', 'GA', 'TAT', '亚特兰大', '佐治亚', '美国', 'USA');
INSERT INTO `st_region_city` VALUES (11299, 'United Kingdom', 'Northern Ireland', 'Belfast', 'NIR', 'BFS', '贝尔法斯特', '北爱尔兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11300, 'United Kingdom', 'Northern Ireland', 'Derry', 'NIR', 'DRY', '德里', '北爱尔兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11301, 'United Kingdom', 'Northern Ireland', 'Lisburn', 'NIR', 'LSB', '利斯本', '北爱尔兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11302, 'United Kingdom', 'Northern Ireland', 'Newry', 'NIR', 'NYM', '纽里', '北爱尔兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11303, 'United Kingdom', 'Scotland', 'Aberdeen', 'SCT', 'ABD', '阿伯丁', '苏格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11304, 'United Kingdom', 'Scotland', 'Edinburgh', 'SCT', 'EDH', '爱丁堡', '苏格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11305, 'United Kingdom', 'Scotland', 'Dundee', 'SCT', 'DND', '丹迪', '苏格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11306, 'United Kingdom', 'Scotland', 'Glasgow', 'SCT', 'GLG', '格拉斯哥', '苏格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11307, 'United Kingdom', 'Scotland', 'Stirling', 'SCT', 'STG', '斯特灵', '苏格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11308, 'United Kingdom', 'Scotland', 'Inverness', 'SCT', 'INV', '因弗内斯', '苏格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11309, 'United Kingdom', 'Wales', 'Bangor', 'WLS', 'BAN', '班戈', '威尔士', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11310, 'United Kingdom', 'Wales', 'Cardiff', 'WLS', 'CDF', '卡迪夫', '威尔士', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11311, 'United Kingdom', 'Wales', 'Newport', 'WLS', 'NWP', '纽波特', '威尔士', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11312, 'United Kingdom', 'Wales', 'Swansea', 'WLS', 'SWA', '斯旺西', '威尔士', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11313, 'United Kingdom', 'England', 'Exeter', 'ENG', 'EXE', '埃克塞特', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11314, 'United Kingdom', 'England', 'Bath', 'ENG', 'BAS', '巴斯', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11315, 'United Kingdom', 'England', 'Peterborough', 'ENG', 'PTE', '彼得伯勒', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11316, 'United Kingdom', 'England', 'Birmingham', 'ENG', 'BIR', '伯明翰', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11317, 'United Kingdom', 'England', 'Bradford', 'ENG', 'BRD', '布拉德福德', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11318, 'United Kingdom', 'England', 'Brighton & Hove', 'ENG', 'BNH', '布莱顿与赫福', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11319, 'United Kingdom', 'England', 'Bristol', 'ENG', 'BST', '布里斯托尔', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11320, 'United Kingdom', 'England', 'Derby', 'ENG', 'DER', '德比', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11321, 'United Kingdom', 'England', 'Durham', 'ENG', 'DUR', '德罕', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11322, 'United Kingdom', 'England', 'Gloucester', 'ENG', 'GLO', '格洛斯特', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11323, 'United Kingdom', 'England', 'Kingston upon Hull', 'ENG', 'KUH', '赫尔河畔京斯敦', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11324, 'United Kingdom', 'England', 'Hereford', 'ENG', 'HAF', '赫里福德', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11325, 'United Kingdom', 'England', 'Cambridge', 'ENG', 'CAM', '剑桥', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11326, 'United Kingdom', 'England', 'Carlisle', 'ENG', 'CAX', '卡莱尔', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11327, 'United Kingdom', 'England', 'Canterbury', 'ENG', 'CNG', '坎特伯雷', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11328, 'United Kingdom', 'England', 'Coventry', 'ENG', 'COV', '考文垂', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11329, 'United Kingdom', 'England', 'Lancaster', 'ENG', 'LAN', '兰开斯特', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11330, 'United Kingdom', 'England', 'Ripon', 'ENG', 'RIP', '里彭', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11331, 'United Kingdom', 'England', 'Lichfield', 'ENG', 'LHF', '利奇菲尔德', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11332, 'United Kingdom', 'England', 'Liverpool', 'ENG', 'LIV', '利物浦', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11333, 'United Kingdom', 'England', 'Leeds', 'ENG', 'LDS', '利茲', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11334, 'United Kingdom', 'England', 'Leicester', 'ENG', 'LCE', '列斯特', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11335, 'United Kingdom', 'England', 'Lincoln', 'ENG', 'LCN', '林肯', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11336, 'United Kingdom', 'England', 'London', 'ENG', 'LND', '伦敦', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11337, 'United Kingdom', 'England', 'Manchester', 'ENG', 'MAN', '曼彻斯特', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11338, 'United Kingdom', 'England', 'Southampton', 'ENG', 'STH', '南安普敦', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11339, 'United Kingdom', 'England', 'Oxford', 'ENG', 'OXF', '牛津', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11340, 'United Kingdom', 'England', 'Newcastle', 'ENG', 'NCL', '纽卡斯尔', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11341, 'United Kingdom', 'England', 'Nottingham', 'ENG', 'NGM', '诺丁汉', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11342, 'United Kingdom', 'England', 'Norwich', 'ENG', 'NRW', '诺里奇', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11343, 'United Kingdom', 'England', 'Portsmouth', 'ENG', 'POR', '朴茨茅斯', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11344, 'United Kingdom', 'England', 'Preston', 'ENG', 'PRE', '普雷斯顿', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11345, 'United Kingdom', 'England', 'Plymouth', 'ENG', 'PLY', '普利茅斯', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11346, 'United Kingdom', 'England', 'Chichester', 'ENG', 'CST', '奇切斯特', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11347, 'United Kingdom', 'England', 'Chester', 'ENG', 'CEG', '切斯特', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11348, 'United Kingdom', 'England', 'Sunderland', 'ENG', 'SUN', '桑德兰', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11349, 'United Kingdom', 'England', 'Saint Albans', 'ENG', 'TBL', '圣阿本斯', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11350, 'United Kingdom', 'England', 'Salisbury', 'ENG', 'SLS', '索尔斯堡', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11351, 'United Kingdom', 'England', 'Salford', 'ENG', 'SLF', '索福特', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11352, 'United Kingdom', 'England', 'Truro', 'ENG', 'TRU', '特鲁罗', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11353, 'United Kingdom', 'England', 'Stoke-on-Trent', 'ENG', 'SOT', '特伦特河畔斯多克', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11354, 'United Kingdom', 'England', 'Wells', 'ENG', 'WLS', '威尔斯', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11355, 'United Kingdom', 'England', 'Wakefield', 'ENG', 'WKF', '韦克菲尔德', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11356, 'United Kingdom', 'England', 'Winchester', 'ENG', 'WNE', '温彻斯特', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11357, 'United Kingdom', 'England', 'Wolverhampton', 'ENG', 'WOV', '伍尔弗汉普顿', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11358, 'United Kingdom', 'England', 'Worcester', 'ENG', 'WOR', '伍斯特', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11359, 'United Kingdom', 'England', 'Sheffield', 'ENG', 'SHE', '谢菲尔德', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11360, 'United Kingdom', 'England', 'Ely', 'ENG', 'ELY', '伊利', '英格兰', '英国', 'GBR');
INSERT INTO `st_region_city` VALUES (11361, 'United Kingdom', 'England', 'York', 'ENG', 'YOR', '约克', '英格兰', '英国', 'GBR');

-- ----------------------------
-- Table structure for st_region_continent
-- ----------------------------
DROP TABLE IF EXISTS `st_region_continent`;
CREATE TABLE `st_region_continent`  (
  `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `iso2` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ISO二字代码',
  `cn_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中文名',
  `en_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '全球7大洲' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_region_continent
-- ----------------------------
INSERT INTO `st_region_continent` VALUES (1, 'AS', '亚洲', 'Asia', NULL, NULL);
INSERT INTO `st_region_continent` VALUES (2, 'EU', '欧洲', 'Europe', NULL, NULL);
INSERT INTO `st_region_continent` VALUES (3, 'AF', '非洲', 'Africa', NULL, NULL);
INSERT INTO `st_region_continent` VALUES (4, 'OC', '大洋洲', 'Oceania', NULL, NULL);
INSERT INTO `st_region_continent` VALUES (5, 'AN', '南极洲', 'Antarctica', NULL, NULL);
INSERT INTO `st_region_continent` VALUES (6, 'NA', '北美洲', 'North America', NULL, NULL);
INSERT INTO `st_region_continent` VALUES (7, 'SA', '南美洲', 'South America', NULL, '2021-08-07 10:37:54');

-- ----------------------------
-- Table structure for st_region_country
-- ----------------------------
DROP TABLE IF EXISTS `st_region_country`;
CREATE TABLE `st_region_country`  (
  `id` int(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `continent_iso2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '大陆简码',
  `en_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '英文名称',
  `cn_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '中文名称',
  `iso2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ISO二字简码',
  `iso3` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ISO三字简码',
  `iso_num` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'ISO数字代码',
  `capital` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首都',
  `more` json NULL COMMENT '更多配置',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 505 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '国家' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_region_country
-- ----------------------------
INSERT INTO `st_region_country` VALUES (253, 'EU', 'Andorra', '安道尔', 'AD', 'AND', '020', 'Andorra la Vella', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": \"0\"}}', NULL, '2021-08-07 10:56:22');
INSERT INTO `st_region_country` VALUES (254, 'AS', 'United Arab Emirates', '阿拉伯联合酋长国', 'AE', 'ARE', '784', 'Abu Dhabi', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (255, 'AS', 'Afghanistan', '阿富汗', 'AF', 'AFG', '004', 'Kabul', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (256, 'NA', 'Antigua and Barbuda', '安提瓜和巴布达', 'AG', 'ATG', '028', 'St. John’s', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (257, 'NA', 'Anguilla', '安圭拉岛', 'AI', 'AIA', '660', 'The Valley', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (258, 'EU', 'Albania', '阿尔巴尼亚', 'AL', 'ALB', '008', 'Tirana', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (259, 'AS', 'Armenia', '亚美尼亚', 'AM', 'ARM', '051', 'Yerevan', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (260, 'NA', 'Netherlands Antilles', '荷属安的列斯', 'AN', 'ANT', '530', 'Willemstad', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (261, 'AF', 'Angola', '安哥拉', 'AO', 'AGO', '024', 'Luanda', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (262, 'AN', 'Antarctica', '南极洲', 'AQ', 'ATA', '010', '', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (263, 'SA', 'Argentina', '阿根廷', 'AR', 'ARG', '032', 'Buenos Aires', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (264, 'OC', 'American Samoa', '美属萨摩亚', 'AS', 'ASM', '016', 'Pago Pago', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (265, 'EU', 'Austria', '奥地利', 'AT', 'AUT', '040', 'Vienna', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (266, 'OC', 'Australia', '澳大利亚', 'AU', 'AUS', '036', 'Canberra', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (267, 'NA', 'Aruba', '阿鲁巴岛', 'AW', 'ABW', '533', 'Oranjestad', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (268, 'EU', 'Åland', '', 'AX', 'ALA', '248', 'Mariehamn', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (269, 'AS', 'Azerbaijan', '阿塞拜疆', 'AZ', 'AZE', '031', 'Baku', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (270, 'EU', 'Bosnia and Herzegovina', '波斯尼亚和黑塞哥维那', 'BA', 'BIH', '070', 'Sarajevo', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (271, 'NA', 'Barbados', '巴巴多斯', 'BB', 'BRB', '052', 'Bridgetown', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (272, 'AS', 'Bangladesh', '孟加拉国', 'BD', 'BGD', '050', 'Dhaka', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (273, 'EU', 'Belgium', '比利时', 'BE', 'BEL', '056', 'Brussels', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (274, 'AF', 'Burkina Faso', '布基纳法索', 'BF', 'BFA', '854', 'Ouagadougou', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (275, 'EU', 'Bulgaria', '保加利亚', 'BG', 'BGR', '100', 'Sofia', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (276, 'AS', 'Bahrain', '巴林', 'BH', 'BHR', '048', 'Manama', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (277, 'AF', 'Burundi', '布隆迪', 'BI', 'BDI', '108', 'Gitega', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (278, 'AF', 'Benin', '贝宁', 'BJ', 'BEN', '204', 'Porto-Novo', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (279, 'NA', 'Saint Barthélemy', '圣巴塞洛缪', 'BL', 'BLM', '652', 'Gustavia', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (280, 'NA', 'Bermuda', '百慕大', 'BM', 'BMU', '060', 'Hamilton', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (281, 'AS', 'Brunei', '文莱', 'BN', 'BRN', '096', 'Bandar Seri Begawan', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (282, 'SA', 'Bolivia', '玻利维亚', 'BO', 'BOL', '068', 'Sucre', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (283, 'NA', 'Bonaire, Sint Eustatius, and Saba', '博内尔，圣尤斯特歇斯和萨巴', 'BQ', 'BES', '535', '', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (284, 'SA', 'Brazil', '巴西', 'BR', 'BRA', '076', 'Brasilia', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (285, 'NA', 'Bahamas', '巴哈马', 'BS', 'BHS', '044', 'Nassau', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (286, 'AS', 'Bhutan', '不丹', 'BT', 'BTN', '064', 'Thimphu', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (287, 'AN', 'Bouvet Island', '布维岛', 'BV', 'BVT', '074', '', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (288, 'AF', 'Botswana', '博茨瓦纳', 'BW', 'BWA', '072', 'Gaborone', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (289, 'EU', 'Belarus', '白俄罗斯', 'BY', 'BLR', '112', 'Minsk', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (290, 'NA', 'Belize', '伯利兹', 'BZ', 'BLZ', '084', 'Belmopan', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (291, 'NA', 'Canada', '加拿大', 'CA', 'CAN', '124', 'Ottawa', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 14}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (292, 'AS', 'Cocos [Keeling] Islands', '[基林]群岛', 'CC', 'CCK', '166', 'West Island', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (293, 'AF', 'DR Congo', '刚果民主共和国', 'CD', 'COD', '180', 'Kinshasa', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (294, 'AF', 'Central African Republic', '中非共和国', 'CF', 'CAF', '140', 'Bangui', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (295, 'AF', 'Congo Republic', '刚果共和国', 'CG', 'COG', '178', 'Brazzaville', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (296, 'EU', 'Switzerland', '瑞士', 'CH', 'CHE', '756', 'Bern', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (297, 'AF', 'Ivory Coast', '', 'CI', 'CIV', '384', 'Yamoussoukro', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (298, 'OC', 'Cook Islands', '库克群岛', 'CK', 'COK', '184', 'Avarua', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (299, 'SA', 'Chile', '智利', 'CL', 'CHL', '152', 'Santiago', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (300, 'AF', 'Cameroon', '喀麦隆', 'CM', 'CMR', '120', 'Yaounde', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (301, 'AS', 'China', '中国', 'CN', 'CHN', '156', 'Beijing', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (302, 'SA', 'Colombia', '哥伦比亚', 'CO', 'COL', '170', 'Bogota', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (303, 'NA', 'Costa Rica', '哥斯达黎加', 'CR', 'CRI', '188', 'San Jose', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (304, 'EU', 'Serbia and Montenegro', '塞尔维亚和黑山', 'CS', 'SCG', '891', 'Belgrade', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (305, 'NA', 'Cuba', '古巴', 'CU', 'CUB', '192', 'Havana', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (306, 'AF', 'Cabo Verde', '佛得角', 'CV', 'CPV', '132', 'Praia', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (307, 'NA', 'Curaçao', '库拉索', 'CW', 'CUW', '531', 'Willemstad', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (308, 'OC', 'Christmas Island', '圣诞岛', 'CX', 'CXR', '162', 'Flying Fish Cove', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (309, 'EU', 'Cyprus', '塞浦路斯', 'CY', 'CYP', '196', 'Nicosia', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (310, 'EU', 'Czechia', '捷克', 'CZ', 'CZE', '203', 'Prague', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (311, 'EU', 'Germany', '德国', 'DE', 'DEU', '276', 'Berlin', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (312, 'AF', 'Djibouti', '吉布地', 'DJ', 'DJI', '262', 'Djibouti', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (313, 'EU', 'Denmark', '丹麦', 'DK', 'DNK', '208', 'Copenhagen', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (314, 'NA', 'Dominica', '多米尼加', 'DM', 'DMA', '212', 'Roseau', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (315, 'NA', 'Dominican Republic', '多明尼加共和国', 'DO', 'DOM', '214', 'Santo Domingo', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (316, 'AF', 'Algeria', '阿尔及利亚', 'DZ', 'DZA', '012', 'Algiers', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (317, 'SA', 'Ecuador', '厄瓜多尔', 'EC', 'ECU', '218', 'Quito', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (318, 'EU', 'Estonia', '爱沙尼亚', 'EE', 'EST', '233', 'Tallinn', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (319, 'AF', 'Egypt', '埃及', 'EG', 'EGY', '818', 'Cairo', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (320, 'AF', 'Western Sahara', '西撒哈拉', 'EH', 'ESH', '732', 'El-Aaiun', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (321, 'AF', 'Eritrea', '厄立特里亚', 'ER', 'ERI', '232', 'Asmara', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (322, 'EU', 'Spain', '西班牙', 'ES', 'ESP', '724', 'Madrid', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (323, 'AF', 'Ethiopia', '埃塞俄比亚', 'ET', 'ETH', '231', 'Addis Ababa', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (324, 'EU', 'Finland', '芬兰', 'FI', 'FIN', '246', 'Helsinki', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (325, 'OC', 'Fiji', '斐济', 'FJ', 'FJI', '242', 'Suva', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (326, 'SA', 'Falkland Islands', '福克兰群岛', 'FK', 'FLK', '238', 'Stanley', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (327, 'OC', 'Micronesia', '密克罗尼西亚', 'FM', 'FSM', '583', 'Palikir', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (328, 'EU', 'Faroe Islands', '法罗群岛', 'FO', 'FRO', '234', 'Torshavn', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (329, 'EU', 'France', '法国', 'FR', 'FRA', '250', 'Paris', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (330, 'AF', 'Gabon', '加蓬', 'GA', 'GAB', '266', 'Libreville', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (331, 'EU', 'United Kingdom', '英国', 'GB', 'GBR', '826', 'London', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (332, 'NA', 'Grenada', '格林纳达', 'GD', 'GRD', '308', 'St. George’s', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (333, 'AS', 'Georgia', '佐治亚州', 'GE', 'GEO', '268', 'Tbilisi', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (334, 'SA', 'French Guiana', '法属圭亚那', 'GF', 'GUF', '254', 'Cayenne', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (335, 'EU', 'Guernsey', '根西岛', 'GG', 'GGY', '831', 'St Peter Port', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (336, 'AF', 'Ghana', '加纳', 'GH', 'GHA', '288', 'Accra', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (337, 'EU', 'Gibraltar', '直布罗陀', 'GI', 'GIB', '292', 'Gibraltar', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (338, 'NA', 'Greenland', '格陵兰', 'GL', 'GRL', '304', 'Nuuk', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (339, 'AF', 'Gambia', '冈比亚', 'GM', 'GMB', '270', 'Banjul', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (340, 'AF', 'Guinea', '几内亚', 'GN', 'GIN', '324', 'Conakry', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (341, 'NA', 'Guadeloupe', '瓜德罗普岛', 'GP', 'GLP', '312', 'Basse-Terre', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (342, 'AF', 'Equatorial Guinea', '几内亚', 'GQ', 'GNQ', '226', 'Malabo', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (343, 'EU', 'Greece', '希腊', 'GR', 'GRC', '300', 'Athens', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (344, 'AN', 'South Georgia and South Sandwich Islands', '南乔治亚岛和南桑威奇群岛', 'GS', 'SGS', '239', 'Grytviken', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (345, 'NA', 'Guatemala', '危地马拉', 'GT', 'GTM', '320', 'Guatemala City', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (346, 'OC', 'Guam', '关岛', 'GU', 'GUM', '316', 'Hagatna', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (347, 'AF', 'Guinea-Bissau', '几内亚比绍', 'GW', 'GNB', '624', 'Bissau', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (348, 'SA', 'Guyana', '圭亚那', 'GY', 'GUY', '328', 'Georgetown', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (349, 'AS', 'Hong Kong', '中国香港', 'HK', 'HKG', '344', 'Hong Kong', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (350, 'AN', 'Heard Island and McDonald Islands', '希尔德岛和麦当劳群岛', 'HM', 'HMD', '334', '', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (351, 'NA', 'Honduras', '洪都拉斯', 'HN', 'HND', '340', 'Tegucigalpa', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (352, 'EU', 'Croatia', '克罗地亚', 'HR', 'HRV', '191', 'Zagreb', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (353, 'NA', 'Haiti', '海地', 'HT', 'HTI', '332', 'Port-au-Prince', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (354, 'EU', 'Hungary', '匈牙利', 'HU', 'HUN', '348', 'Budapest', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (355, 'AS', 'Indonesia', '印度尼西亚', 'ID', 'IDN', '360', 'Jakarta', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (356, 'EU', 'Ireland', '爱尔兰', 'IE', 'IRL', '372', 'Dublin', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (357, 'AS', 'Israel', '以色列', 'IL', 'ISR', '376', 'Jerusalem', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (358, 'EU', 'Isle of Man', '马恩岛', 'IM', 'IMN', '833', 'Douglas', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (359, 'AS', 'India', '印度', 'IN', 'IND', '356', 'New Delhi', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (360, 'AS', 'British Indian Ocean Territory', '', 'IO', 'IOT', '086', 'Diego Garcia', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (361, 'AS', 'Iraq', '伊拉克', 'IQ', 'IRQ', '368', 'Baghdad', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (362, 'AS', 'Iran', '伊朗', 'IR', 'IRN', '364', 'Tehran', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (363, 'EU', 'Iceland', '冰岛', 'IS', 'ISL', '352', 'Reykjavik', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (364, 'EU', 'Italy', '意大利', 'IT', 'ITA', '380', 'Rome', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (365, 'EU', 'Jersey', '泽西岛', 'JE', 'JEY', '832', 'Saint Helier', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (366, 'NA', 'Jamaica', '牙买加', 'JM', 'JAM', '388', 'Kingston', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (367, 'AS', 'Jordan', '约旦', 'JO', 'JOR', '400', 'Amman', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (368, 'AS', 'Japan', '日本', 'JP', 'JPN', '392', 'Tokyo', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (369, 'AF', 'Kenya', '肯尼亚', 'KE', 'KEN', '404', 'Nairobi', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (370, 'AS', 'Kyrgyzstan', '吉尔吉斯斯坦', 'KG', 'KGZ', '417', 'Bishkek', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (371, 'AS', 'Cambodia', '柬埔寨', 'KH', 'KHM', '116', 'Phnom Penh', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (372, 'OC', 'Kiribati', '基里巴斯', 'KI', 'KIR', '296', 'Tarawa', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (373, 'AF', 'Comoros', '科摩罗', 'KM', 'COM', '174', 'Moroni', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (374, 'NA', 'St Kitts and Nevis', '圣基茨和尼维斯', 'KN', 'KNA', '659', 'Basseterre', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (375, 'AS', 'North Korea', '北朝鲜', 'KP', 'PRK', '408', 'Pyongyang', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (376, 'AS', 'South Korea', '南韩', 'KR', 'KOR', '410', 'Seoul', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (377, 'AS', 'Kuwait', '科威特', 'KW', 'KWT', '414', 'Kuwait City', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (378, 'NA', 'Cayman Islands', '开曼群岛', 'KY', 'CYM', '136', 'George Town', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (379, 'AS', 'Kazakhstan', '哈萨克斯坦', 'KZ', 'KAZ', '398', 'Nur-Sultan', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (380, 'AS', 'Laos', '老挝', 'LA', 'LAO', '418', 'Vientiane', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (381, 'AS', 'Lebanon', '黎巴嫩', 'LB', 'LBN', '422', 'Beirut', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (382, 'NA', 'Saint Lucia', '圣卢西亚', 'LC', 'LCA', '662', 'Castries', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (383, 'EU', 'Liechtenstein', '列支敦士登', 'LI', 'LIE', '438', 'Vaduz', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (384, 'AS', 'Sri Lanka', '斯里兰卡', 'LK', 'LKA', '144', 'Colombo', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (385, 'AF', 'Liberia', '利比里亚', 'LR', 'LBR', '430', 'Monrovia', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (386, 'AF', 'Lesotho', '莱索托', 'LS', 'LSO', '426', 'Maseru', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (387, 'EU', 'Lithuania', '立陶宛', 'LT', 'LTU', '440', 'Vilnius', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (388, 'EU', 'Luxembourg', '卢森堡', 'LU', 'LUX', '442', 'Luxembourg', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (389, 'EU', 'Latvia', '拉脱维亚', 'LV', 'LVA', '428', 'Riga', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (390, 'AF', 'Libya', '利比亚', 'LY', 'LBY', '434', 'Tripoli', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (391, 'AF', 'Morocco', '摩洛哥', 'MA', 'MAR', '504', 'Rabat', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (392, 'EU', 'Monaco', '摩纳哥', 'MC', 'MCO', '492', 'Monaco', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (393, 'EU', 'Moldova', '摩尔多瓦', 'MD', 'MDA', '498', 'Chisinau', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (394, 'EU', 'Montenegro', '黑山共和国', 'ME', 'MNE', '499', 'Podgorica', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (395, 'NA', 'Saint Martin', '圣马丁', 'MF', 'MAF', '663', 'Marigot', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (396, 'AF', 'Madagascar', '马达加斯加', 'MG', 'MDG', '450', 'Antananarivo', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (397, 'OC', 'Marshall Islands', '马绍尔群岛', 'MH', 'MHL', '584', 'Majuro', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (398, 'EU', 'North Macedonia', '北马其顿', 'MK', 'MKD', '807', 'Skopje', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (399, 'AF', 'Mali', '马里', 'ML', 'MLI', '466', 'Bamako', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (400, 'AS', 'Myanmar', '缅甸', 'MM', 'MMR', '104', 'Nay Pyi Taw', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (401, 'AS', 'Mongolia', '蒙古', 'MN', 'MNG', '496', 'Ulaanbaatar', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (402, 'AS', 'Macao', '中国澳门', 'MO', 'MAC', '446', 'Macao', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (403, 'OC', 'Northern Mariana Islands', '北马里亚纳群岛', 'MP', 'MNP', '580', 'Saipan', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (404, 'NA', 'Martinique', '马提尼克岛', 'MQ', 'MTQ', '474', 'Fort-de-France', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (405, 'AF', 'Mauritania', '毛里塔尼亚', 'MR', 'MRT', '478', 'Nouakchott', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (406, 'NA', 'Montserrat', '蒙特塞拉特', 'MS', 'MSR', '500', 'Plymouth', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (407, 'EU', 'Malta', '马耳他', 'MT', 'MLT', '470', 'Valletta', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (408, 'AF', 'Mauritius', '毛里求斯', 'MU', 'MUS', '480', 'Port Louis', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (409, 'AS', 'Maldives', '马尔代夫', 'MV', 'MDV', '462', 'Male', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (410, 'AF', 'Malawi', '马拉维', 'MW', 'MWI', '454', 'Lilongwe', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (411, 'NA', 'Mexico', '墨西哥', 'MX', 'MEX', '484', 'Mexico City', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (412, 'AS', 'Malaysia', '马来西亚', 'MY', 'MYS', '458', 'Kuala Lumpur', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (413, 'AF', 'Mozambique', '莫桑比克', 'MZ', 'MOZ', '508', 'Maputo', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (414, 'AF', 'Namibia', '纳米比亚', 'NA', 'NAM', '516', 'Windhoek', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (415, 'OC', 'New Caledonia', '新喀里多尼亚', 'NC', 'NCL', '540', 'Noumea', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (416, 'AF', 'Niger', '尼日尔', 'NE', 'NER', '562', 'Niamey', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (417, 'OC', 'Norfolk Island', '诺福克岛', 'NF', 'NFK', '574', 'Kingston', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (418, 'AF', 'Nigeria', '', 'NG', 'NGA', '566', 'Abuja', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (419, 'NA', 'Nicaragua', '尼加拉瓜', 'NI', 'NIC', '558', 'Managua', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (420, 'EU', 'Netherlands', '荷兰', 'NL', 'NLD', '528', 'Amsterdam', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (421, 'EU', 'Norway', '挪威', 'NO', 'NOR', '578', 'Oslo', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (422, 'AS', 'Nepal', '尼泊尔', 'NP', 'NPL', '524', 'Kathmandu', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (423, 'OC', 'Nauru', '瑙鲁', 'NR', 'NRU', '520', 'Yaren', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (424, 'OC', 'Niue', '纽埃', 'NU', 'NIU', '570', 'Alofi', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (425, 'OC', 'New Zealand', '新西兰', 'NZ', 'NZL', '554', 'Wellington', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (426, 'AS', 'Oman', '阿曼', 'OM', 'OMN', '512', 'Muscat', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (427, 'NA', 'Panama', '巴拿马', 'PA', 'PAN', '591', 'Panama City', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (428, 'SA', 'Peru', '秘鲁', 'PE', 'PER', '604', 'Lima', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (429, 'OC', 'French Polynesia', '法属波利尼西亚', 'PF', 'PYF', '258', 'Papeete', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (430, 'OC', 'Papua New Guinea', '巴布亚新几内亚', 'PG', 'PNG', '598', 'Port Moresby', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (431, 'AS', 'Philippines', '菲律宾', 'PH', 'PHL', '608', 'Manila', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (432, 'AS', 'Pakistan', '巴基斯坦', 'PK', 'PAK', '586', 'Islamabad', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (433, 'EU', 'Poland', '波兰', 'PL', 'POL', '616', 'Warsaw', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (434, 'NA', 'Saint Pierre and Miquelon', '圣皮埃尔和密克隆群岛', 'PM', 'SPM', '666', 'Saint-Pierre', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (435, 'OC', 'Pitcairn Islands', '皮特凯恩群岛', 'PN', 'PCN', '612', 'Adamstown', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (436, 'NA', 'Puerto Rico', '波多黎各', 'PR', 'PRI', '630', 'San Juan', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (437, 'AS', 'Palestine', '巴勒斯坦', 'PS', 'PSE', '275', 'East Jerusalem', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (438, 'EU', 'Portugal', '葡萄牙', 'PT', 'PRT', '620', 'Lisbon', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (439, 'OC', 'Palau', '帕劳', 'PW', 'PLW', '585', 'Melekeok', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (440, 'SA', 'Paraguay', '巴拉圭', 'PY', 'PRY', '600', 'Asuncion', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (441, 'AS', 'Qatar', '卡塔尔', 'QA', 'QAT', '634', 'Doha', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (442, 'AF', 'Réunion', '留尼汪', 'RE', 'REU', '638', 'Saint-Denis', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (443, 'EU', 'Romania', '罗马尼亚', 'RO', 'ROU', '642', 'Bucharest', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (444, 'EU', 'Serbia', '塞尔维亚', 'RS', 'SRB', '688', 'Belgrade', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (445, 'EU', 'Russia', '俄国', 'RU', 'RUS', '643', 'Moscow', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (446, 'AF', 'Rwanda', '卢旺达', 'RW', 'RWA', '646', 'Kigali', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (447, 'AS', 'Saudi Arabia', '沙特阿拉伯', 'SA', 'SAU', '682', 'Riyadh', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (448, 'OC', 'Solomon Islands', '所罗门群岛', 'SB', 'SLB', '090', 'Honiara', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (449, 'AF', 'Seychelles', '塞舌尔', 'SC', 'SYC', '690', 'Victoria', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (450, 'AF', 'Sudan', '苏丹', 'SD', 'SDN', '729', 'Khartoum', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (451, 'EU', 'Sweden', '瑞典', 'SE', 'SWE', '752', 'Stockholm', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (452, 'AS', 'Singapore', '新加坡', 'SG', 'SGP', '702', 'Singapore', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (453, 'AF', 'Saint Helena', '圣海伦娜', 'SH', 'SHN', '654', 'Jamestown', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (454, 'EU', 'Slovenia', '斯洛文尼亚', 'SI', 'SVN', '705', 'Ljubljana', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (455, 'EU', 'Svalbard and Jan Mayen', '斯瓦尔巴和扬·马延', 'SJ', 'SJM', '744', 'Longyearbyen', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (456, 'EU', 'Slovakia', '斯洛伐克', 'SK', 'SVK', '703', 'Bratislava', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (457, 'AF', 'Sierra Leone', '塞拉利昂', 'SL', 'SLE', '694', 'Freetown', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (458, 'EU', 'San Marino', '圣马力诺', 'SM', 'SMR', '674', 'San Marino', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (459, 'AF', 'Senegal', '塞内加尔', 'SN', 'SEN', '686', 'Dakar', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (460, 'AF', 'Somalia', '索马里', 'SO', 'SOM', '706', 'Mogadishu', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (461, 'SA', 'Suriname', '苏里南', 'SR', 'SUR', '740', 'Paramaribo', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (462, 'AF', 'South Sudan', '南苏丹', 'SS', 'SSD', '728', 'Juba', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (463, 'AF', 'São Tomé and Príncipe', '圣多美和普林西比', 'ST', 'STP', '678', 'Sao Tome', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (464, 'NA', 'El Salvador', '萨尔瓦多', 'SV', 'SLV', '222', 'San Salvador', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (465, 'NA', 'Sint Maarten', '圣马丁', 'SX', 'SXM', '534', 'Philipsburg', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (466, 'AS', 'Syria', '叙利亚', 'SY', 'SYR', '760', 'Damascus', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (467, 'AF', 'Eswatini', '埃斯瓦蒂尼', 'SZ', 'SWZ', '748', 'Mbabane', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (468, 'NA', 'Turks and Caicos Islands', '特克斯和凯科斯群岛', 'TC', 'TCA', '796', 'Cockburn Town', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (469, 'AF', 'Chad', '乍得', 'TD', 'TCD', '148', 'N’Djamena', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (470, 'AN', 'French Southern Territories', '法属南部领地', 'TF', 'ATF', '260', 'Port-aux-Francais', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (471, 'AF', 'Togo', '多哥', 'TG', 'TGO', '768', 'Lome', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (472, 'AS', 'Thailand', '泰国', 'TH', 'THA', '764', 'Bangkok', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (473, 'AS', 'Tajikistan', '塔吉克斯坦', 'TJ', 'TJK', '762', 'Dushanbe', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (474, 'OC', 'Tokelau', '托克劳', 'TK', 'TKL', '772', '', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (475, 'OC', 'Timor-Leste', '东帝汶', 'TL', 'TLS', '626', 'Dili', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (476, 'AS', 'Turkmenistan', '土库曼斯坦', 'TM', 'TKM', '795', 'Ashgabat', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (477, 'AF', 'Tunisia', '突尼斯', 'TN', 'TUN', '788', 'Tunis', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (478, 'OC', 'Tonga', '汤加', 'TO', 'TON', '776', 'Nuku’alofa', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (479, 'AS', 'Turkey', '土耳其', 'TR', 'TUR', '792', 'Ankara', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (480, 'NA', 'Trinidad and Tobago', '特立尼达和多巴哥', 'TT', 'TTO', '780', 'Port of Spain', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (481, 'OC', 'Tuvalu', '图瓦卢', 'TV', 'TUV', '798', 'Funafuti', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (482, 'AS', 'Taiwan', '中国台湾', 'TW', 'TWN', '158', 'Taipei', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (483, 'AF', 'Tanzania', '坦桑尼亚', 'TZ', 'TZA', '834', 'Dodoma', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (484, 'EU', 'Ukraine', '乌克兰', 'UA', 'UKR', '804', 'Kyiv', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (485, 'AF', 'Uganda', '乌干达', 'UG', 'UGA', '800', 'Kampala', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (486, 'OC', 'U.S. Minor Outlying Islands', '', 'UM', 'UMI', '581', '', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (487, 'NA', 'United States', '美国', 'US', 'USA', '840', 'Washington', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (488, 'SA', 'Uruguay', '乌拉圭', 'UY', 'URY', '858', 'Montevideo', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (489, 'AS', 'Uzbekistan', '乌兹别克斯坦', 'UZ', 'UZB', '860', 'Tashkent', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (490, 'EU', 'Vatican City', '梵蒂冈城', 'VA', 'VAT', '336', 'Vatican City', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (491, 'NA', 'St Vincent and Grenadines', '圣文森特和格林纳丁斯', 'VC', 'VCT', '670', 'Kingstown', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (492, 'SA', 'Venezuela', '委内瑞拉', 'VE', 'VEN', '862', 'Caracas', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (493, 'NA', 'British Virgin Islands', '英属维尔京群岛', 'VG', 'VGB', '092', 'Road Town', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (494, 'NA', 'U.S. Virgin Islands', '美属维尔京群岛', 'VI', 'VIR', '850', 'Charlotte Amalie', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (495, 'AS', 'Vietnam', '越南', 'VN', 'VNM', '704', 'Hanoi', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (496, 'OC', 'Vanuatu', '瓦努阿图', 'VU', 'VUT', '548', 'Port Vila', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (497, 'OC', 'Wallis and Futuna', '瓦利斯和富图纳群岛', 'WF', 'WLF', '876', 'Mata Utu', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (498, 'OC', 'Samoa', '萨摩亚', 'WS', 'WSM', '882', 'Apia', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (499, 'EU', 'Kosovo', '科索沃', 'XK', 'XKX', '0', 'Pristina', '{\"tax_config\": {\"rate\": \"0.2\", \"order_amount\": 0}}', NULL, NULL);
INSERT INTO `st_region_country` VALUES (500, 'AS', 'Yemen', '也门', 'YE', 'YEM', '887', 'Sanaa', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (501, 'AF', 'Mayotte', '马约特岛', 'YT', 'MYT', '175', 'Mamoudzou', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (502, 'AF', 'South Africa', '南非', 'ZA', 'ZAF', '710', 'Pretoria', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (503, 'AF', 'Zambia', '赞比亚', 'ZM', 'ZMB', '894', 'Lusaka', NULL, NULL, NULL);
INSERT INTO `st_region_country` VALUES (504, 'AF', 'Zimbabwe', '津巴布韦', 'ZW', 'ZWE', '716', 'Harare', '{\"tax_config\": {\"rate\": null, \"order_amount\": null}}', NULL, '2021-08-07 14:59:44');

-- ----------------------------
-- Table structure for st_shipping_option
-- ----------------------------
DROP TABLE IF EXISTS `st_shipping_option`;
CREATE TABLE `st_shipping_option`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '配送名称',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '描述',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '状态：1 启动，2 禁用',
  `more` json NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配送方式' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_shipping_option
-- ----------------------------
INSERT INTO `st_shipping_option` VALUES (13, 'Standard Global Express (6-9  business days)', 'Ship with DHL,UPS,TNT,or FedEx etc.  Delivery time 6-9 business days', 'kuaidi', 1, NULL, '2021-06-07 09:49:37', '2021-08-01 21:06:34');
INSERT INTO `st_shipping_option` VALUES (30, 'United States UPS By Sea (48-58 days)', 'Only Ship to United States; Delivery time 48-58 days, shipped by sea, one shipment each week，no tracking updates during first 25-35 days(Floating on the sea), until your parcel is received and scanned by UPS or USPS;Slow but cheap', 'kuaidiSupper', 1, NULL, '2021-06-07 09:49:39', '2021-06-07 09:49:39');

-- ----------------------------
-- Table structure for st_shipping_option_config
-- ----------------------------
DROP TABLE IF EXISTS `st_shipping_option_config`;
CREATE TABLE `st_shipping_option_config`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标题',
  `shipping_option_id` int(11) NOT NULL DEFAULT 0 COMMENT '配送方式id',
  `countries` json NOT NULL COMMENT '国家',
  `states` json NULL COMMENT '省',
  `more` json NOT NULL COMMENT '配置',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '状态：1 启动，2 禁用',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 139 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '配送费用公式' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_shipping_option_config
-- ----------------------------
INSERT INTO `st_shipping_option_config` VALUES (126, '美国UPS 海运', 30, '[\"US\"]', NULL, '{\"over_weight\": {\"amount\": \"5.5\", \"weight\": 1000}, \"range_wieght\": [{\"range\": {\"end\": 100000, \"start\": 10}, \"first_weight\": {\"amount\": \"3.2\", \"weight\": 10}, \"continued_weight\": {\"amount\": \"0.046\", \"weight\": 10}}]}', 1, '2021-06-07 12:23:50', '2021-06-07 12:23:50', NULL);
INSERT INTO `st_shipping_option_config` VALUES (133, '全部国家', 13, '[\"AF\", \"AX\", \"AL\", \"DZ\", \"AS\", \"AD\", \"AO\", \"AI\", \"AQ\", \"AG\", \"AR\", \"AM\", \"AW\", \"AU\", \"AT\", \"AZ\", \"BS\", \"BH\", \"BD\", \"BB\", \"BY\", \"BE\", \"BZ\", \"BJ\", \"BM\", \"BT\", \"BO\", \"BQ\", \"BA\", \"BW\", \"BV\", \"BR\", \"IO\", \"VG\", \"BN\", \"BG\", \"BF\", \"BI\", \"CV\", \"KH\", \"CM\", \"CA\", \"KY\", \"CF\", \"TD\", \"CL\", \"CN\", \"CX\", \"CC\", \"CO\", \"KM\", \"CG\", \"CK\", \"CR\", \"HR\", \"CU\", \"CW\", \"CY\", \"CZ\", \"DK\", \"DJ\", \"DM\", \"DO\", \"CD\", \"EC\", \"EG\", \"SV\", \"GQ\", \"ER\", \"EE\", \"SZ\", \"ET\", \"FK\", \"FO\", \"FJ\", \"FI\", \"FR\", \"GF\", \"PF\", \"TF\", \"GA\", \"GM\", \"GE\", \"DE\", \"GH\", \"GI\", \"GR\", \"GL\", \"GD\", \"GP\", \"GU\", \"GT\", \"GG\", \"GN\", \"GW\", \"GY\", \"HT\", \"HM\", \"HN\", \"HK\", \"HU\", \"IS\", \"IN\", \"ID\", \"IR\", \"IQ\", \"IE\", \"IM\", \"IL\", \"IT\", \"CI\", \"JM\", \"JP\", \"JE\", \"JO\", \"KZ\", \"KE\", \"KI\", \"XK\", \"KW\", \"KG\", \"LA\", \"LV\", \"LB\", \"LS\", \"LR\", \"LY\", \"LI\", \"LT\", \"LU\", \"MO\", \"MG\", \"MW\", \"MY\", \"MV\", \"ML\", \"MT\", \"MH\", \"MQ\", \"MR\", \"MU\", \"YT\", \"MX\", \"FM\", \"MD\", \"MC\", \"MN\", \"ME\", \"MS\", \"MA\", \"MZ\", \"MM\", \"NA\", \"NR\", \"NP\", \"NL\", \"AN\", \"NC\", \"NZ\", \"NI\", \"NE\", \"NG\", \"NU\", \"NF\", \"KP\", \"MK\", \"MP\", \"NO\", \"OM\", \"PK\", \"PW\", \"PS\", \"PA\", \"PG\", \"PY\", \"PE\", \"PH\", \"PN\", \"PL\", \"PT\", \"PR\", \"QA\", \"RE\", \"RO\", \"RU\", \"RW\", \"BL\", \"SH\", \"LC\", \"MF\", \"PM\", \"WS\", \"SM\", \"ST\", \"SA\", \"SN\", \"RS\", \"CS\", \"SC\", \"SL\", \"SG\", \"SX\", \"SK\", \"SI\", \"SB\", \"SO\", \"ZA\", \"GS\", \"KR\", \"SS\", \"ES\", \"LK\", \"KN\", \"VC\", \"SD\", \"SR\", \"SJ\", \"SE\", \"CH\", \"SY\", \"TW\", \"TJ\", \"TZ\", \"TH\", \"TL\", \"TG\", \"TK\", \"TO\", \"TT\", \"TN\", \"TR\", \"TM\", \"TC\", \"TV\", \"UM\", \"VI\", \"UG\", \"UA\", \"AE\", \"GB\", \"US\", \"UY\", \"UZ\", \"VU\", \"VA\", \"VE\", \"VN\", \"WF\", \"EH\", \"YE\", \"ZM\", \"ZW\"]', NULL, '{\"over_weight\": {\"amount\": \"6.5\", \"weight\": \"1000\"}, \"range_wieght\": [{\"range\": {\"end\": \"20500\", \"start\": \"0\"}, \"first_weight\": {\"amount\": \"20\", \"weight\": \"500\"}, \"continued_weight\": {\"amount\": \"4\", \"weight\": \"500\"}}, {\"range\": {\"end\": \"30500\", \"start\": \"20500\"}, \"first_weight\": {\"amount\": \"1\", \"weight\": \"500\"}, \"continued_weight\": {\"amount\": \"1\", \"weight\": \"500\"}}]}', 1, '2021-06-07 11:07:00', '2021-08-08 13:29:31', NULL);

-- ----------------------------
-- Table structure for st_shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `st_shopping_cart`;
CREATE TABLE `st_shopping_cart`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '用户id',
  `uuid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `product_id` int(11) NOT NULL DEFAULT 0,
  `product_price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '加入购物车时的价格，不作为结算单价',
  `qty` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '数量',
  `is_buy_now` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否是立即购买',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_uuid_product_id`(`uuid`, `product_id`, `is_buy_now`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '购物车' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for st_spec
-- ----------------------------
DROP TABLE IF EXISTS `st_spec`;
CREATE TABLE `st_spec`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规格id',
  `spec_group_id` int(11) NOT NULL DEFAULT 0 COMMENT '规格组id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '规格名称',
  `spec_type` int(11) NOT NULL DEFAULT 1 COMMENT '规格类型：1 价格规格，2 普通规格',
  `input_type` int(11) NOT NULL DEFAULT 1 COMMENT '录入方式：1 下拉选择，2 文本输入',
  `select_values` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '可选值列表：录入方式为 1 时使用',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `is_show_img` int(1) NULL DEFAULT 2 COMMENT '是否显示图片 1 显示，2 不显示',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `spec_group_id`(`spec_group_id`, `name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '产品规格表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_spec
-- ----------------------------
INSERT INTO `st_spec` VALUES (1, 1, '颜色', 1, 1, 'Black\nGraphite\nAshen\nRed\nCappuccino\nBlue\nCrimson\nBeige\nKhaki\nViolet\nWhite\nPurple', '2021-03-15 15:49:21', '2021-07-02 17:26:00', 1);
INSERT INTO `st_spec` VALUES (2, 1, '尺寸', 1, 1, 'S\nM\nL\nXL\nXXL\nXXXL', '2021-03-15 15:50:00', '2021-03-15 15:50:00', 2);
INSERT INTO `st_spec` VALUES (3, 2, '颜色', 1, 1, 'Black\nWhite\nRed', '2021-03-17 10:14:41', '2021-03-17 10:14:41', 2);
INSERT INTO `st_spec` VALUES (4, 2, '容量', 1, 1, '32g\n64g\n128g', '2021-03-17 10:16:22', '2021-03-17 10:16:22', 2);
INSERT INTO `st_spec` VALUES (5, 3, 'CPU', 1, 1, 'i5\ni7', '2021-03-18 11:16:52', '2021-03-18 11:16:52', 2);
INSERT INTO `st_spec` VALUES (6, 4, '颜色', 1, 1, 'silver\nblack', '2021-03-18 11:24:32', '2021-03-18 11:24:32', 2);
INSERT INTO `st_spec` VALUES (7, 4, '容量', 1, 1, '32g\n64g\n128g', '2021-03-18 11:25:01', '2021-03-18 11:25:01', 2);
INSERT INTO `st_spec` VALUES (8, 4, '品牌', 1, 1, 'apple\nhuawei', '2021-03-18 11:25:37', '2021-03-18 11:25:37', 2);
INSERT INTO `st_spec` VALUES (9, 1, 'test', 2, 2, NULL, '2021-05-21 22:37:22', '2021-05-21 22:37:22', 2);

-- ----------------------------
-- Table structure for st_spec_group
-- ----------------------------
DROP TABLE IF EXISTS `st_spec_group`;
CREATE TABLE `st_spec_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '规格组id',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '规格组名称',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '产品规格组' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_spec_group
-- ----------------------------
INSERT INTO `st_spec_group` VALUES (1, '衣服', '2021-03-15 15:47:11', '2021-03-15 15:47:11');
INSERT INTO `st_spec_group` VALUES (2, '手机', '2021-03-17 10:14:04', '2021-03-17 10:14:04');
INSERT INTO `st_spec_group` VALUES (3, '笔记本电脑', '2021-03-18 11:16:17', '2021-03-18 11:16:17');
INSERT INTO `st_spec_group` VALUES (4, '平板', '2021-03-18 11:24:02', '2021-03-18 11:24:02');

-- ----------------------------
-- Table structure for st_user
-- ----------------------------
DROP TABLE IF EXISTS `st_user`;
CREATE TABLE `st_user`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '会员id',
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '名',
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '姓',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '昵称',
  `user_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登录名称',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登录邮箱',
  `email_verified_at` datetime(0) NULL DEFAULT NULL COMMENT '邮箱验证时间',
  `mobile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号码',
  `mobile_verified_at` datetime(0) NULL DEFAULT NULL COMMENT '手机号验证时间',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '登录密码',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `api_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'api token',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '注册时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `deleted_at` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  `status` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '状态 1 正常, 2 禁止登录',
  `last_login_at` datetime(0) NULL DEFAULT NULL COMMENT '最近一次登录日期',
  `last_login_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '最近一次登录ip',
  `avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像',
  `gender` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '性别 0未知, 1男, 2女',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `country_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '国家 code',
  `wechat_open_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信openid',
  `wechat_union_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微信unionid',
  `qq_open_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'QQ开放id',
  `weibo_open_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '微博开放id',
  `facebook_open_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Facebook开放id',
  `google_open_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Google开放id',
  `pay_credits` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '支付积分（可用于支付）',
  `rank_credits` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '信用积分（用于评级）',
  `source` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '来源',
  `http_referer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'HTTP_REFERER',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `st_uniq_email`(`email`) USING BTREE,
  UNIQUE INDEX `st_uniq_user_name`(`user_name`) USING BTREE,
  UNIQUE INDEX `st_uniq_mobile`(`mobile`) USING BTREE,
  UNIQUE INDEX `st_uniq_api_token`(`api_token`) USING BTREE,
  UNIQUE INDEX `st_uniq_wechat_open_id`(`wechat_open_id`) USING BTREE,
  UNIQUE INDEX `st_uniq_wechat_union_id`(`wechat_union_id`) USING BTREE,
  UNIQUE INDEX `st_uniq_qq_open_id`(`qq_open_id`) USING BTREE,
  UNIQUE INDEX `st_uniq_facebook_open_id`(`facebook_open_id`) USING BTREE,
  UNIQUE INDEX `st_uniq_google_open_id`(`google_open_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_user
-- ----------------------------
INSERT INTO `st_user` VALUES (1, 'strong', 'shop', '', NULL, 'strongshop@qq.com', NULL, NULL, NULL, '$2y$10$BM222/qgGdfElx2NUkeI5uuuEctOTboIz1BqzB03GBM6poUTuB.oe', 'SqrgDEnB6T0SOK7U5OycJgLAGBWPot6If08Hqq3tP8l4ZwDLHRfuNsrEDzWY', NULL, '2021-08-08 12:38:03', '2021-08-08 17:34:51', NULL, 1, '2021-08-08 17:34:51', '127.0.0.1', '', 0, NULL, 'GB', NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, '', '');

-- ----------------------------
-- Table structure for st_user_address
-- ----------------------------
DROP TABLE IF EXISTS `st_user_address`;
CREATE TABLE `st_user_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '名',
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '姓',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '联系电话',
  `fax` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '传真',
  `country_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '国家',
  `state_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '省',
  `state_other` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '其他省',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '城市',
  `address_line_1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '地址1',
  `address_line_2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '地址2',
  `postal_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '邮编',
  `is_default` int(11) NOT NULL DEFAULT 2 COMMENT '默认地址 1 是，2 否',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for st_user_collect
-- ----------------------------
DROP TABLE IF EXISTS `st_user_collect`;
CREATE TABLE `st_user_collect`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '会员id',
  `product_id` int(11) NOT NULL DEFAULT 0 COMMENT '产品id',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uniq_user_id_product_id`(`user_id`, `product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员产品收藏表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_user_collect
-- ----------------------------
INSERT INTO `st_user_collect` VALUES (1, 1, 1, '2021-08-08 13:19:29', NULL);

-- ----------------------------
-- Table structure for st_user_feedback
-- ----------------------------
DROP TABLE IF EXISTS `st_user_feedback`;
CREATE TABLE `st_user_feedback`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '反馈id',
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `type` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '反馈类型：1 购买，2 功能， 3 其他',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '反馈用户id',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '内容',
  `content_reply` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '回复内容 (管理员回复)',
  `admin_id` int(11) NOT NULL DEFAULT 0 COMMENT '回复管理员id',
  `more` json NULL COMMENT '更多内容',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态：1 未回复，2 已回复',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL COMMENT '删除时间',
  `read_at` datetime(0) NULL DEFAULT NULL COMMENT '已读时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '意见反馈表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_user_feedback
-- ----------------------------
INSERT INTO `st_user_feedback` VALUES (1, 0, 1, 1, '', '你好，网站不错哦', NULL, 0, NULL, 1, '2021-08-08 13:32:20', '2021-08-08 13:33:35', NULL, '2021-08-08 13:33:35');
INSERT INTO `st_user_feedback` VALUES (2, 1, 0, 0, '', '谢谢。期待您的更多反馈', NULL, 1, NULL, 0, '2021-08-08 13:32:47', '2021-08-08 13:33:35', NULL, '2021-08-08 13:33:35');
INSERT INTO `st_user_feedback` VALUES (3, 1, 1, 1, '', '没问题', NULL, 0, NULL, 0, '2021-08-08 13:33:33', '2021-08-08 13:33:35', NULL, '2021-08-08 13:33:35');

-- ----------------------------
-- Table structure for st_user_rank
-- ----------------------------
DROP TABLE IF EXISTS `st_user_rank`;
CREATE TABLE `st_user_rank`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '等级名称',
  `min_credits` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `max_credits` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '会员等级' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_user_rank
-- ----------------------------
INSERT INTO `st_user_rank` VALUES (1, 'Lv1', 0, 9999, NULL, NULL);
INSERT INTO `st_user_rank` VALUES (4, 'Lv2', 10000, 49999, NULL, NULL);
INSERT INTO `st_user_rank` VALUES (5, 'Lv3', 50000, 199999, NULL, NULL);
INSERT INTO `st_user_rank` VALUES (6, 'Lv4', 200000, 499999, NULL, NULL);
INSERT INTO `st_user_rank` VALUES (7, 'Lv5', 500000, 4294967295, NULL, NULL);

-- ----------------------------
-- Table structure for st_webconfig
-- ----------------------------
DROP TABLE IF EXISTS `st_webconfig`;
CREATE TABLE `st_webconfig`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '键名',
  `value` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '键值',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `key`(`key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '网站设置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_webconfig
-- ----------------------------
INSERT INTO `st_webconfig` VALUES (1, 'notice', '免费开源的跨境电商网站。', '2021-08-07 11:31:30', '2021-08-11 21:09:40');
INSERT INTO `st_webconfig` VALUES (2, 'store_title', 'StrongShop 商城 - 免费开源的跨境电商网站', '2021-08-07 11:32:23', '2021-08-11 20:26:10');
INSERT INTO `st_webconfig` VALUES (3, 'meta_keywords', '跨境电商，电商网站，Laravel商城，PHP商城，StrongShop', '2021-08-07 11:33:26', '2021-08-11 20:26:10');
INSERT INTO `st_webconfig` VALUES (4, 'meta_description', 'StrongShop 是一款免费开源的跨境电商商城网站。基于 PHP Laravel6 框架开发，遵循BSD-4-Clause开源协议,免费商用，支持多语言，多货币，多种国际配送方式，PayPal 支付，国际信用卡支付，PC Web 端和移动端自适应。', '2021-08-07 11:35:12', '2021-08-11 20:35:56');

SET FOREIGN_KEY_CHECKS = 1;
