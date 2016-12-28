/**
 * Dazzle日期工具
 * @author qiukq
 * @member lihp
 * @version 2.0 2012-11-23
 */
Dazzle.util.DateUtils = {
	/**
	 * 日期转日期字符串
	 * @scope public
	 * @param date 日期
	 * @param formatType 日期格式
	 * @return 日期字符串
	 */
	date2String : function(date,formatType) {
		var pattern = Dazzle.constant.UtilsEnums["DATE_FORMAT_TYPE_"+formatType];
		var dateStr = new String(pattern);
		//公元
		dateStr = dateStr.replace("G",date.getFullYear()>=0?"AD":"BC");
		//年
		var year = new String(date.getFullYear());
		dateStr = dateStr.replace("yyyy",year);
		dateStr = dateStr.replace("yy",year.substring(year.length-2,year.length));
		//月
		var month = date.getMonth();
		dateStr = dateStr.replace("MMMM",Dazzle.constant.UtilsEnums["MONTH_FULL_NAME_"+month]);
		dateStr = dateStr.replace("MMM",Dazzle.constant.UtilsEnums["MONTH_SHORT_NAME_"+month]);
		dateStr = dateStr.replace("MM",month<9?"0"+(month+1):month+1);
		//日
		var day = date.getDate();
		dateStr = dateStr.replace("dd",day<10?"0"+day:day);
		//上下午
		dateStr = dateStr.replace("a",date.getHours()<12?"AM":"PM");
		//小时
		var hour = date.getHours();
		dateStr = dateStr.replace("HH",hour<10?"0"+hour:hour);
		var khour = hour>11?hour-12:hour;
		dateStr = dateStr.replace("KK",khour<10?"0"+khour:khour);
		//分钟
		var minute = date.getMinutes();
		dateStr = dateStr.replace("mm",minute<10?"0"+minute:minute);
		//秒
		var second = date.getSeconds();
		dateStr = dateStr.replace("ss",second<10?"0"+second:second);
		//毫秒
		var millisecond = date.getMilliseconds();
		//日期
		dateStr = dateStr.replace("SSS",millisecond<10?"00"+millisecond:(millisecond<100?"0"+millisecond:millisecond));
		return dateStr;
	},
	/**
	 * 日期字符串转日期
	 * @scope public
	 * @param dateStr 日期字符串
	 * @param formatType 日期格式
	 * @return 日期
	 */
	string2Date : function(dateStr,formatType) {
		var date = new Date(0);
		var year = 1970;
		var month = 1;
		var day = 1;
		var hour = 0;
		var minute = 0;
		var second = 0;
		var millisecond = 0;
		switch (Dazzle.constant.UtilsEnums["DATE_FORMAT_TYPE_"+formatType]) {
			case "yyyyMMdd" :
				year = parseInt(dateStr.substr(0,4),10);
				month = parseInt(dateStr.substr(4,2),10);
				day = parseInt(dateStr.substr(6,2),10);
				break;
			case "yyyy-MM-dd" :
				year = parseInt(dateStr.substr(0,4),10);
				month = parseInt(dateStr.substr(5,2),10);
				day = parseInt(dateStr.substr(8,2),10);
				break;
			case "HHmmss" :
				hour = parseInt(dateStr.substr(0,2),10);
				minute = parseInt(dateStr.substr(2,2),10);
				second = parseInt(dateStr.substr(4,2),10);
				break;
			case "HH:mm:ss" :
				hour = parseInt(dateStr.substr(0,2),10);
				minute = parseInt(dateStr.substr(3,2),10);
				second = parseInt(dateStr.substr(6,2),10);
				break;
			case "HHmmssSSS" :
				hour = parseInt(dateStr.substr(0,2),10);
				minute = parseInt(dateStr.substr(2,2),10);
				second = parseInt(dateStr.substr(4,2),10);
				millisecond = parseInt(dateStr.substr(6,3),10);
				break;
			case "HH:mm:ss.SSS" :
				hour = parseInt(dateStr.substr(0,2),10);
				minute = parseInt(dateStr.substr(3,2),10);
				second = parseInt(dateStr.substr(6,2),10);
				millisecond = parseInt(dateStr.substr(9,3),10);
				break;
			case "yyyyMMddHHmmss" :
				year = parseInt(dateStr.substr(0,4),10);
				month = parseInt(dateStr.substr(4,2),10);
				day = parseInt(dateStr.substr(6,2),10);
				hour = parseInt(dateStr.substr(8,2),10);
				minute = parseInt(dateStr.substr(10,2),10);
				second = parseInt(dateStr.substr(12,2),10);
				break;
			case "yyyy-MM-dd HH:mm:ss" :
				year = parseInt(dateStr.substr(0,4),10);
				month = parseInt(dateStr.substr(5,2),10);
				day = parseInt(dateStr.substr(8,2),10);
				hour = parseInt(dateStr.substr(11,2),10);
				minute = parseInt(dateStr.substr(14,2),10);
				second = parseInt(dateStr.substr(17,2),10);
				break;
			case "yyyyMMddHHmmssSSS" :
				year = parseInt(dateStr.substr(0,4),10);
				month = parseInt(dateStr.substr(4,2),10);
				day = parseInt(dateStr.substr(6,2),10);
				hour = parseInt(dateStr.substr(8,2),10);
				minute = parseInt(dateStr.substr(10,2),10);
				second = parseInt(dateStr.substr(12,2),10);
				millisecond = parseInt(dateStr.substr(14,3),10);
				break;
			case "yyyy-MM-dd HH:mm:ss.SSS" :
				year = parseInt(dateStr.substr(0,4),10);
				month = parseInt(dateStr.substr(5,2),10);
				day = parseInt(dateStr.substr(8,2),10);
				hour = parseInt(dateStr.substr(11,2),10);
				minute = parseInt(dateStr.substr(14,2),10);
				second = parseInt(dateStr.substr(17,2),10);
				millisecond = parseInt(dateStr.substr(19,3),10);
				break;
		}
		date.setFullYear(year);
		date.setMonth(month - 1);
		date.setDate(day);
		date.setHours(hour);
		date.setMinutes(minute);
		date.setSeconds(second);
		date.setMilliseconds(millisecond);
		return date;
	},
	/**
	 * 偏移日期
	 * @scope public
	 * @param date 日期
	 * @param field 日期位
	 * @param amount 偏移量
	 * @return 偏移后的日期
	 */
	offsetDate : function(date,field,amount) {
		var newDate = new Date(date.getTime());
		switch(field){
			case "year":
			case "y":
				newDate.setFullYear(date.getFullYear()+amount);
				break;
			case "month":
			case "M":
				newDate.setMonth(date.getMonth()+amount);
				break;
			case "day":
			case "d":
				newDate.setDate(date.getDate()+amount);
				break;
			case "hour":
			case "h":
				newDate.setHours(date.getHours()+amount);
				break;
			case "minute":
			case "m":
				newDate.setMinutes(date.getMinutes()+amount);
				break;
			case "second":
			case "s":
				newDate.setSeconds(date.getSeconds()+amount);
				break;
			case "millisecond":
			case "ms":
			case "S":
				newDate.setMilliseconds(date.getMilliseconds()+amount);
				break;
		}
		return newDate;
	},
	/**
	 * 获取两日期差值
	 * @scope public
	 * @param newDate 新日期
	 * @param oldDate 旧日期
	 * @param field 日期位
	 * @return 日期指定位的差值
	 */
	getDateDiff:function(newDate,oldDate,field){
		var yeasDiff = newDate.getFullYear() - oldDate.getFullYear();
		var millisDiff = newDate.getTime() - oldDate.getTime();
		var diff = 0;
		switch(field){
			case "year":
			case "y":
				diff = millisDiff / 31104000000;
				break;
			case "naturalyear":
			case "ny":
				diff = yeasDiff;
				break;
			case "month":
			case "M":
				diff = millisDiff / 2592000000;
				break;
			case "naturalmonth":
			case "nM":
				diff = yeasDiff * 12 - (newDate.getMonth() - oldDate.getMonth());
				break;
			case "day":
			case "d":
				diff = millisDiff / 86400000;
				break;
			case "hour":
			case "h":
				diff = millisDiff / 3600000;
				break;
			case "minute":
			case "m":
				diff = millisDiff / 60000;
				break;
			case "second":
			case "s":
				diff = millisDiff / 1000;
				break;
			case "millisecond":
			case "ms":
			case "S":
				diff = millisDiff;
				break;
		}
		return Math.floor(diff);
	},
	/**
	 * 获取日期为第几日
	 * @scope public
	 * @param date 日期
	 * @param field 日期位
	 * @return 日期顺序
	 */
	getDateOrinal:function(date,field){
		var orinal = 0;
		switch(field){
			case "year":
			case "y":
				var firstDate = new Date(date.getFullYear(),0,1);
				orinal = this.getDateDiff(firstDate,date,"d") + 1;
				break;
			case "month":
			case "M":
				var firstDate = new Date(date.getFullYear(),date.getMonth(),1);
				orinal = this.getDateDiff(firstDate,date,"d") + 1;
				break;
			case "week":
			case "w":
				orinal = date.getDay();
				break;
		}
		return orinal;
	},
	/**
	 * 获取日期有几日
	 * @scope public
	 * @param date 日期
	 * @param field 日期位
	 * @return 日数
	 */
	getDateDays:function(date,field){
		var year = date.getFullYear();
		var num = 0;
		switch(field){
			case "year":
			case "y":
				if ((year % 100 != 0 && year % 4 == 0) || (year % 400 == 0)) {
					num = 366;
				}
				else {
					num = 365;
				}
				break;
			case "month":
			case "M":
				var month = date.getMonth();
				var curMonth = new Date(year,month,1);
				var nextMonth = null;
				if(month != 11){
					nextMonth = new Date(year,month + 1,1);
				}
				else {
					nextMonth = new Date(year + 1,0,1);
				}
				num = this.getDateDiff(nextMonth,curMonth,"d");
				break;
		}
		return num;
	}
};