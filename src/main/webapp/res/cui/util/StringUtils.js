/**
 * Dazzle字符串工具
 * @author qiukq
 * @member lihp
 * @version 2.0 2012-11-28
 */
Dazzle.util.StringUtils ={
	/**
	 * 去除空格
	 * @scope public
	 * @param str 字符串
	 * @param trimType 去除类型
	 * @return 去除空格后的字符串
	 */
	trim:function(str,trimType){
		if(typeof str != "undefined" && str != null){
			if(trimType.indexOf("l") != -1){
				var lSpaceReg = /\s+/g;
				var lSpaceExec = lSpaceReg.exec(str);
				if(RegExp.leftContext.length == 0){
					str = str.substr(RegExp.lastMatch.length);
				}
			}
			if(trimType.indexOf("r") != -1){
				var rSpaceReg = /(\S+\s+)*\S+/g;
				var rSpaceExec = rSpaceReg.exec(str);
				str = str.substr(0,RegExp.lastMatch.length);
			}
			if(trimType.indexOf("m") != -1){
				var mSpaceReg = /\s{2,}/g;
				str = str.replace(mSpaceReg," ");
			}
			return str;
		}
		else {
			return "";
		}
	},
	/**
	 * 驼峰式字符串转下划线式字符串
 	 * scope public
	 * @param str 驼峰式字符串
	 * @return 下划线式字符串
	 */
	camel2Underline:function(str) {
		if(typeof str != "undefined" && str != null){
			var upperReg = /[A-Z]/;
			var underlineStr = "";
			for (var i = 0; i < str.length; i++) {
				var c = str.charAt(i);
				if (upperReg.test(c)){
					underlineStr += ("_" + c);
				}
				else {
					underlineStr += c;
				}
			}
			return underlineStr.toUpperCase();
		}
		else {
			return "";
		}
	},
	/**
	 * 下划线式字符串转驼峰式字符串
 	 * scope public
	 * @param str 下划线式字符串
	 * @return 驼峰式字符串
	 */
	underline2Camel:function(str) {
		if(typeof str != "undefined" && str != null){
			str = str.toLowerCase();
			var words = str.split("_");
			var camelStr = words[0];
			for (var i = 1; i < words.length; i++) {
				camelStr += words[i].substr(0, 1).toUpperCase() + words[i].substr(1, words[i].length - 1);
			}
			return camelStr;
		}
		else{
			return "";
		}
	}
}
