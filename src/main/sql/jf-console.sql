/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : jf-console

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-12-25 16:17:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for approve_def
-- ----------------------------
DROP TABLE IF EXISTS `approve_def`;
CREATE TABLE `approve_def` (
  `APPR_ID` decimal(16,0) NOT NULL COMMENT '审批ID',
  `APPR_OBJ_TYPE` decimal(6,0) DEFAULT NULL COMMENT '审批对象类型：1-商户 2-商品单元',
  `APPR_OBJ_ID` decimal(16,0) DEFAULT NULL COMMENT '审批对象ID（商户类目ID、商品单元ID、商户申请ID）',
  `APPR_OBJ_NAME` varchar(400) DEFAULT NULL COMMENT '审批对象名称（商户类目名称、商品单元名称、商户申请名称）',
  `APPR_STATE` decimal(6,0) DEFAULT NULL COMMENT '审批状态：0-未提交 1-待审批（审批中） 2-审批通过 3-审批未通过',
  `LTST_APPR_OPID` decimal(16,0) DEFAULT NULL COMMENT '最新审批人',
  `LTST_APPR_OPNAME` varchar(400) DEFAULT NULL COMMENT '最新审批人姓名',
  `LTST_APPR_TIME` datetime DEFAULT NULL COMMENT '最新审批时间',
  `LTST_APPR_STATE` decimal(6,0) DEFAULT NULL COMMENT '最新审批状态（取值含义同审批明细表审批状态）',
  `LTST_APPR_COMMENT` varchar(2000) DEFAULT NULL COMMENT '最新审批意见',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFYER` decimal(16,0) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`APPR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录对各类对象的审批信息（类目、商品）';

-- ----------------------------
-- Records of approve_def
-- ----------------------------
INSERT INTO `approve_def` VALUES ('100001', '2', '100002', '12英寸乳脂蛋糕一个团购', '2', '1', '平台管理员', '2016-08-24 13:07:45', '2', '通过', '1', '1001', '2016-08-24 13:07:10', '1', '2016-08-24 13:07:45');
INSERT INTO `approve_def` VALUES ('100002', '2', '100009', '18英寸乳脂蛋糕一个团购', '2', '1', '平台管理员', '2016-09-13 09:59:20', '2', '通过！', '1', '1001', '2016-09-13 09:58:31', '1', '2016-09-13 09:59:20');

-- ----------------------------
-- Table structure for appr_dtl
-- ----------------------------
DROP TABLE IF EXISTS `appr_dtl`;
CREATE TABLE `appr_dtl` (
  `APPR_DTL_ID` decimal(16,0) NOT NULL COMMENT '审批明细表ID',
  `APPR_ID` decimal(16,0) DEFAULT NULL COMMENT '审批ID',
  `APPR_STATE` decimal(6,0) DEFAULT NULL COMMENT '审批状态：0-未提交 1-待审批（审批中） 2-审批通过 3-审批未通过',
  `APPR_OPID` decimal(16,0) DEFAULT NULL COMMENT '审批人ID',
  `APPR_OPNAME` varchar(400) DEFAULT NULL COMMENT '审批人姓名',
  `APPR_TIME` datetime DEFAULT NULL COMMENT '审批时间',
  `APPR_COMMENT` varchar(2000) DEFAULT NULL COMMENT '审批意见',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFYER` decimal(16,0) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`APPR_DTL_ID`),
  KEY `FK_APR_DTL_APPR` (`APPR_ID`),
  CONSTRAINT `FK_APR_DTL_APPR` FOREIGN KEY (`APPR_ID`) REFERENCES `approve_def` (`APPR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录各审批人的审批明细信息';

-- ----------------------------
-- Records of appr_dtl
-- ----------------------------
INSERT INTO `appr_dtl` VALUES ('100001', '100001', '1', '1001', 'fresh café', '2016-08-24 13:07:10', null, '1', '1001', '2016-08-24 13:07:10', '1001', '2016-08-24 13:07:10');
INSERT INTO `appr_dtl` VALUES ('100002', '100001', '2', '1', '平台管理员', '2016-08-24 13:07:45', '通过', '1', '1', '2016-08-24 13:07:45', '1', '2016-08-24 13:07:45');
INSERT INTO `appr_dtl` VALUES ('100003', '100002', '1', '1001', 'fresh café', '2016-09-13 09:58:31', null, '1', '1001', '2016-09-13 09:58:31', '1001', '2016-09-13 09:58:31');
INSERT INTO `appr_dtl` VALUES ('100004', '100002', '2', '1', '平台管理员', '2016-09-13 09:59:20', '通过！', '1', '1', '2016-09-13 09:59:20', '1', '2016-09-13 09:59:20');

-- ----------------------------
-- Table structure for area_def
-- ----------------------------
DROP TABLE IF EXISTS `area_def`;
CREATE TABLE `area_def` (
  `AREA_ID` varchar(30) NOT NULL COMMENT '区域id',
  `AREA_CODE` varchar(30) DEFAULT NULL COMMENT '区域原始编码',
  `AREA_NAME` varchar(80) DEFAULT NULL COMMENT '区域名称',
  `AREA_DESC` varchar(400) DEFAULT NULL COMMENT '区域描述',
  `AREA_LEVEL` int(11) DEFAULT NULL COMMENT '区域级别',
  `SUP_AREA_TREE` varchar(400) DEFAULT NULL COMMENT '上级区域树该区域上级的所有区域id，按级别从高到低，以#分割（注意头尾也要有#；该树包含该区域自身）',
  `SUP_AREA_ID` varchar(30) DEFAULT NULL COMMENT '上级区域ID',
  `CREATOR` decimal(12,0) DEFAULT NULL COMMENT '创建人',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODIFIER` decimal(12,0) DEFAULT NULL COMMENT '修改人',
  `MODIFY_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  PRIMARY KEY (`AREA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域代码表';

-- ----------------------------
-- Records of area_def
-- ----------------------------
INSERT INTO `area_def` VALUES ('1', '1', '全国', null, '1', null, null, null, '2016-08-24 11:55:04', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('10', '10', '永登县', null, '4', null, '3', null, '2016-08-24 11:55:05', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('100', '100', '卓尼县', null, '4', null, '97', null, '2016-08-24 11:55:09', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('101', '101', '舟曲县', null, '4', null, '97', null, '2016-08-24 11:55:09', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('102', '102', '迭部县', null, '4', null, '97', null, '2016-08-24 11:55:09', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('103', '103', '玛曲县', null, '4', null, '97', null, '2016-08-24 11:55:09', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('104', '104', '碌曲县', null, '4', null, '97', null, '2016-08-24 11:55:09', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('105', '105', '夏河县', null, '4', null, '97', null, '2016-08-24 11:55:09', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('11', '11', '皋兰县', null, '4', null, '3', null, '2016-08-24 11:55:05', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('12', '12', '嘉峪关市', null, '3', null, '2', null, '2016-08-24 11:55:05', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('13', '13', '长城区', null, '4', null, '12', null, '2016-08-24 11:55:05', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('14', '14', '雄关区', null, '4', null, '12', null, '2016-08-24 11:55:05', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('15', '15', '镜铁区', null, '4', null, '12', null, '2016-08-24 11:55:05', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('16', '16', '金昌市', null, '3', null, '2', null, '2016-08-24 11:55:05', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('17', '17', '金川区', null, '4', null, '16', null, '2016-08-24 11:55:05', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('18', '18', '永昌县', null, '4', null, '16', null, '2016-08-24 11:55:05', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('19', '19', '白银市', null, '3', null, '2', null, '2016-08-24 11:55:05', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('2', '2', '甘肃', null, '2', null, '1', null, '2016-08-24 11:55:04', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('20', '20', '白银区', null, '4', null, '19', null, '2016-08-24 11:55:05', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('21', '21', '平川区', null, '4', null, '19', null, '2016-08-24 11:55:05', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('22', '22', '靖远县', null, '4', null, '19', null, '2016-08-24 11:55:05', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('23', '23', '会宁县', null, '4', null, '19', null, '2016-08-24 11:55:05', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('24', '24', '景泰县', null, '4', null, '19', null, '2016-08-24 11:55:05', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('25', '25', '天水市', null, '3', null, '2', null, '2016-08-24 11:55:05', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('26', '26', '秦州区', null, '4', null, '25', null, '2016-08-24 11:55:05', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('27', '27', '麦积区', null, '4', null, '25', null, '2016-08-24 11:55:05', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('28', '28', '清水县', null, '4', null, '25', null, '2016-08-24 11:55:05', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('29', '29', '秦安县', null, '4', null, '25', null, '2016-08-24 11:55:05', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('3', '3', '兰州市', null, '3', null, '2', null, '2016-08-24 11:55:04', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('30', '30', '甘谷县', null, '4', null, '25', null, '2016-08-24 11:55:05', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('31', '31', '武山县', null, '4', null, '25', null, '2016-08-24 11:55:06', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('32', '32', '张家川县', null, '4', null, '25', null, '2016-08-24 11:55:06', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('33', '33', '武威市', null, '3', null, '2', null, '2016-08-24 11:55:06', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('34', '34', '凉州区', null, '4', null, '33', null, '2016-08-24 11:55:06', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('35', '35', '民勤县', null, '4', null, '33', null, '2016-08-24 11:55:06', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('36', '36', '古浪县', null, '4', null, '33', null, '2016-08-24 11:55:06', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('37', '37', '天祝县', null, '4', null, '33', null, '2016-08-24 11:55:06', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('38', '38', '张掖市', null, '3', null, '2', null, '2016-08-24 11:55:06', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('39', '39', '甘州区', null, '4', null, '38', null, '2016-08-24 11:55:06', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('4', '4', '城关区', null, '4', null, '3', null, '2016-08-24 11:55:04', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('40', '40', '民乐县', null, '4', null, '38', null, '2016-08-24 11:55:06', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('41', '41', '临泽县', null, '4', null, '38', null, '2016-08-24 11:55:06', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('42', '42', '高台县', null, '4', null, '38', null, '2016-08-24 11:55:06', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('43', '43', '山丹县', null, '4', null, '38', null, '2016-08-24 11:55:06', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('44', '44', '肃南县', null, '4', null, '38', null, '2016-08-24 11:55:06', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('45', '45', '平凉市', null, '3', null, '2', null, '2016-08-24 11:55:06', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('46', '46', '崆峒区', null, '4', null, '45', null, '2016-08-24 11:55:06', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('47', '47', '泾川县', null, '4', null, '45', null, '2016-08-24 11:55:06', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('48', '48', '灵台县', null, '4', null, '45', null, '2016-08-24 11:55:06', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('49', '49', '崇信县', null, '4', null, '45', null, '2016-08-24 11:55:06', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('5', '5', '西固区', null, '4', null, '3', null, '2016-08-24 11:55:04', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('50', '50', '华亭县', null, '4', null, '45', null, '2016-08-24 11:55:06', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('51', '51', '庄浪县', null, '4', null, '45', null, '2016-08-24 11:55:06', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('52', '52', '静宁县', null, '4', null, '45', null, '2016-08-24 11:55:06', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('53', '53', '酒泉市', null, '3', null, '2', null, '2016-08-24 11:55:06', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('54', '54', '肃州区', null, '4', null, '52', null, '2016-08-24 11:55:06', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('55', '55', '玉门市', null, '4', null, '52', null, '2016-08-24 11:55:07', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('56', '56', '敦煌市', null, '4', null, '52', null, '2016-08-24 11:55:07', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('57', '57', '金塔县', null, '4', null, '52', null, '2016-08-24 11:55:07', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('58', '58', '瓜州县', null, '4', null, '52', null, '2016-08-24 11:55:07', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('59', '59', '肃北县', null, '4', null, '52', null, '2016-08-24 11:55:07', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('6', '6', '七里河区', null, '4', null, '3', null, '2016-08-24 11:55:04', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('60', '60', '阿克塞县', null, '4', null, '52', null, '2016-08-24 11:55:07', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('61', '61', '庆阳市', null, '3', null, '2', null, '2016-08-24 11:55:07', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('62', '62', '西峰区', null, '4', null, '61', null, '2016-08-24 11:55:07', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('63', '63', '庆城县', null, '4', null, '61', null, '2016-08-24 11:55:07', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('64', '64', '环县', null, '4', null, '61', null, '2016-08-24 11:55:07', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('65', '65', '华池县', null, '4', null, '61', null, '2016-08-24 11:55:07', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('66', '66', '合水县', null, '4', null, '61', null, '2016-08-24 11:55:07', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('67', '67', '正宁县', null, '4', null, '61', null, '2016-08-24 11:55:07', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('68', '68', '宁县', null, '4', null, '61', null, '2016-08-24 11:55:07', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('69', '69', '镇原县', null, '4', null, '61', null, '2016-08-24 11:55:07', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('7', '7', '安宁区', null, '4', null, '3', null, '2016-08-24 11:55:04', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('70', '70', '定西市', null, '3', null, '2', null, '2016-08-24 11:55:07', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('71', '71', '安定区', null, '4', null, '70', null, '2016-08-24 11:55:07', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('72', '72', '通渭县', null, '4', null, '70', null, '2016-08-24 11:55:07', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('73', '73', '陇西县', null, '4', null, '70', null, '2016-08-24 11:55:07', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('74', '74', '渭源县', null, '4', null, '70', null, '2016-08-24 11:55:07', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('75', '75', '临洮县', null, '4', null, '70', null, '2016-08-24 11:55:08', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('76', '76', '漳县', null, '4', null, '70', null, '2016-08-24 11:55:08', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('77', '77', '岷县', null, '4', null, '70', null, '2016-08-24 11:55:08', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('78', '78', '陇南市', null, '3', null, '2', null, '2016-08-24 11:55:08', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('79', '79', '武都区', null, '4', null, '78', null, '2016-08-24 11:55:08', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('8', '8', '榆中县', null, '4', null, '3', null, '2016-08-24 11:55:05', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('80', '80', '成县', null, '4', null, '78', null, '2016-08-24 11:55:08', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('81', '81', '文县', null, '4', null, '78', null, '2016-08-24 11:55:08', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('82', '82', '宕昌县', null, '4', null, '78', null, '2016-08-24 11:55:08', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('83', '83', '康县', null, '4', null, '78', null, '2016-08-24 11:55:08', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('84', '84', '西和县', null, '4', null, '78', null, '2016-08-24 11:55:08', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('85', '85', '礼县', null, '4', null, '78', null, '2016-08-24 11:55:08', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('86', '86', '徽县', null, '4', null, '78', null, '2016-08-24 11:55:08', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('87', '87', '两当县', null, '4', null, '78', null, '2016-08-24 11:55:08', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('88', '88', '临夏州', null, '3', null, '2', null, '2016-08-24 11:55:08', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('89', '89', '临夏市', null, '4', null, '88', null, '2016-08-24 11:55:08', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('9', '9', '红古区', null, '4', null, '3', null, '2016-08-24 11:55:05', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('90', '90', '临夏县', null, '4', null, '88', null, '2016-08-24 11:55:08', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('91', '91', '康乐县', null, '4', null, '88', null, '2016-08-24 11:55:08', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('92', '92', '永靖县', null, '4', null, '88', null, '2016-08-24 11:55:08', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('93', '93', '广河县', null, '4', null, '88', null, '2016-08-24 11:55:08', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('94', '94', '和政县', null, '4', null, '88', null, '2016-08-24 11:55:08', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('95', '95', '东乡族自治县', null, '4', null, '88', null, '2016-08-24 11:55:08', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('96', '96', '积石山县', null, '4', null, '88', null, '2016-08-24 11:55:08', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('97', '97', '甘南州', null, '3', null, '2', null, '2016-08-24 11:55:09', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('98', '98', '合作市', null, '4', null, '97', null, '2016-08-24 11:55:09', null, '0000-00-00 00:00:00', '1');
INSERT INTO `area_def` VALUES ('99', '99', '临潭县', null, '4', null, '97', null, '2016-08-24 11:55:09', null, '0000-00-00 00:00:00', '1');

-- ----------------------------
-- Table structure for code_value
-- ----------------------------
DROP TABLE IF EXISTS `code_value`;
CREATE TABLE `code_value` (
  `CODE_TYPE` int(11) NOT NULL COMMENT '代码类别',
  `CODE_VALUE` varchar(200) NOT NULL COMMENT '代码取值',
  `CODE_NAME` varchar(255) DEFAULT NULL COMMENT '共用基础数据被调时显示的内容',
  `CODE_DESC` varchar(200) DEFAULT NULL COMMENT '代码取值描述',
  `CODE_ORDER` decimal(6,0) DEFAULT NULL COMMENT '代码取值排序（显示顺序）',
  `SUP_CODE_VALUE` varchar(20) DEFAULT NULL COMMENT '上级代码取值',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  PRIMARY KEY (`CODE_TYPE`,`CODE_VALUE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录通用的代码取值信息';

-- ----------------------------
-- Records of code_value
-- ----------------------------
INSERT INTO `code_value` VALUES ('1001', '1', '未提交', '审批状态', '0', null, '2016-09-21 10:59:03', '1');
INSERT INTO `code_value` VALUES ('1001', '2', '待审批', '审批状态', '1', null, '2016-09-21 10:59:01', '1');
INSERT INTO `code_value` VALUES ('1001', '3', '审批通过', '审批状态', '2', null, '2016-09-21 10:58:59', '1');
INSERT INTO `code_value` VALUES ('1001', '4', '审批不通过', '审批状态', '3', null, '2016-09-21 10:58:57', '1');
INSERT INTO `code_value` VALUES ('1002', '1', '已上架', '状态', '1', null, '2016-12-21 21:48:32', '1');
INSERT INTO `code_value` VALUES ('1002', '2', '已下架', '状态', '2', null, '2016-12-21 21:48:41', '1');
INSERT INTO `code_value` VALUES ('1002', '3', '待发布', '状态', '3', null, '2016-12-21 19:32:44', '1');
INSERT INTO `code_value` VALUES ('1003', '1', '超级管理员', '操作员类型', '1', null, '2016-09-21 11:19:47', '1');
INSERT INTO `code_value` VALUES ('1003', '2', '管理员', '操作员类型', '2', '', '2016-09-21 10:59:12', '1');
INSERT INTO `code_value` VALUES ('1003', '3', '普通用户', '操作员类型', '3', '', '2016-09-21 10:59:10', '1');
INSERT INTO `code_value` VALUES ('2001', '1', '首页', '商品广告位置', '1', null, '2016-08-24 11:55:04', '1');
INSERT INTO `code_value` VALUES ('2001', '2', '特价区', '商品广告位置', '2', null, '2016-08-24 11:55:04', '1');
INSERT INTO `code_value` VALUES ('2002', '1', '猜你喜欢', '商品推荐位置', '1', null, '2016-08-24 11:55:04', '1');
INSERT INTO `code_value` VALUES ('2002', '2', '特价区', '商品推荐位置', '2', null, '2016-08-24 11:55:04', '1');
INSERT INTO `code_value` VALUES ('2002', '3', '购买推荐', '商品推荐位置', '3', null, '2016-08-24 11:55:04', '1');
INSERT INTO `code_value` VALUES ('2003', '1', '抵用券', '商品单元类型', '1', null, '2016-08-24 11:55:04', '1');
INSERT INTO `code_value` VALUES ('2004', '101', '兑换', '操作类型', '101', null, '2016-08-24 11:55:04', '1');
INSERT INTO `code_value` VALUES ('2004', '102', '好友赠送', '操作类型', '102', null, '2016-08-24 11:55:04', '1');
INSERT INTO `code_value` VALUES ('2004', '103', '签到', '操作类型', '103', null, '2016-08-24 11:55:04', '1');
INSERT INTO `code_value` VALUES ('2004', '104', '添加好友', '操作类型', '104', null, '2016-08-24 11:55:04', '1');
INSERT INTO `code_value` VALUES ('2004', '105', '游戏中奖', '操作类型', '105', null, '2016-08-24 11:55:04', '1');
INSERT INTO `code_value` VALUES ('2004', '201', '购买商品', '操作类型', '201', null, '2016-08-24 11:55:04', '1');
INSERT INTO `code_value` VALUES ('2004', '202', '赠送好友', '操作类型', '202', null, '2016-08-24 11:55:04', '1');
INSERT INTO `code_value` VALUES ('2004', '203', '游戏使用', '操作类型', '203', null, '2016-08-24 11:55:04', '1');
INSERT INTO `code_value` VALUES ('2005', '1', '大转盘', '游戏类型', '1', null, '2016-08-24 11:55:04', '1');
INSERT INTO `code_value` VALUES ('2006', '1', '积分', '奖品类型', '1', null, '2016-08-24 11:55:04', '1');
INSERT INTO `code_value` VALUES ('2006', '2', '其他', '奖品类型', '2', null, '2016-08-24 11:55:04', '1');
INSERT INTO `code_value` VALUES ('2007', '1', '未审核', '审核状态', '0', null, '2016-12-31 14:39:41', '1');
INSERT INTO `code_value` VALUES ('2007', '2', '审核通过可见', '审核状态', '1', null, '2016-12-20 14:41:12', '1');
INSERT INTO `code_value` VALUES ('2007', '3', '审核不通过', '审核状态', '2', null, '2016-12-20 14:43:08', '1');
INSERT INTO `code_value` VALUES ('2007', '4', '审核通过不可见', '审核状态', '3', null, '2016-12-15 14:43:11', '1');
INSERT INTO `code_value` VALUES ('2008', '1', '全国', '广告投放区域', '1', null, '2016-12-21 19:35:20', '1');
INSERT INTO `code_value` VALUES ('2008', '2', '北京', '广告投放区域', '2', null, '2016-12-21 19:35:21', '1');
INSERT INTO `code_value` VALUES ('2008', '3', '成都', '广告投放区域', '3', null, '2016-12-21 19:35:24', '1');

-- ----------------------------
-- Table structure for col_code_type
-- ----------------------------
DROP TABLE IF EXISTS `col_code_type`;
CREATE TABLE `col_code_type` (
  `CODE_TYPE` int(11) NOT NULL COMMENT '代码类别',
  `TAB_NAME` varchar(30) NOT NULL COMMENT '表名',
  `COL_NAME` varchar(30) NOT NULL COMMENT '字段名',
  `COL_TYPE` decimal(2,0) DEFAULT NULL COMMENT '字段类型：1-数值型 2-字符型',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  PRIMARY KEY (`CODE_TYPE`,`TAB_NAME`,`COL_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录表字段与代码类别的关系';

-- ----------------------------
-- Records of col_code_type
-- ----------------------------

-- ----------------------------
-- Table structure for ic_adv
-- ----------------------------
DROP TABLE IF EXISTS `ic_adv`;
CREATE TABLE `ic_adv` (
  `ADV_ID` decimal(16,0) NOT NULL COMMENT '商品广告ID',
  `ADV_POS` decimal(2,0) DEFAULT NULL COMMENT '商品广告位置：1-首页 2-特价区',
  `ADV_NAME` varchar(80) DEFAULT NULL COMMENT '商品广告名称',
  `ADV_PIC` varchar(400) DEFAULT NULL COMMENT '商品广告图片',
  `ADV_URL` varchar(400) DEFAULT NULL COMMENT '商品广告链接',
  `ADV_DESC` varchar(2000) DEFAULT NULL COMMENT '商品广告描述',
  `ADV_ORDER` decimal(16,0) DEFAULT NULL COMMENT '商品广告顺序',
  `ADV_START_TIME` datetime DEFAULT NULL COMMENT '开始时间',
  `ADV_END_TIME` datetime DEFAULT NULL COMMENT '结束时间',
  `ADV_AREA_ID` decimal(16,0) DEFAULT NULL COMMENT '商品广告投放区域',
  `ADV_STATE` decimal(2,0) DEFAULT NULL COMMENT '商品广告状态：1 已启用 2-已停用',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFYER` decimal(16,0) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`ADV_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品广告表';

-- ----------------------------
-- Records of ic_adv
-- ----------------------------
INSERT INTO `ic_adv` VALUES ('100001', '1', '蛋糕广告', '/pomp_console/jpg/20160824/1472018428976.jpg', 'http://localhost:8088/app/page/item/details/itemDetailsPage?itemCode=100002&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect', '嘿嘿嘿', '3', '2016-08-24 13:55:15', '2016-09-30 13:55:17', '1', '1', '1', '1', '2016-08-24 13:55:30', '1', '2016-08-24 14:00:31');
INSERT INTO `ic_adv` VALUES ('100002', '2', '蛋糕', '/pomp_console/jpg/20160824/1472018474690.jpg', 'http://localhost:8088/app/page/item/home/itemHomePage', '嘻嘻嘻', '2', '2016-08-24 13:59:17', '2016-09-30 13:59:19', '1', '1', '1', '1', '2016-08-24 13:59:33', '1', '2016-08-24 14:01:17');
INSERT INTO `ic_adv` VALUES ('100003', '1', '测试啊啊啊啊', '/pomp_console/jpg/20160913/1473731223047.jpg', 'http://localhost:8080/console/page/index.jsp', '呵呵呵', '5', '2016-11-30 21:54:54', '2016-12-24 21:54:58', '1', '2', '1', '1', '2016-12-08 21:55:13', '1', '2016-12-09 21:55:18');
INSERT INTO `ic_adv` VALUES ('100006', '1', '测试广告位', '/pomp_console/jpg/20160913/1473731223047.jpg', 'http://localhost:8080/console/page/index.jsp', '哈哈哈', '8', '2016-09-13 09:46:17', '2016-09-30 09:46:19', '1', '1', '1', '1', '2016-09-13 09:47:09', '1', '2016-09-13 09:47:09');
INSERT INTO `ic_adv` VALUES ('100007', '1', '11111111111', '/pomp_console/jpg/20160824/TinyHydrangeas.jpg', '11111111', '111111111111', '4', '2016-12-16 00:00:00', '2016-12-19 00:00:00', '2', '2', '0', null, null, null, null);
INSERT INTO `ic_adv` VALUES ('100008', '2', '22222', '/pomp_console/jpg/20160824/MyBatis.png', '2222', '2222222222222', '6', '2016-12-20 00:00:00', '2016-12-21 00:00:00', '2', '2', '1', null, null, null, null);
INSERT INTO `ic_adv` VALUES ('100009', '2', '333333333', '/pomp_console/jpg/20160824/TinyDesert.jpg', '333333333333', '333333333333333', '7', '2016-12-11 00:00:00', '2016-12-13 00:00:00', '2', '2', '1', null, null, null, null);
INSERT INTO `ic_adv` VALUES ('100010', '1', '999999999', '/pomp_console/jpg/20160824/TinyTulips.jpg', '999999999999', '999999999999999999', '1', '2016-12-13 00:00:00', '2016-12-12 00:00:00', '2', '1', '1', null, null, null, null);
INSERT INTO `ic_adv` VALUES ('100011', '1', '7777777777', '/pomp_console/jpg/20160824/TinyHydrangeas.jpg', '77777777', '777777777777', '9', '2016-12-27 00:00:00', '2017-01-06 00:00:00', '1', '1', '1', null, null, null, null);
INSERT INTO `ic_adv` VALUES ('100012', '2', '4444444444444444', '/pomp_console/jpg/20160824/TinyHydrangeas.jpg', '444444', '444444444444444444', '10', '2016-11-27 00:00:00', '2016-12-27 00:00:00', '2', '1', '1', null, null, null, null);
INSERT INTO `ic_adv` VALUES ('100013', '1', '3123123', '/pomp_console/jpg/20160824/TinyHydrangeas.jpg', '3123', '21313123', '11', '2016-12-18 00:00:00', '2017-01-06 00:00:00', '2', '1', '1', null, null, null, null);
INSERT INTO `ic_adv` VALUES ('100014', '2', '452343423423', '/pomp_console/jpg/20160824/TinyHydrangeas.jpg', '423423423', '423423423423', '12', '2016-12-05 00:00:00', '2017-01-06 00:00:00', '2', '1', '1', null, null, null, null);
INSERT INTO `ic_adv` VALUES ('100015', '1', '4324234234234', '/pomp_console/jpg/20160824/TinyHydrangeas.jpg', '4234234', '23423423', '14', '2016-12-12 00:00:00', '2016-12-04 00:00:00', '2', '1', '1', null, null, null, null);
INSERT INTO `ic_adv` VALUES ('100016', '2', '5453453', '/pomp_console/jpg/20160824/TinyHydrangeas.jpg', '534534543', '53453453453', '13', '2016-12-08 00:00:00', '2016-12-16 00:00:00', '2', '1', '1', null, null, null, null);
INSERT INTO `ic_adv` VALUES ('100017', '1', '676576575', '/pomp_console/jpg/20160824/TinyHydrangeas.jpg', '7575757', '57465745675', '15', '2016-12-21 00:00:00', '2017-01-06 00:00:00', '2', '1', '1', null, null, null, null);
INSERT INTO `ic_adv` VALUES ('100018', '2', 'aaaaaaaa', '/pomp_console/jpg/20160824/TinyLighthouse.jpg', 'aaaaaaaaaaa', 'aaaaaaaaaaaa', '16', '2016-12-11 00:00:00', '2017-01-05 00:00:00', '3', '3', '1', null, null, null, null);
INSERT INTO `ic_adv` VALUES ('100020', '2', 'sssss', '/pomp_console/jpg/20160824/TinyJellyfish.jpg', 'http://123.com', 'ssssssssssssssss', '17', '2017-01-04 00:00:00', '2016-12-07 00:00:00', '2', '3', '1', null, null, null, null);

-- ----------------------------
-- Table structure for ic_item
-- ----------------------------
DROP TABLE IF EXISTS `ic_item`;
CREATE TABLE `ic_item` (
  `ITEM_ID` decimal(16,0) NOT NULL COMMENT '商品单元ID',
  `MALL_CAT_ID` decimal(16,0) DEFAULT NULL COMMENT '商城类目ID',
  `ITEM_CODE` decimal(16,0) DEFAULT NULL COMMENT '商品单元编码：新创建商品编码与商品单元ID相同，非新创建商品（由某个已上架商品修改）编码使用其来源商品的编码',
  `MCHT_ID` decimal(16,0) DEFAULT NULL COMMENT '商家ID',
  `MCHT_NAME` varchar(400) DEFAULT NULL COMMENT '商家名称',
  `ITEM_TYPE` decimal(6,0) DEFAULT NULL COMMENT '商品单元类型',
  `ITEM_MCHT_NO` varchar(400) DEFAULT NULL COMMENT '商品单元货码',
  `ITEM_NAME` varchar(400) DEFAULT NULL COMMENT '商品单元名称',
  `ITEM_SHORT_NAME` varchar(80) DEFAULT NULL COMMENT '商品单元简称',
  `ITEM_DESC` varchar(2000) DEFAULT NULL COMMENT '商品单元描述',
  `ITEM_DESC1` varchar(800) DEFAULT NULL COMMENT '商品单元描述1（购买须知）',
  `ITEM_DESC2` varchar(800) DEFAULT NULL COMMENT '商品单元描述2（使用流程）',
  `ITEM_DESC3` varchar(800) DEFAULT NULL COMMENT '商品单元描述3（预留）',
  `ITEM_DESC4` varchar(800) DEFAULT NULL COMMENT '商品单元描述4（预留）',
  `ITEM_COST_PRICE` decimal(18,6) DEFAULT NULL COMMENT '商品单元成本价格',
  `ITEM_MARKET_PRICE` decimal(18,6) DEFAULT NULL COMMENT '商品单元市场价格',
  `ITEM_SALE_PRICE` decimal(18,6) DEFAULT NULL COMMENT '商品单元销售价格',
  `ITEM_SALE_NUM` decimal(16,0) DEFAULT NULL COMMENT '商品单元已售数量',
  `ITEM_NUM` decimal(16,0) DEFAULT NULL COMMENT '商品单元库存数量',
  `ITEM_VALID_START` datetime DEFAULT NULL COMMENT '商品单元有效期起',
  `ITEM_VALID_END` datetime DEFAULT NULL COMMENT '商品单元有效期止',
  `ITEM_SALE_ATTR` varchar(40) DEFAULT NULL COMMENT '商品单元销售属性:第一位为免预约标识，1表示免预约，0表示不免预约;第二位表示随时退，1表示随时退，0表示不随时退',
  `ITEM_APPR_STATE` decimal(6,0) DEFAULT NULL COMMENT '商品单元审批状态:0-未提交 1-待审批（审批中） 2-审批通过 3-审批未通过',
  `ITEM_UD_STATE` decimal(6,0) DEFAULT NULL COMMENT '商品单元上下架状态:1-已上架(生效) 2-已下架 3-已强制下架 4-已替换下架 ',
  `ITEM_STATE_TIME` datetime DEFAULT NULL COMMENT '商品单元状态时间',
  `ITEM_SCHDLON_STATE` decimal(2,0) DEFAULT NULL COMMENT '商品单元定时上架状态：0-非定时上架 1-定时上架',
  `ITEM_SCHDLON_TIME` datetime DEFAULT NULL COMMENT '商品单元定时上架时间',
  `ITEM_SCHDLDOWN_TIME` datetime DEFAULT NULL COMMENT '商品单元定时下架时间',
  `ITEM_FORCEOFF_STATE` decimal(2,0) DEFAULT NULL COMMENT '商品单元强制下架状态（管理员对商品进行强制下架）：0-非强制下架 1-强制下架',
  `ITEM_FORCEOFF_TIME` datetime DEFAULT NULL COMMENT '商品单元强制下架时间（过一定时间后才允许商家修改，目前未不允许再上架，设置时间为2099-12-31）',
  `ITEM_FORCEOFF_REASON` varchar(2000) DEFAULT NULL COMMENT '商品单元强制下架原因',
  `ITEM_SEO_KEYWORD` varchar(400) DEFAULT NULL COMMENT '商品单元SEO关键词：（预留）',
  `ITEM_SEO_DESC` varchar(2000) DEFAULT NULL COMMENT '商品单元SEO描述：（预留）',
  `ITEM_MAX_BUY_NUMS` decimal(8,0) DEFAULT NULL COMMENT '商品单元最大购买数量',
  `ITEM_SALE_FLAG` decimal(2,0) DEFAULT NULL COMMENT '商品单元可售标志：（预留）0-不可售 1-可售',
  `OPTL_PAY_TYPE_STR` varchar(20) DEFAULT NULL COMMENT '可选支付方式：（预留）目前只有积分支付）',
  `DATA_VERSION` decimal(8,0) DEFAULT '1' COMMENT '数据版本号：新建时取值1，审批通过后，每发生一次商品修改时产生新产品，该产品与旧产品商品单元编码相同，但版本号加1',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFYER` decimal(16,0) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`ITEM_ID`),
  KEY `FK_IC_ITEM_MACAT` (`MALL_CAT_ID`),
  CONSTRAINT `FK_IC_ITEM_MACAT` FOREIGN KEY (`MALL_CAT_ID`) REFERENCES `ic_mall_cat` (`MALL_CAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录各商品的商品ID及属性信息';

-- ----------------------------
-- Records of ic_item
-- ----------------------------
INSERT INTO `ic_item` VALUES ('100002', '1', '100002', '1', 'fresh café', '1', '', '12英寸乳脂蛋糕一个团购', null, '仅售20元，价值168元12英寸乳脂蛋糕！配送自提均可，需预约！', '团购用户还可享受优惠，请详询商家\r\n每张糯米券限1人使用\r\n每次消费不限使用糯米券张数，可叠加使用\r\n当天制作，保质期1天\r\n提供免费包装\r\n可免费写字\r\n收费提供卡片\r\n免费包含蜡烛+刀叉+小盘\r\n配送自取均可，具体要求为：详询商家\r\n精选优质原材料，蛋糕均为当天制作。1英寸≈2.54㎝，可以添加微信账号18612737815选择其他图案。', '请至少提前2小时预约，详询商家.\r\n精选优质原材料，蛋糕均为当天制作，1英寸≈2.54㎝多种图像选择', null, null, null, '20.000000', '20.000000', '24', '76', '2016-08-24 12:03:19', '2016-09-30 12:00:21', '11', '2', '4', null, null, '2016-08-24 12:03:09', '2016-09-30 12:03:13', null, null, null, null, null, null, null, null, '4', '1', '1001', '2016-08-24 12:06:06', '1001', '2016-08-24 13:07:01');
INSERT INTO `ic_item` VALUES ('100009', '1', '100002', '1', 'fresh café', '1', '', '18英寸乳脂蛋糕一个团购', null, '仅售20元，价值168元12英寸乳脂蛋糕！配送自提均可，需预约！', '团购用户还可享受优惠，请详询商家\r\n每张糯米券限1人使用\r\n每次消费不限使用糯米券张数，可叠加使用\r\n当天制作，保质期1天\r\n提供免费包装\r\n可免费写字\r\n收费提供卡片\r\n免费包含蜡烛+刀叉+小盘\r\n配送自取均可，具体要求为：详询商家\r\n精选优质原材料，蛋糕均为当天制作。1英寸≈2.54㎝，可以添加微信账号18612737815选择其他图案。', '请至少提前2小时预约，详询商家.\r\n精选优质原材料，蛋糕均为当天制作，1英寸≈2.54㎝多种图像选择', null, null, null, '20.000000', '20.000000', null, '76', '2016-08-24 12:03:19', '2016-09-30 12:00:21', '11', '2', '1', null, null, '2016-08-24 12:03:09', '2016-09-30 12:03:13', null, null, null, null, null, null, null, null, '1', '1', '1001', '2016-09-13 09:58:31', '1001', '2016-09-13 09:58:31');

-- ----------------------------
-- Table structure for ic_item_evaluation
-- ----------------------------
DROP TABLE IF EXISTS `ic_item_evaluation`;
CREATE TABLE `ic_item_evaluation` (
  `EVALUATION_ID` decimal(16,0) NOT NULL COMMENT '商品评价ID',
  `MCHT_ID` decimal(16,0) NOT NULL COMMENT '商家ID',
  `SHOP_ID` decimal(16,0) DEFAULT NULL COMMENT '门店ID',
  `ITEM_ID` decimal(16,0) NOT NULL COMMENT '商品单元ID',
  `ITEM_CODE` decimal(16,0) DEFAULT NULL COMMENT '商品单元编码：新创建商品编码与商品单元ID相同，非新创建商品（由某个已上架商品修改）编码使用其来源商品的编码',
  `USER_ID` decimal(16,0) DEFAULT NULL COMMENT '用户ID',
  `USER_PIC` varchar(400) DEFAULT NULL COMMENT '用户头像',
  `USER_NICKNAME` varchar(80) DEFAULT NULL COMMENT '用户昵称',
  `MEMBER_LEVEL` decimal(6,0) DEFAULT NULL COMMENT '会员等级',
  `EVALUATION_CONTENT` varchar(2000) DEFAULT NULL COMMENT '评价内容',
  `EVALUATION_GRADE` decimal(6,2) DEFAULT NULL COMMENT '商品评分',
  `MCHT_GRADE` decimal(6,2) DEFAULT NULL COMMENT '商家评分',
  `EVALUATION_TIME` datetime DEFAULT NULL COMMENT '评价时间',
  `EVALUATION_STATUS` decimal(2,0) DEFAULT NULL COMMENT '评价审核状态:1-未审核 2-审核通过可见 3-审核不通过 4-审核通过不可见',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFYER` decimal(16,0) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`EVALUATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录用户评价商品的信息\r\n';

-- ----------------------------
-- Records of ic_item_evaluation
-- ----------------------------
INSERT INTO `ic_item_evaluation` VALUES ('0', '0', null, '0', null, null, null, null, null, null, null, null, null, null, '1', null, null, null, null);
INSERT INTO `ic_item_evaluation` VALUES ('100001', '1', '1001', '100002', '100002', '100001', null, 'skyo', null, '非常不错哦！', '5.00', '5.00', '2016-08-25 11:17:07', '2', '1', null, '2016-08-25 11:17:07', '1', '2016-12-22 00:36:41');
INSERT INTO `ic_item_evaluation` VALUES ('100002', '1', '1001', '100002', '100002', '100001', null, 'skyo', null, '很好吃都来试试吧！', '5.00', '5.00', '2016-12-06 15:37:34', '2', '1', null, '2016-12-16 15:37:42', '1', '2016-12-22 00:36:45');

-- ----------------------------
-- Table structure for ic_item_evaluation_pic
-- ----------------------------
DROP TABLE IF EXISTS `ic_item_evaluation_pic`;
CREATE TABLE `ic_item_evaluation_pic` (
  `ITEMPIC_ID` decimal(16,0) NOT NULL COMMENT '商品图片ID',
  `EVALUATION_ID` decimal(16,0) DEFAULT NULL COMMENT '商品评价ID',
  `ITEM_PIC_URL` varchar(800) DEFAULT NULL COMMENT '图片URL（图片文件的路径文件名）',
  `ITEMPIC_DFLT_FLAG` decimal(2,0) DEFAULT NULL COMMENT '图片默认标志：1-默认 0-非默认',
  `ITEMPIC_ORDER` decimal(6,0) DEFAULT NULL COMMENT '图片排序',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFYER` decimal(16,0) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`ITEMPIC_ID`),
  KEY `FK_EVL_RLT_EPIC` (`EVALUATION_ID`),
  CONSTRAINT `FK_EVL_RLT_EPIC` FOREIGN KEY (`EVALUATION_ID`) REFERENCES `ic_item_evaluation` (`EVALUATION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录上传的商品评价图片信息';

-- ----------------------------
-- Records of ic_item_evaluation_pic
-- ----------------------------
INSERT INTO `ic_item_evaluation_pic` VALUES ('100000', '100001', '/pomp_app/jpg/20160825/14720950276411419292-qf5w7paipq-15610635287334932.jpg', '0', '1', '1', '1', '2016-08-25 11:17:07', '1', '2016-09-19 10:33:35');
INSERT INTO `ic_item_evaluation_pic` VALUES ('100001', '100001', '/pomp_app/jpg/20160825/123123.jpg', '0', '1', '1', '1', '2016-12-20 13:10:56', '1', '2016-12-25 13:11:01');
INSERT INTO `ic_item_evaluation_pic` VALUES ('100002', '100002', '/pomp_app/jpg/20160825/342342342342341231.jpg', '0', '1', '1', '1', null, null, null);

-- ----------------------------
-- Table structure for ic_item_picture
-- ----------------------------
DROP TABLE IF EXISTS `ic_item_picture`;
CREATE TABLE `ic_item_picture` (
  `ITEMPIC_ID` decimal(16,0) NOT NULL COMMENT '商品图片ID',
  `ITEM_ID` decimal(16,0) DEFAULT NULL COMMENT '商品单元ID',
  `ITEM_PIC_URL` varchar(800) DEFAULT NULL COMMENT '商品图片URL（图片文件的路径文件名）',
  `ITEMPIC_DFLT_FLAG` decimal(2,0) DEFAULT NULL COMMENT '商品图片默认标志：1-默认 0-非默认',
  `ITEMPIC_ORDER` decimal(6,0) DEFAULT NULL COMMENT '商品图片排序',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFYER` decimal(16,0) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`ITEMPIC_ID`),
  KEY `FK_ITEM_RLT_IPIC` (`ITEM_ID`),
  CONSTRAINT `FK_ITEM_RLT_IPIC` FOREIGN KEY (`ITEM_ID`) REFERENCES `ic_item` (`ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录上传的商品图片信息';

-- ----------------------------
-- Records of ic_item_picture
-- ----------------------------
INSERT INTO `ic_item_picture` VALUES ('100004', '100002', '/pomp_console/item/20160824/100006.jpg', '1', '1', '1', null, '2016-08-24 13:07:01', null, '2016-08-24 13:07:01');
INSERT INTO `ic_item_picture` VALUES ('100005', '100009', '/pomp_console/item/20160824/100006.jpg', '1', '1', '1', '1001', '2016-09-13 09:58:31', '1001', '2016-09-13 09:58:31');

-- ----------------------------
-- Table structure for ic_item_recom
-- ----------------------------
DROP TABLE IF EXISTS `ic_item_recom`;
CREATE TABLE `ic_item_recom` (
  `ITEM_RECOM_ID` decimal(16,0) NOT NULL COMMENT '商品推荐ID',
  `ITEM_ID` decimal(16,0) DEFAULT NULL COMMENT '商品单元ID',
  `ITEM_CODE` decimal(16,0) DEFAULT NULL COMMENT '商品单元编码：新创建商品编码与商品单元ID相同，非新创建商品（由某个已上架商品修改）编码使用其来源商品的编码',
  `ITEM_RECOM_POS` decimal(2,0) DEFAULT NULL COMMENT '商品推荐区域：1-猜你喜欢 2-特价区 3-购买推荐',
  `ITEM_RECOM_ORDER` decimal(6,0) DEFAULT NULL COMMENT '商品推荐顺序',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFYER` decimal(16,0) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`ITEM_RECOM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品推荐表';

-- ----------------------------
-- Records of ic_item_recom
-- ----------------------------
INSERT INTO `ic_item_recom` VALUES ('100001', '100002', '100002', '1', '1', '1', '1', '2016-09-13 09:49:12', '1', '2016-09-13 09:49:12');

-- ----------------------------
-- Table structure for ic_item_shop_range
-- ----------------------------
DROP TABLE IF EXISTS `ic_item_shop_range`;
CREATE TABLE `ic_item_shop_range` (
  `ITEM_SHOP_RANGE_ID` decimal(16,0) NOT NULL,
  `ITEM_ID` decimal(16,0) DEFAULT NULL COMMENT '商品单元ID',
  `SHOP_ID` decimal(16,0) DEFAULT NULL COMMENT '门店ID',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFYER` decimal(16,0) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`ITEM_SHOP_RANGE_ID`),
  KEY `FK_ITEM_RLT_SRG` (`ITEM_ID`),
  CONSTRAINT `FK_ITEM_RLT_SRG` FOREIGN KEY (`ITEM_ID`) REFERENCES `ic_item` (`ITEM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录商品可售的门店';

-- ----------------------------
-- Records of ic_item_shop_range
-- ----------------------------
INSERT INTO `ic_item_shop_range` VALUES ('100007', '100002', '1001', '1', null, '2016-08-24 13:07:01', null, '2016-08-24 13:07:01');
INSERT INTO `ic_item_shop_range` VALUES ('100008', '100002', '1002', '1', null, '2016-08-24 13:07:01', null, '2016-08-24 13:07:01');
INSERT INTO `ic_item_shop_range` VALUES ('100009', '100009', '1001', '1', '1001', '2016-09-13 09:58:31', '1001', '2016-09-13 09:58:31');
INSERT INTO `ic_item_shop_range` VALUES ('100010', '100009', '1002', '1', '1001', '2016-09-13 09:58:31', '1001', '2016-09-13 09:58:31');

-- ----------------------------
-- Table structure for ic_item_type
-- ----------------------------
DROP TABLE IF EXISTS `ic_item_type`;
CREATE TABLE `ic_item_type` (
  `ITEM_TYPE` decimal(6,0) NOT NULL COMMENT '商品单元类型',
  `ITEM_TYPE_NAME` varchar(400) DEFAULT NULL COMMENT '商品单元类型名称',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  PRIMARY KEY (`ITEM_TYPE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品单元类型';

-- ----------------------------
-- Records of ic_item_type
-- ----------------------------
INSERT INTO `ic_item_type` VALUES ('1', '普通', '1');
INSERT INTO `ic_item_type` VALUES ('2', '联通直订', '1');
INSERT INTO `ic_item_type` VALUES ('3', '商家串码', '1');
INSERT INTO `ic_item_type` VALUES ('5', '璐璐通', '1');

-- ----------------------------
-- Table structure for ic_mall_cat
-- ----------------------------
DROP TABLE IF EXISTS `ic_mall_cat`;
CREATE TABLE `ic_mall_cat` (
  `MALL_CAT_ID` decimal(16,0) NOT NULL COMMENT '商城类目ID',
  `SUP_MALL_CAT_ID` decimal(16,0) DEFAULT NULL COMMENT '上级商城类目ID:一级商品类目的上级为空',
  `MALL_CAT_CODE` varchar(40) DEFAULT NULL COMMENT '商城类目编码（类目标识）',
  `MALL_CAT_NAME` varchar(400) DEFAULT NULL COMMENT '商城类目名称',
  `MALL_CAT_DESC` varchar(2000) DEFAULT NULL COMMENT '商城类目描述',
  `MALL_CAT_PROMOTION` varchar(2000) DEFAULT NULL COMMENT '商城类目促销语',
  `MALL_CAT_LEVEL` decimal(2,0) DEFAULT NULL COMMENT '商城类目级别：1-一级 2-二级 3-三级',
  `MALL_CAT_LVL_PATH` varchar(400) DEFAULT NULL COMMENT '商城类目层级路径（从根节点ID到当前节点ID的层级路径串，用#分割，并以#开头结尾）',
  `MALL_CAT_ORDER` decimal(10,0) DEFAULT NULL COMMENT '商城类目顺序',
  `MALL_CAT_PIC_URL` varchar(800) DEFAULT NULL COMMENT '商城类目图片URL',
  `MALL_CAT_LEAF_FLAG` decimal(2,0) DEFAULT NULL COMMENT '商城类目叶子节点标志：1-是 0-否',
  `MALL_CAT_STATE` decimal(2,0) DEFAULT NULL COMMENT '商城类目状态：0-未启用 1-启用 ',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFYER` decimal(16,0) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`MALL_CAT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录商城后台的物理类目信息（即集团统一类目；此类目数据只有一套，通过类目范围控制各省显示的类目）\r\n';

-- ----------------------------
-- Records of ic_mall_cat
-- ----------------------------
INSERT INTO `ic_mall_cat` VALUES ('0', null, null, '1111111111', '11111111111111111', null, null, null, null, '/pomp_app/jpg/content/GitHub_face.jpg', null, null, '0', '1', '2016-12-20 01:03:27', '1', '2016-12-21 00:30:50');
INSERT INTO `ic_mall_cat` VALUES ('1', null, '1', '美食', '食品相关', null, '1', null, '1', '/pomp_app/jpg/content/food.png', null, '1', '1', null, null, null, null);
INSERT INTO `ic_mall_cat` VALUES ('2', null, '2', '电影', '看电影', null, '1', null, '2', '/pomp_app/jpg/content/movie.png', null, '1', '1', null, null, null, null);
INSERT INTO `ic_mall_cat` VALUES ('3', null, '3', '充值', '话费，游戏币等虚拟货币充值', null, '1', null, '3', '/pomp_app/jpg/content/pay.png', null, '1', '1', null, null, null, null);
INSERT INTO `ic_mall_cat` VALUES ('4', null, '4', '装饰', '装饰品', null, '1', null, '4', '/pomp_app/jpg/content/decorate.png', null, '1', '1', null, null, null, null);
INSERT INTO `ic_mall_cat` VALUES ('5', null, '5', '金融', '金融相关服务', null, '1', null, '5', '/pomp_app/jpg/content/finance.png', null, '1', '1', null, null, null, null);
INSERT INTO `ic_mall_cat` VALUES ('6', null, '6', '旅游', '旅游，酒店等', null, '1', null, '6', '/pomp_app/jpg/content/tra.png', null, '1', '1', null, null, null, null);
INSERT INTO `ic_mall_cat` VALUES ('100008', null, null, '2222222222222', '22222222222222222222', null, null, null, null, '/pomp_app/jpg/content/GitHub_face.jpg', null, null, '0', '1', '2016-12-20 01:06:22', '1', '2016-12-21 00:31:01');
INSERT INTO `ic_mall_cat` VALUES ('100010', null, null, '33333333333', '3333333333333333333', null, null, null, null, '/pomp_app/jpg/content/GitHub_face.jpg', null, null, '1', '1', '2016-12-20 01:11:32', null, null);
INSERT INTO `ic_mall_cat` VALUES ('100011', null, null, '444444444444444', '4444444444444444444444444444', null, null, null, null, '/pomp_app/jpg/content/GitHub_face.jpg', null, null, '1', '1', '2016-12-20 01:24:53', '1', '2016-12-20 01:42:01');
INSERT INTO `ic_mall_cat` VALUES ('100012', null, null, '5555555555555', '55555555555555555555555', null, null, null, null, '/pomp_app/jpg/content/GitHub_face.jpg', null, null, '1', '1', '2016-12-20 01:45:43', null, null);
INSERT INTO `ic_mall_cat` VALUES ('100013', null, null, '888888888888888', '8888888888888我的天哪', null, null, null, null, '/pomp_app/jpg/content/GitHub.jpg', null, null, '1', '1', '2016-12-21 01:11:21', '1', '2016-12-22 00:38:00');
INSERT INTO `ic_mall_cat` VALUES ('100014', null, null, '99999999999999', '999999999999999', null, null, null, null, '/pomp_app/jpg/content/GitHub_face.jpg', null, null, '1', '1', '2016-12-21 01:11:50', null, null);
INSERT INTO `ic_mall_cat` VALUES ('100015', null, null, 'testup', 'testup', null, null, null, null, '/pomp_app/jpg/content/TinyKoala.jpg', null, null, '1', '1', '2016-12-22 17:13:59', null, null);

-- ----------------------------
-- Table structure for list_def
-- ----------------------------
DROP TABLE IF EXISTS `list_def`;
CREATE TABLE `list_def` (
  `LIST_ID` decimal(16,0) NOT NULL COMMENT '名单ID',
  `LIST_NAME` varchar(80) DEFAULT NULL COMMENT '名单名称',
  `LIST_DESC` varchar(400) DEFAULT NULL COMMENT '名单描述',
  `LIST_USER_NUM` decimal(16,0) DEFAULT NULL COMMENT '名单用户数',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  PRIMARY KEY (`LIST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='名单定义表';

-- ----------------------------
-- Records of list_def
-- ----------------------------

-- ----------------------------
-- Table structure for list_info
-- ----------------------------
DROP TABLE IF EXISTS `list_info`;
CREATE TABLE `list_info` (
  `LIST_INFO_ID` decimal(16,0) NOT NULL COMMENT '名单信息ID',
  `LIST_ID` decimal(16,0) DEFAULT NULL COMMENT '名单ID',
  `USER_CODE` varchar(30) DEFAULT NULL COMMENT '用户代码',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`LIST_INFO_ID`),
  KEY `FK_LINFO_RLT_LIST` (`LIST_ID`),
  CONSTRAINT `FK_LINFO_RLT_LIST` FOREIGN KEY (`LIST_ID`) REFERENCES `list_def` (`LIST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='名单信息表';

-- ----------------------------
-- Records of list_info
-- ----------------------------

-- ----------------------------
-- Table structure for pc_account
-- ----------------------------
DROP TABLE IF EXISTS `pc_account`;
CREATE TABLE `pc_account` (
  `ACCOUNT_ID` decimal(16,0) NOT NULL COMMENT '用户积分账户ID',
  `USER_ID` decimal(16,0) DEFAULT NULL COMMENT '用户ID',
  `ACCOUNT_POINT` decimal(16,2) DEFAULT NULL COMMENT '用户积分值',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFYER` decimal(16,0) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`ACCOUNT_ID`),
  KEY `FK_USR_RLT_ACC` (`USER_ID`),
  CONSTRAINT `FK_USR_RLT_ACC` FOREIGN KEY (`USER_ID`) REFERENCES `uc_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录用户积分的汇总信息，一个用户一条记录';

-- ----------------------------
-- Records of pc_account
-- ----------------------------
INSERT INTO `pc_account` VALUES ('100001', '100001', '571.00', '1', null, '2016-08-24 13:08:58', null, null);
INSERT INTO `pc_account` VALUES ('100002', '100002', '0.00', '1', null, '2016-09-07 10:43:54', null, null);

-- ----------------------------
-- Table structure for pc_account_log
-- ----------------------------
DROP TABLE IF EXISTS `pc_account_log`;
CREATE TABLE `pc_account_log` (
  `ACCOUNT_LOG_ID` decimal(16,0) NOT NULL COMMENT '用户积分流水表ID',
  `ACCOUNT_ID` decimal(16,0) DEFAULT NULL COMMENT '用户积分账户ID',
  `USER_ID` decimal(16,0) NOT NULL COMMENT '用户ID',
  `OP_DATE` datetime DEFAULT NULL COMMENT '业务发生时间',
  `OP_STATE` decimal(2,0) DEFAULT NULL COMMENT '操作状态：1-成功 2-失败 3-撤销',
  `OP_TYPE` decimal(3,0) DEFAULT NULL COMMENT '操作类型：101-兑换 102-通过好友获赠 103-签到获得积分 104-添加好友获得积分 105-大转盘游戏 201-购买商品 202-赠送好友 203-游戏消耗',
  `OP_OBJ_ID` decimal(16,0) DEFAULT NULL COMMENT '操作对象ID：积分的来源者，如兑换的积分供应商ID、积分转赠人用户ID、游戏ID等；积分的获得者，如获赠积分的用户ID、购买到的商品ID等',
  `OP_OBJ_NAME` varchar(400) DEFAULT NULL COMMENT '操作对象名称',
  `OP_LOG_ID` decimal(16,0) DEFAULT NULL COMMENT '操作流水日志ID：商品购买为订单ID，积分赠送为积分赠送日志ID，游戏为游戏日志ID，积分兑换为积分兑换日志ID',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFYER` decimal(16,0) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`ACCOUNT_LOG_ID`),
  KEY `FK_ACC_RLT_ALOG` (`ACCOUNT_ID`),
  CONSTRAINT `FK_ACC_RLT_ALOG` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `pc_account` (`ACCOUNT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户积分流水表：记录用户积分的所有流水，包括积分赠送、积分消耗、积分兑换等';

-- ----------------------------
-- Records of pc_account_log
-- ----------------------------
INSERT INTO `pc_account_log` VALUES ('100001', '100001', '100001', '2016-08-24 13:53:28', '1', '101', '1', '甘肃联通', '100001', null, '2016-08-24 13:53:28', null, null);
INSERT INTO `pc_account_log` VALUES ('100002', '100001', '100001', '2016-08-24 14:01:56', '1', '201', '100002', '12英寸乳脂蛋糕一个团购', '100001', null, '2016-08-24 14:01:56', null, null);
INSERT INTO `pc_account_log` VALUES ('100003', '100001', '100001', '2016-08-24 14:01:56', '1', '201', '100002', '12英寸乳脂蛋糕一个团购', '100002', null, '2016-08-24 14:01:56', null, null);
INSERT INTO `pc_account_log` VALUES ('100004', '100001', '100001', '2016-08-24 14:01:56', '1', '201', '100002', '12英寸乳脂蛋糕一个团购', '100003', null, '2016-08-24 14:01:56', null, null);
INSERT INTO `pc_account_log` VALUES ('100005', '100001', '100001', '2016-08-24 14:51:25', '3', '201', '100002', '12英寸乳脂蛋糕一个团购', '100002', '1', '2016-08-24 14:51:25', null, null);
INSERT INTO `pc_account_log` VALUES ('100006', '100001', '100001', '2016-08-25 11:15:30', '1', '201', '100002', '12英寸乳脂蛋糕一个团购', '100004', null, '2016-08-25 11:15:30', null, null);
INSERT INTO `pc_account_log` VALUES ('100007', '100001', '100001', '2016-08-25 11:29:26', '1', '201', '100002', '12英寸乳脂蛋糕一个团购', '100005', null, '2016-08-25 11:29:26', null, null);
INSERT INTO `pc_account_log` VALUES ('100008', '100001', '100001', '2016-08-29 17:52:15', '1', '201', '100002', '12英寸乳脂蛋糕一个团购', '100006', null, '2016-08-29 17:52:15', null, null);
INSERT INTO `pc_account_log` VALUES ('100009', '100001', '100001', '2016-08-29 17:52:15', '1', '201', '100002', '12英寸乳脂蛋糕一个团购', '100007', null, '2016-08-29 17:52:15', null, null);
INSERT INTO `pc_account_log` VALUES ('100010', '100001', '100001', '2016-09-07 10:54:02', '1', '101', '1', '联通', '100002', null, '2016-09-07 10:54:02', null, null);
INSERT INTO `pc_account_log` VALUES ('100011', '100001', '100001', '2016-09-07 10:56:44', '1', '101', '1', '联通', '100003', null, '2016-09-07 10:56:44', null, null);
INSERT INTO `pc_account_log` VALUES ('100012', '100001', '100001', '2016-09-07 10:57:55', '1', '101', '1', '联通', '100004', null, '2016-09-07 10:57:55', null, null);
INSERT INTO `pc_account_log` VALUES ('100013', '100001', '100001', '2016-09-07 11:00:37', '1', '201', '100002', '12英寸乳脂蛋糕一个团购', '100008', null, '2016-09-07 11:00:37', null, null);
INSERT INTO `pc_account_log` VALUES ('100014', '100001', '100001', '2016-09-07 11:00:37', '1', '201', '100002', '12英寸乳脂蛋糕一个团购', '100009', null, '2016-09-07 11:00:37', null, null);
INSERT INTO `pc_account_log` VALUES ('100015', '100001', '100001', '2016-09-07 11:04:31', '1', '201', '100002', '12英寸乳脂蛋糕一个团购', '100010', null, '2016-09-07 11:04:31', null, null);
INSERT INTO `pc_account_log` VALUES ('100016', '100001', '100001', '2016-09-13 09:10:09', '1', '101', '1', '联通', '100005', null, '2016-09-13 09:10:09', null, null);
INSERT INTO `pc_account_log` VALUES ('100017', '100001', '100001', '2016-09-13 09:18:48', '1', '201', '100002', '12英寸乳脂蛋糕一个团购', '100011', null, '2016-09-13 09:18:48', null, null);
INSERT INTO `pc_account_log` VALUES ('100018', '100001', '100001', '2016-09-13 09:18:48', '1', '201', '100002', '12英寸乳脂蛋糕一个团购', '100012', null, '2016-09-13 09:18:48', null, null);
INSERT INTO `pc_account_log` VALUES ('100019', '100001', '100001', '2016-09-13 09:19:10', '1', '201', '100002', '12英寸乳脂蛋糕一个团购', '100013', null, '2016-09-13 09:19:10', null, null);
INSERT INTO `pc_account_log` VALUES ('100020', '100001', '100001', '2016-09-13 09:19:10', '1', '201', '100002', '12英寸乳脂蛋糕一个团购', '100014', null, '2016-09-13 09:19:10', null, null);
INSERT INTO `pc_account_log` VALUES ('100021', '100001', '100001', '2016-09-13 09:19:10', '1', '201', '100002', '12英寸乳脂蛋糕一个团购', '100015', null, '2016-09-13 09:19:10', null, null);
INSERT INTO `pc_account_log` VALUES ('100022', '100001', '100001', '2016-09-13 09:19:11', '1', '201', '100002', '12英寸乳脂蛋糕一个团购', '100016', null, '2016-09-13 09:19:11', null, null);
INSERT INTO `pc_account_log` VALUES ('100023', '100001', '100001', '2016-09-13 09:19:11', '1', '201', '100002', '12英寸乳脂蛋糕一个团购', '100017', null, '2016-09-13 09:19:11', null, null);
INSERT INTO `pc_account_log` VALUES ('100024', '100001', '100001', '2016-09-13 09:19:11', '1', '201', '100002', '12英寸乳脂蛋糕一个团购', '100018', null, '2016-09-13 09:19:11', null, null);
INSERT INTO `pc_account_log` VALUES ('100025', '100001', '100001', '2016-09-13 09:19:11', '1', '201', '100002', '12英寸乳脂蛋糕一个团购', '100019', null, '2016-09-13 09:19:11', null, null);
INSERT INTO `pc_account_log` VALUES ('100026', '100001', '100001', '2016-09-13 09:19:11', '1', '201', '100002', '12英寸乳脂蛋糕一个团购', '100020', null, '2016-09-13 09:19:11', null, null);
INSERT INTO `pc_account_log` VALUES ('100027', '100001', '100001', '2016-09-13 09:19:11', '1', '201', '100002', '12英寸乳脂蛋糕一个团购', '100021', null, '2016-09-13 09:19:11', null, null);
INSERT INTO `pc_account_log` VALUES ('100028', '100001', '100001', '2016-09-13 09:19:11', '1', '201', '100002', '12英寸乳脂蛋糕一个团购', '100022', null, '2016-09-13 09:19:11', null, null);
INSERT INTO `pc_account_log` VALUES ('100029', '100001', '100001', '2016-09-13 09:19:11', '1', '201', '100002', '12英寸乳脂蛋糕一个团购', '100023', null, '2016-09-13 09:19:11', null, null);
INSERT INTO `pc_account_log` VALUES ('100030', '100001', '100001', '2016-09-13 09:19:11', '1', '201', '100002', '12英寸乳脂蛋糕一个团购', '100024', null, '2016-09-13 09:19:11', null, null);

-- ----------------------------
-- Table structure for pc_exchange_log
-- ----------------------------
DROP TABLE IF EXISTS `pc_exchange_log`;
CREATE TABLE `pc_exchange_log` (
  `EXCHANGE_LOG_ID` decimal(16,0) NOT NULL COMMENT '用户积分兑换流水ID',
  `PROVIDER_ID` decimal(16,0) DEFAULT NULL COMMENT '积分供应商',
  `ACCOUNT_ID` decimal(16,0) DEFAULT NULL COMMENT '用户积分账户ID',
  `OP_DATE` datetime DEFAULT NULL COMMENT '业务发生时间',
  `OP_STATE` decimal(2,0) DEFAULT NULL COMMENT '操作状态：1-成功 2-失败 3-撤销',
  `PROVIDER_POINT_NUM` decimal(16,0) DEFAULT NULL,
  `PROVIDER_POINT_REMAIN` decimal(16,0) DEFAULT NULL,
  `POINT_NUM` decimal(16,2) DEFAULT NULL COMMENT '积分数量',
  `PROVIDER_USER_CODE` varchar(80) DEFAULT NULL COMMENT '用户在供应商平台的用户名',
  `EXP_STATE` decimal(2,0) DEFAULT NULL COMMENT '导出状态:1-已导出 2-未导出',
  `EXP_DATE` datetime DEFAULT NULL COMMENT '导出日期',
  `CHECK_STATE` decimal(2,0) DEFAULT NULL COMMENT '对账状态:1-已对账 2-未对账',
  `CHECK_DATE` datetime DEFAULT NULL COMMENT '结算日期',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFYER` decimal(16,0) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`EXCHANGE_LOG_ID`),
  KEY `FK_ACC_RLT_ELOG` (`ACCOUNT_ID`),
  KEY `FK_PRV_RLT_ELOG` (`PROVIDER_ID`),
  CONSTRAINT `FK_ACC_RLT_ELOG` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `pc_account` (`ACCOUNT_ID`),
  CONSTRAINT `FK_PRV_RLT_ELOG` FOREIGN KEY (`PROVIDER_ID`) REFERENCES `pc_provider` (`PROVIDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pc_exchange_log
-- ----------------------------
INSERT INTO `pc_exchange_log` VALUES ('100001', '1', '100001', '2016-08-24 13:53:28', '1', '100000', '-90000', '1000.00', '18201310500', '1', '2016-09-13 10:13:42', '2', null, '1', null, '2016-08-24 13:53:28', null, null);
INSERT INTO `pc_exchange_log` VALUES ('100002', '1', '100001', '2016-09-07 10:54:02', '1', '1000', '9000', '10.00', '18201310500', '1', '2016-09-13 10:13:42', '2', null, '1', null, '2016-09-07 10:54:02', null, null);
INSERT INTO `pc_exchange_log` VALUES ('100003', '1', '100001', '2016-09-07 10:56:44', '1', '1000', '9000', '10.00', '18201310500', '1', '2016-09-13 10:13:42', '2', null, '1', null, '2016-09-07 10:56:44', null, null);
INSERT INTO `pc_exchange_log` VALUES ('100004', '1', '100001', '2016-09-07 10:57:55', '1', '100', '9900', '1.00', '18612341234', '1', '2016-09-13 10:13:42', '2', null, '1', null, '2016-09-07 10:57:55', null, null);
INSERT INTO `pc_exchange_log` VALUES ('100005', '1', '100001', '2016-09-13 09:10:09', '1', '1000', '9000', '10.00', '18622334455', '1', '2016-09-13 10:13:42', '2', null, '1', null, '2016-09-13 09:10:09', null, null);

-- ----------------------------
-- Table structure for pc_game
-- ----------------------------
DROP TABLE IF EXISTS `pc_game`;
CREATE TABLE `pc_game` (
  `GAME_ID` decimal(16,0) NOT NULL COMMENT '游戏ID',
  `TMPLT_ID` decimal(16,0) DEFAULT NULL COMMENT '游戏模板ID',
  `GAME_NAME` varchar(400) DEFAULT NULL COMMENT '游戏名称',
  `GAME_DESC` varchar(2000) DEFAULT NULL COMMENT '游戏描述',
  `GAME_TYPE` decimal(6,0) DEFAULT NULL COMMENT '游戏类型：1-大转盘',
  `GAME_START_TIME` datetime DEFAULT NULL COMMENT '游戏开始时间',
  `GAME_END_TIME` datetime DEFAULT NULL COMMENT '游戏结束时间',
  `GAME_STOP_STATE` decimal(2,0) DEFAULT NULL COMMENT '游戏暂停状态:0-暂停 1-进行中',
  `USER_GAME_FREE_NUM` decimal(16,0) DEFAULT NULL COMMENT '单用户每日免费次数：必须为正整数，0表示无免费',
  `USER_GAME_LIMIT_NUM` decimal(16,0) DEFAULT NULL COMMENT '单用户每日次数上限：必须为正整数，999999表示不限制上限',
  `GAME_FEE` decimal(16,0) DEFAULT NULL COMMENT '每次付费积分：必须为正整数',
  `IMG_URL` varchar(2000) DEFAULT NULL COMMENT '图片url',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFYER` decimal(16,0) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`GAME_ID`),
  KEY `FK_TMPLT_RLT_GAME` (`TMPLT_ID`),
  CONSTRAINT `FK_TMPLT_RLT_GAME` FOREIGN KEY (`TMPLT_ID`) REFERENCES `pc_game_templet` (`TMPLT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='游戏表';

-- ----------------------------
-- Records of pc_game
-- ----------------------------

-- ----------------------------
-- Table structure for pc_game_award_log
-- ----------------------------
DROP TABLE IF EXISTS `pc_game_award_log`;
CREATE TABLE `pc_game_award_log` (
  `GAME_AWARD_LOG_ID` decimal(16,0) NOT NULL COMMENT '游戏中奖纪录ID',
  `GAME_ID` decimal(16,0) DEFAULT NULL COMMENT '游戏ID',
  `USER_ID` decimal(16,0) DEFAULT NULL COMMENT '用户ID',
  `GAME_RULE_AWARD_ID` decimal(16,0) DEFAULT NULL COMMENT '游戏抽奖规则奖品ID',
  `AWARD_STATUS` decimal(2,0) DEFAULT NULL COMMENT '中奖状态：1-中奖 2-未中奖',
  `AWARD_ID` decimal(16,0) DEFAULT NULL COMMENT '奖品ID',
  `AWARD_NAME` varchar(400) DEFAULT NULL COMMENT '奖品名称',
  `AWARD_TYPE` decimal(6,0) DEFAULT NULL COMMENT '奖品类型:1-积分 2-其他',
  `AWARD_VALUE` decimal(16,0) DEFAULT NULL COMMENT '奖品积分价值',
  `AWARD_SEND_STATE` decimal(2,0) DEFAULT NULL COMMENT '奖品发放状态：1-未发送 2-已发放 3-已撤销',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFYER` decimal(16,0) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`GAME_AWARD_LOG_ID`),
  KEY `FK_GM_RLT_GMLG` (`GAME_ID`),
  CONSTRAINT `FK_GM_RLT_GMLG` FOREIGN KEY (`GAME_ID`) REFERENCES `pc_game` (`GAME_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='游戏中奖纪录表';

-- ----------------------------
-- Records of pc_game_award_log
-- ----------------------------

-- ----------------------------
-- Table structure for pc_game_rule
-- ----------------------------
DROP TABLE IF EXISTS `pc_game_rule`;
CREATE TABLE `pc_game_rule` (
  `RULE_ID` decimal(16,0) NOT NULL,
  `GAME_ID` decimal(16,0) DEFAULT NULL COMMENT '游戏ID',
  `RULE_START_TIME` datetime DEFAULT NULL,
  `RULE_END_TIME` datetime DEFAULT NULL,
  `RULE_OBJ_ID` decimal(16,0) DEFAULT NULL COMMENT '抽奖规则对象：0表示普通用户，非0表示特殊名单ID',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFYER` decimal(16,0) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`RULE_ID`),
  KEY `FK_GAME_RLT_RUL` (`GAME_ID`),
  CONSTRAINT `FK_GAME_RLT_RUL` FOREIGN KEY (`GAME_ID`) REFERENCES `pc_game` (`GAME_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='游戏抽奖规则表';

-- ----------------------------
-- Records of pc_game_rule
-- ----------------------------

-- ----------------------------
-- Table structure for pc_game_rule_award
-- ----------------------------
DROP TABLE IF EXISTS `pc_game_rule_award`;
CREATE TABLE `pc_game_rule_award` (
  `GAME_RULE_AWARD_ID` decimal(16,0) NOT NULL COMMENT '游戏抽奖规则奖品ID',
  `RULE_ID` decimal(16,0) DEFAULT NULL,
  `AWARD_ID` decimal(16,0) DEFAULT NULL COMMENT '奖品ID',
  `AWARD_RN` decimal(16,0) DEFAULT NULL COMMENT '奖品序号',
  `AWARD_NAME` varchar(400) DEFAULT NULL COMMENT '奖品名称',
  `AWARD_TYPE` decimal(6,0) DEFAULT NULL COMMENT '奖品类型:1-积分 2-其他',
  `AWARD_DESC` varchar(2000) DEFAULT NULL COMMENT '奖品描述',
  `AWARD_PIC_URL` varchar(2000) DEFAULT NULL COMMENT '奖品图片URL',
  `AWARD_VALUE` decimal(16,0) DEFAULT NULL COMMENT '奖品积分价值',
  `AWARD_NUM` decimal(24,0) DEFAULT NULL COMMENT '奖品已发放数量',
  `AWARD_NUM_LIMIT` decimal(24,0) DEFAULT NULL COMMENT '奖品发放数量限制',
  `AWARD_WIN_RAT` decimal(24,0) DEFAULT NULL COMMENT '奖品中奖概率：例如设置为1000，表示平均1000个人中有1个会中奖',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFYER` decimal(16,0) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`GAME_RULE_AWARD_ID`),
  KEY `FK_RUL_RLT_RULAWD` (`RULE_ID`),
  CONSTRAINT `FK_RUL_RLT_RULAWD` FOREIGN KEY (`RULE_ID`) REFERENCES `pc_game_rule` (`RULE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='游戏抽奖规则奖品表';

-- ----------------------------
-- Records of pc_game_rule_award
-- ----------------------------

-- ----------------------------
-- Table structure for pc_game_templet
-- ----------------------------
DROP TABLE IF EXISTS `pc_game_templet`;
CREATE TABLE `pc_game_templet` (
  `TMPLT_ID` decimal(16,0) NOT NULL COMMENT '游戏模板ID',
  `TMPLT_TYPE` decimal(6,0) DEFAULT NULL COMMENT '游戏模板类型：1-大转盘',
  `TMPLT_NAME` varchar(400) DEFAULT NULL COMMENT '游戏模板名称',
  `TMPLT_DESC` varchar(2000) DEFAULT NULL COMMENT '游戏模板描述',
  `TMPLT_URL` varchar(2000) DEFAULT NULL COMMENT '游戏模板URL',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFYER` decimal(16,0) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`TMPLT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='游戏模板表';

-- ----------------------------
-- Records of pc_game_templet
-- ----------------------------

-- ----------------------------
-- Table structure for pc_game_templet_award
-- ----------------------------
DROP TABLE IF EXISTS `pc_game_templet_award`;
CREATE TABLE `pc_game_templet_award` (
  `AWARD_ID` decimal(16,0) NOT NULL COMMENT '奖品ID',
  `TMPLT_ID` decimal(16,0) DEFAULT NULL COMMENT '游戏模板ID',
  `AWARD_RN` decimal(16,0) DEFAULT NULL COMMENT '奖品序号',
  `AWARD_NAME` varchar(400) DEFAULT NULL COMMENT '奖品名称',
  `AWARD_TYPE` decimal(6,0) DEFAULT NULL COMMENT '奖品类型:1-积分 2-其他',
  `AWARD_DESC` varchar(2000) DEFAULT NULL COMMENT '奖品描述',
  `AWARD_PIC_URL` varchar(2000) DEFAULT NULL COMMENT '奖品图片URL',
  `AWARD_VALUE` decimal(16,0) DEFAULT NULL COMMENT '奖品积分价值',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFYER` decimal(16,0) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`AWARD_ID`),
  KEY `FK_TMPLT_RLT_AWD` (`TMPLT_ID`),
  CONSTRAINT `FK_TMPLT_RLT_AWD` FOREIGN KEY (`TMPLT_ID`) REFERENCES `pc_game_templet` (`TMPLT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='游戏模板奖品表';

-- ----------------------------
-- Records of pc_game_templet_award
-- ----------------------------

-- ----------------------------
-- Table structure for pc_given_log
-- ----------------------------
DROP TABLE IF EXISTS `pc_given_log`;
CREATE TABLE `pc_given_log` (
  `GIVEN_LOG_ID` decimal(16,0) NOT NULL COMMENT '用户积分转赠流水ID',
  `ACCOUNT_ID` decimal(16,0) DEFAULT NULL COMMENT '用户积分账户ID',
  `OP_DATE` datetime DEFAULT NULL COMMENT '业务发生时间',
  `OP_STATE` decimal(2,0) DEFAULT NULL COMMENT '操作状态：1-成功 2-失败 3-撤销',
  `POINT_NUM` decimal(16,2) DEFAULT NULL COMMENT '积分数量',
  `COST_USER_ID` decimal(16,0) DEFAULT NULL COMMENT '转赠用户ID',
  `GAIN_USER_ID` decimal(16,0) DEFAULT NULL COMMENT '获赠用户ID',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFYER` decimal(16,0) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`GIVEN_LOG_ID`),
  KEY `FK_ACC_RLT_GLOG` (`ACCOUNT_ID`),
  CONSTRAINT `FK_ACC_RLT_GLOG` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `pc_account` (`ACCOUNT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pc_given_log
-- ----------------------------

-- ----------------------------
-- Table structure for pc_mkt_log
-- ----------------------------
DROP TABLE IF EXISTS `pc_mkt_log`;
CREATE TABLE `pc_mkt_log` (
  `MKT_LOG_ID` decimal(16,0) NOT NULL COMMENT '用户积分营销流水表ID',
  `ACCOUNT_ID` decimal(16,0) DEFAULT NULL COMMENT '用户积分账户ID',
  `USER_ID` decimal(16,0) DEFAULT NULL COMMENT '用户ID',
  `OP_TYPE` decimal(2,0) DEFAULT NULL COMMENT '营销类型：1-签到获得积分 2-添加好友获得积分 3-大转盘游戏',
  `OP_DATE` datetime DEFAULT NULL COMMENT '业务发生时间',
  `COST_OP_STATE` decimal(2,0) DEFAULT NULL COMMENT '消耗操作状态：1-成功 2-失败 3-撤销',
  `GAIN_OP_STATE` decimal(2,0) DEFAULT NULL COMMENT '获得操作状态：1-成功 2-失败 3-撤销',
  `COST_POINT` decimal(16,2) DEFAULT NULL COMMENT '消耗积分数量',
  `GAIN_POINT` decimal(16,2) DEFAULT NULL COMMENT '获得积分数量',
  `OP_LOG_ID` decimal(16,0) DEFAULT NULL COMMENT '操作流水日志ID：商品购买为订单ID，积分赠送为积分赠送日志ID，游戏为游戏日志ID，积分兑换为积分兑换日志ID',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFYER` decimal(16,0) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`MKT_LOG_ID`),
  KEY `FK_ACC_RLT_MLOG` (`ACCOUNT_ID`),
  CONSTRAINT `FK_ACC_RLT_MLOG` FOREIGN KEY (`ACCOUNT_ID`) REFERENCES `pc_account` (`ACCOUNT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of pc_mkt_log
-- ----------------------------

-- ----------------------------
-- Table structure for pc_provider
-- ----------------------------
DROP TABLE IF EXISTS `pc_provider`;
CREATE TABLE `pc_provider` (
  `PROVIDER_ID` decimal(16,0) NOT NULL COMMENT '积分供应商',
  `PROVIDER_NAME` varchar(400) DEFAULT NULL COMMENT '供应商名称',
  `PROVIDER_SHORT_NAME` varchar(80) DEFAULT NULL COMMENT '供应商简称',
  `PROVIDER_CODE` varchar(40) DEFAULT NULL COMMENT '供应商编码',
  `PROVIDER_PIC_URL` varchar(400) DEFAULT NULL COMMENT '供应商图片链接',
  `PROVIDER_DESC` varchar(2000) DEFAULT NULL COMMENT '供应商描述',
  `PROVIDER_POINT_RATIO` decimal(18,6) DEFAULT NULL COMMENT '供应商积分兑换比例',
  `PROVIDER_POINT_FEE` decimal(18,6) DEFAULT NULL COMMENT '供应商积分兑换手续费',
  `BALANCE_TERM` decimal(2,0) DEFAULT NULL COMMENT '结算周期：1-日 2-周 3-月 4-季',
  `BALANCE_TYPE` decimal(2,0) DEFAULT NULL COMMENT '结算方式：1-线上 2-线下',
  `BPROVIDER_LICENSE` varchar(400) DEFAULT NULL COMMENT '供应商营业执照',
  `BPROVIDER_CONTRACT` varchar(400) DEFAULT NULL COMMENT '供应商合同',
  `PROV_ID` decimal(16,0) DEFAULT NULL COMMENT '省份ID',
  `CITY_ID` decimal(16,0) DEFAULT NULL COMMENT '地市ID',
  `REGION_ID` decimal(16,0) DEFAULT NULL COMMENT '片区ID',
  `PROVIDER_ADDRESS` varchar(2000) DEFAULT NULL COMMENT '供应商地址',
  `CUSTSRV_PHONE` varchar(20) DEFAULT NULL COMMENT '客服电话',
  `CONTACT_NAME` varchar(40) DEFAULT NULL COMMENT '联系人姓名',
  `CONTACT_PHONE` varchar(20) DEFAULT NULL COMMENT '联系人电话',
  `CONTACT_PHONE2` varchar(20) DEFAULT NULL COMMENT '联系人电话2',
  `CONTACT_EMAIL` varchar(80) DEFAULT NULL COMMENT '联系人邮箱',
  `PROVIDER_REMARK` varchar(2000) DEFAULT NULL COMMENT '供应商备注',
  `PROVIDER_PHONE` varchar(40) DEFAULT NULL COMMENT '供应商电话',
  `PROVIDER_WEBURL` varchar(400) DEFAULT NULL COMMENT '供应商网站地址',
  `PROVIDER_STATUS` decimal(2,0) DEFAULT NULL COMMENT '接入状态： 0-未接入 1-已接入',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFYER` decimal(16,0) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`PROVIDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='积分供应商表';

-- ----------------------------
-- Records of pc_provider
-- ----------------------------
INSERT INTO `pc_provider` VALUES ('1', '联通', '联通', '1', '/pomp_app/jpg/content/unicom.png', '联通你我的世界情系中国结，联通四海心', '100.000000', '10.000000', '4', '2', '', '', '2', '3', '4', '甘肃省兰州市城关区庆阳路9号', '10010', '乔丽', '15884592803', '15884592803', 'wangxin7@asiainfo.com', null, null, 'http://www.10010.com/', '1', '1', null, '2016-12-23 19:56:40', null, null);
INSERT INTO `pc_provider` VALUES ('100001', '11111111111', '1111111111111', '111', '', '11111111111111', '111.000000', '1111.000000', '2', '2', '', '', '2', '3', '5', '1111111', null, '111111111', '1111111111', '111111111111111111', null, null, null, 'http://www.10010.com/', '1', '1', null, '2016-12-22 16:44:35', null, null);
INSERT INTO `pc_provider` VALUES ('100003', '1', '1', null, '', '1', '1.000000', '1.000000', '1', '1', '', '', null, null, null, '1', null, '1', '1', '1', null, null, null, null, '1', '1', null, '2016-12-22 23:01:57', null, null);
INSERT INTO `pc_provider` VALUES ('100004', '2222222222', '222222222222', null, '', '22222222222', '2222222222.000000', '222222222.000000', '1', '2', '', '', null, null, null, '22222222222', null, '2222222222', '222222222', '2222222222', null, null, null, null, '1', '1', null, '2016-12-22 23:02:17', null, null);

-- ----------------------------
-- Table structure for pc_provider_op
-- ----------------------------
DROP TABLE IF EXISTS `pc_provider_op`;
CREATE TABLE `pc_provider_op` (
  `PROVIDER_OP_ID` decimal(16,0) NOT NULL,
  `PROVIDER_ID` decimal(16,0) DEFAULT NULL COMMENT '积分供应商',
  `OP_ID` decimal(16,0) DEFAULT NULL COMMENT '账户ID',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFYER` decimal(16,0) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`PROVIDER_OP_ID`),
  KEY `FK_PRV_RLT_PRVOP` (`PROVIDER_ID`),
  CONSTRAINT `FK_PRV_RLT_PRVOP` FOREIGN KEY (`PROVIDER_ID`) REFERENCES `pc_provider` (`PROVIDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='积分供应商账户表';

-- ----------------------------
-- Records of pc_provider_op
-- ----------------------------
INSERT INTO `pc_provider_op` VALUES ('1', '1', '100', '1', null, null, null, null);

-- ----------------------------
-- Table structure for sc_mcht_item_chk_code
-- ----------------------------
DROP TABLE IF EXISTS `sc_mcht_item_chk_code`;
CREATE TABLE `sc_mcht_item_chk_code` (
  `MCHT_ITEM_CHK_CODE_ID` decimal(16,0) NOT NULL COMMENT '商家商品串码ID',
  `MCHT_ID` decimal(16,0) DEFAULT NULL COMMENT '商家ID',
  `ITEM_CODE` decimal(16,0) DEFAULT NULL COMMENT '商品单元编码：新创建商品编码与商品单元ID相同，非新创建商品（由某个已上架商品修改）编码使用其来源商品的编码',
  `ITEM_CHK_CODE` varchar(80) DEFAULT NULL COMMENT '商品验证串码',
  `USE_FLAG` decimal(2,0) DEFAULT NULL COMMENT '使用标志:1-未使用 2-已使用',
  PRIMARY KEY (`MCHT_ITEM_CHK_CODE_ID`),
  KEY `FK_MCHT_RLT_ICOD` (`MCHT_ID`),
  CONSTRAINT `FK_MCHT_RLT_ICOD` FOREIGN KEY (`MCHT_ID`) REFERENCES `sc_merchant` (`MCHT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家商品串码表';

-- ----------------------------
-- Records of sc_mcht_item_chk_code
-- ----------------------------

-- ----------------------------
-- Table structure for sc_merchant
-- ----------------------------
DROP TABLE IF EXISTS `sc_merchant`;
CREATE TABLE `sc_merchant` (
  `MCHT_ID` decimal(16,0) NOT NULL COMMENT '商家ID',
  `MCHT_CODE` varchar(40) DEFAULT NULL COMMENT '商家编码',
  `MCHT_NAME` varchar(400) DEFAULT NULL COMMENT '商家名称',
  `MCHT_SHORT_NAME` varchar(80) DEFAULT NULL COMMENT '商家简称',
  `MCHT_DESC` varchar(2000) DEFAULT NULL COMMENT '商家描述',
  `MCHT_STATE` decimal(6,0) DEFAULT '1' COMMENT '商家状态：1 已启用 2-已停用',
  `MCHT_TYPE` decimal(6,0) DEFAULT NULL COMMENT '商家类型：1-普通商家 2-联通商家（创建商品时可以填写商品货码） 2-自串码商家（创建商品时可以填写商品货码，该货码必须已存在于货码表中）',
  `APPR_STATE` decimal(6,0) DEFAULT NULL COMMENT '审批状态：0-未提交 1-待审批（审批中） 2-审批通过 3-审批未通过',
  `PROV_ID` decimal(16,0) DEFAULT NULL COMMENT '省份ID',
  `CITY_ID` decimal(16,0) DEFAULT NULL COMMENT '地市ID',
  `REGION_ID` decimal(16,0) DEFAULT NULL COMMENT '片区ID',
  `MCHT_ADDRESS` varchar(400) DEFAULT NULL COMMENT '商家地址',
  `CUSTSRV_PHONE` varchar(20) DEFAULT NULL COMMENT '客服电话',
  `CONTACT_NAME` varchar(40) DEFAULT NULL COMMENT '联系人姓名',
  `CONTACT_PHONE` varchar(20) DEFAULT NULL COMMENT '联系人电话',
  `CONTACT_PHONE2` varchar(20) DEFAULT NULL COMMENT '联系人电话2',
  `CONTACT_EMAIL` varchar(80) DEFAULT NULL COMMENT '联系人邮箱',
  `BU_LICENSE_PIC_URL` varchar(400) DEFAULT NULL COMMENT '营业执照图片路径',
  `IDCARD_PIC_URL` varchar(400) DEFAULT NULL COMMENT '法人身份证图片路径',
  `COMPANY_PIC_URL` varchar(400) DEFAULT NULL COMMENT '公司图片路径',
  `MCHT_BANK_ID` decimal(16,0) DEFAULT NULL COMMENT '商家开户银行ID',
  `MCHT_BANK_NAME` varchar(400) DEFAULT NULL COMMENT '商家开户银行名称',
  `MCHT_BANK_NO` varchar(40) DEFAULT NULL COMMENT '商家开户行号',
  `MCHT_BANK_ACCTNAME` varchar(40) DEFAULT NULL COMMENT '商家开户行账户名',
  `MCHT_BANK_ACCTNO` varchar(40) DEFAULT NULL COMMENT '商家开户行账号',
  `MCHT_BANK_TAXNO` varchar(40) DEFAULT NULL COMMENT '商家开户行税号',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFYER` decimal(16,0) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`MCHT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录商家信息';

-- ----------------------------
-- Records of sc_merchant
-- ----------------------------
INSERT INTO `sc_merchant` VALUES ('1', '1', 'fresh café', 'fresh café', '兰州轻时尚咖啡', '1', null, '2', '2', '3', '7', '甘肃省兰州市安宁区金牛街27号', '18689623600', '刘经理', '13871370275', null, 'qidanke@163.com', null, null, null, null, null, null, null, null, null, '1', null, null, null, null);
INSERT INTO `sc_merchant` VALUES ('2', '2', '太平洋院线', '太平洋影城', '兰州最好的电影院', '1', null, '2', '2', '3', '4', '甘肃省兰州市城关区南昌路982号华联商厦3-4楼 ', '18689623601', '祁丹柯', '13871370276', null, 'qidanke@163.com', null, null, null, null, null, null, null, null, null, '1', null, null, null, null);

-- ----------------------------
-- Table structure for sc_merchant_item_type
-- ----------------------------
DROP TABLE IF EXISTS `sc_merchant_item_type`;
CREATE TABLE `sc_merchant_item_type` (
  `RLT_ID` decimal(16,0) NOT NULL COMMENT '关系ID',
  `ITEM_TYPE` decimal(6,0) DEFAULT NULL COMMENT '商品单元类型',
  `MCHT_ID` decimal(16,0) DEFAULT NULL COMMENT '商家ID',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFYER` decimal(16,0) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`RLT_ID`),
  KEY `FK_IT_RLT_MERIT` (`ITEM_TYPE`),
  KEY `FK_MER_RLT_MERIT` (`MCHT_ID`),
  CONSTRAINT `FK_IT_RLT_MERIT` FOREIGN KEY (`ITEM_TYPE`) REFERENCES `ic_item_type` (`ITEM_TYPE`),
  CONSTRAINT `FK_MER_RLT_MERIT` FOREIGN KEY (`MCHT_ID`) REFERENCES `sc_merchant` (`MCHT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家商品单元类型表';

-- ----------------------------
-- Records of sc_merchant_item_type
-- ----------------------------
INSERT INTO `sc_merchant_item_type` VALUES ('1', '1', '1', '1', null, null, null, null);
INSERT INTO `sc_merchant_item_type` VALUES ('2', '1', '2', '1', null, null, null, null);
INSERT INTO `sc_merchant_item_type` VALUES ('3', '2', '1', '1', null, null, null, null);
INSERT INTO `sc_merchant_item_type` VALUES ('4', '3', '1', '1', null, null, null, null);
INSERT INTO `sc_merchant_item_type` VALUES ('6', '5', '1', '1', null, null, null, null);
INSERT INTO `sc_merchant_item_type` VALUES ('7', '2', '2', '1', null, null, null, null);
INSERT INTO `sc_merchant_item_type` VALUES ('8', '3', '2', '1', null, null, null, null);
INSERT INTO `sc_merchant_item_type` VALUES ('10', '5', '2', '1', null, null, null, null);

-- ----------------------------
-- Table structure for sc_merchant_mall_cat
-- ----------------------------
DROP TABLE IF EXISTS `sc_merchant_mall_cat`;
CREATE TABLE `sc_merchant_mall_cat` (
  `MERCHANT_MALL_CAT_ID` decimal(16,0) NOT NULL COMMENT '商家物理类目ID',
  `MCHT_ID` decimal(16,0) DEFAULT NULL COMMENT '商家ID',
  `MALL_CAT_ID` decimal(16,0) DEFAULT NULL COMMENT '商城类目ID',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFYER` decimal(16,0) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`MERCHANT_MALL_CAT_ID`),
  KEY `FK_MER_RLT_MCAT` (`MCHT_ID`),
  CONSTRAINT `FK_MER_RLT_MCAT` FOREIGN KEY (`MCHT_ID`) REFERENCES `sc_merchant` (`MCHT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家经营的物理类目表';

-- ----------------------------
-- Records of sc_merchant_mall_cat
-- ----------------------------
INSERT INTO `sc_merchant_mall_cat` VALUES ('1', '1', '1', '1', null, null, null, null);
INSERT INTO `sc_merchant_mall_cat` VALUES ('2', '2', '2', '1', null, null, null, null);
INSERT INTO `sc_merchant_mall_cat` VALUES ('3', '1', '2', '1', null, null, null, null);
INSERT INTO `sc_merchant_mall_cat` VALUES ('4', '1', '3', '1', null, null, null, null);
INSERT INTO `sc_merchant_mall_cat` VALUES ('5', '1', '4', '1', null, null, null, null);
INSERT INTO `sc_merchant_mall_cat` VALUES ('6', '1', '5', '1', null, null, null, null);
INSERT INTO `sc_merchant_mall_cat` VALUES ('7', '1', '6', '1', null, null, null, null);
INSERT INTO `sc_merchant_mall_cat` VALUES ('8', '2', '1', '1', null, null, null, null);
INSERT INTO `sc_merchant_mall_cat` VALUES ('9', '2', '3', '1', null, null, null, null);
INSERT INTO `sc_merchant_mall_cat` VALUES ('10', '2', '4', '1', null, null, null, null);
INSERT INTO `sc_merchant_mall_cat` VALUES ('11', '2', '5', '1', null, null, null, null);
INSERT INTO `sc_merchant_mall_cat` VALUES ('12', '2', '6', '1', null, null, null, null);

-- ----------------------------
-- Table structure for sc_merchant_op
-- ----------------------------
DROP TABLE IF EXISTS `sc_merchant_op`;
CREATE TABLE `sc_merchant_op` (
  `MERCHANT_OP_ID` decimal(16,0) NOT NULL COMMENT '商家账户ID',
  `MCHT_ID` decimal(16,0) DEFAULT NULL COMMENT '商家ID',
  `OP_ID` decimal(16,0) DEFAULT NULL COMMENT '账户ID',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFYER` decimal(16,0) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`MERCHANT_OP_ID`),
  KEY `FK_MER_RLT_MEROP` (`MCHT_ID`),
  CONSTRAINT `FK_MER_RLT_MEROP` FOREIGN KEY (`MCHT_ID`) REFERENCES `sc_merchant` (`MCHT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商家账户表';

-- ----------------------------
-- Records of sc_merchant_op
-- ----------------------------
INSERT INTO `sc_merchant_op` VALUES ('1', '1', '1001', '1', null, null, null, null);
INSERT INTO `sc_merchant_op` VALUES ('2', '2', '2001', '1', null, null, null, null);

-- ----------------------------
-- Table structure for sc_shop
-- ----------------------------
DROP TABLE IF EXISTS `sc_shop`;
CREATE TABLE `sc_shop` (
  `SHOP_ID` decimal(16,0) NOT NULL COMMENT '门店ID',
  `MCHT_ID` decimal(16,0) DEFAULT NULL COMMENT '商家ID',
  `SHOP_SHORT_NAME` varchar(80) DEFAULT NULL COMMENT '门店简称',
  `SHOP_NAME` varchar(400) DEFAULT NULL COMMENT '门店名称',
  `SHOP_DESC` varchar(2000) DEFAULT NULL COMMENT '门店描述',
  `SHOP_LONGITUDE` decimal(16,4) DEFAULT NULL COMMENT '门店地址经度',
  `SHOP_LATITUDE` decimal(16,4) DEFAULT NULL COMMENT '门店地址纬度',
  `SHOP_NEAR_INF` varchar(400) DEFAULT NULL COMMENT '门店靠近信息',
  `SHOP_BUS_INFO` varchar(400) DEFAULT NULL COMMENT '门店公交信息',
  `SHOP_STATE` decimal(2,0) DEFAULT NULL COMMENT '门店状态：1 已启用 2-已停用',
  `PROV_ID` decimal(16,0) DEFAULT NULL COMMENT '省份ID',
  `CITY_ID` decimal(16,0) DEFAULT NULL COMMENT '地市ID',
  `REGION_ID` decimal(16,0) DEFAULT NULL COMMENT '片区ID',
  `SHOP_ADDRESS` varchar(400) DEFAULT NULL COMMENT '门店地址',
  `SHOP_PIC_URL` varchar(400) DEFAULT NULL COMMENT '门店图片路径',
  `CUSTSRV_PHONE` varchar(20) DEFAULT NULL COMMENT '客服电话',
  `CONTACT_NAME` varchar(40) DEFAULT NULL COMMENT '联系人姓名',
  `CONTACT_PHONE` varchar(20) DEFAULT NULL COMMENT '联系人电话',
  `CONTACT_PHONE2` varchar(20) DEFAULT NULL COMMENT '联系人电话2',
  `CONTACT_EMAIL` varchar(80) DEFAULT NULL COMMENT '联系人邮箱',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `MODIFYER` decimal(16,0) DEFAULT NULL COMMENT '修改人ID',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  PRIMARY KEY (`SHOP_ID`),
  KEY `FK_MER_RLT_SHP` (`MCHT_ID`),
  CONSTRAINT `FK_MER_RLT_SHP` FOREIGN KEY (`MCHT_ID`) REFERENCES `sc_merchant` (`MCHT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录商家的所有门店\r\n';

-- ----------------------------
-- Records of sc_shop
-- ----------------------------
INSERT INTO `sc_shop` VALUES ('1001', '1', 'hope coffee', 'hope coffee 张掖路店', '兰州轻时尚咖啡', null, null, '保利大厦', '28路', '1', '2', '3', '4', '甘肃省兰州市城关区张掖路1号（保利大厦1楼B座5号铺）', null, '18689623600', '祁丹柯', '13871370275', '无', 'qidanke@163.com', null, null, null, null, '1');
INSERT INTO `sc_shop` VALUES ('1002', '1', 'hope coffee', 'hope coffee 麦积山店', '兰州轻时尚咖啡', null, null, '兰州银行', '1路 6路 11路', '1', '2', '3', '4', '甘肃省兰州市城关区旧大路200号（兰州银行东50米）', null, '18689623600', '祁丹柯', '13871370275', '无', 'qidanke@164.com', null, null, null, null, '1');
INSERT INTO `sc_shop` VALUES ('1003', '1', '太平洋影城(华联店)', '太平洋影城(华联店)', '兰州最好的电影院', null, null, '华联商厦', '5路', '1', '2', '3', '4', '甘肃省兰州市城关区南昌路982号华联商厦3-4楼', null, '18689623600', '祁丹柯', '13871370275', null, 'qidanke@165.com', null, null, null, null, '1');
INSERT INTO `sc_shop` VALUES ('2001', '2', '太平洋影城(张掖路店) ', '太平洋影城(张掖路店) ', '兰州最好的电影院', null, null, '房地产大厦', '121路', '1', '2', '3', '4', '甘肃省兰州市城关区通渭路1号房地产大厦6楼', null, '18689623600', '祁丹柯', '13871370275', null, 'qidanke@166.com', null, null, null, null, '1');
INSERT INTO `sc_shop` VALUES ('2002', '2', '太平洋电影城(华孚泰店) ', '太平洋电影城(华孚泰店) ', '兰州最好的电影院', null, null, '美伦百货', '76路', '1', '2', '3', '4', '甘肃省兰州市城关区雁滩路3113号美伦百货七楼（雁滩华孚泰商厦6、7楼）', null, '18689623600', '祁丹柯', '13871370275', null, 'qidanke@167.com', null, null, null, null, '1');

-- ----------------------------
-- Table structure for sc_shop_mall_cat
-- ----------------------------
DROP TABLE IF EXISTS `sc_shop_mall_cat`;
CREATE TABLE `sc_shop_mall_cat` (
  `SHOP_MALL_CAT_ID` decimal(16,0) NOT NULL COMMENT '门店物理类目ID',
  `SHOP_ID` decimal(16,0) DEFAULT NULL COMMENT '门店ID',
  `MALL_CAT_ID` decimal(16,0) DEFAULT NULL COMMENT '商城类目ID',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFYER` decimal(16,0) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`SHOP_MALL_CAT_ID`),
  KEY `FK_SHP_RLT_MCAT` (`SHOP_ID`),
  CONSTRAINT `FK_SHP_RLT_MCAT` FOREIGN KEY (`SHOP_ID`) REFERENCES `sc_shop` (`SHOP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='门店经营的物理类目表,门店选择的物理类目范围受限于商家的物理类目范围';

-- ----------------------------
-- Records of sc_shop_mall_cat
-- ----------------------------
INSERT INTO `sc_shop_mall_cat` VALUES ('1001', '1001', '2', '1', null, null, null, null);
INSERT INTO `sc_shop_mall_cat` VALUES ('1002', '1002', '2', '1', null, null, null, null);
INSERT INTO `sc_shop_mall_cat` VALUES ('1003', '1003', '2', '1', null, null, null, null);
INSERT INTO `sc_shop_mall_cat` VALUES ('2001', '2001', '1', '1', null, null, null, null);
INSERT INTO `sc_shop_mall_cat` VALUES ('2002', '2002', '1', '1', null, null, null, null);

-- ----------------------------
-- Table structure for sequence
-- ----------------------------
DROP TABLE IF EXISTS `sequence`;
CREATE TABLE `sequence` (
  `name` varchar(50) NOT NULL,
  `current_value` int(11) NOT NULL,
  `increment` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sequence
-- ----------------------------
INSERT INTO `sequence` VALUES ('APPROVE_DEF', '100002', '1');
INSERT INTO `sequence` VALUES ('APPR_DTL', '100004', '1');
INSERT INTO `sequence` VALUES ('AREA_DEF', '100000', '1');
INSERT INTO `sequence` VALUES ('BM_CODE_VALUE', '100000', '1');
INSERT INTO `sequence` VALUES ('BM_COL_CODE_TYPE', '100000', '1');
INSERT INTO `sequence` VALUES ('IC_ADV', '100021', '1');
INSERT INTO `sequence` VALUES ('IC_ITEM', '100009', '1');
INSERT INTO `sequence` VALUES ('IC_ITEM_EVALUATION', '100001', '1');
INSERT INTO `sequence` VALUES ('IC_ITEM_EVALUATION_PIC', '100001', '1');
INSERT INTO `sequence` VALUES ('IC_ITEM_PICTURE', '100005', '1');
INSERT INTO `sequence` VALUES ('IC_ITEM_RECOM', '100001', '1');
INSERT INTO `sequence` VALUES ('IC_ITEM_SHOP_RANGE', '100010', '1');
INSERT INTO `sequence` VALUES ('IC_ITEM_TYPE', '100000', '1');
INSERT INTO `sequence` VALUES ('IC_MALL_CAT', '100015', '1');
INSERT INTO `sequence` VALUES ('LIST_DEF', '100000', '1');
INSERT INTO `sequence` VALUES ('LIST_INFO', '100000', '1');
INSERT INTO `sequence` VALUES ('PC_ACCOUNT', '100002', '1');
INSERT INTO `sequence` VALUES ('PC_ACCOUNT_LOG', '100030', '1');
INSERT INTO `sequence` VALUES ('PC_EXCHANGE_LOG', '100005', '1');
INSERT INTO `sequence` VALUES ('PC_GAME', '100000', '1');
INSERT INTO `sequence` VALUES ('PC_GAME_AWARD_LOG', '100000', '1');
INSERT INTO `sequence` VALUES ('PC_GAME_RULE', '100000', '1');
INSERT INTO `sequence` VALUES ('PC_GAME_RULE_AWARD', '100000', '1');
INSERT INTO `sequence` VALUES ('PC_GAME_TEMPLET', '100000', '1');
INSERT INTO `sequence` VALUES ('PC_GAME_TEMPLET_AWARD', '100000', '1');
INSERT INTO `sequence` VALUES ('PC_GIVEN_LOG', '100000', '1');
INSERT INTO `sequence` VALUES ('PC_MKT_LOG', '100000', '1');
INSERT INTO `sequence` VALUES ('PC_PROVIDER', '100005', '1');
INSERT INTO `sequence` VALUES ('PC_PROVIDER_OP', '100000', '1');
INSERT INTO `sequence` VALUES ('SC_MCHT_ITEM_CHK_CODE', '100000', '1');
INSERT INTO `sequence` VALUES ('SC_MERCHANT', '100000', '1');
INSERT INTO `sequence` VALUES ('SC_MERCHANT_ITEM_TYPE', '100000', '1');
INSERT INTO `sequence` VALUES ('SC_MERCHANT_MALL_CAT', '100000', '1');
INSERT INTO `sequence` VALUES ('SC_MERCHANT_OP', '100000', '1');
INSERT INTO `sequence` VALUES ('SC_SHOP', '100000', '1');
INSERT INTO `sequence` VALUES ('SC_SHOP_MALL_CAT', '100000', '1');
INSERT INTO `sequence` VALUES ('SYS_AGENT_AUTH', '100000', '1');
INSERT INTO `sequence` VALUES ('SYS_AGENT_AUTH_FUNC', '100000', '1');
INSERT INTO `sequence` VALUES ('SYS_AUDIT_LOG', '100000', '1');
INSERT INTO `sequence` VALUES ('SYS_CODE_COL_RLT', '100000', '1');
INSERT INTO `sequence` VALUES ('SYS_CODE_DEF', '100000', '1');
INSERT INTO `sequence` VALUES ('SYS_CODE_VALUE', '100000', '1');
INSERT INTO `sequence` VALUES ('SYS_DATA_AUTH_TYPE', '100000', '1');
INSERT INTO `sequence` VALUES ('SYS_DFLT_DATA_AUTH', '100000', '1');
INSERT INTO `sequence` VALUES ('SYS_DOMAIN', '100000', '1');
INSERT INTO `sequence` VALUES ('SYS_FUNC', '100000', '1');
INSERT INTO `sequence` VALUES ('SYS_FUNC_KIND', '100000', '1');
INSERT INTO `sequence` VALUES ('SYS_GROUP', '100000', '1');
INSERT INTO `sequence` VALUES ('SYS_GROUP_ROLE', '100000', '1');
INSERT INTO `sequence` VALUES ('SYS_JOBFUNC_FUNC', '100000', '1');
INSERT INTO `sequence` VALUES ('SYS_LOG', '100000', '1');
INSERT INTO `sequence` VALUES ('SYS_LOG_HIS', '100000', '1');
INSERT INTO `sequence` VALUES ('SYS_NOTIFY_ACCEPT', '100000', '1');
INSERT INTO `sequence` VALUES ('SYS_NOTIFY_RANGE', '100000', '1');
INSERT INTO `sequence` VALUES ('SYS_OP', '100059', '1');
INSERT INTO `sequence` VALUES ('SYS_OPRT_TYPE', '100000', '1');
INSERT INTO `sequence` VALUES ('SYS_OP_AGENT_RLT', '100000', '1');
INSERT INTO `sequence` VALUES ('SYS_OP_DATA_AUTH', '100000', '1');
INSERT INTO `sequence` VALUES ('SYS_OP_GROUP', '100000', '1');
INSERT INTO `sequence` VALUES ('SYS_OP_MAPPING', '100000', '1');
INSERT INTO `sequence` VALUES ('SYS_OP_ORG_RLT', '100000', '1');
INSERT INTO `sequence` VALUES ('SYS_OP_ROLE', '100000', '1');
INSERT INTO `sequence` VALUES ('SYS_ORG', '100000', '1');
INSERT INTO `sequence` VALUES ('SYS_ORG_MAPPING', '100000', '1');
INSERT INTO `sequence` VALUES ('SYS_ORG_TYPE', '100000', '1');
INSERT INTO `sequence` VALUES ('SYS_PAGEITEM_CFG', '100000', '1');
INSERT INTO `sequence` VALUES ('SYS_PAGEITEM_DEF', '100000', '1');
INSERT INTO `sequence` VALUES ('SYS_PARAM', '100000', '1');
INSERT INTO `sequence` VALUES ('SYS_REGION', '100000', '1');
INSERT INTO `sequence` VALUES ('SYS_RES', '100000', '1');
INSERT INTO `sequence` VALUES ('SYS_ROLE', '100000', '1');
INSERT INTO `sequence` VALUES ('SYS_ROLE_FUNC', '100286', '1');
INSERT INTO `sequence` VALUES ('TC_GOODS', '100024', '1');
INSERT INTO `sequence` VALUES ('TC_ORDER', '100010', '1');
INSERT INTO `sequence` VALUES ('UC_COMPLAINT', '100000', '1');
INSERT INTO `sequence` VALUES ('UC_CONSULT', '100000', '1');
INSERT INTO `sequence` VALUES ('UC_FAVORITE', '100001', '1');
INSERT INTO `sequence` VALUES ('UC_FEEDBACK', '100000', '1');
INSERT INTO `sequence` VALUES ('UC_LOGIN_LOG', '100041', '1');
INSERT INTO `sequence` VALUES ('UC_MESSAGE', '100000', '1');
INSERT INTO `sequence` VALUES ('UC_RCV_ADDR', '100001', '1');
INSERT INTO `sequence` VALUES ('UC_USER', '100002', '1');
INSERT INTO `sequence` VALUES ('UC_USER_FRIEND', '100000', '1');
INSERT INTO `sequence` VALUES ('UC_USER_FRIEND_LOG', '100000', '1');
INSERT INTO `sequence` VALUES ('UC_USER_LOG', '100118', '1');
INSERT INTO `sequence` VALUES ('UC_USER_LOG_HIS', '100000', '1');
INSERT INTO `sequence` VALUES ('UC_USER_PROVIDER_MAP', '100004', '1');
INSERT INTO `sequence` VALUES ('VAR_DEF', '100000', '1');
INSERT INTO `sequence` VALUES ('WD_NOTIFY', '100000', '1');
INSERT INTO `sequence` VALUES ('WD_NOTIFY_ATTACH', '100000', '1');

-- ----------------------------
-- Table structure for sys_func
-- ----------------------------
DROP TABLE IF EXISTS `sys_func`;
CREATE TABLE `sys_func` (
  `FUNC_ID` decimal(16,0) NOT NULL COMMENT '功能ID',
  `RES_ID` decimal(6,0) DEFAULT NULL COMMENT '资源ID',
  `OPRT_TYPE_ID` decimal(6,0) DEFAULT NULL COMMENT '操作类型ID',
  `FUNC_TYPE` decimal(2,0) DEFAULT NULL COMMENT '功能类别：1-菜单 2-页面 3-按钮 4-工作台 5-组件',
  `SUP_FUNC_ID` decimal(16,0) DEFAULT NULL COMMENT '上级功能ID',
  `FUNC_LEVEL` decimal(2,0) DEFAULT NULL COMMENT '功能级别：1-一级 2-二级 3-三级 4-四级 ...',
  `FUNC_LVL_PATH` varchar(400) DEFAULT NULL COMMENT '功能层级路径（从根节点ID到当前节点ID的上下级层级路径串，以#号分隔，并以#开头结尾）',
  `FUNC_CODE` varchar(80) DEFAULT NULL COMMENT '功能编码',
  `FUNC_NAME` varchar(200) DEFAULT NULL COMMENT '功能名称',
  `FUNC_DESC` varchar(400) DEFAULT NULL COMMENT '功能描述',
  `FUNC_ORDER` decimal(6,0) DEFAULT NULL COMMENT '功能排序',
  `FUNC_URL` varchar(1000) DEFAULT NULL COMMENT '功能URL',
  `FUNC_IMG` varchar(1000) DEFAULT NULL COMMENT '关联图片（包括路径、文件名）',
  `FUNC_PARAM` varchar(1000) DEFAULT NULL COMMENT '功能参数',
  `IF_DISPLAY` decimal(2,0) DEFAULT NULL COMMENT '是否显示：1-显示 2-不显示（定义隐含菜单、页面）',
  `IF_COMMENT` decimal(2,0) DEFAULT NULL COMMENT '是否可评论：1-可评论 0-不可评论',
  `FUNC_HELP_FLAG` decimal(2,0) DEFAULT NULL COMMENT '功能帮助标志：1-有帮助 0-无帮助',
  `FUNC_HELP_URL` varchar(1000) DEFAULT NULL COMMENT '功能帮助URL',
  `DOMAIN_ID` decimal(6,0) DEFAULT NULL COMMENT '域ID',
  `STATE` decimal(2,0) DEFAULT NULL COMMENT '状态：1-未查看 2-已查看 3-通过 4-拒绝',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODIFIER` decimal(12,0) DEFAULT NULL COMMENT '修改人',
  `MODIFY_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`FUNC_ID`),
  KEY `FK_SYS_FUNC_R_OPRTTYPE` (`OPRT_TYPE_ID`),
  KEY `FK_SYS_FUNC_R_RES` (`RES_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录系统功能信息，包括菜单、页面、按钮、工作台、组件';

-- ----------------------------
-- Records of sys_func
-- ----------------------------
INSERT INTO `sys_func` VALUES ('1', null, null, null, null, '1', null, 'SHANGPINGUANLI', '商品管理', null, '1', '*.jsp', null, null, null, null, null, null, null, null, '1', null, '2016-10-07 17:30:04', null, '0000-00-00 00:00:00');
INSERT INTO `sys_func` VALUES ('2', null, null, null, '1', '2', null, 'SHANGPINLIEBIAO', '商品列表', null, '2', 'item/itemMgnt.jsp', null, null, null, null, null, null, null, null, '1', null, '2016-10-07 17:30:05', null, '0000-00-00 00:00:00');
INSERT INTO `sys_func` VALUES ('3', null, null, null, '1', '2', null, 'SHANGPINSHENPI', '商品审批', null, '3', 'item/itemMgntAdmin.jsp', null, null, null, null, null, null, null, null, '1', null, '2016-10-07 17:30:05', null, '0000-00-00 00:00:00');
INSERT INTO `sys_func` VALUES ('4', null, null, null, null, '1', null, 'YEMIANGUANLI', '页面管理', null, '4', '*.jsp', null, null, null, null, null, null, null, null, '1', null, '2016-10-07 17:30:05', null, '0000-00-00 00:00:00');
INSERT INTO `sys_func` VALUES ('5', null, null, null, '4', '2', null, 'GUANGGAOWEI', '广告位管理', null, '5', 'pageManagement/bannerMgnt.jsp', null, null, null, null, null, null, null, null, '1', null, '2016-10-07 17:30:06', null, '0000-00-00 00:00:00');
INSERT INTO `sys_func` VALUES ('6', null, null, null, '4', '2', null, 'QUYUSHANGPIN', '区域商品管理', null, '6', 'pageManagement/itemRecomMgnt.jsp', null, null, null, null, null, null, null, null, '1', null, '2016-10-07 17:30:06', null, '0000-00-00 00:00:00');
INSERT INTO `sys_func` VALUES ('7', null, null, null, null, '1', null, 'PINGJIAGUANLI', '评价管理', null, '28', 'item/itemEvaluationMgnt.jsp', null, null, null, null, null, null, null, null, '1', null, '2016-12-20 01:49:36', null, '0000-00-00 00:00:00');
INSERT INTO `sys_func` VALUES ('8', null, null, null, null, '1', null, 'JIESUANGUANLI', '结算管理', null, '8', '*.jsp', null, null, null, null, null, null, null, null, '1', null, '2016-10-07 17:30:07', null, '0000-00-00 00:00:00');
INSERT INTO `sys_func` VALUES ('9', null, null, null, '8', '2', null, 'SHANGJIAJIESUAN', '商家结算管理', null, '9', 'order/MerchantSettlement.jsp', null, null, null, null, null, null, null, null, '1', null, '2016-10-07 17:30:07', null, '0000-00-00 00:00:00');
INSERT INTO `sys_func` VALUES ('10', null, null, null, '8', '2', null, 'GONGYINGSHANGJIESUAN', '供应商结算管理', null, '10', 'points/providerSettlementMgnt.jsp', null, null, null, null, null, null, null, null, '1', null, '2016-10-07 17:30:08', null, '0000-00-00 00:00:00');
INSERT INTO `sys_func` VALUES ('11', null, null, null, null, '1', null, 'DINGDANGUANLI', '订单管理', null, '11', '*.jsp', null, null, null, null, null, null, null, null, '1', null, '2016-10-07 17:30:08', null, '0000-00-00 00:00:00');
INSERT INTO `sys_func` VALUES ('12', null, null, null, '11', '2', null, 'SHANGJIADINGDAN', '商家订单管理', null, '12', 'order/mchtOrderMgnt.jsp', null, null, null, null, null, null, null, null, '1', null, '2016-10-07 17:30:09', null, '0000-00-00 00:00:00');
INSERT INTO `sys_func` VALUES ('13', null, null, null, '11', '2', null, 'GUANLIYUANDINGDAN', '管理员订单管理', null, '13', 'order/adminOrderMgnt.jsp', null, null, null, null, null, null, null, null, '1', null, '2016-10-07 17:30:12', null, '0000-00-00 00:00:00');
INSERT INTO `sys_func` VALUES ('14', null, null, null, null, '1', null, 'YOUHUIQUANXIAOFEI', '优惠券消费列表', null, '14', 'order/couponUse.jsp', null, null, null, null, null, null, null, null, '1', null, '2016-10-07 17:30:09', null, '0000-00-00 00:00:00');
INSERT INTO `sys_func` VALUES ('15', null, null, null, null, '1', null, 'YOUXIGUANLI', '游戏管理', null, '15', '*.jsp', null, null, null, null, null, null, null, null, '1', null, '2016-10-07 17:30:10', null, '0000-00-00 00:00:00');
INSERT INTO `sys_func` VALUES ('16', null, null, null, '15', '2', null, 'YOUXIHUODONGLIEBIAO', '游戏活动列表', null, '16', 'marketing/gameMgnt.jsp', null, null, null, null, null, null, null, null, '1', null, '2016-10-07 17:30:10', null, '0000-00-00 00:00:00');
INSERT INTO `sys_func` VALUES ('17', null, null, null, '15', '2', null, 'ZHONGJIANGQINGDAN', '中奖清单管理', null, '17', 'marketing/gameAwardMgnt.jsp', null, null, null, null, null, null, null, null, '1', null, '2016-10-07 17:30:11', null, '0000-00-00 00:00:00');
INSERT INTO `sys_func` VALUES ('18', null, null, null, '15', '2', null, 'YOUXIMOBAN', '游戏模板管理', null, '18', 'marketing/gameTempletMgnt.jsp', null, null, null, null, null, null, null, null, '1', null, '2016-10-07 17:30:13', null, '0000-00-00 00:00:00');
INSERT INTO `sys_func` VALUES ('19', null, null, null, '15', '2', null, 'TESHUMINGDAN', '特殊名单管理', null, '19', 'marketing/specialListMgnt.jsp', null, null, null, null, null, null, null, null, '1', null, '2016-10-07 17:30:14', null, '0000-00-00 00:00:00');
INSERT INTO `sys_func` VALUES ('20', null, null, null, null, '1', null, 'JIFENGUANLI', '积分管理', null, '20', '*.jsp', null, null, null, null, null, null, null, null, '1', null, '2016-10-07 17:30:14', null, '0000-00-00 00:00:00');
INSERT INTO `sys_func` VALUES ('21', null, null, null, '20', '2', null, 'DUIRUCHAXUN', '积分兑入查询', null, '21', 'points/pointsExchangeInMgnt.jsp', null, null, null, null, null, null, null, null, '1', null, '2016-10-07 17:30:15', null, '0000-00-00 00:00:00');
INSERT INTO `sys_func` VALUES ('22', null, null, null, '20', '2', null, 'XIAOHAOCHAXUN', '积分消耗查询', null, '22', 'points/pointsExchangeOutMgnt.jsp', null, null, null, null, null, null, null, null, '1', null, '2016-10-07 17:30:18', null, '0000-00-00 00:00:00');
INSERT INTO `sys_func` VALUES ('23', null, null, null, '20', '2', null, 'JIANGLICHAXUN', '积分奖励查询', null, '23', 'points/pointsExchangeAwardMgnt.jsp', null, null, null, null, null, null, null, null, '1', null, '2016-10-07 17:30:17', null, '0000-00-00 00:00:00');
INSERT INTO `sys_func` VALUES ('24', null, null, null, null, '1', null, 'DUIHUAMINGXI', '积分兑换明细', null, '24', 'points/pointsExchangeInDetailMgnt.jsp', null, null, null, null, null, null, null, null, '1', null, '2016-10-07 17:30:16', null, '0000-00-00 00:00:00');
INSERT INTO `sys_func` VALUES ('25', null, null, null, null, '1', null, 'XITONGGUANLI', '系统管理', null, '7', '*.jsp', null, null, null, null, null, null, null, null, '1', null, '2016-12-20 01:50:05', null, '0000-00-00 00:00:00');
INSERT INTO `sys_func` VALUES ('26', null, null, null, '25', '2', null, 'YONGHUGUANLI', '用户管理', null, '25', 'user/userMgnt.jsp', null, null, null, null, null, null, null, null, '1', null, '2016-12-20 01:50:11', null, '0000-00-00 00:00:00');
INSERT INTO `sys_func` VALUES ('27', null, null, null, '25', '2', '', 'JUESECAIDANGUANLI', '角色菜单管理', '', '26', 'role/rolefunc.jsp', '', '', null, null, null, '', null, null, '1', '1', '2016-09-21 10:26:52', null, '0000-00-00 00:00:00');
INSERT INTO `sys_func` VALUES ('28', null, null, null, null, '1', null, null, '类目管理', null, '27', 'system/mallCatMgnt.jsp', null, null, null, null, null, null, null, null, '1', null, '2016-12-19 20:20:03', null, '0000-00-00 00:00:00');
INSERT INTO `sys_func` VALUES ('29', null, null, null, null, '1', null, 'jifengongyingshangguanli', '积分供应商管理', null, '28', 'marchant/marchantMgnt.jsp', null, null, null, null, null, null, null, null, '1', null, '2016-12-22 15:54:49', null, '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for sys_op
-- ----------------------------
DROP TABLE IF EXISTS `sys_op`;
CREATE TABLE `sys_op` (
  `OP_ID` decimal(16,0) NOT NULL COMMENT '账户ID',
  `OP_NAME` varchar(200) DEFAULT NULL COMMENT '操作员姓名',
  `OP_CODE` varchar(30) DEFAULT NULL COMMENT '操作员编码',
  `OP_KIND` decimal(2,0) DEFAULT NULL COMMENT '操作员类别：1-超级管理员 2-管理员 3-普通用户',
  `OP_PIC` varchar(400) DEFAULT NULL COMMENT '操作员头像',
  `MOBILE_NO` varchar(20) DEFAULT NULL COMMENT '手机号',
  `EMAIL_ADRESS` varchar(40) DEFAULT NULL COMMENT '电子邮件地址',
  `LOGIN_CODE` varchar(30) DEFAULT NULL COMMENT '登录工号',
  `LOGIN_PASSWD` varchar(80) DEFAULT NULL COMMENT '登录密码',
  `LOCK_FLAG` decimal(2,0) DEFAULT NULL COMMENT '锁定标志：1-未锁定 2-锁定',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODIFIER` decimal(12,0) DEFAULT NULL COMMENT '修改人',
  `MODIFY_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`OP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录员工及操作员信息（员工姓名、电话等自然信息及操作员工号、密码等系统信息）';

-- ----------------------------
-- Records of sys_op
-- ----------------------------
INSERT INTO `sys_op` VALUES ('0', '自己新建的超级管理员', '1232131', '1', '/UserPhoto/GitHub.jpg', '12312321312', '231231231@qq.com', 'MySuperAdmin', null, null, '1', null, '2016-12-21 00:52:49', null, '0000-00-00 00:00:00');
INSERT INTO `sys_op` VALUES ('1', '平台管理员', '11111111111', '1', '/UserPhoto/GitHub_face.jpg', '11111111', '111111@qq.com', 'admin', '038bdaf98f2037b31f1e75b5b4c9b26e', null, '1', null, '2016-12-27 13:14:39', null, '0000-00-00 00:00:00');
INSERT INTO `sys_op` VALUES ('100', '甘肃联通', null, '3', '/UserPhoto/GitHub.jpg', null, null, 'gansuliantong', '123456', null, '1', null, '2016-12-21 00:52:49', null, '0000-00-00 00:00:00');
INSERT INTO `sys_op` VALUES ('1001', 'fresh café', null, '3', '/UserPhoto/GitHub.jpg', null, null, 'freshcafe', '123456', null, '1', null, '2016-12-21 00:52:49', null, '0000-00-00 00:00:00');
INSERT INTO `sys_op` VALUES ('2001', '太平洋院线', null, '3', '/UserPhoto/GitHub.jpg', null, null, 'taipingyang', '123456', null, '1', null, '2016-12-21 00:52:49', null, '0000-00-00 00:00:00');
INSERT INTO `sys_op` VALUES ('100001', '李四1', '123', '1', '/UserPhoto/GitHub.jpg', '18887878725', 'lisi@atguigu.com', 'lisi', null, null, '1', null, '2016-12-21 00:52:49', '1', '2016-09-24 10:50:09');
INSERT INTO `sys_op` VALUES ('100002', '王力', '6552', '2', '/UserPhoto/GitHub.jpg', '18978252552', 'a@163.com', 'wangli', null, null, '1', null, '2016-12-21 00:52:49', '1', '2016-09-24 11:05:18');
INSERT INTO `sys_op` VALUES ('100005', '我的普通用户', '21311', '3', '/UserPhoto/GitHub.jpg', '321323', '23112312@qq.com', '32323', null, null, '1', null, '2016-12-21 00:52:49', null, '0000-00-00 00:00:00');
INSERT INTO `sys_op` VALUES ('100023', '我的管理员', '231231', '2', '/UserPhoto/GitHub.jpg', '343243223', '342342343@qq.com', '23121', null, null, '1', null, '2016-12-21 00:52:49', '100', '2016-12-16 13:38:51');
INSERT INTO `sys_op` VALUES ('100024', 'test普通', '31231', '3', '/UserPhoto/GitHub.jpg', '12312321', '3123123@qq.com', '23123123', null, null, '1', null, '2016-12-21 00:52:49', '100', '2016-12-17 10:55:34');
INSERT INTO `sys_op` VALUES ('100025', '1111111111111', '1111111111', '2', '/UserPhoto/GitHub.jpg', '11111111111', '1111111111111111', '1111111111111', null, null, '1', null, '2016-12-21 00:52:49', null, '0000-00-00 00:00:00');
INSERT INTO `sys_op` VALUES ('100030', '1111', '2222', '3', '/UserPhoto/GitHub.jpg', '222', '22', '222', null, null, '1', '100', '2016-12-21 00:52:49', '100', '2016-12-17 13:39:39');
INSERT INTO `sys_op` VALUES ('100031', '222222222222222222222', '2', null, '/UserPhoto/GitHub.jpg', '2', '2', '2', null, null, '1', '100', '2016-12-21 00:52:49', null, '0000-00-00 00:00:00');
INSERT INTO `sys_op` VALUES ('100032', '3333333', '333333', null, '/UserPhoto/GitHub.jpg', '33333', '333333', '33333', null, null, '1', '100', '2016-12-21 00:52:49', null, '0000-00-00 00:00:00');
INSERT INTO `sys_op` VALUES ('100033', '4444444', '11111111111', '2', '/UserPhoto/GitHub.jpg', '', '', '44', null, null, '1', '100', '2016-12-21 00:52:49', null, '0000-00-00 00:00:00');
INSERT INTO `sys_op` VALUES ('100034', '5555', '', '2', '/UserPhoto/GitHub.jpg', '', '', '', null, null, '1', '100', '2016-12-21 00:52:49', null, '0000-00-00 00:00:00');
INSERT INTO `sys_op` VALUES ('100050', '什么鬼啊啊啊', '12', '2', '/UserPhoto/GitHub.jpg', '2321', '24324', '烦', null, null, '1', '1', '2016-12-21 00:52:49', null, '0000-00-00 00:00:00');
INSERT INTO `sys_op` VALUES ('100051', '', '', null, '/UserPhoto/GitHub.jpg', '', '', '', null, null, '1', '1', '2016-12-21 00:52:49', null, '0000-00-00 00:00:00');
INSERT INTO `sys_op` VALUES ('100052', '', '', null, '/UserPhoto/GitHub.jpg', '', '', '', null, null, '1', '1', '2016-12-21 00:52:49', null, '0000-00-00 00:00:00');
INSERT INTO `sys_op` VALUES ('100053', 'ajax的验证', '12312', '2', '/UserPhoto/GitHub.jpg', '111', '123qwqw@qq.com', '12312', null, null, '1', '1', '2016-12-21 00:52:49', null, '0000-00-00 00:00:00');
INSERT INTO `sys_op` VALUES ('100054', '555555', '', null, '/UserPhoto/GitHub.jpg', '15586783763', '12312312@qq.com', '', null, null, '1', '1', '2016-12-21 00:52:49', null, '0000-00-00 00:00:00');
INSERT INTO `sys_op` VALUES ('100055', null, null, null, '/UserPhoto/GitHub.jpg', null, null, null, null, null, '1', '1', '2016-12-21 00:52:49', '1', '2016-12-20 00:20:43');
INSERT INTO `sys_op` VALUES ('100056', '7777777777777', '7777777777', '1', '/UserPhoto/GitHub.jpg', '777', '777777@qq.com', '77777777777', null, null, '1', '1', '2016-12-21 00:46:03', null, '0000-00-00 00:00:00');
INSERT INTO `sys_op` VALUES ('100057', '999999999', '999999', '2', '/UserPhoto/GitHub.jpg', '99999999', '99999999999@qq.com', '9999999999', null, null, '1', '1', '2016-12-21 20:35:17', null, '0000-00-00 00:00:00');
INSERT INTO `sys_op` VALUES ('100058', '8989898', '89898', '3', '', '8989898', '89898@qq.com', '898989', null, null, '0', '1', '2017-05-24 10:49:36', '1', '2017-05-24 10:49:36');
INSERT INTO `sys_op` VALUES ('100059', '78787', '878787', '2', '/UserPhoto/maven-feather.png', '787878', '787878@qq.com', '878787', null, null, '0', '1', '2017-05-24 10:49:39', '1', '2017-05-24 10:49:40');
INSERT INTO `sys_op` VALUES ('1000034', '1232', '442', '2', '/UserPhoto/GitHub.jpg', '242', '4424', '4242', null, null, '1', null, '2016-12-21 00:52:49', '1', '2016-09-24 15:53:35');

-- ----------------------------
-- Table structure for sys_op_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_op_role`;
CREATE TABLE `sys_op_role` (
  `OP_ROLE_ID` decimal(16,0) NOT NULL COMMENT '操作员角色类型ID',
  `ROLE_ID` decimal(16,0) DEFAULT NULL COMMENT '角色ID',
  `OP_ID` decimal(16,0) DEFAULT NULL COMMENT '账户ID',
  `NOTES` varchar(800) DEFAULT NULL COMMENT '备注',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODIFIER` decimal(12,0) DEFAULT NULL COMMENT '修改人',
  `MODIFY_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`OP_ROLE_ID`),
  KEY `FK_SYS_OPROLE_R_OP` (`OP_ID`),
  KEY `FK_SYS_OPROLE_R_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_SYS_OPROLE_R_OP` FOREIGN KEY (`OP_ID`) REFERENCES `sys_op` (`OP_ID`),
  CONSTRAINT `FK_SYS_OPROLE_R_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `sys_role` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录员工具有的角色';

-- ----------------------------
-- Records of sys_op_role
-- ----------------------------
INSERT INTO `sys_op_role` VALUES ('1', '1', '1', null, '1', null, '2016-08-24 11:55:14', null, '0000-00-00 00:00:00');
INSERT INTO `sys_op_role` VALUES ('2', '3', '100', null, '1', null, '2016-08-24 11:55:14', null, '0000-00-00 00:00:00');
INSERT INTO `sys_op_role` VALUES ('3', '2', '1001', null, '1', null, '2016-08-24 11:55:14', null, '0000-00-00 00:00:00');
INSERT INTO `sys_op_role` VALUES ('4', '2', '2001', null, '1', null, '2016-08-24 11:55:14', null, '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ROLE_ID` decimal(16,0) NOT NULL COMMENT '角色ID',
  `ROLE_NAME` varchar(80) DEFAULT NULL COMMENT '角色名称',
  `ROLE_DESC` varchar(400) DEFAULT NULL COMMENT '角色描述',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODIFIER` decimal(12,0) DEFAULT NULL COMMENT '修改人',
  `MODIFY_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录系统的角色，如客户经理、主管经理、业务支撑人员、产品经理等\r\n（静态数据表）';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '平台管理员', null, '1', null, '2016-08-24 11:55:11', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role` VALUES ('2', '商家', null, '1', null, '2016-08-24 11:55:11', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role` VALUES ('3', '积分供应商', null, '1', null, '2016-08-24 11:55:11', null, '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for sys_role_func
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_func`;
CREATE TABLE `sys_role_func` (
  `ROLE_FUNC_ID` decimal(16,0) NOT NULL COMMENT '角色功能ID',
  `ROLE_ID` decimal(16,0) DEFAULT NULL COMMENT '角色ID',
  `FUNC_ID` decimal(16,0) DEFAULT NULL COMMENT '功能ID',
  `NOTES` varchar(800) DEFAULT NULL COMMENT '备注',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODIFIER` decimal(12,0) DEFAULT NULL COMMENT '修改人',
  `MODIFY_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`ROLE_FUNC_ID`),
  KEY `FK_ROLEFUNC_R_FUNC` (`FUNC_ID`),
  KEY `FK_ROLEFUNC_R_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLEFUNC_R_FUNC` FOREIGN KEY (`FUNC_ID`) REFERENCES `sys_func` (`FUNC_ID`),
  CONSTRAINT `FK_ROLEFUNC_R_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `sys_role` (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色功能表';

-- ----------------------------
-- Records of sys_role_func
-- ----------------------------
INSERT INTO `sys_role_func` VALUES ('1', '1', '1', null, '0', null, '2016-09-28 15:54:28', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('3', '1', '3', null, '0', null, '2016-09-28 15:54:28', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('4', '1', '4', null, '0', null, '2016-09-28 15:54:28', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('5', '1', '5', null, '0', null, '2016-09-28 15:54:28', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('6', '1', '6', null, '0', null, '2016-09-28 15:54:28', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('7', '1', '7', null, '0', null, '2016-09-28 15:54:28', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('8', '1', '8', null, '0', null, '2016-09-28 15:54:28', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('9', '1', '9', null, '0', null, '2016-09-28 15:54:28', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('10', '1', '10', null, '0', null, '2016-09-28 15:54:28', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('11', '1', '11', null, '0', null, '2016-09-28 15:54:28', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('12', '1', '13', null, '0', null, '2016-09-28 15:54:28', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('13', '1', '15', null, '0', null, '2016-09-28 15:54:28', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('14', '1', '16', null, '0', null, '2016-09-28 15:54:28', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('15', '1', '17', null, '0', null, '2016-09-28 15:54:28', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('16', '1', '18', null, '0', null, '2016-09-28 15:54:28', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('17', '1', '19', null, '0', null, '2016-09-28 15:54:28', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('18', '1', '20', null, '0', null, '2016-09-28 15:54:28', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('19', '1', '21', null, '0', null, '2016-09-28 15:54:28', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('20', '1', '22', null, '0', null, '2016-09-28 15:54:28', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('21', '1', '23', null, '0', null, '2016-09-28 15:54:28', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('22', '2', '1', null, '0', null, '2016-09-28 15:54:28', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('23', '2', '2', null, '0', null, '2016-09-28 15:54:28', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('24', '2', '11', null, '0', null, '2016-09-28 15:54:28', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('25', '2', '12', null, '0', null, '2016-09-28 15:54:28', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('26', '2', '14', null, '0', null, '2016-09-28 15:54:28', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('27', '3', '24', null, '0', null, '2016-12-18 20:59:30', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('28', '1', '25', null, '0', null, '2016-09-28 15:54:28', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('29', '1', '26', null, '0', null, '2016-09-28 15:54:28', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('30', '1', '27', '', '0', '1', '2016-09-28 15:54:28', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100008', '2', '25', null, '0', '1', '2016-12-18 21:15:56', null, '2016-09-28 16:39:32');
INSERT INTO `sys_role_func` VALUES ('100009', '2', '27', null, '0', '1', '2016-12-18 21:15:56', null, '2016-09-28 16:39:32');
INSERT INTO `sys_role_func` VALUES ('100010', '1', '20', null, '0', '1', '2016-09-28 16:48:24', null, '2016-09-28 16:46:55');
INSERT INTO `sys_role_func` VALUES ('100011', '1', '21', null, '0', '1', '2016-09-28 16:48:24', null, '2016-09-28 16:46:55');
INSERT INTO `sys_role_func` VALUES ('100012', '1', '22', null, '0', '1', '2016-09-28 16:48:24', null, '2016-09-28 16:46:55');
INSERT INTO `sys_role_func` VALUES ('100013', '1', '23', null, '0', '1', '2016-09-28 16:48:24', null, '2016-09-28 16:46:55');
INSERT INTO `sys_role_func` VALUES ('100014', '1', '20', null, '0', '1', '2016-09-28 16:49:13', null, '2016-09-28 16:48:24');
INSERT INTO `sys_role_func` VALUES ('100015', '1', '21', null, '0', '1', '2016-09-28 16:49:13', null, '2016-09-28 16:48:24');
INSERT INTO `sys_role_func` VALUES ('100016', '1', '22', null, '0', '1', '2016-09-28 16:49:13', null, '2016-09-28 16:48:24');
INSERT INTO `sys_role_func` VALUES ('100017', '1', '23', null, '0', '1', '2016-09-28 16:49:13', null, '2016-09-28 16:48:24');
INSERT INTO `sys_role_func` VALUES ('100018', '1', '24', null, '0', '1', '2016-09-28 16:49:13', null, '2016-09-28 16:48:24');
INSERT INTO `sys_role_func` VALUES ('100019', '1', '20', null, '0', '1', '2016-09-28 16:49:29', null, '2016-09-28 16:49:13');
INSERT INTO `sys_role_func` VALUES ('100020', '1', '21', null, '0', '1', '2016-09-28 16:49:29', null, '2016-09-28 16:49:13');
INSERT INTO `sys_role_func` VALUES ('100021', '1', '22', null, '0', '1', '2016-09-28 16:49:29', null, '2016-09-28 16:49:13');
INSERT INTO `sys_role_func` VALUES ('100022', '1', '23', null, '0', '1', '2016-09-28 16:49:29', null, '2016-09-28 16:49:13');
INSERT INTO `sys_role_func` VALUES ('100023', '1', '24', null, '0', '1', '2016-09-28 16:49:29', null, '2016-09-28 16:49:13');
INSERT INTO `sys_role_func` VALUES ('100024', '1', '20', null, '0', '1', '2016-09-28 16:49:39', null, '2016-09-28 16:49:29');
INSERT INTO `sys_role_func` VALUES ('100025', '1', '21', null, '0', '1', '2016-09-28 16:49:39', null, '2016-09-28 16:49:29');
INSERT INTO `sys_role_func` VALUES ('100026', '1', '22', null, '0', '1', '2016-09-28 16:49:39', null, '2016-09-28 16:49:29');
INSERT INTO `sys_role_func` VALUES ('100027', '1', '23', null, '0', '1', '2016-09-28 16:49:39', null, '2016-09-28 16:49:29');
INSERT INTO `sys_role_func` VALUES ('100028', '1', '20', null, '0', '1', '2016-09-28 16:50:29', null, '2016-09-28 16:49:39');
INSERT INTO `sys_role_func` VALUES ('100029', '1', '21', null, '0', '1', '2016-09-28 16:50:29', null, '2016-09-28 16:49:39');
INSERT INTO `sys_role_func` VALUES ('100030', '1', '22', null, '0', '1', '2016-09-28 16:50:29', null, '2016-09-28 16:49:39');
INSERT INTO `sys_role_func` VALUES ('100031', '1', '23', null, '0', '1', '2016-09-28 16:50:29', null, '2016-09-28 16:49:39');
INSERT INTO `sys_role_func` VALUES ('100032', '1', '20', null, '0', '1', '2016-12-18 21:13:46', null, '2016-09-28 16:50:29');
INSERT INTO `sys_role_func` VALUES ('100033', '1', '21', null, '0', '1', '2016-12-18 21:13:46', null, '2016-09-28 16:50:29');
INSERT INTO `sys_role_func` VALUES ('100034', '1', '22', null, '0', '1', '2016-12-18 21:13:46', null, '2016-09-28 16:50:29');
INSERT INTO `sys_role_func` VALUES ('100035', '1', '23', null, '0', '1', '2016-12-18 21:13:46', null, '2016-09-28 16:50:29');
INSERT INTO `sys_role_func` VALUES ('100036', '3', '25', null, '0', '1', '2016-12-18 20:59:30', null, '2016-09-28 16:51:33');
INSERT INTO `sys_role_func` VALUES ('100037', '3', '25', null, '0', '1', '2016-12-18 20:59:30', null, '2016-09-28 16:53:56');
INSERT INTO `sys_role_func` VALUES ('100038', '3', '27', null, '0', '1', '2016-12-18 20:59:30', null, '2016-09-28 16:53:56');
INSERT INTO `sys_role_func` VALUES ('100039', '3', '25', null, '0', '1', '2016-12-18 20:59:30', null, '2016-09-28 16:55:29');
INSERT INTO `sys_role_func` VALUES ('100040', '3', '26', null, '0', '1', '2016-12-18 20:59:30', null, '2016-09-28 16:55:29');
INSERT INTO `sys_role_func` VALUES ('100041', '3', '27', null, '0', '1', '2016-12-18 20:59:30', null, '2016-09-28 16:55:29');
INSERT INTO `sys_role_func` VALUES ('100042', '3', '25', null, '0', '1', '2016-12-18 20:59:30', null, '2016-09-28 16:57:15');
INSERT INTO `sys_role_func` VALUES ('100043', '3', '26', null, '0', '1', '2016-12-18 20:59:30', null, '2016-09-28 16:57:15');
INSERT INTO `sys_role_func` VALUES ('100044', '3', '27', null, '0', '1', '2016-12-18 20:59:30', null, '2016-09-28 16:57:15');
INSERT INTO `sys_role_func` VALUES ('100045', '3', '25', null, '0', '1', '2016-12-18 20:59:30', null, '2016-09-28 16:57:26');
INSERT INTO `sys_role_func` VALUES ('100046', '3', '26', null, '0', '1', '2016-12-18 20:59:30', null, '2016-09-28 16:57:26');
INSERT INTO `sys_role_func` VALUES ('100047', '3', '27', null, '0', '1', '2016-12-18 20:59:30', null, '2016-09-28 16:57:26');
INSERT INTO `sys_role_func` VALUES ('100048', '3', '25', null, '0', '1', '2016-12-18 20:59:30', null, '2016-09-28 17:00:31');
INSERT INTO `sys_role_func` VALUES ('100049', '3', '26', null, '0', '1', '2016-12-18 20:59:30', null, '2016-09-28 17:00:31');
INSERT INTO `sys_role_func` VALUES ('100050', '3', '27', null, '0', '1', '2016-12-18 20:59:30', null, '2016-09-28 17:00:31');
INSERT INTO `sys_role_func` VALUES ('100051', '3', '25', null, '0', '1', '2016-12-18 20:59:30', null, '2016-09-28 17:01:47');
INSERT INTO `sys_role_func` VALUES ('100052', '3', '26', null, '0', '1', '2016-12-18 20:59:30', null, '2016-09-28 17:01:47');
INSERT INTO `sys_role_func` VALUES ('100053', '3', '27', null, '0', '1', '2016-12-18 20:59:30', null, '2016-09-28 17:01:47');
INSERT INTO `sys_role_func` VALUES ('100057', '3', '25', null, '0', '100', '2016-12-18 20:59:48', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100058', '3', '26', null, '0', '100', '2016-12-18 20:59:48', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100059', '3', '27', null, '0', '100', '2016-12-18 20:59:48', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100060', '3', '25', null, '0', '100', '2016-12-18 21:15:18', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100061', '3', '26', null, '0', '100', '2016-12-18 21:15:18', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100062', '3', '27', null, '0', '100', '2016-12-18 21:15:18', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100063', '1', '25', null, '0', '100', '2016-12-18 21:18:12', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100064', '1', '26', null, '0', '100', '2016-12-18 21:18:12', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100065', '1', '27', null, '0', '100', '2016-12-18 21:18:12', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100066', '3', '20', null, '0', '1', '2016-12-19 09:53:49', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100067', '3', '21', null, '0', '1', '2016-12-19 09:53:49', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100068', '3', '22', null, '0', '1', '2016-12-19 09:53:49', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100069', '3', '23', null, '0', '1', '2016-12-19 09:53:49', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100070', '3', '24', null, '0', '1', '2016-12-19 09:53:49', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100071', '2', '1', null, '0', '1', '2016-12-18 21:24:48', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100072', '2', '2', null, '0', '1', '2016-12-18 21:24:48', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100073', '1', '25', null, '0', '1', '2016-12-19 14:58:42', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100074', '1', '26', null, '0', '1', '2016-12-19 14:58:42', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100075', '1', '27', null, '0', '1', '2016-12-19 14:58:42', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100076', '2', '1', null, '0', '1', '2016-12-18 21:24:54', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100077', '2', '2', null, '0', '1', '2016-12-18 21:24:54', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100078', '2', '1', null, '0', '1', '2016-12-18 21:29:17', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100079', '2', '1', null, '0', '1', '2017-05-24 10:31:31', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100080', '2', '2', null, '0', '1', '2017-05-24 10:31:31', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100081', '2', '3', null, '0', '1', '2017-05-24 10:31:31', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100082', '3', '15', null, '0', '1', '2016-12-19 20:16:37', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100083', '3', '16', null, '0', '1', '2016-12-19 20:16:37', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100084', '3', '17', null, '0', '1', '2016-12-19 20:16:37', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100085', '3', '18', null, '0', '1', '2016-12-19 20:16:37', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100086', '3', '19', null, '0', '1', '2016-12-19 20:16:37', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100087', '3', '20', null, '0', '1', '2016-12-19 20:16:37', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100088', '3', '21', null, '0', '1', '2016-12-19 20:16:37', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100089', '3', '22', null, '0', '1', '2016-12-19 20:16:37', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100090', '3', '23', null, '0', '1', '2016-12-19 20:16:37', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100091', '3', '24', null, '0', '1', '2016-12-19 20:16:37', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100092', '1', '25', null, '0', '1', '2016-12-19 20:16:59', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100093', '1', '26', null, '0', '1', '2016-12-19 20:16:59', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100094', '1', '27', null, '0', '1', '2016-12-19 20:16:59', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100096', '3', '15', null, '0', '1', '2016-12-19 20:18:33', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100097', '3', '16', null, '0', '1', '2016-12-19 20:18:33', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100098', '3', '17', null, '0', '1', '2016-12-19 20:18:33', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100099', '3', '18', null, '0', '1', '2016-12-19 20:18:33', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100100', '3', '19', null, '0', '1', '2016-12-19 20:18:33', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100101', '3', '20', null, '0', '1', '2016-12-19 20:18:33', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100102', '3', '21', null, '0', '1', '2016-12-19 20:18:33', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100103', '3', '22', null, '0', '1', '2016-12-19 20:18:33', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100104', '3', '23', null, '0', '1', '2016-12-19 20:18:33', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100105', '3', '24', null, '0', '1', '2016-12-19 20:18:33', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100107', '1', '25', null, '0', '1', '2016-12-19 20:18:37', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100108', '1', '26', null, '0', '1', '2016-12-19 20:18:37', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100109', '1', '27', null, '0', '1', '2016-12-19 20:18:37', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100110', '3', '15', null, '0', '1', '2016-12-22 00:37:19', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100111', '3', '16', null, '0', '1', '2016-12-22 00:37:19', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100112', '3', '17', null, '0', '1', '2016-12-22 00:37:19', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100113', '3', '18', null, '0', '1', '2016-12-22 00:37:19', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100114', '3', '19', null, '0', '1', '2016-12-22 00:37:19', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100115', '3', '20', null, '0', '1', '2016-12-22 00:37:19', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100116', '3', '21', null, '0', '1', '2016-12-22 00:37:19', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100117', '3', '22', null, '0', '1', '2016-12-22 00:37:19', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100118', '3', '23', null, '0', '1', '2016-12-22 00:37:19', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100119', '3', '24', null, '0', '1', '2016-12-22 00:37:19', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100120', '1', '25', null, '0', '1', '2016-12-19 20:20:19', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100121', '1', '26', null, '0', '1', '2016-12-19 20:20:19', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100122', '1', '27', null, '0', '1', '2016-12-19 20:20:19', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100123', '1', '25', null, '0', '1', '2016-12-20 01:47:38', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100124', '1', '26', null, '0', '1', '2016-12-20 01:47:38', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100125', '1', '27', null, '0', '1', '2016-12-20 01:47:38', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100126', '1', '28', null, '0', '1', '2016-12-20 01:47:38', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100127', '1', '7', null, '0', '1', '2016-12-20 16:26:14', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100128', '1', '25', null, '0', '1', '2016-12-20 16:26:14', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100129', '1', '26', null, '0', '1', '2016-12-20 16:26:14', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100130', '1', '27', null, '0', '1', '2016-12-20 16:26:14', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100131', '1', '28', null, '0', '1', '2016-12-20 16:26:14', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100132', '1', '7', null, '0', '1', '2016-12-21 16:31:09', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100133', '1', '8', null, '0', '1', '2016-12-21 16:31:09', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100134', '1', '9', null, '0', '1', '2016-12-21 16:31:09', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100135', '1', '25', null, '0', '1', '2016-12-21 16:31:09', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100136', '1', '26', null, '0', '1', '2016-12-21 16:31:09', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100137', '1', '27', null, '0', '1', '2016-12-21 16:31:09', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100138', '1', '28', null, '0', '1', '2016-12-21 16:31:09', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100139', '1', '4', null, '0', '1', '2016-12-22 15:54:01', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100140', '1', '5', null, '0', '1', '2016-12-22 15:54:01', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100141', '1', '7', null, '0', '1', '2016-12-22 15:54:01', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100142', '1', '8', null, '0', '1', '2016-12-22 15:54:01', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100143', '1', '9', null, '0', '1', '2016-12-22 15:54:01', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100144', '1', '25', null, '0', '1', '2016-12-22 15:54:01', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100145', '1', '26', null, '0', '1', '2016-12-22 15:54:01', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100146', '1', '27', null, '0', '1', '2016-12-22 15:54:01', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100147', '1', '28', null, '0', '1', '2016-12-22 15:54:01', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100148', '3', '4', null, '0', '1', '2017-05-24 10:46:07', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100149', '3', '6', null, '0', '1', '2017-05-24 10:46:07', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100150', '3', '15', null, '0', '1', '2017-05-24 10:46:07', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100151', '3', '16', null, '0', '1', '2017-05-24 10:46:07', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100152', '3', '17', null, '0', '1', '2017-05-24 10:46:07', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100153', '3', '18', null, '0', '1', '2017-05-24 10:46:07', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100154', '3', '19', null, '0', '1', '2017-05-24 10:46:07', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100155', '3', '20', null, '0', '1', '2017-05-24 10:46:07', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100156', '3', '21', null, '0', '1', '2017-05-24 10:46:07', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100157', '3', '22', null, '0', '1', '2017-05-24 10:46:07', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100158', '3', '23', null, '0', '1', '2017-05-24 10:46:07', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100159', '3', '24', null, '0', '1', '2017-05-24 10:46:07', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100160', '1', '4', null, '0', '1', '2016-12-22 23:53:18', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100161', '1', '5', null, '0', '1', '2016-12-22 23:53:18', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100162', '1', '7', null, '0', '1', '2016-12-22 23:53:18', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100163', '1', '8', null, '0', '1', '2016-12-22 23:53:18', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100164', '1', '9', null, '0', '1', '2016-12-22 23:53:18', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100165', '1', '25', null, '0', '1', '2016-12-22 23:53:18', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100166', '1', '26', null, '0', '1', '2016-12-22 23:53:18', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100167', '1', '27', null, '0', '1', '2016-12-22 23:53:18', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100168', '1', '28', null, '0', '1', '2016-12-22 23:53:18', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100169', '1', '29', null, '0', '1', '2016-12-22 23:53:18', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100170', '1', '1', null, '0', '1', '2016-12-23 00:10:32', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100171', '1', '2', null, '0', '1', '2016-12-23 00:10:32', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100172', '1', '3', null, '0', '1', '2016-12-23 00:10:32', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100173', '1', '4', null, '0', '1', '2016-12-23 00:10:32', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100174', '1', '5', null, '0', '1', '2016-12-23 00:10:32', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100175', '1', '7', null, '0', '1', '2016-12-23 00:10:32', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100176', '1', '8', null, '0', '1', '2016-12-23 00:10:32', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100177', '1', '9', null, '0', '1', '2016-12-23 00:10:32', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100178', '1', '25', null, '0', '1', '2016-12-23 00:10:32', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100179', '1', '26', null, '0', '1', '2016-12-23 00:10:32', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100180', '1', '27', null, '0', '1', '2016-12-23 00:10:32', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100181', '1', '28', null, '0', '1', '2016-12-23 00:10:32', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100182', '1', '29', null, '0', '1', '2016-12-23 00:10:32', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100183', '1', '1', null, '0', '1', '2017-05-24 10:31:20', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100184', '1', '2', null, '0', '1', '2017-05-24 10:31:20', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100185', '1', '4', null, '0', '1', '2017-05-24 10:31:20', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100186', '1', '5', null, '0', '1', '2017-05-24 10:31:20', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100187', '1', '7', null, '0', '1', '2017-05-24 10:31:20', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100188', '1', '8', null, '0', '1', '2017-05-24 10:31:20', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100189', '1', '9', null, '0', '1', '2017-05-24 10:31:20', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100190', '1', '25', null, '0', '1', '2017-05-24 10:31:20', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100191', '1', '26', null, '0', '1', '2017-05-24 10:31:20', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100192', '1', '27', null, '0', '1', '2017-05-24 10:31:20', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100193', '1', '28', null, '0', '1', '2017-05-24 10:31:20', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100194', '1', '29', null, '0', '1', '2017-05-24 10:31:20', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100195', '1', '1', null, '0', '1', '2017-05-24 10:32:14', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100196', '1', '2', null, '0', '1', '2017-05-24 10:32:14', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100197', '1', '4', null, '0', '1', '2017-05-24 10:32:14', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100198', '1', '5', null, '0', '1', '2017-05-24 10:32:14', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100199', '1', '7', null, '0', '1', '2017-05-24 10:32:14', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100200', '1', '8', null, '0', '1', '2017-05-24 10:32:14', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100201', '1', '9', null, '0', '1', '2017-05-24 10:32:14', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100202', '1', '25', null, '0', '1', '2017-05-24 10:32:14', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100203', '1', '26', null, '0', '1', '2017-05-24 10:32:14', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100204', '1', '27', null, '0', '1', '2017-05-24 10:32:14', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100205', '1', '28', null, '0', '1', '2017-05-24 10:32:14', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100206', '1', '29', null, '0', '1', '2017-05-24 10:32:14', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100207', '2', '1', null, '1', '1', '2017-05-24 10:31:31', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100208', '2', '2', null, '1', '1', '2017-05-24 10:31:31', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100209', '2', '3', null, '1', '1', '2017-05-24 10:31:31', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100210', '2', '4', null, '1', '1', '2017-05-24 10:31:31', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100211', '2', '7', null, '1', '1', '2017-05-24 10:31:31', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100212', '2', '8', null, '1', '1', '2017-05-24 10:31:31', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100213', '1', '1', null, '0', '1', '2017-05-24 10:46:26', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100214', '1', '2', null, '0', '1', '2017-05-24 10:46:26', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100215', '1', '3', null, '0', '1', '2017-05-24 10:46:26', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100216', '1', '4', null, '0', '1', '2017-05-24 10:46:26', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100217', '1', '5', null, '0', '1', '2017-05-24 10:46:26', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100218', '1', '6', null, '0', '1', '2017-05-24 10:46:26', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100219', '1', '7', null, '0', '1', '2017-05-24 10:46:26', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100220', '1', '8', null, '0', '1', '2017-05-24 10:46:26', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100221', '1', '9', null, '0', '1', '2017-05-24 10:46:26', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100222', '1', '10', null, '0', '1', '2017-05-24 10:46:26', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100223', '1', '11', null, '0', '1', '2017-05-24 10:46:26', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100224', '1', '12', null, '0', '1', '2017-05-24 10:46:26', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100225', '1', '13', null, '0', '1', '2017-05-24 10:46:26', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100226', '1', '14', null, '0', '1', '2017-05-24 10:46:26', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100227', '1', '15', null, '0', '1', '2017-05-24 10:46:26', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100228', '1', '16', null, '0', '1', '2017-05-24 10:46:26', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100229', '1', '17', null, '0', '1', '2017-05-24 10:46:26', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100230', '1', '18', null, '0', '1', '2017-05-24 10:46:26', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100231', '1', '19', null, '0', '1', '2017-05-24 10:46:26', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100232', '1', '20', null, '0', '1', '2017-05-24 10:46:26', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100233', '1', '21', null, '0', '1', '2017-05-24 10:46:26', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100234', '1', '22', null, '0', '1', '2017-05-24 10:46:26', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100235', '1', '23', null, '0', '1', '2017-05-24 10:46:26', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100236', '1', '24', null, '0', '1', '2017-05-24 10:46:26', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100237', '1', '25', null, '0', '1', '2017-05-24 10:46:26', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100238', '1', '26', null, '0', '1', '2017-05-24 10:46:26', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100239', '1', '27', null, '0', '1', '2017-05-24 10:46:26', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100240', '1', '28', null, '0', '1', '2017-05-24 10:46:26', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100241', '1', '29', null, '0', '1', '2017-05-24 10:46:26', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100242', '3', '4', null, '1', '1', '2017-05-24 10:46:08', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100243', '3', '6', null, '1', '1', '2017-05-24 10:46:08', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100244', '3', '11', null, '1', '1', '2017-05-24 10:46:08', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100245', '3', '12', null, '1', '1', '2017-05-24 10:46:08', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100246', '3', '15', null, '1', '1', '2017-05-24 10:46:08', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100247', '3', '16', null, '1', '1', '2017-05-24 10:46:08', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100248', '3', '17', null, '1', '1', '2017-05-24 10:46:08', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100249', '3', '18', null, '1', '1', '2017-05-24 10:46:08', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100250', '3', '19', null, '1', '1', '2017-05-24 10:46:08', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100251', '3', '20', null, '1', '1', '2017-05-24 10:46:08', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100252', '3', '21', null, '1', '1', '2017-05-24 10:46:08', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100253', '3', '22', null, '1', '1', '2017-05-24 10:46:08', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100254', '3', '23', null, '1', '1', '2017-05-24 10:46:08', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100255', '3', '24', null, '1', '1', '2017-05-24 10:46:08', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100256', '1', '1', null, '0', '1', '2017-05-24 10:47:18', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100257', '1', '2', null, '0', '1', '2017-05-24 10:47:18', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100258', '1', '3', null, '0', '1', '2017-05-24 10:47:18', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100259', '1', '4', null, '0', '1', '2017-05-24 10:47:18', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100260', '1', '5', null, '0', '1', '2017-05-24 10:47:18', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100261', '1', '6', null, '0', '1', '2017-05-24 10:47:18', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100262', '1', '7', null, '0', '1', '2017-05-24 10:47:18', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100263', '1', '8', null, '0', '1', '2017-05-24 10:47:18', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100264', '1', '9', null, '0', '1', '2017-05-24 10:47:18', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100265', '1', '10', null, '0', '1', '2017-05-24 10:47:18', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100266', '1', '11', null, '0', '1', '2017-05-24 10:47:18', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100267', '1', '12', null, '0', '1', '2017-05-24 10:47:18', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100268', '1', '13', null, '0', '1', '2017-05-24 10:47:18', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100269', '1', '25', null, '0', '1', '2017-05-24 10:47:18', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100270', '1', '26', null, '0', '1', '2017-05-24 10:47:18', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100271', '1', '27', null, '0', '1', '2017-05-24 10:47:18', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100272', '1', '28', null, '0', '1', '2017-05-24 10:47:18', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100273', '1', '29', null, '0', '1', '2017-05-24 10:47:18', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100274', '1', '1', null, '1', '1', '2017-05-24 10:47:19', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100275', '1', '2', null, '1', '1', '2017-05-24 10:47:19', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100276', '1', '3', null, '1', '1', '2017-05-24 10:47:19', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100277', '1', '4', null, '1', '1', '2017-05-24 10:47:19', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100278', '1', '5', null, '1', '1', '2017-05-24 10:47:19', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100279', '1', '7', null, '1', '1', '2017-05-24 10:47:19', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100280', '1', '8', null, '1', '1', '2017-05-24 10:47:19', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100281', '1', '9', null, '1', '1', '2017-05-24 10:47:19', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100282', '1', '25', null, '1', '1', '2017-05-24 10:47:19', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100283', '1', '26', null, '1', '1', '2017-05-24 10:47:19', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100284', '1', '27', null, '1', '1', '2017-05-24 10:47:19', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100285', '1', '28', null, '1', '1', '2017-05-24 10:47:19', null, '0000-00-00 00:00:00');
INSERT INTO `sys_role_func` VALUES ('100286', '1', '29', null, '1', '1', '2017-05-24 10:47:19', null, '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for tc_goods
-- ----------------------------
DROP TABLE IF EXISTS `tc_goods`;
CREATE TABLE `tc_goods` (
  `GOODS_ID` decimal(16,0) NOT NULL COMMENT '发货单ID',
  `ORDER_ID` decimal(16,0) DEFAULT NULL COMMENT '订单ID',
  `ITEM_CHK_CODE` varchar(80) DEFAULT NULL COMMENT '商品验证串码',
  `MCHT_ID` decimal(16,0) DEFAULT NULL COMMENT '商家ID',
  `MCHT_NAME` varchar(400) DEFAULT NULL COMMENT '商家名称',
  `ITEM_ID` decimal(16,0) DEFAULT NULL COMMENT '商品单元ID',
  `ITEM_TYPE` decimal(6,0) DEFAULT NULL COMMENT '商品单元类型',
  `ITEM_CODE` decimal(16,0) DEFAULT NULL COMMENT '商品单元编码：新创建商品编码与商品单元ID相同，非新创建商品（由某个已上架商品修改）编码使用其来源商品的编码',
  `ITEM_NAME` varchar(400) DEFAULT NULL COMMENT '商品单元名称',
  `ITEM_ACT_PRICE` decimal(18,6) DEFAULT NULL COMMENT '商品订单价格',
  `GOODS_DEAL_FEE` decimal(18,6) DEFAULT NULL COMMENT '发货单成交费用',
  `RTNISTD_STATE` decimal(6,0) DEFAULT NULL COMMENT '退换货状态：1-申请退货 2-退货成功 3-退货失败',
  `RTNISTD_RSN_TYPE` decimal(6,0) DEFAULT NULL COMMENT '退换货原因类型',
  `RTNISTD_REASON` varchar(2000) DEFAULT NULL COMMENT '退换货原因',
  `GOODS_RFD_FEE` decimal(18,6) DEFAULT NULL COMMENT '发货单退款费用',
  `USER_ID` decimal(16,0) DEFAULT NULL COMMENT '用户ID',
  `USER_NAME` varchar(80) DEFAULT NULL COMMENT '用户姓名',
  `USER_NICKNAME` varchar(80) DEFAULT NULL COMMENT '用户昵称',
  `LOGIN_NAME` varchar(80) DEFAULT NULL COMMENT '登录名（用户电子邮箱）',
  `USER_PHONENO` varchar(20) DEFAULT NULL COMMENT '用户手机号',
  `ITEM_VALID_START` datetime DEFAULT NULL COMMENT '商品单元有效期起',
  `ITEM_VALID_END` datetime DEFAULT NULL COMMENT '商品单元有效期止',
  `USE_TIME` datetime DEFAULT NULL COMMENT '使用时间',
  `USE_RESULT` decimal(2,0) DEFAULT NULL COMMENT '使用结果：1-验证通过 2-已过期',
  `SHOP_ID` decimal(16,0) DEFAULT NULL COMMENT '门店ID',
  `SHOP_SHORT_NAME` varchar(80) DEFAULT NULL COMMENT '门店简称',
  `SHOP_NAME` varchar(400) DEFAULT NULL COMMENT '门店名称',
  `EXP_STATE` decimal(2,0) DEFAULT NULL COMMENT '导出状态:1-已导出 2-未导出',
  `EXP_TIME` datetime DEFAULT NULL COMMENT '最后导出时间',
  `CHECK_STATE` decimal(2,0) DEFAULT NULL COMMENT '对账状态:1-已对账 2-未对账',
  `SETTLEMENT_DATE` datetime DEFAULT NULL COMMENT '结算成功日期',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFYER` decimal(16,0) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`GOODS_ID`),
  KEY `FK_ORD_RLT_GOD` (`ORDER_ID`),
  CONSTRAINT `FK_ORD_RLT_GOD` FOREIGN KEY (`ORDER_ID`) REFERENCES `tc_order` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录发货单主体信息，一个订单根据商品数量，产生相应的发货单，每个发货单具有唯一的验证串码';

-- ----------------------------
-- Records of tc_goods
-- ----------------------------
INSERT INTO `tc_goods` VALUES ('100001', '100001', '10000120160824', '1', 'fresh café', '100002', '1', '100004', '团购咖啡', '60.000000', '20.000000', null, null, null, null, '100001', null, 'skyo', 'letianok@qq.com', null, '2016-08-24 12:03:19', '2016-09-30 12:00:21', '2016-08-24 14:19:27', '1', '1001', 'hope coffee', 'hope coffee 张掖路店', '1', '2016-08-29 18:43:35', '1', null, '1', null, '2016-08-24 14:01:56', null, '2016-08-29 18:43:35');
INSERT INTO `tc_goods` VALUES ('100002', '100001', '10000220160824', '1', 'fresh café', '100002', '1', '100002', '12英寸乳脂蛋糕一个团购', '60.000000', '20.000000', '2', null, null, null, '100001', null, 'skyo', 'letianok@qq.com', null, '2016-08-24 12:03:19', '2016-09-30 12:00:21', '2016-08-24 14:19:42', '1', '1002', 'hope coffee', 'hope coffee 麦积山店', '2', null, '2', null, '1', null, '2016-08-24 14:01:56', null, '2016-08-24 14:19:42');
INSERT INTO `tc_goods` VALUES ('100003', '100001', '10000320160824', '1', 'fresh café', '100002', '1', '100002', '12英寸乳脂蛋糕一个团购', '60.000000', '20.000000', null, null, null, null, '100001', null, 'skyo', 'letianok@qq.com', null, '2016-08-24 12:03:19', '2016-09-30 12:00:21', null, null, null, null, null, '2', null, '2', null, '1', null, '2016-08-24 14:01:56', null, null);
INSERT INTO `tc_goods` VALUES ('100004', '100002', '10000420160825', '1', 'fresh café', '100002', '1', '100002', '12英寸乳脂蛋糕一个团购', '240.000000', '20.000000', null, null, null, null, '100001', null, 'skyo', 'letianok@qq.com', null, '2016-08-24 12:03:19', '2016-09-30 12:00:21', '2016-08-25 11:16:33', '1', '1001', 'hope coffee', 'hope coffee 张掖路店', '1', '2016-09-13 10:12:18', '1', null, '1', null, '2016-08-25 11:15:30', null, '2016-09-13 10:12:18');
INSERT INTO `tc_goods` VALUES ('100005', '100005', '10000520160825', '1', 'fresh café', '100002', '1', '100002', '12英寸乳脂蛋糕一个团购', '20.000000', '20.000000', null, null, null, null, '100001', null, 'skyo', 'letianok@qq.com', null, '2016-08-24 12:03:19', '2016-09-30 12:00:21', null, null, null, null, null, '2', null, '2', null, '1', null, '2016-08-25 11:29:26', null, null);
INSERT INTO `tc_goods` VALUES ('100006', '100006', '10000620160829', '1', 'fresh café', '100002', '1', '100002', '12英寸乳脂蛋糕一个团购', '40.000000', '20.000000', null, null, null, null, '100001', null, 'skyo', 'letianok@qq.com', null, '2016-08-24 12:03:19', '2016-09-30 12:00:21', null, null, null, null, null, '2', null, '2', null, '1', null, '2016-08-29 17:52:15', null, null);
INSERT INTO `tc_goods` VALUES ('100007', '100006', '10000720160829', '1', 'fresh café', '100002', '1', '100002', '12英寸乳脂蛋糕一个团购', '40.000000', '20.000000', null, null, null, null, '100001', null, 'skyo', 'letianok@qq.com', null, '2016-08-24 12:03:19', '2016-09-30 12:00:21', null, null, null, null, null, '2', null, '2', null, '1', null, '2016-08-29 17:52:15', null, null);
INSERT INTO `tc_goods` VALUES ('100008', '100007', '10000820160907', '1', 'fresh café', '100002', '1', '100002', '12英寸乳脂蛋糕一个团购', '40.000000', '20.000000', null, null, null, null, '100001', null, 'skyo', 'letianok@qq.com', null, '2016-08-24 12:03:19', '2016-09-30 12:00:21', null, null, null, null, null, '2', null, '2', null, '1', null, '2016-09-07 11:00:37', null, null);
INSERT INTO `tc_goods` VALUES ('100009', '100007', '10000920160907', '1', 'fresh café', '100002', '1', '100002', '12英寸乳脂蛋糕一个团购', '40.000000', '20.000000', null, null, null, null, '100001', null, 'skyo', 'letianok@qq.com', null, '2016-08-24 12:03:19', '2016-09-30 12:00:21', null, null, null, null, null, '2', null, '2', null, '1', null, '2016-09-07 11:00:37', null, null);
INSERT INTO `tc_goods` VALUES ('100010', '100008', '10001020160907', '1', 'fresh café', '100002', '1', '100002', '12英寸乳脂蛋糕一个团购', '20.000000', '20.000000', '1', null, '01', null, '100001', null, 'skyo', 'letianok@qq.com', null, '2016-08-24 12:03:19', '2016-09-30 12:00:21', null, null, null, null, null, '2', null, '2', null, '1', null, '2016-09-07 11:04:31', null, null);
INSERT INTO `tc_goods` VALUES ('100011', '100009', '10001120160913', '1', 'fresh café', '100002', '1', '100002', '12英寸乳脂蛋糕一个团购', '40.000000', '20.000000', null, null, null, null, '100001', null, 'skyo', 'letianok@qq.com', null, '2016-08-24 12:03:19', '2016-09-30 12:00:21', null, null, null, null, null, '2', null, '2', null, '1', null, '2016-09-13 09:18:48', null, null);
INSERT INTO `tc_goods` VALUES ('100012', '100009', '10001220160913', '1', 'fresh café', '100002', '1', '100002', '12英寸乳脂蛋糕一个团购', '40.000000', '20.000000', null, null, null, null, '100001', null, 'skyo', 'letianok@qq.com', null, '2016-08-24 12:03:19', '2016-09-30 12:00:21', null, null, null, null, null, '2', null, '2', null, '1', null, '2016-09-13 09:18:48', null, null);
INSERT INTO `tc_goods` VALUES ('100013', '100010', '10001320160913', '1', 'fresh café', '100002', '1', '100002', '12英寸乳脂蛋糕一个团购', '240.000000', '20.000000', null, null, null, null, '100001', null, 'skyo', 'letianok@qq.com', null, '2016-08-24 12:03:19', '2016-09-30 12:00:21', '2016-09-13 09:34:34', '1', '1001', 'hope coffee', 'hope coffee 张掖路店', '2', null, '2', null, '1', null, '2016-09-13 09:19:10', null, '2016-09-13 09:34:34');
INSERT INTO `tc_goods` VALUES ('100014', '100010', '10001420160913', '1', 'fresh café', '100002', '1', '100002', '12英寸乳脂蛋糕一个团购', '240.000000', '20.000000', null, null, null, null, '100001', null, 'skyo', 'letianok@qq.com', null, '2016-08-24 12:03:19', '2016-09-30 12:00:21', null, null, null, null, null, '2', null, '2', null, '1', null, '2016-09-13 09:19:10', null, null);
INSERT INTO `tc_goods` VALUES ('100015', '100010', '10001520160913', '1', 'fresh café', '100002', '1', '100002', '12英寸乳脂蛋糕一个团购', '240.000000', '20.000000', null, null, null, null, '100001', null, 'skyo', 'letianok@qq.com', null, '2016-08-24 12:03:19', '2016-09-30 12:00:21', null, null, null, null, null, '2', null, '2', null, '1', null, '2016-09-13 09:19:10', null, null);
INSERT INTO `tc_goods` VALUES ('100016', '100010', '10001620160913', '1', 'fresh café', '100002', '1', '100002', '12英寸乳脂蛋糕一个团购', '240.000000', '20.000000', null, null, null, null, '100001', null, 'skyo', 'letianok@qq.com', null, '2016-08-24 12:03:19', '2016-09-30 12:00:21', null, null, null, null, null, '2', null, '2', null, '1', null, '2016-09-13 09:19:10', null, null);
INSERT INTO `tc_goods` VALUES ('100017', '100010', '10001720160913', '1', 'fresh café', '100002', '1', '100002', '12英寸乳脂蛋糕一个团购', '240.000000', '20.000000', null, null, null, null, '100001', null, 'skyo', 'letianok@qq.com', null, '2016-08-24 12:03:19', '2016-09-30 12:00:21', null, null, null, null, null, '2', null, '2', null, '1', null, '2016-09-13 09:19:10', null, null);
INSERT INTO `tc_goods` VALUES ('100018', '100010', '10001820160913', '1', 'fresh café', '100002', '1', '100002', '12英寸乳脂蛋糕一个团购', '240.000000', '20.000000', null, null, null, null, '100001', null, 'skyo', 'letianok@qq.com', null, '2016-08-24 12:03:19', '2016-09-30 12:00:21', null, null, null, null, null, '2', null, '2', null, '1', null, '2016-09-13 09:19:10', null, null);
INSERT INTO `tc_goods` VALUES ('100019', '100010', '10001920160913', '1', 'fresh café', '100002', '1', '100002', '12英寸乳脂蛋糕一个团购', '240.000000', '20.000000', null, null, null, null, '100001', null, 'skyo', 'letianok@qq.com', null, '2016-08-24 12:03:19', '2016-09-30 12:00:21', null, null, null, null, null, '2', null, '2', null, '1', null, '2016-09-13 09:19:10', null, null);
INSERT INTO `tc_goods` VALUES ('100020', '100010', '10002020160913', '1', 'fresh café', '100002', '1', '100002', '12英寸乳脂蛋糕一个团购', '240.000000', '20.000000', null, null, null, null, '100001', null, 'skyo', 'letianok@qq.com', null, '2016-08-24 12:03:19', '2016-09-30 12:00:21', null, null, null, null, null, '2', null, '2', null, '1', null, '2016-09-13 09:19:10', null, null);
INSERT INTO `tc_goods` VALUES ('100021', '100010', '10002120160913', '1', 'fresh café', '100002', '1', '100002', '12英寸乳脂蛋糕一个团购', '240.000000', '20.000000', null, null, null, null, '100001', null, 'skyo', 'letianok@qq.com', null, '2016-08-24 12:03:19', '2016-09-30 12:00:21', null, null, null, null, null, '2', null, '2', null, '1', null, '2016-09-13 09:19:10', null, null);
INSERT INTO `tc_goods` VALUES ('100022', '100010', '10002220160913', '1', 'fresh café', '100002', '1', '100002', '12英寸乳脂蛋糕一个团购', '240.000000', '20.000000', null, null, null, null, '100001', null, 'skyo', 'letianok@qq.com', null, '2016-08-24 12:03:19', '2016-09-30 12:00:21', null, null, null, null, null, '2', null, '2', null, '1', null, '2016-09-13 09:19:10', null, null);
INSERT INTO `tc_goods` VALUES ('100023', '100010', '10002320160913', '1', 'fresh café', '100002', '1', '100002', '12英寸乳脂蛋糕一个团购', '240.000000', '20.000000', null, null, null, null, '100001', null, 'skyo', 'letianok@qq.com', null, '2016-08-24 12:03:19', '2016-09-30 12:00:21', null, null, null, null, null, '2', null, '2', null, '1', null, '2016-09-13 09:19:10', null, null);
INSERT INTO `tc_goods` VALUES ('100024', '100010', '10002420160913', '1', 'fresh café', '100002', '1', '100002', '12英寸乳脂蛋糕一个团购', '240.000000', '20.000000', null, null, null, null, '100001', null, 'skyo', 'letianok@qq.com', null, '2016-08-24 12:03:19', '2016-09-30 12:00:21', null, null, null, null, null, '2', null, '2', null, '1', null, '2016-09-13 09:19:10', null, null);

-- ----------------------------
-- Table structure for tc_order
-- ----------------------------
DROP TABLE IF EXISTS `tc_order`;
CREATE TABLE `tc_order` (
  `ORDER_ID` decimal(16,0) NOT NULL COMMENT '订单ID',
  `ORDER_CODE` varchar(40) DEFAULT NULL COMMENT '订单编号',
  `ORDER_TYPE` decimal(6,0) DEFAULT NULL COMMENT '订单类型(预留)',
  `MCHT_ID` decimal(16,0) DEFAULT NULL COMMENT '商家ID',
  `MCHT_NAME` varchar(400) DEFAULT NULL COMMENT '商家名称',
  `ITEM_ID` decimal(16,0) DEFAULT NULL COMMENT '商品单元ID',
  `ITEM_TYPE` decimal(6,0) DEFAULT NULL COMMENT '商品单元类型',
  `ITEM_CODE` decimal(16,0) DEFAULT NULL COMMENT '商品单元编码：新创建商品编码与商品单元ID相同，非新创建商品（由某个已上架商品修改）编码使用其来源商品的编码',
  `ITEM_NAME` varchar(400) DEFAULT NULL COMMENT '商品单元名称',
  `ITEM_ACT_PRICE` decimal(18,6) DEFAULT NULL COMMENT '商品订单价格',
  `USER_ID` decimal(16,0) DEFAULT NULL COMMENT '用户ID',
  `USER_NAME` varchar(80) DEFAULT NULL COMMENT '用户姓名',
  `USER_NICKNAME` varchar(80) DEFAULT NULL COMMENT '用户昵称',
  `LOGIN_NAME` varchar(80) DEFAULT NULL COMMENT '登录名（用户电子邮箱）',
  `USER_PHONENO` varchar(20) DEFAULT NULL COMMENT '用户手机号',
  `ORDER_CHANNEL` decimal(6,0) DEFAULT NULL COMMENT '下单渠道（预留）',
  `ORDER_TIME` datetime DEFAULT NULL COMMENT '下单时间',
  `PAY_TYPE` decimal(6,0) DEFAULT NULL COMMENT '支付方式（预留）',
  `PAY_STATE` decimal(6,0) DEFAULT NULL COMMENT '支付状态：1-未支付 2-已支付',
  `PAY_TIME` datetime DEFAULT NULL COMMENT '支付时间（最新支付单时间）',
  `ORDER_ITEM_NUMS` decimal(8,0) DEFAULT NULL COMMENT '订单商品数量',
  `GOODS_DEAL_FEE` decimal(18,6) DEFAULT NULL COMMENT '发货单成交费用',
  `ORDER_PAYED_FEE` decimal(18,6) DEFAULT NULL COMMENT '订单已付费用',
  `CANCEL_RSN_TYPE` decimal(6,0) DEFAULT NULL COMMENT '作废原因类型',
  `CANCEL_REASON` varchar(2000) DEFAULT NULL COMMENT '作废原因',
  `EVALUATION_STATE` decimal(6,0) DEFAULT NULL COMMENT '评价状态：1-未评价 2-已评价',
  `EVALUATION_ID` decimal(16,0) DEFAULT NULL COMMENT '商品评价ID',
  `RCV_ADDR_ID` decimal(16,0) DEFAULT NULL COMMENT '收货地址ID',
  `ORDER_EXT_INFO1` varchar(1000) DEFAULT NULL COMMENT '订单扩展信息1',
  `ORDER_EXT_INFO2` varchar(1000) DEFAULT NULL COMMENT '订单扩展信息2',
  `ORDER_EXT_INFO3` varchar(1000) DEFAULT NULL COMMENT '订单扩展信息3',
  `ORDER_EXT_INFO4` varchar(1000) DEFAULT NULL COMMENT '订单扩展信息4',
  `ORDER_EXT_INFO5` varchar(1000) DEFAULT NULL COMMENT '订单扩展信息5',
  `ORDER_EXT_INFO6` varchar(1000) DEFAULT NULL COMMENT '订单扩展信息6',
  `ORDER_EXT_INFO7` varchar(1000) DEFAULT NULL COMMENT '订单扩展信息7',
  `ORDER_EXT_INFO8` varchar(1000) DEFAULT NULL COMMENT '订单扩展信息8',
  `ORDER_EXT_INFO9` varchar(1000) DEFAULT NULL COMMENT '订单扩展信息9',
  `ORDER_EXT_INFO10` varchar(1000) DEFAULT NULL COMMENT '订单扩展信息10',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFYER` decimal(16,0) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录订单主体信息';

-- ----------------------------
-- Records of tc_order
-- ----------------------------
INSERT INTO `tc_order` VALUES ('100001', 'order_1472018510034', null, '1', 'fresh café', '100002', '1', '100002', '12英寸乳脂蛋糕一个团购', '60.000000', '100001', null, 'skyo', 'letianok@qq.com', null, null, '2016-08-24 14:01:50', null, '2', '2016-08-24 14:01:56', '3', '20.000000', '60.000000', null, null, '1', null, null, null, null, null, null, null, null, null, null, null, null, '1', null, '2016-08-24 14:01:50', null, '2016-08-24 14:01:56');
INSERT INTO `tc_order` VALUES ('100002', 'order_1472029834727', null, '1', 'fresh café', '100002', '1', '100002', '12英寸乳脂蛋糕一个团购', '20.000000', '100001', null, 'skyo', 'letianok@qq.com', null, null, '2016-08-24 17:10:34', null, '2', '2016-08-25 11:15:30', '1', '20.000000', '20.000000', null, null, '2', '100001', null, null, null, null, null, null, null, null, null, null, null, '1', null, '2016-08-24 17:10:34', null, '2016-08-25 11:17:08');
INSERT INTO `tc_order` VALUES ('100003', 'order_1472095540599', null, '1', 'fresh café', '100002', '1', '100002', '12英寸乳脂蛋糕一个团购', '20.000000', '100001', null, 'skyo', 'letianok@qq.com', null, null, '2016-08-25 11:25:40', null, '1', null, '1', '20.000000', null, null, null, '1', null, null, null, null, null, null, null, null, null, null, null, null, '0', null, '2016-08-25 11:25:40', null, '2016-08-25 11:27:05');
INSERT INTO `tc_order` VALUES ('100004', 'order_1472095599728', null, '1', 'fresh café', '100002', '1', '100002', '12英寸乳脂蛋糕一个团购', '1140.000000', '100001', null, 'skyo', 'letianok@qq.com', null, null, '2016-08-25 11:26:39', null, '1', null, '57', '20.000000', null, null, null, '1', null, null, null, null, null, null, null, null, null, null, null, null, '0', null, '2016-08-25 11:26:39', null, '2016-08-25 11:27:05');
INSERT INTO `tc_order` VALUES ('100005', 'order_1472095636179', null, '1', 'fresh café', '100002', '1', '100002', '12英寸乳脂蛋糕一个团购', '20.000000', '100001', null, 'skyo', 'letianok@qq.com', null, null, '2016-08-25 11:27:16', null, '2', '2016-08-25 11:29:26', '1', '20.000000', '20.000000', null, null, '1', null, null, null, null, null, null, null, null, null, null, null, null, '1', null, '2016-08-25 11:27:16', null, '2016-08-25 11:29:26');
INSERT INTO `tc_order` VALUES ('100006', 'order_1472464327709', null, '1', 'fresh café', '100002', '1', '100002', '12英寸乳脂蛋糕一个团购', '40.000000', '100001', null, 'skyo', 'letianok@qq.com', null, null, '2016-08-29 17:52:07', null, '2', '2016-08-29 17:52:15', '2', '20.000000', '40.000000', null, null, '1', null, null, null, null, null, null, null, null, null, null, null, null, '1', null, '2016-08-29 17:52:07', null, '2016-08-29 17:52:15');
INSERT INTO `tc_order` VALUES ('100007', 'order_1473217230213', null, '1', 'fresh café', '100002', '1', '100002', '12英寸乳脂蛋糕一个团购', '40.000000', '100001', null, 'skyo', 'letianok@qq.com', null, null, '2016-09-07 11:00:30', null, '2', '2016-09-07 11:00:37', '2', '20.000000', '40.000000', null, null, '1', null, null, null, null, null, null, null, null, null, null, null, null, '1', null, '2016-09-07 11:00:30', null, '2016-09-07 11:00:37');
INSERT INTO `tc_order` VALUES ('100008', 'order_1473217457847', null, '1', 'fresh café', '100002', '1', '100002', '12英寸乳脂蛋糕一个团购', '20.000000', '100001', null, 'skyo', 'letianok@qq.com', null, null, '2016-09-07 11:04:17', null, '2', '2016-09-07 11:04:31', '1', '20.000000', '20.000000', null, null, '1', null, null, null, null, null, null, null, null, null, null, null, null, '1', null, '2016-09-07 11:04:17', null, '2016-09-07 11:04:31');
INSERT INTO `tc_order` VALUES ('100009', 'order_1473729526557', null, '1', 'fresh café', '100002', '1', '100002', '12英寸乳脂蛋糕一个团购', '40.000000', '100001', null, 'skyo', 'letianok@qq.com', null, null, '2016-09-13 09:18:46', null, '2', '2016-09-13 09:18:48', '2', '20.000000', '40.000000', null, null, '1', null, '100001', null, null, null, null, null, null, null, null, null, null, '1', null, '2016-09-13 09:18:46', null, '2016-09-13 09:18:48');
INSERT INTO `tc_order` VALUES ('100010', 'order_1473729542571', null, '1', 'fresh café', '100002', '1', '100002', '12英寸乳脂蛋糕一个团购', '240.000000', '100001', null, 'skyo', 'letianok@qq.com', null, null, '2016-09-13 09:19:02', null, '2', '2016-09-13 09:19:10', '12', '20.000000', '240.000000', null, null, '1', null, '100001', null, null, null, null, null, null, null, null, null, null, '1', null, '2016-09-13 09:19:02', null, '2016-09-13 09:19:10');

-- ----------------------------
-- Table structure for uc_complaint
-- ----------------------------
DROP TABLE IF EXISTS `uc_complaint`;
CREATE TABLE `uc_complaint` (
  `COMPLAINT_ID` decimal(16,0) NOT NULL COMMENT '用户投诉ID',
  `USER_ID` decimal(16,0) DEFAULT NULL COMMENT '用户ID',
  `MCHT_ID` decimal(16,0) DEFAULT NULL COMMENT '商家ID',
  `ITEM_CODE` decimal(16,0) DEFAULT NULL COMMENT '商品单元编码：新创建商品编码与商品单元ID相同，非新创建商品（由某个已上架商品修改）编码使用其来源商品的编码',
  `ITEM_ID` decimal(16,0) DEFAULT NULL COMMENT '商品单元ID',
  `COMPLAINT_TITLE` varchar(400) DEFAULT NULL COMMENT '投诉主题',
  `COMPLAINT_CONTENT` varchar(2000) DEFAULT NULL COMMENT '投诉意见描述',
  `COMPLAINT_DATE` datetime DEFAULT NULL COMMENT '投诉时间',
  `REPLY_OP_ID` decimal(16,0) DEFAULT NULL COMMENT '回复人',
  `REPLY_CONTENT` varchar(2000) DEFAULT NULL COMMENT '回复内容',
  `REPLY_TIME` datetime DEFAULT NULL COMMENT '回复时间',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFYER` decimal(16,0) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`COMPLAINT_ID`),
  KEY `FK_USR_RLT_CPL` (`USER_ID`),
  CONSTRAINT `FK_USR_RLT_CPL` FOREIGN KEY (`USER_ID`) REFERENCES `uc_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户投诉表';

-- ----------------------------
-- Records of uc_complaint
-- ----------------------------

-- ----------------------------
-- Table structure for uc_consult
-- ----------------------------
DROP TABLE IF EXISTS `uc_consult`;
CREATE TABLE `uc_consult` (
  `CONSULT_ID` decimal(16,0) NOT NULL COMMENT '用户在线咨询ID',
  `USER_ID` decimal(16,0) DEFAULT NULL COMMENT '用户ID',
  `MCHT_ID` decimal(16,0) DEFAULT NULL COMMENT '商家ID',
  `ITEM_CODE` decimal(16,0) DEFAULT NULL COMMENT '商品单元编码：新创建商品编码与商品单元ID相同，非新创建商品（由某个已上架商品修改）编码使用其来源商品的编码',
  `ITEM_ID` decimal(16,0) DEFAULT NULL COMMENT '商品单元ID',
  `CONSULT_TITLE` varchar(400) DEFAULT NULL COMMENT '咨询主题',
  `CONSULT_CONTENT` varchar(2000) DEFAULT NULL COMMENT '咨询问题描述',
  `CONSULT_TIME` datetime DEFAULT NULL COMMENT '咨询时间',
  `REPLY_OP_ID` decimal(16,0) DEFAULT NULL COMMENT '回复人',
  `REPLY_CONTENT` varchar(2000) DEFAULT NULL COMMENT '回复内容',
  `REPLY_TIME` datetime DEFAULT NULL COMMENT '回复时间',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFYER` decimal(16,0) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`CONSULT_ID`),
  KEY `FK_USR_RLT_CST` (`USER_ID`),
  CONSTRAINT `FK_USR_RLT_CST` FOREIGN KEY (`USER_ID`) REFERENCES `uc_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户在线咨询表';

-- ----------------------------
-- Records of uc_consult
-- ----------------------------

-- ----------------------------
-- Table structure for uc_favorite
-- ----------------------------
DROP TABLE IF EXISTS `uc_favorite`;
CREATE TABLE `uc_favorite` (
  `FAVORITE_ID` decimal(16,0) NOT NULL COMMENT '收藏ID',
  `USER_ID` decimal(16,0) DEFAULT NULL COMMENT '用户ID',
  `MCHT_ID` decimal(16,0) DEFAULT NULL COMMENT '商家ID',
  `ITEM_CODE` decimal(16,0) DEFAULT NULL COMMENT '商品单元编码：新创建商品编码与商品单元ID相同，非新创建商品（由某个已上架商品修改）编码使用其来源商品的编码',
  `ITEM_ID` decimal(16,0) DEFAULT NULL COMMENT '商品单元ID',
  `ITEM_TYPE` decimal(6,0) DEFAULT NULL COMMENT '商品单元类型',
  `ITEM_FAV_TIME` datetime DEFAULT NULL COMMENT '商品收藏时间',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`FAVORITE_ID`),
  KEY `FK_USR_RLT_FAV` (`USER_ID`),
  CONSTRAINT `FK_USR_RLT_FAV` FOREIGN KEY (`USER_ID`) REFERENCES `uc_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录用户收藏的商品信息\r\n';

-- ----------------------------
-- Records of uc_favorite
-- ----------------------------
INSERT INTO `uc_favorite` VALUES ('100001', '100001', '1', '100002', '100002', '1', '2016-08-24 15:41:02', '1', '2016-08-24 15:41:02', null);

-- ----------------------------
-- Table structure for uc_feedback
-- ----------------------------
DROP TABLE IF EXISTS `uc_feedback`;
CREATE TABLE `uc_feedback` (
  `FEEDBACK_ID` decimal(16,0) NOT NULL COMMENT '意见反馈ID',
  `USER_ID` decimal(16,0) DEFAULT NULL COMMENT '用户ID',
  `FEEDBACK_CONTENT` varchar(2000) DEFAULT NULL COMMENT '意见反馈内容',
  `CONTACT_TYPE` decimal(2,0) DEFAULT NULL COMMENT '用户联系类型:1-手机 2-邮箱 3-微信 4-qq',
  `CONTACT_ACCOUNT` varchar(80) DEFAULT NULL COMMENT '用户联系方式',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFYER` decimal(16,0) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`FEEDBACK_ID`),
  KEY `FK_USR_RLT_FEED` (`USER_ID`),
  CONSTRAINT `FK_USR_RLT_FEED` FOREIGN KEY (`USER_ID`) REFERENCES `uc_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户意见反馈表';

-- ----------------------------
-- Records of uc_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for uc_login_log
-- ----------------------------
DROP TABLE IF EXISTS `uc_login_log`;
CREATE TABLE `uc_login_log` (
  `LOGIN_LOG_ID` decimal(16,0) NOT NULL COMMENT '登录日志ID',
  `LOGIN_USER_ID` decimal(16,0) DEFAULT NULL COMMENT '登录用户ID',
  `LOGIN_NAME` varchar(80) DEFAULT NULL COMMENT '登录名（用户电子邮箱）',
  `LOGIN_TYPE` decimal(6,0) DEFAULT NULL COMMENT '登录方式：11-客服密码  21-网站密码 22-随机密码  （第三方认证登录）',
  `LOGIN_TIME` datetime DEFAULT NULL COMMENT '登录时间',
  `LOGIN_RSLT` decimal(6,0) DEFAULT NULL COMMENT '登录结果：1-成功 2-失败',
  `LOGIN_FAIL_RSNTYPE` decimal(6,0) DEFAULT NULL COMMENT '登录失败原因类型：1-用户不存在 2-密码错误 3-用户锁定 。。。',
  `LOGOUT_TYPE` decimal(6,0) DEFAULT NULL COMMENT '退出方式：1-主动退出 2-超时退出',
  `LOGOUT_TIME` datetime DEFAULT NULL COMMENT '退出时间',
  `CLIENT_TYPE` decimal(6,0) DEFAULT NULL COMMENT '客户端类型：1-PC 2-手机终端',
  `CLIENT_IP` varchar(100) DEFAULT NULL COMMENT '客户端IP',
  `SERVER_IP` varchar(20) DEFAULT NULL COMMENT '服务器IP',
  `SERVER_PORT` varchar(20) DEFAULT NULL COMMENT '服务器端口号',
  PRIMARY KEY (`LOGIN_LOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录网站用户登录退出的日志信息\r\n\r\n（可按用户ID哈希分表）';

-- ----------------------------
-- Records of uc_login_log
-- ----------------------------
INSERT INTO `uc_login_log` VALUES ('100001', null, '', '21', '2016-08-24 13:07:54', '1', '1', null, null, '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100002', '100001', 'letianok@qq.com', '21', '2016-08-24 13:09:01', '0', null, null, null, '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100003', '100001', 'letianok@qq.com', '21', null, null, null, '1', '2016-08-24 15:48:35', '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100004', '100001', 'letianok@qq.com', '21', '2016-08-24 15:55:14', '0', null, null, null, '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100005', '100001', 'letianok@qq.com', '21', null, null, null, '1', '2016-08-24 16:05:10', '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100006', null, '', '21', '2016-08-24 16:05:35', '1', '1', null, null, '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100007', '100001', 'letianok@qq.com', '21', '2016-08-24 16:06:08', '1', '2', null, null, '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100008', '100001', 'letianok@qq.com', '21', '2016-08-24 17:06:53', '0', null, null, null, '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100009', '100001', 'letianok@qq.com', '21', '2016-08-25 10:14:00', '0', null, null, null, '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100010', '100001', 'letianok@qq.com', '21', '2016-08-25 14:51:34', '1', '2', null, null, '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100011', '100001', 'letianok@qq.com', '21', '2016-08-25 14:51:40', '0', null, null, null, '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100012', '100001', 'letianok@qq.com', '21', '2016-08-26 17:47:39', '0', null, null, null, '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100013', '100001', 'letianok@qq.com', '21', '2016-08-29 17:51:12', '0', null, null, null, '2', '192.168.48.1', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100014', '100001', 'letianok@qq.com', '21', '2016-08-30 08:37:54', '0', null, null, null, '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100015', '100001', 'letianok@qq.com', '21', '2016-08-30 09:37:49', '0', null, null, null, '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100016', '100001', 'letianok@qq.com', '21', '2016-09-03 11:06:31', '0', null, null, null, '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100017', '100001', 'letianok@qq.com', '21', '2016-09-07 10:32:35', '0', null, null, null, '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100018', '100001', 'letianok@qq.com', '21', '2016-09-07 10:46:51', '0', null, null, null, '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100019', '100001', 'letianok@qq.com', '21', null, null, null, '1', '2016-09-07 10:47:54', '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100020', '100002', 'ltzhou@atguigu.com', '21', '2016-09-07 10:48:24', '0', null, null, null, '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100021', '100002', 'ltzhou@atguigu.com', '21', null, null, null, '1', '2016-09-07 10:49:03', '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100022', '100002', 'ltzhou@atguigu.com', '21', '2016-09-07 10:49:19', '0', null, null, null, '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100023', '100002', 'ltzhou@atguigu.com', '21', null, null, null, '1', '2016-09-07 10:49:56', '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100024', '100001', 'letianok@qq.com', '21', '2016-09-07 10:50:14', '0', null, null, null, '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100025', '100001', 'letianok@qq.com', '21', null, null, null, '1', '2016-09-07 10:58:59', '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100026', '100001', 'letianok@qq.com', '21', '2016-09-07 10:59:36', '0', null, null, null, '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100027', '100001', 'letianok@qq.com', '21', null, null, null, '1', '2016-09-07 11:01:31', '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100028', '100001', 'letianok@qq.com', '21', '2016-09-07 11:01:54', '0', null, null, null, '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100029', '100001', 'letianok@qq.com', '21', null, null, null, '1', '2016-09-07 11:10:10', '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100030', '100001', 'letianok@qq.com', '21', '2016-09-07 11:10:10', '0', null, null, null, '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100031', '100001', 'letianok@qq.com', '21', null, null, null, '1', '2016-09-07 11:11:10', '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100032', '100001', 'letianok@qq.com', '21', '2016-09-07 11:11:11', '0', null, null, null, '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100033', '100001', 'letianok@qq.com', '21', null, null, null, '1', '2016-09-07 11:13:07', '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100034', '100001', 'letianok@qq.com', '21', '2016-09-07 11:13:08', '0', null, null, null, '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100035', '100001', 'letianok@qq.com', '21', null, null, null, '1', '2016-09-07 11:13:33', '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100036', '100001', 'letianok@qq.com', '21', '2016-09-07 11:15:45', '0', null, null, null, '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100037', '100001', 'letianok@qq.com', '21', '2016-09-07 11:16:04', '0', null, null, null, '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100038', '100001', 'letianok@qq.com', '21', '2016-09-07 11:51:32', '0', null, null, null, '2', '192.168.11.36', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100039', '100001', 'letianok@qq.com', '21', '2016-09-13 09:08:02', '0', null, null, null, '2', '192.168.10.165', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100040', '100001', 'letianok@qq.com', '21', '2016-09-13 09:47:26', '0', null, null, null, '2', '192.168.10.165', '127.0.0.1', '8082');
INSERT INTO `uc_login_log` VALUES ('100041', '100001', 'letianok@qq.com', '21', '2016-09-18 09:58:02', '0', null, null, null, '2', '192.168.11.94', '127.0.0.1', '8082');

-- ----------------------------
-- Table structure for uc_message
-- ----------------------------
DROP TABLE IF EXISTS `uc_message`;
CREATE TABLE `uc_message` (
  `MESSAGE_ID` decimal(16,0) NOT NULL COMMENT '消息ID',
  `USER_ID` decimal(16,0) DEFAULT NULL COMMENT '用户ID',
  `MESSAGE_TYPE` decimal(2,0) DEFAULT NULL COMMENT '消息类型：1-系统提醒',
  `MESSAGE_CONTENT` varchar(2000) DEFAULT NULL COMMENT '消息内容',
  `MESSAGE_TIME` datetime DEFAULT NULL COMMENT '发送时间',
  `READ_STATE` decimal(2,0) DEFAULT NULL COMMENT '查看状态：1-未查看 2-已查看',
  `READ_TIME` datetime DEFAULT NULL COMMENT '查看时间',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFYER` decimal(16,0) DEFAULT NULL COMMENT '修改人ID',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`MESSAGE_ID`),
  KEY `FK_USR_RLT_MSG` (`USER_ID`),
  CONSTRAINT `FK_USR_RLT_MSG` FOREIGN KEY (`USER_ID`) REFERENCES `uc_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户消息表';

-- ----------------------------
-- Records of uc_message
-- ----------------------------

-- ----------------------------
-- Table structure for uc_rcv_addr
-- ----------------------------
DROP TABLE IF EXISTS `uc_rcv_addr`;
CREATE TABLE `uc_rcv_addr` (
  `RCV_ADDR_ID` decimal(16,0) NOT NULL COMMENT '收货地址ID',
  `USER_ID` decimal(16,0) DEFAULT NULL COMMENT '用户ID',
  `RCVR_NAME` varchar(40) DEFAULT NULL COMMENT '收货人姓名',
  `RCV_PROVINCE_ID` decimal(16,0) DEFAULT NULL COMMENT '收货省ID（对应区域表主键）',
  `RCV_CITY_ID` decimal(16,0) DEFAULT NULL COMMENT '收货地市ID（对应区域表主键）',
  `RCV_COUNTY_ID` decimal(16,0) DEFAULT NULL COMMENT '收货区县ID（对应区域表主键）',
  `RCV_PROVINCE_NAME` varchar(80) DEFAULT NULL COMMENT '收货省名称',
  `RCV_CITY_NAME` varchar(80) DEFAULT NULL COMMENT '收货地市名称',
  `RCV_COUNTY_NAME` varchar(80) DEFAULT NULL COMMENT '收货区县名称',
  `RCV_ADDRESS` varchar(400) DEFAULT NULL COMMENT '收货地址',
  `RCV_POSTCODE` char(6) DEFAULT NULL COMMENT '收货地址邮编',
  `RCVR_PHONE` varchar(40) DEFAULT NULL COMMENT '收货人电话',
  `RCVR_PHONE2` varchar(40) DEFAULT NULL COMMENT '收货人电话2',
  `RCVR_EMAIL` varchar(40) DEFAULT NULL COMMENT '收货人电子邮箱',
  `DFLT_ADDR_FLAG` decimal(2,0) DEFAULT NULL COMMENT '缺省地址标志：0-非缺省 1-缺省',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`RCV_ADDR_ID`),
  KEY `FK_Relationship_67` (`USER_ID`),
  CONSTRAINT `FK_Relationship_67` FOREIGN KEY (`USER_ID`) REFERENCES `uc_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录用户收货地址信息';

-- ----------------------------
-- Records of uc_rcv_addr
-- ----------------------------
INSERT INTO `uc_rcv_addr` VALUES ('100001', '100001', '张三', '2', '19', '22', '甘肃', '白银市', '靖远县', '南京路', '', '18632321122', '', 'letianok@qq.com', null, '1', '2016-09-07 11:19:07', null);

-- ----------------------------
-- Table structure for uc_user
-- ----------------------------
DROP TABLE IF EXISTS `uc_user`;
CREATE TABLE `uc_user` (
  `USER_ID` decimal(16,0) NOT NULL COMMENT '用户ID',
  `USER_TYPE` decimal(6,0) DEFAULT NULL COMMENT '用户类型：1-个人用户',
  `USER_PHONENO` varchar(20) DEFAULT NULL COMMENT '用户手机号',
  `USER_EMAIL` varchar(80) DEFAULT NULL COMMENT '用户电子邮箱',
  `USER_PIC` varchar(400) DEFAULT NULL COMMENT '用户头像',
  `USER_NICKNAME` varchar(80) DEFAULT NULL COMMENT '用户昵称',
  `WX_OPENID` varchar(400) DEFAULT NULL COMMENT '用户微信OPENID',
  `LOGIN_PASSWORD` varchar(40) DEFAULT NULL COMMENT '登录密码（为了区分客服密码，登录密码不能全是数字）',
  `PAY_PASSWORD` varchar(40) DEFAULT NULL COMMENT '支付密码',
  `PAY_NOPWD_FLAG` decimal(2,0) DEFAULT NULL COMMENT '小额免密标识:1-小额免密 0-不小额免密',
  `PAY_NOPWD_NUM` decimal(16,0) DEFAULT NULL COMMENT '小额免密限额',
  `EMAIL_VRF_FLAG` decimal(2,0) DEFAULT NULL COMMENT '邮箱验证标志：0-未验证 1-已验证',
  `PHONENO_VRF_FLAG` decimal(2,0) DEFAULT NULL COMMENT '手机号验证标志：0-未验证 1-已验证 （验证通过的手机号才能作为登录名登录）',
  `USER_REG_DATE` date DEFAULT NULL COMMENT '用户注册日期',
  `LASTEST_LOGIN_TIME` datetime DEFAULT NULL COMMENT '最近登录时间',
  `USER_STATE` decimal(6,0) DEFAULT NULL COMMENT '用户状态：0-停用 1-正常 2-锁定(不能登录) ',
  `USER_STATE_TIME` datetime DEFAULT NULL COMMENT '用户状态时间',
  `USER_UNLOCK_TIME` datetime DEFAULT NULL COMMENT '用户解锁时间（用户状态为锁定时记录自动解锁时间）',
  `USER_STATE_MDF_DESC` varchar(800) DEFAULT NULL COMMENT '用户状态变更说明（锁定或停用时的变更原因）',
  `LOGIN_TRY_TIMES` decimal(8,0) DEFAULT '0' COMMENT '登录尝试次数（成功登录后清零）',
  `MEMBER_LEVEL` decimal(6,0) DEFAULT NULL COMMENT '会员等级',
  `MEMBER_LVL_TIME` datetime DEFAULT NULL COMMENT '会员等级时间（最新等级变化时间）',
  `ORI_MEMBER_LEVEL` decimal(6,0) DEFAULT NULL COMMENT '原会员等级（最新变化前等级）',
  `GENDER` decimal(2,0) DEFAULT NULL COMMENT '性别：1-男 2-女',
  `BIRTHDAY` date DEFAULT NULL COMMENT '生日',
  `LCTN_PROVINCE_ID` decimal(16,0) DEFAULT NULL COMMENT '所在省ID（对应区域表主键）',
  `LCTN_CITY_ID` decimal(16,0) DEFAULT NULL COMMENT '所在地市ID（对应区域表主键）',
  `LCTN_COUNTY_ID` decimal(16,0) DEFAULT NULL COMMENT '所在区县ID（对应区域表主键）',
  `PERMNT_ADDRESS` varchar(400) DEFAULT NULL COMMENT '常住地址',
  `PERMNT_POSTCODE` char(6) DEFAULT NULL COMMENT '常住地邮编',
  `USER_REALNAME` varchar(80) DEFAULT NULL COMMENT '用户真实姓名',
  `CERT_TYPE` decimal(6,0) DEFAULT NULL COMMENT '证件类型：1-身份证 2-军官证 3-护照。。。',
  `CERT_NO` varchar(40) DEFAULT NULL COMMENT '证件号码',
  `USER_REALVRF_FLAG` decimal(2,0) DEFAULT NULL COMMENT '用户实名验证标志：0-未验证 1-已验证',
  `MARRY_STATUS` decimal(2,0) DEFAULT NULL COMMENT '婚姻状况：1-未婚 2-已婚\r\n            对应sys_static_data表code_type=10101',
  `NATIONAL_TYPE` decimal(6,0) DEFAULT NULL COMMENT '民族',
  `EDUCATION_LEVEL` decimal(6,0) DEFAULT NULL COMMENT '教育程度',
  `INDUSTRY_TYPE` decimal(6,0) DEFAULT NULL COMMENT '行业类型',
  `OCCUPATION_TYPE` decimal(6,0) DEFAULT NULL COMMENT '职业类型',
  `MONTH_INCOME_LEVEL` decimal(6,0) DEFAULT NULL COMMENT '月收入水平',
  `QQ_NO` decimal(16,0) DEFAULT NULL COMMENT 'QQ号',
  `MSN_CODE` varchar(40) DEFAULT NULL COMMENT 'MSN编码',
  `MBLPHONE_BRAND` varchar(40) DEFAULT NULL COMMENT '手机品牌',
  `MBLPHONE_MODEL` varchar(40) DEFAULT NULL COMMENT '手机型号',
  `MBLPHONE_OPER` decimal(6,0) DEFAULT NULL COMMENT '手机所属运营商：1-移动 2-联通 3-电信 4-其他',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录网站用户信息\r\n电子邮箱、手机号、昵称都可做登录名，需全局唯一\r\n用电子邮箱、昵称、手机号作为用';

-- ----------------------------
-- Records of uc_user
-- ----------------------------
INSERT INTO `uc_user` VALUES ('100001', null, null, 'letianok@qq.com', '/pomp_app/jpg/20160907/1473218160953qwe.jpg', 'skyo', '', 'E10ADC3949BA59ABBE56E057F20F883E', 'E10ADC3949BA59ABBE56E057F20F883E', '1', '200', '1', '0', '2016-08-24', null, '1', '2016-08-24 13:08:58', null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '2016-08-24 13:08:58', '2016-09-07 11:19:33');
INSERT INTO `uc_user` VALUES ('100002', null, null, 'ltzhou@atguigu.com', null, 'hijoe', '', 'E10ADC3949BA59ABBE56E057F20F883E', null, '0', null, '1', '0', '2016-09-07', null, '1', '2016-09-07 10:43:54', null, null, '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '2016-09-07 10:43:54', null);

-- ----------------------------
-- Table structure for uc_user_friend
-- ----------------------------
DROP TABLE IF EXISTS `uc_user_friend`;
CREATE TABLE `uc_user_friend` (
  `USER_FRIEND_ID` decimal(16,0) NOT NULL COMMENT '用户好友ID',
  `USER_ID` decimal(16,0) DEFAULT NULL COMMENT '用户ID',
  `FRIEND_ID` decimal(16,0) DEFAULT NULL COMMENT '好友ID：要添加的好友ID',
  `ADD_DATE` datetime DEFAULT NULL COMMENT '添加好友时间',
  `ADD_TYPE` decimal(2,0) DEFAULT NULL COMMENT '添加好友方式：1-专属连接 2-直接加平台内好友',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`USER_FRIEND_ID`),
  KEY `FK_USR_RLT_FRD` (`USER_ID`),
  CONSTRAINT `FK_USR_RLT_FRD` FOREIGN KEY (`USER_ID`) REFERENCES `uc_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户好友表';

-- ----------------------------
-- Records of uc_user_friend
-- ----------------------------

-- ----------------------------
-- Table structure for uc_user_friend_log
-- ----------------------------
DROP TABLE IF EXISTS `uc_user_friend_log`;
CREATE TABLE `uc_user_friend_log` (
  `USER_FRIEND_LOG_ID` decimal(16,0) NOT NULL COMMENT '用户好友添加日志表ID',
  `USER_ID` decimal(16,0) DEFAULT NULL COMMENT '用户ID',
  `FRIEND_ID` decimal(16,0) DEFAULT NULL COMMENT '好友ID：要添加的好友ID',
  `ADD_MESSAGE` varchar(400) DEFAULT NULL COMMENT '添加好友验证信息',
  `ADD_DATE` datetime DEFAULT NULL COMMENT '添加好友时间',
  `STATE` decimal(2,0) DEFAULT NULL COMMENT '状态：1-未查看 2-已查看 3-通过 4-拒绝',
  `PASS_DATE` datetime DEFAULT NULL COMMENT '好友通过时间',
  `REFUSE_DATE` datetime DEFAULT NULL COMMENT '好友拒绝时间',
  `REFUSE_REASON` varchar(400) DEFAULT NULL COMMENT '拒绝原因',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建时间',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`USER_FRIEND_LOG_ID`),
  KEY `FK_USR_RLT_FLOG` (`USER_ID`),
  CONSTRAINT `FK_USR_RLT_FLOG` FOREIGN KEY (`USER_ID`) REFERENCES `uc_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户好友表';

-- ----------------------------
-- Records of uc_user_friend_log
-- ----------------------------

-- ----------------------------
-- Table structure for uc_user_log
-- ----------------------------
DROP TABLE IF EXISTS `uc_user_log`;
CREATE TABLE `uc_user_log` (
  `LOG_ID` decimal(16,0) NOT NULL COMMENT '系统日志ID',
  `USER_ID` decimal(16,0) DEFAULT NULL COMMENT '用户ID',
  `LOG_TYPE` decimal(2,0) DEFAULT NULL COMMENT '日志类型：1-业务日志（应用主动记录的业务信息） 2-操作日志（自动记录的点击日志） 3-业务操作日志（合并两种日志类型）',
  `OP_TYPE` decimal(3,0) DEFAULT NULL COMMENT '操作类型：1-查看 2-购买 3-评价 4-退货 5-推荐 6-游戏 7-申请好友 8-同意好友 99-搜索',
  `RSLT_TYPE` decimal(2,0) DEFAULT NULL COMMENT '结果类型：0-成功 1-失败（参数为空等） 2-异常',
  `OPRT_START_TIME` datetime DEFAULT NULL COMMENT '操作开始时间',
  `OPRT_END_TIME` datetime DEFAULT NULL COMMENT '操作结束时间',
  `OPRT_INTERVAL` decimal(12,0) DEFAULT NULL COMMENT '操作时长（毫秒）',
  `OPRT_NAME` varchar(200) DEFAULT NULL COMMENT '操作名称',
  `OPRT_DESC` varchar(2000) DEFAULT NULL COMMENT '操作说明',
  `OPRT_URL` varchar(2000) DEFAULT NULL COMMENT '操作URL',
  `OPRT_PARAM` varchar(2000) DEFAULT NULL COMMENT '操作参数',
  `OPRT_CONTENT` varchar(2000) DEFAULT NULL COMMENT '操作内容（插入修改删除操作的属性值、搜索关键字等）',
  `OPRT_RSLT_DESC` varchar(2000) DEFAULT NULL COMMENT '操作结果描述',
  `SERVER_ADDRESS` varchar(20) DEFAULT NULL COMMENT '服务端IP地址',
  `IP_ADDRESS` varchar(30) DEFAULT NULL COMMENT 'IP地址',
  `SESSION_ID` varchar(200) DEFAULT NULL COMMENT '会话ID',
  `CONNECT_TYPE` decimal(2,0) DEFAULT NULL COMMENT '接入方式：1-WEB接入 2-手机接入',
  `MOBILE_NO` varchar(20) DEFAULT NULL COMMENT '手机号',
  `OP_OBJ_TYPE` decimal(6,0) DEFAULT NULL COMMENT '操作对象类型：1-商品 2-游戏 3-好友',
  `OP_OBJ_ID` decimal(16,0) DEFAULT NULL COMMENT '操作对象ID',
  `EXT_DATE_01` datetime DEFAULT NULL,
  `EXT_DATE_02` datetime DEFAULT NULL,
  `EXT_NUM_01` decimal(18,6) DEFAULT NULL,
  `EXT_NUM_02` decimal(18,6) DEFAULT NULL,
  `EXT_NUM_03` decimal(18,6) DEFAULT NULL,
  `EXT_NUM_04` decimal(18,6) DEFAULT NULL,
  `EXT_STR_01` varchar(40) DEFAULT NULL,
  `EXT_STR_02` varchar(40) DEFAULT NULL,
  `EXT_STR_03` varchar(40) DEFAULT NULL,
  `EXT_STR_04` varchar(40) DEFAULT NULL,
  `EXT_STR_05` varchar(40) DEFAULT NULL,
  `EXT_STR_06` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`LOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户操作日志表';

-- ----------------------------
-- Records of uc_user_log
-- ----------------------------
INSERT INTO `uc_user_log` VALUES ('100001', null, '2', '12', '0', '2016-08-24 13:08:58', '2016-08-24 13:08:58', null, '用户注册 新增用户信息', '用户注册 新增用户信息: 用户id：100001', '/page/user/register/addUserRegisterInfo', null, '100001', null, null, null, null, '1', null, '1', '100001', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100002', '100001', '2', '1', '0', '2016-08-24 13:43:42', '2016-08-24 13:43:42', null, '查询商品详情信息', '查询商品详情信息,商品code：100002', '/page/item/queryItemDetailsInfo', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100003', '100001', '2', '1', '0', '2016-08-24 13:52:47', '2016-08-24 13:52:47', null, '查询商品详情信息', '查询商品详情信息,商品code：100002', '/page/item/queryItemDetailsInfo', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100004', '100001', '2', '13', '0', '2016-08-24 13:53:28', '2016-08-24 13:53:28', null, '用户导入积分', '用户导入了积分：共导入甘肃联通积分100000分', 'http://wx.52xjkp.com:8082/apollo-app-svc/page/order/exchange', null, '甘肃联通积分', null, null, null, null, '1', null, '1', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100005', '100001', '2', '12', '0', '2016-08-24 13:53:57', '2016-08-24 13:53:57', null, '更新用户信息', '更新用户信息,参数json{\"payPassword\":\"E10ADC3949BA59ABBE56E057F20F883E\",\"userId\":100001}', '', null, '100001', null, null, null, null, '1', null, '1', '100001', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100006', '100001', '2', '1', '0', '2016-08-24 13:54:51', '2016-08-24 13:54:51', null, '查询商品详情信息', '查询商品详情信息,商品code：100002', '/page/item/queryItemDetailsInfo', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100007', '100001', '2', '1', '0', '2016-08-24 14:01:45', '2016-08-24 14:01:45', null, '查询商品详情信息', '查询商品详情信息,商品code：100002', '/page/item/queryItemDetailsInfo', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100008', '100001', '2', '1', '0', '2016-08-24 14:01:47', '2016-08-24 14:01:47', null, '根据商品id查询商品信息', '查询商品详情信息,商品id：100002', '/page/order/confirm/orderConfirmPage', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100009', '100001', '2', '1', '0', '2016-08-24 14:01:49', '2016-08-24 14:01:49', null, '根据商品id查询商品信息', '查询商品详情信息,商品id：100002', '/page/order/confirm/orderConfirmPage', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100010', '100001', '2', '2', '0', '2016-08-24 14:01:50', '2016-08-24 14:01:50', null, '根据商品id查询商品信息', '查询商品详情信息,订单id：100001', '/page/order/confirm/confirmOrder', null, '100001', null, null, null, null, '1', null, '1', '100001', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100011', '100001', '2', '1', '0', '2016-08-24 15:40:49', '2016-08-24 15:40:49', null, '用户查看我的收藏', '用户查看了我的收藏页面', 'http://wx.52xjkp.com:8082/apollo-app-svc/page/user/itemfavorite/itemFavorite', null, '我的收藏', null, null, null, null, '1', null, '1', '100001', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100012', '100001', '2', '1', '0', '2016-08-24 15:41:00', '2016-08-24 15:41:00', null, '查询商品详情信息', '查询商品详情信息,商品code：100002', '/page/item/queryItemDetailsInfo', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100013', '100001', '2', '1', '0', '2016-08-24 15:41:08', '2016-08-24 15:41:08', null, '用户查看我的收藏', '用户查看了我的收藏页面', 'http://wx.52xjkp.com:8082/apollo-app-svc/page/user/itemfavorite/itemFavorite', null, '我的收藏', null, null, null, null, '1', null, '1', '100001', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100014', '100001', '2', '1', '0', '2016-08-24 15:41:35', '2016-08-24 15:41:35', null, '用户查看我的收藏', '用户查看了我的收藏页面', 'http://wx.52xjkp.com:8082/apollo-app-svc/page/user/itemfavorite/itemFavorite', null, '我的收藏', null, null, null, null, '1', null, '1', '100001', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100015', '100001', '2', '12', '0', '2016-08-24 15:48:34', '2016-08-24 15:48:34', null, '解绑微信绑定号', '解绑微信绑定号,参数json{\"createTime\":1472015338000,\"dataState\":1,\"emailVrfFlag\":1,\"loginPassword\":\"E10ADC3949BA59ABBE56E057F20F883E\",\"loginTryTimes\":0,\"modifyTime\":1472018037000,\"payNopwdFlag\":0,\"payPassword\":\"E10ADC3949BA59ABBE56E057F20F883E\",\"phonenoVrfFlag\":0,\"userEmail\":\"letianok@qq.com\",\"userId\":100001,\"userNickname\":\"skyo\",\"userRegDate\":1471968000000,\"userState\":1,\"userStateTime\":1472015338000,\"wxOpenid\":\"\"}', '', null, '100001', null, null, null, null, '1', null, '1', '100001', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100016', '100001', '2', '12', '0', '2016-08-24 16:00:03', '2016-08-24 16:00:03', null, '更新用户信息', '更新用户信息,参数json{\"userId\":100001,\"userPic\":\"/pomp_app/jpg/20160824/1472025602279Koala.jpg\"}', '', null, '100001', null, null, null, null, '1', null, '1', '100001', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100017', '100001', '2', '12', '0', '2016-08-24 16:01:06', '2016-08-24 16:01:06', null, '更新用户信息', '更新用户信息,参数json{\"userId\":100001,\"userPic\":\"/pomp_app/jpg/20160824/1472025666580u%3D3283122002%2C1249010101%26fm%3D21%26gp%3D0.jpg\"}', '', null, '100001', null, null, null, null, '1', null, '1', '100001', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100018', '100001', '2', '12', '0', '2016-08-24 16:01:49', '2016-08-24 16:01:49', null, '更新用户信息', '更新用户信息,参数json{\"userId\":100001,\"userPic\":\"/pomp_app/jpg/20160824/1472025709849qwe.jpg\"}', '', null, '100001', null, null, null, null, '1', null, '1', '100001', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100019', '100001', '2', '12', '0', '2016-08-24 16:05:09', '2016-08-24 16:05:09', null, '解绑微信绑定号', '解绑微信绑定号,参数json{\"createTime\":1472015338000,\"dataState\":1,\"emailVrfFlag\":1,\"loginPassword\":\"E10ADC3949BA59ABBE56E057F20F883E\",\"loginTryTimes\":0,\"modifyTime\":1472018037000,\"payNopwdFlag\":0,\"payPassword\":\"E10ADC3949BA59ABBE56E057F20F883E\",\"phonenoVrfFlag\":0,\"userEmail\":\"letianok@qq.com\",\"userId\":100001,\"userNickname\":\"skyo\",\"userRegDate\":1471968000000,\"userState\":1,\"userStateTime\":1472015338000,\"wxOpenid\":\"\"}', '', null, '100001', null, null, null, null, '1', null, '1', '100001', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100020', '100001', '2', '1', '0', '2016-08-24 17:08:38', '2016-08-24 17:08:38', null, '查询商品详情信息', '查询商品详情信息,商品code：100002', '/page/item/queryItemDetailsInfo', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100021', '100001', '2', '1', '0', '2016-08-24 17:10:06', '2016-08-24 17:10:06', null, '查询商品详情信息', '查询商品详情信息,商品code：100002', '/page/item/queryItemDetailsInfo', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100022', '100001', '2', '1', '0', '2016-08-24 17:10:07', '2016-08-24 17:10:07', null, '根据商品id查询商品信息', '查询商品详情信息,商品id：100002', '/page/order/confirm/orderConfirmPage', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100023', '100001', '2', '1', '0', '2016-08-24 17:10:34', '2016-08-24 17:10:34', null, '根据商品id查询商品信息', '查询商品详情信息,商品id：100002', '/page/order/confirm/orderConfirmPage', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100024', '100001', '2', '2', '0', '2016-08-24 17:10:34', '2016-08-24 17:10:34', null, '根据商品id查询商品信息', '查询商品详情信息,订单id：100002', '/page/order/confirm/confirmOrder', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100025', '100001', '2', '1', '0', '2016-08-25 10:31:57', '2016-08-25 10:31:57', null, '查询商品详情信息', '查询商品详情信息,商品code：100002', '/page/item/queryItemDetailsInfo', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100026', '100001', '2', '1', '0', '2016-08-25 10:41:25', '2016-08-25 10:41:25', null, '查询商品详情信息', '查询商品详情信息,商品code：100002', '/page/item/queryItemDetailsInfo', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100027', '100001', '2', '1', '0', '2016-08-25 11:14:59', '2016-08-25 11:14:59', null, '打开评价界面', '打开评价界面,商品编码：100002', '/page/evaluation/evaluationList', null, '打开评价界面,商品编码：100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100028', '100001', '2', '1', '0', '2016-08-25 11:15:01', '2016-08-25 11:15:01', null, '查询评论列表', '查询评论列表,商品编码：100002', '/page/evaluation/evaluationList', null, '查询评论列表,商品编码：100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100029', '100001', '2', '9', '0', '2016-08-25 11:15:30', '2016-08-25 11:15:30', null, '用户支付订单', '用户支付了商品：12英寸乳脂蛋糕一个团购,支付了20.00积分', 'http://wx.52xjkp.com:8082/apollo-app-svc/page/order/orderPay?orderId=100002', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100030', '100001', '2', '1', '0', '2016-08-25 11:16:23', '2016-08-25 11:16:23', null, '用户查看订单', '用户查看了订单：12英寸乳脂蛋糕一个团购', 'http://wx.52xjkp.com:8082/apollo-app-svc/page/order/orderDetail?orderId=100002', null, '我的订单', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100031', '100001', '2', '1', '0', '2016-08-25 11:16:38', '2016-08-25 11:16:38', null, '用户查看订单', '用户查看了订单：12英寸乳脂蛋糕一个团购', 'http://wx.52xjkp.com:8082/apollo-app-svc/page/order/orderDetail?orderId=100002', null, '我的订单', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100032', '100001', '2', '3', '0', '2016-08-25 11:17:08', '2016-08-25 11:17:08', null, '用户评价订单', '用户评价了订单：12英寸乳脂蛋糕一个团购', 'http://wx.52xjkp.com:8082/apollo-app-svc/page/order/evaluationGrade?orderId=100002', null, '我的订单', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100033', '100001', '2', '1', '0', '2016-08-25 11:17:16', '2016-08-25 11:17:16', null, '查询商品详情信息', '查询商品详情信息,商品code：100002', '/page/item/queryItemDetailsInfo', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100034', '100001', '2', '1', '0', '2016-08-25 11:17:41', '2016-08-25 11:17:41', null, '查询商品详情信息', '查询商品详情信息,商品code：100002', '/page/item/queryItemDetailsInfo', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100035', '100001', '2', '1', '0', '2016-08-25 11:17:42', '2016-08-25 11:17:42', null, '打开评价界面', '打开评价界面,商品编码：100002', '/page/evaluation/evaluationList', null, '打开评价界面,商品编码：100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100036', '100001', '2', '1', '0', '2016-08-25 11:17:43', '2016-08-25 11:17:43', null, '查询评论列表', '查询评论列表,商品编码：100002', '/page/evaluation/evaluationList', null, '查询评论列表,商品编码：100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100037', '100001', '2', '1', '0', '2016-08-25 11:22:48', '2016-08-25 11:22:48', null, '根据商品id查询商品信息', '查询商品详情信息,商品id：100002', '/page/order/confirm/orderConfirmPage', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100038', '100001', '2', '1', '0', '2016-08-25 11:25:40', '2016-08-25 11:25:40', null, '根据商品id查询商品信息', '查询商品详情信息,商品id：100002', '/page/order/confirm/orderConfirmPage', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100039', '100001', '2', '2', '0', '2016-08-25 11:25:40', '2016-08-25 11:25:40', null, '根据商品id查询商品信息', '查询商品详情信息,订单id：100003', '/page/order/confirm/confirmOrder', null, '100003', null, null, null, null, '1', null, '1', '100003', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100040', '100001', '2', '1', '0', '2016-08-25 11:26:39', '2016-08-25 11:26:39', null, '根据商品id查询商品信息', '查询商品详情信息,商品id：100002', '/page/order/confirm/orderConfirmPage', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100041', '100001', '2', '2', '0', '2016-08-25 11:26:39', '2016-08-25 11:26:39', null, '根据商品id查询商品信息', '查询商品详情信息,订单id：100004', '/page/order/confirm/confirmOrder', null, '100004', null, null, null, null, '1', null, '1', '100004', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100042', '100001', '2', '1', '0', '2016-08-25 11:27:12', '2016-08-25 11:27:12', null, '查询商品详情信息', '查询商品详情信息,商品code：100002', '/page/item/queryItemDetailsInfo', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100043', '100001', '2', '1', '0', '2016-08-25 11:27:14', '2016-08-25 11:27:14', null, '根据商品id查询商品信息', '查询商品详情信息,商品id：100002', '/page/order/confirm/orderConfirmPage', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100044', '100001', '2', '1', '0', '2016-08-25 11:27:16', '2016-08-25 11:27:16', null, '根据商品id查询商品信息', '查询商品详情信息,商品id：100002', '/page/order/confirm/orderConfirmPage', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100045', '100001', '2', '2', '0', '2016-08-25 11:27:16', '2016-08-25 11:27:16', null, '根据商品id查询商品信息', '查询商品详情信息,订单id：100005', '/page/order/confirm/confirmOrder', null, '100005', null, null, null, null, '1', null, '1', '100005', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100046', '100001', '2', '9', '0', '2016-08-25 11:29:26', '2016-08-25 11:29:26', null, '用户支付订单', '用户支付了商品：12英寸乳脂蛋糕一个团购,支付了20.00积分', 'http://wx.52xjkp.com:8082/apollo-app-svc/page/order/orderPay?orderId=100005', null, '100005', null, null, null, null, '1', null, '1', '100005', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100047', '100001', '2', '12', '0', '2016-08-25 15:33:56', '2016-08-25 15:33:56', null, '更新用户信息', '更新用户信息,参数json{\"payNopwdFlag\":1,\"payNopwdNum\":400,\"userId\":100001}', '', null, '100001', null, null, null, null, '1', null, '1', '100001', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100048', '100001', '2', '12', '0', '2016-08-25 15:34:24', '2016-08-25 15:34:24', null, '更新用户信息', '更新用户信息,参数json{\"payNopwdFlag\":0,\"payNopwdNum\":400,\"userId\":100001}', '', null, '100001', null, null, null, null, '1', null, '1', '100001', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100049', '100001', '2', '1', '0', '2016-08-25 15:37:15', '2016-08-25 15:37:15', null, '用户查看订单', '用户查看了订单：12英寸乳脂蛋糕一个团购', 'http://wx.52xjkp.com:8082/apollo-app-svc/page/order/orderDetail?orderId=100005', null, '我的订单', null, null, null, null, '1', null, '1', '100005', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100050', '100001', '2', '1', '0', '2016-08-25 15:38:27', '2016-08-25 15:38:27', null, '用户查看订单', '用户查看了订单：12英寸乳脂蛋糕一个团购', 'http://wx.52xjkp.com:8082/apollo-app-svc/page/order/orderDetail?orderId=100002', null, '我的订单', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100051', '100001', '2', '1', '0', '2016-08-25 15:39:28', '2016-08-25 15:39:28', null, '用户查看订单', '用户查看了订单：12英寸乳脂蛋糕一个团购', 'http://wx.52xjkp.com:8082/apollo-app-svc/page/order/orderDetail?orderId=100005', null, '我的订单', null, null, null, null, '1', null, '1', '100005', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100052', '100001', '2', '1', '0', '2016-08-25 15:49:34', '2016-08-25 15:49:34', null, '用户查看我的收藏', '用户查看了我的收藏页面', 'http://wx.52xjkp.com:8082/apollo-app-svc/page/user/itemfavorite/itemFavorite', null, '我的收藏', null, null, null, null, '1', null, '1', '100001', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100053', '100001', '2', '1', '0', '2016-08-25 15:49:44', '2016-08-25 15:49:44', null, '查询商品详情信息', '查询商品详情信息,商品code：100002', '/page/item/queryItemDetailsInfo', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100054', '100001', '2', '1', '0', '2016-08-25 15:53:47', '2016-08-25 15:53:47', null, '用户查看订单', '用户查看了订单：12英寸乳脂蛋糕一个团购', 'http://wx.52xjkp.com:8082/apollo-app-svc/page/order/orderDetail?orderId=100005', null, '我的订单', null, null, null, null, '1', null, '1', '100005', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100055', '100001', '2', '1', '0', '2016-08-26 17:51:16', '2016-08-26 17:51:16', null, '查询商品详情信息', '查询商品详情信息,商品code：100002', '/page/item/queryItemDetailsInfo', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100056', '100001', '2', '1', '0', '2016-08-29 17:51:56', '2016-08-29 17:51:56', null, '查询商品详情信息', '查询商品详情信息,商品code：100002', '/page/item/queryItemDetailsInfo', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100057', '100001', '2', '1', '0', '2016-08-29 17:52:04', '2016-08-29 17:52:04', null, '根据商品id查询商品信息', '查询商品详情信息,商品id：100002', '/page/order/confirm/orderConfirmPage', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100058', '100001', '2', '1', '0', '2016-08-29 17:52:07', '2016-08-29 17:52:07', null, '根据商品id查询商品信息', '查询商品详情信息,商品id：100002', '/page/order/confirm/orderConfirmPage', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100059', '100001', '2', '2', '0', '2016-08-29 17:52:07', '2016-08-29 17:52:07', null, '根据商品id查询商品信息', '查询商品详情信息,订单id：100006', '/page/order/confirm/confirmOrder', null, '100006', null, null, null, null, '1', null, '1', '100006', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100060', '100001', '2', '9', '0', '2016-08-29 17:52:15', '2016-08-29 17:52:15', null, '用户支付订单', '用户支付了商品：12英寸乳脂蛋糕一个团购,支付了40.00积分', 'http://wx.52xjkp.com:8082/apollo-app-svc/page/order/orderPay?orderId=100006', null, '100006', null, null, null, null, '1', null, '1', '100006', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100061', '100001', '2', '1', '0', '2016-08-29 17:52:41', '2016-08-29 17:52:41', null, '用户查看我的收藏', '用户查看了我的收藏页面', 'http://wx.52xjkp.com:8082/apollo-app-svc/page/user/itemfavorite/itemFavorite', null, '我的收藏', null, null, null, null, '1', null, '1', '100001', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100062', '100001', '2', '12', '0', '2016-08-30 09:41:06', '2016-08-30 09:41:06', null, '更新用户信息', '更新用户信息,参数json{\"userId\":100001,\"userPic\":\"/pomp_app/jpg/20160830/1472521243329qwe.jpg\"}', '', null, '100001', null, null, null, null, '1', null, '1', '100001', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100063', '100001', '2', '1', '0', '2016-09-07 10:32:58', '2016-09-07 10:32:58', null, '查询商品详情信息', '查询商品详情信息,商品code：100002', '/page/item/queryItemDetailsInfo', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100064', null, '2', '12', '0', '2016-09-07 10:43:54', '2016-09-07 10:43:54', null, '用户注册 新增用户信息', '用户注册 新增用户信息: 用户id：100002', '/page/user/register/addUserRegisterInfo', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100065', '100001', '2', '12', '0', '2016-09-07 10:47:54', '2016-09-07 10:47:54', null, '解绑微信绑定号', '解绑微信绑定号,参数json{\"createTime\":1472015338000,\"dataState\":1,\"emailVrfFlag\":1,\"loginPassword\":\"E10ADC3949BA59ABBE56E057F20F883E\",\"loginTryTimes\":0,\"modifyTime\":1472521266000,\"payNopwdFlag\":0,\"payNopwdNum\":400,\"payPassword\":\"E10ADC3949BA59ABBE56E057F20F883E\",\"phonenoVrfFlag\":0,\"userEmail\":\"letianok@qq.com\",\"userId\":100001,\"userNickname\":\"skyo\",\"userPic\":\"/pomp_app/jpg/20160830/1472521243329qwe.jpg\",\"userRegDate\":1471968000000,\"userState\":1,\"userStateTime\":1472015338000,\"wxOpenid\":\"\"}', '', null, '100001', null, null, null, null, '1', null, '1', '100001', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100066', '100002', '2', '12', '0', '2016-09-07 10:48:50', '2016-09-07 10:48:50', null, '更新用户信息', '更新用户信息,参数json{\"userId\":100002,\"userPic\":\"/pomp_app/jpg/20160907/1473216529191qwe.jpg\"}', '', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100067', '100002', '2', '12', '0', '2016-09-07 10:49:03', '2016-09-07 10:49:03', null, '解绑微信绑定号', '解绑微信绑定号,参数json{\"createTime\":1473216234000,\"dataState\":1,\"emailVrfFlag\":1,\"loginPassword\":\"E10ADC3949BA59ABBE56E057F20F883E\",\"loginTryTimes\":0,\"payNopwdFlag\":0,\"phonenoVrfFlag\":0,\"userEmail\":\"ltzhou@atguigu.com\",\"userId\":100002,\"userNickname\":\"hijoe\",\"userRegDate\":1473177600000,\"userState\":1,\"userStateTime\":1473216234000,\"wxOpenid\":\"\"}', '', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100068', '100002', '2', '12', '0', '2016-09-07 10:49:56', '2016-09-07 10:49:56', null, '解绑微信绑定号', '解绑微信绑定号,参数json{\"createTime\":1473216234000,\"dataState\":1,\"emailVrfFlag\":1,\"loginPassword\":\"E10ADC3949BA59ABBE56E057F20F883E\",\"loginTryTimes\":0,\"payNopwdFlag\":0,\"phonenoVrfFlag\":0,\"userEmail\":\"ltzhou@atguigu.com\",\"userId\":100002,\"userNickname\":\"hijoe\",\"userRegDate\":1473177600000,\"userState\":1,\"userStateTime\":1473216234000,\"wxOpenid\":\"\"}', '', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100069', '100001', '2', '12', '0', '2016-09-07 10:50:38', '2016-09-07 10:50:38', null, '更新用户信息', '更新用户信息,参数json{\"userId\":100001,\"userPic\":\"/pomp_app/jpg/20160907/1473216638689qwe.jpg\"}', '', null, '100001', null, null, null, null, '1', null, '1', '100001', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100070', '100001', '2', '1', '0', '2016-09-07 10:50:46', '2016-09-07 10:50:46', null, '用户查看我的收藏', '用户查看了我的收藏页面', 'http://wx.52xjkp.com:8082/apollo-app-svc/page/user/itemfavorite/itemFavorite', null, '我的收藏', null, null, null, null, '1', null, '1', '100001', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100071', '100001', '2', '1', '0', '2016-09-07 10:51:05', '2016-09-07 10:51:05', null, '用户查看订单', '用户查看了订单：12英寸乳脂蛋糕一个团购', 'http://wx.52xjkp.com:8082/apollo-app-svc/page/order/orderDetail?orderId=100001', null, '我的订单', null, null, null, null, '1', null, '1', '100001', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100072', '100001', '2', '1', '0', '2016-09-07 10:52:37', '2016-09-07 10:52:37', null, '加载游戏页面。查询游戏列表', '加载游戏页面。查询游戏列表,用户id：100001', '/page/game/gamesPage', null, '', null, null, null, null, '1', null, '2', null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100073', '100001', '2', '13', '0', '2016-09-07 10:54:02', '2016-09-07 10:54:02', null, '用户导入积分', '用户导入了积分：共导入联通积分1000分', 'http://wx.52xjkp.com:8082/apollo-app-svc/page/order/exchange', null, '联通积分', null, null, null, null, '1', null, '1', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100074', '100001', '2', '13', '0', '2016-09-07 10:56:44', '2016-09-07 10:56:44', null, '用户导入积分', '用户导入了积分：共导入联通积分1000分', 'http://wx.52xjkp.com:8082/apollo-app-svc/page/order/exchange', null, '联通积分', null, null, null, null, '1', null, '1', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100075', '100001', '2', '13', '0', '2016-09-07 10:57:55', '2016-09-07 10:57:55', null, '用户导入积分', '用户导入了积分：共导入联通积分100分', 'http://wx.52xjkp.com:8082/apollo-app-svc/page/order/exchange', null, '联通积分', null, null, null, null, '1', null, '1', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100076', '100001', '2', '12', '0', '2016-09-07 10:58:58', '2016-09-07 10:58:58', null, '解绑微信绑定号', '解绑微信绑定号,参数json{\"createTime\":1472015338000,\"dataState\":1,\"emailVrfFlag\":1,\"loginPassword\":\"E10ADC3949BA59ABBE56E057F20F883E\",\"loginTryTimes\":0,\"modifyTime\":1472521266000,\"payNopwdFlag\":0,\"payNopwdNum\":400,\"payPassword\":\"E10ADC3949BA59ABBE56E057F20F883E\",\"phonenoVrfFlag\":0,\"userEmail\":\"letianok@qq.com\",\"userId\":100001,\"userNickname\":\"skyo\",\"userPic\":\"/pomp_app/jpg/20160830/1472521243329qwe.jpg\",\"userRegDate\":1471968000000,\"userState\":1,\"userStateTime\":1472015338000,\"wxOpenid\":\"\"}', '', null, '100001', null, null, null, null, '1', null, '1', '100001', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100077', '100001', '2', '1', '0', '2016-09-07 10:59:54', '2016-09-07 10:59:54', null, '查询商品详情信息', '查询商品详情信息,商品code：100002', '/page/item/queryItemDetailsInfo', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100078', '100001', '2', '1', '0', '2016-09-07 11:00:11', '2016-09-07 11:00:11', null, '打开评价界面', '打开评价界面,商品编码：100002', '/page/evaluation/evaluationList', null, '打开评价界面,商品编码：100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100079', '100001', '2', '1', '0', '2016-09-07 11:00:11', '2016-09-07 11:00:11', null, '查询评论列表', '查询评论列表,商品编码：100002', '/page/evaluation/evaluationList', null, '查询评论列表,商品编码：100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100080', '100001', '2', '1', '0', '2016-09-07 11:00:25', '2016-09-07 11:00:25', null, '根据商品id查询商品信息', '查询商品详情信息,商品id：100002', '/page/order/confirm/orderConfirmPage', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100081', '100001', '2', '1', '0', '2016-09-07 11:00:30', '2016-09-07 11:00:30', null, '根据商品id查询商品信息', '查询商品详情信息,商品id：100002', '/page/order/confirm/orderConfirmPage', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100082', '100001', '2', '2', '0', '2016-09-07 11:00:30', '2016-09-07 11:00:30', null, '根据商品id查询商品信息', '查询商品详情信息,订单id：100007', '/page/order/confirm/confirmOrder', null, '100007', null, null, null, null, '1', null, '1', '100007', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100083', '100001', '2', '9', '0', '2016-09-07 11:00:37', '2016-09-07 11:00:37', null, '用户支付订单', '用户支付了商品：12英寸乳脂蛋糕一个团购,支付了40.00积分', 'http://wx.52xjkp.com:8082/apollo-app-svc/page/order/orderPay?orderId=100007', null, '100007', null, null, null, null, '1', null, '1', '100007', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100084', '100001', '2', '1', '0', '2016-09-07 11:00:50', '2016-09-07 11:00:50', null, '用户查看订单', '用户查看了订单：12英寸乳脂蛋糕一个团购', 'http://wx.52xjkp.com:8082/apollo-app-svc/page/order/orderDetail?orderId=100007', null, '我的订单', null, null, null, null, '1', null, '1', '100007', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100085', '100001', '2', '12', '0', '2016-09-07 11:01:31', '2016-09-07 11:01:31', null, '解绑微信绑定号', '解绑微信绑定号,参数json{\"createTime\":1472015338000,\"dataState\":1,\"emailVrfFlag\":1,\"loginPassword\":\"E10ADC3949BA59ABBE56E057F20F883E\",\"loginTryTimes\":0,\"modifyTime\":1472521266000,\"payNopwdFlag\":0,\"payNopwdNum\":400,\"payPassword\":\"E10ADC3949BA59ABBE56E057F20F883E\",\"phonenoVrfFlag\":0,\"userEmail\":\"letianok@qq.com\",\"userId\":100001,\"userNickname\":\"skyo\",\"userPic\":\"/pomp_app/jpg/20160830/1472521243329qwe.jpg\",\"userRegDate\":1471968000000,\"userState\":1,\"userStateTime\":1472015338000,\"wxOpenid\":\"\"}', '', null, '100001', null, null, null, null, '1', null, '1', '100001', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100086', '100001', '2', '1', '0', '2016-09-07 11:02:13', '2016-09-07 11:02:13', null, '查询商品详情信息', '查询商品详情信息,商品code：100002', '/page/item/queryItemDetailsInfo', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100087', '100001', '2', '1', '0', '2016-09-07 11:02:21', '2016-09-07 11:02:21', null, '打开评价界面', '打开评价界面,商品编码：100002', '/page/evaluation/evaluationList', null, '打开评价界面,商品编码：100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100088', '100001', '2', '1', '0', '2016-09-07 11:02:22', '2016-09-07 11:02:22', null, '查询评论列表', '查询评论列表,商品编码：100002', '/page/evaluation/evaluationList', null, '查询评论列表,商品编码：100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100089', '100001', '2', '1', '0', '2016-09-07 11:04:04', '2016-09-07 11:04:04', null, '查询商品详情信息', '查询商品详情信息,商品code：100002', '/page/item/queryItemDetailsInfo', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100090', '100001', '2', '1', '0', '2016-09-07 11:04:09', '2016-09-07 11:04:09', null, '根据商品id查询商品信息', '查询商品详情信息,商品id：100002', '/page/order/confirm/orderConfirmPage', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100091', '100001', '2', '1', '0', '2016-09-07 11:04:17', '2016-09-07 11:04:17', null, '根据商品id查询商品信息', '查询商品详情信息,商品id：100002', '/page/order/confirm/orderConfirmPage', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100092', '100001', '2', '2', '0', '2016-09-07 11:04:17', '2016-09-07 11:04:17', null, '根据商品id查询商品信息', '查询商品详情信息,订单id：100008', '/page/order/confirm/confirmOrder', null, '100008', null, null, null, null, '1', null, '1', '100008', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100093', '100001', '2', '9', '0', '2016-09-07 11:04:31', '2016-09-07 11:04:31', null, '用户支付订单', '用户支付了商品：12英寸乳脂蛋糕一个团购,支付了20.00积分', 'http://wx.52xjkp.com:8082/apollo-app-svc/page/order/orderPay?orderId=100008', null, '100008', null, null, null, null, '1', null, '1', '100008', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100094', '100001', '2', '12', '0', '2016-09-07 11:09:27', '2016-09-07 11:09:27', null, '更新用户信息', '更新用户信息,参数json{\"userId\":100001,\"userPic\":\"/pomp_app/jpg/20160907/1473217766850dcc451da81cb39db02b84ce0d8160924ab18300f.jpg\"}', '', null, '100001', null, null, null, null, '1', null, '1', '100001', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100095', '100001', '2', '12', '0', '2016-09-07 11:10:10', '2016-09-07 11:10:10', null, '解绑微信绑定号', '解绑微信绑定号,参数json{\"createTime\":1472015338000,\"dataState\":1,\"emailVrfFlag\":1,\"loginPassword\":\"E10ADC3949BA59ABBE56E057F20F883E\",\"loginTryTimes\":0,\"modifyTime\":1472521266000,\"payNopwdFlag\":0,\"payNopwdNum\":400,\"payPassword\":\"E10ADC3949BA59ABBE56E057F20F883E\",\"phonenoVrfFlag\":0,\"userEmail\":\"letianok@qq.com\",\"userId\":100001,\"userNickname\":\"skyo\",\"userPic\":\"/pomp_app/jpg/20160830/1472521243329qwe.jpg\",\"userRegDate\":1471968000000,\"userState\":1,\"userStateTime\":1472015338000,\"wxOpenid\":\"\"}', '', null, '100001', null, null, null, null, '1', null, '1', '100001', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100096', '100001', '2', '12', '0', '2016-09-07 11:11:10', '2016-09-07 11:11:10', null, '解绑微信绑定号', '解绑微信绑定号,参数json{\"createTime\":1472015338000,\"dataState\":1,\"emailVrfFlag\":1,\"loginPassword\":\"E10ADC3949BA59ABBE56E057F20F883E\",\"loginTryTimes\":0,\"modifyTime\":1472521266000,\"payNopwdFlag\":0,\"payNopwdNum\":400,\"payPassword\":\"E10ADC3949BA59ABBE56E057F20F883E\",\"phonenoVrfFlag\":0,\"userEmail\":\"letianok@qq.com\",\"userId\":100001,\"userNickname\":\"skyo\",\"userPic\":\"/pomp_app/jpg/20160830/1472521243329qwe.jpg\",\"userRegDate\":1471968000000,\"userState\":1,\"userStateTime\":1472015338000,\"wxOpenid\":\"\"}', '', null, '100001', null, null, null, null, '1', null, '1', '100001', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100097', '100001', '2', '12', '0', '2016-09-07 11:11:57', '2016-09-07 11:11:57', null, '更新用户信息', '更新用户信息,参数json{\"userId\":100001,\"userPic\":\"/pomp_app/jpg/20160907/1473217917637qwe.jpg\"}', '', null, '100001', null, null, null, null, '1', null, '1', '100001', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100098', '100001', '2', '12', '0', '2016-09-07 11:13:07', '2016-09-07 11:13:07', null, '解绑微信绑定号', '解绑微信绑定号,参数json{\"createTime\":1472015338000,\"dataState\":1,\"emailVrfFlag\":1,\"loginPassword\":\"E10ADC3949BA59ABBE56E057F20F883E\",\"loginTryTimes\":0,\"modifyTime\":1472521266000,\"payNopwdFlag\":0,\"payNopwdNum\":400,\"payPassword\":\"E10ADC3949BA59ABBE56E057F20F883E\",\"phonenoVrfFlag\":0,\"userEmail\":\"letianok@qq.com\",\"userId\":100001,\"userNickname\":\"skyo\",\"userPic\":\"/pomp_app/jpg/20160830/1472521243329qwe.jpg\",\"userRegDate\":1471968000000,\"userState\":1,\"userStateTime\":1472015338000,\"wxOpenid\":\"\"}', '', null, '100001', null, null, null, null, '1', null, '1', '100001', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100099', '100001', '2', '12', '0', '2016-09-07 11:13:33', '2016-09-07 11:13:33', null, '解绑微信绑定号', '解绑微信绑定号,参数json{\"createTime\":1472015338000,\"dataState\":1,\"emailVrfFlag\":1,\"loginPassword\":\"E10ADC3949BA59ABBE56E057F20F883E\",\"loginTryTimes\":0,\"modifyTime\":1472521266000,\"payNopwdFlag\":0,\"payNopwdNum\":400,\"payPassword\":\"E10ADC3949BA59ABBE56E057F20F883E\",\"phonenoVrfFlag\":0,\"userEmail\":\"letianok@qq.com\",\"userId\":100001,\"userNickname\":\"skyo\",\"userPic\":\"/pomp_app/jpg/20160830/1472521243329qwe.jpg\",\"userRegDate\":1471968000000,\"userState\":1,\"userStateTime\":1472015338000,\"wxOpenid\":\"\"}', '', null, '100001', null, null, null, null, '1', null, '1', '100001', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100100', '100001', '2', '12', '0', '2016-09-07 11:16:01', '2016-09-07 11:16:01', null, '更新用户信息', '更新用户信息,参数json{\"userId\":100001,\"userPic\":\"/pomp_app/jpg/20160907/1473218160953qwe.jpg\"}', '', null, '100001', null, null, null, null, '1', null, '1', '100001', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100101', '100001', '2', '12', '0', '2016-09-07 11:19:07', '2016-09-07 11:19:07', null, '新增用户的收货地址', '新增用户的收货地址,用户id100001', '/page/user/account/addUserAddr', null, '100001', null, null, null, null, '1', null, '1', '100001', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100102', '100001', '2', '12', '0', '2016-09-07 11:19:33', '2016-09-07 11:19:33', null, '更新用户信息', '更新用户信息,参数json{\"payNopwdFlag\":1,\"payNopwdNum\":200,\"userId\":100001}', '', null, '100001', null, null, null, null, '1', null, '1', '100001', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100103', '100001', '2', '1', '0', '2016-09-07 11:19:50', '2016-09-07 11:19:50', null, '用户查看我的收藏', '用户查看了我的收藏页面', 'http://wx.52xjkp.com:8082/apollo-app-svc/page/user/itemfavorite/itemFavorite', null, '我的收藏', null, null, null, null, '1', null, '1', '100001', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100104', '100001', '2', '4', '0', '2016-09-07 11:51:46', '2016-09-07 11:51:46', null, '用户申请退款', '用户申请了退款：12英寸乳脂蛋糕一个团购', 'http://wx.52xjkp.com:8082/apollo-app-svc/page/order/refund?orderId=100008', null, '我的订单', null, null, null, null, '1', null, '1', '100008', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100105', '100001', '2', '13', '0', '2016-09-13 09:10:09', '2016-09-13 09:10:09', null, '用户导入积分', '用户导入了积分：共导入联通积分1000分', 'http://wx.52xjkp.com:8082/apollo-app-svc/page/order/exchange', null, '联通积分', null, null, null, null, '1', null, '1', '1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100106', '100001', '2', '1', '0', '2016-09-13 09:18:03', '2016-09-13 09:18:03', null, '用户查看我的收藏', '用户查看了我的收藏页面', 'http://wx.52xjkp.com:8082/apollo-app-svc/page/user/itemfavorite/itemFavorite', null, '我的收藏', null, null, null, null, '1', null, '1', '100001', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100107', '100001', '2', '1', '0', '2016-09-13 09:18:41', '2016-09-13 09:18:41', null, '查询商品详情信息', '查询商品详情信息,商品code：100002', '/page/item/queryItemDetailsInfo', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100108', '100001', '2', '1', '0', '2016-09-13 09:18:43', '2016-09-13 09:18:43', null, '根据商品id查询商品信息', '查询商品详情信息,商品id：100002', '/page/order/confirm/orderConfirmPage', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100109', '100001', '2', '1', '0', '2016-09-13 09:18:46', '2016-09-13 09:18:46', null, '根据商品id查询商品信息', '查询商品详情信息,商品id：100002', '/page/order/confirm/orderConfirmPage', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100110', '100001', '2', '2', '0', '2016-09-13 09:18:46', '2016-09-13 09:18:46', null, '根据商品id查询商品信息', '查询商品详情信息,订单id：100009', '/page/order/confirm/confirmOrder', null, '100009', null, null, null, null, '1', null, '1', '100009', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100111', '100001', '2', '9', '0', '2016-09-13 09:18:48', '2016-09-13 09:18:48', null, '用户支付订单', '用户支付了商品：12英寸乳脂蛋糕一个团购,支付了40.00积分', 'http://wx.52xjkp.com:8082/apollo-app-svc/page/order/orderPay?orderId=100009', null, '100009', null, null, null, null, '1', null, '1', '100009', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100112', '100001', '2', '1', '0', '2016-09-13 09:18:56', '2016-09-13 09:18:56', null, '查询商品详情信息', '查询商品详情信息,商品code：100002', '/page/item/queryItemDetailsInfo', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100113', '100001', '2', '1', '0', '2016-09-13 09:18:57', '2016-09-13 09:18:57', null, '根据商品id查询商品信息', '查询商品详情信息,商品id：100002', '/page/order/confirm/orderConfirmPage', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100114', '100001', '2', '1', '0', '2016-09-13 09:19:02', '2016-09-13 09:19:02', null, '根据商品id查询商品信息', '查询商品详情信息,商品id：100002', '/page/order/confirm/orderConfirmPage', null, '100002', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100115', '100001', '2', '2', '0', '2016-09-13 09:19:02', '2016-09-13 09:19:02', null, '根据商品id查询商品信息', '查询商品详情信息,订单id：100010', '/page/order/confirm/confirmOrder', null, '100010', null, null, null, null, '1', null, '1', '100010', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100116', '100001', '2', '9', '0', '2016-09-13 09:19:10', '2016-09-13 09:19:10', null, '用户支付订单', '用户支付了商品：12英寸乳脂蛋糕一个团购,支付了240.00积分', 'http://wx.52xjkp.com:8082/apollo-app-svc/page/order/orderPay?orderId=100010', null, '100010', null, null, null, null, '1', null, '1', '100010', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100117', '100001', '2', '1', '0', '2016-09-13 09:33:07', '2016-09-13 09:33:07', null, '用户查看订单', '用户查看了订单：12英寸乳脂蛋糕一个团购', 'http://wx.52xjkp.com:8082/apollo-app-svc/page/order/orderDetail?orderId=100010', null, '我的订单', null, null, null, null, '1', null, '1', '100010', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `uc_user_log` VALUES ('100118', '100001', '2', '1', '0', '2016-09-13 09:34:56', '2016-09-13 09:34:56', null, '用户查看订单', '用户查看了订单：12英寸乳脂蛋糕一个团购', 'http://wx.52xjkp.com:8082/apollo-app-svc/page/order/orderDetail?orderId=100002', null, '我的订单', null, null, null, null, '1', null, '1', '100002', null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for uc_user_log_his
-- ----------------------------
DROP TABLE IF EXISTS `uc_user_log_his`;
CREATE TABLE `uc_user_log_his` (
  `LOG_ID` decimal(16,0) NOT NULL COMMENT '系统日志ID',
  `USER_ID` decimal(16,0) DEFAULT NULL COMMENT '用户ID',
  `LOG_TYPE` decimal(2,0) DEFAULT NULL COMMENT '日志类型：1-业务日志（应用主动记录的业务信息） 2-操作日志（自动记录的点击日志） 3-业务操作日志（合并两种日志类型）',
  `OP_TYPE` decimal(3,0) DEFAULT NULL COMMENT '操作类型：1-查看 2-购买 3-评价 4-退货 5-推荐 6-游戏 7-申请好友 8-同意好友 99-搜索',
  `RSLT_TYPE` decimal(2,0) DEFAULT NULL COMMENT '结果类型：0-成功 1-失败（参数为空等） 2-异常',
  `OPRT_START_TIME` datetime DEFAULT NULL COMMENT '操作开始时间',
  `OPRT_END_TIME` datetime DEFAULT NULL COMMENT '操作结束时间',
  `OPRT_INTERVAL` decimal(12,0) DEFAULT NULL COMMENT '操作时长（毫秒）',
  `OPRT_NAME` varchar(200) DEFAULT NULL COMMENT '操作名称',
  `OPRT_DESC` varchar(2000) DEFAULT NULL COMMENT '操作说明',
  `OPRT_URL` varchar(2000) DEFAULT NULL COMMENT '操作URL',
  `OPRT_PARAM` varchar(2000) DEFAULT NULL COMMENT '操作参数',
  `OPRT_CONTENT` varchar(2000) DEFAULT NULL COMMENT '操作内容（插入修改删除操作的属性值、搜索关键字等）',
  `OPRT_RSLT_DESC` varchar(2000) DEFAULT NULL COMMENT '操作结果描述',
  `SERVER_ADDRESS` varchar(20) DEFAULT NULL COMMENT '服务端IP地址',
  `IP_ADDRESS` varchar(30) DEFAULT NULL COMMENT 'IP地址',
  `SESSION_ID` varchar(200) DEFAULT NULL COMMENT '会话ID',
  `CONNECT_TYPE` decimal(2,0) DEFAULT NULL COMMENT '接入方式：1-WEB接入 2-手机接入',
  `MOBILE_NO` varchar(20) DEFAULT NULL COMMENT '手机号',
  `OP_OBJ_TYPE` decimal(6,0) DEFAULT NULL COMMENT '操作对象类型：1-商品 2-游戏 3-好友',
  `OP_OBJ_ID` decimal(16,0) DEFAULT NULL COMMENT '操作对象ID',
  `EXT_DATE_01` datetime DEFAULT NULL,
  `EXT_DATE_02` datetime DEFAULT NULL,
  `EXT_NUM_01` decimal(18,6) DEFAULT NULL,
  `EXT_NUM_02` decimal(18,6) DEFAULT NULL,
  `EXT_NUM_03` decimal(18,6) DEFAULT NULL,
  `EXT_NUM_04` decimal(18,6) DEFAULT NULL,
  `EXT_STR_01` varchar(40) DEFAULT NULL,
  `EXT_STR_02` varchar(40) DEFAULT NULL,
  `EXT_STR_03` varchar(40) DEFAULT NULL,
  `EXT_STR_04` varchar(40) DEFAULT NULL,
  `EXT_STR_05` varchar(40) DEFAULT NULL,
  `EXT_STR_06` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`LOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户操作日志历史表';

-- ----------------------------
-- Records of uc_user_log_his
-- ----------------------------

-- ----------------------------
-- Table structure for uc_user_provider_map
-- ----------------------------
DROP TABLE IF EXISTS `uc_user_provider_map`;
CREATE TABLE `uc_user_provider_map` (
  `USER_PROVIDER_MAP_ID` decimal(16,0) NOT NULL COMMENT '用户供应商映射ID',
  `USER_ID` decimal(16,0) DEFAULT NULL COMMENT '用户ID',
  `PROVIDER_ID` decimal(16,0) DEFAULT NULL COMMENT '积分供应商',
  `PROVIDER_POINT_REMAIN` decimal(16,0) DEFAULT NULL,
  `PROVIDER_USER_CODE` varchar(80) DEFAULT NULL COMMENT '用户在供应商平台的用户名',
  `MODIFY_TIME` datetime DEFAULT NULL COMMENT '修改时间',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  PRIMARY KEY (`USER_PROVIDER_MAP_ID`),
  KEY `FK_USR_RLT_PMAP` (`USER_ID`),
  CONSTRAINT `FK_USR_RLT_PMAP` FOREIGN KEY (`USER_ID`) REFERENCES `uc_user` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='记录一个用户在每种提供商的兑换账号及其余额信息。一个用户在同一提供商的同一兑换账户只记录一条，当发生新兑换时只更新修改时';

-- ----------------------------
-- Records of uc_user_provider_map
-- ----------------------------
INSERT INTO `uc_user_provider_map` VALUES ('100004', '100001', '1', '9000', '18622334455', '2016-09-13 09:10:09', '1');

-- ----------------------------
-- Table structure for var_def
-- ----------------------------
DROP TABLE IF EXISTS `var_def`;
CREATE TABLE `var_def` (
  `VAR_ID` decimal(16,0) NOT NULL COMMENT '变量ID',
  `VAR_TYPE` int(11) DEFAULT NULL COMMENT '变量类型:1-系统级 2-活动级 3-策略级',
  `VAR_NAME` varchar(80) DEFAULT NULL COMMENT '变量名称',
  `VAR_CODE` varchar(80) DEFAULT NULL COMMENT '变量编码',
  `VAR_DESC` varchar(400) DEFAULT NULL COMMENT '变量描述',
  `VAR_VALUE` varchar(80) DEFAULT NULL COMMENT '变量值',
  `VAR_DEFAULT_VALUE` varchar(80) DEFAULT NULL COMMENT '变量默认值',
  `VAR_SAMPLE_VALUE` varchar(80) DEFAULT NULL COMMENT '变量示例值',
  `VAR_DATA_TYPE` int(11) DEFAULT NULL COMMENT '变量类型：1-数字 2-字符串 3-日期 4-其它',
  `VAR_ITF_NAME` varchar(80) DEFAULT NULL COMMENT '变量实现接口名',
  `VAR_METHOD` varchar(80) DEFAULT NULL COMMENT '变量实现方法名',
  `CREATOR` decimal(16,0) DEFAULT NULL COMMENT '创建人ID',
  `CREATE_DATE` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `MODIFIER` decimal(12,0) DEFAULT NULL COMMENT '修改人',
  `MODIFY_DATE` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `DATA_STATE` decimal(2,0) DEFAULT '1' COMMENT '数据状态：1-正常 0-删除',
  PRIMARY KEY (`VAR_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='变量表';

-- ----------------------------
-- Records of var_def
-- ----------------------------
INSERT INTO `var_def` VALUES ('1001', '1', '积分转换率', '1001', '小积快跑积分与现金比', '4.23611111111111E-02', null, null, null, null, null, '1', '2016-08-24 11:55:14', null, '2016-08-24 11:55:14', '1');
INSERT INTO `var_def` VALUES ('1002', '1', '运营人员邮箱', '1002', '璐璐通订单运营人员邮箱多个用英文逗号分隔', 'caojp3@asiainfo.com;jiass3@asiainfo.com;wangjing11@asiainfo.com', null, null, null, null, null, null, '2016-08-24 11:55:14', null, '2016-08-24 11:55:14', null);

-- ----------------------------
-- Function structure for currval
-- ----------------------------
DROP FUNCTION IF EXISTS `currval`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `currval`(seq_name VARCHAR(50)) RETURNS int(11)
BEGIN
    DECLARE value INTEGER;
    SET value = 0;
    SELECT current_value INTO value
    FROM sequence
    WHERE name = UPPER(seq_name);
    RETURN value;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for nextval
-- ----------------------------
DROP FUNCTION IF EXISTS `nextval`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `nextval`(seq_name VARCHAR(50)) RETURNS int(11)
BEGIN
    UPDATE sequence SET current_value = current_value + increment
    WHERE name = UPPER(seq_name);
    RETURN currval(seq_name);
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for setval
-- ----------------------------
DROP FUNCTION IF EXISTS `setval`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `setval`(seq_name VARCHAR(50), value INTEGER) RETURNS int(11)
BEGIN
    UPDATE sequence SET current_value = value
    WHERE name = UPPER(seq_name);
    RETURN currval(seq_name);
    END
;;
DELIMITER ;
SET FOREIGN_KEY_CHECKS=1;
