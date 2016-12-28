/**
//						new Ext.ux.DateField({
//							fieldLabel :'扩展',
//							showRedSatSun:true,
//							showLunarCalendar:true
//						})
 */

/** 农历日期类 */
var lunarInfo = new Array(0x04bd8, 0x04ae0, 0x0a570, 0x054d5, 0x0d260, 0x0d950,
		0x16554, 0x056a0, 0x09ad0, 0x055d2, 0x04ae0, 0x0a5b6, 0x0a4d0, 0x0d250,
		0x1d255, 0x0b540, 0x0d6a0, 0x0ada2, 0x095b0, 0x14977, 0x04970, 0x0a4b0,
		0x0b4b5, 0x06a50, 0x06d40, 0x1ab54, 0x02b60, 0x09570, 0x052f2, 0x04970,
		0x06566, 0x0d4a0, 0x0ea50, 0x06e95, 0x05ad0, 0x02b60, 0x186e3, 0x092e0,
		0x1c8d7, 0x0c950, 0x0d4a0, 0x1d8a6, 0x0b550, 0x056a0, 0x1a5b4, 0x025d0,
		0x092d0, 0x0d2b2, 0x0a950, 0x0b557, 0x06ca0, 0x0b550, 0x15355, 0x04da0,
		0x0a5d0, 0x14573, 0x052d0, 0x0a9a8, 0x0e950, 0x06aa0, 0x0aea6, 0x0ab50,
		0x04b60, 0x0aae4, 0x0a570, 0x05260, 0x0f263, 0x0d950, 0x05b57, 0x056a0,
		0x096d0, 0x04dd5, 0x04ad0, 0x0a4d0, 0x0d4d4, 0x0d250, 0x0d558, 0x0b540,
		0x0b5a0, 0x195a6, 0x095b0, 0x049b0, 0x0a974, 0x0a4b0, 0x0b27a, 0x06a50,
		0x06d40, 0x0af46, 0x0ab60, 0x09570, 0x04af5, 0x04970, 0x064b0, 0x074a3,
		0x0ea50, 0x06b58, 0x055c0, 0x0ab60, 0x096d5, 0x092e0, 0x0c960, 0x0d954,
		0x0d4a0, 0x0da50, 0x07552, 0x056a0, 0x0abb7, 0x025d0, 0x092d0, 0x0cab5,
		0x0a950, 0x0b4a0, 0x0baa4, 0x0ad50, 0x055d9, 0x04ba0, 0x0a5b0, 0x15176,
		0x052b0, 0x0a930, 0x07954, 0x06aa0, 0x0ad50, 0x05b52, 0x04b60, 0x0a6e6,
		0x0a4e0, 0x0d260, 0x0ea65, 0x0d530, 0x05aa0, 0x076a3, 0x096d0, 0x04bd7,
		0x04ad0, 0x0a4d0, 0x1d0b6, 0x0d250, 0x0d520, 0x0dd45, 0x0b5a0, 0x056d0,
		0x055b2, 0x049b0, 0x0a577, 0x0a4b0, 0x0aa50, 0x1b255, 0x06d20, 0x0ada0);

var Animals = new Array("鼠", "牛", "虎", "兔", "龙", "蛇", "马", "羊", "猴", "鸡", "狗",
		"猪");
var Gan = new Array("甲", "乙", "丙", "丁", "戊", "己", "庚", "辛", "壬", "癸");
var Zhi = new Array("子", "丑", "寅", "卯", "辰", "巳", "午", "未", "申", "酉", "戌", "亥");
var now = new Date();

// ==== 传入 offset 传回干支, 0=甲子
function cyclical(num) {
	return (Gan[num % 10] + Zhi[num % 12]);
}

// ==== 传回农历 y年的总天数
function lYearDays(y) {
	var i, sum = 348;
	for (i = 0x8000; i > 0x8; i >>= 1) {
		sum += (lunarInfo[y - 1900] & i) ? 1 : 0;
	}
	return (sum + leapDays(y));
}

// ==== 传回农历 y年闰月的天数
function leapDays(y) {
	if (leapMonth(y)) {
		return ((lunarInfo[y - 1900] & 0x10000) ? 30 : 29);
	} else {
		return (0);
	}
}

// ==== 传回农历 y年闰哪个月 1-12 , 没闰传回 0
function leapMonth(y) {
	return (lunarInfo[y - 1900] & 0xf);
}

// ====================================== 传回农历 y年m月的总天数
function monthDays(y, m) {
	return ((lunarInfo[y - 1900] & (0x10000 >> m)) ? 30 : 29);
}

// ==== 算出农历, 传入日期物件, 传回农历日期物件
// 该物件属性有 .year .month .day .isLeap .yearCyl .dayCyl .monCyl
function Lunar(objDate) {
	var i, leap = 0, temp = 0;
	var baseDate = new Date(1900, 0, 31);
	var offset = (objDate - baseDate) / 86400000;

	this.dayCyl = offset + 40;
	this.monCyl = 14;

	for (i = 1900; i < 2050 && offset > 0; i++) {
		temp = lYearDays(i);
		offset -= temp;
		this.monCyl += 12;
	}
	if (offset < 0) {
		offset += temp;
		i--;
		this.monCyl -= 12;
	}

	this.year = i;
	this.yearCyl = i - 1864;

	leap = leapMonth(i); // 闰哪个月
	this.isLeap = false;

	for (i = 1; i < 13 && offset > 0; i++) {
		// 闰月
		if (leap > 0 && i == (leap + 1) && this.isLeap == false) {
			--i;
			this.isLeap = true;
			temp = leapDays(this.year);
		} else {
			temp = monthDays(this.year, i);
		}

		// 解除闰月
		if (this.isLeap == true && i == (leap + 1)) {
			this.isLeap = false;
		}
		offset -= temp;
		if (this.isLeap == false) {
			this.monCyl++;
		}
	}

	if (offset == 0 && leap > 0 && i == leap + 1) {
		if (this.isLeap) {
			this.isLeap = false;
		} else {
			this.isLeap = true;
			--i;
			--this.monCyl;
		}
	}

	if (offset < 0) {
		offset += temp;
		--i;
		--this.monCyl;
	}

	this.month = i;
	this.day = offset + 1;
}

