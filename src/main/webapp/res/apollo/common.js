/*
 * common.js 公共交互js
 * author gaomy
 * date 2014-1-22
 */

$(function() {

	var $conts = $(document);
	// 树列表显示
	$(".tree-tit").bind("click", function(event) {
		event.stopPropagation();
		if ($(".tree-list").hasClass("undis")) {
			$(this).addClass("tree-tit-over");
			$(".tree-list").show().removeClass("undis").addClass("dis");
		} else {
			$(this).removeClass("tree-tit-over");
			$(".tree-list").hide().removeClass("dis").addClass("undis");
		}

	});
	// 策略方案设置 选择活动目标js
	$(".targetCont ul").eq(0).show();
	$conts.delegate(".act-selTab li", "click", function() {
		var idx = $(this).index();
		$(".act-selTab li").removeClass("mOn2").children("i").removeClass(
				"selct");
		$(this).addClass("mOn2").children("i").addClass("selct");
		$(".targetCont ul").eq(idx).show().siblings().hide();
	});
	// 策略方案设置 活动方案设置
	$(".act-target .act-otSet").eq(0).show();
	$(".act-info .act-otSet").eq(0).show();

	// 元件切换js
	$conts.delegate(".rule-tab li", "click", function() {
		tabShow(this, ".cell-ruleCnt", "mOn3");
		jscrollBar(".cell-box", "10");
	});
	$conts.delegate(".rule-tab2 li", "click", function() {
		tabShow(this, ".bor-box2", "mOn3");
		jscrollBar(".cell-box", "10");
	});
	// 滚动条样式
	if ($(".cell-box").length) {
		jscrollBar(".cell-box", "10");
	}
	;

	// 营销活动iframe actCfgFrm.html=============================//
	if ($(".actView").length || $(".actview-step").length) {
		setActIframeHeight();
		setActMinusHg();
	}
	;

	// 框架index iframe=============================//
	setIndexIframeHeight();
	// ===============================//
	// 执行规则，问卷调查下拉列表js
	$conts.delegate(".select-opt", "click", function() {
		$(this).next("ul.lst").toggle();
	});
	$conts.delegate(".lst li", "click", function() {
		var txt = $(this).text();
		$("ul.lst").slideUp("fast");
		$(this).parent().prev(".select-opt").find("em").text(txt);
	});
	// 客户群运算=================//
	// 左侧3级列表出现滚动条
	var $ulst = $(".u-lstcnt");
	if ($(".user-tag").length) {
		// jscrollBar(".user-tag","5");
		$(".user-tag").mCustomScrollbar("update");
	}
	if ($(".canvas").length) {
		jscrollBar(".canvas", "5");
	}

	// 左侧3级数量
	// 左侧标签展开下拉
	function slideMenuArrow() {
		if ($(".t-erlst").length) {
			$(".t-erlst").append('<b class="tip-arrow-r2"></b>');
			$conts.delegate(".t-erlst", "click", function() {
				if ($(this).next(".u-lstcnt").hasClass("undis")) {
					$(".u-lstcnt").hide().addClass("undis");
					$(this).next(".u-lstcnt").show().removeClass("undis");
					$(".t-erlst").removeClass("t-erlst-sel").find("b")
							.removeClass("tip-arrow-d");
					$(this).addClass("t-erlst-sel").find("b").addClass(
							"tip-arrow-d");
				} else {
					$(this).next(".u-lstcnt").hide().addClass("undis");
					$(this).removeClass("t-erlst-sel").find("b").removeClass(
							"tip-arrow-d");
				}
				// jscrollBar(".user-tag","5");
				$(".user-tag").mCustomScrollbar("update");
			});
		}
		;
	}
	;
	slideMenuArrow();
	function slideMenuKeyArrow() {
		$(".utag dt").addClass("select01")
				.append('<b class="tip-arrow-d"></b>');
		$conts.delegate(".utag dt", "click", function() {
			if ($(this).next("dd").hasClass("undis")) {
				// $(this).parent().siblings().find("dd").hide().addClass("undis");
				$(this).nextAll("dd").show().removeClass("undis");
				// $(".utag
				// dt").removeClass("select01").find("b").removeClass("tip-arrow-r");
				$(this).addClass("select01").find("b").removeClass(
						"tip-arrow-r").addClass("tip-arrow-d");
			} else {
				$(this).nextAll("dd").hide().addClass("undis");
				$(this).removeClass("select01").find("b").removeClass(
						"tip-arrow-d").addClass("tip-arrow-r");
			}
			// jscrollBar(".user-tag","5");
			$(".user-tag").mCustomScrollbar("update");
		});
	}
	;
	slideMenuKeyArrow();
	// 左侧标签滑过出现加号
	if ($(".t-lst3").length) {
		$conts.delegate(".t-lst3", "mouseover", function() {
			$(this).find(".add-rt").show();
		});
		$conts.delegate(".t-lst3", "mouseleave", function() {
			$(this).find(".add-rt").hide();
		});

	}
	;

	// 画布配置 划过效果 出现删除修改按钮
	$conts.delegate(".u-drop", "mouseover", function() {
		$(".users").find(".u-drop").removeClass("u-drop-hv");
		$(".users").find(".opt").css({
			"display" : "none"
		});
		$(this).addClass("u-drop-hv").next(".opt").css({
			"display" : "inline-block"
		});
	});
	$conts.delegate(".users", "mouseleave", function() {
		$(".users").find(".u-drop").removeClass("u-drop-hv");
		$(".users").find(".opt").css({
			"display" : "none"
		});
	});
	$conts.delegate(".op-canvas .sign", "mouseover", function() {
		$(".op-canvas .sign").find(".opt-bg").css({
			"display" : "none"
		});
		$(this).find(".opt-bg").css({
			"display" : "inline-block"
		});
	});
	$conts.delegate(".op-canvas .sign", "mouseleave", function() {
		$(".op-canvas .sign").find(".opt-bg").css({
			"display" : "none"
		});
	});
	// 已配置客户群划过操作
	if ($(".user-lst").length) {
		$conts.delegate(".user-lst", "mouseover", function() {
			$(".user-lst").find(".user-cz").hide();
			$(this).find(".user-cz").show();
		});
	}
	;
	$conts.delegate(".user-cfged ul", "mouseleave", function() {
		$(".user-lst").find(".user-cz").hide();
	});

	// userGrouplst();

	// 针对ie6,7表格上一行绝对问题文字被下一行文字覆盖的问题
	var ie6 = $.browser.msie && $.browser.version <= '7.0';
	if (ie6) {
		if ($(".msg-info").length) {
			$(".msg-info").each(function() {
				var lst = $(this).find("tr"), size = lst.size(), i;
				for (i = 0; i < size; i++) {
					lst.eq(i).css("z-index", 30 - i);
				}
			});
		}
		if ($(".in").length) {
			$(".in").each(function() {
				var nm = $(".in").size(), lis = $(".in");
				for (i = 0; i < nm; i++) {
					lis.eq(i).css("z-index", 10 - i);
				}
			});
		}
	}
	// =============================//
	// ready 信息滚动	 
	//通告公告展开收缩的操作
	$("#developOpera").bind("click",function(){
		  if($(this).hasClass("ss")){//ss 是展开状态
			  $(this).text("展开>>").removeClass("ss");
	  		  $(".notice-box").slideUp(500);
			  $(".notice-search").fadeOut(500);
			  setTimeout(function(){
				$(".pub-tit").addClass("bot-cor");
			  },500);	  
		  }
		  else{
		  	  $(this).text("收缩>>").addClass("ss");
	  		  $(".notice-box").slideDown(500);
			  $(".notice-search").fadeIn();
			  $(".pub-tit").removeClass("bot-cor");
		  }
	  });
	  //当滚动窗口时头部的用户数量消失
	  //scrollHide();
	 // 监控中心的头部tab页
	 monitorTab();

});
function userGrouplst() {
	var $ulst = $(".u-lstcnt");
	if ($ulst.length) {
		$ulst.each(function(index, element) {
			if ($(this).find(".t-lst3").size() > 5) {
				$(this).addClass("tag-cnt");
				jscrollBar(".tag-cnt", "5");
			}

		});
	}
	;
}

