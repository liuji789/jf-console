/*
 * index.js 框架交互js
 * author gaomy
 */
function menuOpera(){
	var $mn = $(".frt span");
	$mn.click(function(){
		$(".frt").removeClass("menu-cur");
		$(this).parent().addClass("menu-cur");
		if($(this).parent().hasClass("hasMenu")){
			$(this).parent().find(".second-menu").slideToggle("fast");
			$(this).parent().find(".m-arrow").toggleClass("m-down");
		}
	});
	var $mn3 = $(".second-menu li");
	$mn3.click(function(){
		$(".frt").removeClass("menu-cur");
		$(".second-menu li").removeClass("active");
		$(this).parent().parent().addClass("menu-cur");
		$(this).addClass("active");
	});
}
function setDaskHeight() {
	if($("#indexiframe").length){
		var parentHg = parseInt($("#indexiframe").height()) + 300;
		$(".shadowBg").height(parentHg);
		if(parentHg<=$(document).height()){
			$(".shadowBg").height($(document).height());
		}
	}
	else{
		$(".shadowBg").height($(document).height());
	}
};
// 左侧菜单的高度
function initMenuHg(){
	var rhg = $("#indexiframe").height() + 81; //75为标题的高度
	$(".nav").height(rhg);
}
//设置弹窗的高度
function setIframeHeight(obj) {
	var iframe=$("#"+obj);
	try {
		
		if(iframe.contents().find(".asideR-cont")[0]){
			var cntHeight = iframe.contents().find(".asideR-cont")[0].scrollHeight;
			iframe.height(cntHeight+"px");
		}
		if(iframe.contents().find(".outer-box")[0]){
			var cntHeight = iframe.contents().find(".outer-box")[0].scrollHeight+35;
			iframe.height(cntHeight+"px");
		}
		else{
			try {
				var iframe = document.getElementById(obj);
				var bHeight = iframe.contentWindow.document.body.scrollHeight;
				var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
				var height = Math.max(bHeight, dHeight);
				//iframe.height = height;
				iframe.style.height=height+"px";
				

			} catch (e) {}	
		}
	} catch (e) {}
};
window.setInterval("setIframeHeight('indexiframe')", 200);
window.setInterval("initMenuHg()", 200);
//window.setInterval("setIframeHeight('popIframe')", 200);


function getIfrData(data){
	var ifr_el = window.document.getElementById("indexiframe");
	ifr_el.style.height = data+"px";
};

//设置弹窗的宽度

function setPopWidth() {
	var iframe = $("#popIframe");
	iframe.css("width", $("#popIframe").contents().find(".outer-box").width() + 2);

};
//设置弹窗的位置

function setPopPos() {
	var iframe = $("#popIframe"),
		width = iframe.contents().find(".outer-box").width(),
		height = iframe.contents().find(".outer-box").height();
	var topH = ($(window).height() - height) / 2 + $(window).scrollTop();
	var leftW = ($(window).width() - width) / 2;
	if (topH < 0) {
		iframe.css({"top": "5px","left": leftW + "px"});
	} else {
		iframe.animate({"top": topH + "px"},150).css({"left": leftW + "px"});
	}
};

function setDefaultPage(){
	//默认选中菜单非一级菜单
	if($("#defaultPage0") && $("#defaultPage0:has(span)").length==0){
		$("#indexiframe").attr("src",$("#defaultPage0").attr("idsrc"));
		$("#cnt-title").html($("#defaultPage0").html());
		$(".frt").removeClass("menu-cur");
		$(".second-menu li").removeClass("active");
		$("#defaultPage0").parent().parent().find(".second-menu").slideDown("fast");
		$("#defaultPage0").parent().parent().find(".m-arrow").addClass("m-down");
		$("#defaultPage0").parent().parent().addClass("menu-cur");
		$("#defaultPage0").addClass("active");
	//一级菜单
	}else if($("#defaultPage0") && $("#defaultPage0:has(span)").length!=0){
		$("#indexiframe").attr("src",$("#defaultPage0").attr("idsrc"));
		$("#cnt-title").html($("#defaultPage0").html());
		$(".frt").removeClass("menu-cur");
		$(".second-menu li").removeClass("active");
		$("#defaultPage0").addClass("menu-cur");
	}
}