// JavaScript Document
/**
 * jscroll.js
 * direction scrollBar
 */
/*--------------------------------------------------------------------------------------------------*/
$.fn.extend({//添加滚轮事件
	mousewheel:function(Func){
		return this.each(function(){
			var _self = this;
		    _self.D = 0;//滚动方向
			if($.browser.msie||$.browser.safari){
			   _self.onmousewheel=function(){_self.D = event.wheelDelta;event.returnValue = false;Func && Func.call(_self);};
			}else{
			   _self.addEventListener("DOMMouseScroll",function(e){
					_self.D = e.detail>0?-1:1;
					e.preventDefault();
					e.stopPropagation();
					Func && Func.call(_self);
					
			   },false); 
			}
		});
	}
});
$.fn.extend({
	jscroll:function(j){
		return this.each(function(){
			j = j || {}
			j.Bar = j.Bar||{};//2级对象
			j.Btn = j.Btn||{};//2级对象
			j.Bar.Bg = j.Bar.Bg||{};//3级对象
			j.Bar.Bd = j.Bar.Bd||{};//3级对象
			j.Btn.uBg = j.Btn.uBg||{};//3级对象
			j.Btn.dBg = j.Btn.dBg||{};//3级对象
			var param = { W:"15px"
						,BgUrl:""
						,Bg:"#efefef"
						,Bar:{  Pos:"up"
								,Bd:{Out:"#b5b5b5",Hover:"#ccc"}
								,Bg:{Out:"#fff",Hover:"#fff",Focus:"orange"}}
						,Btn:{  btn:true
								,uBg:{Out:"#ccc",Hover:"#fff",Focus:"orange"}
								,dBg:{Out:"#ccc",Hover:"#fff",Focus:"orange"}}
						,Fn:function(){}}
			j.W = j.W||param.W;
			j.BgUrl = j.BgUrl||param.BgUrl;
			j.Bg = j.Bg||param.Bg;
				j.Bar.Pos = j.Bar.Pos||param.Bar.Pos;
					j.Bar.Bd.Out = j.Bar.Bd.Out||param.Bar.Bd.Out;
					j.Bar.Bd.Hover = j.Bar.Bd.Hover||param.Bar.Bd.Hover;
					j.Bar.Bg.Out = j.Bar.Bg.Out||param.Bar.Bg.Out;
					j.Bar.Bg.Hover = j.Bar.Bg.Hover||param.Bar.Bg.Hover;
					j.Bar.Bg.Focus = j.Bar.Bg.Focus||param.Bar.Bg.Focus;
				j.Btn.btn = j.Btn.btn!=undefined?j.Btn.btn:param.Btn.btn;
					j.Btn.uBg.Out = j.Btn.uBg.Out||param.Btn.uBg.Out;
					j.Btn.uBg.Hover = j.Btn.uBg.Hover||param.Btn.uBg.Hover;
					j.Btn.uBg.Focus = j.Btn.uBg.Focus||param.Btn.uBg.Focus;
					j.Btn.dBg.Out = j.Btn.dBg.Out||param.Btn.dBg.Out;
					j.Btn.dBg.Hover = j.Btn.dBg.Hover||param.Btn.dBg.Hover;
					j.Btn.dBg.Focus = j.Btn.dBg.Focus||param.Btn.dBg.Focus;
			j.Fn = j.Fn||param.Fn;
			var _self = this;
			var Stime,Sp=0,Isup=0;
			$(_self).css({overflow:"hidden",position:"relative",padding:"0"});
			var contWd = $(_self).width(), contHg = $(_self).height()-1;
			var scrollBrWd = j.W ? parseInt(j.W) : 21;
			var sl = contWd - scrollBrWd
			var bw = j.Btn.btn==true ? scrollBrWd : 0;
			
			if($(_self).children(".jscroll-c").height()==null){//存在性检测
				$(_self).wrapInner("<div class='jscroll-c' style='z-index:99;zoom:1;position:relative'></div>");
				$(_self).children(".jscroll-c").prepend("<div style='height:0px;overflow:hidden'></div>");
				$(_self).append("<div class='jscroll-e' unselectable='on' style=' height:100%;top:0px;right:0;-moz-user-select:none;position:absolute;overflow:hidden;z-index:100;'><div class='jscroll-u' style='position:absolute;top:0px;width:100%;left:0;background:blue;overflow:hidden'></div><div class='jscroll-h'  unselectable='on' style='position:absolute;left:0;-moz-user-select:none;border:1px solid'></div><div class='jscroll-d' style='position:absolute;bottom:0px;width:100%;left:0;background:blue;overflow:hidden'></div></div>");
			}
			var jscrollc = $(_self).children(".jscroll-c");
			var jscrolle = $(_self).children(".jscroll-e");
			var jscrollh = jscrolle.children(".jscroll-h");
			var jscrollu = jscrolle.children(".jscroll-u");
			var jscrolld = jscrolle.children(".jscroll-d");
			if($.browser.msie){document.execCommand("BackgroundImageCache", false, true);}
			jscrollc.css({"padding-right":scrollBrWd});
			jscrolle.css({width:scrollBrWd,background:j.Bg,"background-image":j.BgUrl});
			jscrollh.css({background:j.Bar.Bg.Out,"background-image":j.BgUrl,"border-color":j.Bar.Bd.Out,width:scrollBrWd-2});
			jscrollu.css({height:bw,background:j.Btn.uBg.Out,"background-image":j.BgUrl});
			jscrolld.css({height:bw,background:j.Btn.dBg.Out,"background-image":j.BgUrl});
			
			var scrollContHg = jscrollc.height();
			
			var scrollBarHg = (contHg-2*bw)*contHg / scrollContHg
			if(scrollBarHg<10){scrollBarHg=10}
			//滚动时候跳动幅度		
			var wh = scrollBarHg/6  
			var curTop = 0,allowS=false;
			jscrollh.height(scrollBarHg);
			if(scrollContHg<=contHg){
					jscrollc.css({padding:0,top:0,position:""});jscrolle.css({display:"none"});									
				}
				else{
					allowS=true; jscrolle.css({display:"block"});	
					jscrollc.css({position:"relative"});			
				}
			var autoTop = jscrollh.css("top");	
			if(autoTop == "0px" || autoTop == "auto"){				
				setT();	
				
			}
			else{
				curTop=parseInt(autoTop);
				setT();
			    
				
		    }
			
			jscrollh.bind("mousedown",function(e){
				j['Fn'] && j['Fn'].call(_self);
				Isup=1;
				jscrollh.css({background:j.Bar.Bg.Focus,"background-image":j.BgUrl})
				var pageY = e.pageY ,t = parseInt($(this).css("top"));
				$(document).mousemove(function(e2){
					 curTop =t+ e2.pageY - pageY;//pageY浏览器可视区域鼠标位置，screenY屏幕可视区域鼠标位置
						setT();
				});
				$(document).mouseup(function(){
					Isup=0;
					jscrollh.css({basckground:j.Bar.Bg.Out,"background-image":j.BgUrl,"border-color":j.Bar.Bd.Out})
					$(document).unbind("mousemove");
				});
				return false;
			});
			jscrollu.bind("mousedown",function(e){
			j['Fn'] && j['Fn'].call(_self);
				Isup=1;
				jscrollu.css({background:j.Btn.uBg.Focus,"background-image":j.BgUrl})
				_self.timeSetT("u");
				$(document).mouseup(function(){
					Isup=0;
					jscrollu.css({background:j.Btn.uBg.Out,"background-image":j.BgUrl})
					$(document).unbind();
					clearTimeout(Stime);
					Sp=0;
				});
				return false;
			});
			jscrolld.bind("mousedown",function(e){
			j['Fn'] && j['Fn'].call(_self);
				Isup=1;
				jscrolld.css({background:j.Btn.dBg.Focus,"background-image":j.BgUrl})
				_self.timeSetT("d");
				$(document).mouseup(function(){
					Isup=0;
					jscrolld.css({background:j.Btn.dBg.Out,"background-image":j.BgUrl})
					$(document).unbind();
					clearTimeout(Stime);
					Sp=0;
				});
				return false;
			});
			_self.timeSetT = function(d){
				var self=this;
				if(d=="u"){curTop-=wh;}else{curTop+=wh;}
				setT();
				Sp+=2;
				var t =500 - Sp*50;
				if(t<=0){t=0};
				Stime = setTimeout(function(){self.timeSetT(d);},t);
			}
			jscrolle.bind("mousedown",function(e){
					j['Fn'] && j['Fn'].call(_self);
							curTop = curTop + e.pageY - jscrollh.offset().top - scrollBarHg/2;
							asetT();
							return false;
			});
			function asetT(){				
						if(curTop<bw){curTop=bw;}
						if(curTop>contHg-scrollBarHg-bw){curTop=contHg-scrollBarHg-bw;}
						jscrollh.stop().animate({top:curTop},100);
						var scT = -((curTop-bw)*scrollContHg/(contHg-2*bw));
						jscrollc.stop().animate({top:scT},1000);
			};
			function setT(){				
						if(curTop<bw){curTop=bw;}
						if(curTop>contHg-scrollBarHg-bw){curTop=contHg-scrollBarHg-bw;}
						jscrollh.css({top:curTop});
						var scT = -((curTop-bw)*scrollContHg/(contHg-2*bw));
						jscrollc.css({top:scT});
						
			};
			function setcT(){
						curTop=parseInt(autoTop);
						if(curTop<=bw){curTop=bw;}
						if(curTop>contHg-scrollBarHg-bw){curTop=contHg-scrollBarHg-bw;}
						jscrollh.css({top:curTop});
						var scT = -((curTop-bw)*scrollContHg/(contHg-2*bw));
						jscrollc.css({top:scT});
			};
			
			$(_self).mousewheel(function(){
					if(allowS!=true) return;
					j['Fn'] && j['Fn'].call(_self);
						if(this.D>0){curTop-=wh;}else{curTop+=wh;};
						setT();
			})
		});
	}
});