// 树列表消失
function hideTree() {
	if ($(".tree-list").hasClass("dis")) {
		$(".tree-tit").removeClass("tree-tit-over");
		$(".tree-list").hide().removeClass("dis").addClass("undis");
	}
}

// 滚动条样式10px宽
function jscrollBar(obj, wd) {
	$(obj).jscroll({
		W : wd + "px",
		BgUrl : "",
		Bg : "#ccc",
		Bar : {
			Pos : "up",
			Bd : {
				Out : "#9d9d9d",
				Hover : "#9d9d9d"
			},
			Bg : {
				Out : "#9d9d9d",
				Hover : "#9d9d9d",
				Focus : "#9d9d9d"
			}
		},
		Btn : {
			btn : false
		},
		Fn : function() {
		}
	});
};

// 活动方案设置下一步
var cur = 0, curr2 = 0;
function actNext() {
	cur++;
	$(".act-target").find(".act-fnStep").find("li").eq(cur)
			.addClass("step-vst");
	$(".act-target").find(".act-otSet").eq(cur).show().siblings(".act-otSet")
			.hide();
	$(".prev-step").show();
	if (cur == 4) {
		$(".prev-step").show();
		$(".next-step").hide();
	}
	setActIframeHeight();

};

function actPrev() {
	cur--;
	$(".act-target").find(".act-fnStep").find("li").eq(cur)
			.addClass("step-vst").nextAll("li").removeClass("step-vst");
	$(".act-target").find(".act-otSet").eq(cur).show().siblings(".act-otSet")
			.hide();
	$(".next-step").show();
	if (cur == 0) {
		$(".prev-step").hide();
		$(".next-step").show();
	}
	setActIframeHeight();
};
// 查看信息上下步
function actNext2() {
	curr2++;
	$(".act-info").find(".act-fnStep").find("li").eq(curr2)
			.addClass("step-vst");
	$(".act-info").find(".act-otSet").eq(curr2).show().siblings(".act-otSet")
			.hide();
	$(".prev-step").show();
	if (curr2 == 4) {
		$(".prev-step").show();
		$(".next-step").hide();
	}
	setActIframeHeight();

};