function YYMMDD() {
	var cl = '<font color="#0000df" STYLE="font-size:9pt;">';
	if (now.getDay() == 0)
		cl = '<font color="#c00000" STYLE="font-size:9pt;">';
	if (now.getDay() == 6)
		cl = '<font color="#00c000" STYLE="font-size:9pt;">';
	return (cl + SY + '年' + (SM + 1) + '月' + SD + '日</font>');
}

function weekday() {
	var day = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
	var cl = '<font color="#ff0000" STYLE="font-size:9pt;">';
	if (now.getDay() == 0)
		cl = '<font color="#c00000" STYLE="font-size:9pt;">';
	if (now.getDay() == 6)
		cl = '<font color="#00c000" STYLE="font-size:9pt;">';
	return (cl + day[now.getDay()] + '</font>');
}

// ==== 中文日期
function cDay(m, d) {
	var nStr1 = new Array('日', '一', '二', '三', '四', '五', '六', '七', '八', '九', '十');
	var nStr2 = new Array('初', '十', '廿', '卅', '　');
	var s;
	if (m > 10) {
		s = '十' + nStr1[m - 10];
	} else {
		s = nStr1[m];
	}
	s += '月';
	switch (d) {
	case 10:
		s += '初十';
		break;
	case 20:
		s += '二十';
		break;
	case 30:
		s += '三十';
		break;
	default:
		s += nStr2[Math.floor(d / 10)];
		s += nStr1[d % 10];
	}
	return (s);
}

// ==== 简化的中文日期
function cDay2(lDObj) {
	var m = lDObj.month;
	var d = lDObj.day;
	var nStr1 = new Array('日', '一', '二', '三', '四', '五', '六', '七', '八', '九', '十');
	var nStr2 = new Array('初', '十', '廿', '卅', '　');
	var s = '';
	if (lDObj.isLeap) {
		s += '闰';
	}
	if (m > 10) {
		s += '十' + nStr1[m - 10];
	} else {
		s += nStr1[m];
	}
	s += '月';
	switch (d) {
	case 10:
		s = '初十';
		break;
	case 20:
		s = '二十';
		break;
	case 30:
		s = '三十';
		break;
	default:
		if (d != 1) {
			s = nStr2[Math.floor(d / 10)];
			s += nStr1[d % 10];
		}
	}
	return (s);
}

function solarDay1(SY, SM, SD) {
	var sDObj = new Date(SY, SM, SD);
	var lDObj = new Lunar(sDObj);
	var cl = '<font color="violet" STYLE="font-size:9pt;">';
	var tt = '【' + Animals[(SY - 4) % 12] + '】' + cyclical(lDObj.monCyl) + '月 '
			+ cyclical(lDObj.dayCyl++) + '日';
	return (cl + tt + '</font>');
}
function solarDay2(year, month, day) {
	var sDObj = new Date(year, month, day);
	var lDObj = new Lunar(sDObj);
	var tt = cyclical(year - 1900 + 36) + '年 ' + cDay(lDObj.month, lDObj.day);
	return tt;
}
function solarDay3(year, month, day) {
	var sDObj = new Date(year, month, day);
	var lDObj = new Lunar(sDObj);
	var sTermInfo = new Array(0, 21208, 42467, 63836, 85337, 107014, 128867,
			150921, 173149, 195551, 218072, 240693, 263343, 285989, 308563,
			331033, 353350, 375494, 397447, 419210, 440795, 462224, 483532,
			504758);
	var solarTerm = new Array("小寒", "大寒", "立春", "雨水", "惊蛰", "春分", "清明", "谷雨",
			"立夏", "小满", "芒种", "夏至", "小暑", "大暑", "立秋", "处暑", "白露", "秋分", "寒露",
			"霜降", "立冬", "小雪", "大雪", "冬至");
	var lFtv = new Array("0101 春节", "0115 元宵节", "0505 端午节", "0707 七夕情人节",
			"0715 中元节", "0815 中秋节", "0909 重阳节", "1208 腊八节", "1224 小年",
			"0100*除夕");
	var sFtv = new Array("0101 元旦", "0214 情人节", "0308 妇女节", "0312 植树节",
			"0315 消费者权益日", "0401 愚人节", "0501 劳动节", "0504 青年节", "0512 护士节",
			"0601 儿童节", "0701 建党节 香港回归纪念", "0801 建军节", "0808 父亲节", "0908 茂生日",
			"0909 毛泽东逝世纪念", "0910 教师节", "0928 孔子诞辰", "1001 国庆节", "1006 老人节",
			"1024 联合国日", "1112 孙中山诞辰", "1220 澳门回归纪念", "1225 圣诞节", "1226 毛泽东诞辰");

	var lDPOS = new Array(3);
	var festival = '', solarTerms = '', solarFestival = '', lunarFestival = '', tmp1, tmp2;
	// 农历节日
	for ( var i = 0; i < lFtv.length; i++) {
		if (lFtv[i] != null && lFtv[i].match(/^(\d{2})(.{2})([\s\*])(.+)$/)) {
			tmp1 = Number(RegExp.$1) - lDObj.month;
			tmp2 = Number(RegExp.$2) - lDObj.day;
			if (tmp1 == 0 && tmp2 == 0) {
				lunarFestival = RegExp.$4;
			}
		}
	}
	// 国历节日
	for ( var i = 0; i < sFtv.length; i++) {
		if (sFtv[i] != null && sFtv[i].match(/^(\d{2})(\d{2})([\s\*])(.+)$/)) {
			tmp1 = Number(RegExp.$1) - (month + 1);
			tmp2 = Number(RegExp.$2) - day;
			if (tmp1 == 0 && tmp2 == 0) {
				solarFestival = RegExp.$4;
			}
		}
	}
	// //节气
	// tmp1 = new Date((31556925974.7 * (year - 1900) + sTermInfo[month * 2 + 1]
	// * 60000) + Date.UTC(1900, 0, 6, 2, 5))
	// tmp2 = tmp1.getUTCDate()
	// if (tmp2 == day) solarTerms = solarTerm[month * 2 + 1]
	// tmp1 = new Date((31556925974.7 * (year - 1900) + sTermInfo[month * 2] *
	// 60000) + Date.UTC(1900, 0, 6, 2, 5))
	// tmp2 = tmp1.getUTCDate()
	// if (tmp2 == day) solarTerms = solarTerm[month * 2]

	// if (solarTerms == '' && solarFestival == '' && lunarFestival == '')
	// festival = '';
	// else
	// festival = solarTerms + ' ' + solarFestival + ' ' + lunarFestival;
	festival = lunarFestival;
	return festival;
}

