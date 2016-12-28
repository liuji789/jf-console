;(function($){
	$.fn.flexSlide=function(options){
		var defaults={
			wrap:"",
			cont:"",
			contNumAuto:"true",//关于当前显示的数字，显示的滚动的具体位置的标记是否显示
			duration:1000,
			autoPlay:"true",//幻灯片自动滚动
			autoTabBtn:"true",//左右切换的按钮默认隐藏鼠标滑过出现，false默认显示
			prev:"",
			next:""
		};
		var opts=$.extend(defaults,options);
		this.each(function(i){
			var wrap=opts.wrap,
			cont=opts.cont,
			contWd=cont.children().width(),
			size=cont.children().length,
			duration=opts.duration,
			contNumAuto=opts.contNumAuto,
			autoPlay=opts.autoPlay,
			autoTabBtn=opts.autoTabBtn,
			prev=opts.prev,
			next=opts.next;
			var fixedNum=Math.ceil(wrap.width()/contWd) +1; //固定的个数即在div内显示的个数+1
			var cur = 0,
			max = size - 1;
			
			function dgo(n) {
				var idx = n > max ? 0: n;
				cur = idx;
				cont.children().hide();
				cont.children().eq(cur).show();
				if(contNumAuto=="true"){					
					$(".flex-control-paging li").removeClass("active").eq(cur).addClass("active");					
				}
			}
			function go(n){
				if( n > 0){
					if( cur == max){
						cur = 0;
					}
					else{
						cur++;
					}
				}
				if( n < 0){
					if( cur == 0){
						cur = max;
					}
					else{
						cur--;
					}
				}
				cont.children().hide();
				cont.children().eq(cur).show();
				$(".flex-control-paging li").removeClass("active");
				$(".flex-control-paging li").eq(cur).addClass("active");
				
			}
			$(document).bind('keyup', function(event) {
				var keycode = event.keyCode;
				if (keycode === 39) {
					go(1);
				}
				if( keycode === 37){
					go(-1);
				}
           });
			if(contNumAuto=="true"){
				var btns = $((new Array(size + 1)).join('<li></li>')).each(function(idx, el) {
					$(el).data({
						idx: idx
					});
				});
				$('<ol class="flex-control-paging"/ >').append(btns).delegate('li', 'click',
				function(ev) {
					dgo($(this).data('idx'));
					$(this).addClass("active").siblings(".flex-control-paging li").removeClass("active");
				}).appendTo(wrap);
			};
			$(".flex-control-paging li").eq(0).addClass("active");
			var pn_btn = $('<div class="scrollBtns"><s class="'+prev+'"></s><s class="'+next+'"></s></div>');
			pn_btn.appendTo(wrap);
			var $tabBtn=$(".scrollBtns");
			$tabBtn.delegate("s", 'click',
			function() {
				var idx = $(this).index();
				dgo(idx);
				clearInterval(autoS);
			});
			
			if(autoTabBtn=="true")
			{
				var ie6 = $.browser.msie && $.browser.version < '7.0',autoS;
				wrap.hover(function(ev) {
					if (ie6) {
						pn_btn[ev.type == 'mouseenter' ? 'show': 'hide']();
					} else {
						pn_btn.stop()['fade' + (ev.type == 'mouseenter' ? 'In': 'Out')]('fast');
					}
				});
			}
			if(autoPlay=="true"){
				var autoS = setInterval(function() {go(1);},duration);
				wrap.hover(function(){
					clearInterval(autoS);
				},function(){
					autoS = setInterval(function() {go(1);},duration);
				});
			}
				
			
		});
		
	};
})(jQuery);