function actPrev2() {
	curr2--;
	$(".act-info").find(".act-fnStep").find("li").eq(curr2)
			.addClass("step-vst").nextAll("li").removeClass("step-vst");
	$(".act-info").find(".act-otSet").eq(curr2).show().siblings(".act-otSet")
			.hide();
	$(".next-step").show();
	if (curr2 == 0) {
		$(".prev-step").hide();
		$(".next-step").show();
	}
	setActIframeHeight();
};

// 新建策略活动向下显示元素*/
function showSm() {
	$("dd.act-target").show();
	$("dd.act-info").hide();
	$("dt.actstep-tit").removeClass("actstep-default").addClass("actstep-save");
	setActIframeHeight();

};
// 向上隐藏元素
function hideSm() {
	$("dd.act-info").show();
	$("dd.act-target").hide();
	$("dt.actstep-tit").addClass("actstep-default").removeClass("actstep-save");
	setActIframeHeight();
	setActMinusHg();

};
// 新建策略活动actCfgFrm.html iframe的高度
function setActIframeHeight() {
	if ($(".constr1").length) {
		var bh = $(".constr1").outerHeight(true);
		$(window.parent.document.body).find("#actTagCfg").height(bh);
	}
	if ($(".constr2").length) {
		var bh = $(".constr2").outerHeight(true);
		$(window.parent.document.body).find("#actBaseCfg").height(bh);
	}
	if ($(".constr3").length) {
		var bh = $(".constr3").outerHeight(true);
		$(window.parent.document.body).find("#actSchemeCfg").height(bh);
	}
	if ($(".constr4").length) {
		var bh = $(".constr4").outerHeight(true);
		$(window.parent.document.body).find("#actServiceCfg").height(bh);
	}

};
// 营销活动点击保存计算indexiframe的高度
function setActMinusHg() {
	var a = $(window.parent.document.body).find("#actTagCfg").height(), b = $(
			window.parent.document.body).find("#actBaseCfg").height(), c = $(
			window.parent.document.body).find("#actSchemeCfg").height(), d = $(
			window.parent.document.body).find("#actServiceCfg").height(), m = a
			+ b + c + d;
	$(window.parent.parent.document.body).find("#indexiframe").height(m);

};
// 页面加载完存计算indexiframe的高度
function setIndexIframeHeight() {
	if ($(".asideR-cont").length) {
		var bh = $(".asideR-cont").outerHeight(true);
		$(window.parent.document.body).find("#indexiframe").height(bh);
	}
};
// window.setInterval("setIndexIframeHeight()", 500);
// 修改文字内容
function alterInput(obj1, obj2) {
	$(obj1).fadeOut().hide();
	$(obj2).fadeIn().show();
}
// 公共切换方法
function tabShow(tabNm, obj, clsnm) {
	var idx = $(tabNm).index();
	$(obj).eq(idx).show().siblings(obj).hide();
	$(tabNm).addClass(clsnm).siblings(tabNm).removeClass(clsnm);

};
// 公共显示方法
function showEle(obj1) {
	$(obj1).show();
};
// 公共隐藏方法
function hideEle(obj1) {
	$(obj1).hide();
};
// iframe 子页面的弹窗的显示隐藏
function slideShow(obj){
	var $obj=$(obj),
		winHg=$(window).height(),
		winWd=$(window).width(),
		hg=$obj.height(),
		wd=$obj.width(),
		top=(winHg-hg)/2,
		left=(winWd-wd)/2;
		$obj.css({"left":(winWd-wd)/2});
		if( top<0){
			$obj.css({"top":0}).show();
		}
		else{
			$obj.stop().animate({"top":(winHg-hg)/2},100).show();
		}
}
function slideHide(obj){
	$(obj).css({"top":"","left":""},1000).hide();
}
// 显示弹窗和遮罩
function showIframePop() {
	$(window.parent.document.body).find("#popIframe").show();
	$(window.parent.document.body).find(".shadowBg").show();
	parent.setDaskHeight();
	parent.setPopPos();
	parent.setPopWidth();
};
// 关闭弹窗和遮罩
function hideIframePop() {
	$(window.parent.document.body).find("#popIframe").hide();
	$(window.parent.document.body).find("#popIframe").css({
		"height" : "0",
		"top" : "0"
	});
	$(window.parent.document.body).find(".shadowBg").hide();
};
// 关于子弹窗的显示和隐藏
function showChildPop() {
	$("#popIframe").show();
	parent.setPopWidth();
	$(".shadowBg2").show();
};
function hideChildPop() {
	$(window.parent.document.body).find("#popIframe").hide();
	$(window.parent.document.body).find(".shadowBg2").hide();
};