function ConverDate(date) {
	// 换算为农历
	var lDObj = new Lunar(date);
	// 转换农历显示文字
	var mDay = cDay2(lDObj);

	var da = new Date(date);
	var s = solarDay3(da.getFullYear(), da.getMonth(), da.getDate());
	if (s != '')
		return s;
	return mDay;
	// return mDay;
}

Ext.ux.DatePicker = Ext
		.extend(
				Ext.Component,
				{
					todayText : "今天",
					okText : "确定",
					cancelText : "取消",
					showRedSatSun : false, // 标示星期六、星期天红色
					showLunarCalendar : false, // 是否显示农历
					todayTip : "{0} (Spacebar)",
					minText : "This date is before the minimum date",
					maxText : "This date is after the maximum date",
					format : "m/d/y",
					disabledDaysText : "Disabled",
					disabledDatesText : "Disabled",
					constrainToViewport : true,
					monthNames : Date.monthNames,
					dayNames : Date.dayNames,
					nextText : 'Next Month (Control+Right)',
					prevText : 'Previous Month (Control+Left)',
					monthYearText : 'Choose a month (Control+Up/Down to move years)',
					startDay : 0,
					showToday : true,
					// private
					initComponent : function() {
						Ext.ux.DatePicker.superclass.initComponent.call(this);
						this.value = this.value ? this.value.clearTime()
								: new Date().clearTime();
						this.addEvents('select');
						if (this.handler) {
							this.on("select", this.handler, this.scope || this);
						}
						this.initDisabledDays();
					},

					// private
					initDisabledDays : function() {
						if (!this.disabledDatesRE && this.disabledDates) {
							var dd = this.disabledDates;
							var re = "(?:";
							for ( var i = 0; i < dd.length; i++) {
								re += dd[i];
								if (i != dd.length - 1)
									re += "|";
							}
							this.disabledDatesRE = new RegExp(re + ")");
						}
					},

					setDisabledDates : function(dd) {
						if (Ext.isArray(dd)) {
							this.disabledDates = dd;
							this.disabledDatesRE = null;
						} else {
							this.disabledDatesRE = dd;
						}
						this.initDisabledDays();
						this.update(this.value, true);
					},

					setDisabledDays : function(dd) {
						this.disabledDays = dd;
						this.update(this.value, true);
					},

					setMinDate : function(dt) {
						this.minDate = dt;
						this.update(this.value, true);
					},

					setMaxDate : function(dt) {
						this.maxDate = dt;
						this.update(this.value, true);
					},

					setValue : function(value) {
						var old = this.value;
						this.value = value.clearTime(true);
						if (this.el) {
							this.update(this.value);
						}
					},

					getValue : function() {
						return this.value;
					},

					// private
					focus : function() {
						if (this.el) {
							this.update(this.activeDate);
						}
					},

					// private
					onRender : function(container, position) {
						// 如果显示农历则扩大宽度，
						var middleWidth1 = ''; // 默认为130px
						var middleWidth2 = ''; // 为兼容Google浏览器，默认为175px
						if (this.showLunarCalendar) {
							middleWidth1 = 'style="width:250px"';
							if (Ext.isWebKit)
								middleWidth2 = 'style="width:295px"';
						}
						var m = [
								'<table cellspacing="0">',
								'<tr><td class="x-date-left"><a href="#" title="',
								this.prevText,
								'">&#160;</a></td><td class="x-date-middle" align="center" '
										+ middleWidth1
										+ '></td><td class="x-date-right"><a href="#" title="',
								this.nextText,
								'">&#160;</a></td></tr>',
								'<tr id="date_days"><td colspan="3"><table class="x-date-inner" cellspacing="0" '
										+ middleWidth2 + '><thead><tr>' ];
						var dn = this.dayNames;
						// 标题头
						for ( var i = 0; i < 7; i++) {
							var d = this.startDay + i;
							if (d > 6) {
								d = d - 7;
							}
							m.push("<th><span class='ux-date-top'>", dn[d]
									.substr(0, 1), "</span></th>");
						}
						m[m.length] = "</tr></thead><tbody><tr>";
						for ( var i = 0; i < 42; i++) {
							if (i % 7 == 0 && i != 0) {
								m[m.length] = "</tr><tr>";
							}
							// 将星期六和星期天的颜色换成红色了
							if (this.showRedSatSun
									&& (i % 7 == 0 || (i + 1) % 7 == 0))
								m[m.length] = '<td><a href="#" hidefocus="on" class="x-date-date" tabIndex="1"><em><span style="color:red;"></span></em></a></td>';
							else
								m[m.length] = '<td><a href="#" hidefocus="on" class="x-date-date" tabIndex="1"><em><span></span></em></a></td>';
						}
						m
								.push(
										'</tr></tbody></table></td></tr>',
										this.showToday ? '<tr id="date_bottom"><td colspan="3" class="x-date-bottom" align="center"></td></tr>'
												: '',
										'</table><div class="x-date-mp"></div>');

						var el = document.createElement("div");
						el.className = "x-date-picker";
						el.innerHTML = m.join("");

						container.dom.insertBefore(el, position);

						this.el = Ext.get(el);
						this.eventEl = Ext.get(el.firstChild);

						new Ext.util.ClickRepeater(this.el
								.child("td.x-date-left a"), {
							handler : this.showPrevMonth,
							scope : this,
							preventDefault : true,
							stopDefault : true
						});

						new Ext.util.ClickRepeater(this.el
								.child("td.x-date-right a"), {
							handler : this.showNextMonth,
							scope : this,
							preventDefault : true,
							stopDefault : true
						});

						this.eventEl.on("mousewheel", this.handleMouseWheel,
								this);

						this.monthPicker = this.el.down('div.x-date-mp');
						this.monthPicker.enableDisplayMode('block');

						var kn = new Ext.KeyNav(this.eventEl, {
							"left" : function(e) {
								e.ctrlKey ? this.showPrevMonth() : this
										.update(this.activeDate.add("d", -1));
							},

							"right" : function(e) {
								e.ctrlKey ? this.showNextMonth() : this
										.update(this.activeDate.add("d", 1));
							},

							"up" : function(e) {
								e.ctrlKey ? this.showNextYear() : this
										.update(this.activeDate.add("d", -7));
							},

							"down" : function(e) {
								e.ctrlKey ? this.showPrevYear() : this
										.update(this.activeDate.add("d", 7));
							},

							"pageUp" : function(e) {
								this.showNextMonth();
							},

							"pageDown" : function(e) {
								this.showPrevMonth();
							},

							"enter" : function(e) {
								e.stopPropagation();
								return true;
							},

							scope : this
						});

						this.eventEl.on("click", this.handleDateClick, this, {
							delegate : "a.x-date-date"
						});

						this.el.unselectable();

						this.cells = this.el
								.select("table.x-date-inner tbody td");
						this.textNodes = this.el
								.query("table.x-date-inner tbody span");

						this.mbtn = new Ext.Button({
							text : "&#160;",
							tooltip : this.monthYearText,
							renderTo : this.el.child("td.x-date-middle", true)
						});

						this.mbtn.on('click', this.showMonthPicker, this);
						this.mbtn.el.child(this.mbtn.menuClassTarget).addClass(
								"x-btn-with-menu");

						if (this.showToday) {
							this.todayKeyListener = this.eventEl
									.addKeyListener(Ext.EventObject.SPACE,
											this.selectToday, this);
							var today = (new Date()).dateFormat(this.format);
							this.todayBtn = new Ext.Button({
								renderTo : this.el.child("td.x-date-bottom",
										true),
								text : String.format(this.todayText, today),
								tooltip : String.format(this.todayTip, today),
								handler : this.selectToday,
								scope : this
							});
						}

						if (Ext.isIE) {
							this.el.repaint();
						}

						this.update(this.value);
						// --xuke
						if (this.format.indexOf('d') == -1) {
							this.el.select("table.x-date-inner").hide();
							this.el.child("td.x-date-bottom").hide();
						}
					},

					// private
					createMonthPicker : function() {
						if (!this.monthPicker.dom.firstChild) {
							var buf = [ '<table border="0" cellspacing="0">' ];
							for ( var i = 0; i < 6; i++) {
								buf
										.push(
												'<tr><td class="x-date-mp-month"><a href="#">',
												this.monthNames[i].substr(0, 3),
												'</a></td>',
												'<td class="x-date-mp-month x-date-mp-sep"><a href="#">',
												this.monthNames[i + 6].substr(
														0, 3),
												'</a></td>',
												i == 0 ? '<td class="x-date-mp-ybtn" align="center"><a class="x-date-mp-prev"></a></td><td class="x-date-mp-ybtn" align="center"><a class="x-date-mp-next"></a></td></tr>'
														: '<td class="x-date-mp-year"><a href="#"></a></td><td class="x-date-mp-year"><a href="#"></a></td></tr>');
							}
							buf
									.push(
											'<tr class="x-date-mp-btns"><td colspan="4"><button type="button" class="x-date-mp-ok">',
											this.okText,
											'</button><button type="button" class="x-date-mp-cancel">',
											this.cancelText,
											'</button></td></tr>', '</table>');
							this.monthPicker.update(buf.join(''));
							this.monthPicker.on('click', this.onMonthClick,
									this);
							this.monthPicker.on('dblclick',
									this.onMonthDblClick, this);

							this.mpMonths = this.monthPicker
									.select('td.x-date-mp-month');
							this.mpYears = this.monthPicker
									.select('td.x-date-mp-year');

							this.mpMonths.each(function(m, a, i) {
								i += 1;
								if ((i % 2) == 0) {
									m.dom.xmonth = 5 + Math.round(i * .5);
								} else {
									m.dom.xmonth = Math.round((i - 1) * .5);
								}
							});
						}
					},

					// private
					showMonthPicker : function() {
						this.createMonthPicker();
						var size = this.el.getSize();
						this.monthPicker.setSize(size);
						this.monthPicker.child('table').setSize(size);

						this.mpSelMonth = (this.activeDate || this.value)
								.getMonth();
						this.updateMPMonth(this.mpSelMonth);
						this.mpSelYear = (this.activeDate || this.value)
								.getFullYear();
						this.updateMPYear(this.mpSelYear);

						this.monthPicker.slideIn('t', {
							duration : .2
						});
					},

					// private
					updateMPYear : function(y) {
						this.mpyear = y;
						var ys = this.mpYears.elements;
						for ( var i = 1; i <= 10; i++) {
							var td = ys[i - 1], y2;
							if ((i % 2) == 0) {
								y2 = y + Math.round(i * .5);
								td.firstChild.innerHTML = y2;
								td.xyear = y2;
							} else {
								y2 = y - (5 - Math.round(i * .5));
								td.firstChild.innerHTML = y2;
								td.xyear = y2;
							}
							this.mpYears.item(i - 1)[y2 == this.mpSelYear ? 'addClass'
									: 'removeClass']('x-date-mp-sel');
						}
					},

					// private
					updateMPMonth : function(sm) {
						this.mpMonths.each(function(m, a, i) {
							m[m.dom.xmonth == sm ? 'addClass' : 'removeClass']
									('x-date-mp-sel');
						});
					},

					// private
					selectMPMonth : function(m) {

					},

					// private
					onMonthClick : function(e, t) {
						e.stopEvent();
						var el = new Ext.Element(t), pn;
						if (el.is('button.x-date-mp-cancel')) {
							this.hideMonthPicker();
							// --xuke
							if (this.format.indexOf('d') == -1) {
								this.fireEvent("select", this, this.value);
							}
						} else if (el.is('button.x-date-mp-ok')) {
							var d = new Date(this.mpSelYear, this.mpSelMonth,
									(this.activeDate || this.value).getDate());
							if (d.getMonth() != this.mpSelMonth) {
								// "fix" the JS rolling date conversion if
								// needed
								d = new Date(this.mpSelYear, this.mpSelMonth, 1)
										.getLastDateOfMonth();
							}
							this.update(d);
							this.hideMonthPicker();
							// --xuke
							if (this.format.indexOf('d') == -1) {
								this.setValue(d);
								this.fireEvent("select", this, this.value);
							}
						} else if (pn = el.up('td.x-date-mp-month', 2)) {
							this.mpMonths.removeClass('x-date-mp-sel');
							pn.addClass('x-date-mp-sel');
							this.mpSelMonth = pn.dom.xmonth;
						} else if (pn = el.up('td.x-date-mp-year', 2)) {
							this.mpYears.removeClass('x-date-mp-sel');
							pn.addClass('x-date-mp-sel');
							this.mpSelYear = pn.dom.xyear;
						} else if (el.is('a.x-date-mp-prev')) {
							this.updateMPYear(this.mpyear - 10);
						} else if (el.is('a.x-date-mp-next')) {
							this.updateMPYear(this.mpyear + 10);
						}
					},

					// private
					onMonthDblClick : function(e, t) {
						e.stopEvent();
						var el = new Ext.Element(t), pn;
						if (pn = el.up('td.x-date-mp-month', 2)) {
							this.update(new Date(this.mpSelYear, pn.dom.xmonth,
									(this.activeDate || this.value).getDate()));
							this.hideMonthPicker();
							// --xuke
							if (this.format.indexOf('d') == -1) {
								this.setValue(new Date(this.mpSelYear,
										pn.dom.xmonth,
										(this.activeDate || this.value)
												.getDate()));
								this.fireEvent("select", this, this.value);
							}
						} else if (pn = el.up('td.x-date-mp-year', 2)) {
							this.update(new Date(pn.dom.xyear, this.mpSelMonth,
									(this.activeDate || this.value).getDate()));
							this.hideMonthPicker();
							// --xuke
							if (this.format.indexOf('d') == -1) {
								this.setValue(new Date(pn.dom.xyear,
										this.mpSelMonth,
										(this.activeDate || this.value)
												.getDate()));
								this.fireEvent("select", this, this.value);
							}
						}
					},

					// private
					hideMonthPicker : function(disableAnim) {
						if (this.monthPicker) {
							if (disableAnim === true) {
								this.monthPicker.hide();
							} else {
								this.monthPicker.slideOut('t', {
									duration : .2
								});
							}
						}
					},

					// private
					showPrevMonth : function(e) {
						this.update(this.activeDate.add("mo", -1));
					},

					// private
					showNextMonth : function(e) {
						this.update(this.activeDate.add("mo", 1));
					},

					// private
					showPrevYear : function() {
						this.update(this.activeDate.add("y", -1));
					},

					// private
					showNextYear : function() {
						this.update(this.activeDate.add("y", 1));
					},

					// private
					handleMouseWheel : function(e) {
						var delta = e.getWheelDelta();
						if (delta > 0) {
							this.showPrevMonth();
							e.stopEvent();
						} else if (delta < 0) {
							this.showNextMonth();
							e.stopEvent();
						}
					},

					// private
					handleDateClick : function(e, t) {
						e.stopEvent();
						if (t.dateValue
								&& !Ext.fly(t.parentNode).hasClass(
										"x-date-disabled")) {
							this.setValue(new Date(t.dateValue));
							this.fireEvent("select", this, this.value);
						}
					},

					// private
					selectToday : function() {
						if (this.todayBtn && !this.todayBtn.disabled) {
							this.setValue(new Date().clearTime());
							this.fireEvent("select", this, this.value);
						}
					},

					// private
					update : function(date, forceRefresh) {
						var vd = this.activeDate;
						this.activeDate = date;
						if (!forceRefresh && vd && this.el) {
							var t = date.getTime();
							if (vd.getMonth() == date.getMonth()
									&& vd.getFullYear() == date.getFullYear()) {
								this.cells.removeClass("x-date-selected");
								this.cells.each(function(c) {
									if (c.dom.firstChild.dateValue == t) {
										c.addClass("x-date-selected");
										setTimeout(function() {
											try {
												c.dom.firstChild.focus();
											} catch (e) {
											}
										}, 50);
										return false;
									}
								});
								return;
							}
						}

						// 获取日期当前 月份天数
						var days = date.getDaysInMonth();

						// 获取当前日期月份第一天的日期对象
						var firstOfMonth = date.getFirstDateOfMonth();

						// 获取当前时间是周几
						var startingPos = firstOfMonth.getDay() - this.startDay;

						if (startingPos <= this.startDay) {
							startingPos += 7;
						}

						// 月份减1
						var pm = date.add("mo", -1);

						// 上月天数减去 周几
						var prevStart = pm.getDaysInMonth() - startingPos;

						// 定义个新对象
						var cells = this.cells.elements;

						var textEls = this.textNodes;

						// 加上上个月的天数
						days += startingPos;

						// convert everything to numbers so it's fast
						var day = 86400000;
						// 上月 显示最后一天
						var d = (new Date(pm.getFullYear(), pm.getMonth(),
								prevStart)).clearTime();
						// 今天
						var today = new Date().clearTime().getTime();
						// 传过来日期
						var sel = date.clearTime().getTime();
						var min = this.minDate ? this.minDate.clearTime()
								: Number.NEGATIVE_INFINITY;
						var max = this.maxDate ? this.maxDate.clearTime()
								: Number.POSITIVE_INFINITY;
						var ddMatch = this.disabledDatesRE;
						var ddText = this.disabledDatesText;
						var ddays = this.disabledDays ? this.disabledDays
								.join("") : false;
						var ddaysText = this.disabledDaysText;
						var format = this.format;

						if (this.showToday) {
							var td = new Date().clearTime();
							var disable = (td < min
									|| td > max
									|| (ddMatch && format && ddMatch.test(td
											.dateFormat(format))) || (ddays && ddays
									.indexOf(td.getDay()) != -1));

							this.todayBtn.setDisabled(disable);
							this.todayKeyListener[disable ? 'disable'
									: 'enable']();
						}

						var setCellClass = function(cal, cell) {
							cell.title = "";
							var t = d.getTime();
							cell.firstChild.dateValue = t;
							if (t == today) {
								cell.className += " x-date-today";
								cell.title = cal.todayText;
							}
							if (t == sel) {
								cell.className += " x-date-selected";
								setTimeout(function() {
									try {
										cell.firstChild.focus();
									} catch (e) {
									}
								}, 50);
							}
							// disabling
							if (t < min) {
								cell.className = " x-date-disabled";
								cell.title = cal.minText;
								return;
							}
							if (t > max) {
								cell.className = " x-date-disabled";
								cell.title = cal.maxText;
								return;
							}
							if (ddays) {
								if (ddays.indexOf(d.getDay()) != -1) {
									cell.title = ddaysText;
									cell.className = " x-date-disabled";
								}
							}
							if (ddMatch && format) {
								var fvalue = d.dateFormat(format);
								if (ddMatch.test(fvalue)) {
									cell.title = ddText.replace("%0", fvalue);
									cell.className = " x-date-disabled";
								}
							}
						};

						var i = 0;
						// 周几

						// 上个月的日期
						for (; i < startingPos; i++) {
							textEls[i].innerHTML = (++prevStart);
							if (this.showLunarCalendar)
								textEls[i].innerHTML = textEls[i].innerHTML
										+ '<br/>' + ConverDate(d);
							d.setDate(d.getDate() + 1);
							cells[i].className = "x-date-prevday";
							setCellClass(this, cells[i]);
						}
						// 下个月
						for (; i < days; i++) {
							var intDay = i - startingPos + 1;
							if (this.showLunarCalendar)
								textEls[i].innerHTML = (intDay + '<br/>' + ConverDate(d));
							else
								textEls[i].innerHTML = (intDay);
							d.setDate(d.getDate() + 1);
							cells[i].className = 'x-date-active';
							setCellClass(this, cells[i]);
						}
						var extraDays = 0;
						// 当前月份
						for (; i < 42; i++) {
							if (this.showLunarCalendar)
								textEls[i].innerHTML = ((++extraDays) + '<br/>' + ConverDate(d));
							else
								textEls[i].innerHTML = (++extraDays);
							d.setDate(d.getDate() + 1);
							cells[i].className = 'x-date-nextday';
							setCellClass(this, cells[i]);
						}
						// xuke
						if (this.format.indexOf('d') == -1
								&& this.getValue() != date) {
							this.input.setValue(date);
							// this.input.fireEvent("select", date, this.input);
							this.input.fireEvent("select", this, this.value);
						}

						this.mbtn.setText(this.monthNames[date.getMonth()]
								+ " " + date.getFullYear());

						if (!this.internalRender) {
							var main = this.el.dom.firstChild;
							var w = main.offsetWidth;
							this.el.setWidth(w + this.el.getBorderWidth("lr"));
							Ext.fly(main).setWidth(w);
							this.internalRender = true;
							// opera does not respect the auto grow header
							// center column
							// then, after it gets a width opera refuses to
							// recalculate
							// without a second pass
							if (Ext.isOpera && !this.secondPass) {
								main.rows[0].cells[1].style.width = (w - (main.rows[0].cells[0].offsetWidth + main.rows[0].cells[2].offsetWidth))
										+ "px";
								this.secondPass = true;
								this.update.defer(10, this, [ date ]);
							}
						}
					},
					beforeDestroy : function() {
						if (this.rendered) {
							Ext.destroy(this.mbtn, this.todayBtn);
						}
					}
				});
