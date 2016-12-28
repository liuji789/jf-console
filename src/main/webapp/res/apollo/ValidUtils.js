/**
 * Dazzle校验工具
 * @author qiukq
 * @version 2.0 2012-11-30
 */
Dazzle.util.ValidUtils ={
	/**
	 * 是否为整数
 	 * scope public
	 * @param obj 待检测对象
	 * @param objName 待检测对象名
	 * @return 校验结果
	 */
	isInt:function(obj,objName) {
		var pattern = new RegExp("^(\\+|-)?\\d+$");
		var result = {
			isPass:pattern.test(obj),
			msg:objName+"应为整数"
		};
		return result;
	},
	/**
	 * 是否为数字
 	 * scope public
	 * @param obj 待检测对象
	 * @param objName 待检测对象名
	 * @return 校验结果
	 */
	isNum:function(obj,objName) {
		var pattern1 = new RegExp("^(\\+|-)?\\d+\\.?\\d*$");
		var pattern2 = new RegExp("^(\\+|-)?\\d*\\.?\\d+$");
		var result = {
			isPass:pattern1.test(obj) || pattern2.test(obj),
			msg:objName+"应为数字（不区分正负，可为小数）"
		};
		return result;
	},
	/**
	 * 是否为布尔
 	 * scope public
	 * @param obj 待检测对象
	 * @param objName 待检测对象名
	 * @return 校验结果
	 */
	isBoolean:function(obj,objName) {
		var result = {
			isPass:RegExp == obj.constructor,
			msg:objName+"应为布尔值"
		};
		return result;
	},
	/**
	 * 是否为字母
 	 * scope public
	 * @param obj 待检测对象
	 * @param objName 待检测对象名
	 * @return 校验结果
	 */
	isLetters:function(obj,objName) {
		var pattern = new RegExp("^[A-z]+$");
		var result = {
			isPass:pattern.test(obj),
			msg:objName+"应由字母组成"
		};
		return result;
	},
	/**
	 * 是否为数组
 	 * scope public
	 * @param obj 待检测对象
	 * @param objName 待检测对象名
	 * @return 校验结果
	 */
	isArray:function(obj,objName) {
		var result = {
			isPass:Object.prototype.toString.call(obj) == "[object Array]",
			msg:objName+"应为数组"
		};
		return result;
	},
	/**
	 * 是否为空
 	 * scope public
	 * @param obj 待检测对象
	 * @param objName 待检测对象名
	 * @return 校验结果
	 */
	isEmpty:function(obj,objName) {
		var result = {
			isPass:typeof obj == "undefined" || obj == null || obj.length == 0,
			msg:objName+"不能为空"
		};
		return result;
	},
	/**
	 * 校验长度
 	 * scope public
	 * @param obj 待检测对象
	 * @param min 最小长度
	 * @param max 最大长度
	 * @param objName 待检测对象名
	 * @return 校验结果
	 */
	isLength:function(obj,min,max,objName) {
		var result = null;
		if(typeof obj == "string"){
			var count = 0;
			for(var i = 0; i < obj.length; i++) {
				var escapeChar = escape(obj.charAt(i));
				if(escapeChar.substring(0,2) == "%u" && escapeChar.length == 6) {
					count += 2;
				}
				else {
					count += 1;
				}
			}
			result = this.isRange(count,min,max,objName);
		}
		else if(this.isArray(obj).isPass){
			result = this.isRange(obj.length,min,max,objName);
		}
		else {
			result = {
				isPass:false,
				msg:objName+"应为字符串或数组"
			};
		}
		return result;
	},
	/**
	 * 校验大小
 	 * scope public
	 * @param obj 待检测对象
	 * @param min 最小值
	 * @param max 最大值
	 * @param objName 待检测对象名
	 * @return 校验结果
	 */
	isRange:function(obj,min,max,objName) {
		var result = this.isNum(obj);
		if(result.isPass){
			var isMoreThanMin = true;
			if(min != null){
				if(obj < min){
					isMoreThanMin = false;
				}
			}
			var isLessThanMax = true;
			if(max != null){
				if(obj > max){
					isLessThanMax = false;
				}
			}
			result = {
				isPass:isMoreThanMin && isLessThanMax,
				msg:objName+"应大于等于"+min+"，小于等于"+max
			};
			return result;
		}
		else {
			return result;
		}
	},
	/**
	 * 校验邮箱地址
 	 * scope public
	 * @param obj 待检测对象
	 * @param objName 待检测对象名
	 * @return 校验结果
	 */
	isEmail:function(obj,objName) {
		var pattern = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/g;
		var result = {
			isPass:pattern.test(obj),
			msg:objName+"的邮箱格式不正确"
		};
		return result;
	},
	/**
	 * 校验身份证号
 	 * scope public
	 * @param obj 待检测对象
	 * @param objName 待检测对象名
	 * @return 校验结果
	 */
	isId:function(obj,objName) {
		var result = {
			isPass:false
		};
		var idLen = obj.length;
		var pattern = null;
		//校验位数及格式
		if(idLen == 15){
			pattern = /^(\d{6})()?(\d{2})(\d{2})(\d{2})(\d{3})$/;
		}
		else if(idLen == 18){
			pattern = /^(\d{6})()?(\d{4})(\d{2})(\d{2})(\d{3})([0-9xX])$/;
		}
		else {
			result.msg = objName+"的身份证位数和格式不正确";
			return result;
		}
		//校验地区
		var area = {11:"北京",12:"天津",13:"河北",14:"山西",15:"内蒙古",21:"辽宁",22:"吉林",23:"黑龙江",31:"上海",32:"江苏",33:"浙江",34:"安徽",35:"福建",36:"江西",37:"山东",41:"河南",42:"湖北",43:"湖南",44:"广东",45:"广西",46:"海南",50:"重庆",51:"四川",52:"贵州",53:"云南",54:"西藏",61:"陕西",62:"甘肃",63:"青海",64:"宁夏",65:"新疆",71:"台湾",81:"香港",82:"澳门",91:"国外"};
		if(area[parseInt(obj.substr(0,2))] == null){
			result.msg = objName+"的身份证地区不正确";
			return result;
		}
		var capture = obj.match(pattern);
		if(capture != null) {
			//校验出生日期
			var birthday = null;
			var isPassBirthday = null;
			if(idLen == 15) {
				birthday = new Date("19" + capture[3] + "/" + capture[4] + "/" + capture[5]);
				isPassBirthday = birthday.getYear() == capture[3] && (birthday.getMonth() + 1) == capture[4] && birthday.getDate() == capture[5];
			}
			else if(idLen == 18) {
				birthday = new Date(capture[3] + "/" + capture[4] + "/" + capture[5]);
				isPassBirthday = birthday.getFullYear() == capture[3] && (birthday.getMonth() + 1) == capture[4] && birthday.getDate() == capture[5];
			}
			if(!isPassBirthday){
				result.msg = objName+"的身份证出生日期不正确";
				return result;
			}
			//校验校验位
			if(idLen == 18){
				var idArr = obj.split("");
				var S =(parseInt(idArr[0]) + parseInt(idArr[10])) * 7
					+(parseInt(idArr[1]) + parseInt(idArr[11])) * 9
					+(parseInt(idArr[2]) + parseInt(idArr[12])) * 10
					+(parseInt(idArr[3]) + parseInt(idArr[13])) * 5
					+(parseInt(idArr[4]) + parseInt(idArr[14])) * 8
					+(parseInt(idArr[5]) + parseInt(idArr[15])) * 4
					+(parseInt(idArr[6]) + parseInt(idArr[16])) * 2
					+ parseInt(idArr[7]) * 1
					+ parseInt(idArr[8]) * 6
					+ parseInt(idArr[9]) * 3;
				var Y = S % 11;
				var JYM = "10X98765432";
				var M = JYM.substr(Y,1);
				if(M == idArr[17]) {
					result.isPass = true;
					return result;
				}
				else {
					result.msg = objName+"的身份证校验位不正确";
					return result;
				}
			}
		}
		else {
			result.msg = objName+"的身份证位数不正确";
			return result;
		}
		result.isPass = true;
		return result;
	},
	/**
	 * 校验手机号
 	 * scope public
	 * @param obj 待检测对象
	 * @param objName 待检测对象名
	 * @return 校验结果
	 */
	isPhone:function(obj,objName) {
		var pattern = new RegExp("^1[0-9]{10}$");
		var result = {
			isPass:pattern.test(obj),
			msg:objName+"的手机号格式不正确"
		};
		return result;
	},
	/**
	 * 校验IP地址
 	 * scope public
	 * @param obj 待检测对象
	 * @param objName 待检测对象名
	 * @return 校验结果
	 */
	isIp:function(obj,objName){
		var pattern = new RegExp("^(25[0-5]|2[0-4]\\d|[0-1]\\d{2}|[1-9]?\\d)\\.(25[0-5]|2[0-4]\\d|[0-1]\\d{2}|[1-9]?\\d)\\.(25[0-5]|2[0-4]\\d|[0-1]\\d{2}|[1-9]?\\d)\\.(25[0-5]|2[0-4]\\d|[0-1]\\d{2}|[1-9]?\\d)$");
		var result = {
			isPass:pattern.test(obj),
			msg:objName+"的IP格式不正确"
		};
		return result;
	}
};