window.onload = function() {

	document.getElementsByTagName("body")[0].onkeydown = function() {

		// 获取事件对象
		var elem = event.relatedTarget || event.srcElement || event.target
				|| event.currentTarget;

		if (event.keyCode == 8) {// 判断按键为backSpace键

			// 获取按键按下时光标做指向的element
			var elem = event.srcElement || event.currentTarget;

			// 判断是否需要阻止按下键盘的事件默认传递
			var name = elem.nodeName;

			if (name != 'INPUT' && name != 'TEXTAREA') {
				return _stopIt(event);
			}
			var type_e = elem.type.toUpperCase();
			if (name == 'INPUT'
					&& (type_e != 'TEXT' && type_e != 'TEXTAREA'
							&& type_e != 'PASSWORD' && type_e != 'FILE')) {
				return _stopIt(event);
			}
			if (name == 'INPUT'
					&& (elem.readOnly == true || elem.disabled == true)) {
				return _stopIt(event);
			}
		}
	};
};
function _stopIt(e) {
	if (e.returnValue) {
		e.returnValue = false;
	}
	if (e.preventDefault) {
		e.preventDefault();
	}

	return false;
}

/**
 * 数字之间加逗号
 * @param   {String}    参数
 * @return  {String}    返回结果
 */
function formatNum(str){
    str = str.toString();
    if (/[^0-9\.]/.test(str)){return str;}
    var strFloor = '';
    if(RegExp('\\.').test(str)){
        strArr = str.split('.');
        str = strArr[0];
        strFloor = '.' + strArr[1];
    }
    var n = str.length % 3;
    if(n){
        return str.slice(0,n) +  str.slice(n).replace(/(\d{3})/g,',$1') + strFloor;
    }else{
        return str.replace(/(\d{3})/g,',$1').slice(1) + strFloor;
    }
}
//当滚动窗口时头部的用户数量消失
function scrollHide(){
	var initSt;
	$(window).scroll(function(){
		initSt=$(window).scrollTop();
		if(initSt>=70){
			$(".about-act-num").slideUp("500");
		}
		else{
			$(".about-act-num").show();
		}
	})
};
/**
 *全屏图表自适应
**/
function chartAdaptive(obj){ 
	var $obj = $(obj),
		winWd = $(window).width(),
	    chartWd = winWd - 380; // 380 为左右间距
	if(winWd < 1050){ //窗口缩小时
		$obj.css({width:650,height:300});
	}
	else{
		$obj.css({width:chartWd});
	}
};
/**
* 监控中心的头部tab页
**/
function monitorTab(){
	var idx = $(".monitoring-tab .cur").index();
	$(".monitoring-tab li").mouseover(function(){
		$(this).addClass("cur").siblings().removeClass("cur");
	});
	
	$(".monitoring-tab li").click(function(){
		parent.menuClick = true;
	});
	
	$(".monitoring-tab").mouseleave(function(){
		$(".monitoring-tab li").eq(idx).addClass("cur").siblings().removeClass("cur");
	});
	
}