/*-------------------------------------------------------------------------*/
Ext.ux.DateMenu = Ext.extend(Ext.menu.Menu, {
	enableScrolling : false,
	hideOnClick : true,
	pickerId : null,
	cls : 'x-date-menu',
	initComponent : function() {
		this.on('beforeshow', this.onBeforeShow, this);
		if (this.strict = (Ext.isIE7 && Ext.isStrict)) {
			this.on('show', this.onShow, this, {
				single : true,
				delay : 20
			});
		}
		Ext.apply(this, {
			plain : true,
			showSeparator : false,
			items : this.picker = new Ext.ux.DatePicker(Ext.applyIf({
				internalRender : this.strict || !Ext.isIE,
				ctCls : 'x-menu-date-item',
				id : this.pickerId
			}, this.initialConfig))
		});
		this.picker.purgeListeners();
		Ext.ux.DateMenu.superclass.initComponent.call(this);
		this.relayEvents(this.picker, [ 'select' ]);
		this.on('show', this.picker.focus, this.picker);
		this.on('select', this.menuHide, this);
		if (this.handler) {
			this.on('select', this.handler, this.scope || this);
		}
	},

	menuHide : function() {
		if (this.hideOnClick) {
			this.hide(true);
		}
	},

	onBeforeShow : function() {
		if (this.picker) {
			this.picker.hideMonthPicker(true);
		}
	},

	onShow : function() {
		var el = this.picker.getEl();
		el.setWidth(el.getWidth()); // nasty hack for IE7 strict mode
	}
});

