function jslider() {
	var $root = $('#slideBox');	
	var p = $root.find('.nav-block > .nav-list'),
	child=p.children(".nav-blk-list"),
	root_w = child.width()+1,
	n = child.length,sNum=3;	
	function setWidth(){
		$root.find('.nav-block').css({"float":"none","display":"block","width":n*(root_w+1),"min-width":n*(root_w+1),"margin":"0 auto"});
	}
	if(n<=sNum){
		setWidth();
		$(window).resize(function() {
			setWidth();	
	    });
	}
	else{
		$(".nav-blk-list:lt("+sNum+")").clone().appendTo(p);
		p.css("width",(n+sNum)*root_w+100);
		$root.prepend(' <a href="javascript:;" class="prev-btn"></a>');
		$root.append('<a href="javascript:;" class="next-btn"></a>');
	}
	var cur = 0,
	max = n - 1,
	pt = 0,
	stay = 5 * 1000,
	dur = .6 * 1000;
	function dgo(n, comp) {
		var idx = n > max ? 0: n;
		cur = idx;
		p.stop().animate({
			left: -1 * root_w * n
		},
		{
			duration: dur,
			complete: comp
		});
	}	
	function go(dir, slast) {
		pt = +new Date();
		if (dir === 0) {
			p.css({
				left: -1 * root_w * cur
			});
			return;
		}
		var t;
		if (dir > 0) {
			t = cur + 1;
			if (t > max && !slast) {
				t = 0;
			}
			if (t <= max) {
				return dgo(t);
			}
			return dgo(t,
			function() {
				p.css({
					left: 0
				});
			});
		} else {
			t = cur - 1;
			if (t < 0) {
				t = max;
				p.css({
					left: -1 * root_w * (max + 1)
				});
				return dgo(t);
			} else {
				return dgo(t);
			}
		}
	}
	
	
	$(".prev-btn").click(function(){ go(-1,true);});
	$(".next-btn").click(function(){ go(1,true);});
	if ($root.attr('rel') == 'auto-play') {
		var si = setInterval(function() {
			var now = +new Date();
			if (now - pt < stay) {
				return;
			}
			go(1, true);
		},
		5000);
		p.mouseover(function() {
			clearInterval(si);
		});
		 p.mouseout(function() {
			si = setInterval(function() {
				var now = +new Date();
				if (now - pt < stay) {
					return;
				}
				go(1, true);
			},
			5000);
		});
	}
}