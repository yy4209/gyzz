/*
Navicat MySQL Data Transfer

Source Server         : 公司服务器
Source Server Version : 50611
Source Host           : 4.16.1.158:3306
Source Database       : leoman_gyzz

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2016-12-09 17:54:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_admin
-- ----------------------------
DROP TABLE IF EXISTS `t_admin`;
CREATE TABLE `t_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `account` varchar(20) DEFAULT '' COMMENT '账号',
  `password` varchar(50) DEFAULT '' COMMENT '密码，MD5密文大写加密',
  `nickname` varchar(20) DEFAULT '' COMMENT '昵称',
  `mobile` varchar(20) DEFAULT '' COMMENT '手机号',
  `wx_num` varchar(20) DEFAULT '' COMMENT '微信号',
  `remark` varchar(200) DEFAULT '' COMMENT '备注',
  `create_time` bigint(50) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(50) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='管理员表';

-- ----------------------------
-- Records of t_admin
-- ----------------------------
INSERT INTO `t_admin` VALUES ('1', 'admin', 'E10ADC3949BA59ABBE56E057F20F883E', 'admin', '18745663258', '', '', '1479435514966', null);

-- ----------------------------
-- Table structure for t_attention
-- ----------------------------
DROP TABLE IF EXISTS `t_attention`;
CREATE TABLE `t_attention` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `from_user_id` int(11) DEFAULT NULL COMMENT '关注用户id',
  `to_user_id` int(11) DEFAULT NULL COMMENT '被关注用户id',
  `create_time` bigint(50) DEFAULT NULL COMMENT '关注时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COMMENT='用户关注信息表';

-- ----------------------------
-- Records of t_attention
-- ----------------------------
INSERT INTO `t_attention` VALUES ('1', '1', '2', '1480401739752');
INSERT INTO `t_attention` VALUES ('2', '2', '1', '1480401753315');
INSERT INTO `t_attention` VALUES ('3', '1', '3', '1480402190947');
INSERT INTO `t_attention` VALUES ('4', '1', '4', '1480402192346');
INSERT INTO `t_attention` VALUES ('5', '1', '5', '1480402193564');
INSERT INTO `t_attention` VALUES ('6', '1', '6', '1480402195278');
INSERT INTO `t_attention` VALUES ('7', '2', '7', '1480402274770');
INSERT INTO `t_attention` VALUES ('8', '2', '8', '1480402276124');
INSERT INTO `t_attention` VALUES ('9', '2', '9', '1480402283168');
INSERT INTO `t_attention` VALUES ('10', '2', '10', '1480402284853');
INSERT INTO `t_attention` VALUES ('11', '2', '3', '1480402287525');
INSERT INTO `t_attention` VALUES ('12', '2', '4', '1480402288580');
INSERT INTO `t_attention` VALUES ('13', '2', '5', '1480402289660');
INSERT INTO `t_attention` VALUES ('14', '2', '6', '1480402290731');

-- ----------------------------
-- Table structure for t_banner
-- ----------------------------
DROP TABLE IF EXISTS `t_banner`;
CREATE TABLE `t_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `type` int(1) DEFAULT '1' COMMENT '类型，1=草丛banner，2=其他banner',
  `position` int(1) DEFAULT '1' COMMENT '位置，1=纸条，2=广播，3=心事，4=登录闪屏',
  `url` varchar(200) DEFAULT '' COMMENT '图片url',
  `update_time` bigint(50) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='banner表';

-- ----------------------------
-- Records of t_banner
-- ----------------------------

-- ----------------------------
-- Table structure for t_broadcast
-- ----------------------------
DROP TABLE IF EXISTS `t_broadcast`;
CREATE TABLE `t_broadcast` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `title` varchar(50) DEFAULT '' COMMENT '描述',
  `url` varchar(200) DEFAULT '' COMMENT '语音url',
  `duration` int(3) DEFAULT '0' COMMENT '时长',
  `is_admin` int(1) DEFAULT '0' COMMENT '是否管理员发布，0=否，1=是，默认为0',
  `is_top` int(1) DEFAULT '0' COMMENT '是否置顶，0=否，1=是，默认为0',
  `create_time` bigint(50) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='广播表';

-- ----------------------------
-- Records of t_broadcast
-- ----------------------------

-- ----------------------------
-- Table structure for t_circle
-- ----------------------------
DROP TABLE IF EXISTS `t_circle`;
CREATE TABLE `t_circle` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `title` varchar(50) DEFAULT '' COMMENT '描述',
  `cover1` varchar(200) DEFAULT '' COMMENT '封面一url',
  `cover2` varchar(200) DEFAULT '' COMMENT '封面二url',
  `cover3` varchar(200) DEFAULT '' COMMENT '封面三url',
  `content` text COMMENT '内容',
  `synopsis` varchar(200) DEFAULT '' COMMENT '简介',
  `labels` varchar(200) DEFAULT '' COMMENT '标签，中间用英文逗号隔开',
  `is_admin` int(1) DEFAULT '0' COMMENT '是否管理员发布，0=否，1=是，默认为0',
  `is_top` int(1) DEFAULT '0' COMMENT '是否置顶，0=否，1=是，默认为0',
  `is_draft` int(1) DEFAULT '0' COMMENT '是否草稿，0=否，1=是，默认为0',
  `create_time` bigint(50) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='兴趣圈表';

-- ----------------------------
-- Records of t_circle
-- ----------------------------
INSERT INTO `t_circle` VALUES ('5', null, '测试添加草丛', 'http://ogbbsi37j.bkt.clouddn.com/Fs0wjBrRm-hDp82EWnEPnkfuuNed', '', '', '&ltp&gtThe light, it shines in your heart, in your eyes,&ltbr&gtBecome my hero, my star in the sky.&ltbr&gtThe light, it shines in your heart, in your eyes,&ltbr&gtYou are my hero, my one true light&lt/p&gt&ltp&gt&ltbr&gt&lt/p&gt', 'The light, it shines in your heart, in your eyes,Become my hero, my star in the sky.The light, it shines in your heart, in your eyes,You are my hero, my one true light', '鲜花,夏长', '1', '1', '0', '1481276924665');

-- ----------------------------
-- Table structure for t_city
-- ----------------------------
DROP TABLE IF EXISTS `t_city`;
CREATE TABLE `t_city` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) NOT NULL COMMENT '名称',
  `province_id` int(11) NOT NULL COMMENT '省份主键',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=389 DEFAULT CHARSET=utf8 COMMENT='城市';

-- ----------------------------
-- Records of t_city
-- ----------------------------
INSERT INTO `t_city` VALUES ('1', '北京市', '1');
INSERT INTO `t_city` VALUES ('2', '天津市', '2');
INSERT INTO `t_city` VALUES ('3', '上海市', '9');
INSERT INTO `t_city` VALUES ('4', '重庆市', '27');
INSERT INTO `t_city` VALUES ('5', '邯郸市', '3');
INSERT INTO `t_city` VALUES ('6', '石家庄市', '3');
INSERT INTO `t_city` VALUES ('7', '保定市', '3');
INSERT INTO `t_city` VALUES ('8', '张家口市', '3');
INSERT INTO `t_city` VALUES ('9', '承德市', '3');
INSERT INTO `t_city` VALUES ('10', '唐山市', '3');
INSERT INTO `t_city` VALUES ('11', '廊坊市', '3');
INSERT INTO `t_city` VALUES ('12', '沧州市', '3');
INSERT INTO `t_city` VALUES ('13', '衡水市', '3');
INSERT INTO `t_city` VALUES ('14', '邢台市', '3');
INSERT INTO `t_city` VALUES ('15', '秦皇岛市', '3');
INSERT INTO `t_city` VALUES ('16', '朔州市', '4');
INSERT INTO `t_city` VALUES ('17', '忻州市', '4');
INSERT INTO `t_city` VALUES ('18', '太原市', '4');
INSERT INTO `t_city` VALUES ('19', '大同市', '4');
INSERT INTO `t_city` VALUES ('20', '阳泉市', '4');
INSERT INTO `t_city` VALUES ('21', '晋中市', '4');
INSERT INTO `t_city` VALUES ('22', '长治市', '4');
INSERT INTO `t_city` VALUES ('23', '晋城市', '4');
INSERT INTO `t_city` VALUES ('24', '临汾市', '4');
INSERT INTO `t_city` VALUES ('25', '吕梁市', '4');
INSERT INTO `t_city` VALUES ('26', '运城市', '4');
INSERT INTO `t_city` VALUES ('27', '沈阳市', '6');
INSERT INTO `t_city` VALUES ('28', '铁岭市', '6');
INSERT INTO `t_city` VALUES ('29', '大连市', '6');
INSERT INTO `t_city` VALUES ('30', '鞍山市', '6');
INSERT INTO `t_city` VALUES ('31', '抚顺市', '6');
INSERT INTO `t_city` VALUES ('32', '本溪市', '6');
INSERT INTO `t_city` VALUES ('33', '丹东市', '6');
INSERT INTO `t_city` VALUES ('34', '锦州市', '6');
INSERT INTO `t_city` VALUES ('35', '营口市', '6');
INSERT INTO `t_city` VALUES ('36', '阜新市', '6');
INSERT INTO `t_city` VALUES ('37', '辽阳市', '6');
INSERT INTO `t_city` VALUES ('38', '朝阳市', '6');
INSERT INTO `t_city` VALUES ('39', '盘锦市', '6');
INSERT INTO `t_city` VALUES ('40', '葫芦岛市', '6');
INSERT INTO `t_city` VALUES ('41', '长春市', '7');
INSERT INTO `t_city` VALUES ('42', '吉林市', '7');
INSERT INTO `t_city` VALUES ('43', '延边朝鲜族自治州', '7');
INSERT INTO `t_city` VALUES ('44', '四平市', '7');
INSERT INTO `t_city` VALUES ('45', '通化市', '7');
INSERT INTO `t_city` VALUES ('46', '白城市', '7');
INSERT INTO `t_city` VALUES ('47', '辽源市', '7');
INSERT INTO `t_city` VALUES ('48', '松原市', '7');
INSERT INTO `t_city` VALUES ('49', '白山市', '7');
INSERT INTO `t_city` VALUES ('50', '哈尔滨市', '8');
INSERT INTO `t_city` VALUES ('51', '齐齐哈尔市', '8');
INSERT INTO `t_city` VALUES ('52', '鸡西市', '8');
INSERT INTO `t_city` VALUES ('53', '牡丹江市', '8');
INSERT INTO `t_city` VALUES ('54', '七台河市', '8');
INSERT INTO `t_city` VALUES ('55', '佳木斯市', '8');
INSERT INTO `t_city` VALUES ('56', '鹤岗市', '8');
INSERT INTO `t_city` VALUES ('57', '双鸭山市', '8');
INSERT INTO `t_city` VALUES ('58', '绥化市', '8');
INSERT INTO `t_city` VALUES ('59', '黑河市', '8');
INSERT INTO `t_city` VALUES ('60', '大兴安岭地区', '8');
INSERT INTO `t_city` VALUES ('61', '伊春市', '8');
INSERT INTO `t_city` VALUES ('62', '大庆市', '8');
INSERT INTO `t_city` VALUES ('63', '南京市', '10');
INSERT INTO `t_city` VALUES ('64', '无锡市', '10');
INSERT INTO `t_city` VALUES ('65', '镇江市', '10');
INSERT INTO `t_city` VALUES ('66', '苏州市', '10');
INSERT INTO `t_city` VALUES ('67', '南通市', '10');
INSERT INTO `t_city` VALUES ('68', '扬州市', '10');
INSERT INTO `t_city` VALUES ('69', '盐城市', '10');
INSERT INTO `t_city` VALUES ('70', '徐州市', '10');
INSERT INTO `t_city` VALUES ('71', '淮安市', '10');
INSERT INTO `t_city` VALUES ('72', '连云港市', '10');
INSERT INTO `t_city` VALUES ('73', '常州市', '10');
INSERT INTO `t_city` VALUES ('74', '泰州市', '10');
INSERT INTO `t_city` VALUES ('75', '宿迁市', '10');
INSERT INTO `t_city` VALUES ('76', '舟山市', '11');
INSERT INTO `t_city` VALUES ('77', '衢州市', '11');
INSERT INTO `t_city` VALUES ('78', '杭州市', '11');
INSERT INTO `t_city` VALUES ('79', '湖州市', '11');
INSERT INTO `t_city` VALUES ('80', '嘉兴市', '11');
INSERT INTO `t_city` VALUES ('81', '宁波市', '11');
INSERT INTO `t_city` VALUES ('82', '绍兴市', '11');
INSERT INTO `t_city` VALUES ('83', '温州市', '11');
INSERT INTO `t_city` VALUES ('84', '丽水市', '11');
INSERT INTO `t_city` VALUES ('85', '金华市', '11');
INSERT INTO `t_city` VALUES ('86', '台州市', '11');
INSERT INTO `t_city` VALUES ('87', '合肥市', '12');
INSERT INTO `t_city` VALUES ('88', '芜湖市', '12');
INSERT INTO `t_city` VALUES ('89', '蚌埠市', '12');
INSERT INTO `t_city` VALUES ('90', '淮南市', '12');
INSERT INTO `t_city` VALUES ('91', '马鞍山市', '12');
INSERT INTO `t_city` VALUES ('92', '淮北市', '12');
INSERT INTO `t_city` VALUES ('93', '铜陵市', '12');
INSERT INTO `t_city` VALUES ('94', '安庆市', '12');
INSERT INTO `t_city` VALUES ('95', '黄山市', '12');
INSERT INTO `t_city` VALUES ('96', '滁州市', '12');
INSERT INTO `t_city` VALUES ('97', '阜阳市', '12');
INSERT INTO `t_city` VALUES ('98', '宿州市', '12');
INSERT INTO `t_city` VALUES ('99', '巢湖市', '12');
INSERT INTO `t_city` VALUES ('100', '六安市', '12');
INSERT INTO `t_city` VALUES ('101', '亳州市', '12');
INSERT INTO `t_city` VALUES ('102', '池州市', '12');
INSERT INTO `t_city` VALUES ('103', '宣城市', '12');
INSERT INTO `t_city` VALUES ('104', '福州市', '13');
INSERT INTO `t_city` VALUES ('105', '厦门市', '13');
INSERT INTO `t_city` VALUES ('106', '宁德市', '13');
INSERT INTO `t_city` VALUES ('107', '莆田市', '13');
INSERT INTO `t_city` VALUES ('108', '泉州市', '13');
INSERT INTO `t_city` VALUES ('109', '漳州市', '13');
INSERT INTO `t_city` VALUES ('110', '龙岩市', '13');
INSERT INTO `t_city` VALUES ('111', '三明市', '13');
INSERT INTO `t_city` VALUES ('112', '南平市', '13');
INSERT INTO `t_city` VALUES ('113', '鹰潭市', '14');
INSERT INTO `t_city` VALUES ('114', '新余市', '14');
INSERT INTO `t_city` VALUES ('115', '南昌市', '14');
INSERT INTO `t_city` VALUES ('116', '九江市', '14');
INSERT INTO `t_city` VALUES ('117', '上饶市', '14');
INSERT INTO `t_city` VALUES ('118', '抚州市', '14');
INSERT INTO `t_city` VALUES ('119', '宜春市', '14');
INSERT INTO `t_city` VALUES ('120', '吉安市', '14');
INSERT INTO `t_city` VALUES ('121', '赣州市', '14');
INSERT INTO `t_city` VALUES ('122', '景德镇市', '14');
INSERT INTO `t_city` VALUES ('123', '萍乡市', '14');
INSERT INTO `t_city` VALUES ('124', '菏泽市', '15');
INSERT INTO `t_city` VALUES ('125', '济南市', '15');
INSERT INTO `t_city` VALUES ('126', '青岛市', '15');
INSERT INTO `t_city` VALUES ('127', '淄博市', '15');
INSERT INTO `t_city` VALUES ('128', '德州市', '15');
INSERT INTO `t_city` VALUES ('129', '烟台市', '15');
INSERT INTO `t_city` VALUES ('130', '潍坊市', '15');
INSERT INTO `t_city` VALUES ('131', '济宁市', '15');
INSERT INTO `t_city` VALUES ('132', '泰安市', '15');
INSERT INTO `t_city` VALUES ('133', '临沂市', '15');
INSERT INTO `t_city` VALUES ('134', '滨州市', '15');
INSERT INTO `t_city` VALUES ('135', '东营市', '15');
INSERT INTO `t_city` VALUES ('136', '威海市', '15');
INSERT INTO `t_city` VALUES ('137', '枣庄市', '15');
INSERT INTO `t_city` VALUES ('138', '日照市', '15');
INSERT INTO `t_city` VALUES ('139', '莱芜市', '15');
INSERT INTO `t_city` VALUES ('140', '聊城市', '15');
INSERT INTO `t_city` VALUES ('141', '商丘市', '16');
INSERT INTO `t_city` VALUES ('142', '郑州市', '16');
INSERT INTO `t_city` VALUES ('143', '安阳市', '16');
INSERT INTO `t_city` VALUES ('144', '新乡市', '16');
INSERT INTO `t_city` VALUES ('145', '许昌市', '16');
INSERT INTO `t_city` VALUES ('146', '平顶山市', '16');
INSERT INTO `t_city` VALUES ('147', '信阳市', '16');
INSERT INTO `t_city` VALUES ('148', '南阳市', '16');
INSERT INTO `t_city` VALUES ('149', '开封市', '16');
INSERT INTO `t_city` VALUES ('150', '洛阳市', '16');
INSERT INTO `t_city` VALUES ('151', '济源市', '16');
INSERT INTO `t_city` VALUES ('152', '焦作市', '16');
INSERT INTO `t_city` VALUES ('153', '鹤壁市', '16');
INSERT INTO `t_city` VALUES ('154', '濮阳市', '16');
INSERT INTO `t_city` VALUES ('155', '周口市', '16');
INSERT INTO `t_city` VALUES ('156', '漯河市', '16');
INSERT INTO `t_city` VALUES ('157', '驻马店市', '16');
INSERT INTO `t_city` VALUES ('158', '三门峡市', '16');
INSERT INTO `t_city` VALUES ('159', '武汉市', '17');
INSERT INTO `t_city` VALUES ('160', '襄樊市', '17');
INSERT INTO `t_city` VALUES ('161', '鄂州市', '17');
INSERT INTO `t_city` VALUES ('162', '孝感市', '17');
INSERT INTO `t_city` VALUES ('163', '黄冈市', '17');
INSERT INTO `t_city` VALUES ('164', '黄石市', '17');
INSERT INTO `t_city` VALUES ('165', '咸宁市', '17');
INSERT INTO `t_city` VALUES ('166', '荆州市', '17');
INSERT INTO `t_city` VALUES ('167', '宜昌市', '17');
INSERT INTO `t_city` VALUES ('168', '恩施土家族苗族自治州', '17');
INSERT INTO `t_city` VALUES ('169', '神农架林区', '17');
INSERT INTO `t_city` VALUES ('170', '十堰市', '17');
INSERT INTO `t_city` VALUES ('171', '随州市', '17');
INSERT INTO `t_city` VALUES ('172', '荆门市', '17');
INSERT INTO `t_city` VALUES ('173', '仙桃市', '17');
INSERT INTO `t_city` VALUES ('174', '天门市', '17');
INSERT INTO `t_city` VALUES ('175', '潜江市', '17');
INSERT INTO `t_city` VALUES ('176', '岳阳市', '18');
INSERT INTO `t_city` VALUES ('177', '长沙市', '18');
INSERT INTO `t_city` VALUES ('178', '湘潭市', '18');
INSERT INTO `t_city` VALUES ('179', '株洲市', '18');
INSERT INTO `t_city` VALUES ('180', '衡阳市', '18');
INSERT INTO `t_city` VALUES ('181', '郴州市', '18');
INSERT INTO `t_city` VALUES ('182', '常德市', '18');
INSERT INTO `t_city` VALUES ('183', '益阳市', '18');
INSERT INTO `t_city` VALUES ('184', '娄底市', '18');
INSERT INTO `t_city` VALUES ('185', '邵阳市', '18');
INSERT INTO `t_city` VALUES ('186', '湘西土家族苗族自治州', '18');
INSERT INTO `t_city` VALUES ('187', '张家界市', '18');
INSERT INTO `t_city` VALUES ('188', '怀化市', '18');
INSERT INTO `t_city` VALUES ('189', '永州市', '18');
INSERT INTO `t_city` VALUES ('190', '广州市', '19');
INSERT INTO `t_city` VALUES ('191', '汕尾市', '19');
INSERT INTO `t_city` VALUES ('192', '阳江市', '19');
INSERT INTO `t_city` VALUES ('193', '揭阳市', '19');
INSERT INTO `t_city` VALUES ('194', '茂名市', '19');
INSERT INTO `t_city` VALUES ('195', '惠州市', '19');
INSERT INTO `t_city` VALUES ('196', '江门市', '19');
INSERT INTO `t_city` VALUES ('197', '韶关市', '19');
INSERT INTO `t_city` VALUES ('198', '梅州市', '19');
INSERT INTO `t_city` VALUES ('199', '汕头市', '19');
INSERT INTO `t_city` VALUES ('200', '深圳市', '19');
INSERT INTO `t_city` VALUES ('201', '珠海市', '19');
INSERT INTO `t_city` VALUES ('202', '佛山市', '19');
INSERT INTO `t_city` VALUES ('203', '肇庆市', '19');
INSERT INTO `t_city` VALUES ('204', '湛江市', '19');
INSERT INTO `t_city` VALUES ('205', '中山市', '19');
INSERT INTO `t_city` VALUES ('206', '河源市', '19');
INSERT INTO `t_city` VALUES ('207', '清远市', '19');
INSERT INTO `t_city` VALUES ('208', '云浮市', '19');
INSERT INTO `t_city` VALUES ('209', '潮州市', '19');
INSERT INTO `t_city` VALUES ('210', '东莞市', '19');
INSERT INTO `t_city` VALUES ('211', '兰州市', '22');
INSERT INTO `t_city` VALUES ('212', '金昌市', '22');
INSERT INTO `t_city` VALUES ('213', '白银市', '22');
INSERT INTO `t_city` VALUES ('214', '天水市', '22');
INSERT INTO `t_city` VALUES ('215', '嘉峪关市', '22');
INSERT INTO `t_city` VALUES ('216', '武威市', '22');
INSERT INTO `t_city` VALUES ('217', '张掖市', '22');
INSERT INTO `t_city` VALUES ('218', '平凉市', '22');
INSERT INTO `t_city` VALUES ('219', '酒泉市', '22');
INSERT INTO `t_city` VALUES ('220', '庆阳市', '22');
INSERT INTO `t_city` VALUES ('221', '定西市', '22');
INSERT INTO `t_city` VALUES ('222', '陇南市', '22');
INSERT INTO `t_city` VALUES ('223', '临夏回族自治州', '22');
INSERT INTO `t_city` VALUES ('224', '甘南藏族自治州', '22');
INSERT INTO `t_city` VALUES ('225', '成都市', '28');
INSERT INTO `t_city` VALUES ('226', '攀枝花市', '28');
INSERT INTO `t_city` VALUES ('227', '自贡市', '28');
INSERT INTO `t_city` VALUES ('228', '绵阳市', '28');
INSERT INTO `t_city` VALUES ('229', '南充市', '28');
INSERT INTO `t_city` VALUES ('230', '达州市', '28');
INSERT INTO `t_city` VALUES ('231', '遂宁市', '28');
INSERT INTO `t_city` VALUES ('232', '广安市', '28');
INSERT INTO `t_city` VALUES ('233', '巴中市', '28');
INSERT INTO `t_city` VALUES ('234', '泸州市', '28');
INSERT INTO `t_city` VALUES ('235', '宜宾市', '28');
INSERT INTO `t_city` VALUES ('236', '资阳市', '28');
INSERT INTO `t_city` VALUES ('237', '内江市', '28');
INSERT INTO `t_city` VALUES ('238', '乐山市', '28');
INSERT INTO `t_city` VALUES ('239', '眉山市', '28');
INSERT INTO `t_city` VALUES ('240', '凉山彝族自治州', '28');
INSERT INTO `t_city` VALUES ('241', '雅安市', '28');
INSERT INTO `t_city` VALUES ('242', '甘孜藏族自治州', '28');
INSERT INTO `t_city` VALUES ('243', '阿坝藏族羌族自治州', '28');
INSERT INTO `t_city` VALUES ('244', '德阳市', '28');
INSERT INTO `t_city` VALUES ('245', '广元市', '28');
INSERT INTO `t_city` VALUES ('246', '贵阳市', '29');
INSERT INTO `t_city` VALUES ('247', '遵义市', '29');
INSERT INTO `t_city` VALUES ('248', '安顺市', '29');
INSERT INTO `t_city` VALUES ('249', '黔南布依族苗族自治州', '29');
INSERT INTO `t_city` VALUES ('250', '黔东南苗族侗族自治州', '29');
INSERT INTO `t_city` VALUES ('251', '铜仁地区', '29');
INSERT INTO `t_city` VALUES ('252', '毕节地区', '29');
INSERT INTO `t_city` VALUES ('253', '六盘水市', '29');
INSERT INTO `t_city` VALUES ('254', '黔西南布依族苗族自治州', '29');
INSERT INTO `t_city` VALUES ('255', '海口市', '20');
INSERT INTO `t_city` VALUES ('256', '三亚市', '20');
INSERT INTO `t_city` VALUES ('257', '五指山市', '20');
INSERT INTO `t_city` VALUES ('258', '琼海市', '20');
INSERT INTO `t_city` VALUES ('259', '儋州市', '20');
INSERT INTO `t_city` VALUES ('260', '文昌市', '20');
INSERT INTO `t_city` VALUES ('261', '万宁市', '20');
INSERT INTO `t_city` VALUES ('262', '东方市', '20');
INSERT INTO `t_city` VALUES ('263', '澄迈县', '20');
INSERT INTO `t_city` VALUES ('264', '定安县', '20');
INSERT INTO `t_city` VALUES ('265', '屯昌县', '20');
INSERT INTO `t_city` VALUES ('266', '临高县', '20');
INSERT INTO `t_city` VALUES ('267', '白沙黎族自治县', '20');
INSERT INTO `t_city` VALUES ('268', '昌江黎族自治县', '20');
INSERT INTO `t_city` VALUES ('269', '乐东黎族自治县', '20');
INSERT INTO `t_city` VALUES ('270', '陵水黎族自治县', '20');
INSERT INTO `t_city` VALUES ('271', '保亭黎族苗族自治县', '20');
INSERT INTO `t_city` VALUES ('272', '琼中黎族苗族自治县', '20');
INSERT INTO `t_city` VALUES ('273', '西双版纳傣族自治州', '30');
INSERT INTO `t_city` VALUES ('274', '德宏傣族景颇族自治州', '30');
INSERT INTO `t_city` VALUES ('275', '昭通市', '30');
INSERT INTO `t_city` VALUES ('276', '昆明市', '30');
INSERT INTO `t_city` VALUES ('277', '大理白族自治州', '30');
INSERT INTO `t_city` VALUES ('278', '红河哈尼族彝族自治州', '30');
INSERT INTO `t_city` VALUES ('279', '曲靖市', '30');
INSERT INTO `t_city` VALUES ('280', '保山市', '30');
INSERT INTO `t_city` VALUES ('281', '文山壮族苗族自治州', '30');
INSERT INTO `t_city` VALUES ('282', '玉溪市', '30');
INSERT INTO `t_city` VALUES ('283', '楚雄彝族自治州', '30');
INSERT INTO `t_city` VALUES ('284', '普洱市', '30');
INSERT INTO `t_city` VALUES ('285', '临沧市', '30');
INSERT INTO `t_city` VALUES ('286', '怒江傈傈族自治州', '30');
INSERT INTO `t_city` VALUES ('287', '迪庆藏族自治州', '30');
INSERT INTO `t_city` VALUES ('288', '丽江市', '30');
INSERT INTO `t_city` VALUES ('289', '海北藏族自治州', '25');
INSERT INTO `t_city` VALUES ('290', '西宁市', '25');
INSERT INTO `t_city` VALUES ('291', '海东地区', '25');
INSERT INTO `t_city` VALUES ('292', '黄南藏族自治州', '25');
INSERT INTO `t_city` VALUES ('293', '海南藏族自治州', '25');
INSERT INTO `t_city` VALUES ('294', '果洛藏族自治州', '25');
INSERT INTO `t_city` VALUES ('295', '玉树藏族自治州', '25');
INSERT INTO `t_city` VALUES ('296', '海西蒙古族藏族自治州', '25');
INSERT INTO `t_city` VALUES ('297', '西安市', '23');
INSERT INTO `t_city` VALUES ('298', '咸阳市', '23');
INSERT INTO `t_city` VALUES ('299', '延安市', '23');
INSERT INTO `t_city` VALUES ('300', '榆林市', '23');
INSERT INTO `t_city` VALUES ('301', '渭南市', '23');
INSERT INTO `t_city` VALUES ('302', '商洛市', '23');
INSERT INTO `t_city` VALUES ('303', '安康市', '23');
INSERT INTO `t_city` VALUES ('304', '汉中市', '23');
INSERT INTO `t_city` VALUES ('305', '宝鸡市', '23');
INSERT INTO `t_city` VALUES ('306', '铜川市', '23');
INSERT INTO `t_city` VALUES ('307', '防城港市', '21');
INSERT INTO `t_city` VALUES ('308', '南宁市', '21');
INSERT INTO `t_city` VALUES ('309', '崇左市', '21');
INSERT INTO `t_city` VALUES ('310', '来宾市', '21');
INSERT INTO `t_city` VALUES ('311', '柳州市', '21');
INSERT INTO `t_city` VALUES ('312', '桂林市', '21');
INSERT INTO `t_city` VALUES ('313', '梧州市', '21');
INSERT INTO `t_city` VALUES ('314', '贺州市', '21');
INSERT INTO `t_city` VALUES ('315', '贵港市', '21');
INSERT INTO `t_city` VALUES ('316', '玉林市', '21');
INSERT INTO `t_city` VALUES ('317', '百色市', '21');
INSERT INTO `t_city` VALUES ('318', '钦州市', '21');
INSERT INTO `t_city` VALUES ('319', '河池市', '21');
INSERT INTO `t_city` VALUES ('320', '北海市', '21');
INSERT INTO `t_city` VALUES ('321', '拉萨市', '31');
INSERT INTO `t_city` VALUES ('322', '日喀则地区', '31');
INSERT INTO `t_city` VALUES ('323', '山南地区', '31');
INSERT INTO `t_city` VALUES ('324', '林芝地区', '31');
INSERT INTO `t_city` VALUES ('325', '昌都地区', '31');
INSERT INTO `t_city` VALUES ('326', '那曲地区', '31');
INSERT INTO `t_city` VALUES ('327', '阿里地区', '31');
INSERT INTO `t_city` VALUES ('328', '银川市', '26');
INSERT INTO `t_city` VALUES ('329', '石嘴山市', '26');
INSERT INTO `t_city` VALUES ('330', '吴忠市', '26');
INSERT INTO `t_city` VALUES ('331', '固原市', '26');
INSERT INTO `t_city` VALUES ('332', '中卫市', '26');
INSERT INTO `t_city` VALUES ('333', '塔城地区', '24');
INSERT INTO `t_city` VALUES ('334', '哈密地区', '24');
INSERT INTO `t_city` VALUES ('335', '和田地区', '24');
INSERT INTO `t_city` VALUES ('336', '阿勒泰地区', '24');
INSERT INTO `t_city` VALUES ('337', '克孜勒苏柯尔克孜自治州', '24');
INSERT INTO `t_city` VALUES ('338', '博尔塔拉蒙古自治州', '24');
INSERT INTO `t_city` VALUES ('339', '克拉玛依市', '24');
INSERT INTO `t_city` VALUES ('340', '乌鲁木齐市', '24');
INSERT INTO `t_city` VALUES ('341', '石河子市', '24');
INSERT INTO `t_city` VALUES ('342', '昌吉回族自治州', '24');
INSERT INTO `t_city` VALUES ('343', '五家渠市', '24');
INSERT INTO `t_city` VALUES ('344', '吐鲁番地区', '24');
INSERT INTO `t_city` VALUES ('345', '巴音郭楞蒙古自治州', '24');
INSERT INTO `t_city` VALUES ('346', '阿克苏地区', '24');
INSERT INTO `t_city` VALUES ('347', '阿拉尔市', '24');
INSERT INTO `t_city` VALUES ('348', '喀什地区', '24');
INSERT INTO `t_city` VALUES ('349', '图木舒克市', '24');
INSERT INTO `t_city` VALUES ('350', '伊犁哈萨克自治州', '24');
INSERT INTO `t_city` VALUES ('351', '呼伦贝尔市', '5');
INSERT INTO `t_city` VALUES ('352', '呼和浩特市', '5');
INSERT INTO `t_city` VALUES ('353', '包头市', '5');
INSERT INTO `t_city` VALUES ('354', '乌海市', '5');
INSERT INTO `t_city` VALUES ('355', '乌兰察布市', '5');
INSERT INTO `t_city` VALUES ('356', '通辽市', '5');
INSERT INTO `t_city` VALUES ('357', '赤峰市', '5');
INSERT INTO `t_city` VALUES ('358', '鄂尔多斯市', '5');
INSERT INTO `t_city` VALUES ('359', '巴彦淖尔市', '5');
INSERT INTO `t_city` VALUES ('360', '锡林郭勒盟', '5');
INSERT INTO `t_city` VALUES ('361', '兴安盟', '5');
INSERT INTO `t_city` VALUES ('362', '阿拉善盟', '5');
INSERT INTO `t_city` VALUES ('363', '澳门特别行政区', '33');
INSERT INTO `t_city` VALUES ('364', '台北市', '32');
INSERT INTO `t_city` VALUES ('365', '高雄市', '32');
INSERT INTO `t_city` VALUES ('366', '台南市', '32');
INSERT INTO `t_city` VALUES ('367', '台中市', '32');
INSERT INTO `t_city` VALUES ('368', '金门县', '32');
INSERT INTO `t_city` VALUES ('369', '南投县', '32');
INSERT INTO `t_city` VALUES ('370', '基隆市', '32');
INSERT INTO `t_city` VALUES ('371', '新竹市', '32');
INSERT INTO `t_city` VALUES ('372', '嘉义县', '32');
INSERT INTO `t_city` VALUES ('373', '新北市', '32');
INSERT INTO `t_city` VALUES ('374', '宜兰县', '32');
INSERT INTO `t_city` VALUES ('375', '新竹县', '32');
INSERT INTO `t_city` VALUES ('376', '桃园县', '32');
INSERT INTO `t_city` VALUES ('377', '苗栗县', '32');
INSERT INTO `t_city` VALUES ('378', '彰化县', '32');
INSERT INTO `t_city` VALUES ('379', '嘉义县', '32');
INSERT INTO `t_city` VALUES ('380', '云林县', '32');
INSERT INTO `t_city` VALUES ('381', '屏东县', '32');
INSERT INTO `t_city` VALUES ('382', '台东县', '32');
INSERT INTO `t_city` VALUES ('383', '花莲县', '32');
INSERT INTO `t_city` VALUES ('384', '澎湖县', '32');
INSERT INTO `t_city` VALUES ('385', '连江县', '32');
INSERT INTO `t_city` VALUES ('386', '香港岛', '34');
INSERT INTO `t_city` VALUES ('387', '九龙', '34');
INSERT INTO `t_city` VALUES ('388', '新界', '34');

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `user_id` int(11) DEFAULT NULL COMMENT '评论发布人id',
  `content` varchar(500) DEFAULT '' COMMENT '评论内容',
  `voice_time` int(3) DEFAULT '0' COMMENT '语音长度',
  `source_id` int(11) DEFAULT NULL COMMENT '目标id',
  `source_type` int(2) DEFAULT '0' COMMENT '目标类型，0=信件，1=纸条，2=广播，3=心事，4=兴趣圈',
  `source_user_id` int(11) DEFAULT NULL COMMENT '目标关联用户id',
  `is_admin` int(1) DEFAULT '0' COMMENT '是否管理员发表，0=否，1=是，默认为0',
  `is_read` int(1) DEFAULT '0' COMMENT '是否已读，0=否，1=是，默认为0',
  `is_top` int(1) DEFAULT '0' COMMENT '是否置顶，0=否，1=是，默认为0',
  `create_time` bigint(50) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COMMENT='评论表';

-- ----------------------------
-- Records of t_comment
-- ----------------------------

-- ----------------------------
-- Table structure for t_feedback
-- ----------------------------
DROP TABLE IF EXISTS `t_feedback`;
CREATE TABLE `t_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `mobile` varchar(20) DEFAULT '' COMMENT '联系方式',
  `content` text COMMENT '反馈内容',
  `create_time` bigint(50) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='意见反馈表';

-- ----------------------------
-- Records of t_feedback
-- ----------------------------
INSERT INTO `t_feedback` VALUES ('7', '1', '18741526635', '测试意见反馈', '1480473986909');

-- ----------------------------
-- Table structure for t_image
-- ----------------------------
DROP TABLE IF EXISTS `t_image`;
CREATE TABLE `t_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `url` varchar(200) DEFAULT '' COMMENT '图片url',
  `source_id` int(11) DEFAULT NULL COMMENT '所属目标id',
  `source_type` int(2) DEFAULT '1' COMMENT '目标类型，1=纸条，2=广播，3=心事，4=兴趣圈，5=留言（用户），6=评论',
  `create_time` bigint(50) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COMMENT='图片表';

-- ----------------------------
-- Records of t_image
-- ----------------------------

-- ----------------------------
-- Table structure for t_leave_message
-- ----------------------------
DROP TABLE IF EXISTS `t_leave_message`;
CREATE TABLE `t_leave_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `user_id` int(11) DEFAULT NULL COMMENT '留言用户id',
  `source_id` int(11) DEFAULT NULL COMMENT '目标用户id',
  `content` varchar(500) DEFAULT '' COMMENT '留言内容',
  `is_read` int(1) DEFAULT '0' COMMENT '是否已读，0=未读，1=已读，默认为0',
  `create_time` bigint(50) DEFAULT NULL COMMENT '留言时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户留言表';

-- ----------------------------
-- Records of t_leave_message
-- ----------------------------
INSERT INTO `t_leave_message` VALUES ('1', '3', '1', '你好啊', '1', '1480473986909');

-- ----------------------------
-- Table structure for t_letter
-- ----------------------------
DROP TABLE IF EXISTS `t_letter`;
CREATE TABLE `t_letter` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `user_id` int(11) DEFAULT NULL COMMENT '写信人id',
  `type` int(2) DEFAULT '1' COMMENT '类型，1=花草丛，2=天涯，3=身边，默认为1',
  `title` varchar(50) DEFAULT '' COMMENT '标题',
  `content` varchar(2000) DEFAULT '' COMMENT '内容',
  `text_count` int(11) DEFAULT '0' COMMENT '文字个数',
  `image_count` int(11) DEFAULT '0' COMMENT '图片数量',
  `stamp_id` int(11) DEFAULT NULL COMMENT '邮票id',
  `paper_id` int(11) DEFAULT NULL COMMENT '信纸id',
  `mailer_id` int(11) DEFAULT NULL COMMENT '信封id',
  `username` varchar(20) DEFAULT '' COMMENT '寄信人姓名',
  `mobile` varchar(20) DEFAULT '' COMMENT '寄信人联系方式',
  `address` varchar(200) DEFAULT '' COMMENT '寄信人地址',
  `is_hidden` int(1) DEFAULT '0' COMMENT '是否匿名，0=否，1=是，默认为0',
  `open_money` double(10,1) DEFAULT '0.0' COMMENT '拆信金额',
  `print_status` int(1) DEFAULT '0' COMMENT '打印状态，0=未打印，1=已打印，默认为0',
  `to_user_id` int(1) DEFAULT NULL COMMENT '收信人id',
  `to_username` varchar(20) DEFAULT '' COMMENT '收信人姓名',
  `to_mobile` varchar(20) DEFAULT '' COMMENT '收信人联系方式',
  `to_address` varchar(200) DEFAULT '' COMMENT '收信人地址',
  `money_status` int(1) DEFAULT '0' COMMENT '付款状态，0=未付款，1=已付款，默认为0',
  `is_draft` int(1) DEFAULT '0' COMMENT '是否草稿，0=否，1=是，默认为0',
  `create_time` bigint(50) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='信件表';

-- ----------------------------
-- Records of t_letter
-- ----------------------------

-- ----------------------------
-- Table structure for t_letter_accept
-- ----------------------------
DROP TABLE IF EXISTS `t_letter_accept`;
CREATE TABLE `t_letter_accept` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `user_id` int(11) DEFAULT NULL COMMENT '收信人id',
  `letter_id` int(11) DEFAULT NULL COMMENT '关联信件id',
  `username` varchar(20) DEFAULT '' COMMENT '收信人姓名',
  `mobile` varchar(20) DEFAULT '' COMMENT '收信人联系方式',
  `address` varchar(200) DEFAULT '' COMMENT '收信人地址',
  `stamp_id` int(11) DEFAULT NULL COMMENT '邮票id',
  `paper_id` int(11) DEFAULT NULL COMMENT '信纸id',
  `mailer_id` int(11) DEFAULT NULL COMMENT '信封id',
  `send_type` int(1) DEFAULT '1' COMMENT '收信方式，1=普通，2=快件，默认为1',
  `express_name` varchar(20) DEFAULT '' COMMENT '快递公司',
  `express_num` varchar(50) DEFAULT NULL COMMENT '快递单号',
  `money_status` int(1) DEFAULT '0' COMMENT '是否付款，0=否，1=是，默认为0',
  `create_time` bigint(50) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='收信人信息表';

-- ----------------------------
-- Records of t_letter_accept
-- ----------------------------

-- ----------------------------
-- Table structure for t_letter_annex
-- ----------------------------
DROP TABLE IF EXISTS `t_letter_annex`;
CREATE TABLE `t_letter_annex` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `type` int(1) DEFAULT '1' COMMENT '类型，1=信纸，2=信封，3=邮票，默认为1',
  `cover` varchar(200) DEFAULT '' COMMENT '封面url',
  `content` varchar(200) DEFAULT '' COMMENT '内容url',
  `name` varchar(50) DEFAULT '' COMMENT '名称',
  `num` varchar(20) DEFAULT '' COMMENT '物品编号',
  `money` double(10,1) DEFAULT '0.0' COMMENT '价格',
  `description` varchar(200) DEFAULT '' COMMENT '物品描述',
  `create_time` bigint(50) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(50) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COMMENT='信件附属信息表';

-- ----------------------------
-- Records of t_letter_annex
-- ----------------------------
INSERT INTO `t_letter_annex` VALUES ('5', '1', 'http://img.xiami.net/images/album/img2/111202/6763647601472612686_2.jpg', '', '风起来的时光', '514-332', '1.5', '', '1479955483330', null);

-- ----------------------------
-- Table structure for t_letter_annex_sample
-- ----------------------------
DROP TABLE IF EXISTS `t_letter_annex_sample`;
CREATE TABLE `t_letter_annex_sample` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `letter_annex_id` int(11) DEFAULT NULL COMMENT '信件附属信息id',
  `type` int(1) DEFAULT '1' COMMENT '类型，1=信纸，2=信封，3=邮票，默认为1',
  `cover` varchar(200) DEFAULT '' COMMENT '封面url',
  `content` varchar(200) DEFAULT '' COMMENT '内容url',
  `name` varchar(50) DEFAULT '' COMMENT '名称',
  `num` varchar(20) DEFAULT '' COMMENT '物品编号',
  `money` double(10,1) DEFAULT '0.0' COMMENT '价格',
  `description` varchar(200) DEFAULT '' COMMENT '物品描述',
  `create_time` bigint(50) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='信件附属信息样本表';

-- ----------------------------
-- Records of t_letter_annex_sample
-- ----------------------------
INSERT INTO `t_letter_annex_sample` VALUES ('4', '5', '1', 'http://img.xiami.net/images/album/img2/111202/6763647601472612686_2.jpg', '', '风起来的时光', '514-332', '1.5', '', '1479955483330');

-- ----------------------------
-- Table structure for t_letter_money
-- ----------------------------
DROP TABLE IF EXISTS `t_letter_money`;
CREATE TABLE `t_letter_money` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `letter_id` int(11) DEFAULT NULL COMMENT '打赏的信件id',
  `create_time` bigint(50) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户打赏信件中间表';

-- ----------------------------
-- Records of t_letter_money
-- ----------------------------

-- ----------------------------
-- Table structure for t_mind
-- ----------------------------
DROP TABLE IF EXISTS `t_mind`;
CREATE TABLE `t_mind` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `title` varchar(50) DEFAULT '' COMMENT '标题',
  `cover` varchar(200) DEFAULT '' COMMENT '封面url',
  `synopsis` varchar(500) DEFAULT '' COMMENT '简介',
  `content` text COMMENT '内容',
  `open_money` double(10,1) DEFAULT '0.0' COMMENT '偷心金额',
  `is_admin` int(1) DEFAULT '0' COMMENT '是否管理员发布，0=否，1=是，默认为0',
  `is_top` int(1) DEFAULT '0' COMMENT '是否置顶，0=否，1=是，默认为0',
  `is_draft` int(1) DEFAULT '0' COMMENT '是否草稿，0=否，1=是，默认为0',
  `create_time` bigint(50) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='心事表';

-- ----------------------------
-- Records of t_mind
-- ----------------------------
INSERT INTO `t_mind` VALUES ('3', '3', '大灰狼与小白兔的故事', 'http://img.xiami.net/images/album/img2/111202/6763647601472612686_2.jpg', '', '我是一只萌萌哒小兔子，我生长在美丽的帕斯米尔大草原，我从小就喜欢吃青草，我是一只萌萌哒小兔子，我生长在美丽的帕斯米尔大草原，我从小就喜欢吃青草，我是一只萌萌哒小兔子，我生长在美丽的帕斯米尔大草原，我从小就喜欢吃青草，我是一只萌萌哒小兔子，我生长在美丽的帕斯米尔大草原，我从小就喜欢吃青草，我是一只萌萌哒小兔子，我生长在美丽的帕斯米尔大草原，我从小就喜欢吃青草，我是一只萌萌哒小兔子，我生长在美丽的帕斯米尔大草原，我从小就喜欢吃青草。', '1.5', '0', '1', '0', '1479955483330');
INSERT INTO `t_mind` VALUES ('7', '7', '大灰狼与小白兔的故事', 'http://img.xiami.net/images/album/img2/111202/6763647601472612686_2.jpg', '', '我是一只萌萌哒小兔子，我生长在美丽的帕斯米尔大草原，我从小就喜欢吃青草，我是一只萌萌哒小兔子，我生长在美丽的帕斯米尔大草原，我从小就喜欢吃青草，我是一只萌萌哒小兔子，我生长在美丽的帕斯米尔大草原，我从小就喜欢吃青草，我是一只萌萌哒小兔子，我生长在美丽的帕斯米尔大草原，我从小就喜欢吃青草，我是一只萌萌哒小兔子，我生长在美丽的帕斯米尔大草原，我从小就喜欢吃青草，我是一只萌萌哒小兔子，我生长在美丽的帕斯米尔大草原，我从小就喜欢吃青草。', '1.5', '0', '0', '0', '1479955483330');
INSERT INTO `t_mind` VALUES ('11', null, 'Immediate Music的艺人档案', 'http://ogbbsi37j.bkt.clouddn.com/FnBn5h0P-6kf5Ich9l0F_WXn7RrD', '', '&ltp align=\"center\" style=\"text-align: center;\"&gt&ltimg src=\"http://ogbbsi37j.bkt.clouddn.com/FnBn5h0P-6kf5Ich9l0F_WXn7RrD\" alt=\"13941929797837\" style=\"max-width:100%;\" class=\"\"&gt&ltbr&gt&lt/p&gt&ltp&gt&nbsp;&nbsp;&nbsp;&nbsp;Immediate Music是洛杉矶一个为无数大片的预告片制作了背景音乐的神秘组织，因为客户特殊，&nbsp;一直不为人知。洛杉矶知名音乐制作公司ImmediateMusic是一个为好莱坞等欧美无数电影大片的预告片制作背景音乐的专业音乐制作公司，外界对其旗下艺人知之不多，颇为神秘，Immediate Music&nbsp;管弦乐团有强烈史诗风格，多被采用于电影的背景音乐。旗下包含上百个乐团、合唱团以及作曲家合作，为各式片头、预告片以及影片、动画电等编写配乐，内容无所不包，真是非常强大的团体。以音乐的恢宏以及节奏感强著称。&lt/p&gt&ltp&gt&ltbr&gt&lt/p&gt', '1.5', '1', '0', '0', '1481262657667');

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `source_id` int(11) DEFAULT NULL COMMENT '关联目标id',
  `source_type` int(2) DEFAULT '0' COMMENT '关联目标类型，0=信件，1=纸条，默认为0',
  `nums` varchar(200) DEFAULT '' COMMENT '购买物品编号，中间用英文逗号隔开',
  `sum_money` double(10,1) DEFAULT '0.0' COMMENT '合计金额',
  `create_time` bigint(50) DEFAULT NULL COMMENT '购买时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户购买记录表';

-- ----------------------------
-- Records of t_order
-- ----------------------------

-- ----------------------------
-- Table structure for t_paper
-- ----------------------------
DROP TABLE IF EXISTS `t_paper`;
CREATE TABLE `t_paper` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `paper_id` int(11) DEFAULT NULL COMMENT '信纸id',
  `num` varchar(50) DEFAULT '' COMMENT '物品编号',
  `type` int(1) DEFAULT '1' COMMENT '类型，1=短叹，2=长吟，默认为1',
  `content` varchar(500) DEFAULT '' COMMENT '内容',
  `is_admin` int(1) DEFAULT '0' COMMENT '是否管理员发布，0=否，1=是，默认为0',
  `is_top` int(1) DEFAULT '0' COMMENT '是否置顶，0=否，1=是，默认为0',
  `is_draft` int(1) DEFAULT '0' COMMENT '是否草稿，0=否，1=是，默认为0',
  `create_time` bigint(50) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='纸条表';

-- ----------------------------
-- Records of t_paper
-- ----------------------------
INSERT INTO `t_paper` VALUES ('1', '1', '5', '514-332', '1', 'asd', '0', '0', '1', '1481162450953');
INSERT INTO `t_paper` VALUES ('11', null, '5', '514-332', '2', '我是一只萌萌哒小兔子，我生长在美丽的帕斯米尔大草原，我从小就喜欢吃青草，我是一只萌萌哒小兔子，我生长在美丽的帕斯米尔大草原，我从小就喜欢吃青草，我是一只萌萌哒小兔子，我生长在美丽的帕斯米尔大草原，我从小就喜欢吃青草，我是一只萌萌哒小兔子，我生长在美丽的帕斯米尔大草原，我从小就喜欢吃青草，我是一只萌萌哒小兔子，我生长在美丽的帕斯米尔大草原，我从小就喜欢吃青草，我是一只萌萌哒小兔子，我生长在美丽的帕斯', '1', '0', '0', '1481184123112');

-- ----------------------------
-- Table structure for t_placard
-- ----------------------------
DROP TABLE IF EXISTS `t_placard`;
CREATE TABLE `t_placard` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `admin_id` int(11) DEFAULT NULL COMMENT '管理员id',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `cover` varchar(200) DEFAULT '' COMMENT '封面图url',
  `content` text COMMENT '内容',
  `is_top` int(1) DEFAULT '0' COMMENT '是否置顶，0=否，1=是，默认为0',
  `create_time` bigint(50) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='公告表';

-- ----------------------------
-- Records of t_placard
-- ----------------------------

-- ----------------------------
-- Table structure for t_praise
-- ----------------------------
DROP TABLE IF EXISTS `t_praise`;
CREATE TABLE `t_praise` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `source_id` int(11) DEFAULT NULL COMMENT '目标id',
  `source_type` int(2) DEFAULT '0' COMMENT '目标类型，0=信件，1=纸条，2=广播，3=心事，4=兴趣圈',
  `create_time` bigint(50) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户点赞表';

-- ----------------------------
-- Records of t_praise
-- ----------------------------

-- ----------------------------
-- Table structure for t_prompt
-- ----------------------------
DROP TABLE IF EXISTS `t_prompt`;
CREATE TABLE `t_prompt` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `type` int(1) DEFAULT '0' COMMENT '类型，0=信件，1=纸条，2=广播，3=心事，4=兴趣圈',
  `content` varchar(50) DEFAULT '' COMMENT '内容',
  `update_time` bigint(50) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='文字提示表';

-- ----------------------------
-- Records of t_prompt
-- ----------------------------

-- ----------------------------
-- Table structure for t_province
-- ----------------------------
DROP TABLE IF EXISTS `t_province`;
CREATE TABLE `t_province` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='省份';

-- ----------------------------
-- Records of t_province
-- ----------------------------
INSERT INTO `t_province` VALUES ('1', '北京');
INSERT INTO `t_province` VALUES ('2', '天津');
INSERT INTO `t_province` VALUES ('3', '河北省');
INSERT INTO `t_province` VALUES ('4', '山西省');
INSERT INTO `t_province` VALUES ('5', '内蒙古自治区');
INSERT INTO `t_province` VALUES ('6', '辽宁省');
INSERT INTO `t_province` VALUES ('7', '吉林省');
INSERT INTO `t_province` VALUES ('8', '黑龙江省');
INSERT INTO `t_province` VALUES ('9', '上海市');
INSERT INTO `t_province` VALUES ('10', '江苏省');
INSERT INTO `t_province` VALUES ('11', '浙江省');
INSERT INTO `t_province` VALUES ('12', '安徽省');
INSERT INTO `t_province` VALUES ('13', '福建省');
INSERT INTO `t_province` VALUES ('14', '江西省');
INSERT INTO `t_province` VALUES ('15', '山东省');
INSERT INTO `t_province` VALUES ('16', '河南省');
INSERT INTO `t_province` VALUES ('17', '湖北省');
INSERT INTO `t_province` VALUES ('18', '湖南省');
INSERT INTO `t_province` VALUES ('19', '广东省');
INSERT INTO `t_province` VALUES ('20', '海南省');
INSERT INTO `t_province` VALUES ('21', '广西壮族自治区');
INSERT INTO `t_province` VALUES ('22', '甘肃省');
INSERT INTO `t_province` VALUES ('23', '陕西省');
INSERT INTO `t_province` VALUES ('24', '新疆维吾尔自治区');
INSERT INTO `t_province` VALUES ('25', '青海省');
INSERT INTO `t_province` VALUES ('26', '宁夏回族自治区');
INSERT INTO `t_province` VALUES ('27', '重庆市');
INSERT INTO `t_province` VALUES ('28', '四川省');
INSERT INTO `t_province` VALUES ('29', '贵州省');
INSERT INTO `t_province` VALUES ('30', '云南省');
INSERT INTO `t_province` VALUES ('31', '西藏自治区');
INSERT INTO `t_province` VALUES ('32', '台湾省');
INSERT INTO `t_province` VALUES ('33', '澳门特别行政区');
INSERT INTO `t_province` VALUES ('34', '香港特别行政区');

-- ----------------------------
-- Table structure for t_region
-- ----------------------------
DROP TABLE IF EXISTS `t_region`;
CREATE TABLE `t_region` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(200) DEFAULT NULL COMMENT '区名',
  `city_id` int(11) DEFAULT NULL COMMENT '城市ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3215 DEFAULT CHARSET=utf8 COMMENT='区域表';

-- ----------------------------
-- Records of t_region
-- ----------------------------
INSERT INTO `t_region` VALUES ('1', '东城区', '1');
INSERT INTO `t_region` VALUES ('2', '西城区', '1');
INSERT INTO `t_region` VALUES ('3', '崇文区', '1');
INSERT INTO `t_region` VALUES ('4', '宣武区', '1');
INSERT INTO `t_region` VALUES ('5', '朝阳区', '1');
INSERT INTO `t_region` VALUES ('6', '丰台区', '1');
INSERT INTO `t_region` VALUES ('7', '石景山区', '1');
INSERT INTO `t_region` VALUES ('8', '海淀区', '1');
INSERT INTO `t_region` VALUES ('9', '门头沟区', '1');
INSERT INTO `t_region` VALUES ('10', '房山区', '1');
INSERT INTO `t_region` VALUES ('11', '通州区', '1');
INSERT INTO `t_region` VALUES ('12', '顺义区', '1');
INSERT INTO `t_region` VALUES ('13', '昌平区', '1');
INSERT INTO `t_region` VALUES ('14', '大兴区', '1');
INSERT INTO `t_region` VALUES ('15', '怀柔区', '1');
INSERT INTO `t_region` VALUES ('16', '平谷区', '1');
INSERT INTO `t_region` VALUES ('17', '密云县', '1');
INSERT INTO `t_region` VALUES ('18', '延庆县', '1');
INSERT INTO `t_region` VALUES ('19', '和平区', '2');
INSERT INTO `t_region` VALUES ('20', '河东区', '2');
INSERT INTO `t_region` VALUES ('21', '河西区', '2');
INSERT INTO `t_region` VALUES ('22', '南开区', '2');
INSERT INTO `t_region` VALUES ('23', '河北区', '2');
INSERT INTO `t_region` VALUES ('24', '红桥区', '2');
INSERT INTO `t_region` VALUES ('25', '塘沽区', '2');
INSERT INTO `t_region` VALUES ('26', '汉沽区', '2');
INSERT INTO `t_region` VALUES ('27', '大港区', '2');
INSERT INTO `t_region` VALUES ('28', '东丽区', '2');
INSERT INTO `t_region` VALUES ('29', '西青区', '2');
INSERT INTO `t_region` VALUES ('30', '津南区', '2');
INSERT INTO `t_region` VALUES ('31', '北辰区', '2');
INSERT INTO `t_region` VALUES ('32', '武清区', '2');
INSERT INTO `t_region` VALUES ('33', '宝坻区', '2');
INSERT INTO `t_region` VALUES ('34', '宁河县', '2');
INSERT INTO `t_region` VALUES ('35', '静海县', '2');
INSERT INTO `t_region` VALUES ('36', '蓟县', '2');
INSERT INTO `t_region` VALUES ('37', '黄浦区', '3');
INSERT INTO `t_region` VALUES ('38', '卢湾区', '3');
INSERT INTO `t_region` VALUES ('39', '徐汇区', '3');
INSERT INTO `t_region` VALUES ('40', '长宁区', '3');
INSERT INTO `t_region` VALUES ('41', '静安区', '3');
INSERT INTO `t_region` VALUES ('42', '普陀区', '3');
INSERT INTO `t_region` VALUES ('43', '闸北区', '3');
INSERT INTO `t_region` VALUES ('44', '虹口区', '3');
INSERT INTO `t_region` VALUES ('45', '杨浦区', '3');
INSERT INTO `t_region` VALUES ('46', '闵行区', '3');
INSERT INTO `t_region` VALUES ('47', '宝山区', '3');
INSERT INTO `t_region` VALUES ('48', '嘉定区', '3');
INSERT INTO `t_region` VALUES ('49', '浦东新区', '3');
INSERT INTO `t_region` VALUES ('50', '金山区', '3');
INSERT INTO `t_region` VALUES ('51', '松江区', '3');
INSERT INTO `t_region` VALUES ('52', '青浦区', '3');
INSERT INTO `t_region` VALUES ('53', '南汇区', '3');
INSERT INTO `t_region` VALUES ('54', '奉贤区', '3');
INSERT INTO `t_region` VALUES ('55', '崇明县', '3');
INSERT INTO `t_region` VALUES ('56', '万州区', '4');
INSERT INTO `t_region` VALUES ('57', '涪陵区', '4');
INSERT INTO `t_region` VALUES ('58', '渝中区', '4');
INSERT INTO `t_region` VALUES ('59', '大渡口区', '4');
INSERT INTO `t_region` VALUES ('60', '江北区', '4');
INSERT INTO `t_region` VALUES ('61', '沙坪坝区', '4');
INSERT INTO `t_region` VALUES ('62', '九龙坡区', '4');
INSERT INTO `t_region` VALUES ('63', '南岸区', '4');
INSERT INTO `t_region` VALUES ('64', '北碚区', '4');
INSERT INTO `t_region` VALUES ('65', '万盛区', '4');
INSERT INTO `t_region` VALUES ('66', '双桥区', '4');
INSERT INTO `t_region` VALUES ('67', '渝北区', '4');
INSERT INTO `t_region` VALUES ('68', '巴南区', '4');
INSERT INTO `t_region` VALUES ('69', '黔江区', '4');
INSERT INTO `t_region` VALUES ('70', '长寿区', '4');
INSERT INTO `t_region` VALUES ('71', '江津区', '4');
INSERT INTO `t_region` VALUES ('72', '合川区', '4');
INSERT INTO `t_region` VALUES ('73', '永川区', '4');
INSERT INTO `t_region` VALUES ('74', '南川区', '4');
INSERT INTO `t_region` VALUES ('75', '綦江县', '4');
INSERT INTO `t_region` VALUES ('76', '潼南县', '4');
INSERT INTO `t_region` VALUES ('77', '铜梁县', '4');
INSERT INTO `t_region` VALUES ('78', '大足县', '4');
INSERT INTO `t_region` VALUES ('79', '荣昌县', '4');
INSERT INTO `t_region` VALUES ('80', '璧山县', '4');
INSERT INTO `t_region` VALUES ('81', '梁平县', '4');
INSERT INTO `t_region` VALUES ('82', '城口县', '4');
INSERT INTO `t_region` VALUES ('83', '丰都县', '4');
INSERT INTO `t_region` VALUES ('84', '垫江县', '4');
INSERT INTO `t_region` VALUES ('85', '武隆县', '4');
INSERT INTO `t_region` VALUES ('86', '忠县', '4');
INSERT INTO `t_region` VALUES ('87', '开县', '4');
INSERT INTO `t_region` VALUES ('88', '云阳县', '4');
INSERT INTO `t_region` VALUES ('89', '奉节县', '4');
INSERT INTO `t_region` VALUES ('90', '巫山县', '4');
INSERT INTO `t_region` VALUES ('91', '巫溪县', '4');
INSERT INTO `t_region` VALUES ('92', '石柱土家族自治县', '4');
INSERT INTO `t_region` VALUES ('93', '秀山土家族苗族自治县', '4');
INSERT INTO `t_region` VALUES ('94', '酉阳土家族苗族自治县', '4');
INSERT INTO `t_region` VALUES ('95', '彭水苗族土家族自治县', '4');
INSERT INTO `t_region` VALUES ('96', '邯山区', '5');
INSERT INTO `t_region` VALUES ('97', '丛台区', '5');
INSERT INTO `t_region` VALUES ('98', '复兴区', '5');
INSERT INTO `t_region` VALUES ('99', '峰峰矿区', '5');
INSERT INTO `t_region` VALUES ('100', '邯郸县', '5');
INSERT INTO `t_region` VALUES ('101', '临漳县', '5');
INSERT INTO `t_region` VALUES ('102', '成安县', '5');
INSERT INTO `t_region` VALUES ('103', '大名县', '5');
INSERT INTO `t_region` VALUES ('104', '涉县', '5');
INSERT INTO `t_region` VALUES ('105', '磁县', '5');
INSERT INTO `t_region` VALUES ('106', '肥乡县', '5');
INSERT INTO `t_region` VALUES ('107', '永年县', '5');
INSERT INTO `t_region` VALUES ('108', '邱县', '5');
INSERT INTO `t_region` VALUES ('109', '鸡泽县', '5');
INSERT INTO `t_region` VALUES ('110', '广平县', '5');
INSERT INTO `t_region` VALUES ('111', '馆陶县', '5');
INSERT INTO `t_region` VALUES ('112', '魏县', '5');
INSERT INTO `t_region` VALUES ('113', '曲周县', '5');
INSERT INTO `t_region` VALUES ('114', '武安市', '5');
INSERT INTO `t_region` VALUES ('115', '长安区', '6');
INSERT INTO `t_region` VALUES ('116', '桥东区', '6');
INSERT INTO `t_region` VALUES ('117', '桥西区', '6');
INSERT INTO `t_region` VALUES ('118', '新华区', '6');
INSERT INTO `t_region` VALUES ('119', '井陉矿区', '6');
INSERT INTO `t_region` VALUES ('120', '裕华区', '6');
INSERT INTO `t_region` VALUES ('121', '井陉县', '6');
INSERT INTO `t_region` VALUES ('122', '正定县', '6');
INSERT INTO `t_region` VALUES ('123', '栾城县', '6');
INSERT INTO `t_region` VALUES ('124', '行唐县', '6');
INSERT INTO `t_region` VALUES ('125', '灵寿县', '6');
INSERT INTO `t_region` VALUES ('126', '高邑县', '6');
INSERT INTO `t_region` VALUES ('127', '深泽县', '6');
INSERT INTO `t_region` VALUES ('128', '赞皇县', '6');
INSERT INTO `t_region` VALUES ('129', '无极县', '6');
INSERT INTO `t_region` VALUES ('130', '平山县', '6');
INSERT INTO `t_region` VALUES ('131', '元氏县', '6');
INSERT INTO `t_region` VALUES ('132', '赵县', '6');
INSERT INTO `t_region` VALUES ('133', '辛集市', '6');
INSERT INTO `t_region` VALUES ('134', '藁城市', '6');
INSERT INTO `t_region` VALUES ('135', '晋州市', '6');
INSERT INTO `t_region` VALUES ('136', '新乐市', '6');
INSERT INTO `t_region` VALUES ('137', '鹿泉市', '6');
INSERT INTO `t_region` VALUES ('138', '新市区', '7');
INSERT INTO `t_region` VALUES ('139', '北市区', '7');
INSERT INTO `t_region` VALUES ('140', '南市区', '7');
INSERT INTO `t_region` VALUES ('141', '满城县', '7');
INSERT INTO `t_region` VALUES ('142', '清苑县', '7');
INSERT INTO `t_region` VALUES ('143', '涞水县', '7');
INSERT INTO `t_region` VALUES ('144', '阜平县', '7');
INSERT INTO `t_region` VALUES ('145', '徐水县', '7');
INSERT INTO `t_region` VALUES ('146', '定兴县', '7');
INSERT INTO `t_region` VALUES ('147', '唐县', '7');
INSERT INTO `t_region` VALUES ('148', '高阳县', '7');
INSERT INTO `t_region` VALUES ('149', '容城县', '7');
INSERT INTO `t_region` VALUES ('150', '涞源县', '7');
INSERT INTO `t_region` VALUES ('151', '望都县', '7');
INSERT INTO `t_region` VALUES ('152', '安新县', '7');
INSERT INTO `t_region` VALUES ('153', '易县', '7');
INSERT INTO `t_region` VALUES ('154', '曲阳县', '7');
INSERT INTO `t_region` VALUES ('155', '蠡县', '7');
INSERT INTO `t_region` VALUES ('156', '顺平县', '7');
INSERT INTO `t_region` VALUES ('157', '博野县', '7');
INSERT INTO `t_region` VALUES ('158', '雄县', '7');
INSERT INTO `t_region` VALUES ('159', '涿州市', '7');
INSERT INTO `t_region` VALUES ('160', '定州市', '7');
INSERT INTO `t_region` VALUES ('161', '安国市', '7');
INSERT INTO `t_region` VALUES ('162', '高碑店市', '7');
INSERT INTO `t_region` VALUES ('163', '桥东区', '8');
INSERT INTO `t_region` VALUES ('164', '桥西区', '8');
INSERT INTO `t_region` VALUES ('165', '宣化区', '8');
INSERT INTO `t_region` VALUES ('166', '下花园区', '8');
INSERT INTO `t_region` VALUES ('167', '宣化县', '8');
INSERT INTO `t_region` VALUES ('168', '张北县', '8');
INSERT INTO `t_region` VALUES ('169', '康保县', '8');
INSERT INTO `t_region` VALUES ('170', '沽源县', '8');
INSERT INTO `t_region` VALUES ('171', '尚义县', '8');
INSERT INTO `t_region` VALUES ('172', '蔚县', '8');
INSERT INTO `t_region` VALUES ('173', '阳原县', '8');
INSERT INTO `t_region` VALUES ('174', '怀安县', '8');
INSERT INTO `t_region` VALUES ('175', '万全县', '8');
INSERT INTO `t_region` VALUES ('176', '怀来县', '8');
INSERT INTO `t_region` VALUES ('177', '涿鹿县', '8');
INSERT INTO `t_region` VALUES ('178', '赤城县', '8');
INSERT INTO `t_region` VALUES ('179', '崇礼县', '8');
INSERT INTO `t_region` VALUES ('180', '双桥区', '9');
INSERT INTO `t_region` VALUES ('181', '双滦区', '9');
INSERT INTO `t_region` VALUES ('182', '鹰手营子矿区', '9');
INSERT INTO `t_region` VALUES ('183', '承德县', '9');
INSERT INTO `t_region` VALUES ('184', '兴隆县', '9');
INSERT INTO `t_region` VALUES ('185', '平泉县', '9');
INSERT INTO `t_region` VALUES ('186', '滦平县', '9');
INSERT INTO `t_region` VALUES ('187', '隆化县', '9');
INSERT INTO `t_region` VALUES ('188', '丰宁满族自治县', '9');
INSERT INTO `t_region` VALUES ('189', '宽城满族自治县', '9');
INSERT INTO `t_region` VALUES ('190', '围场满族蒙古族自治县', '9');
INSERT INTO `t_region` VALUES ('191', '路南区', '10');
INSERT INTO `t_region` VALUES ('192', '路北区', '10');
INSERT INTO `t_region` VALUES ('193', '古冶区', '10');
INSERT INTO `t_region` VALUES ('194', '开平区', '10');
INSERT INTO `t_region` VALUES ('195', '丰南区', '10');
INSERT INTO `t_region` VALUES ('196', '丰润区', '10');
INSERT INTO `t_region` VALUES ('197', '滦县', '10');
INSERT INTO `t_region` VALUES ('198', '滦南县', '10');
INSERT INTO `t_region` VALUES ('199', '乐亭县', '10');
INSERT INTO `t_region` VALUES ('200', '迁西县', '10');
INSERT INTO `t_region` VALUES ('201', '玉田县', '10');
INSERT INTO `t_region` VALUES ('202', '唐海县', '10');
INSERT INTO `t_region` VALUES ('203', '遵化市', '10');
INSERT INTO `t_region` VALUES ('204', '迁安市', '10');
INSERT INTO `t_region` VALUES ('205', '安次区', '11');
INSERT INTO `t_region` VALUES ('206', '广阳区', '11');
INSERT INTO `t_region` VALUES ('207', '固安县', '11');
INSERT INTO `t_region` VALUES ('208', '永清县', '11');
INSERT INTO `t_region` VALUES ('209', '香河县', '11');
INSERT INTO `t_region` VALUES ('210', '大城县', '11');
INSERT INTO `t_region` VALUES ('211', '文安县', '11');
INSERT INTO `t_region` VALUES ('212', '大厂回族自治县', '11');
INSERT INTO `t_region` VALUES ('213', '霸州市', '11');
INSERT INTO `t_region` VALUES ('214', '三河市', '11');
INSERT INTO `t_region` VALUES ('215', '新华区', '12');
INSERT INTO `t_region` VALUES ('216', '运河区', '12');
INSERT INTO `t_region` VALUES ('217', '沧县', '12');
INSERT INTO `t_region` VALUES ('218', '青县', '12');
INSERT INTO `t_region` VALUES ('219', '东光县', '12');
INSERT INTO `t_region` VALUES ('220', '海兴县', '12');
INSERT INTO `t_region` VALUES ('221', '盐山县', '12');
INSERT INTO `t_region` VALUES ('222', '肃宁县', '12');
INSERT INTO `t_region` VALUES ('223', '南皮县', '12');
INSERT INTO `t_region` VALUES ('224', '吴桥县', '12');
INSERT INTO `t_region` VALUES ('225', '献县', '12');
INSERT INTO `t_region` VALUES ('226', '孟村回族自治县', '12');
INSERT INTO `t_region` VALUES ('227', '泊头市', '12');
INSERT INTO `t_region` VALUES ('228', '任丘市', '12');
INSERT INTO `t_region` VALUES ('229', '黄骅市', '12');
INSERT INTO `t_region` VALUES ('230', '河间市', '12');
INSERT INTO `t_region` VALUES ('231', '桃城区', '13');
INSERT INTO `t_region` VALUES ('232', '枣强县', '13');
INSERT INTO `t_region` VALUES ('233', '武邑县', '13');
INSERT INTO `t_region` VALUES ('234', '武强县', '13');
INSERT INTO `t_region` VALUES ('235', '饶阳县', '13');
INSERT INTO `t_region` VALUES ('236', '安平县', '13');
INSERT INTO `t_region` VALUES ('237', '故城县', '13');
INSERT INTO `t_region` VALUES ('238', '景县', '13');
INSERT INTO `t_region` VALUES ('239', '阜城县', '13');
INSERT INTO `t_region` VALUES ('240', '冀州市', '13');
INSERT INTO `t_region` VALUES ('241', '深州市', '13');
INSERT INTO `t_region` VALUES ('242', '桥东区', '14');
INSERT INTO `t_region` VALUES ('243', '桥西区', '14');
INSERT INTO `t_region` VALUES ('244', '邢台县', '14');
INSERT INTO `t_region` VALUES ('245', '临城县', '14');
INSERT INTO `t_region` VALUES ('246', '内丘县', '14');
INSERT INTO `t_region` VALUES ('247', '柏乡县', '14');
INSERT INTO `t_region` VALUES ('248', '隆尧县', '14');
INSERT INTO `t_region` VALUES ('249', '任县', '14');
INSERT INTO `t_region` VALUES ('250', '南和县', '14');
INSERT INTO `t_region` VALUES ('251', '宁晋县', '14');
INSERT INTO `t_region` VALUES ('252', '巨鹿县', '14');
INSERT INTO `t_region` VALUES ('253', '新河县', '14');
INSERT INTO `t_region` VALUES ('254', '广宗县', '14');
INSERT INTO `t_region` VALUES ('255', '平乡县', '14');
INSERT INTO `t_region` VALUES ('256', '威县', '14');
INSERT INTO `t_region` VALUES ('257', '清河县', '14');
INSERT INTO `t_region` VALUES ('258', '临西县', '14');
INSERT INTO `t_region` VALUES ('259', '南宫市', '14');
INSERT INTO `t_region` VALUES ('260', '沙河市', '14');
INSERT INTO `t_region` VALUES ('261', '海港区', '15');
INSERT INTO `t_region` VALUES ('262', '山海关区', '15');
INSERT INTO `t_region` VALUES ('263', '北戴河区', '15');
INSERT INTO `t_region` VALUES ('264', '青龙满族自治县', '15');
INSERT INTO `t_region` VALUES ('265', '昌黎县', '15');
INSERT INTO `t_region` VALUES ('266', '抚宁县', '15');
INSERT INTO `t_region` VALUES ('267', '卢龙县', '15');
INSERT INTO `t_region` VALUES ('268', '朔城区', '16');
INSERT INTO `t_region` VALUES ('269', '平鲁区', '16');
INSERT INTO `t_region` VALUES ('270', '山阴县', '16');
INSERT INTO `t_region` VALUES ('271', '应县', '16');
INSERT INTO `t_region` VALUES ('272', '右玉县', '16');
INSERT INTO `t_region` VALUES ('273', '怀仁县', '16');
INSERT INTO `t_region` VALUES ('274', '忻府区', '17');
INSERT INTO `t_region` VALUES ('275', '定襄县', '17');
INSERT INTO `t_region` VALUES ('276', '五台县', '17');
INSERT INTO `t_region` VALUES ('277', '代县', '17');
INSERT INTO `t_region` VALUES ('278', '繁峙县', '17');
INSERT INTO `t_region` VALUES ('279', '宁武县', '17');
INSERT INTO `t_region` VALUES ('280', '静乐县', '17');
INSERT INTO `t_region` VALUES ('281', '神池县', '17');
INSERT INTO `t_region` VALUES ('282', '五寨县', '17');
INSERT INTO `t_region` VALUES ('283', '岢岚县', '17');
INSERT INTO `t_region` VALUES ('284', '河曲县', '17');
INSERT INTO `t_region` VALUES ('285', '保德县', '17');
INSERT INTO `t_region` VALUES ('286', '偏关县', '17');
INSERT INTO `t_region` VALUES ('287', '原平市', '17');
INSERT INTO `t_region` VALUES ('288', '小店区', '18');
INSERT INTO `t_region` VALUES ('289', '迎泽区', '18');
INSERT INTO `t_region` VALUES ('290', '杏花岭区', '18');
INSERT INTO `t_region` VALUES ('291', '尖草坪区', '18');
INSERT INTO `t_region` VALUES ('292', '万柏林区', '18');
INSERT INTO `t_region` VALUES ('293', '晋源区', '18');
INSERT INTO `t_region` VALUES ('294', '清徐县', '18');
INSERT INTO `t_region` VALUES ('295', '阳曲县', '18');
INSERT INTO `t_region` VALUES ('296', '娄烦县', '18');
INSERT INTO `t_region` VALUES ('297', '古交市', '18');
INSERT INTO `t_region` VALUES ('298', '矿区', '19');
INSERT INTO `t_region` VALUES ('299', '南郊区', '19');
INSERT INTO `t_region` VALUES ('300', '新荣区', '19');
INSERT INTO `t_region` VALUES ('301', '阳高县', '19');
INSERT INTO `t_region` VALUES ('302', '天镇县', '19');
INSERT INTO `t_region` VALUES ('303', '广灵县', '19');
INSERT INTO `t_region` VALUES ('304', '灵丘县', '19');
INSERT INTO `t_region` VALUES ('305', '浑源县', '19');
INSERT INTO `t_region` VALUES ('306', '左云县', '19');
INSERT INTO `t_region` VALUES ('307', '大同县', '19');
INSERT INTO `t_region` VALUES ('308', '矿区', '20');
INSERT INTO `t_region` VALUES ('309', '平定县', '20');
INSERT INTO `t_region` VALUES ('310', '盂县', '20');
INSERT INTO `t_region` VALUES ('311', '榆次区', '21');
INSERT INTO `t_region` VALUES ('312', '榆社县', '21');
INSERT INTO `t_region` VALUES ('313', '左权县', '21');
INSERT INTO `t_region` VALUES ('314', '和顺县', '21');
INSERT INTO `t_region` VALUES ('315', '昔阳县', '21');
INSERT INTO `t_region` VALUES ('316', '寿阳县', '21');
INSERT INTO `t_region` VALUES ('317', '太谷县', '21');
INSERT INTO `t_region` VALUES ('318', '祁县', '21');
INSERT INTO `t_region` VALUES ('319', '平遥县', '21');
INSERT INTO `t_region` VALUES ('320', '灵石县', '21');
INSERT INTO `t_region` VALUES ('321', '介休市', '21');
INSERT INTO `t_region` VALUES ('322', '长治县', '22');
INSERT INTO `t_region` VALUES ('323', '襄垣县', '22');
INSERT INTO `t_region` VALUES ('324', '屯留县', '22');
INSERT INTO `t_region` VALUES ('325', '平顺县', '22');
INSERT INTO `t_region` VALUES ('326', '黎城县', '22');
INSERT INTO `t_region` VALUES ('327', '壶关县', '22');
INSERT INTO `t_region` VALUES ('328', '长子县', '22');
INSERT INTO `t_region` VALUES ('329', '武乡县', '22');
INSERT INTO `t_region` VALUES ('330', '沁县', '22');
INSERT INTO `t_region` VALUES ('331', '沁源县', '22');
INSERT INTO `t_region` VALUES ('332', '潞城市', '22');
INSERT INTO `t_region` VALUES ('333', '沁水县', '23');
INSERT INTO `t_region` VALUES ('334', '阳城县', '23');
INSERT INTO `t_region` VALUES ('335', '陵川县', '23');
INSERT INTO `t_region` VALUES ('336', '泽州县', '23');
INSERT INTO `t_region` VALUES ('337', '高平市', '23');
INSERT INTO `t_region` VALUES ('338', '尧都区', '24');
INSERT INTO `t_region` VALUES ('339', '曲沃县', '24');
INSERT INTO `t_region` VALUES ('340', '翼城县', '24');
INSERT INTO `t_region` VALUES ('341', '襄汾县', '24');
INSERT INTO `t_region` VALUES ('342', '洪洞县', '24');
INSERT INTO `t_region` VALUES ('343', '古县', '24');
INSERT INTO `t_region` VALUES ('344', '安泽县', '24');
INSERT INTO `t_region` VALUES ('345', '浮山县', '24');
INSERT INTO `t_region` VALUES ('346', '吉县', '24');
INSERT INTO `t_region` VALUES ('347', '乡宁县', '24');
INSERT INTO `t_region` VALUES ('348', '大宁县', '24');
INSERT INTO `t_region` VALUES ('349', '隰县', '24');
INSERT INTO `t_region` VALUES ('350', '永和县', '24');
INSERT INTO `t_region` VALUES ('351', '蒲县', '24');
INSERT INTO `t_region` VALUES ('352', '汾西县', '24');
INSERT INTO `t_region` VALUES ('353', '侯马市', '24');
INSERT INTO `t_region` VALUES ('354', '霍州市', '24');
INSERT INTO `t_region` VALUES ('355', '离石区', '25');
INSERT INTO `t_region` VALUES ('356', '文水县', '25');
INSERT INTO `t_region` VALUES ('357', '交城县', '25');
INSERT INTO `t_region` VALUES ('358', '兴县', '25');
INSERT INTO `t_region` VALUES ('359', '临县', '25');
INSERT INTO `t_region` VALUES ('360', '柳林县', '25');
INSERT INTO `t_region` VALUES ('361', '石楼县', '25');
INSERT INTO `t_region` VALUES ('362', '岚县', '25');
INSERT INTO `t_region` VALUES ('363', '方山县', '25');
INSERT INTO `t_region` VALUES ('364', '中阳县', '25');
INSERT INTO `t_region` VALUES ('365', '交口县', '25');
INSERT INTO `t_region` VALUES ('366', '孝义市', '25');
INSERT INTO `t_region` VALUES ('367', '汾阳市', '25');
INSERT INTO `t_region` VALUES ('368', '盐湖区', '26');
INSERT INTO `t_region` VALUES ('369', '临猗县', '26');
INSERT INTO `t_region` VALUES ('370', '万荣县', '26');
INSERT INTO `t_region` VALUES ('371', '闻喜县', '26');
INSERT INTO `t_region` VALUES ('372', '稷山县', '26');
INSERT INTO `t_region` VALUES ('373', '新绛县', '26');
INSERT INTO `t_region` VALUES ('374', '绛县', '26');
INSERT INTO `t_region` VALUES ('375', '垣曲县', '26');
INSERT INTO `t_region` VALUES ('376', '夏县', '26');
INSERT INTO `t_region` VALUES ('377', '平陆县', '26');
INSERT INTO `t_region` VALUES ('378', '芮城县', '26');
INSERT INTO `t_region` VALUES ('379', '永济市', '26');
INSERT INTO `t_region` VALUES ('380', '河津市', '26');
INSERT INTO `t_region` VALUES ('381', '和平区', '27');
INSERT INTO `t_region` VALUES ('382', '沈河区', '27');
INSERT INTO `t_region` VALUES ('383', '大东区', '27');
INSERT INTO `t_region` VALUES ('384', '皇姑区', '27');
INSERT INTO `t_region` VALUES ('385', '铁西区', '27');
INSERT INTO `t_region` VALUES ('386', '苏家屯区', '27');
INSERT INTO `t_region` VALUES ('387', '东陵区', '27');
INSERT INTO `t_region` VALUES ('388', '沈北新区', '27');
INSERT INTO `t_region` VALUES ('389', '于洪区', '27');
INSERT INTO `t_region` VALUES ('390', '辽中县', '27');
INSERT INTO `t_region` VALUES ('391', '康平县', '27');
INSERT INTO `t_region` VALUES ('392', '法库县', '27');
INSERT INTO `t_region` VALUES ('393', '新民市', '27');
INSERT INTO `t_region` VALUES ('394', '银州区', '28');
INSERT INTO `t_region` VALUES ('395', '清河区', '28');
INSERT INTO `t_region` VALUES ('396', '铁岭县', '28');
INSERT INTO `t_region` VALUES ('397', '西丰县', '28');
INSERT INTO `t_region` VALUES ('398', '昌图县', '28');
INSERT INTO `t_region` VALUES ('399', '调兵山市', '28');
INSERT INTO `t_region` VALUES ('400', '开原市', '28');
INSERT INTO `t_region` VALUES ('401', '长海县', '29');
INSERT INTO `t_region` VALUES ('402', '旅顺口区', '29');
INSERT INTO `t_region` VALUES ('403', '中山区', '29');
INSERT INTO `t_region` VALUES ('404', '西岗区', '29');
INSERT INTO `t_region` VALUES ('405', '沙河口区', '29');
INSERT INTO `t_region` VALUES ('406', '甘井子区', '29');
INSERT INTO `t_region` VALUES ('407', '金州区', '29');
INSERT INTO `t_region` VALUES ('408', '普兰店市', '29');
INSERT INTO `t_region` VALUES ('409', '瓦房店市', '29');
INSERT INTO `t_region` VALUES ('410', '庄河市', '29');
INSERT INTO `t_region` VALUES ('411', '铁东区', '30');
INSERT INTO `t_region` VALUES ('412', '铁西区', '30');
INSERT INTO `t_region` VALUES ('413', '立山区', '30');
INSERT INTO `t_region` VALUES ('414', '千山区', '30');
INSERT INTO `t_region` VALUES ('415', '台安县', '30');
INSERT INTO `t_region` VALUES ('416', '岫岩满族自治县', '30');
INSERT INTO `t_region` VALUES ('417', '海城市', '30');
INSERT INTO `t_region` VALUES ('418', '新抚区', '31');
INSERT INTO `t_region` VALUES ('419', '东洲区', '31');
INSERT INTO `t_region` VALUES ('420', '望花区', '31');
INSERT INTO `t_region` VALUES ('421', '顺城区', '31');
INSERT INTO `t_region` VALUES ('422', '抚顺县', '31');
INSERT INTO `t_region` VALUES ('423', '新宾满族自治县', '31');
INSERT INTO `t_region` VALUES ('424', '清原满族自治县', '31');
INSERT INTO `t_region` VALUES ('425', '平山区', '32');
INSERT INTO `t_region` VALUES ('426', '溪湖区', '32');
INSERT INTO `t_region` VALUES ('427', '明山区', '32');
INSERT INTO `t_region` VALUES ('428', '南芬区', '32');
INSERT INTO `t_region` VALUES ('429', '本溪满族自治县', '32');
INSERT INTO `t_region` VALUES ('430', '桓仁满族自治县', '32');
INSERT INTO `t_region` VALUES ('431', '元宝区', '33');
INSERT INTO `t_region` VALUES ('432', '振兴区', '33');
INSERT INTO `t_region` VALUES ('433', '振安区', '33');
INSERT INTO `t_region` VALUES ('434', '宽甸满族自治县', '33');
INSERT INTO `t_region` VALUES ('435', '东港市', '33');
INSERT INTO `t_region` VALUES ('436', '凤城市', '33');
INSERT INTO `t_region` VALUES ('437', '古塔区', '34');
INSERT INTO `t_region` VALUES ('438', '凌河区', '34');
INSERT INTO `t_region` VALUES ('439', '太和区', '34');
INSERT INTO `t_region` VALUES ('440', '黑山县', '34');
INSERT INTO `t_region` VALUES ('441', '义县', '34');
INSERT INTO `t_region` VALUES ('442', '凌海市', '34');
INSERT INTO `t_region` VALUES ('443', '北镇市', '34');
INSERT INTO `t_region` VALUES ('444', '站前区', '35');
INSERT INTO `t_region` VALUES ('445', '西市区', '35');
INSERT INTO `t_region` VALUES ('446', '鮁鱼圈区', '35');
INSERT INTO `t_region` VALUES ('447', '老边区', '35');
INSERT INTO `t_region` VALUES ('448', '盖州市', '35');
INSERT INTO `t_region` VALUES ('449', '大石桥市', '35');
INSERT INTO `t_region` VALUES ('450', '海州区', '36');
INSERT INTO `t_region` VALUES ('451', '新邱区', '36');
INSERT INTO `t_region` VALUES ('452', '太平区', '36');
INSERT INTO `t_region` VALUES ('453', '清河门区', '36');
INSERT INTO `t_region` VALUES ('454', '细河区', '36');
INSERT INTO `t_region` VALUES ('455', '阜新蒙古族自治县', '36');
INSERT INTO `t_region` VALUES ('456', '彰武县', '36');
INSERT INTO `t_region` VALUES ('457', '白塔区', '37');
INSERT INTO `t_region` VALUES ('458', '文圣区', '37');
INSERT INTO `t_region` VALUES ('459', '宏伟区', '37');
INSERT INTO `t_region` VALUES ('460', '弓长岭区', '37');
INSERT INTO `t_region` VALUES ('461', '太子河区', '37');
INSERT INTO `t_region` VALUES ('462', '辽阳县', '37');
INSERT INTO `t_region` VALUES ('463', '灯塔市', '37');
INSERT INTO `t_region` VALUES ('464', '双塔区', '38');
INSERT INTO `t_region` VALUES ('465', '龙城区', '38');
INSERT INTO `t_region` VALUES ('466', '朝阳县', '38');
INSERT INTO `t_region` VALUES ('467', '建平县', '38');
INSERT INTO `t_region` VALUES ('468', '喀喇沁左翼蒙古族自治县', '38');
INSERT INTO `t_region` VALUES ('469', '北票市', '38');
INSERT INTO `t_region` VALUES ('470', '凌源市', '38');
INSERT INTO `t_region` VALUES ('471', '双台子区', '39');
INSERT INTO `t_region` VALUES ('472', '兴隆台区', '39');
INSERT INTO `t_region` VALUES ('473', '大洼县', '39');
INSERT INTO `t_region` VALUES ('474', '盘山县', '39');
INSERT INTO `t_region` VALUES ('475', '连山区', '40');
INSERT INTO `t_region` VALUES ('476', '龙港区', '40');
INSERT INTO `t_region` VALUES ('477', '南票区', '40');
INSERT INTO `t_region` VALUES ('478', '绥中县', '40');
INSERT INTO `t_region` VALUES ('479', '建昌县', '40');
INSERT INTO `t_region` VALUES ('480', '兴城市', '40');
INSERT INTO `t_region` VALUES ('481', '南关区', '41');
INSERT INTO `t_region` VALUES ('482', '宽城区', '41');
INSERT INTO `t_region` VALUES ('483', '朝阳区', '41');
INSERT INTO `t_region` VALUES ('484', '二道区', '41');
INSERT INTO `t_region` VALUES ('485', '绿园区', '41');
INSERT INTO `t_region` VALUES ('486', '双阳区', '41');
INSERT INTO `t_region` VALUES ('487', '农安县', '41');
INSERT INTO `t_region` VALUES ('488', '九台市', '41');
INSERT INTO `t_region` VALUES ('489', '榆树市', '41');
INSERT INTO `t_region` VALUES ('490', '德惠市', '41');
INSERT INTO `t_region` VALUES ('491', '昌邑区', '42');
INSERT INTO `t_region` VALUES ('492', '龙潭区', '42');
INSERT INTO `t_region` VALUES ('493', '船营区', '42');
INSERT INTO `t_region` VALUES ('494', '丰满区', '42');
INSERT INTO `t_region` VALUES ('495', '永吉县', '42');
INSERT INTO `t_region` VALUES ('496', '蛟河市', '42');
INSERT INTO `t_region` VALUES ('497', '桦甸市', '42');
INSERT INTO `t_region` VALUES ('498', '舒兰市', '42');
INSERT INTO `t_region` VALUES ('499', '磐石市', '42');
INSERT INTO `t_region` VALUES ('500', '延吉市', '43');
INSERT INTO `t_region` VALUES ('501', '图们市', '43');
INSERT INTO `t_region` VALUES ('502', '敦化市', '43');
INSERT INTO `t_region` VALUES ('503', '珲春市', '43');
INSERT INTO `t_region` VALUES ('504', '龙井市', '43');
INSERT INTO `t_region` VALUES ('505', '和龙市', '43');
INSERT INTO `t_region` VALUES ('506', '汪清县', '43');
INSERT INTO `t_region` VALUES ('507', '安图县', '43');
INSERT INTO `t_region` VALUES ('508', '铁西区', '44');
INSERT INTO `t_region` VALUES ('509', '铁东区', '44');
INSERT INTO `t_region` VALUES ('510', '梨树县', '44');
INSERT INTO `t_region` VALUES ('511', '伊通满族自治县', '44');
INSERT INTO `t_region` VALUES ('512', '公主岭市', '44');
INSERT INTO `t_region` VALUES ('513', '双辽市', '44');
INSERT INTO `t_region` VALUES ('514', '东昌区', '45');
INSERT INTO `t_region` VALUES ('515', '二道江区', '45');
INSERT INTO `t_region` VALUES ('516', '通化县', '45');
INSERT INTO `t_region` VALUES ('517', '辉南县', '45');
INSERT INTO `t_region` VALUES ('518', '柳河县', '45');
INSERT INTO `t_region` VALUES ('519', '梅河口市', '45');
INSERT INTO `t_region` VALUES ('520', '集安市', '45');
INSERT INTO `t_region` VALUES ('521', '洮北区', '46');
INSERT INTO `t_region` VALUES ('522', '镇赉县', '46');
INSERT INTO `t_region` VALUES ('523', '通榆县', '46');
INSERT INTO `t_region` VALUES ('524', '洮南市', '46');
INSERT INTO `t_region` VALUES ('525', '大安市', '46');
INSERT INTO `t_region` VALUES ('526', '龙山区', '47');
INSERT INTO `t_region` VALUES ('527', '西安区', '47');
INSERT INTO `t_region` VALUES ('528', '东丰县', '47');
INSERT INTO `t_region` VALUES ('529', '东辽县', '47');
INSERT INTO `t_region` VALUES ('530', '宁江区', '48');
INSERT INTO `t_region` VALUES ('531', '前郭尔罗斯蒙古族自治县', '48');
INSERT INTO `t_region` VALUES ('532', '长岭县', '48');
INSERT INTO `t_region` VALUES ('533', '乾安县', '48');
INSERT INTO `t_region` VALUES ('534', '扶余县', '48');
INSERT INTO `t_region` VALUES ('535', '八道江区', '49');
INSERT INTO `t_region` VALUES ('536', '江源区', '49');
INSERT INTO `t_region` VALUES ('537', '抚松县', '49');
INSERT INTO `t_region` VALUES ('538', '靖宇县', '49');
INSERT INTO `t_region` VALUES ('539', '长白朝鲜族自治县', '49');
INSERT INTO `t_region` VALUES ('540', '临江市', '49');
INSERT INTO `t_region` VALUES ('541', '道里区', '50');
INSERT INTO `t_region` VALUES ('542', '南岗区', '50');
INSERT INTO `t_region` VALUES ('543', '道外区', '50');
INSERT INTO `t_region` VALUES ('544', '平房区', '50');
INSERT INTO `t_region` VALUES ('545', '松北区', '50');
INSERT INTO `t_region` VALUES ('546', '香坊区', '50');
INSERT INTO `t_region` VALUES ('547', '呼兰区', '50');
INSERT INTO `t_region` VALUES ('548', '阿城区', '50');
INSERT INTO `t_region` VALUES ('549', '依兰县', '50');
INSERT INTO `t_region` VALUES ('550', '方正县', '50');
INSERT INTO `t_region` VALUES ('551', '宾县', '50');
INSERT INTO `t_region` VALUES ('552', '巴彦县', '50');
INSERT INTO `t_region` VALUES ('553', '木兰县', '50');
INSERT INTO `t_region` VALUES ('554', '通河县', '50');
INSERT INTO `t_region` VALUES ('555', '延寿县', '50');
INSERT INTO `t_region` VALUES ('556', '双城市', '50');
INSERT INTO `t_region` VALUES ('557', '尚志市', '50');
INSERT INTO `t_region` VALUES ('558', '五常市', '50');
INSERT INTO `t_region` VALUES ('559', '龙沙区', '51');
INSERT INTO `t_region` VALUES ('560', '建华区', '51');
INSERT INTO `t_region` VALUES ('561', '铁锋区', '51');
INSERT INTO `t_region` VALUES ('562', '昂昂溪区', '51');
INSERT INTO `t_region` VALUES ('563', '富拉尔基区', '51');
INSERT INTO `t_region` VALUES ('564', '碾子山区', '51');
INSERT INTO `t_region` VALUES ('565', '梅里斯达翰尔族区', '51');
INSERT INTO `t_region` VALUES ('566', '龙江县', '51');
INSERT INTO `t_region` VALUES ('567', '依安县', '51');
INSERT INTO `t_region` VALUES ('568', '泰来县', '51');
INSERT INTO `t_region` VALUES ('569', '甘南县', '51');
INSERT INTO `t_region` VALUES ('570', '富裕县', '51');
INSERT INTO `t_region` VALUES ('571', '克山县', '51');
INSERT INTO `t_region` VALUES ('572', '克东县', '51');
INSERT INTO `t_region` VALUES ('573', '拜泉县', '51');
INSERT INTO `t_region` VALUES ('574', '讷河市', '51');
INSERT INTO `t_region` VALUES ('575', '鸡冠区', '52');
INSERT INTO `t_region` VALUES ('576', '恒山区', '52');
INSERT INTO `t_region` VALUES ('577', '滴道区', '52');
INSERT INTO `t_region` VALUES ('578', '梨树区', '52');
INSERT INTO `t_region` VALUES ('579', '城子河区', '52');
INSERT INTO `t_region` VALUES ('580', '麻山区', '52');
INSERT INTO `t_region` VALUES ('581', '鸡东县', '52');
INSERT INTO `t_region` VALUES ('582', '虎林市', '52');
INSERT INTO `t_region` VALUES ('583', '密山市', '52');
INSERT INTO `t_region` VALUES ('584', '东安区', '53');
INSERT INTO `t_region` VALUES ('585', '阳明区', '53');
INSERT INTO `t_region` VALUES ('586', '爱民区', '53');
INSERT INTO `t_region` VALUES ('587', '西安区', '53');
INSERT INTO `t_region` VALUES ('588', '东宁县', '53');
INSERT INTO `t_region` VALUES ('589', '林口县', '53');
INSERT INTO `t_region` VALUES ('590', '绥芬河市', '53');
INSERT INTO `t_region` VALUES ('591', '海林市', '53');
INSERT INTO `t_region` VALUES ('592', '宁安市', '53');
INSERT INTO `t_region` VALUES ('593', '穆棱市', '53');
INSERT INTO `t_region` VALUES ('594', '新兴区', '54');
INSERT INTO `t_region` VALUES ('595', '桃山区', '54');
INSERT INTO `t_region` VALUES ('596', '茄子河区', '54');
INSERT INTO `t_region` VALUES ('597', '勃利县', '54');
INSERT INTO `t_region` VALUES ('598', '向阳区', '55');
INSERT INTO `t_region` VALUES ('599', '前进区', '55');
INSERT INTO `t_region` VALUES ('600', '东风区', '55');
INSERT INTO `t_region` VALUES ('601', '桦南县', '55');
INSERT INTO `t_region` VALUES ('602', '桦川县', '55');
INSERT INTO `t_region` VALUES ('603', '汤原县', '55');
INSERT INTO `t_region` VALUES ('604', '抚远县', '55');
INSERT INTO `t_region` VALUES ('605', '同江市', '55');
INSERT INTO `t_region` VALUES ('606', '富锦市', '55');
INSERT INTO `t_region` VALUES ('607', '向阳区', '56');
INSERT INTO `t_region` VALUES ('608', '工农区', '56');
INSERT INTO `t_region` VALUES ('609', '南山区', '56');
INSERT INTO `t_region` VALUES ('610', '兴安区', '56');
INSERT INTO `t_region` VALUES ('611', '东山区', '56');
INSERT INTO `t_region` VALUES ('612', '兴山区', '56');
INSERT INTO `t_region` VALUES ('613', '萝北县', '56');
INSERT INTO `t_region` VALUES ('614', '绥滨县', '56');
INSERT INTO `t_region` VALUES ('615', '尖山区', '57');
INSERT INTO `t_region` VALUES ('616', '岭东区', '57');
INSERT INTO `t_region` VALUES ('617', '四方台区', '57');
INSERT INTO `t_region` VALUES ('618', '宝山区', '57');
INSERT INTO `t_region` VALUES ('619', '集贤县', '57');
INSERT INTO `t_region` VALUES ('620', '友谊县', '57');
INSERT INTO `t_region` VALUES ('621', '宝清县', '57');
INSERT INTO `t_region` VALUES ('622', '饶河县', '57');
INSERT INTO `t_region` VALUES ('623', '北林区', '58');
INSERT INTO `t_region` VALUES ('624', '望奎县', '58');
INSERT INTO `t_region` VALUES ('625', '兰西县', '58');
INSERT INTO `t_region` VALUES ('626', '青冈县', '58');
INSERT INTO `t_region` VALUES ('627', '庆安县', '58');
INSERT INTO `t_region` VALUES ('628', '明水县', '58');
INSERT INTO `t_region` VALUES ('629', '绥棱县', '58');
INSERT INTO `t_region` VALUES ('630', '安达市', '58');
INSERT INTO `t_region` VALUES ('631', '肇东市', '58');
INSERT INTO `t_region` VALUES ('632', '海伦市', '58');
INSERT INTO `t_region` VALUES ('633', '爱辉区', '59');
INSERT INTO `t_region` VALUES ('634', '嫩江县', '59');
INSERT INTO `t_region` VALUES ('635', '逊克县', '59');
INSERT INTO `t_region` VALUES ('636', '孙吴县', '59');
INSERT INTO `t_region` VALUES ('637', '北安市', '59');
INSERT INTO `t_region` VALUES ('638', '五大连池市', '59');
INSERT INTO `t_region` VALUES ('639', '呼玛县', '60');
INSERT INTO `t_region` VALUES ('640', '塔河县', '60');
INSERT INTO `t_region` VALUES ('641', '漠河县', '60');
INSERT INTO `t_region` VALUES ('642', '伊春区', '61');
INSERT INTO `t_region` VALUES ('643', '南岔区', '61');
INSERT INTO `t_region` VALUES ('644', '友好区', '61');
INSERT INTO `t_region` VALUES ('645', '西林区', '61');
INSERT INTO `t_region` VALUES ('646', '翠峦区', '61');
INSERT INTO `t_region` VALUES ('647', '新青区', '61');
INSERT INTO `t_region` VALUES ('648', '美溪区', '61');
INSERT INTO `t_region` VALUES ('649', '金山屯区', '61');
INSERT INTO `t_region` VALUES ('650', '五营区', '61');
INSERT INTO `t_region` VALUES ('651', '乌马河区', '61');
INSERT INTO `t_region` VALUES ('652', '汤旺河区', '61');
INSERT INTO `t_region` VALUES ('653', '带岭区', '61');
INSERT INTO `t_region` VALUES ('654', '乌伊岭区', '61');
INSERT INTO `t_region` VALUES ('655', '红星区', '61');
INSERT INTO `t_region` VALUES ('656', '上甘岭区', '61');
INSERT INTO `t_region` VALUES ('657', '嘉荫县', '61');
INSERT INTO `t_region` VALUES ('658', '铁力市', '61');
INSERT INTO `t_region` VALUES ('659', '萨尔图区', '62');
INSERT INTO `t_region` VALUES ('660', '龙凤区', '62');
INSERT INTO `t_region` VALUES ('661', '让胡路区', '62');
INSERT INTO `t_region` VALUES ('662', '红岗区', '62');
INSERT INTO `t_region` VALUES ('663', '大同区', '62');
INSERT INTO `t_region` VALUES ('664', '肇州县', '62');
INSERT INTO `t_region` VALUES ('665', '肇源县', '62');
INSERT INTO `t_region` VALUES ('666', '林甸县', '62');
INSERT INTO `t_region` VALUES ('667', '杜尔伯特蒙古族自治县', '62');
INSERT INTO `t_region` VALUES ('668', '江宁区', '63');
INSERT INTO `t_region` VALUES ('669', '浦口区', '63');
INSERT INTO `t_region` VALUES ('670', '玄武区', '63');
INSERT INTO `t_region` VALUES ('671', '白下区', '63');
INSERT INTO `t_region` VALUES ('672', '秦淮区', '63');
INSERT INTO `t_region` VALUES ('673', '建邺区', '63');
INSERT INTO `t_region` VALUES ('674', '鼓楼区', '63');
INSERT INTO `t_region` VALUES ('675', '下关区', '63');
INSERT INTO `t_region` VALUES ('676', '栖霞区', '63');
INSERT INTO `t_region` VALUES ('677', '雨花台区', '63');
INSERT INTO `t_region` VALUES ('678', '六合区', '63');
INSERT INTO `t_region` VALUES ('679', '溧水县', '63');
INSERT INTO `t_region` VALUES ('680', '高淳县', '63');
INSERT INTO `t_region` VALUES ('681', '崇安区', '64');
INSERT INTO `t_region` VALUES ('682', '南长区', '64');
INSERT INTO `t_region` VALUES ('683', '北塘区', '64');
INSERT INTO `t_region` VALUES ('684', '锡山区', '64');
INSERT INTO `t_region` VALUES ('685', '惠山区', '64');
INSERT INTO `t_region` VALUES ('686', '滨湖区', '64');
INSERT INTO `t_region` VALUES ('687', '江阴市', '64');
INSERT INTO `t_region` VALUES ('688', '宜兴市', '64');
INSERT INTO `t_region` VALUES ('689', '京口区', '65');
INSERT INTO `t_region` VALUES ('690', '润州区', '65');
INSERT INTO `t_region` VALUES ('691', '丹徒区', '65');
INSERT INTO `t_region` VALUES ('692', '丹阳市', '65');
INSERT INTO `t_region` VALUES ('693', '扬中市', '65');
INSERT INTO `t_region` VALUES ('694', '句容市', '65');
INSERT INTO `t_region` VALUES ('695', '沧浪区', '66');
INSERT INTO `t_region` VALUES ('696', '常熟市', '66');
INSERT INTO `t_region` VALUES ('697', '平江区', '66');
INSERT INTO `t_region` VALUES ('698', '金阊区', '66');
INSERT INTO `t_region` VALUES ('699', '虎丘区', '66');
INSERT INTO `t_region` VALUES ('700', '昆山市', '66');
INSERT INTO `t_region` VALUES ('701', '太仓市', '66');
INSERT INTO `t_region` VALUES ('702', '吴江市', '66');
INSERT INTO `t_region` VALUES ('703', '吴中区', '66');
INSERT INTO `t_region` VALUES ('704', '相城区', '66');
INSERT INTO `t_region` VALUES ('705', '张家港市', '66');
INSERT INTO `t_region` VALUES ('706', '崇川区', '67');
INSERT INTO `t_region` VALUES ('707', '港闸区', '67');
INSERT INTO `t_region` VALUES ('708', '海安县', '67');
INSERT INTO `t_region` VALUES ('709', '如东县', '67');
INSERT INTO `t_region` VALUES ('710', '启东市', '67');
INSERT INTO `t_region` VALUES ('711', '如皋市', '67');
INSERT INTO `t_region` VALUES ('712', '通州市', '67');
INSERT INTO `t_region` VALUES ('713', '海门市', '67');
INSERT INTO `t_region` VALUES ('714', '高邮市', '68');
INSERT INTO `t_region` VALUES ('715', '广陵区', '68');
INSERT INTO `t_region` VALUES ('716', '邗江区', '68');
INSERT INTO `t_region` VALUES ('717', '维扬区', '68');
INSERT INTO `t_region` VALUES ('718', '宝应县', '68');
INSERT INTO `t_region` VALUES ('719', '江都市', '68');
INSERT INTO `t_region` VALUES ('720', '仪征市', '68');
INSERT INTO `t_region` VALUES ('721', '亭湖区', '69');
INSERT INTO `t_region` VALUES ('722', '盐都区', '69');
INSERT INTO `t_region` VALUES ('723', '响水县', '69');
INSERT INTO `t_region` VALUES ('724', '滨海县', '69');
INSERT INTO `t_region` VALUES ('725', '阜宁县', '69');
INSERT INTO `t_region` VALUES ('726', '射阳县', '69');
INSERT INTO `t_region` VALUES ('727', '建湖县', '69');
INSERT INTO `t_region` VALUES ('728', '东台市', '69');
INSERT INTO `t_region` VALUES ('729', '大丰市', '69');
INSERT INTO `t_region` VALUES ('730', '鼓楼区', '70');
INSERT INTO `t_region` VALUES ('731', '云龙区', '70');
INSERT INTO `t_region` VALUES ('732', '九里区', '70');
INSERT INTO `t_region` VALUES ('733', '贾汪区', '70');
INSERT INTO `t_region` VALUES ('734', '泉山区', '70');
INSERT INTO `t_region` VALUES ('735', '丰县', '70');
INSERT INTO `t_region` VALUES ('736', '沛县', '70');
INSERT INTO `t_region` VALUES ('737', '铜山县', '70');
INSERT INTO `t_region` VALUES ('738', '睢宁县', '70');
INSERT INTO `t_region` VALUES ('739', '新沂市', '70');
INSERT INTO `t_region` VALUES ('740', '邳州市', '70');
INSERT INTO `t_region` VALUES ('741', '清河区', '71');
INSERT INTO `t_region` VALUES ('742', '楚州区', '71');
INSERT INTO `t_region` VALUES ('743', '淮阴区', '71');
INSERT INTO `t_region` VALUES ('744', '清浦区', '71');
INSERT INTO `t_region` VALUES ('745', '涟水县', '71');
INSERT INTO `t_region` VALUES ('746', '洪泽县', '71');
INSERT INTO `t_region` VALUES ('747', '盱眙县', '71');
INSERT INTO `t_region` VALUES ('748', '金湖县', '71');
INSERT INTO `t_region` VALUES ('749', '连云区', '72');
INSERT INTO `t_region` VALUES ('750', '新浦区', '72');
INSERT INTO `t_region` VALUES ('751', '海州区', '72');
INSERT INTO `t_region` VALUES ('752', '赣榆县', '72');
INSERT INTO `t_region` VALUES ('753', '东海县', '72');
INSERT INTO `t_region` VALUES ('754', '灌云县', '72');
INSERT INTO `t_region` VALUES ('755', '灌南县', '72');
INSERT INTO `t_region` VALUES ('756', '天宁区', '73');
INSERT INTO `t_region` VALUES ('757', '钟楼区', '73');
INSERT INTO `t_region` VALUES ('758', '戚墅堰区', '73');
INSERT INTO `t_region` VALUES ('759', '新北区', '73');
INSERT INTO `t_region` VALUES ('760', '武进区', '73');
INSERT INTO `t_region` VALUES ('761', '溧阳市', '73');
INSERT INTO `t_region` VALUES ('762', '金坛市', '73');
INSERT INTO `t_region` VALUES ('763', '海陵区', '74');
INSERT INTO `t_region` VALUES ('764', '高港区', '74');
INSERT INTO `t_region` VALUES ('765', '兴化市', '74');
INSERT INTO `t_region` VALUES ('766', '靖江市', '74');
INSERT INTO `t_region` VALUES ('767', '泰兴市', '74');
INSERT INTO `t_region` VALUES ('768', '姜堰市', '74');
INSERT INTO `t_region` VALUES ('769', '宿城区', '75');
INSERT INTO `t_region` VALUES ('770', '宿豫区', '75');
INSERT INTO `t_region` VALUES ('771', '沭阳县', '75');
INSERT INTO `t_region` VALUES ('772', '泗阳县', '75');
INSERT INTO `t_region` VALUES ('773', '泗洪县', '75');
INSERT INTO `t_region` VALUES ('774', '定海区', '76');
INSERT INTO `t_region` VALUES ('775', '普陀区', '76');
INSERT INTO `t_region` VALUES ('776', '岱山县', '76');
INSERT INTO `t_region` VALUES ('777', '嵊泗县', '76');
INSERT INTO `t_region` VALUES ('778', '柯城区', '77');
INSERT INTO `t_region` VALUES ('779', '衢江区', '77');
INSERT INTO `t_region` VALUES ('780', '常山县', '77');
INSERT INTO `t_region` VALUES ('781', '开化县', '77');
INSERT INTO `t_region` VALUES ('782', '龙游县', '77');
INSERT INTO `t_region` VALUES ('783', '江山市', '77');
INSERT INTO `t_region` VALUES ('784', '上城区', '78');
INSERT INTO `t_region` VALUES ('785', '下城区', '78');
INSERT INTO `t_region` VALUES ('786', '江干区', '78');
INSERT INTO `t_region` VALUES ('787', '拱墅区', '78');
INSERT INTO `t_region` VALUES ('788', '西湖区', '78');
INSERT INTO `t_region` VALUES ('789', '滨江区', '78');
INSERT INTO `t_region` VALUES ('790', '余杭区', '78');
INSERT INTO `t_region` VALUES ('791', '桐庐县', '78');
INSERT INTO `t_region` VALUES ('792', '淳安县', '78');
INSERT INTO `t_region` VALUES ('793', '建德市', '78');
INSERT INTO `t_region` VALUES ('794', '富阳市', '78');
INSERT INTO `t_region` VALUES ('795', '临安市', '78');
INSERT INTO `t_region` VALUES ('796', '萧山区', '78');
INSERT INTO `t_region` VALUES ('797', '吴兴区', '79');
INSERT INTO `t_region` VALUES ('798', '南浔区', '79');
INSERT INTO `t_region` VALUES ('799', '德清县', '79');
INSERT INTO `t_region` VALUES ('800', '长兴县', '79');
INSERT INTO `t_region` VALUES ('801', '安吉县', '79');
INSERT INTO `t_region` VALUES ('802', ' 南湖区', '80');
INSERT INTO `t_region` VALUES ('803', ' 秀洲区', '80');
INSERT INTO `t_region` VALUES ('804', ' 嘉善县', '80');
INSERT INTO `t_region` VALUES ('805', ' 海盐县', '80');
INSERT INTO `t_region` VALUES ('806', ' 海宁市', '80');
INSERT INTO `t_region` VALUES ('807', ' 平湖市', '80');
INSERT INTO `t_region` VALUES ('808', ' 桐乡市 ', '80');
INSERT INTO `t_region` VALUES ('809', '海曙区', '81');
INSERT INTO `t_region` VALUES ('810', '江东区', '81');
INSERT INTO `t_region` VALUES ('811', '江北区', '81');
INSERT INTO `t_region` VALUES ('812', '北仑区', '81');
INSERT INTO `t_region` VALUES ('813', '镇海区', '81');
INSERT INTO `t_region` VALUES ('814', '鄞州区', '81');
INSERT INTO `t_region` VALUES ('815', '象山县', '81');
INSERT INTO `t_region` VALUES ('816', '宁海县', '81');
INSERT INTO `t_region` VALUES ('817', '余姚市', '81');
INSERT INTO `t_region` VALUES ('818', '慈溪市', '81');
INSERT INTO `t_region` VALUES ('819', '奉化市', '81');
INSERT INTO `t_region` VALUES ('820', '越城区', '82');
INSERT INTO `t_region` VALUES ('821', '绍兴县', '82');
INSERT INTO `t_region` VALUES ('822', '新昌县', '82');
INSERT INTO `t_region` VALUES ('823', '诸暨市', '82');
INSERT INTO `t_region` VALUES ('824', '上虞市', '82');
INSERT INTO `t_region` VALUES ('825', '嵊州市', '82');
INSERT INTO `t_region` VALUES ('826', '鹿城区', '83');
INSERT INTO `t_region` VALUES ('827', '龙湾区', '83');
INSERT INTO `t_region` VALUES ('828', '瓯海区', '83');
INSERT INTO `t_region` VALUES ('829', '洞头县', '83');
INSERT INTO `t_region` VALUES ('830', '永嘉县', '83');
INSERT INTO `t_region` VALUES ('831', '平阳县', '83');
INSERT INTO `t_region` VALUES ('832', '苍南县', '83');
INSERT INTO `t_region` VALUES ('833', '文成县', '83');
INSERT INTO `t_region` VALUES ('834', '泰顺县', '83');
INSERT INTO `t_region` VALUES ('835', '瑞安市', '83');
INSERT INTO `t_region` VALUES ('836', '乐清市', '83');
INSERT INTO `t_region` VALUES ('837', '莲都区', '84');
INSERT INTO `t_region` VALUES ('838', '青田县', '84');
INSERT INTO `t_region` VALUES ('839', '缙云县', '84');
INSERT INTO `t_region` VALUES ('840', '遂昌县', '84');
INSERT INTO `t_region` VALUES ('841', '松阳县', '84');
INSERT INTO `t_region` VALUES ('842', '云和县', '84');
INSERT INTO `t_region` VALUES ('843', '庆元县', '84');
INSERT INTO `t_region` VALUES ('844', '景宁畲族自治县', '84');
INSERT INTO `t_region` VALUES ('845', '龙泉市', '84');
INSERT INTO `t_region` VALUES ('846', '婺城区', '85');
INSERT INTO `t_region` VALUES ('847', '金东区', '85');
INSERT INTO `t_region` VALUES ('848', '武义县', '85');
INSERT INTO `t_region` VALUES ('849', '浦江县', '85');
INSERT INTO `t_region` VALUES ('850', '磐安县', '85');
INSERT INTO `t_region` VALUES ('851', '兰溪市', '85');
INSERT INTO `t_region` VALUES ('852', '义乌市', '85');
INSERT INTO `t_region` VALUES ('853', '东阳市', '85');
INSERT INTO `t_region` VALUES ('854', '永康市', '85');
INSERT INTO `t_region` VALUES ('855', '椒江区', '86');
INSERT INTO `t_region` VALUES ('856', '黄岩区', '86');
INSERT INTO `t_region` VALUES ('857', '路桥区', '86');
INSERT INTO `t_region` VALUES ('858', '玉环县', '86');
INSERT INTO `t_region` VALUES ('859', '三门县', '86');
INSERT INTO `t_region` VALUES ('860', '天台县', '86');
INSERT INTO `t_region` VALUES ('861', '仙居县', '86');
INSERT INTO `t_region` VALUES ('862', '温岭市', '86');
INSERT INTO `t_region` VALUES ('863', '临海市', '86');
INSERT INTO `t_region` VALUES ('864', '瑶海区', '87');
INSERT INTO `t_region` VALUES ('865', '庐阳区', '87');
INSERT INTO `t_region` VALUES ('866', '蜀山区', '87');
INSERT INTO `t_region` VALUES ('867', '包河区', '87');
INSERT INTO `t_region` VALUES ('868', '长丰县', '87');
INSERT INTO `t_region` VALUES ('869', '肥东县', '87');
INSERT INTO `t_region` VALUES ('870', '肥西县', '87');
INSERT INTO `t_region` VALUES ('871', '镜湖区', '88');
INSERT INTO `t_region` VALUES ('872', '弋江区', '88');
INSERT INTO `t_region` VALUES ('873', '鸠江区', '88');
INSERT INTO `t_region` VALUES ('874', '三山区', '88');
INSERT INTO `t_region` VALUES ('875', '芜湖县', '88');
INSERT INTO `t_region` VALUES ('876', '繁昌县', '88');
INSERT INTO `t_region` VALUES ('877', '南陵县', '88');
INSERT INTO `t_region` VALUES ('878', '龙子湖区', '89');
INSERT INTO `t_region` VALUES ('879', '蚌山区', '89');
INSERT INTO `t_region` VALUES ('880', '禹会区', '89');
INSERT INTO `t_region` VALUES ('881', '淮上区', '89');
INSERT INTO `t_region` VALUES ('882', '怀远县', '89');
INSERT INTO `t_region` VALUES ('883', '五河县', '89');
INSERT INTO `t_region` VALUES ('884', '固镇县', '89');
INSERT INTO `t_region` VALUES ('885', '大通区', '90');
INSERT INTO `t_region` VALUES ('886', '田家庵区', '90');
INSERT INTO `t_region` VALUES ('887', '谢家集区', '90');
INSERT INTO `t_region` VALUES ('888', '八公山区', '90');
INSERT INTO `t_region` VALUES ('889', '潘集区', '90');
INSERT INTO `t_region` VALUES ('890', '凤台县', '90');
INSERT INTO `t_region` VALUES ('891', '金家庄区', '91');
INSERT INTO `t_region` VALUES ('892', '花山区', '91');
INSERT INTO `t_region` VALUES ('893', '雨山区', '91');
INSERT INTO `t_region` VALUES ('894', '当涂县', '91');
INSERT INTO `t_region` VALUES ('895', '杜集区', '92');
INSERT INTO `t_region` VALUES ('896', '相山区', '92');
INSERT INTO `t_region` VALUES ('897', '烈山区', '92');
INSERT INTO `t_region` VALUES ('898', '濉溪县 ', '92');
INSERT INTO `t_region` VALUES ('899', '铜官山区', '93');
INSERT INTO `t_region` VALUES ('900', '狮子山区', '93');
INSERT INTO `t_region` VALUES ('901', '铜陵县', '93');
INSERT INTO `t_region` VALUES ('902', '迎江区', '94');
INSERT INTO `t_region` VALUES ('903', '大观区', '94');
INSERT INTO `t_region` VALUES ('904', '宜秀区', '94');
INSERT INTO `t_region` VALUES ('905', '怀宁县', '94');
INSERT INTO `t_region` VALUES ('906', '枞阳县', '94');
INSERT INTO `t_region` VALUES ('907', '潜山县', '94');
INSERT INTO `t_region` VALUES ('908', '太湖县', '94');
INSERT INTO `t_region` VALUES ('909', '宿松县', '94');
INSERT INTO `t_region` VALUES ('910', '望江县', '94');
INSERT INTO `t_region` VALUES ('911', '岳西县', '94');
INSERT INTO `t_region` VALUES ('912', '桐城市', '94');
INSERT INTO `t_region` VALUES ('913', '屯溪区', '95');
INSERT INTO `t_region` VALUES ('914', '黄山区', '95');
INSERT INTO `t_region` VALUES ('915', '徽州区', '95');
INSERT INTO `t_region` VALUES ('916', '歙县', '95');
INSERT INTO `t_region` VALUES ('917', '休宁县', '95');
INSERT INTO `t_region` VALUES ('918', '黟县', '95');
INSERT INTO `t_region` VALUES ('919', '祁门县', '95');
INSERT INTO `t_region` VALUES ('920', '琅琊区', '96');
INSERT INTO `t_region` VALUES ('921', '南谯区', '96');
INSERT INTO `t_region` VALUES ('922', '来安县', '96');
INSERT INTO `t_region` VALUES ('923', '全椒县', '96');
INSERT INTO `t_region` VALUES ('924', '定远县', '96');
INSERT INTO `t_region` VALUES ('925', '凤阳县', '96');
INSERT INTO `t_region` VALUES ('926', '天长市', '96');
INSERT INTO `t_region` VALUES ('927', '明光市', '96');
INSERT INTO `t_region` VALUES ('928', '颍州区', '97');
INSERT INTO `t_region` VALUES ('929', '颍东区', '97');
INSERT INTO `t_region` VALUES ('930', '颍泉区', '97');
INSERT INTO `t_region` VALUES ('931', '临泉县', '97');
INSERT INTO `t_region` VALUES ('932', '太和县', '97');
INSERT INTO `t_region` VALUES ('933', '阜南县', '97');
INSERT INTO `t_region` VALUES ('934', '颍上县', '97');
INSERT INTO `t_region` VALUES ('935', '界首市', '97');
INSERT INTO `t_region` VALUES ('936', '埇桥区', '98');
INSERT INTO `t_region` VALUES ('937', '砀山县', '98');
INSERT INTO `t_region` VALUES ('938', '萧县', '98');
INSERT INTO `t_region` VALUES ('939', '灵璧县', '98');
INSERT INTO `t_region` VALUES ('940', '泗县 ', '98');
INSERT INTO `t_region` VALUES ('941', '居巢区', '99');
INSERT INTO `t_region` VALUES ('942', '庐江县', '99');
INSERT INTO `t_region` VALUES ('943', '无为县', '99');
INSERT INTO `t_region` VALUES ('944', '含山县', '99');
INSERT INTO `t_region` VALUES ('945', '和县 ', '99');
INSERT INTO `t_region` VALUES ('946', '金安区', '100');
INSERT INTO `t_region` VALUES ('947', '裕安区', '100');
INSERT INTO `t_region` VALUES ('948', '寿县', '100');
INSERT INTO `t_region` VALUES ('949', '霍邱县', '100');
INSERT INTO `t_region` VALUES ('950', '舒城县', '100');
INSERT INTO `t_region` VALUES ('951', '金寨县', '100');
INSERT INTO `t_region` VALUES ('952', '霍山县', '100');
INSERT INTO `t_region` VALUES ('953', '谯城区', '101');
INSERT INTO `t_region` VALUES ('954', '涡阳县', '101');
INSERT INTO `t_region` VALUES ('955', '蒙城县', '101');
INSERT INTO `t_region` VALUES ('956', '利辛县', '101');
INSERT INTO `t_region` VALUES ('957', '贵池区', '102');
INSERT INTO `t_region` VALUES ('958', '东至县', '102');
INSERT INTO `t_region` VALUES ('959', '石台县', '102');
INSERT INTO `t_region` VALUES ('960', '青阳县', '102');
INSERT INTO `t_region` VALUES ('961', '宣州区', '103');
INSERT INTO `t_region` VALUES ('962', '郎溪县', '103');
INSERT INTO `t_region` VALUES ('963', '广德县', '103');
INSERT INTO `t_region` VALUES ('964', '泾县', '103');
INSERT INTO `t_region` VALUES ('965', '绩溪县', '103');
INSERT INTO `t_region` VALUES ('966', '旌德县', '103');
INSERT INTO `t_region` VALUES ('967', '宁国市', '103');
INSERT INTO `t_region` VALUES ('968', '鼓楼区', '104');
INSERT INTO `t_region` VALUES ('969', '台江区', '104');
INSERT INTO `t_region` VALUES ('970', '仓山区', '104');
INSERT INTO `t_region` VALUES ('971', '马尾区', '104');
INSERT INTO `t_region` VALUES ('972', '晋安区', '104');
INSERT INTO `t_region` VALUES ('973', '闽侯县', '104');
INSERT INTO `t_region` VALUES ('974', '连江县', '104');
INSERT INTO `t_region` VALUES ('975', '罗源县', '104');
INSERT INTO `t_region` VALUES ('976', '闽清县', '104');
INSERT INTO `t_region` VALUES ('977', '永泰县', '104');
INSERT INTO `t_region` VALUES ('978', '平潭县', '104');
INSERT INTO `t_region` VALUES ('979', '福清市', '104');
INSERT INTO `t_region` VALUES ('980', '长乐市', '104');
INSERT INTO `t_region` VALUES ('981', '思明区', '105');
INSERT INTO `t_region` VALUES ('982', '海沧区', '105');
INSERT INTO `t_region` VALUES ('983', '湖里区', '105');
INSERT INTO `t_region` VALUES ('984', '集美区', '105');
INSERT INTO `t_region` VALUES ('985', '同安区', '105');
INSERT INTO `t_region` VALUES ('986', '翔安区', '105');
INSERT INTO `t_region` VALUES ('987', '蕉城区', '106');
INSERT INTO `t_region` VALUES ('988', '霞浦县', '106');
INSERT INTO `t_region` VALUES ('989', '古田县', '106');
INSERT INTO `t_region` VALUES ('990', '屏南县', '106');
INSERT INTO `t_region` VALUES ('991', '寿宁县', '106');
INSERT INTO `t_region` VALUES ('992', '周宁县', '106');
INSERT INTO `t_region` VALUES ('993', '柘荣县', '106');
INSERT INTO `t_region` VALUES ('994', '福安市', '106');
INSERT INTO `t_region` VALUES ('995', '福鼎市', '106');
INSERT INTO `t_region` VALUES ('996', '城厢区', '107');
INSERT INTO `t_region` VALUES ('997', '涵江区', '107');
INSERT INTO `t_region` VALUES ('998', '荔城区', '107');
INSERT INTO `t_region` VALUES ('999', '秀屿区', '107');
INSERT INTO `t_region` VALUES ('1000', '仙游县', '107');
INSERT INTO `t_region` VALUES ('1001', '鲤城区', '108');
INSERT INTO `t_region` VALUES ('1002', '丰泽区', '108');
INSERT INTO `t_region` VALUES ('1003', '洛江区', '108');
INSERT INTO `t_region` VALUES ('1004', '泉港区', '108');
INSERT INTO `t_region` VALUES ('1005', '惠安县', '108');
INSERT INTO `t_region` VALUES ('1006', '安溪县', '108');
INSERT INTO `t_region` VALUES ('1007', '永春县', '108');
INSERT INTO `t_region` VALUES ('1008', '德化县', '108');
INSERT INTO `t_region` VALUES ('1009', '石狮市', '108');
INSERT INTO `t_region` VALUES ('1010', '晋江市', '108');
INSERT INTO `t_region` VALUES ('1011', '南安市', '108');
INSERT INTO `t_region` VALUES ('1012', '芗城区', '109');
INSERT INTO `t_region` VALUES ('1013', '龙文区', '109');
INSERT INTO `t_region` VALUES ('1014', '云霄县', '109');
INSERT INTO `t_region` VALUES ('1015', '漳浦县', '109');
INSERT INTO `t_region` VALUES ('1016', '诏安县', '109');
INSERT INTO `t_region` VALUES ('1017', '长泰县', '109');
INSERT INTO `t_region` VALUES ('1018', '东山县', '109');
INSERT INTO `t_region` VALUES ('1019', '南靖县', '109');
INSERT INTO `t_region` VALUES ('1020', '平和县', '109');
INSERT INTO `t_region` VALUES ('1021', '华安县', '109');
INSERT INTO `t_region` VALUES ('1022', '龙海市', '109');
INSERT INTO `t_region` VALUES ('1023', '新罗区', '110');
INSERT INTO `t_region` VALUES ('1024', '长汀县', '110');
INSERT INTO `t_region` VALUES ('1025', '永定县', '110');
INSERT INTO `t_region` VALUES ('1026', '上杭县', '110');
INSERT INTO `t_region` VALUES ('1027', '武平县', '110');
INSERT INTO `t_region` VALUES ('1028', '连城县', '110');
INSERT INTO `t_region` VALUES ('1029', '漳平市', '110');
INSERT INTO `t_region` VALUES ('1030', '梅列区', '111');
INSERT INTO `t_region` VALUES ('1031', '三元区', '111');
INSERT INTO `t_region` VALUES ('1032', '明溪县', '111');
INSERT INTO `t_region` VALUES ('1033', '清流县', '111');
INSERT INTO `t_region` VALUES ('1034', '宁化县', '111');
INSERT INTO `t_region` VALUES ('1035', '大田县', '111');
INSERT INTO `t_region` VALUES ('1036', '尤溪县', '111');
INSERT INTO `t_region` VALUES ('1037', '沙县', '111');
INSERT INTO `t_region` VALUES ('1038', '将乐县', '111');
INSERT INTO `t_region` VALUES ('1039', '泰宁县', '111');
INSERT INTO `t_region` VALUES ('1040', '建宁县', '111');
INSERT INTO `t_region` VALUES ('1041', '永安市', '111');
INSERT INTO `t_region` VALUES ('1042', '延平区', '112');
INSERT INTO `t_region` VALUES ('1043', '顺昌县', '112');
INSERT INTO `t_region` VALUES ('1044', '浦城县', '112');
INSERT INTO `t_region` VALUES ('1045', '光泽县', '112');
INSERT INTO `t_region` VALUES ('1046', '松溪县', '112');
INSERT INTO `t_region` VALUES ('1047', '政和县', '112');
INSERT INTO `t_region` VALUES ('1048', '邵武市', '112');
INSERT INTO `t_region` VALUES ('1049', '武夷山市', '112');
INSERT INTO `t_region` VALUES ('1050', '建瓯市', '112');
INSERT INTO `t_region` VALUES ('1051', '建阳市', '112');
INSERT INTO `t_region` VALUES ('1052', '月湖区', '113');
INSERT INTO `t_region` VALUES ('1053', '余江县', '113');
INSERT INTO `t_region` VALUES ('1054', '贵溪市', '113');
INSERT INTO `t_region` VALUES ('1055', '渝水区', '114');
INSERT INTO `t_region` VALUES ('1056', '分宜县', '114');
INSERT INTO `t_region` VALUES ('1057', '东湖区', '115');
INSERT INTO `t_region` VALUES ('1058', '西湖区', '115');
INSERT INTO `t_region` VALUES ('1059', '青云谱区', '115');
INSERT INTO `t_region` VALUES ('1060', '湾里区', '115');
INSERT INTO `t_region` VALUES ('1061', '青山湖区', '115');
INSERT INTO `t_region` VALUES ('1062', '南昌县', '115');
INSERT INTO `t_region` VALUES ('1063', '新建县', '115');
INSERT INTO `t_region` VALUES ('1064', '安义县', '115');
INSERT INTO `t_region` VALUES ('1065', '进贤县', '115');
INSERT INTO `t_region` VALUES ('1066', '庐山区', '116');
INSERT INTO `t_region` VALUES ('1067', '浔阳区', '116');
INSERT INTO `t_region` VALUES ('1068', '九江县', '116');
INSERT INTO `t_region` VALUES ('1069', '武宁县', '116');
INSERT INTO `t_region` VALUES ('1070', '修水县', '116');
INSERT INTO `t_region` VALUES ('1071', '永修县', '116');
INSERT INTO `t_region` VALUES ('1072', '德安县', '116');
INSERT INTO `t_region` VALUES ('1073', '星子县', '116');
INSERT INTO `t_region` VALUES ('1074', '都昌县', '116');
INSERT INTO `t_region` VALUES ('1075', '湖口县', '116');
INSERT INTO `t_region` VALUES ('1076', '彭泽县', '116');
INSERT INTO `t_region` VALUES ('1077', '瑞昌市', '116');
INSERT INTO `t_region` VALUES ('1078', '信州区', '117');
INSERT INTO `t_region` VALUES ('1079', '上饶县', '117');
INSERT INTO `t_region` VALUES ('1080', '广丰县', '117');
INSERT INTO `t_region` VALUES ('1081', '玉山县', '117');
INSERT INTO `t_region` VALUES ('1082', '铅山县', '117');
INSERT INTO `t_region` VALUES ('1083', '横峰县', '117');
INSERT INTO `t_region` VALUES ('1084', '弋阳县', '117');
INSERT INTO `t_region` VALUES ('1085', '余干县', '117');
INSERT INTO `t_region` VALUES ('1086', '鄱阳县', '117');
INSERT INTO `t_region` VALUES ('1087', '万年县', '117');
INSERT INTO `t_region` VALUES ('1088', '婺源县', '117');
INSERT INTO `t_region` VALUES ('1089', '德兴市', '117');
INSERT INTO `t_region` VALUES ('1090', '临川区', '118');
INSERT INTO `t_region` VALUES ('1091', '南城县', '118');
INSERT INTO `t_region` VALUES ('1092', '黎川县', '118');
INSERT INTO `t_region` VALUES ('1093', '南丰县', '118');
INSERT INTO `t_region` VALUES ('1094', '崇仁县', '118');
INSERT INTO `t_region` VALUES ('1095', '乐安县', '118');
INSERT INTO `t_region` VALUES ('1096', '宜黄县', '118');
INSERT INTO `t_region` VALUES ('1097', '金溪县', '118');
INSERT INTO `t_region` VALUES ('1098', '资溪县', '118');
INSERT INTO `t_region` VALUES ('1099', '东乡县', '118');
INSERT INTO `t_region` VALUES ('1100', '广昌县', '118');
INSERT INTO `t_region` VALUES ('1101', '袁州区', '119');
INSERT INTO `t_region` VALUES ('1102', '奉新县', '119');
INSERT INTO `t_region` VALUES ('1103', '万载县', '119');
INSERT INTO `t_region` VALUES ('1104', '上高县', '119');
INSERT INTO `t_region` VALUES ('1105', '宜丰县', '119');
INSERT INTO `t_region` VALUES ('1106', '靖安县', '119');
INSERT INTO `t_region` VALUES ('1107', '铜鼓县', '119');
INSERT INTO `t_region` VALUES ('1108', '丰城市', '119');
INSERT INTO `t_region` VALUES ('1109', '樟树市', '119');
INSERT INTO `t_region` VALUES ('1110', '高安市', '119');
INSERT INTO `t_region` VALUES ('1111', '吉州区', '120');
INSERT INTO `t_region` VALUES ('1112', '青原区', '120');
INSERT INTO `t_region` VALUES ('1113', '吉安县', '120');
INSERT INTO `t_region` VALUES ('1114', '吉水县', '120');
INSERT INTO `t_region` VALUES ('1115', '峡江县', '120');
INSERT INTO `t_region` VALUES ('1116', '新干县', '120');
INSERT INTO `t_region` VALUES ('1117', '永丰县', '120');
INSERT INTO `t_region` VALUES ('1118', '泰和县', '120');
INSERT INTO `t_region` VALUES ('1119', '遂川县', '120');
INSERT INTO `t_region` VALUES ('1120', '万安县', '120');
INSERT INTO `t_region` VALUES ('1121', '安福县', '120');
INSERT INTO `t_region` VALUES ('1122', '永新县', '120');
INSERT INTO `t_region` VALUES ('1123', '井冈山市', '120');
INSERT INTO `t_region` VALUES ('1124', '章贡区', '121');
INSERT INTO `t_region` VALUES ('1125', '赣县', '121');
INSERT INTO `t_region` VALUES ('1126', '信丰县', '121');
INSERT INTO `t_region` VALUES ('1127', '大余县', '121');
INSERT INTO `t_region` VALUES ('1128', '上犹县', '121');
INSERT INTO `t_region` VALUES ('1129', '崇义县', '121');
INSERT INTO `t_region` VALUES ('1130', '安远县', '121');
INSERT INTO `t_region` VALUES ('1131', '龙南县', '121');
INSERT INTO `t_region` VALUES ('1132', '定南县', '121');
INSERT INTO `t_region` VALUES ('1133', '全南县', '121');
INSERT INTO `t_region` VALUES ('1134', '宁都县', '121');
INSERT INTO `t_region` VALUES ('1135', '于都县', '121');
INSERT INTO `t_region` VALUES ('1136', '兴国县', '121');
INSERT INTO `t_region` VALUES ('1137', '会昌县', '121');
INSERT INTO `t_region` VALUES ('1138', '寻乌县', '121');
INSERT INTO `t_region` VALUES ('1139', '石城县', '121');
INSERT INTO `t_region` VALUES ('1140', '瑞金市', '121');
INSERT INTO `t_region` VALUES ('1141', '南康市', '121');
INSERT INTO `t_region` VALUES ('1142', '昌江区', '122');
INSERT INTO `t_region` VALUES ('1143', '珠山区', '122');
INSERT INTO `t_region` VALUES ('1144', '浮梁县', '122');
INSERT INTO `t_region` VALUES ('1145', '乐平市', '122');
INSERT INTO `t_region` VALUES ('1146', '安源区', '123');
INSERT INTO `t_region` VALUES ('1147', '湘东区', '123');
INSERT INTO `t_region` VALUES ('1148', '莲花县', '123');
INSERT INTO `t_region` VALUES ('1149', '上栗县', '123');
INSERT INTO `t_region` VALUES ('1150', '芦溪县', '123');
INSERT INTO `t_region` VALUES ('1151', '牡丹区', '124');
INSERT INTO `t_region` VALUES ('1152', '曹县', '124');
INSERT INTO `t_region` VALUES ('1153', '单县', '124');
INSERT INTO `t_region` VALUES ('1154', '成武县', '124');
INSERT INTO `t_region` VALUES ('1155', '巨野县', '124');
INSERT INTO `t_region` VALUES ('1156', '郓城县', '124');
INSERT INTO `t_region` VALUES ('1157', '鄄城县', '124');
INSERT INTO `t_region` VALUES ('1158', '定陶县', '124');
INSERT INTO `t_region` VALUES ('1159', '东明县', '124');
INSERT INTO `t_region` VALUES ('1160', '历下区', '125');
INSERT INTO `t_region` VALUES ('1161', '市中区', '125');
INSERT INTO `t_region` VALUES ('1162', '槐荫区', '125');
INSERT INTO `t_region` VALUES ('1163', '天桥区', '125');
INSERT INTO `t_region` VALUES ('1164', '历城区', '125');
INSERT INTO `t_region` VALUES ('1165', '长清区', '125');
INSERT INTO `t_region` VALUES ('1166', '平阴县', '125');
INSERT INTO `t_region` VALUES ('1167', '济阳县', '125');
INSERT INTO `t_region` VALUES ('1168', '商河县', '125');
INSERT INTO `t_region` VALUES ('1169', '章丘市', '125');
INSERT INTO `t_region` VALUES ('1170', '市南区', '126');
INSERT INTO `t_region` VALUES ('1171', '市北区', '126');
INSERT INTO `t_region` VALUES ('1172', '四方区', '126');
INSERT INTO `t_region` VALUES ('1173', '黄岛区', '126');
INSERT INTO `t_region` VALUES ('1174', '崂山区', '126');
INSERT INTO `t_region` VALUES ('1175', '李沧区', '126');
INSERT INTO `t_region` VALUES ('1176', '城阳区', '126');
INSERT INTO `t_region` VALUES ('1177', '胶州市', '126');
INSERT INTO `t_region` VALUES ('1178', '即墨市', '126');
INSERT INTO `t_region` VALUES ('1179', '平度市', '126');
INSERT INTO `t_region` VALUES ('1180', '胶南市', '126');
INSERT INTO `t_region` VALUES ('1181', '莱西市', '126');
INSERT INTO `t_region` VALUES ('1182', '淄川区', '127');
INSERT INTO `t_region` VALUES ('1183', '张店区', '127');
INSERT INTO `t_region` VALUES ('1184', '博山区', '127');
INSERT INTO `t_region` VALUES ('1185', '临淄区', '127');
INSERT INTO `t_region` VALUES ('1186', '周村区', '127');
INSERT INTO `t_region` VALUES ('1187', '桓台县', '127');
INSERT INTO `t_region` VALUES ('1188', '高青县', '127');
INSERT INTO `t_region` VALUES ('1189', '沂源县', '127');
INSERT INTO `t_region` VALUES ('1190', '德城区', '128');
INSERT INTO `t_region` VALUES ('1191', '陵县', '128');
INSERT INTO `t_region` VALUES ('1192', '宁津县', '128');
INSERT INTO `t_region` VALUES ('1193', '庆云县', '128');
INSERT INTO `t_region` VALUES ('1194', '临邑县', '128');
INSERT INTO `t_region` VALUES ('1195', '齐河县', '128');
INSERT INTO `t_region` VALUES ('1196', '平原县', '128');
INSERT INTO `t_region` VALUES ('1197', '夏津县', '128');
INSERT INTO `t_region` VALUES ('1198', '武城县', '128');
INSERT INTO `t_region` VALUES ('1199', '乐陵市', '128');
INSERT INTO `t_region` VALUES ('1200', '禹城市', '128');
INSERT INTO `t_region` VALUES ('1201', '芝罘区', '129');
INSERT INTO `t_region` VALUES ('1202', '福山区', '129');
INSERT INTO `t_region` VALUES ('1203', '牟平区', '129');
INSERT INTO `t_region` VALUES ('1204', '莱山区', '129');
INSERT INTO `t_region` VALUES ('1205', '长岛县', '129');
INSERT INTO `t_region` VALUES ('1206', '龙口市', '129');
INSERT INTO `t_region` VALUES ('1207', '莱阳市', '129');
INSERT INTO `t_region` VALUES ('1208', '莱州市', '129');
INSERT INTO `t_region` VALUES ('1209', '蓬莱市', '129');
INSERT INTO `t_region` VALUES ('1210', '招远市', '129');
INSERT INTO `t_region` VALUES ('1211', '栖霞市', '129');
INSERT INTO `t_region` VALUES ('1212', '海阳市', '129');
INSERT INTO `t_region` VALUES ('1213', '潍城区', '130');
INSERT INTO `t_region` VALUES ('1214', '寒亭区', '130');
INSERT INTO `t_region` VALUES ('1215', '坊子区', '130');
INSERT INTO `t_region` VALUES ('1216', '奎文区', '130');
INSERT INTO `t_region` VALUES ('1217', '临朐县', '130');
INSERT INTO `t_region` VALUES ('1218', '昌乐县', '130');
INSERT INTO `t_region` VALUES ('1219', '青州市', '130');
INSERT INTO `t_region` VALUES ('1220', '诸城市', '130');
INSERT INTO `t_region` VALUES ('1221', '寿光市', '130');
INSERT INTO `t_region` VALUES ('1222', '安丘市', '130');
INSERT INTO `t_region` VALUES ('1223', '高密市', '130');
INSERT INTO `t_region` VALUES ('1224', '昌邑市', '130');
INSERT INTO `t_region` VALUES ('1225', '市中区', '131');
INSERT INTO `t_region` VALUES ('1226', '任城区', '131');
INSERT INTO `t_region` VALUES ('1227', '微山县', '131');
INSERT INTO `t_region` VALUES ('1228', '鱼台县', '131');
INSERT INTO `t_region` VALUES ('1229', '金乡县', '131');
INSERT INTO `t_region` VALUES ('1230', '嘉祥县', '131');
INSERT INTO `t_region` VALUES ('1231', '汶上县', '131');
INSERT INTO `t_region` VALUES ('1232', '泗水县', '131');
INSERT INTO `t_region` VALUES ('1233', '梁山县', '131');
INSERT INTO `t_region` VALUES ('1234', '曲阜市', '131');
INSERT INTO `t_region` VALUES ('1235', '兖州市', '131');
INSERT INTO `t_region` VALUES ('1236', '邹城市', '131');
INSERT INTO `t_region` VALUES ('1237', '泰山区', '132');
INSERT INTO `t_region` VALUES ('1238', '岱岳区', '132');
INSERT INTO `t_region` VALUES ('1239', '宁阳县', '132');
INSERT INTO `t_region` VALUES ('1240', '东平县', '132');
INSERT INTO `t_region` VALUES ('1241', '新泰市', '132');
INSERT INTO `t_region` VALUES ('1242', '肥城市', '132');
INSERT INTO `t_region` VALUES ('1243', '兰山区', '133');
INSERT INTO `t_region` VALUES ('1244', '罗庄区', '133');
INSERT INTO `t_region` VALUES ('1245', '河东区', '133');
INSERT INTO `t_region` VALUES ('1246', '沂南县', '133');
INSERT INTO `t_region` VALUES ('1247', '郯城县', '133');
INSERT INTO `t_region` VALUES ('1248', '沂水县', '133');
INSERT INTO `t_region` VALUES ('1249', '苍山县', '133');
INSERT INTO `t_region` VALUES ('1250', '费县', '133');
INSERT INTO `t_region` VALUES ('1251', '平邑县', '133');
INSERT INTO `t_region` VALUES ('1252', '莒南县', '133');
INSERT INTO `t_region` VALUES ('1253', '蒙阴县', '133');
INSERT INTO `t_region` VALUES ('1254', '临沭县', '133');
INSERT INTO `t_region` VALUES ('1255', '滨城区', '134');
INSERT INTO `t_region` VALUES ('1256', '惠民县', '134');
INSERT INTO `t_region` VALUES ('1257', '阳信县', '134');
INSERT INTO `t_region` VALUES ('1258', '无棣县', '134');
INSERT INTO `t_region` VALUES ('1259', '沾化县', '134');
INSERT INTO `t_region` VALUES ('1260', '博兴县', '134');
INSERT INTO `t_region` VALUES ('1261', '邹平县', '134');
INSERT INTO `t_region` VALUES ('1262', '东营区', '135');
INSERT INTO `t_region` VALUES ('1263', '河口区', '135');
INSERT INTO `t_region` VALUES ('1264', '垦利县', '135');
INSERT INTO `t_region` VALUES ('1265', '利津县', '135');
INSERT INTO `t_region` VALUES ('1266', '广饶县', '135');
INSERT INTO `t_region` VALUES ('1267', '环翠区', '136');
INSERT INTO `t_region` VALUES ('1268', '文登市', '136');
INSERT INTO `t_region` VALUES ('1269', '荣成市', '136');
INSERT INTO `t_region` VALUES ('1270', '乳山市', '136');
INSERT INTO `t_region` VALUES ('1271', '市中区', '137');
INSERT INTO `t_region` VALUES ('1272', '薛城区', '137');
INSERT INTO `t_region` VALUES ('1273', '峄城区', '137');
INSERT INTO `t_region` VALUES ('1274', '台儿庄区', '137');
INSERT INTO `t_region` VALUES ('1275', '山亭区', '137');
INSERT INTO `t_region` VALUES ('1276', '滕州市', '137');
INSERT INTO `t_region` VALUES ('1277', '东港区', '138');
INSERT INTO `t_region` VALUES ('1278', '岚山区', '138');
INSERT INTO `t_region` VALUES ('1279', '五莲县', '138');
INSERT INTO `t_region` VALUES ('1280', '莒县', '138');
INSERT INTO `t_region` VALUES ('1281', '莱城区', '139');
INSERT INTO `t_region` VALUES ('1282', '钢城区', '139');
INSERT INTO `t_region` VALUES ('1283', '东昌府区', '140');
INSERT INTO `t_region` VALUES ('1284', '阳谷县', '140');
INSERT INTO `t_region` VALUES ('1285', '莘县', '140');
INSERT INTO `t_region` VALUES ('1286', '茌平县', '140');
INSERT INTO `t_region` VALUES ('1287', '东阿县', '140');
INSERT INTO `t_region` VALUES ('1288', '冠县', '140');
INSERT INTO `t_region` VALUES ('1289', '高唐县', '140');
INSERT INTO `t_region` VALUES ('1290', '临清市', '140');
INSERT INTO `t_region` VALUES ('1291', '梁园区', '141');
INSERT INTO `t_region` VALUES ('1292', '睢阳区', '141');
INSERT INTO `t_region` VALUES ('1293', '民权县', '141');
INSERT INTO `t_region` VALUES ('1294', '睢县', '141');
INSERT INTO `t_region` VALUES ('1295', '宁陵县', '141');
INSERT INTO `t_region` VALUES ('1296', '柘城县', '141');
INSERT INTO `t_region` VALUES ('1297', '虞城县', '141');
INSERT INTO `t_region` VALUES ('1298', '夏邑县', '141');
INSERT INTO `t_region` VALUES ('1299', '永城市', '141');
INSERT INTO `t_region` VALUES ('1300', '中原区', '142');
INSERT INTO `t_region` VALUES ('1301', '二七区', '142');
INSERT INTO `t_region` VALUES ('1302', '管城回族区', '142');
INSERT INTO `t_region` VALUES ('1303', '金水区', '142');
INSERT INTO `t_region` VALUES ('1304', '上街区', '142');
INSERT INTO `t_region` VALUES ('1305', '惠济区', '142');
INSERT INTO `t_region` VALUES ('1306', '中牟县', '142');
INSERT INTO `t_region` VALUES ('1307', '巩义市', '142');
INSERT INTO `t_region` VALUES ('1308', '荥阳市', '142');
INSERT INTO `t_region` VALUES ('1309', '新密市', '142');
INSERT INTO `t_region` VALUES ('1310', '新郑市', '142');
INSERT INTO `t_region` VALUES ('1311', '登封市', '142');
INSERT INTO `t_region` VALUES ('1312', '文峰区', '143');
INSERT INTO `t_region` VALUES ('1313', '北关区', '143');
INSERT INTO `t_region` VALUES ('1314', '殷都区', '143');
INSERT INTO `t_region` VALUES ('1315', '龙安区', '143');
INSERT INTO `t_region` VALUES ('1316', '安阳县', '143');
INSERT INTO `t_region` VALUES ('1317', '汤阴县', '143');
INSERT INTO `t_region` VALUES ('1318', '滑县', '143');
INSERT INTO `t_region` VALUES ('1319', '内黄县', '143');
INSERT INTO `t_region` VALUES ('1320', '林州市', '143');
INSERT INTO `t_region` VALUES ('1321', '红旗区', '144');
INSERT INTO `t_region` VALUES ('1322', '卫滨区', '144');
INSERT INTO `t_region` VALUES ('1323', '凤泉区', '144');
INSERT INTO `t_region` VALUES ('1324', '牧野区', '144');
INSERT INTO `t_region` VALUES ('1325', '新乡县', '144');
INSERT INTO `t_region` VALUES ('1326', '获嘉县', '144');
INSERT INTO `t_region` VALUES ('1327', '原阳县', '144');
INSERT INTO `t_region` VALUES ('1328', '延津县', '144');
INSERT INTO `t_region` VALUES ('1329', '封丘县', '144');
INSERT INTO `t_region` VALUES ('1330', '长垣县', '144');
INSERT INTO `t_region` VALUES ('1331', '卫辉市', '144');
INSERT INTO `t_region` VALUES ('1332', '辉县市', '144');
INSERT INTO `t_region` VALUES ('1333', '魏都区', '145');
INSERT INTO `t_region` VALUES ('1334', '许昌县', '145');
INSERT INTO `t_region` VALUES ('1335', '鄢陵县', '145');
INSERT INTO `t_region` VALUES ('1336', '襄城县', '145');
INSERT INTO `t_region` VALUES ('1337', '禹州市', '145');
INSERT INTO `t_region` VALUES ('1338', '长葛市', '145');
INSERT INTO `t_region` VALUES ('1339', '新华区', '146');
INSERT INTO `t_region` VALUES ('1340', '卫东区', '146');
INSERT INTO `t_region` VALUES ('1341', '石龙区', '146');
INSERT INTO `t_region` VALUES ('1342', '湛河区', '146');
INSERT INTO `t_region` VALUES ('1343', '宝丰县', '146');
INSERT INTO `t_region` VALUES ('1344', '叶县', '146');
INSERT INTO `t_region` VALUES ('1345', '鲁山县', '146');
INSERT INTO `t_region` VALUES ('1346', '郏县', '146');
INSERT INTO `t_region` VALUES ('1347', '舞钢市', '146');
INSERT INTO `t_region` VALUES ('1348', '汝州市', '146');
INSERT INTO `t_region` VALUES ('1349', '浉河区', '147');
INSERT INTO `t_region` VALUES ('1350', '平桥区', '147');
INSERT INTO `t_region` VALUES ('1351', '罗山县', '147');
INSERT INTO `t_region` VALUES ('1352', '光山县', '147');
INSERT INTO `t_region` VALUES ('1353', '新县', '147');
INSERT INTO `t_region` VALUES ('1354', '商城县', '147');
INSERT INTO `t_region` VALUES ('1355', '固始县', '147');
INSERT INTO `t_region` VALUES ('1356', '潢川县', '147');
INSERT INTO `t_region` VALUES ('1357', '淮滨县', '147');
INSERT INTO `t_region` VALUES ('1358', '息县', '147');
INSERT INTO `t_region` VALUES ('1359', '宛城区', '148');
INSERT INTO `t_region` VALUES ('1360', '卧龙区', '148');
INSERT INTO `t_region` VALUES ('1361', '南召县', '148');
INSERT INTO `t_region` VALUES ('1362', '方城县', '148');
INSERT INTO `t_region` VALUES ('1363', '西峡县', '148');
INSERT INTO `t_region` VALUES ('1364', '镇平县', '148');
INSERT INTO `t_region` VALUES ('1365', '内乡县', '148');
INSERT INTO `t_region` VALUES ('1366', '淅川县', '148');
INSERT INTO `t_region` VALUES ('1367', '社旗县', '148');
INSERT INTO `t_region` VALUES ('1368', '唐河县', '148');
INSERT INTO `t_region` VALUES ('1369', '新野县', '148');
INSERT INTO `t_region` VALUES ('1370', '桐柏县', '148');
INSERT INTO `t_region` VALUES ('1371', '邓州市', '148');
INSERT INTO `t_region` VALUES ('1372', '龙亭区', '149');
INSERT INTO `t_region` VALUES ('1373', '顺河回族区', '149');
INSERT INTO `t_region` VALUES ('1374', '鼓楼区', '149');
INSERT INTO `t_region` VALUES ('1375', '禹王台区', '149');
INSERT INTO `t_region` VALUES ('1376', '金明区', '149');
INSERT INTO `t_region` VALUES ('1377', '杞县', '149');
INSERT INTO `t_region` VALUES ('1378', '通许县', '149');
INSERT INTO `t_region` VALUES ('1379', '尉氏县', '149');
INSERT INTO `t_region` VALUES ('1380', '开封县', '149');
INSERT INTO `t_region` VALUES ('1381', '兰考县', '149');
INSERT INTO `t_region` VALUES ('1382', '老城区', '150');
INSERT INTO `t_region` VALUES ('1383', '西工区', '150');
INSERT INTO `t_region` VALUES ('1384', '瀍河回族区', '150');
INSERT INTO `t_region` VALUES ('1385', '涧西区', '150');
INSERT INTO `t_region` VALUES ('1386', '吉利区', '150');
INSERT INTO `t_region` VALUES ('1387', '洛龙区', '150');
INSERT INTO `t_region` VALUES ('1388', '孟津县', '150');
INSERT INTO `t_region` VALUES ('1389', '新安县', '150');
INSERT INTO `t_region` VALUES ('1390', '栾川县', '150');
INSERT INTO `t_region` VALUES ('1391', '嵩县', '150');
INSERT INTO `t_region` VALUES ('1392', '汝阳县', '150');
INSERT INTO `t_region` VALUES ('1393', '宜阳县', '150');
INSERT INTO `t_region` VALUES ('1394', '洛宁县', '150');
INSERT INTO `t_region` VALUES ('1395', '伊川县', '150');
INSERT INTO `t_region` VALUES ('1396', '偃师市', '150');
INSERT INTO `t_region` VALUES ('1397', '解放区', '152');
INSERT INTO `t_region` VALUES ('1398', '中站区', '152');
INSERT INTO `t_region` VALUES ('1399', '马村区', '152');
INSERT INTO `t_region` VALUES ('1400', '山阳区', '152');
INSERT INTO `t_region` VALUES ('1401', '修武县', '152');
INSERT INTO `t_region` VALUES ('1402', '博爱县', '152');
INSERT INTO `t_region` VALUES ('1403', '武陟县', '152');
INSERT INTO `t_region` VALUES ('1404', '温县', '152');
INSERT INTO `t_region` VALUES ('1405', '沁阳市', '152');
INSERT INTO `t_region` VALUES ('1406', '孟州市', '152');
INSERT INTO `t_region` VALUES ('1407', '鹤山区', '153');
INSERT INTO `t_region` VALUES ('1408', '山城区', '153');
INSERT INTO `t_region` VALUES ('1409', '淇滨区', '153');
INSERT INTO `t_region` VALUES ('1410', '浚县', '153');
INSERT INTO `t_region` VALUES ('1411', '淇县', '153');
INSERT INTO `t_region` VALUES ('1412', '华龙区', '154');
INSERT INTO `t_region` VALUES ('1413', '清丰县', '154');
INSERT INTO `t_region` VALUES ('1414', '南乐县', '154');
INSERT INTO `t_region` VALUES ('1415', '范县', '154');
INSERT INTO `t_region` VALUES ('1416', '台前县', '154');
INSERT INTO `t_region` VALUES ('1417', '濮阳县', '154');
INSERT INTO `t_region` VALUES ('1418', '川汇区', '155');
INSERT INTO `t_region` VALUES ('1419', '扶沟县', '155');
INSERT INTO `t_region` VALUES ('1420', '西华县', '155');
INSERT INTO `t_region` VALUES ('1421', '商水县', '155');
INSERT INTO `t_region` VALUES ('1422', '沈丘县', '155');
INSERT INTO `t_region` VALUES ('1423', '郸城县', '155');
INSERT INTO `t_region` VALUES ('1424', '淮阳县', '155');
INSERT INTO `t_region` VALUES ('1425', '太康县', '155');
INSERT INTO `t_region` VALUES ('1426', '鹿邑县', '155');
INSERT INTO `t_region` VALUES ('1427', '项城市', '155');
INSERT INTO `t_region` VALUES ('1428', '源汇区', '156');
INSERT INTO `t_region` VALUES ('1429', '郾城区', '156');
INSERT INTO `t_region` VALUES ('1430', '召陵区', '156');
INSERT INTO `t_region` VALUES ('1431', '舞阳县', '156');
INSERT INTO `t_region` VALUES ('1432', '临颍县', '156');
INSERT INTO `t_region` VALUES ('1433', '驿城区', '157');
INSERT INTO `t_region` VALUES ('1434', '西平县', '157');
INSERT INTO `t_region` VALUES ('1435', '上蔡县', '157');
INSERT INTO `t_region` VALUES ('1436', '平舆县', '157');
INSERT INTO `t_region` VALUES ('1437', '正阳县', '157');
INSERT INTO `t_region` VALUES ('1438', '确山县', '157');
INSERT INTO `t_region` VALUES ('1439', '泌阳县', '157');
INSERT INTO `t_region` VALUES ('1440', '汝南县', '157');
INSERT INTO `t_region` VALUES ('1441', '遂平县', '157');
INSERT INTO `t_region` VALUES ('1442', '新蔡县', '157');
INSERT INTO `t_region` VALUES ('1443', '湖滨区', '158');
INSERT INTO `t_region` VALUES ('1444', '渑池县', '158');
INSERT INTO `t_region` VALUES ('1445', '陕县', '158');
INSERT INTO `t_region` VALUES ('1446', '卢氏县', '158');
INSERT INTO `t_region` VALUES ('1447', '义马市', '158');
INSERT INTO `t_region` VALUES ('1448', '灵宝市', '158');
INSERT INTO `t_region` VALUES ('1449', '江岸区', '159');
INSERT INTO `t_region` VALUES ('1450', '江汉区', '159');
INSERT INTO `t_region` VALUES ('1451', '硚口区', '159');
INSERT INTO `t_region` VALUES ('1452', '汉阳区', '159');
INSERT INTO `t_region` VALUES ('1453', '武昌区', '159');
INSERT INTO `t_region` VALUES ('1454', '青山区', '159');
INSERT INTO `t_region` VALUES ('1455', '洪山区', '159');
INSERT INTO `t_region` VALUES ('1456', '东西湖区', '159');
INSERT INTO `t_region` VALUES ('1457', '汉南区', '159');
INSERT INTO `t_region` VALUES ('1458', '蔡甸区', '159');
INSERT INTO `t_region` VALUES ('1459', '江夏区', '159');
INSERT INTO `t_region` VALUES ('1460', '黄陂区', '159');
INSERT INTO `t_region` VALUES ('1461', '新洲区', '159');
INSERT INTO `t_region` VALUES ('1462', '襄城区', '160');
INSERT INTO `t_region` VALUES ('1463', '樊城区', '160');
INSERT INTO `t_region` VALUES ('1464', '襄阳区', '160');
INSERT INTO `t_region` VALUES ('1465', '南漳县', '160');
INSERT INTO `t_region` VALUES ('1466', '谷城县', '160');
INSERT INTO `t_region` VALUES ('1467', '保康县', '160');
INSERT INTO `t_region` VALUES ('1468', '老河口市', '160');
INSERT INTO `t_region` VALUES ('1469', '枣阳市', '160');
INSERT INTO `t_region` VALUES ('1470', '宜城市', '160');
INSERT INTO `t_region` VALUES ('1471', '梁子湖区', '161');
INSERT INTO `t_region` VALUES ('1472', '华容区', '161');
INSERT INTO `t_region` VALUES ('1473', '鄂城区', '161');
INSERT INTO `t_region` VALUES ('1474', '孝南区', '162');
INSERT INTO `t_region` VALUES ('1475', '孝昌县', '162');
INSERT INTO `t_region` VALUES ('1476', '大悟县', '162');
INSERT INTO `t_region` VALUES ('1477', '云梦县', '162');
INSERT INTO `t_region` VALUES ('1478', '应城市', '162');
INSERT INTO `t_region` VALUES ('1479', '安陆市', '162');
INSERT INTO `t_region` VALUES ('1480', '汉川市', '162');
INSERT INTO `t_region` VALUES ('1481', '黄州区', '163');
INSERT INTO `t_region` VALUES ('1482', '团风县', '163');
INSERT INTO `t_region` VALUES ('1483', '红安县', '163');
INSERT INTO `t_region` VALUES ('1484', '罗田县', '163');
INSERT INTO `t_region` VALUES ('1485', '英山县', '163');
INSERT INTO `t_region` VALUES ('1486', '浠水县', '163');
INSERT INTO `t_region` VALUES ('1487', '蕲春县', '163');
INSERT INTO `t_region` VALUES ('1488', '黄梅县', '163');
INSERT INTO `t_region` VALUES ('1489', '麻城市', '163');
INSERT INTO `t_region` VALUES ('1490', '武穴市', '163');
INSERT INTO `t_region` VALUES ('1491', '黄石港区', '164');
INSERT INTO `t_region` VALUES ('1492', '西塞山区', '164');
INSERT INTO `t_region` VALUES ('1493', '下陆区', '164');
INSERT INTO `t_region` VALUES ('1494', '铁山区', '164');
INSERT INTO `t_region` VALUES ('1495', '阳新县', '164');
INSERT INTO `t_region` VALUES ('1496', '大冶市', '164');
INSERT INTO `t_region` VALUES ('1497', '咸安区', '165');
INSERT INTO `t_region` VALUES ('1498', '嘉鱼县', '165');
INSERT INTO `t_region` VALUES ('1499', '通城县', '165');
INSERT INTO `t_region` VALUES ('1500', '崇阳县', '165');
INSERT INTO `t_region` VALUES ('1501', '通山县', '165');
INSERT INTO `t_region` VALUES ('1502', '赤壁市', '165');
INSERT INTO `t_region` VALUES ('1503', '沙市区', '166');
INSERT INTO `t_region` VALUES ('1504', '荆州区', '166');
INSERT INTO `t_region` VALUES ('1505', '公安县', '166');
INSERT INTO `t_region` VALUES ('1506', '监利县', '166');
INSERT INTO `t_region` VALUES ('1507', '江陵县', '166');
INSERT INTO `t_region` VALUES ('1508', '石首市', '166');
INSERT INTO `t_region` VALUES ('1509', '洪湖市', '166');
INSERT INTO `t_region` VALUES ('1510', '松滋市', '166');
INSERT INTO `t_region` VALUES ('1511', '西陵区', '167');
INSERT INTO `t_region` VALUES ('1512', '伍家岗区', '167');
INSERT INTO `t_region` VALUES ('1513', '点军区', '167');
INSERT INTO `t_region` VALUES ('1514', '猇亭区', '167');
INSERT INTO `t_region` VALUES ('1515', '夷陵区', '167');
INSERT INTO `t_region` VALUES ('1516', '远安县', '167');
INSERT INTO `t_region` VALUES ('1517', '兴山县', '167');
INSERT INTO `t_region` VALUES ('1518', '秭归县', '167');
INSERT INTO `t_region` VALUES ('1519', '长阳土家族自治县', '167');
INSERT INTO `t_region` VALUES ('1520', '五峰土家族自治县', '167');
INSERT INTO `t_region` VALUES ('1521', '宜都市', '167');
INSERT INTO `t_region` VALUES ('1522', '当阳市', '167');
INSERT INTO `t_region` VALUES ('1523', '枝江市', '167');
INSERT INTO `t_region` VALUES ('1524', '恩施市', '168');
INSERT INTO `t_region` VALUES ('1525', '利川市', '168');
INSERT INTO `t_region` VALUES ('1526', '建始县', '168');
INSERT INTO `t_region` VALUES ('1527', '巴东县', '168');
INSERT INTO `t_region` VALUES ('1528', '宣恩县', '168');
INSERT INTO `t_region` VALUES ('1529', '咸丰县', '168');
INSERT INTO `t_region` VALUES ('1530', '来凤县', '168');
INSERT INTO `t_region` VALUES ('1531', '鹤峰县', '168');
INSERT INTO `t_region` VALUES ('1532', '茅箭区', '170');
INSERT INTO `t_region` VALUES ('1533', '张湾区', '170');
INSERT INTO `t_region` VALUES ('1534', '郧县', '170');
INSERT INTO `t_region` VALUES ('1535', '郧西县', '170');
INSERT INTO `t_region` VALUES ('1536', '竹山县', '170');
INSERT INTO `t_region` VALUES ('1537', '竹溪县', '170');
INSERT INTO `t_region` VALUES ('1538', '房县', '170');
INSERT INTO `t_region` VALUES ('1539', '丹江口市', '170');
INSERT INTO `t_region` VALUES ('1540', '曾都区', '171');
INSERT INTO `t_region` VALUES ('1541', '广水市', '171');
INSERT INTO `t_region` VALUES ('1542', '东宝区', '172');
INSERT INTO `t_region` VALUES ('1543', '掇刀区', '172');
INSERT INTO `t_region` VALUES ('1544', '京山县', '172');
INSERT INTO `t_region` VALUES ('1545', '沙洋县', '172');
INSERT INTO `t_region` VALUES ('1546', '钟祥市', '172');
INSERT INTO `t_region` VALUES ('1547', '岳阳楼区', '176');
INSERT INTO `t_region` VALUES ('1548', '云溪区', '176');
INSERT INTO `t_region` VALUES ('1549', '君山区', '176');
INSERT INTO `t_region` VALUES ('1550', '岳阳县', '176');
INSERT INTO `t_region` VALUES ('1551', '华容县', '176');
INSERT INTO `t_region` VALUES ('1552', '湘阴县', '176');
INSERT INTO `t_region` VALUES ('1553', '平江县', '176');
INSERT INTO `t_region` VALUES ('1554', '汨罗市', '176');
INSERT INTO `t_region` VALUES ('1555', '临湘市', '176');
INSERT INTO `t_region` VALUES ('1556', '芙蓉区', '177');
INSERT INTO `t_region` VALUES ('1557', '天心区', '177');
INSERT INTO `t_region` VALUES ('1558', '岳麓区', '177');
INSERT INTO `t_region` VALUES ('1559', '开福区', '177');
INSERT INTO `t_region` VALUES ('1560', '雨花区', '177');
INSERT INTO `t_region` VALUES ('1561', '长沙县', '177');
INSERT INTO `t_region` VALUES ('1562', '望城县', '177');
INSERT INTO `t_region` VALUES ('1563', '宁乡县', '177');
INSERT INTO `t_region` VALUES ('1564', '浏阳市', '177');
INSERT INTO `t_region` VALUES ('1565', '雨湖区', '178');
INSERT INTO `t_region` VALUES ('1566', '岳塘区', '178');
INSERT INTO `t_region` VALUES ('1567', '湘潭县', '178');
INSERT INTO `t_region` VALUES ('1568', '湘乡市', '178');
INSERT INTO `t_region` VALUES ('1569', '韶山市', '178');
INSERT INTO `t_region` VALUES ('1570', '荷塘区', '179');
INSERT INTO `t_region` VALUES ('1571', '芦淞区', '179');
INSERT INTO `t_region` VALUES ('1572', '石峰区', '179');
INSERT INTO `t_region` VALUES ('1573', '天元区', '179');
INSERT INTO `t_region` VALUES ('1574', '株洲县', '179');
INSERT INTO `t_region` VALUES ('1575', '攸县', '179');
INSERT INTO `t_region` VALUES ('1576', '茶陵县', '179');
INSERT INTO `t_region` VALUES ('1577', '炎陵县', '179');
INSERT INTO `t_region` VALUES ('1578', '醴陵市', '179');
INSERT INTO `t_region` VALUES ('1579', '珠晖区', '180');
INSERT INTO `t_region` VALUES ('1580', '雁峰区', '180');
INSERT INTO `t_region` VALUES ('1581', '石鼓区', '180');
INSERT INTO `t_region` VALUES ('1582', '蒸湘区', '180');
INSERT INTO `t_region` VALUES ('1583', '南岳区', '180');
INSERT INTO `t_region` VALUES ('1584', '衡阳县', '180');
INSERT INTO `t_region` VALUES ('1585', '衡南县', '180');
INSERT INTO `t_region` VALUES ('1586', '衡山县', '180');
INSERT INTO `t_region` VALUES ('1587', '衡东县', '180');
INSERT INTO `t_region` VALUES ('1588', '祁东县', '180');
INSERT INTO `t_region` VALUES ('1589', '耒阳市', '180');
INSERT INTO `t_region` VALUES ('1590', '常宁市', '180');
INSERT INTO `t_region` VALUES ('1591', '北湖区', '181');
INSERT INTO `t_region` VALUES ('1592', '苏仙区', '181');
INSERT INTO `t_region` VALUES ('1593', '桂阳县', '181');
INSERT INTO `t_region` VALUES ('1594', '宜章县', '181');
INSERT INTO `t_region` VALUES ('1595', '永兴县', '181');
INSERT INTO `t_region` VALUES ('1596', '嘉禾县', '181');
INSERT INTO `t_region` VALUES ('1597', '临武县', '181');
INSERT INTO `t_region` VALUES ('1598', '汝城县', '181');
INSERT INTO `t_region` VALUES ('1599', '桂东县', '181');
INSERT INTO `t_region` VALUES ('1600', '安仁县', '181');
INSERT INTO `t_region` VALUES ('1601', '资兴市', '181');
INSERT INTO `t_region` VALUES ('1602', '武陵区', '182');
INSERT INTO `t_region` VALUES ('1603', '鼎城区', '182');
INSERT INTO `t_region` VALUES ('1604', '安乡县', '182');
INSERT INTO `t_region` VALUES ('1605', '汉寿县', '182');
INSERT INTO `t_region` VALUES ('1606', '澧县', '182');
INSERT INTO `t_region` VALUES ('1607', '临澧县', '182');
INSERT INTO `t_region` VALUES ('1608', '桃源县', '182');
INSERT INTO `t_region` VALUES ('1609', '石门县', '182');
INSERT INTO `t_region` VALUES ('1610', '津市市', '182');
INSERT INTO `t_region` VALUES ('1611', '资阳区', '183');
INSERT INTO `t_region` VALUES ('1612', '赫山区', '183');
INSERT INTO `t_region` VALUES ('1613', '南县', '183');
INSERT INTO `t_region` VALUES ('1614', '桃江县', '183');
INSERT INTO `t_region` VALUES ('1615', '安化县', '183');
INSERT INTO `t_region` VALUES ('1616', '沅江市', '183');
INSERT INTO `t_region` VALUES ('1617', '娄星区', '184');
INSERT INTO `t_region` VALUES ('1618', '双峰县', '184');
INSERT INTO `t_region` VALUES ('1619', '新化县', '184');
INSERT INTO `t_region` VALUES ('1620', '冷水江市', '184');
INSERT INTO `t_region` VALUES ('1621', '涟源市', '184');
INSERT INTO `t_region` VALUES ('1622', '双清区', '185');
INSERT INTO `t_region` VALUES ('1623', '大祥区', '185');
INSERT INTO `t_region` VALUES ('1624', '北塔区', '185');
INSERT INTO `t_region` VALUES ('1625', '邵东县', '185');
INSERT INTO `t_region` VALUES ('1626', '新邵县', '185');
INSERT INTO `t_region` VALUES ('1627', '邵阳县', '185');
INSERT INTO `t_region` VALUES ('1628', '隆回县', '185');
INSERT INTO `t_region` VALUES ('1629', '洞口县', '185');
INSERT INTO `t_region` VALUES ('1630', '绥宁县', '185');
INSERT INTO `t_region` VALUES ('1631', '新宁县', '185');
INSERT INTO `t_region` VALUES ('1632', '城步苗族自治县', '185');
INSERT INTO `t_region` VALUES ('1633', '武冈市', '185');
INSERT INTO `t_region` VALUES ('1634', '吉首市', '186');
INSERT INTO `t_region` VALUES ('1635', '泸溪县', '186');
INSERT INTO `t_region` VALUES ('1636', '凤凰县', '186');
INSERT INTO `t_region` VALUES ('1637', '花垣县', '186');
INSERT INTO `t_region` VALUES ('1638', '保靖县', '186');
INSERT INTO `t_region` VALUES ('1639', '古丈县', '186');
INSERT INTO `t_region` VALUES ('1640', '永顺县', '186');
INSERT INTO `t_region` VALUES ('1641', '龙山县', '186');
INSERT INTO `t_region` VALUES ('1642', '永定区', '187');
INSERT INTO `t_region` VALUES ('1643', '武陵源区', '187');
INSERT INTO `t_region` VALUES ('1644', '慈利县', '187');
INSERT INTO `t_region` VALUES ('1645', '桑植县', '187');
INSERT INTO `t_region` VALUES ('1646', '鹤城区', '188');
INSERT INTO `t_region` VALUES ('1647', '中方县', '188');
INSERT INTO `t_region` VALUES ('1648', '沅陵县', '188');
INSERT INTO `t_region` VALUES ('1649', '辰溪县', '188');
INSERT INTO `t_region` VALUES ('1650', '溆浦县', '188');
INSERT INTO `t_region` VALUES ('1651', '会同县', '188');
INSERT INTO `t_region` VALUES ('1652', '麻阳苗族自治县', '188');
INSERT INTO `t_region` VALUES ('1653', '新晃侗族自治县', '188');
INSERT INTO `t_region` VALUES ('1654', '芷江侗族自治县', '188');
INSERT INTO `t_region` VALUES ('1655', '靖州苗族侗族自治县', '188');
INSERT INTO `t_region` VALUES ('1656', '通道侗族自治县', '188');
INSERT INTO `t_region` VALUES ('1657', '洪江市', '188');
INSERT INTO `t_region` VALUES ('1658', '零陵区', '189');
INSERT INTO `t_region` VALUES ('1659', '冷水滩区', '189');
INSERT INTO `t_region` VALUES ('1660', '祁阳县', '189');
INSERT INTO `t_region` VALUES ('1661', '东安县', '189');
INSERT INTO `t_region` VALUES ('1662', '双牌县', '189');
INSERT INTO `t_region` VALUES ('1663', '道县', '189');
INSERT INTO `t_region` VALUES ('1664', '江永县', '189');
INSERT INTO `t_region` VALUES ('1665', '宁远县', '189');
INSERT INTO `t_region` VALUES ('1666', '蓝山县', '189');
INSERT INTO `t_region` VALUES ('1667', '新田县', '189');
INSERT INTO `t_region` VALUES ('1668', '江华瑶族自治县', '189');
INSERT INTO `t_region` VALUES ('1669', '从化市', '190');
INSERT INTO `t_region` VALUES ('1670', '荔湾区', '190');
INSERT INTO `t_region` VALUES ('1671', '越秀区', '190');
INSERT INTO `t_region` VALUES ('1672', '海珠区', '190');
INSERT INTO `t_region` VALUES ('1673', '天河区', '190');
INSERT INTO `t_region` VALUES ('1674', '白云区', '190');
INSERT INTO `t_region` VALUES ('1675', '花都区', '190');
INSERT INTO `t_region` VALUES ('1676', '黄埔区', '190');
INSERT INTO `t_region` VALUES ('1677', '萝岗区', '190');
INSERT INTO `t_region` VALUES ('1678', '南沙区', '190');
INSERT INTO `t_region` VALUES ('1679', '番禺区', '190');
INSERT INTO `t_region` VALUES ('1680', '增城市', '190');
INSERT INTO `t_region` VALUES ('1681', '海丰县', '191');
INSERT INTO `t_region` VALUES ('1682', '陆河县', '191');
INSERT INTO `t_region` VALUES ('1683', '陆丰市', '191');
INSERT INTO `t_region` VALUES ('1684', '江城区', '192');
INSERT INTO `t_region` VALUES ('1685', '阳西县', '192');
INSERT INTO `t_region` VALUES ('1686', '阳东县', '192');
INSERT INTO `t_region` VALUES ('1687', '阳春市', '192');
INSERT INTO `t_region` VALUES ('1688', '榕城区', '193');
INSERT INTO `t_region` VALUES ('1689', '揭东县', '193');
INSERT INTO `t_region` VALUES ('1690', '揭西县', '193');
INSERT INTO `t_region` VALUES ('1691', '惠来县', '193');
INSERT INTO `t_region` VALUES ('1692', '普宁市', '193');
INSERT INTO `t_region` VALUES ('1693', '茂南区', '194');
INSERT INTO `t_region` VALUES ('1694', '茂港区', '194');
INSERT INTO `t_region` VALUES ('1695', '电白县', '194');
INSERT INTO `t_region` VALUES ('1696', '高州市', '194');
INSERT INTO `t_region` VALUES ('1697', '化州市', '194');
INSERT INTO `t_region` VALUES ('1698', '信宜市', '194');
INSERT INTO `t_region` VALUES ('1699', '惠城区', '195');
INSERT INTO `t_region` VALUES ('1700', '惠阳区', '195');
INSERT INTO `t_region` VALUES ('1701', '博罗县', '195');
INSERT INTO `t_region` VALUES ('1702', '惠东县', '195');
INSERT INTO `t_region` VALUES ('1703', '龙门县', '195');
INSERT INTO `t_region` VALUES ('1704', '蓬江区', '196');
INSERT INTO `t_region` VALUES ('1705', '江海区', '196');
INSERT INTO `t_region` VALUES ('1706', '新会区', '196');
INSERT INTO `t_region` VALUES ('1707', '台山市', '196');
INSERT INTO `t_region` VALUES ('1708', '开平市', '196');
INSERT INTO `t_region` VALUES ('1709', '鹤山市', '196');
INSERT INTO `t_region` VALUES ('1710', '恩平市', '196');
INSERT INTO `t_region` VALUES ('1711', '武江区', '197');
INSERT INTO `t_region` VALUES ('1712', '浈江区', '197');
INSERT INTO `t_region` VALUES ('1713', '曲江区', '197');
INSERT INTO `t_region` VALUES ('1714', '始兴县', '197');
INSERT INTO `t_region` VALUES ('1715', '仁化县', '197');
INSERT INTO `t_region` VALUES ('1716', '翁源县', '197');
INSERT INTO `t_region` VALUES ('1717', '乳源瑶族自治县', '197');
INSERT INTO `t_region` VALUES ('1718', '新丰县', '197');
INSERT INTO `t_region` VALUES ('1719', '乐昌市', '197');
INSERT INTO `t_region` VALUES ('1720', '南雄市', '197');
INSERT INTO `t_region` VALUES ('1721', '梅江区', '198');
INSERT INTO `t_region` VALUES ('1722', '梅县', '198');
INSERT INTO `t_region` VALUES ('1723', '大埔县', '198');
INSERT INTO `t_region` VALUES ('1724', '丰顺县', '198');
INSERT INTO `t_region` VALUES ('1725', '五华县', '198');
INSERT INTO `t_region` VALUES ('1726', '平远县', '198');
INSERT INTO `t_region` VALUES ('1727', '蕉岭县', '198');
INSERT INTO `t_region` VALUES ('1728', '兴宁市', '198');
INSERT INTO `t_region` VALUES ('1729', '龙湖区', '199');
INSERT INTO `t_region` VALUES ('1730', '金平区', '199');
INSERT INTO `t_region` VALUES ('1731', '濠江区', '199');
INSERT INTO `t_region` VALUES ('1732', '潮阳区', '199');
INSERT INTO `t_region` VALUES ('1733', '潮南区', '199');
INSERT INTO `t_region` VALUES ('1734', '澄海区', '199');
INSERT INTO `t_region` VALUES ('1735', '南澳县', '199');
INSERT INTO `t_region` VALUES ('1736', '罗湖区', '200');
INSERT INTO `t_region` VALUES ('1737', '福田区', '200');
INSERT INTO `t_region` VALUES ('1738', '南山区', '200');
INSERT INTO `t_region` VALUES ('1739', '宝安区', '200');
INSERT INTO `t_region` VALUES ('1740', '龙岗区', '200');
INSERT INTO `t_region` VALUES ('1741', '盐田区', '200');
INSERT INTO `t_region` VALUES ('1742', '香洲区', '201');
INSERT INTO `t_region` VALUES ('1743', '斗门区', '201');
INSERT INTO `t_region` VALUES ('1744', '金湾区', '201');
INSERT INTO `t_region` VALUES ('1745', '禅城区', '202');
INSERT INTO `t_region` VALUES ('1746', '南海区', '202');
INSERT INTO `t_region` VALUES ('1747', '顺德区', '202');
INSERT INTO `t_region` VALUES ('1748', '三水区', '202');
INSERT INTO `t_region` VALUES ('1749', '高明区', '202');
INSERT INTO `t_region` VALUES ('1750', '端州区', '203');
INSERT INTO `t_region` VALUES ('1751', '鼎湖区', '203');
INSERT INTO `t_region` VALUES ('1752', '广宁县', '203');
INSERT INTO `t_region` VALUES ('1753', '怀集县', '203');
INSERT INTO `t_region` VALUES ('1754', '封开县', '203');
INSERT INTO `t_region` VALUES ('1755', '德庆县', '203');
INSERT INTO `t_region` VALUES ('1756', '高要市', '203');
INSERT INTO `t_region` VALUES ('1757', '四会市', '203');
INSERT INTO `t_region` VALUES ('1758', '赤坎区', '204');
INSERT INTO `t_region` VALUES ('1759', '霞山区', '204');
INSERT INTO `t_region` VALUES ('1760', '坡头区', '204');
INSERT INTO `t_region` VALUES ('1761', '麻章区', '204');
INSERT INTO `t_region` VALUES ('1762', '遂溪县', '204');
INSERT INTO `t_region` VALUES ('1763', '徐闻县', '204');
INSERT INTO `t_region` VALUES ('1764', '廉江市', '204');
INSERT INTO `t_region` VALUES ('1765', '雷州市', '204');
INSERT INTO `t_region` VALUES ('1766', '吴川市', '204');
INSERT INTO `t_region` VALUES ('1767', '源城区', '206');
INSERT INTO `t_region` VALUES ('1768', '紫金县', '206');
INSERT INTO `t_region` VALUES ('1769', '龙川县', '206');
INSERT INTO `t_region` VALUES ('1770', '连平县', '206');
INSERT INTO `t_region` VALUES ('1771', '和平县', '206');
INSERT INTO `t_region` VALUES ('1772', '东源县', '206');
INSERT INTO `t_region` VALUES ('1773', '清城区', '207');
INSERT INTO `t_region` VALUES ('1774', '佛冈县', '207');
INSERT INTO `t_region` VALUES ('1775', '阳山县', '207');
INSERT INTO `t_region` VALUES ('1776', '连山壮族瑶族自治县', '207');
INSERT INTO `t_region` VALUES ('1777', '连南瑶族自治县', '207');
INSERT INTO `t_region` VALUES ('1778', '清新县', '207');
INSERT INTO `t_region` VALUES ('1779', '英德市', '207');
INSERT INTO `t_region` VALUES ('1780', '连州市', '207');
INSERT INTO `t_region` VALUES ('1781', '云城区', '208');
INSERT INTO `t_region` VALUES ('1782', '新兴县', '208');
INSERT INTO `t_region` VALUES ('1783', '郁南县', '208');
INSERT INTO `t_region` VALUES ('1784', '云安县', '208');
INSERT INTO `t_region` VALUES ('1785', '罗定市', '208');
INSERT INTO `t_region` VALUES ('1786', '湘桥区', '209');
INSERT INTO `t_region` VALUES ('1787', '潮安县', '209');
INSERT INTO `t_region` VALUES ('1788', '饶平县', '209');
INSERT INTO `t_region` VALUES ('1789', '城关区', '211');
INSERT INTO `t_region` VALUES ('1790', '七里河区', '211');
INSERT INTO `t_region` VALUES ('1791', '西固区', '211');
INSERT INTO `t_region` VALUES ('1792', '安宁区', '211');
INSERT INTO `t_region` VALUES ('1793', '红古区', '211');
INSERT INTO `t_region` VALUES ('1794', '永登县', '211');
INSERT INTO `t_region` VALUES ('1795', '皋兰县', '211');
INSERT INTO `t_region` VALUES ('1796', '榆中县', '211');
INSERT INTO `t_region` VALUES ('1797', '金川区', '212');
INSERT INTO `t_region` VALUES ('1798', '永昌县', '212');
INSERT INTO `t_region` VALUES ('1799', '白银区', '213');
INSERT INTO `t_region` VALUES ('1800', '平川区', '213');
INSERT INTO `t_region` VALUES ('1801', '靖远县', '213');
INSERT INTO `t_region` VALUES ('1802', '会宁县', '213');
INSERT INTO `t_region` VALUES ('1803', '景泰县', '213');
INSERT INTO `t_region` VALUES ('1804', '秦州区', '214');
INSERT INTO `t_region` VALUES ('1805', '麦积区', '214');
INSERT INTO `t_region` VALUES ('1806', '清水县', '214');
INSERT INTO `t_region` VALUES ('1807', '秦安县', '214');
INSERT INTO `t_region` VALUES ('1808', '甘谷县', '214');
INSERT INTO `t_region` VALUES ('1809', '武山县', '214');
INSERT INTO `t_region` VALUES ('1810', '张家川回族自治县', '214');
INSERT INTO `t_region` VALUES ('1811', '凉州区', '216');
INSERT INTO `t_region` VALUES ('1812', '民勤县', '216');
INSERT INTO `t_region` VALUES ('1813', '古浪县', '216');
INSERT INTO `t_region` VALUES ('1814', '天祝藏族自治县', '216');
INSERT INTO `t_region` VALUES ('1815', '甘州区', '217');
INSERT INTO `t_region` VALUES ('1816', '肃南裕固族自治县', '217');
INSERT INTO `t_region` VALUES ('1817', '民乐县', '217');
INSERT INTO `t_region` VALUES ('1818', '临泽县', '217');
INSERT INTO `t_region` VALUES ('1819', '高台县', '217');
INSERT INTO `t_region` VALUES ('1820', '山丹县', '217');
INSERT INTO `t_region` VALUES ('1821', '崆峒区', '218');
INSERT INTO `t_region` VALUES ('1822', '泾川县', '218');
INSERT INTO `t_region` VALUES ('1823', '灵台县', '218');
INSERT INTO `t_region` VALUES ('1824', '崇信县', '218');
INSERT INTO `t_region` VALUES ('1825', '华亭县', '218');
INSERT INTO `t_region` VALUES ('1826', '庄浪县', '218');
INSERT INTO `t_region` VALUES ('1827', '静宁县', '218');
INSERT INTO `t_region` VALUES ('1828', '肃州区', '219');
INSERT INTO `t_region` VALUES ('1829', '金塔县', '219');
INSERT INTO `t_region` VALUES ('1830', '瓜州县', '219');
INSERT INTO `t_region` VALUES ('1831', '肃北蒙古族自治县', '219');
INSERT INTO `t_region` VALUES ('1832', '阿克塞哈萨克族自治县', '219');
INSERT INTO `t_region` VALUES ('1833', '玉门市', '219');
INSERT INTO `t_region` VALUES ('1834', '敦煌市', '219');
INSERT INTO `t_region` VALUES ('1835', '西峰区', '220');
INSERT INTO `t_region` VALUES ('1836', '庆城县', '220');
INSERT INTO `t_region` VALUES ('1837', '环县', '220');
INSERT INTO `t_region` VALUES ('1838', '华池县', '220');
INSERT INTO `t_region` VALUES ('1839', '合水县', '220');
INSERT INTO `t_region` VALUES ('1840', '正宁县', '220');
INSERT INTO `t_region` VALUES ('1841', '宁县', '220');
INSERT INTO `t_region` VALUES ('1842', '镇原县', '220');
INSERT INTO `t_region` VALUES ('1843', '安定区', '221');
INSERT INTO `t_region` VALUES ('1844', '通渭县', '221');
INSERT INTO `t_region` VALUES ('1845', '陇西县', '221');
INSERT INTO `t_region` VALUES ('1846', '渭源县', '221');
INSERT INTO `t_region` VALUES ('1847', '临洮县', '221');
INSERT INTO `t_region` VALUES ('1848', '漳县', '221');
INSERT INTO `t_region` VALUES ('1849', '岷县', '221');
INSERT INTO `t_region` VALUES ('1850', '武都区', '222');
INSERT INTO `t_region` VALUES ('1851', '成县', '222');
INSERT INTO `t_region` VALUES ('1852', '文县', '222');
INSERT INTO `t_region` VALUES ('1853', '宕昌县', '222');
INSERT INTO `t_region` VALUES ('1854', '康县', '222');
INSERT INTO `t_region` VALUES ('1855', '西和县', '222');
INSERT INTO `t_region` VALUES ('1856', '礼县', '222');
INSERT INTO `t_region` VALUES ('1857', '徽县', '222');
INSERT INTO `t_region` VALUES ('1858', '两当县', '222');
INSERT INTO `t_region` VALUES ('1859', '临夏市', '223');
INSERT INTO `t_region` VALUES ('1860', '临夏县', '223');
INSERT INTO `t_region` VALUES ('1861', '康乐县', '223');
INSERT INTO `t_region` VALUES ('1862', '永靖县', '223');
INSERT INTO `t_region` VALUES ('1863', '广河县', '223');
INSERT INTO `t_region` VALUES ('1864', '和政县', '223');
INSERT INTO `t_region` VALUES ('1865', '东乡族自治县', '223');
INSERT INTO `t_region` VALUES ('1866', '积石山保安族东乡族撒拉族自治县', '223');
INSERT INTO `t_region` VALUES ('1867', '合作市', '224');
INSERT INTO `t_region` VALUES ('1868', '临潭县', '224');
INSERT INTO `t_region` VALUES ('1869', '卓尼县', '224');
INSERT INTO `t_region` VALUES ('1870', '舟曲县', '224');
INSERT INTO `t_region` VALUES ('1871', '迭部县', '224');
INSERT INTO `t_region` VALUES ('1872', '玛曲县', '224');
INSERT INTO `t_region` VALUES ('1873', '碌曲县', '224');
INSERT INTO `t_region` VALUES ('1874', '夏河县', '224');
INSERT INTO `t_region` VALUES ('1875', '锦江区', '225');
INSERT INTO `t_region` VALUES ('1876', '青羊区', '225');
INSERT INTO `t_region` VALUES ('1877', '金牛区', '225');
INSERT INTO `t_region` VALUES ('1878', '武侯区', '225');
INSERT INTO `t_region` VALUES ('1879', '成华区', '225');
INSERT INTO `t_region` VALUES ('1880', '龙泉驿区', '225');
INSERT INTO `t_region` VALUES ('1881', '青白江区', '225');
INSERT INTO `t_region` VALUES ('1882', '新都区', '225');
INSERT INTO `t_region` VALUES ('1883', '温江区', '225');
INSERT INTO `t_region` VALUES ('1884', '金堂县', '225');
INSERT INTO `t_region` VALUES ('1885', '双流县', '225');
INSERT INTO `t_region` VALUES ('1886', '郫县', '225');
INSERT INTO `t_region` VALUES ('1887', '大邑县', '225');
INSERT INTO `t_region` VALUES ('1888', '蒲江县', '225');
INSERT INTO `t_region` VALUES ('1889', '新津县', '225');
INSERT INTO `t_region` VALUES ('1890', '都江堰市', '225');
INSERT INTO `t_region` VALUES ('1891', '彭州市', '225');
INSERT INTO `t_region` VALUES ('1892', '邛崃市', '225');
INSERT INTO `t_region` VALUES ('1893', '崇州市', '225');
INSERT INTO `t_region` VALUES ('1894', '东区', '226');
INSERT INTO `t_region` VALUES ('1895', '西区', '226');
INSERT INTO `t_region` VALUES ('1896', '仁和区', '226');
INSERT INTO `t_region` VALUES ('1897', '米易县', '226');
INSERT INTO `t_region` VALUES ('1898', '盐边县', '226');
INSERT INTO `t_region` VALUES ('1899', '自流井区', '227');
INSERT INTO `t_region` VALUES ('1900', '贡井区', '227');
INSERT INTO `t_region` VALUES ('1901', '大安区', '227');
INSERT INTO `t_region` VALUES ('1902', '沿滩区', '227');
INSERT INTO `t_region` VALUES ('1903', '荣县', '227');
INSERT INTO `t_region` VALUES ('1904', '富顺县', '227');
INSERT INTO `t_region` VALUES ('1905', '涪城区', '228');
INSERT INTO `t_region` VALUES ('1906', '游仙区', '228');
INSERT INTO `t_region` VALUES ('1907', '三台县', '228');
INSERT INTO `t_region` VALUES ('1908', '盐亭县', '228');
INSERT INTO `t_region` VALUES ('1909', '安县', '228');
INSERT INTO `t_region` VALUES ('1910', '梓潼县', '228');
INSERT INTO `t_region` VALUES ('1911', '北川羌族自治县', '228');
INSERT INTO `t_region` VALUES ('1912', '平武县', '228');
INSERT INTO `t_region` VALUES ('1913', '江油市', '228');
INSERT INTO `t_region` VALUES ('1914', '顺庆区', '229');
INSERT INTO `t_region` VALUES ('1915', '高坪区', '229');
INSERT INTO `t_region` VALUES ('1916', '嘉陵区', '229');
INSERT INTO `t_region` VALUES ('1917', '南部县', '229');
INSERT INTO `t_region` VALUES ('1918', '营山县', '229');
INSERT INTO `t_region` VALUES ('1919', '蓬安县', '229');
INSERT INTO `t_region` VALUES ('1920', '仪陇县', '229');
INSERT INTO `t_region` VALUES ('1921', '西充县', '229');
INSERT INTO `t_region` VALUES ('1922', '阆中市', '229');
INSERT INTO `t_region` VALUES ('1923', '通川区', '230');
INSERT INTO `t_region` VALUES ('1924', '达县', '230');
INSERT INTO `t_region` VALUES ('1925', '宣汉县', '230');
INSERT INTO `t_region` VALUES ('1926', '开江县', '230');
INSERT INTO `t_region` VALUES ('1927', '大竹县', '230');
INSERT INTO `t_region` VALUES ('1928', '渠县', '230');
INSERT INTO `t_region` VALUES ('1929', '万源市', '230');
INSERT INTO `t_region` VALUES ('1930', '船山区', '231');
INSERT INTO `t_region` VALUES ('1931', '安居区', '231');
INSERT INTO `t_region` VALUES ('1932', '蓬溪县', '231');
INSERT INTO `t_region` VALUES ('1933', '射洪县', '231');
INSERT INTO `t_region` VALUES ('1934', '大英县', '231');
INSERT INTO `t_region` VALUES ('1935', '广安区', '232');
INSERT INTO `t_region` VALUES ('1936', '岳池县', '232');
INSERT INTO `t_region` VALUES ('1937', '武胜县', '232');
INSERT INTO `t_region` VALUES ('1938', '邻水县', '232');
INSERT INTO `t_region` VALUES ('1939', '华蓥市', '232');
INSERT INTO `t_region` VALUES ('1940', '巴州区', '233');
INSERT INTO `t_region` VALUES ('1941', '通江县', '233');
INSERT INTO `t_region` VALUES ('1942', '南江县', '233');
INSERT INTO `t_region` VALUES ('1943', '平昌县', '233');
INSERT INTO `t_region` VALUES ('1944', '江阳区', '234');
INSERT INTO `t_region` VALUES ('1945', '纳溪区', '234');
INSERT INTO `t_region` VALUES ('1946', '龙马潭区', '234');
INSERT INTO `t_region` VALUES ('1947', '泸县', '234');
INSERT INTO `t_region` VALUES ('1948', '合江县', '234');
INSERT INTO `t_region` VALUES ('1949', '叙永县', '234');
INSERT INTO `t_region` VALUES ('1950', '古蔺县', '234');
INSERT INTO `t_region` VALUES ('1951', '翠屏区', '235');
INSERT INTO `t_region` VALUES ('1952', '宜宾县', '235');
INSERT INTO `t_region` VALUES ('1953', '南溪县', '235');
INSERT INTO `t_region` VALUES ('1954', '江安县', '235');
INSERT INTO `t_region` VALUES ('1955', '长宁县', '235');
INSERT INTO `t_region` VALUES ('1956', '高县', '235');
INSERT INTO `t_region` VALUES ('1957', '珙县', '235');
INSERT INTO `t_region` VALUES ('1958', '筠连县', '235');
INSERT INTO `t_region` VALUES ('1959', '兴文县', '235');
INSERT INTO `t_region` VALUES ('1960', '屏山县', '235');
INSERT INTO `t_region` VALUES ('1961', '雁江区', '236');
INSERT INTO `t_region` VALUES ('1962', '安岳县', '236');
INSERT INTO `t_region` VALUES ('1963', '乐至县', '236');
INSERT INTO `t_region` VALUES ('1964', '简阳市', '236');
INSERT INTO `t_region` VALUES ('1965', '市中区', '237');
INSERT INTO `t_region` VALUES ('1966', '东兴区', '237');
INSERT INTO `t_region` VALUES ('1967', '威远县', '237');
INSERT INTO `t_region` VALUES ('1968', '资中县', '237');
INSERT INTO `t_region` VALUES ('1969', '隆昌县', '237');
INSERT INTO `t_region` VALUES ('1970', '市中区', '238');
INSERT INTO `t_region` VALUES ('1971', '沙湾区', '238');
INSERT INTO `t_region` VALUES ('1972', '五通桥区', '238');
INSERT INTO `t_region` VALUES ('1973', '金口河区', '238');
INSERT INTO `t_region` VALUES ('1974', '犍为县', '238');
INSERT INTO `t_region` VALUES ('1975', '井研县', '238');
INSERT INTO `t_region` VALUES ('1976', '夹江县', '238');
INSERT INTO `t_region` VALUES ('1977', '沐川县', '238');
INSERT INTO `t_region` VALUES ('1978', '峨边彝族自治县', '238');
INSERT INTO `t_region` VALUES ('1979', '马边彝族自治县', '238');
INSERT INTO `t_region` VALUES ('1980', '峨眉山市', '238');
INSERT INTO `t_region` VALUES ('1981', '东坡区', '239');
INSERT INTO `t_region` VALUES ('1982', '仁寿县', '239');
INSERT INTO `t_region` VALUES ('1983', '彭山县', '239');
INSERT INTO `t_region` VALUES ('1984', '洪雅县', '239');
INSERT INTO `t_region` VALUES ('1985', '丹棱县', '239');
INSERT INTO `t_region` VALUES ('1986', '青神县', '239');
INSERT INTO `t_region` VALUES ('1987', '西昌市', '240');
INSERT INTO `t_region` VALUES ('1988', '木里藏族自治县', '240');
INSERT INTO `t_region` VALUES ('1989', '盐源县', '240');
INSERT INTO `t_region` VALUES ('1990', '德昌县', '240');
INSERT INTO `t_region` VALUES ('1991', '会理县', '240');
INSERT INTO `t_region` VALUES ('1992', '会东县', '240');
INSERT INTO `t_region` VALUES ('1993', '宁南县', '240');
INSERT INTO `t_region` VALUES ('1994', '普格县', '240');
INSERT INTO `t_region` VALUES ('1995', '布拖县', '240');
INSERT INTO `t_region` VALUES ('1996', '金阳县', '240');
INSERT INTO `t_region` VALUES ('1997', '昭觉县', '240');
INSERT INTO `t_region` VALUES ('1998', '喜德县', '240');
INSERT INTO `t_region` VALUES ('1999', '冕宁县', '240');
INSERT INTO `t_region` VALUES ('2000', '越西县', '240');
INSERT INTO `t_region` VALUES ('2001', '甘洛县', '240');
INSERT INTO `t_region` VALUES ('2002', '美姑县', '240');
INSERT INTO `t_region` VALUES ('2003', '雷波县', '240');
INSERT INTO `t_region` VALUES ('2004', '雨城区', '241');
INSERT INTO `t_region` VALUES ('2005', '名山县', '241');
INSERT INTO `t_region` VALUES ('2006', '荥经县', '241');
INSERT INTO `t_region` VALUES ('2007', '汉源县', '241');
INSERT INTO `t_region` VALUES ('2008', '石棉县', '241');
INSERT INTO `t_region` VALUES ('2009', '天全县', '241');
INSERT INTO `t_region` VALUES ('2010', '芦山县', '241');
INSERT INTO `t_region` VALUES ('2011', '宝兴县', '241');
INSERT INTO `t_region` VALUES ('2012', '康定县', '242');
INSERT INTO `t_region` VALUES ('2013', '泸定县', '242');
INSERT INTO `t_region` VALUES ('2014', '丹巴县', '242');
INSERT INTO `t_region` VALUES ('2015', '九龙县', '242');
INSERT INTO `t_region` VALUES ('2016', '雅江县', '242');
INSERT INTO `t_region` VALUES ('2017', '道孚县', '242');
INSERT INTO `t_region` VALUES ('2018', '炉霍县', '242');
INSERT INTO `t_region` VALUES ('2019', '甘孜县', '242');
INSERT INTO `t_region` VALUES ('2020', '新龙县', '242');
INSERT INTO `t_region` VALUES ('2021', '德格县', '242');
INSERT INTO `t_region` VALUES ('2022', '白玉县', '242');
INSERT INTO `t_region` VALUES ('2023', '石渠县', '242');
INSERT INTO `t_region` VALUES ('2024', '色达县', '242');
INSERT INTO `t_region` VALUES ('2025', '理塘县', '242');
INSERT INTO `t_region` VALUES ('2026', '巴塘县', '242');
INSERT INTO `t_region` VALUES ('2027', '乡城县', '242');
INSERT INTO `t_region` VALUES ('2028', '稻城县', '242');
INSERT INTO `t_region` VALUES ('2029', '得荣县', '242');
INSERT INTO `t_region` VALUES ('2030', '汶川县', '243');
INSERT INTO `t_region` VALUES ('2031', '理县', '243');
INSERT INTO `t_region` VALUES ('2032', '茂县', '243');
INSERT INTO `t_region` VALUES ('2033', '松潘县', '243');
INSERT INTO `t_region` VALUES ('2034', '九寨沟县', '243');
INSERT INTO `t_region` VALUES ('2035', '金川县', '243');
INSERT INTO `t_region` VALUES ('2036', '小金县', '243');
INSERT INTO `t_region` VALUES ('2037', '黑水县', '243');
INSERT INTO `t_region` VALUES ('2038', '马尔康县', '243');
INSERT INTO `t_region` VALUES ('2039', '壤塘县', '243');
INSERT INTO `t_region` VALUES ('2040', '阿坝县', '243');
INSERT INTO `t_region` VALUES ('2041', '若尔盖县', '243');
INSERT INTO `t_region` VALUES ('2042', '红原县', '243');
INSERT INTO `t_region` VALUES ('2043', '旌阳区', '244');
INSERT INTO `t_region` VALUES ('2044', '中江县', '244');
INSERT INTO `t_region` VALUES ('2045', '罗江县', '244');
INSERT INTO `t_region` VALUES ('2046', '广汉市', '244');
INSERT INTO `t_region` VALUES ('2047', '什邡市', '244');
INSERT INTO `t_region` VALUES ('2048', '绵竹市', '244');
INSERT INTO `t_region` VALUES ('2049', '市中区', '245');
INSERT INTO `t_region` VALUES ('2050', '元坝区', '245');
INSERT INTO `t_region` VALUES ('2051', '朝天区', '245');
INSERT INTO `t_region` VALUES ('2052', '旺苍县', '245');
INSERT INTO `t_region` VALUES ('2053', '青川县', '245');
INSERT INTO `t_region` VALUES ('2054', '剑阁县', '245');
INSERT INTO `t_region` VALUES ('2055', '苍溪县', '245');
INSERT INTO `t_region` VALUES ('2056', '南明区', '246');
INSERT INTO `t_region` VALUES ('2057', '云岩区', '246');
INSERT INTO `t_region` VALUES ('2058', '花溪区', '246');
INSERT INTO `t_region` VALUES ('2059', '乌当区', '246');
INSERT INTO `t_region` VALUES ('2060', '白云区', '246');
INSERT INTO `t_region` VALUES ('2061', '小河区', '246');
INSERT INTO `t_region` VALUES ('2062', '开阳县', '246');
INSERT INTO `t_region` VALUES ('2063', '息烽县', '246');
INSERT INTO `t_region` VALUES ('2064', '修文县', '246');
INSERT INTO `t_region` VALUES ('2065', '清镇市', '246');
INSERT INTO `t_region` VALUES ('2066', '红花岗区', '247');
INSERT INTO `t_region` VALUES ('2067', '汇川区', '247');
INSERT INTO `t_region` VALUES ('2068', '遵义县', '247');
INSERT INTO `t_region` VALUES ('2069', '桐梓县', '247');
INSERT INTO `t_region` VALUES ('2070', '绥阳县', '247');
INSERT INTO `t_region` VALUES ('2071', '正安县', '247');
INSERT INTO `t_region` VALUES ('2072', '道真仡佬族苗族自治县', '247');
INSERT INTO `t_region` VALUES ('2073', '务川仡佬族苗族自治县', '247');
INSERT INTO `t_region` VALUES ('2074', '凤冈县', '247');
INSERT INTO `t_region` VALUES ('2075', '湄潭县', '247');
INSERT INTO `t_region` VALUES ('2076', '余庆县', '247');
INSERT INTO `t_region` VALUES ('2077', '习水县', '247');
INSERT INTO `t_region` VALUES ('2078', '赤水市', '247');
INSERT INTO `t_region` VALUES ('2079', '仁怀市', '247');
INSERT INTO `t_region` VALUES ('2080', '西秀区', '248');
INSERT INTO `t_region` VALUES ('2081', '平坝县', '248');
INSERT INTO `t_region` VALUES ('2082', '普定县', '248');
INSERT INTO `t_region` VALUES ('2083', '镇宁布依族苗族自治县', '248');
INSERT INTO `t_region` VALUES ('2084', '关岭布依族苗族自治县', '248');
INSERT INTO `t_region` VALUES ('2085', '紫云苗族布依族自治县', '248');
INSERT INTO `t_region` VALUES ('2086', '都匀市', '249');
INSERT INTO `t_region` VALUES ('2087', '福泉市', '249');
INSERT INTO `t_region` VALUES ('2088', '荔波县', '249');
INSERT INTO `t_region` VALUES ('2089', '贵定县', '249');
INSERT INTO `t_region` VALUES ('2090', '瓮安县', '249');
INSERT INTO `t_region` VALUES ('2091', '独山县', '249');
INSERT INTO `t_region` VALUES ('2092', '平塘县', '249');
INSERT INTO `t_region` VALUES ('2093', '罗甸县', '249');
INSERT INTO `t_region` VALUES ('2094', '长顺县', '249');
INSERT INTO `t_region` VALUES ('2095', '龙里县', '249');
INSERT INTO `t_region` VALUES ('2096', '惠水县', '249');
INSERT INTO `t_region` VALUES ('2097', '三都水族自治县', '249');
INSERT INTO `t_region` VALUES ('2098', '凯里市', '250');
INSERT INTO `t_region` VALUES ('2099', '黄平县', '250');
INSERT INTO `t_region` VALUES ('2100', '施秉县', '250');
INSERT INTO `t_region` VALUES ('2101', '三穗县', '250');
INSERT INTO `t_region` VALUES ('2102', '镇远县', '250');
INSERT INTO `t_region` VALUES ('2103', '岑巩县', '250');
INSERT INTO `t_region` VALUES ('2104', '天柱县', '250');
INSERT INTO `t_region` VALUES ('2105', '锦屏县', '250');
INSERT INTO `t_region` VALUES ('2106', '剑河县', '250');
INSERT INTO `t_region` VALUES ('2107', '台江县', '250');
INSERT INTO `t_region` VALUES ('2108', '黎平县', '250');
INSERT INTO `t_region` VALUES ('2109', '榕江县', '250');
INSERT INTO `t_region` VALUES ('2110', '从江县', '250');
INSERT INTO `t_region` VALUES ('2111', '雷山县', '250');
INSERT INTO `t_region` VALUES ('2112', '麻江县', '250');
INSERT INTO `t_region` VALUES ('2113', '丹寨县', '250');
INSERT INTO `t_region` VALUES ('2114', '铜仁市', '251');
INSERT INTO `t_region` VALUES ('2115', '江口县', '251');
INSERT INTO `t_region` VALUES ('2116', '玉屏侗族自治县', '251');
INSERT INTO `t_region` VALUES ('2117', '石阡县', '251');
INSERT INTO `t_region` VALUES ('2118', '思南县', '251');
INSERT INTO `t_region` VALUES ('2119', '印江土家族苗族自治县', '251');
INSERT INTO `t_region` VALUES ('2120', '德江县', '251');
INSERT INTO `t_region` VALUES ('2121', '沿河土家族自治县', '251');
INSERT INTO `t_region` VALUES ('2122', '松桃苗族自治县', '251');
INSERT INTO `t_region` VALUES ('2123', '万山特区', '251');
INSERT INTO `t_region` VALUES ('2124', '毕节市', '252');
INSERT INTO `t_region` VALUES ('2125', '大方县', '252');
INSERT INTO `t_region` VALUES ('2126', '黔西县', '252');
INSERT INTO `t_region` VALUES ('2127', '金沙县', '252');
INSERT INTO `t_region` VALUES ('2128', '织金县', '252');
INSERT INTO `t_region` VALUES ('2129', '纳雍县', '252');
INSERT INTO `t_region` VALUES ('2130', '威宁彝族回族苗族自治县', '252');
INSERT INTO `t_region` VALUES ('2131', '赫章县', '252');
INSERT INTO `t_region` VALUES ('2132', '钟山区', '253');
INSERT INTO `t_region` VALUES ('2133', '六枝特区', '253');
INSERT INTO `t_region` VALUES ('2134', '水城县', '253');
INSERT INTO `t_region` VALUES ('2135', '盘县', '253');
INSERT INTO `t_region` VALUES ('2136', '兴义市', '254');
INSERT INTO `t_region` VALUES ('2137', '兴仁县', '254');
INSERT INTO `t_region` VALUES ('2138', '普安县', '254');
INSERT INTO `t_region` VALUES ('2139', '晴隆县', '254');
INSERT INTO `t_region` VALUES ('2140', '贞丰县', '254');
INSERT INTO `t_region` VALUES ('2141', '望谟县', '254');
INSERT INTO `t_region` VALUES ('2142', '册亨县', '254');
INSERT INTO `t_region` VALUES ('2143', '安龙县', '254');
INSERT INTO `t_region` VALUES ('2144', '秀英区', '255');
INSERT INTO `t_region` VALUES ('2145', '龙华区', '255');
INSERT INTO `t_region` VALUES ('2146', '琼山区', '255');
INSERT INTO `t_region` VALUES ('2147', '美兰区', '255');
INSERT INTO `t_region` VALUES ('2148', '景洪市', '273');
INSERT INTO `t_region` VALUES ('2149', '勐海县', '273');
INSERT INTO `t_region` VALUES ('2150', '勐腊县', '273');
INSERT INTO `t_region` VALUES ('2151', '瑞丽市', '274');
INSERT INTO `t_region` VALUES ('2152', '潞西市', '274');
INSERT INTO `t_region` VALUES ('2153', '梁河县', '274');
INSERT INTO `t_region` VALUES ('2154', '盈江县', '274');
INSERT INTO `t_region` VALUES ('2155', '陇川县', '274');
INSERT INTO `t_region` VALUES ('2156', '昭阳区', '275');
INSERT INTO `t_region` VALUES ('2157', '鲁甸县', '275');
INSERT INTO `t_region` VALUES ('2158', '巧家县', '275');
INSERT INTO `t_region` VALUES ('2159', '盐津县', '275');
INSERT INTO `t_region` VALUES ('2160', '大关县', '275');
INSERT INTO `t_region` VALUES ('2161', '永善县', '275');
INSERT INTO `t_region` VALUES ('2162', '绥江县', '275');
INSERT INTO `t_region` VALUES ('2163', '镇雄县', '275');
INSERT INTO `t_region` VALUES ('2164', '彝良县', '275');
INSERT INTO `t_region` VALUES ('2165', '威信县', '275');
INSERT INTO `t_region` VALUES ('2166', '水富县', '275');
INSERT INTO `t_region` VALUES ('2167', '五华区', '276');
INSERT INTO `t_region` VALUES ('2168', '盘龙区', '276');
INSERT INTO `t_region` VALUES ('2169', '官渡区', '276');
INSERT INTO `t_region` VALUES ('2170', '西山区', '276');
INSERT INTO `t_region` VALUES ('2171', '东川区', '276');
INSERT INTO `t_region` VALUES ('2172', '呈贡县', '276');
INSERT INTO `t_region` VALUES ('2173', '晋宁县', '276');
INSERT INTO `t_region` VALUES ('2174', '富民县', '276');
INSERT INTO `t_region` VALUES ('2175', '宜良县', '276');
INSERT INTO `t_region` VALUES ('2176', '石林彝族自治县', '276');
INSERT INTO `t_region` VALUES ('2177', '嵩明县', '276');
INSERT INTO `t_region` VALUES ('2178', '禄劝彝族苗族自治县', '276');
INSERT INTO `t_region` VALUES ('2179', '寻甸回族彝族自治县', '276');
INSERT INTO `t_region` VALUES ('2180', '安宁市', '276');
INSERT INTO `t_region` VALUES ('2181', '大理市', '277');
INSERT INTO `t_region` VALUES ('2182', '漾濞彝族自治县', '277');
INSERT INTO `t_region` VALUES ('2183', '祥云县', '277');
INSERT INTO `t_region` VALUES ('2184', '宾川县', '277');
INSERT INTO `t_region` VALUES ('2185', '弥渡县', '277');
INSERT INTO `t_region` VALUES ('2186', '南涧彝族自治县', '277');
INSERT INTO `t_region` VALUES ('2187', '巍山彝族回族自治县', '277');
INSERT INTO `t_region` VALUES ('2188', '永平县', '277');
INSERT INTO `t_region` VALUES ('2189', '云龙县', '277');
INSERT INTO `t_region` VALUES ('2190', '洱源县', '277');
INSERT INTO `t_region` VALUES ('2191', '剑川县', '277');
INSERT INTO `t_region` VALUES ('2192', '鹤庆县', '277');
INSERT INTO `t_region` VALUES ('2193', '个旧市', '278');
INSERT INTO `t_region` VALUES ('2194', '开远市', '278');
INSERT INTO `t_region` VALUES ('2195', '蒙自县', '278');
INSERT INTO `t_region` VALUES ('2196', '屏边苗族自治县', '278');
INSERT INTO `t_region` VALUES ('2197', '建水县', '278');
INSERT INTO `t_region` VALUES ('2198', '石屏县', '278');
INSERT INTO `t_region` VALUES ('2199', '弥勒县', '278');
INSERT INTO `t_region` VALUES ('2200', '泸西县', '278');
INSERT INTO `t_region` VALUES ('2201', '元阳县', '278');
INSERT INTO `t_region` VALUES ('2202', '红河县', '278');
INSERT INTO `t_region` VALUES ('2203', '金平苗族瑶族傣族自治县', '278');
INSERT INTO `t_region` VALUES ('2204', '绿春县', '278');
INSERT INTO `t_region` VALUES ('2205', '河口瑶族自治县', '278');
INSERT INTO `t_region` VALUES ('2206', '麒麟区', '279');
INSERT INTO `t_region` VALUES ('2207', '马龙县', '279');
INSERT INTO `t_region` VALUES ('2208', '陆良县', '279');
INSERT INTO `t_region` VALUES ('2209', '师宗县', '279');
INSERT INTO `t_region` VALUES ('2210', '罗平县', '279');
INSERT INTO `t_region` VALUES ('2211', '富源县', '279');
INSERT INTO `t_region` VALUES ('2212', '会泽县', '279');
INSERT INTO `t_region` VALUES ('2213', '沾益县', '279');
INSERT INTO `t_region` VALUES ('2214', '宣威市', '279');
INSERT INTO `t_region` VALUES ('2215', '隆阳区', '280');
INSERT INTO `t_region` VALUES ('2216', '施甸县', '280');
INSERT INTO `t_region` VALUES ('2217', '腾冲县', '280');
INSERT INTO `t_region` VALUES ('2218', '龙陵县', '280');
INSERT INTO `t_region` VALUES ('2219', '昌宁县', '280');
INSERT INTO `t_region` VALUES ('2220', '文山县', '281');
INSERT INTO `t_region` VALUES ('2221', '砚山县', '281');
INSERT INTO `t_region` VALUES ('2222', '西畴县', '281');
INSERT INTO `t_region` VALUES ('2223', '麻栗坡县', '281');
INSERT INTO `t_region` VALUES ('2224', '马关县', '281');
INSERT INTO `t_region` VALUES ('2225', '丘北县', '281');
INSERT INTO `t_region` VALUES ('2226', '广南县', '281');
INSERT INTO `t_region` VALUES ('2227', '富宁县', '281');
INSERT INTO `t_region` VALUES ('2228', '红塔区', '282');
INSERT INTO `t_region` VALUES ('2229', '江川县', '282');
INSERT INTO `t_region` VALUES ('2230', '澄江县', '282');
INSERT INTO `t_region` VALUES ('2231', '通海县', '282');
INSERT INTO `t_region` VALUES ('2232', '华宁县', '282');
INSERT INTO `t_region` VALUES ('2233', '易门县', '282');
INSERT INTO `t_region` VALUES ('2234', '峨山彝族自治县', '282');
INSERT INTO `t_region` VALUES ('2235', '新平彝族傣族自治县', '282');
INSERT INTO `t_region` VALUES ('2236', '元江哈尼族彝族傣族自治县', '282');
INSERT INTO `t_region` VALUES ('2237', '楚雄市', '283');
INSERT INTO `t_region` VALUES ('2238', '双柏县', '283');
INSERT INTO `t_region` VALUES ('2239', '牟定县', '283');
INSERT INTO `t_region` VALUES ('2240', '南华县', '283');
INSERT INTO `t_region` VALUES ('2241', '姚安县', '283');
INSERT INTO `t_region` VALUES ('2242', '大姚县', '283');
INSERT INTO `t_region` VALUES ('2243', '永仁县', '283');
INSERT INTO `t_region` VALUES ('2244', '元谋县', '283');
INSERT INTO `t_region` VALUES ('2245', '武定县', '283');
INSERT INTO `t_region` VALUES ('2246', '禄丰县', '283');
INSERT INTO `t_region` VALUES ('2247', '思茅区', '284');
INSERT INTO `t_region` VALUES ('2248', '宁洱哈尼族彝族自治县', '284');
INSERT INTO `t_region` VALUES ('2249', '墨江哈尼族自治县', '284');
INSERT INTO `t_region` VALUES ('2250', '景东彝族自治县', '284');
INSERT INTO `t_region` VALUES ('2251', '景谷傣族彝族自治县', '284');
INSERT INTO `t_region` VALUES ('2252', '镇沅彝族哈尼族拉祜族自治县', '284');
INSERT INTO `t_region` VALUES ('2253', '江城哈尼族彝族自治县', '284');
INSERT INTO `t_region` VALUES ('2254', '孟连傣族拉祜族佤族自治县', '284');
INSERT INTO `t_region` VALUES ('2255', '澜沧拉祜族自治县', '284');
INSERT INTO `t_region` VALUES ('2256', '西盟佤族自治县', '284');
INSERT INTO `t_region` VALUES ('2257', '临翔区', '285');
INSERT INTO `t_region` VALUES ('2258', '凤庆县', '285');
INSERT INTO `t_region` VALUES ('2259', '云县', '285');
INSERT INTO `t_region` VALUES ('2260', '永德县', '285');
INSERT INTO `t_region` VALUES ('2261', '镇康县', '285');
INSERT INTO `t_region` VALUES ('2262', '双江拉祜族佤族布朗族傣族自治县', '285');
INSERT INTO `t_region` VALUES ('2263', '耿马傣族佤族自治县', '285');
INSERT INTO `t_region` VALUES ('2264', '沧源佤族自治县', '285');
INSERT INTO `t_region` VALUES ('2265', '泸水县', '286');
INSERT INTO `t_region` VALUES ('2266', '福贡县', '286');
INSERT INTO `t_region` VALUES ('2267', '贡山独龙族怒族自治县', '286');
INSERT INTO `t_region` VALUES ('2268', '兰坪白族普米族自治县', '286');
INSERT INTO `t_region` VALUES ('2269', '香格里拉县', '287');
INSERT INTO `t_region` VALUES ('2270', '德钦县', '287');
INSERT INTO `t_region` VALUES ('2271', '维西傈僳族自治县', '287');
INSERT INTO `t_region` VALUES ('2272', '古城区', '288');
INSERT INTO `t_region` VALUES ('2273', '玉龙纳西族自治县', '288');
INSERT INTO `t_region` VALUES ('2274', '永胜县', '288');
INSERT INTO `t_region` VALUES ('2275', '华坪县', '288');
INSERT INTO `t_region` VALUES ('2276', '宁蒗彝族自治县', '288');
INSERT INTO `t_region` VALUES ('2277', '门源回族自治县', '289');
INSERT INTO `t_region` VALUES ('2278', '祁连县', '289');
INSERT INTO `t_region` VALUES ('2279', '海晏县', '289');
INSERT INTO `t_region` VALUES ('2280', '刚察县', '289');
INSERT INTO `t_region` VALUES ('2281', '城东区', '290');
INSERT INTO `t_region` VALUES ('2282', '城中区', '290');
INSERT INTO `t_region` VALUES ('2283', '城西区', '290');
INSERT INTO `t_region` VALUES ('2284', '城北区', '290');
INSERT INTO `t_region` VALUES ('2285', '大通回族土族自治县', '290');
INSERT INTO `t_region` VALUES ('2286', '湟中县', '290');
INSERT INTO `t_region` VALUES ('2287', '湟源县', '290');
INSERT INTO `t_region` VALUES ('2288', '平安县', '291');
INSERT INTO `t_region` VALUES ('2289', '民和回族土族自治县', '291');
INSERT INTO `t_region` VALUES ('2290', '乐都县', '291');
INSERT INTO `t_region` VALUES ('2291', '互助土族自治县', '291');
INSERT INTO `t_region` VALUES ('2292', '化隆回族自治县', '291');
INSERT INTO `t_region` VALUES ('2293', '循化撒拉族自治县', '291');
INSERT INTO `t_region` VALUES ('2294', '同仁县', '292');
INSERT INTO `t_region` VALUES ('2295', '尖扎县', '292');
INSERT INTO `t_region` VALUES ('2296', '泽库县', '292');
INSERT INTO `t_region` VALUES ('2297', '河南蒙古族自治县', '292');
INSERT INTO `t_region` VALUES ('2298', '共和县', '293');
INSERT INTO `t_region` VALUES ('2299', '同德县', '293');
INSERT INTO `t_region` VALUES ('2300', '贵德县', '293');
INSERT INTO `t_region` VALUES ('2301', '兴海县', '293');
INSERT INTO `t_region` VALUES ('2302', '贵南县', '293');
INSERT INTO `t_region` VALUES ('2303', '玛沁县', '294');
INSERT INTO `t_region` VALUES ('2304', '班玛县', '294');
INSERT INTO `t_region` VALUES ('2305', '甘德县', '294');
INSERT INTO `t_region` VALUES ('2306', '达日县', '294');
INSERT INTO `t_region` VALUES ('2307', '久治县', '294');
INSERT INTO `t_region` VALUES ('2308', '玛多县', '294');
INSERT INTO `t_region` VALUES ('2309', '玉树县', '295');
INSERT INTO `t_region` VALUES ('2310', '杂多县', '295');
INSERT INTO `t_region` VALUES ('2311', '称多县', '295');
INSERT INTO `t_region` VALUES ('2312', '治多县', '295');
INSERT INTO `t_region` VALUES ('2313', '囊谦县', '295');
INSERT INTO `t_region` VALUES ('2314', '曲麻莱县', '295');
INSERT INTO `t_region` VALUES ('2315', '格尔木市', '296');
INSERT INTO `t_region` VALUES ('2316', '德令哈市', '296');
INSERT INTO `t_region` VALUES ('2317', '乌兰县', '296');
INSERT INTO `t_region` VALUES ('2318', '都兰县', '296');
INSERT INTO `t_region` VALUES ('2319', '天峻县', '296');
INSERT INTO `t_region` VALUES ('2320', '新城区', '297');
INSERT INTO `t_region` VALUES ('2321', '碑林区', '297');
INSERT INTO `t_region` VALUES ('2322', '莲湖区', '297');
INSERT INTO `t_region` VALUES ('2323', '灞桥区', '297');
INSERT INTO `t_region` VALUES ('2324', '未央区', '297');
INSERT INTO `t_region` VALUES ('2325', '雁塔区', '297');
INSERT INTO `t_region` VALUES ('2326', '阎良区', '297');
INSERT INTO `t_region` VALUES ('2327', '临潼区', '297');
INSERT INTO `t_region` VALUES ('2328', '长安区', '297');
INSERT INTO `t_region` VALUES ('2329', '蓝田县', '297');
INSERT INTO `t_region` VALUES ('2330', '周至县', '297');
INSERT INTO `t_region` VALUES ('2331', '户县', '297');
INSERT INTO `t_region` VALUES ('2332', '高陵县', '297');
INSERT INTO `t_region` VALUES ('2333', '秦都区', '298');
INSERT INTO `t_region` VALUES ('2334', '杨陵区', '298');
INSERT INTO `t_region` VALUES ('2335', '渭城区', '298');
INSERT INTO `t_region` VALUES ('2336', '三原县', '298');
INSERT INTO `t_region` VALUES ('2337', '泾阳县', '298');
INSERT INTO `t_region` VALUES ('2338', '乾县', '298');
INSERT INTO `t_region` VALUES ('2339', '礼泉县', '298');
INSERT INTO `t_region` VALUES ('2340', '永寿县', '298');
INSERT INTO `t_region` VALUES ('2341', '彬县', '298');
INSERT INTO `t_region` VALUES ('2342', '长武县', '298');
INSERT INTO `t_region` VALUES ('2343', '旬邑县', '298');
INSERT INTO `t_region` VALUES ('2344', '淳化县', '298');
INSERT INTO `t_region` VALUES ('2345', '武功县', '298');
INSERT INTO `t_region` VALUES ('2346', '兴平市', '298');
INSERT INTO `t_region` VALUES ('2347', '宝塔区', '299');
INSERT INTO `t_region` VALUES ('2348', '延长县', '299');
INSERT INTO `t_region` VALUES ('2349', '延川县', '299');
INSERT INTO `t_region` VALUES ('2350', '子长县', '299');
INSERT INTO `t_region` VALUES ('2351', '安塞县', '299');
INSERT INTO `t_region` VALUES ('2352', '志丹县', '299');
INSERT INTO `t_region` VALUES ('2353', '吴起县', '299');
INSERT INTO `t_region` VALUES ('2354', '甘泉县', '299');
INSERT INTO `t_region` VALUES ('2355', '富县', '299');
INSERT INTO `t_region` VALUES ('2356', '洛川县', '299');
INSERT INTO `t_region` VALUES ('2357', '宜川县', '299');
INSERT INTO `t_region` VALUES ('2358', '黄龙县', '299');
INSERT INTO `t_region` VALUES ('2359', '黄陵县', '299');
INSERT INTO `t_region` VALUES ('2360', '榆阳区', '300');
INSERT INTO `t_region` VALUES ('2361', '神木县', '300');
INSERT INTO `t_region` VALUES ('2362', '府谷县', '300');
INSERT INTO `t_region` VALUES ('2363', '横山县', '300');
INSERT INTO `t_region` VALUES ('2364', '靖边县', '300');
INSERT INTO `t_region` VALUES ('2365', '定边县', '300');
INSERT INTO `t_region` VALUES ('2366', '绥德县', '300');
INSERT INTO `t_region` VALUES ('2367', '米脂县', '300');
INSERT INTO `t_region` VALUES ('2368', '佳县', '300');
INSERT INTO `t_region` VALUES ('2369', '吴堡县', '300');
INSERT INTO `t_region` VALUES ('2370', '清涧县', '300');
INSERT INTO `t_region` VALUES ('2371', '子洲县', '300');
INSERT INTO `t_region` VALUES ('2372', '临渭区', '301');
INSERT INTO `t_region` VALUES ('2373', '华县', '301');
INSERT INTO `t_region` VALUES ('2374', '潼关县', '301');
INSERT INTO `t_region` VALUES ('2375', '大荔县', '301');
INSERT INTO `t_region` VALUES ('2376', '合阳县', '301');
INSERT INTO `t_region` VALUES ('2377', '澄城县', '301');
INSERT INTO `t_region` VALUES ('2378', '蒲城县', '301');
INSERT INTO `t_region` VALUES ('2379', '白水县', '301');
INSERT INTO `t_region` VALUES ('2380', '富平县', '301');
INSERT INTO `t_region` VALUES ('2381', '韩城市', '301');
INSERT INTO `t_region` VALUES ('2382', '华阴市', '301');
INSERT INTO `t_region` VALUES ('2383', '商州区', '302');
INSERT INTO `t_region` VALUES ('2384', '洛南县', '302');
INSERT INTO `t_region` VALUES ('2385', '丹凤县', '302');
INSERT INTO `t_region` VALUES ('2386', '商南县', '302');
INSERT INTO `t_region` VALUES ('2387', '山阳县', '302');
INSERT INTO `t_region` VALUES ('2388', '镇安县', '302');
INSERT INTO `t_region` VALUES ('2389', '柞水县', '302');
INSERT INTO `t_region` VALUES ('2390', '汉滨区', '303');
INSERT INTO `t_region` VALUES ('2391', '汉阴县', '303');
INSERT INTO `t_region` VALUES ('2392', '石泉县', '303');
INSERT INTO `t_region` VALUES ('2393', '宁陕县', '303');
INSERT INTO `t_region` VALUES ('2394', '紫阳县', '303');
INSERT INTO `t_region` VALUES ('2395', '岚皋县', '303');
INSERT INTO `t_region` VALUES ('2396', '平利县', '303');
INSERT INTO `t_region` VALUES ('2397', '镇坪县', '303');
INSERT INTO `t_region` VALUES ('2398', '旬阳县', '303');
INSERT INTO `t_region` VALUES ('2399', '白河县', '303');
INSERT INTO `t_region` VALUES ('2400', '汉台区', '304');
INSERT INTO `t_region` VALUES ('2401', '南郑县', '304');
INSERT INTO `t_region` VALUES ('2402', '城固县', '304');
INSERT INTO `t_region` VALUES ('2403', '洋县', '304');
INSERT INTO `t_region` VALUES ('2404', '西乡县', '304');
INSERT INTO `t_region` VALUES ('2405', '勉县', '304');
INSERT INTO `t_region` VALUES ('2406', '宁强县', '304');
INSERT INTO `t_region` VALUES ('2407', '略阳县', '304');
INSERT INTO `t_region` VALUES ('2408', '镇巴县', '304');
INSERT INTO `t_region` VALUES ('2409', '留坝县', '304');
INSERT INTO `t_region` VALUES ('2410', '佛坪县', '304');
INSERT INTO `t_region` VALUES ('2411', '渭滨区', '305');
INSERT INTO `t_region` VALUES ('2412', '金台区', '305');
INSERT INTO `t_region` VALUES ('2413', '陈仓区', '305');
INSERT INTO `t_region` VALUES ('2414', '凤翔县', '305');
INSERT INTO `t_region` VALUES ('2415', '岐山县', '305');
INSERT INTO `t_region` VALUES ('2416', '扶风县', '305');
INSERT INTO `t_region` VALUES ('2417', '眉县', '305');
INSERT INTO `t_region` VALUES ('2418', '陇县', '305');
INSERT INTO `t_region` VALUES ('2419', '千阳县', '305');
INSERT INTO `t_region` VALUES ('2420', '麟游县', '305');
INSERT INTO `t_region` VALUES ('2421', '凤县', '305');
INSERT INTO `t_region` VALUES ('2422', '太白县', '305');
INSERT INTO `t_region` VALUES ('2423', '王益区', '306');
INSERT INTO `t_region` VALUES ('2424', '印台区', '306');
INSERT INTO `t_region` VALUES ('2425', '耀州区', '306');
INSERT INTO `t_region` VALUES ('2426', '宜君县', '306');
INSERT INTO `t_region` VALUES ('2427', '港口区', '307');
INSERT INTO `t_region` VALUES ('2428', '防城区', '307');
INSERT INTO `t_region` VALUES ('2429', '上思县', '307');
INSERT INTO `t_region` VALUES ('2430', '东兴市', '307');
INSERT INTO `t_region` VALUES ('2431', '兴宁区', '308');
INSERT INTO `t_region` VALUES ('2432', '青秀区', '308');
INSERT INTO `t_region` VALUES ('2433', '江南区', '308');
INSERT INTO `t_region` VALUES ('2434', '西乡塘区', '308');
INSERT INTO `t_region` VALUES ('2435', '良庆区', '308');
INSERT INTO `t_region` VALUES ('2436', '邕宁区', '308');
INSERT INTO `t_region` VALUES ('2437', '武鸣县', '308');
INSERT INTO `t_region` VALUES ('2438', '隆安县', '308');
INSERT INTO `t_region` VALUES ('2439', '马山县', '308');
INSERT INTO `t_region` VALUES ('2440', '上林县', '308');
INSERT INTO `t_region` VALUES ('2441', '宾阳县', '308');
INSERT INTO `t_region` VALUES ('2442', '横县', '308');
INSERT INTO `t_region` VALUES ('2443', '江洲区', '309');
INSERT INTO `t_region` VALUES ('2444', '扶绥县', '309');
INSERT INTO `t_region` VALUES ('2445', '宁明县', '309');
INSERT INTO `t_region` VALUES ('2446', '龙州县', '309');
INSERT INTO `t_region` VALUES ('2447', '大新县', '309');
INSERT INTO `t_region` VALUES ('2448', '天等县', '309');
INSERT INTO `t_region` VALUES ('2449', '凭祥市', '309');
INSERT INTO `t_region` VALUES ('2450', '兴宾区', '310');
INSERT INTO `t_region` VALUES ('2451', '忻城县', '310');
INSERT INTO `t_region` VALUES ('2452', '象州县', '310');
INSERT INTO `t_region` VALUES ('2453', '武宣县', '310');
INSERT INTO `t_region` VALUES ('2454', '金秀瑶族自治县', '310');
INSERT INTO `t_region` VALUES ('2455', '合山市', '310');
INSERT INTO `t_region` VALUES ('2456', '城中区', '311');
INSERT INTO `t_region` VALUES ('2457', '鱼峰区', '311');
INSERT INTO `t_region` VALUES ('2458', '柳南区', '311');
INSERT INTO `t_region` VALUES ('2459', '柳北区', '311');
INSERT INTO `t_region` VALUES ('2460', '柳江县', '311');
INSERT INTO `t_region` VALUES ('2461', '柳城县', '311');
INSERT INTO `t_region` VALUES ('2462', '鹿寨县', '311');
INSERT INTO `t_region` VALUES ('2463', '融安县', '311');
INSERT INTO `t_region` VALUES ('2464', '融水苗族自治县', '311');
INSERT INTO `t_region` VALUES ('2465', '三江侗族自治县', '311');
INSERT INTO `t_region` VALUES ('2466', '秀峰区', '312');
INSERT INTO `t_region` VALUES ('2467', '叠彩区', '312');
INSERT INTO `t_region` VALUES ('2468', '象山区', '312');
INSERT INTO `t_region` VALUES ('2469', '七星区', '312');
INSERT INTO `t_region` VALUES ('2470', '雁山区', '312');
INSERT INTO `t_region` VALUES ('2471', '阳朔县', '312');
INSERT INTO `t_region` VALUES ('2472', '临桂县', '312');
INSERT INTO `t_region` VALUES ('2473', '灵川县', '312');
INSERT INTO `t_region` VALUES ('2474', '全州县', '312');
INSERT INTO `t_region` VALUES ('2475', '兴安县', '312');
INSERT INTO `t_region` VALUES ('2476', '永福县', '312');
INSERT INTO `t_region` VALUES ('2477', '灌阳县', '312');
INSERT INTO `t_region` VALUES ('2478', '龙胜各族自治县', '312');
INSERT INTO `t_region` VALUES ('2479', '资源县', '312');
INSERT INTO `t_region` VALUES ('2480', '平乐县', '312');
INSERT INTO `t_region` VALUES ('2481', '荔浦县', '312');
INSERT INTO `t_region` VALUES ('2482', '恭城瑶族自治县', '312');
INSERT INTO `t_region` VALUES ('2483', '万秀区', '313');
INSERT INTO `t_region` VALUES ('2484', '碟山区', '313');
INSERT INTO `t_region` VALUES ('2485', '长洲区', '313');
INSERT INTO `t_region` VALUES ('2486', '苍梧县', '313');
INSERT INTO `t_region` VALUES ('2487', '藤县', '313');
INSERT INTO `t_region` VALUES ('2488', '蒙山县', '313');
INSERT INTO `t_region` VALUES ('2489', '岑溪市', '313');
INSERT INTO `t_region` VALUES ('2490', '八步区', '314');
INSERT INTO `t_region` VALUES ('2491', '昭平县', '314');
INSERT INTO `t_region` VALUES ('2492', '钟山县', '314');
INSERT INTO `t_region` VALUES ('2493', '富川瑶族自治县', '314');
INSERT INTO `t_region` VALUES ('2494', '港北区', '315');
INSERT INTO `t_region` VALUES ('2495', '港南区', '315');
INSERT INTO `t_region` VALUES ('2496', '覃塘区', '315');
INSERT INTO `t_region` VALUES ('2497', '平南县', '315');
INSERT INTO `t_region` VALUES ('2498', '桂平市', '315');
INSERT INTO `t_region` VALUES ('2499', '玉州区', '316');
INSERT INTO `t_region` VALUES ('2500', '容县', '316');
INSERT INTO `t_region` VALUES ('2501', '陆川县', '316');
INSERT INTO `t_region` VALUES ('2502', '博白县', '316');
INSERT INTO `t_region` VALUES ('2503', '兴业县', '316');
INSERT INTO `t_region` VALUES ('2504', '北流市', '316');
INSERT INTO `t_region` VALUES ('2505', '右江区', '317');
INSERT INTO `t_region` VALUES ('2506', '田阳县', '317');
INSERT INTO `t_region` VALUES ('2507', '田东县', '317');
INSERT INTO `t_region` VALUES ('2508', '平果县', '317');
INSERT INTO `t_region` VALUES ('2509', '德保县', '317');
INSERT INTO `t_region` VALUES ('2510', '靖西县', '317');
INSERT INTO `t_region` VALUES ('2511', '那坡县', '317');
INSERT INTO `t_region` VALUES ('2512', '凌云县', '317');
INSERT INTO `t_region` VALUES ('2513', '乐业县', '317');
INSERT INTO `t_region` VALUES ('2514', '田林县', '317');
INSERT INTO `t_region` VALUES ('2515', '西林县', '317');
INSERT INTO `t_region` VALUES ('2516', '隆林各族自治县', '317');
INSERT INTO `t_region` VALUES ('2517', '钦南区', '318');
INSERT INTO `t_region` VALUES ('2518', '钦北区', '318');
INSERT INTO `t_region` VALUES ('2519', '灵山县', '318');
INSERT INTO `t_region` VALUES ('2520', '浦北县', '318');
INSERT INTO `t_region` VALUES ('2521', '金城江区', '319');
INSERT INTO `t_region` VALUES ('2522', '南丹县', '319');
INSERT INTO `t_region` VALUES ('2523', '天峨县', '319');
INSERT INTO `t_region` VALUES ('2524', '凤山县', '319');
INSERT INTO `t_region` VALUES ('2525', '东兰县', '319');
INSERT INTO `t_region` VALUES ('2526', '罗城仫佬族自治县', '319');
INSERT INTO `t_region` VALUES ('2527', '环江毛南族自治县', '319');
INSERT INTO `t_region` VALUES ('2528', '巴马瑶族自治县', '319');
INSERT INTO `t_region` VALUES ('2529', '都安瑶族自治县', '319');
INSERT INTO `t_region` VALUES ('2530', '大化瑶族自治县', '319');
INSERT INTO `t_region` VALUES ('2531', '宜州市', '319');
INSERT INTO `t_region` VALUES ('2532', '海城区', '320');
INSERT INTO `t_region` VALUES ('2533', '银海区', '320');
INSERT INTO `t_region` VALUES ('2534', '铁山港区', '320');
INSERT INTO `t_region` VALUES ('2535', '合浦县', '320');
INSERT INTO `t_region` VALUES ('2536', '城关区', '321');
INSERT INTO `t_region` VALUES ('2537', '林周县', '321');
INSERT INTO `t_region` VALUES ('2538', '当雄县', '321');
INSERT INTO `t_region` VALUES ('2539', '尼木县', '321');
INSERT INTO `t_region` VALUES ('2540', '曲水县', '321');
INSERT INTO `t_region` VALUES ('2541', '堆龙德庆县', '321');
INSERT INTO `t_region` VALUES ('2542', '达孜县', '321');
INSERT INTO `t_region` VALUES ('2543', '墨竹工卡县', '321');
INSERT INTO `t_region` VALUES ('2544', '日喀则市', '322');
INSERT INTO `t_region` VALUES ('2545', '南木林县', '322');
INSERT INTO `t_region` VALUES ('2546', '江孜县', '322');
INSERT INTO `t_region` VALUES ('2547', '定日县', '322');
INSERT INTO `t_region` VALUES ('2548', '萨迦县', '322');
INSERT INTO `t_region` VALUES ('2549', '拉孜县', '322');
INSERT INTO `t_region` VALUES ('2550', '昂仁县', '322');
INSERT INTO `t_region` VALUES ('2551', '谢通门县', '322');
INSERT INTO `t_region` VALUES ('2552', '白朗县', '322');
INSERT INTO `t_region` VALUES ('2553', '仁布县', '322');
INSERT INTO `t_region` VALUES ('2554', '康马县', '322');
INSERT INTO `t_region` VALUES ('2555', '定结县', '322');
INSERT INTO `t_region` VALUES ('2556', '仲巴县', '322');
INSERT INTO `t_region` VALUES ('2557', '亚东县', '322');
INSERT INTO `t_region` VALUES ('2558', '吉隆县', '322');
INSERT INTO `t_region` VALUES ('2559', '聂拉木县', '322');
INSERT INTO `t_region` VALUES ('2560', '萨嘎县', '322');
INSERT INTO `t_region` VALUES ('2561', '岗巴县', '322');
INSERT INTO `t_region` VALUES ('2562', '乃东县', '323');
INSERT INTO `t_region` VALUES ('2563', '扎囊县', '323');
INSERT INTO `t_region` VALUES ('2564', '贡嘎县', '323');
INSERT INTO `t_region` VALUES ('2565', '桑日县', '323');
INSERT INTO `t_region` VALUES ('2566', '琼结县', '323');
INSERT INTO `t_region` VALUES ('2567', '曲松县', '323');
INSERT INTO `t_region` VALUES ('2568', '措美县', '323');
INSERT INTO `t_region` VALUES ('2569', '洛扎县', '323');
INSERT INTO `t_region` VALUES ('2570', '加查县', '323');
INSERT INTO `t_region` VALUES ('2571', '隆子县', '323');
INSERT INTO `t_region` VALUES ('2572', '错那县', '323');
INSERT INTO `t_region` VALUES ('2573', '浪卡子县', '323');
INSERT INTO `t_region` VALUES ('2574', '林芝县', '324');
INSERT INTO `t_region` VALUES ('2575', '工布江达县', '324');
INSERT INTO `t_region` VALUES ('2576', '米林县', '324');
INSERT INTO `t_region` VALUES ('2577', '墨脱县', '324');
INSERT INTO `t_region` VALUES ('2578', '波密县', '324');
INSERT INTO `t_region` VALUES ('2579', '察隅县', '324');
INSERT INTO `t_region` VALUES ('2580', '朗县', '324');
INSERT INTO `t_region` VALUES ('2581', '昌都县', '325');
INSERT INTO `t_region` VALUES ('2582', '江达县', '325');
INSERT INTO `t_region` VALUES ('2583', '贡觉县', '325');
INSERT INTO `t_region` VALUES ('2584', '类乌齐县', '325');
INSERT INTO `t_region` VALUES ('2585', '丁青县', '325');
INSERT INTO `t_region` VALUES ('2586', '察雅县', '325');
INSERT INTO `t_region` VALUES ('2587', '八宿县', '325');
INSERT INTO `t_region` VALUES ('2588', '左贡县', '325');
INSERT INTO `t_region` VALUES ('2589', '芒康县', '325');
INSERT INTO `t_region` VALUES ('2590', '洛隆县', '325');
INSERT INTO `t_region` VALUES ('2591', '边坝县', '325');
INSERT INTO `t_region` VALUES ('2592', '那曲县', '326');
INSERT INTO `t_region` VALUES ('2593', '嘉黎县', '326');
INSERT INTO `t_region` VALUES ('2594', '比如县', '326');
INSERT INTO `t_region` VALUES ('2595', '聂荣县', '326');
INSERT INTO `t_region` VALUES ('2596', '安多县', '326');
INSERT INTO `t_region` VALUES ('2597', '申扎县', '326');
INSERT INTO `t_region` VALUES ('2598', '索县', '326');
INSERT INTO `t_region` VALUES ('2599', '班戈县', '326');
INSERT INTO `t_region` VALUES ('2600', '巴青县', '326');
INSERT INTO `t_region` VALUES ('2601', '尼玛县', '326');
INSERT INTO `t_region` VALUES ('2602', '普兰县', '327');
INSERT INTO `t_region` VALUES ('2603', '札达县', '327');
INSERT INTO `t_region` VALUES ('2604', '噶尔县', '327');
INSERT INTO `t_region` VALUES ('2605', '日土县', '327');
INSERT INTO `t_region` VALUES ('2606', '革吉县', '327');
INSERT INTO `t_region` VALUES ('2607', '改则县', '327');
INSERT INTO `t_region` VALUES ('2608', '措勤县', '327');
INSERT INTO `t_region` VALUES ('2609', '兴庆区', '328');
INSERT INTO `t_region` VALUES ('2610', '西夏区', '328');
INSERT INTO `t_region` VALUES ('2611', '金凤区', '328');
INSERT INTO `t_region` VALUES ('2612', '永宁县', '328');
INSERT INTO `t_region` VALUES ('2613', '贺兰县', '328');
INSERT INTO `t_region` VALUES ('2614', '灵武市', '328');
INSERT INTO `t_region` VALUES ('2615', '大武口区', '329');
INSERT INTO `t_region` VALUES ('2616', '惠农区', '329');
INSERT INTO `t_region` VALUES ('2617', '平罗县', '329');
INSERT INTO `t_region` VALUES ('2618', '利通区', '330');
INSERT INTO `t_region` VALUES ('2619', '盐池县', '330');
INSERT INTO `t_region` VALUES ('2620', '同心县', '330');
INSERT INTO `t_region` VALUES ('2621', '青铜峡市', '330');
INSERT INTO `t_region` VALUES ('2622', '原州区', '331');
INSERT INTO `t_region` VALUES ('2623', '西吉县', '331');
INSERT INTO `t_region` VALUES ('2624', '隆德县', '331');
INSERT INTO `t_region` VALUES ('2625', '泾源县', '331');
INSERT INTO `t_region` VALUES ('2626', '彭阳县', '331');
INSERT INTO `t_region` VALUES ('2627', '沙坡头区', '332');
INSERT INTO `t_region` VALUES ('2628', '中宁县', '332');
INSERT INTO `t_region` VALUES ('2629', '海原县', '332');
INSERT INTO `t_region` VALUES ('2630', '塔城市', '333');
INSERT INTO `t_region` VALUES ('2631', '乌苏市', '333');
INSERT INTO `t_region` VALUES ('2632', '额敏县', '333');
INSERT INTO `t_region` VALUES ('2633', '沙湾县', '333');
INSERT INTO `t_region` VALUES ('2634', '托里县', '333');
INSERT INTO `t_region` VALUES ('2635', '裕民县', '333');
INSERT INTO `t_region` VALUES ('2636', '和布克赛尔蒙古自治县', '333');
INSERT INTO `t_region` VALUES ('2637', '哈密市', '334');
INSERT INTO `t_region` VALUES ('2638', '巴里坤哈萨克自治县', '334');
INSERT INTO `t_region` VALUES ('2639', '伊吾县', '334');
INSERT INTO `t_region` VALUES ('2640', '和田市', '335');
INSERT INTO `t_region` VALUES ('2641', '和田县', '335');
INSERT INTO `t_region` VALUES ('2642', '墨玉县', '335');
INSERT INTO `t_region` VALUES ('2643', '皮山县', '335');
INSERT INTO `t_region` VALUES ('2644', '洛浦县', '335');
INSERT INTO `t_region` VALUES ('2645', '策勒县', '335');
INSERT INTO `t_region` VALUES ('2646', '于田县', '335');
INSERT INTO `t_region` VALUES ('2647', '民丰县', '335');
INSERT INTO `t_region` VALUES ('2648', '阿勒泰市', '336');
INSERT INTO `t_region` VALUES ('2649', '布尔津县', '336');
INSERT INTO `t_region` VALUES ('2650', '富蕴县', '336');
INSERT INTO `t_region` VALUES ('2651', '福海县', '336');
INSERT INTO `t_region` VALUES ('2652', '哈巴河县', '336');
INSERT INTO `t_region` VALUES ('2653', '青河县', '336');
INSERT INTO `t_region` VALUES ('2654', '吉木乃县', '336');
INSERT INTO `t_region` VALUES ('2655', '阿图什市', '337');
INSERT INTO `t_region` VALUES ('2656', '阿克陶县', '337');
INSERT INTO `t_region` VALUES ('2657', '阿合奇县', '337');
INSERT INTO `t_region` VALUES ('2658', '乌恰县', '337');
INSERT INTO `t_region` VALUES ('2659', '博乐市', '338');
INSERT INTO `t_region` VALUES ('2660', '精河县', '338');
INSERT INTO `t_region` VALUES ('2661', '温泉县', '338');
INSERT INTO `t_region` VALUES ('2662', '独山子区', '339');
INSERT INTO `t_region` VALUES ('2663', '克拉玛依区', '339');
INSERT INTO `t_region` VALUES ('2664', '白碱滩区', '339');
INSERT INTO `t_region` VALUES ('2665', '乌尔禾区', '339');
INSERT INTO `t_region` VALUES ('2666', '天山区', '340');
INSERT INTO `t_region` VALUES ('2667', '沙依巴克区', '340');
INSERT INTO `t_region` VALUES ('2668', '新市区', '340');
INSERT INTO `t_region` VALUES ('2669', '水磨沟区', '340');
INSERT INTO `t_region` VALUES ('2670', '头屯河区', '340');
INSERT INTO `t_region` VALUES ('2671', '达坂城区', '340');
INSERT INTO `t_region` VALUES ('2672', '米东区', '340');
INSERT INTO `t_region` VALUES ('2673', '乌鲁木齐县', '340');
INSERT INTO `t_region` VALUES ('2674', '昌吉市', '342');
INSERT INTO `t_region` VALUES ('2675', '阜康市', '342');
INSERT INTO `t_region` VALUES ('2676', '呼图壁县', '342');
INSERT INTO `t_region` VALUES ('2677', '玛纳斯县', '342');
INSERT INTO `t_region` VALUES ('2678', '奇台县', '342');
INSERT INTO `t_region` VALUES ('2679', '吉木萨尔县', '342');
INSERT INTO `t_region` VALUES ('2680', '木垒哈萨克自治县', '342');
INSERT INTO `t_region` VALUES ('2681', '吐鲁番市', '344');
INSERT INTO `t_region` VALUES ('2682', '鄯善县', '344');
INSERT INTO `t_region` VALUES ('2683', '托克逊县', '344');
INSERT INTO `t_region` VALUES ('2684', '库尔勒市', '345');
INSERT INTO `t_region` VALUES ('2685', '轮台县', '345');
INSERT INTO `t_region` VALUES ('2686', '尉犁县', '345');
INSERT INTO `t_region` VALUES ('2687', '若羌县', '345');
INSERT INTO `t_region` VALUES ('2688', '且末县', '345');
INSERT INTO `t_region` VALUES ('2689', '焉耆回族自治县', '345');
INSERT INTO `t_region` VALUES ('2690', '和静县', '345');
INSERT INTO `t_region` VALUES ('2691', '和硕县', '345');
INSERT INTO `t_region` VALUES ('2692', '博湖县', '345');
INSERT INTO `t_region` VALUES ('2693', '阿克苏市', '346');
INSERT INTO `t_region` VALUES ('2694', '温宿县', '346');
INSERT INTO `t_region` VALUES ('2695', '库车县', '346');
INSERT INTO `t_region` VALUES ('2696', '沙雅县', '346');
INSERT INTO `t_region` VALUES ('2697', '新和县', '346');
INSERT INTO `t_region` VALUES ('2698', '拜城县', '346');
INSERT INTO `t_region` VALUES ('2699', '乌什县', '346');
INSERT INTO `t_region` VALUES ('2700', '阿瓦提县', '346');
INSERT INTO `t_region` VALUES ('2701', '柯坪县', '346');
INSERT INTO `t_region` VALUES ('2702', '喀什市', '348');
INSERT INTO `t_region` VALUES ('2703', '疏附县', '348');
INSERT INTO `t_region` VALUES ('2704', '疏勒县', '348');
INSERT INTO `t_region` VALUES ('2705', '英吉沙县', '348');
INSERT INTO `t_region` VALUES ('2706', '泽普县', '348');
INSERT INTO `t_region` VALUES ('2707', '莎车县', '348');
INSERT INTO `t_region` VALUES ('2708', '叶城县', '348');
INSERT INTO `t_region` VALUES ('2709', '麦盖提县', '348');
INSERT INTO `t_region` VALUES ('2710', '岳普湖县', '348');
INSERT INTO `t_region` VALUES ('2711', '伽师县', '348');
INSERT INTO `t_region` VALUES ('2712', '巴楚县', '348');
INSERT INTO `t_region` VALUES ('2713', '塔什库尔干塔吉克自治县', '348');
INSERT INTO `t_region` VALUES ('2714', '伊宁市', '350');
INSERT INTO `t_region` VALUES ('2715', '奎屯市', '350');
INSERT INTO `t_region` VALUES ('2716', '伊宁县', '350');
INSERT INTO `t_region` VALUES ('2717', '察布查尔锡伯自治县', '350');
INSERT INTO `t_region` VALUES ('2718', '霍城县', '350');
INSERT INTO `t_region` VALUES ('2719', '巩留县', '350');
INSERT INTO `t_region` VALUES ('2720', '新源县', '350');
INSERT INTO `t_region` VALUES ('2721', '昭苏县', '350');
INSERT INTO `t_region` VALUES ('2722', '特克斯县', '350');
INSERT INTO `t_region` VALUES ('2723', '尼勒克县', '350');
INSERT INTO `t_region` VALUES ('2724', '海拉尔区', '351');
INSERT INTO `t_region` VALUES ('2725', '阿荣旗', '351');
INSERT INTO `t_region` VALUES ('2726', '莫力达瓦达斡尔族自治旗', '351');
INSERT INTO `t_region` VALUES ('2727', '鄂伦春自治旗', '351');
INSERT INTO `t_region` VALUES ('2728', '鄂温克族自治旗', '351');
INSERT INTO `t_region` VALUES ('2729', '陈巴尔虎旗', '351');
INSERT INTO `t_region` VALUES ('2730', '新巴尔虎左旗', '351');
INSERT INTO `t_region` VALUES ('2731', '新巴尔虎右旗', '351');
INSERT INTO `t_region` VALUES ('2732', '满洲里市', '351');
INSERT INTO `t_region` VALUES ('2733', '牙克石市', '351');
INSERT INTO `t_region` VALUES ('2734', '扎兰屯市', '351');
INSERT INTO `t_region` VALUES ('2735', '额尔古纳市', '351');
INSERT INTO `t_region` VALUES ('2736', '根河市', '351');
INSERT INTO `t_region` VALUES ('2737', '新城区', '352');
INSERT INTO `t_region` VALUES ('2738', '回民区', '352');
INSERT INTO `t_region` VALUES ('2739', '玉泉区', '352');
INSERT INTO `t_region` VALUES ('2740', '赛罕区', '352');
INSERT INTO `t_region` VALUES ('2741', '土默特左旗', '352');
INSERT INTO `t_region` VALUES ('2742', '托克托县', '352');
INSERT INTO `t_region` VALUES ('2743', '和林格尔县', '352');
INSERT INTO `t_region` VALUES ('2744', '清水河县', '352');
INSERT INTO `t_region` VALUES ('2745', '武川县', '352');
INSERT INTO `t_region` VALUES ('2746', '东河区', '353');
INSERT INTO `t_region` VALUES ('2747', '昆都仑区', '353');
INSERT INTO `t_region` VALUES ('2748', '青山区', '353');
INSERT INTO `t_region` VALUES ('2749', '石拐区', '353');
INSERT INTO `t_region` VALUES ('2750', '白云鄂博矿区', '353');
INSERT INTO `t_region` VALUES ('2751', '九原区', '353');
INSERT INTO `t_region` VALUES ('2752', '土默特右旗', '353');
INSERT INTO `t_region` VALUES ('2753', '固阳县', '353');
INSERT INTO `t_region` VALUES ('2754', '达尔罕茂明安联合旗', '353');
INSERT INTO `t_region` VALUES ('2755', '海勃湾区', '354');
INSERT INTO `t_region` VALUES ('2756', '海南区', '354');
INSERT INTO `t_region` VALUES ('2757', '乌达区', '354');
INSERT INTO `t_region` VALUES ('2758', '集宁区', '355');
INSERT INTO `t_region` VALUES ('2759', '卓资县', '355');
INSERT INTO `t_region` VALUES ('2760', '化德县', '355');
INSERT INTO `t_region` VALUES ('2761', '商都县', '355');
INSERT INTO `t_region` VALUES ('2762', '兴和县', '355');
INSERT INTO `t_region` VALUES ('2763', '凉城县', '355');
INSERT INTO `t_region` VALUES ('2764', '察哈尔右翼前旗', '355');
INSERT INTO `t_region` VALUES ('2765', '察哈尔右翼中旗', '355');
INSERT INTO `t_region` VALUES ('2766', '察哈尔右翼后旗', '355');
INSERT INTO `t_region` VALUES ('2767', '四子王旗', '355');
INSERT INTO `t_region` VALUES ('2768', '丰镇市', '355');
INSERT INTO `t_region` VALUES ('2769', '科尔沁区', '356');
INSERT INTO `t_region` VALUES ('2770', '科尔沁左翼中旗', '356');
INSERT INTO `t_region` VALUES ('2771', '科尔沁左翼后旗', '356');
INSERT INTO `t_region` VALUES ('2772', '开鲁县', '356');
INSERT INTO `t_region` VALUES ('2773', '库伦旗', '356');
INSERT INTO `t_region` VALUES ('2774', '奈曼旗', '356');
INSERT INTO `t_region` VALUES ('2775', '扎鲁特旗', '356');
INSERT INTO `t_region` VALUES ('2776', '霍林郭勒市', '356');
INSERT INTO `t_region` VALUES ('2777', '红山区', '357');
INSERT INTO `t_region` VALUES ('2778', '元宝山区', '357');
INSERT INTO `t_region` VALUES ('2779', '松山区', '357');
INSERT INTO `t_region` VALUES ('2780', '阿鲁科尔沁旗', '357');
INSERT INTO `t_region` VALUES ('2781', '巴林左旗', '357');
INSERT INTO `t_region` VALUES ('2782', '巴林右旗', '357');
INSERT INTO `t_region` VALUES ('2783', '林西县', '357');
INSERT INTO `t_region` VALUES ('2784', '克什克腾旗', '357');
INSERT INTO `t_region` VALUES ('2785', '翁牛特旗', '357');
INSERT INTO `t_region` VALUES ('2786', '喀喇沁旗', '357');
INSERT INTO `t_region` VALUES ('2787', '宁城县', '357');
INSERT INTO `t_region` VALUES ('2788', '敖汉旗', '357');
INSERT INTO `t_region` VALUES ('2789', '东胜区', '358');
INSERT INTO `t_region` VALUES ('2790', '达拉特旗', '358');
INSERT INTO `t_region` VALUES ('2791', '准格尔旗', '358');
INSERT INTO `t_region` VALUES ('2792', '鄂托克前旗', '358');
INSERT INTO `t_region` VALUES ('2793', '鄂托克旗', '358');
INSERT INTO `t_region` VALUES ('2794', '杭锦旗', '358');
INSERT INTO `t_region` VALUES ('2795', '乌审旗', '358');
INSERT INTO `t_region` VALUES ('2796', '伊金霍洛旗', '358');
INSERT INTO `t_region` VALUES ('2797', '临河区', '359');
INSERT INTO `t_region` VALUES ('2798', '五原县', '359');
INSERT INTO `t_region` VALUES ('2799', '磴口县', '359');
INSERT INTO `t_region` VALUES ('2800', '乌拉特前旗', '359');
INSERT INTO `t_region` VALUES ('2801', '乌拉特中旗', '359');
INSERT INTO `t_region` VALUES ('2802', '乌拉特后旗', '359');
INSERT INTO `t_region` VALUES ('2803', '杭锦后旗', '359');
INSERT INTO `t_region` VALUES ('2804', '二连浩特市', '360');
INSERT INTO `t_region` VALUES ('2805', '锡林浩特市', '360');
INSERT INTO `t_region` VALUES ('2806', '阿巴嘎旗', '360');
INSERT INTO `t_region` VALUES ('2807', '苏尼特左旗', '360');
INSERT INTO `t_region` VALUES ('2808', '苏尼特右旗', '360');
INSERT INTO `t_region` VALUES ('2809', '东乌珠穆沁旗', '360');
INSERT INTO `t_region` VALUES ('2810', '西乌珠穆沁旗', '360');
INSERT INTO `t_region` VALUES ('2811', '太仆寺旗', '360');
INSERT INTO `t_region` VALUES ('2812', '镶黄旗', '360');
INSERT INTO `t_region` VALUES ('2813', '正镶白旗', '360');
INSERT INTO `t_region` VALUES ('2814', '正蓝旗', '360');
INSERT INTO `t_region` VALUES ('2815', '多伦县', '360');
INSERT INTO `t_region` VALUES ('2816', '乌兰浩特市', '361');
INSERT INTO `t_region` VALUES ('2817', '阿尔山市', '361');
INSERT INTO `t_region` VALUES ('2818', '科尔沁右翼前旗', '361');
INSERT INTO `t_region` VALUES ('2819', '科尔沁右翼中旗', '361');
INSERT INTO `t_region` VALUES ('2820', '扎赉特旗', '361');
INSERT INTO `t_region` VALUES ('2821', '突泉县', '361');
INSERT INTO `t_region` VALUES ('2822', '阿拉善左旗', '362');
INSERT INTO `t_region` VALUES ('2823', '阿拉善右旗', '362');
INSERT INTO `t_region` VALUES ('2824', '额济纳旗', '362');
INSERT INTO `t_region` VALUES ('2825', '中西区', '386');
INSERT INTO `t_region` VALUES ('2826', '湾仔区', '386');
INSERT INTO `t_region` VALUES ('2827', '东区', '386');
INSERT INTO `t_region` VALUES ('2828', '新界', '386');
INSERT INTO `t_region` VALUES ('2829', '九龙城区', '387');
INSERT INTO `t_region` VALUES ('2830', '油尖旺区', '387');
INSERT INTO `t_region` VALUES ('2831', '深水埗区', '387');
INSERT INTO `t_region` VALUES ('2832', '黄大仙区', '387');
INSERT INTO `t_region` VALUES ('2833', '观塘区', '387');
INSERT INTO `t_region` VALUES ('2834', '北区', '388');
INSERT INTO `t_region` VALUES ('2835', '大埔区', '388');
INSERT INTO `t_region` VALUES ('2836', '沙田区', '388');
INSERT INTO `t_region` VALUES ('2837', '西贡区', '388');
INSERT INTO `t_region` VALUES ('2838', '元朗区', '388');
INSERT INTO `t_region` VALUES ('2839', '屯门区', '388');
INSERT INTO `t_region` VALUES ('2840', '荃湾区', '388');
INSERT INTO `t_region` VALUES ('2841', '葵青区', '388');
INSERT INTO `t_region` VALUES ('2842', '离岛区', '388');
INSERT INTO `t_region` VALUES ('2843', '中正区', '364');
INSERT INTO `t_region` VALUES ('2844', '大同区', '364');
INSERT INTO `t_region` VALUES ('2845', '中山区', '364');
INSERT INTO `t_region` VALUES ('2846', '松山区', '364');
INSERT INTO `t_region` VALUES ('2847', '大安区', '364');
INSERT INTO `t_region` VALUES ('2848', '万华区', '364');
INSERT INTO `t_region` VALUES ('2849', '信义区', '364');
INSERT INTO `t_region` VALUES ('2850', '士林区', '364');
INSERT INTO `t_region` VALUES ('2851', '北投区', '364');
INSERT INTO `t_region` VALUES ('2852', '内湖区', '364');
INSERT INTO `t_region` VALUES ('2853', '南港区', '364');
INSERT INTO `t_region` VALUES ('2854', '文山区', '364');
INSERT INTO `t_region` VALUES ('2855', '新兴区', '365');
INSERT INTO `t_region` VALUES ('2856', '前金区', '365');
INSERT INTO `t_region` VALUES ('2857', '芩雅区', '365');
INSERT INTO `t_region` VALUES ('2858', '盐埕区', '365');
INSERT INTO `t_region` VALUES ('2859', '鼓山区', '365');
INSERT INTO `t_region` VALUES ('2860', '旗津区', '365');
INSERT INTO `t_region` VALUES ('2861', '前镇区', '365');
INSERT INTO `t_region` VALUES ('2862', '三民区', '365');
INSERT INTO `t_region` VALUES ('2863', '左营区', '365');
INSERT INTO `t_region` VALUES ('2864', '楠梓区', '365');
INSERT INTO `t_region` VALUES ('2865', '小港区', '365');
INSERT INTO `t_region` VALUES ('2866', '苓雅区', '365');
INSERT INTO `t_region` VALUES ('2867', '仁武区', '365');
INSERT INTO `t_region` VALUES ('2868', '大社区', '365');
INSERT INTO `t_region` VALUES ('2869', '冈山区', '365');
INSERT INTO `t_region` VALUES ('2870', '路竹区', '365');
INSERT INTO `t_region` VALUES ('2871', '阿莲区', '365');
INSERT INTO `t_region` VALUES ('2872', '田寮区', '365');
INSERT INTO `t_region` VALUES ('2873', '燕巢区', '365');
INSERT INTO `t_region` VALUES ('2874', '桥头区', '365');
INSERT INTO `t_region` VALUES ('2875', '梓官区', '365');
INSERT INTO `t_region` VALUES ('2876', '弥陀区', '365');
INSERT INTO `t_region` VALUES ('2877', '永安区', '365');
INSERT INTO `t_region` VALUES ('2878', '湖内区', '365');
INSERT INTO `t_region` VALUES ('2879', '凤山区', '365');
INSERT INTO `t_region` VALUES ('2880', '大寮区', '365');
INSERT INTO `t_region` VALUES ('2881', '林园区', '365');
INSERT INTO `t_region` VALUES ('2882', '鸟松区', '365');
INSERT INTO `t_region` VALUES ('2883', '大树区', '365');
INSERT INTO `t_region` VALUES ('2884', '旗山区', '365');
INSERT INTO `t_region` VALUES ('2885', '美浓区', '365');
INSERT INTO `t_region` VALUES ('2886', '六龟区', '365');
INSERT INTO `t_region` VALUES ('2887', '内门区', '365');
INSERT INTO `t_region` VALUES ('2888', '杉林区', '365');
INSERT INTO `t_region` VALUES ('2889', '甲仙区', '365');
INSERT INTO `t_region` VALUES ('2890', '桃源区', '365');
INSERT INTO `t_region` VALUES ('2891', '那玛夏区', '365');
INSERT INTO `t_region` VALUES ('2892', '茂林区', '365');
INSERT INTO `t_region` VALUES ('2893', '茄萣区', '365');
INSERT INTO `t_region` VALUES ('2894', '中西区', '366');
INSERT INTO `t_region` VALUES ('2895', '东区', '366');
INSERT INTO `t_region` VALUES ('2896', '南区', '366');
INSERT INTO `t_region` VALUES ('2897', '北区', '366');
INSERT INTO `t_region` VALUES ('2898', '安平区', '366');
INSERT INTO `t_region` VALUES ('2899', '安南区', '366');
INSERT INTO `t_region` VALUES ('2900', '永康区', '366');
INSERT INTO `t_region` VALUES ('2901', '归仁区', '366');
INSERT INTO `t_region` VALUES ('2902', '新化区', '366');
INSERT INTO `t_region` VALUES ('2903', '左镇区', '366');
INSERT INTO `t_region` VALUES ('2904', '玉井区', '366');
INSERT INTO `t_region` VALUES ('2905', '楠西区', '366');
INSERT INTO `t_region` VALUES ('2906', '南化区', '366');
INSERT INTO `t_region` VALUES ('2907', '仁德区', '366');
INSERT INTO `t_region` VALUES ('2908', '关庙区', '366');
INSERT INTO `t_region` VALUES ('2909', '龙崎区', '366');
INSERT INTO `t_region` VALUES ('2910', '官田区', '366');
INSERT INTO `t_region` VALUES ('2911', '麻豆区', '366');
INSERT INTO `t_region` VALUES ('2912', '佳里区', '366');
INSERT INTO `t_region` VALUES ('2913', '西港区', '366');
INSERT INTO `t_region` VALUES ('2914', '七股区', '366');
INSERT INTO `t_region` VALUES ('2915', '将军区', '366');
INSERT INTO `t_region` VALUES ('2916', '学甲区', '366');
INSERT INTO `t_region` VALUES ('2917', '北门区', '366');
INSERT INTO `t_region` VALUES ('2918', '新营区', '366');
INSERT INTO `t_region` VALUES ('2919', '后壁区', '366');
INSERT INTO `t_region` VALUES ('2920', '白河区', '366');
INSERT INTO `t_region` VALUES ('2921', '东山区', '366');
INSERT INTO `t_region` VALUES ('2922', '六甲区', '366');
INSERT INTO `t_region` VALUES ('2923', '下营区', '366');
INSERT INTO `t_region` VALUES ('2924', '柳营区', '366');
INSERT INTO `t_region` VALUES ('2925', '盐水区', '366');
INSERT INTO `t_region` VALUES ('2926', '善化区', '366');
INSERT INTO `t_region` VALUES ('2927', '大内区', '366');
INSERT INTO `t_region` VALUES ('2928', '山上区', '366');
INSERT INTO `t_region` VALUES ('2929', '新市区', '366');
INSERT INTO `t_region` VALUES ('2930', '安定区', '366');
INSERT INTO `t_region` VALUES ('2931', '中区', '367');
INSERT INTO `t_region` VALUES ('2932', '东区', '367');
INSERT INTO `t_region` VALUES ('2933', '南区', '367');
INSERT INTO `t_region` VALUES ('2934', '西区', '367');
INSERT INTO `t_region` VALUES ('2935', '北区', '367');
INSERT INTO `t_region` VALUES ('2936', '北屯区', '367');
INSERT INTO `t_region` VALUES ('2937', '西屯区', '367');
INSERT INTO `t_region` VALUES ('2938', '南屯区', '367');
INSERT INTO `t_region` VALUES ('2939', '太平区', '367');
INSERT INTO `t_region` VALUES ('2940', '大里区', '367');
INSERT INTO `t_region` VALUES ('2941', '雾峰区', '367');
INSERT INTO `t_region` VALUES ('2942', '乌日区', '367');
INSERT INTO `t_region` VALUES ('2943', '丰原区', '367');
INSERT INTO `t_region` VALUES ('2944', '后里区', '367');
INSERT INTO `t_region` VALUES ('2945', '石冈区', '367');
INSERT INTO `t_region` VALUES ('2946', '东势区', '367');
INSERT INTO `t_region` VALUES ('2947', '和平区', '367');
INSERT INTO `t_region` VALUES ('2948', '新社区', '367');
INSERT INTO `t_region` VALUES ('2949', '潭子区', '367');
INSERT INTO `t_region` VALUES ('2950', '大雅区', '367');
INSERT INTO `t_region` VALUES ('2951', '神冈区', '367');
INSERT INTO `t_region` VALUES ('2952', '大肚区', '367');
INSERT INTO `t_region` VALUES ('2953', '沙鹿区', '367');
INSERT INTO `t_region` VALUES ('2954', '龙井区', '367');
INSERT INTO `t_region` VALUES ('2955', '梧栖区', '367');
INSERT INTO `t_region` VALUES ('2956', '清水区', '367');
INSERT INTO `t_region` VALUES ('2957', '大甲区', '367');
INSERT INTO `t_region` VALUES ('2958', '外埔区', '367');
INSERT INTO `t_region` VALUES ('2959', '大安区', '367');
INSERT INTO `t_region` VALUES ('2960', '金沙镇', '368');
INSERT INTO `t_region` VALUES ('2961', '金湖镇', '368');
INSERT INTO `t_region` VALUES ('2962', '金宁乡', '368');
INSERT INTO `t_region` VALUES ('2963', '金城镇', '368');
INSERT INTO `t_region` VALUES ('2964', '烈屿乡', '368');
INSERT INTO `t_region` VALUES ('2965', '乌坵乡', '368');
INSERT INTO `t_region` VALUES ('2966', '南投市', '369');
INSERT INTO `t_region` VALUES ('2967', '中寮乡', '369');
INSERT INTO `t_region` VALUES ('2968', '草屯镇', '369');
INSERT INTO `t_region` VALUES ('2969', '国姓乡', '369');
INSERT INTO `t_region` VALUES ('2970', '埔里镇', '369');
INSERT INTO `t_region` VALUES ('2971', '仁爱乡', '369');
INSERT INTO `t_region` VALUES ('2972', '名间乡', '369');
INSERT INTO `t_region` VALUES ('2973', '集集镇', '369');
INSERT INTO `t_region` VALUES ('2974', '水里乡', '369');
INSERT INTO `t_region` VALUES ('2975', '鱼池乡', '369');
INSERT INTO `t_region` VALUES ('2976', '信义乡', '369');
INSERT INTO `t_region` VALUES ('2977', '竹山镇', '369');
INSERT INTO `t_region` VALUES ('2978', '鹿谷乡', '369');
INSERT INTO `t_region` VALUES ('2979', '仁爱区', '370');
INSERT INTO `t_region` VALUES ('2980', '信义区', '370');
INSERT INTO `t_region` VALUES ('2981', '中正区', '370');
INSERT INTO `t_region` VALUES ('2982', '中山区', '370');
INSERT INTO `t_region` VALUES ('2983', '安乐区', '370');
INSERT INTO `t_region` VALUES ('2984', '暖暖区', '370');
INSERT INTO `t_region` VALUES ('2985', '七堵区', '370');
INSERT INTO `t_region` VALUES ('2986', '东区', '371');
INSERT INTO `t_region` VALUES ('2987', '北区', '371');
INSERT INTO `t_region` VALUES ('2988', '香山区', '371');
INSERT INTO `t_region` VALUES ('2989', '东区', '372');
INSERT INTO `t_region` VALUES ('2990', '西区', '372');
INSERT INTO `t_region` VALUES ('2991', '万里区', '373');
INSERT INTO `t_region` VALUES ('2992', '金山区', '373');
INSERT INTO `t_region` VALUES ('2993', '板桥区', '373');
INSERT INTO `t_region` VALUES ('2994', '汐止区', '373');
INSERT INTO `t_region` VALUES ('2995', '深坑区', '373');
INSERT INTO `t_region` VALUES ('2996', '石碇区', '373');
INSERT INTO `t_region` VALUES ('2997', '瑞芳区', '373');
INSERT INTO `t_region` VALUES ('2998', '平溪区', '373');
INSERT INTO `t_region` VALUES ('2999', '双溪区', '373');
INSERT INTO `t_region` VALUES ('3000', '贡寮区', '373');
INSERT INTO `t_region` VALUES ('3001', '新店区', '373');
INSERT INTO `t_region` VALUES ('3002', '坪林区', '373');
INSERT INTO `t_region` VALUES ('3003', '乌来区', '373');
INSERT INTO `t_region` VALUES ('3004', '永和区', '373');
INSERT INTO `t_region` VALUES ('3005', '中和区', '373');
INSERT INTO `t_region` VALUES ('3006', '土城区', '373');
INSERT INTO `t_region` VALUES ('3007', '三峡区', '373');
INSERT INTO `t_region` VALUES ('3008', '树林区', '373');
INSERT INTO `t_region` VALUES ('3009', '莺歌区', '373');
INSERT INTO `t_region` VALUES ('3010', '三重区', '373');
INSERT INTO `t_region` VALUES ('3011', '新庄区', '373');
INSERT INTO `t_region` VALUES ('3012', '泰山区', '373');
INSERT INTO `t_region` VALUES ('3013', '林口区', '373');
INSERT INTO `t_region` VALUES ('3014', '芦洲区', '373');
INSERT INTO `t_region` VALUES ('3015', '五股区', '373');
INSERT INTO `t_region` VALUES ('3016', '八里区', '373');
INSERT INTO `t_region` VALUES ('3017', '淡水区', '373');
INSERT INTO `t_region` VALUES ('3018', '三芝区', '373');
INSERT INTO `t_region` VALUES ('3019', '石门区', '373');
INSERT INTO `t_region` VALUES ('3020', '宜兰市', '374');
INSERT INTO `t_region` VALUES ('3021', '头城镇', '374');
INSERT INTO `t_region` VALUES ('3022', '礁溪乡', '374');
INSERT INTO `t_region` VALUES ('3023', '壮围乡', '374');
INSERT INTO `t_region` VALUES ('3024', '员山乡', '374');
INSERT INTO `t_region` VALUES ('3025', '罗东镇', '374');
INSERT INTO `t_region` VALUES ('3026', '三星乡', '374');
INSERT INTO `t_region` VALUES ('3027', '大同乡', '374');
INSERT INTO `t_region` VALUES ('3028', '五结乡', '374');
INSERT INTO `t_region` VALUES ('3029', '冬山乡', '374');
INSERT INTO `t_region` VALUES ('3030', '苏澳镇', '374');
INSERT INTO `t_region` VALUES ('3031', '南澳乡', '374');
INSERT INTO `t_region` VALUES ('3032', '钓鱼台', '374');
INSERT INTO `t_region` VALUES ('3033', '竹北市', '375');
INSERT INTO `t_region` VALUES ('3034', '湖口乡', '375');
INSERT INTO `t_region` VALUES ('3035', '新丰乡', '375');
INSERT INTO `t_region` VALUES ('3036', '新埔镇', '375');
INSERT INTO `t_region` VALUES ('3037', '关西镇', '375');
INSERT INTO `t_region` VALUES ('3038', '芎林乡', '375');
INSERT INTO `t_region` VALUES ('3039', '宝山乡', '375');
INSERT INTO `t_region` VALUES ('3040', '竹东镇', '375');
INSERT INTO `t_region` VALUES ('3041', '五峰乡', '375');
INSERT INTO `t_region` VALUES ('3042', '横山乡', '375');
INSERT INTO `t_region` VALUES ('3043', '尖石乡', '375');
INSERT INTO `t_region` VALUES ('3044', '北埔乡', '375');
INSERT INTO `t_region` VALUES ('3045', '峨眉乡', '375');
INSERT INTO `t_region` VALUES ('3046', '中坜市', '376');
INSERT INTO `t_region` VALUES ('3047', '平镇市', '376');
INSERT INTO `t_region` VALUES ('3048', '龙潭乡', '376');
INSERT INTO `t_region` VALUES ('3049', '杨梅市', '376');
INSERT INTO `t_region` VALUES ('3050', '新屋乡', '376');
INSERT INTO `t_region` VALUES ('3051', '观音乡', '376');
INSERT INTO `t_region` VALUES ('3052', '桃园市', '376');
INSERT INTO `t_region` VALUES ('3053', '龟山乡', '376');
INSERT INTO `t_region` VALUES ('3054', '八德市', '376');
INSERT INTO `t_region` VALUES ('3055', '大溪镇', '376');
INSERT INTO `t_region` VALUES ('3056', '复兴乡', '376');
INSERT INTO `t_region` VALUES ('3057', '大园乡', '376');
INSERT INTO `t_region` VALUES ('3058', '芦竹乡', '376');
INSERT INTO `t_region` VALUES ('3059', '竹南镇', '377');
INSERT INTO `t_region` VALUES ('3060', '头份镇', '377');
INSERT INTO `t_region` VALUES ('3061', '三湾乡', '377');
INSERT INTO `t_region` VALUES ('3062', '南庄乡', '377');
INSERT INTO `t_region` VALUES ('3063', '狮潭乡', '377');
INSERT INTO `t_region` VALUES ('3064', '后龙镇', '377');
INSERT INTO `t_region` VALUES ('3065', '通霄镇', '377');
INSERT INTO `t_region` VALUES ('3066', '苑里镇', '377');
INSERT INTO `t_region` VALUES ('3067', '苗栗市', '377');
INSERT INTO `t_region` VALUES ('3068', '造桥乡', '377');
INSERT INTO `t_region` VALUES ('3069', '头屋乡', '377');
INSERT INTO `t_region` VALUES ('3070', '公馆乡', '377');
INSERT INTO `t_region` VALUES ('3071', '大湖乡', '377');
INSERT INTO `t_region` VALUES ('3072', '泰安乡', '377');
INSERT INTO `t_region` VALUES ('3073', '铜锣乡', '377');
INSERT INTO `t_region` VALUES ('3074', '三义乡', '377');
INSERT INTO `t_region` VALUES ('3075', '西湖乡', '377');
INSERT INTO `t_region` VALUES ('3076', '卓兰镇', '377');
INSERT INTO `t_region` VALUES ('3077', '彰化市', '378');
INSERT INTO `t_region` VALUES ('3078', '芬园乡', '378');
INSERT INTO `t_region` VALUES ('3079', '花坛乡', '378');
INSERT INTO `t_region` VALUES ('3080', '秀水乡', '378');
INSERT INTO `t_region` VALUES ('3081', '鹿港镇', '378');
INSERT INTO `t_region` VALUES ('3082', '福兴乡', '378');
INSERT INTO `t_region` VALUES ('3083', '线西乡', '378');
INSERT INTO `t_region` VALUES ('3084', '和美镇', '378');
INSERT INTO `t_region` VALUES ('3085', '伸港乡', '378');
INSERT INTO `t_region` VALUES ('3086', '造桥乡', '378');
INSERT INTO `t_region` VALUES ('3087', '头屋乡', '378');
INSERT INTO `t_region` VALUES ('3088', '员林镇', '378');
INSERT INTO `t_region` VALUES ('3089', '社头乡', '378');
INSERT INTO `t_region` VALUES ('3090', '永靖乡', '378');
INSERT INTO `t_region` VALUES ('3091', '埔心乡', '378');
INSERT INTO `t_region` VALUES ('3092', '溪湖镇', '378');
INSERT INTO `t_region` VALUES ('3093', '大村乡', '378');
INSERT INTO `t_region` VALUES ('3094', '埔盐乡', '378');
INSERT INTO `t_region` VALUES ('3095', '田中镇', '378');
INSERT INTO `t_region` VALUES ('3096', '北斗镇', '378');
INSERT INTO `t_region` VALUES ('3097', '田尾乡', '378');
INSERT INTO `t_region` VALUES ('3098', '埤头乡', '378');
INSERT INTO `t_region` VALUES ('3099', '溪州乡', '378');
INSERT INTO `t_region` VALUES ('3100', '竹塘乡', '378');
INSERT INTO `t_region` VALUES ('3101', '二林镇', '378');
INSERT INTO `t_region` VALUES ('3102', '大城乡', '378');
INSERT INTO `t_region` VALUES ('3103', '芳苑乡', '378');
INSERT INTO `t_region` VALUES ('3104', '二水乡', '378');
INSERT INTO `t_region` VALUES ('3105', '番路乡', '379');
INSERT INTO `t_region` VALUES ('3106', '梅山乡', '379');
INSERT INTO `t_region` VALUES ('3107', '竹崎乡', '379');
INSERT INTO `t_region` VALUES ('3108', '阿里山乡', '379');
INSERT INTO `t_region` VALUES ('3109', '中埔乡', '379');
INSERT INTO `t_region` VALUES ('3110', '大埔乡', '379');
INSERT INTO `t_region` VALUES ('3111', '水上乡', '379');
INSERT INTO `t_region` VALUES ('3112', '鹿草乡', '379');
INSERT INTO `t_region` VALUES ('3113', '太保市', '379');
INSERT INTO `t_region` VALUES ('3114', '朴子市', '379');
INSERT INTO `t_region` VALUES ('3115', '东石乡', '379');
INSERT INTO `t_region` VALUES ('3116', '六脚乡', '379');
INSERT INTO `t_region` VALUES ('3117', '新港乡', '379');
INSERT INTO `t_region` VALUES ('3118', '民雄乡', '379');
INSERT INTO `t_region` VALUES ('3119', '大林镇', '379');
INSERT INTO `t_region` VALUES ('3120', '溪口乡', '379');
INSERT INTO `t_region` VALUES ('3121', '义竹乡', '379');
INSERT INTO `t_region` VALUES ('3122', '布袋镇', '379');
INSERT INTO `t_region` VALUES ('3123', '斗南镇', '380');
INSERT INTO `t_region` VALUES ('3124', '大埤乡', '380');
INSERT INTO `t_region` VALUES ('3125', '虎尾镇', '380');
INSERT INTO `t_region` VALUES ('3126', '土库镇', '380');
INSERT INTO `t_region` VALUES ('3127', '褒忠乡', '380');
INSERT INTO `t_region` VALUES ('3128', '东势乡', '380');
INSERT INTO `t_region` VALUES ('3129', '台西乡', '380');
INSERT INTO `t_region` VALUES ('3130', '仑背乡', '380');
INSERT INTO `t_region` VALUES ('3131', '麦寮乡', '380');
INSERT INTO `t_region` VALUES ('3132', '斗六市', '380');
INSERT INTO `t_region` VALUES ('3133', '林内乡', '380');
INSERT INTO `t_region` VALUES ('3134', '古坑乡', '380');
INSERT INTO `t_region` VALUES ('3135', '莿桐乡', '380');
INSERT INTO `t_region` VALUES ('3136', '西螺镇', '380');
INSERT INTO `t_region` VALUES ('3137', '二仑乡', '380');
INSERT INTO `t_region` VALUES ('3138', '北港镇', '380');
INSERT INTO `t_region` VALUES ('3139', '水林乡', '380');
INSERT INTO `t_region` VALUES ('3140', '口湖乡', '380');
INSERT INTO `t_region` VALUES ('3141', '四湖乡', '380');
INSERT INTO `t_region` VALUES ('3142', '元长乡', '380');
INSERT INTO `t_region` VALUES ('3143', '屏东市', '381');
INSERT INTO `t_region` VALUES ('3144', '三地门乡', '381');
INSERT INTO `t_region` VALUES ('3145', '雾台乡', '381');
INSERT INTO `t_region` VALUES ('3146', '玛家乡', '381');
INSERT INTO `t_region` VALUES ('3147', '九如乡', '381');
INSERT INTO `t_region` VALUES ('3148', '里港乡', '381');
INSERT INTO `t_region` VALUES ('3149', '高树乡', '381');
INSERT INTO `t_region` VALUES ('3150', '盐埔乡', '381');
INSERT INTO `t_region` VALUES ('3151', '长治乡', '381');
INSERT INTO `t_region` VALUES ('3152', '麟洛乡', '381');
INSERT INTO `t_region` VALUES ('3153', '竹田乡', '381');
INSERT INTO `t_region` VALUES ('3154', '内埔乡', '381');
INSERT INTO `t_region` VALUES ('3155', '万丹乡', '381');
INSERT INTO `t_region` VALUES ('3156', '潮州镇', '381');
INSERT INTO `t_region` VALUES ('3157', '泰武乡', '381');
INSERT INTO `t_region` VALUES ('3158', '来义乡', '381');
INSERT INTO `t_region` VALUES ('3159', '万峦乡', '381');
INSERT INTO `t_region` VALUES ('3160', '崁顶乡', '381');
INSERT INTO `t_region` VALUES ('3161', '新埤乡', '381');
INSERT INTO `t_region` VALUES ('3162', '南州乡', '381');
INSERT INTO `t_region` VALUES ('3163', '林边乡', '381');
INSERT INTO `t_region` VALUES ('3164', '东港镇', '381');
INSERT INTO `t_region` VALUES ('3165', '琉球乡', '381');
INSERT INTO `t_region` VALUES ('3166', '佳冬乡', '381');
INSERT INTO `t_region` VALUES ('3167', '新园乡', '381');
INSERT INTO `t_region` VALUES ('3168', '枋寮乡', '381');
INSERT INTO `t_region` VALUES ('3169', '枋山乡', '381');
INSERT INTO `t_region` VALUES ('3170', '春日乡', '381');
INSERT INTO `t_region` VALUES ('3171', '狮子乡', '381');
INSERT INTO `t_region` VALUES ('3172', '车城乡', '381');
INSERT INTO `t_region` VALUES ('3173', '牡丹乡', '381');
INSERT INTO `t_region` VALUES ('3174', '恒春镇', '381');
INSERT INTO `t_region` VALUES ('3175', '满州乡', '381');
INSERT INTO `t_region` VALUES ('3176', '台东市', '382');
INSERT INTO `t_region` VALUES ('3177', '绿岛乡', '382');
INSERT INTO `t_region` VALUES ('3178', '兰屿乡', '382');
INSERT INTO `t_region` VALUES ('3179', '延平乡', '382');
INSERT INTO `t_region` VALUES ('3180', '卑南乡', '382');
INSERT INTO `t_region` VALUES ('3181', '鹿野乡', '382');
INSERT INTO `t_region` VALUES ('3182', '关山镇', '382');
INSERT INTO `t_region` VALUES ('3183', '海端乡', '382');
INSERT INTO `t_region` VALUES ('3184', '池上乡', '382');
INSERT INTO `t_region` VALUES ('3185', '东河乡', '382');
INSERT INTO `t_region` VALUES ('3186', '成功镇', '382');
INSERT INTO `t_region` VALUES ('3187', '长滨乡', '382');
INSERT INTO `t_region` VALUES ('3188', '金峰乡', '382');
INSERT INTO `t_region` VALUES ('3189', '大武乡', '382');
INSERT INTO `t_region` VALUES ('3190', '达仁乡', '382');
INSERT INTO `t_region` VALUES ('3191', '太麻里乡', '382');
INSERT INTO `t_region` VALUES ('3192', '花莲市', '383');
INSERT INTO `t_region` VALUES ('3193', '新城乡', '383');
INSERT INTO `t_region` VALUES ('3194', '太鲁阁', '383');
INSERT INTO `t_region` VALUES ('3195', '秀林乡', '383');
INSERT INTO `t_region` VALUES ('3196', '寿丰乡', '383');
INSERT INTO `t_region` VALUES ('3197', '凤林镇', '383');
INSERT INTO `t_region` VALUES ('3198', '光复乡', '383');
INSERT INTO `t_region` VALUES ('3199', '丰滨乡', '383');
INSERT INTO `t_region` VALUES ('3200', '瑞穗乡', '383');
INSERT INTO `t_region` VALUES ('3201', '万荣乡', '383');
INSERT INTO `t_region` VALUES ('3202', '玉里镇', '383');
INSERT INTO `t_region` VALUES ('3203', '卓溪乡', '383');
INSERT INTO `t_region` VALUES ('3204', '富里乡', '383');
INSERT INTO `t_region` VALUES ('3205', '马公市', '384');
INSERT INTO `t_region` VALUES ('3206', '西屿乡', '384');
INSERT INTO `t_region` VALUES ('3207', '望安乡', '384');
INSERT INTO `t_region` VALUES ('3208', '七美乡', '384');
INSERT INTO `t_region` VALUES ('3209', '白沙乡', '384');
INSERT INTO `t_region` VALUES ('3210', '湖西乡', '384');
INSERT INTO `t_region` VALUES ('3211', '南竿乡', '385');
INSERT INTO `t_region` VALUES ('3212', '北竿乡', '385');
INSERT INTO `t_region` VALUES ('3213', '莒光乡', '385');
INSERT INTO `t_region` VALUES ('3214', '东引乡', '385');

-- ----------------------------
-- Table structure for t_send_price
-- ----------------------------
DROP TABLE IF EXISTS `t_send_price`;
CREATE TABLE `t_send_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `type` int(1) DEFAULT '1' COMMENT '类别，1=普通，2=快件',
  `money` double(10,1) DEFAULT '0.0' COMMENT '价格',
  `update_time` bigint(50) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='寄信方式价格表';

-- ----------------------------
-- Records of t_send_price
-- ----------------------------

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `content` varchar(50) DEFAULT '' COMMENT '标签内容',
  `create_time` bigint(50) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(50) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='标签表';

-- ----------------------------
-- Records of t_tag
-- ----------------------------
INSERT INTO `t_tag` VALUES ('1', '鲜花', '1479955483267', null);
INSERT INTO `t_tag` VALUES ('2', '绿草', '1479955483267', null);
INSERT INTO `t_tag` VALUES ('5', '春生', '1481008154433', '1481008192948');
INSERT INTO `t_tag` VALUES ('6', '夏长', '1481008186108', null);
INSERT INTO `t_tag` VALUES ('7', '秋收', '1481008198827', null);
INSERT INTO `t_tag` VALUES ('8', '冬藏', '1481008206340', null);

-- ----------------------------
-- Table structure for t_third_user
-- ----------------------------
DROP TABLE IF EXISTS `t_third_user`;
CREATE TABLE `t_third_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `user_id` int(11) DEFAULT NULL COMMENT '关联用户id',
  `type` int(1) DEFAULT '1' COMMENT '类型，1=微信，2=微博，3=QQ，默认为1',
  `open_id` varchar(200) DEFAULT '' COMMENT '第三方唯一标识',
  `create_time` bigint(50) DEFAULT NULL COMMENT '绑定时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='用户第三方信息表';

-- ----------------------------
-- Records of t_third_user
-- ----------------------------
INSERT INTO `t_third_user` VALUES ('1', '2', '2', 'owoh7v2-04kQA0y1sEGeYLmfqBzQ', '1479955483330');
INSERT INTO `t_third_user` VALUES ('2', '1', '1', '乐评人说他是一位左手西方', '1480400788243');
INSERT INTO `t_third_user` VALUES ('3', '1', '2', '右手东方的天才音乐家', '1480400806170');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `type` int(1) DEFAULT '0' COMMENT '类型，0=系统用户，1=微信，2=微博，3=QQ，默认为0',
  `avatar` varchar(200) DEFAULT '' COMMENT '头像url',
  `background_image` varchar(200) DEFAULT '' COMMENT '背景图url',
  `nickname` varchar(50) DEFAULT '' COMMENT '昵称',
  `region_id` int(11) DEFAULT NULL COMMENT '所在地id',
  `birthday` varchar(50) DEFAULT '' COMMENT '出生日期',
  `money` double(10,1) DEFAULT '0.0' COMMENT '账户余额',
  `sex` int(1) DEFAULT '0' COMMENT '性别，0=男，1=女，默认为0',
  `mobile` varchar(20) DEFAULT '' COMMENT '手机号',
  `password` varchar(50) DEFAULT '' COMMENT '密码，MD5密文大写加密',
  `seal_status` int(1) DEFAULT '0' COMMENT '封禁状态，0=正常，1=封禁，默认为0',
  `create_time` bigint(50) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(50) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '0', 'http://ogbbsi37j.bkt.clouddn.com/Fgc9G7q1ECOoNBkdZjZ3XLgU7x0F', null, '~~~', '32', '1989-03-15', '0.0', '0', '18717101121', '96E79218965EB72C92A549DD5A330112', '0', '1479955385090', '1479955557079');
INSERT INTO `t_user` VALUES ('2', '2', 'http://ogbbsi37j.bkt.clouddn.com/Fgc9G7q1ECOoNBkdZjZ3XLgU7x0F', null, '钱多啦', null, '1989-03-15', '0.0', '0', '', '', '0', '1479955483267', null);
INSERT INTO `t_user` VALUES ('3', '2', 'http://ogbbsi37j.bkt.clouddn.com/Fgc9G7q1ECOoNBkdZjZ3XLgU7x0F', '', '金巧巧', null, '1989-03-15', '0.0', '0', '', '', '0', '1479955483267', null);
INSERT INTO `t_user` VALUES ('4', '2', 'http://ogbbsi37j.bkt.clouddn.com/Fgc9G7q1ECOoNBkdZjZ3XLgU7x0F', '', '萨顶顶', null, '1989-03-15', '0.0', '0', '', '', '0', '1479955483267', null);
INSERT INTO `t_user` VALUES ('5', '2', 'http://ogbbsi37j.bkt.clouddn.com/Fgc9G7q1ECOoNBkdZjZ3XLgU7x0F', '', '霍尊', null, '1989-03-15', '0.0', '0', '', '', '0', '1479955483267', null);
INSERT INTO `t_user` VALUES ('6', '2', 'http://ogbbsi37j.bkt.clouddn.com/Fgc9G7q1ECOoNBkdZjZ3XLgU7x0F', '', '韩磊', null, '1989-03-15', '0.0', '0', '', '', '0', '1479955483267', null);
INSERT INTO `t_user` VALUES ('7', '2', 'http://ogbbsi37j.bkt.clouddn.com/Fgc9G7q1ECOoNBkdZjZ3XLgU7x0F', '', '倪妮', null, '1989-03-15', '0.0', '0', '', '', '0', '1479955483267', null);
INSERT INTO `t_user` VALUES ('8', '2', 'http://ogbbsi37j.bkt.clouddn.com/Fgc9G7q1ECOoNBkdZjZ3XLgU7x0F', '', '谢娜', null, '1989-03-15', '0.0', '0', '', '', '0', '1479955483267', null);
INSERT INTO `t_user` VALUES ('9', '2', 'http://ogbbsi37j.bkt.clouddn.com/Fgc9G7q1ECOoNBkdZjZ3XLgU7x0F', '', '何炅', null, '1989-03-15', '0.0', '0', '', '', '0', '1479955483267', null);
INSERT INTO `t_user` VALUES ('10', '2', 'http://ogbbsi37j.bkt.clouddn.com/Fgc9G7q1ECOoNBkdZjZ3XLgU7x0F', '', '吴喺', null, '1989-03-15', '0.0', '0', '', '', '0', '1479955483267', null);

-- ----------------------------
-- Table structure for t_user_address
-- ----------------------------
DROP TABLE IF EXISTS `t_user_address`;
CREATE TABLE `t_user_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `user_id` int(11) DEFAULT NULL COMMENT '关联用户id',
  `username` varchar(20) DEFAULT '' COMMENT '姓名',
  `mobile` varchar(20) DEFAULT '' COMMENT '联系方式',
  `region_id` int(11) DEFAULT NULL COMMENT '所在区域id',
  `description` varchar(500) DEFAULT '' COMMENT '详细地址',
  `is_default` int(1) DEFAULT '0' COMMENT '是否默认地址，0=否，1=是，默认为0',
  `create_time` bigint(50) DEFAULT NULL COMMENT '创建时间',
  `update_time` bigint(50) DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户收货地址表';

-- ----------------------------
-- Records of t_user_address
-- ----------------------------
INSERT INTO `t_user_address` VALUES ('1', '1', '涂奕恒', '18717101121', '159', '南湖大道茶山刘', '0', '1480400861472', '1480400939787');

-- ----------------------------
-- Table structure for t_user_collect
-- ----------------------------
DROP TABLE IF EXISTS `t_user_collect`;
CREATE TABLE `t_user_collect` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `source_id` int(11) DEFAULT NULL COMMENT '关联目标id',
  `source_type` int(2) DEFAULT '1' COMMENT '目标类型，1=纸条，2=广播，3=心事，4=兴趣圈，默认为1',
  `create_time` bigint(50) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户收藏表';

-- ----------------------------
-- Records of t_user_collect
-- ----------------------------

-- ----------------------------
-- Table structure for t_user_letter_mind
-- ----------------------------
DROP TABLE IF EXISTS `t_user_letter_mind`;
CREATE TABLE `t_user_letter_mind` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `source_id` int(11) DEFAULT NULL COMMENT '关联目标id',
  `source_type` int(2) DEFAULT '1' COMMENT '目标类型，1=购买信件附属，2=偷听，默认为1',
  `type` int(1) DEFAULT '0' COMMENT '信件附属信息类型，1=信纸，2=信封，3=邮票',
  `create_time` bigint(50) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户购买偷听表';

-- ----------------------------
-- Records of t_user_letter_mind
-- ----------------------------

-- ----------------------------
-- Table structure for t_user_money
-- ----------------------------
DROP TABLE IF EXISTS `t_user_money`;
CREATE TABLE `t_user_money` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `user_id` int(11) DEFAULT NULL COMMENT '关联用户id',
  `type` int(1) DEFAULT '1' COMMENT '类型，1=充值，2=提现',
  `money` double(10,1) DEFAULT '0.0' COMMENT '变动金额',
  `platform` int(1) DEFAULT '1' COMMENT '充值平台，1=微信，2=支付宝，默认为1',
  `request_status` int(1) DEFAULT '0' COMMENT '打款状态，0=未打款，1=已打款，默认为0',
  `create_time` bigint(50) DEFAULT NULL COMMENT '记录时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户金额变动记录表';

-- ----------------------------
-- Records of t_user_money
-- ----------------------------

-- ----------------------------
-- Table structure for t_user_seal_info
-- ----------------------------
DROP TABLE IF EXISTS `t_user_seal_info`;
CREATE TABLE `t_user_seal_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `content` varchar(200) DEFAULT '' COMMENT '禁用原因',
  `create_time` bigint(50) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='用户状态变更记录表';

-- ----------------------------
-- Records of t_user_seal_info
-- ----------------------------
INSERT INTO `t_user_seal_info` VALUES ('1', '2', '昵称不合法', '1481006262722');
INSERT INTO `t_user_seal_info` VALUES ('2', '1', '禁用解除', '1481006799615');
INSERT INTO `t_user_seal_info` VALUES ('3', '2', '禁用解除', '1481006831964');

-- ----------------------------
-- Table structure for t_user_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_user_tag`;
CREATE TABLE `t_user_tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增长id',
  `user_id` int(11) DEFAULT NULL COMMENT '关联用户id',
  `content` varchar(20) DEFAULT '' COMMENT '标签名称',
  `is_default` int(1) DEFAULT '0' COMMENT '是否默认标签，0=否，1=是，默认为0',
  `update_num` int(11) DEFAULT '0' COMMENT '默认标签修改次数，默认为0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='用户标签信息表';

-- ----------------------------
-- Records of t_user_tag
-- ----------------------------
INSERT INTO `t_user_tag` VALUES ('1', '1', '鲜花', '1', '1');