// *****************************************************************************
Ext.ux.DateField = Ext
		.extend(
				Ext.form.TriggerField,
				{
					format : "m/d/Y",
					altFormats : "m/d/Y|n/j/Y|n/j/y|m/j/y|n/d/y|m/j/Y|n/d/Y|m-d-y|m-d-Y|m/d|m-d|md|mdy|mdY|d|Y-m-d",
					disabledDaysText : "Disabled",
					disabledDatesText : "Disabled",
					showRedSatSun : false, // 标示星期六、星期天红色
					showLunarCalendar : false, // 是否显示农历
					minText : "The date in this field must be equal to or after {0}",
					maxText : "The date in this field must be equal to or before {0}",
					invalidText : "{0} is not a valid date - it must be in the format {1}",
					triggerClass : 'x-form-date-trigger',
					showToday : true,
					// private
					defaultAutoCreate : {
						tag : "input",
						type : "text",
						size : "10",
						autocomplete : "off"
					},
					initComponent : function() {
						Ext.ux.DateField.superclass.initComponent.call(this);
						if (typeof this.minValue == "string") {
							this.minValue = this.parseDate(this.minValue);
						}
						if (typeof this.maxValue == "string") {
							this.maxValue = this.parseDate(this.maxValue);
						}
						this.ddMatch = null;
						this.initDisabledDays();
					},
					// private
					initDisabledDays : function() {
						if (this.disabledDates) {
							var dd = this.disabledDates;
							var re = "(?:";
							for ( var i = 0; i < dd.length; i++) {
								re += dd[i];
								if (i != dd.length - 1)
									re += "|";
							}
							this.disabledDatesRE = new RegExp(re + ")");
						}
					},
					setDisabledDates : function(dd) {
						this.disabledDates = dd;
						this.initDisabledDays();
						if (this.menu) {
							this.menu.picker
									.setDisabledDates(this.disabledDatesRE);
						}
					},
					setDisabledDays : function(dd) {
						this.disabledDays = dd;
						if (this.menu) {
							this.menu.picker.setDisabledDays(dd);
						}
					},
					setMinValue : function(dt) {
						this.minValue = (typeof dt == "string" ? this
								.parseDate(dt) : dt);
						if (this.menu) {
							this.menu.picker.setMinDate(this.minValue);
						}
					},
					setMaxValue : function(dt) {
						this.maxValue = (typeof dt == "string" ? this
								.parseDate(dt) : dt);
						if (this.menu) {
							this.menu.picker.setMaxDate(this.maxValue);
						}
					},
					// private
					validateValue : function(value) {
						value = this.formatDate(value);
						if (!Ext.ux.DateField.superclass.validateValue.call(
								this, value)) {
							return false;
						}
						if (value.length < 1) { // if it's blank and textfield
							// didn't flag it
							// then it's valid
							return true;
						}
						var svalue = value;
						value = this.parseDate(value);
						if (!value) {
							this.markInvalid(String.format(this.invalidText,
									svalue, this.format));
							return false;
						}
						var time = value.getTime();
						if (this.minValue && time < this.minValue.getTime()) {
							this.markInvalid(String.format(this.minText, this
									.formatDate(this.minValue)));
							return false;
						}
						if (this.maxValue && time > this.maxValue.getTime()) {
							this.markInvalid(String.format(this.maxText, this
									.formatDate(this.maxValue)));
							return false;
						}
						if (this.disabledDays) {
							var day = value.getDay();
							for ( var i = 0; i < this.disabledDays.length; i++) {
								if (day === this.disabledDays[i]) {
									this.markInvalid(this.disabledDaysText);
									return false;
								}
							}
						}
						var fvalue = this.formatDate(value);
						if (this.ddMatch && this.ddMatch.test(fvalue)) {
							this.markInvalid(String.format(
									this.disabledDatesText, fvalue));
							return false;
						}
						return true;
					},

					// private
					// Provides logic to override the default
					// TriggerField.validateBlur which
					// just returns true
					validateBlur : function() {
						return !this.menu || !this.menu.isVisible();
					},

					getValue : function() {
						return this.parseDate(Ext.ux.DateField.superclass.getValue.call(this))|| "";
					},

					setValue : function(date) {
						Ext.ux.DateField.superclass.setValue.call(this, this
								.formatDate(this.parseDate(date)));
					},

					// private
					parseDate : function(value) {
						if (!value || Ext.isDate(value)) {
							return value;
						}
						var v = Date.parseDate(value, this.format);
						if (!v && this.altFormats) {
							if (!this.altFormatsArray) {
								this.altFormatsArray = this.altFormats
										.split("|");
							}
							for ( var i = 0, len = this.altFormatsArray.length; i < len
									&& !v; i++) {
								v = Date.parseDate(value,
										this.altFormatsArray[i]);
							}
						}
						return v;
					},

					// private
					onDestroy : function() {
						if (this.menu) {
							this.menu.destroy();
						}
						if (this.wrap) {
							this.wrap.remove();
						}
						Ext.ux.DateField.superclass.onDestroy.call(this);
					},

					// private
					formatDate : function(date) {
						return Ext.isDate(date) ? date.dateFormat(this.format)
								: date;
					},

					// private
					menuListeners : {
						select : function(m, d) {
							this.setValue(d);
							if (this.showRedSatSun) {
								if (d.getDay() == 0 || d.getDay() == 6)
									this.getEl().dom.style.color = 'red';
								else
									this.getEl().dom.style.color = '#000000';
							}
						},
						show : function() { // retain focus styling
							this.onFocus();
						},
						hide : function() {
							this.focus.defer(10, this);
							var ml = this.menuListeners;
							this.menu.un("select", ml.select, this);
							this.menu.un("show", ml.show, this);
							this.menu.un("hide", ml.hide, this);
						}
					},

					onTriggerClick : function() {
						if (this.disabled) {
							return;
						}
						if (this.menu == null) {
							this.menu = new Ext.ux.DateMenu();
						}
						Ext.apply(this.menu.picker, {
							minDate : this.minValue,
							maxDate : this.maxValue,
							disabledDatesRE : this.ddMatch,
							disabledDatesText : this.disabledDatesText,
							disabledDays : this.disabledDays,
							disabledDaysText : this.disabledDaysText,
							showRedSatSun : this.showRedSatSun,
							showLunarCalendar : this.showLunarCalendar,
							format : this.format,
							showToday : this.showToday,
							minText : String.format(this.minText, this
									.formatDate(this.minValue)),
							maxText : String.format(this.maxText, this
									.formatDate(this.maxValue)),
							input : this
						// davi
						});
						this.menu.on(Ext.apply({}, this.menuListeners, {
							scope : this
						}));
						this.menu.picker
								.setValue(this.getValue() || new Date());
						this.menu.show(this.el, "tl-bl?");
						// --xuke
						if (this.format.indexOf('d') == -1) {
							this.menu.picker.showMonthPicker();
						}
					},

					// private
					beforeBlur : function() {
						var v = this.parseDate(this.getRawValue());
						if (v) {
							this.setValue(v);
							if (this.showRedSatSun) {
								if (v.getDay() == 0 || v.getDay() == 6)
									this.getEl().dom.style.color = 'red';
								else
									this.getEl().dom.style.color = '#000000';
							}
						}
					}
				});
