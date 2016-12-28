/**
 * Dazzle导图组件
 * @author qiukq
 * @version 2.0 2012-11-28
 */
Dazzle.panel.MindXPanel = function(config){
	if(Dazzle.util.AdapterUtils.isInstallFlash(9,0,124)){
		this.renderTo = config.renderTo;
		this.id = config.id;
		this.name = config.name;
		this.width = config.width ? config.width : "100%";
		this.height = config.height ? config.height : "900px";
		this.transparent = config.transparent ? config.transparent : true;
		this.layout = config.layout;
		this.style = config.style;
		this.data = config.data;
		
		Dazzle.panel.MindXPanel.prototype.readyDoms.push(this.id);
		Dazzle.panel.MindXPanel.prototype.readyFlashs[this.id] = false;

		var templateStr = "<object id='${id}' name='${name}' width='${width}' height='${height}' align='middle' type='application/x-shockwave-flash' classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000'>"
			+"<param name='movie' value='${src}'></param>"
			+"<param name='quality' value='high'></param>"
			+"<param name='allowScriptAccess' value='always'></param>"
			+"<param name='wmode' value='${transparent}'></param>"
			+"</object>";
		
		var formatStr = Dazzle.util.DomUtils.template(templateStr,{
			id:this.id,
			name:this.name,
			width:this.width,
			height:this.height,
			src:rootPath+"/res/js/cui/app/mindx/swf/MindX.swf?getReadyDomsFnName=getMindXReadyDoms&readyDom="+this.id+"&setFlashReadyFnName=setMindXFlashReady&readyFlash="+this.id+"&width="+this.width+"&height="+this.height,
			transparent:this.transparent?"transparent":"opaque"
		});
		
		var renderDom = document.getElementById(this.renderTo);
		renderDom.innerHTML = formatStr;
	}
}
Dazzle.panel.MindXPanel.prototype.readyDoms = [];
Dazzle.panel.MindXPanel.prototype.readyFlashs = {};

/**
 * 渲染导图
 * @scope public
 */
Dazzle.panel.MindXPanel.prototype.render = function(){
	var _this = this;
	var usedTime = 0;
	var renderHandler = setInterval(function(){
		if(usedTime <= 10000){
			if(Dazzle.panel.MindXPanel.prototype.readyFlashs[_this.id]){
				var flash = _this.getMindX(_this.id);
				var loadPercent = Math.abs(flash.PercentLoaded());
				if(loadPercent == 100){
					clearInterval(renderHandler);
					flash.render(_this.layout,_this.style,_this.data);
				}
			}
			usedTime += 100; 
		}
		else {
			clearInterval(renderHandler);
		}
	},100);
}

/**
 * 刷新导图
 * @scope public
 * @param newLayout 新布局
 * @param newStyle 新样式
 * @param newData 新数据
 * @param isAppend 是否追加至原配置
 */
Dazzle.panel.MindXPanel.prototype.refresh = function(newLayout,newStyle,newData,isAppend){
	if(isAppend){
		this.layout = Dazzle.util.ObjectUtils.update(this.layout,newLayout,isAppend);
		this.style = Dazzle.util.ObjectUtils.update(this.style,newStyle,isAppend);
		this.data = Dazzle.util.ObjectUtils.update(this.data,newData,isAppend);
	}
	else {
		this.layout = newLayout;
		this.style = newStyle;
		this.data = newData;
	}
	this.render();
}

/**
 * 获取导图Flash文档
 * @scope private
 * @return 导图Flash文档
 */
Dazzle.panel.MindXPanel.prototype.getMindX = function(){
	if(Dazzle.util.AdapterUtils.isIE()){
		return window[this.id];
	}
	else {
		return document[this.id];
	}
}

/**
 * 获取已加载的Flash文档集
 * @scope private
 * @return 已加载的Flash文档集
 */
function getMindXReadyDoms(){
	return "#"+Dazzle.panel.MindXPanel.prototype.readyDoms.join("#")+"#";
}

/**
 * 设置Flash已加载
 * @scope private
 * @param readyFlash 已加载的Flash
 */
function setMindXFlashReady(readyFlash){
	Dazzle.panel.MindXPanel.prototype.readyFlashs[readyFlash] = true;
}
