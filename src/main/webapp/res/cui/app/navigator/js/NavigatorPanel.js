/**
 * Dazzle向导组件
 * @author qiukq
 * @version 2.0 2012-11-29
 */
Dazzle.panel.NavigatorPanel = function(config){
	this.renderTo =config.renderTo;
	this.id =config.id;
	this.name =config.name;
	this.width = config.width ? config.width : "100%";
	this.height = config.height ? config.height : window.innerHeight+"px";
	this.autoEncode = config.autoEncode ? config.autoEncode : true;
	this.style = config.style;
	this.baseParams = config.baseParams ? config.baseParams : null;
	this.curPage = 0;
	this.pages = config.pages;
	var defaultStyle = {
		theme:1
	};
	this.style = config.style ? Dazzle.util.ObjectUtils.update(defaultStyle,config.style,true) : defaultStyle;
	Dazzle.loadStyle(Dazzle.constant.PanelsEnums["NAVIGATOR_STYLE_"+this.style.theme]);
}

/**
 * 渲染向导
 * @scope public
 */
Dazzle.panel.NavigatorPanel.prototype.render = function(){
	var renderDom = document.getElementById(this.renderTo);
	var stepsLen = this.pages.length;
	//表头宽度 = (容器总宽度 - 容器左间距)/表头数 - (表头左间距 + 表头右间距 + 表头边框右间距)
	var stepTextWidth = parseInt((renderDom.offsetWidth-5)/stepsLen) - (20+25+7);
	var stepsTemplateStr = "<ul class='navigatorPanel'>"
		+"<for list=${pages}>"
		+"<li><span class='w"+stepTextWidth+"'>${pages[i].header}</span><s class='sl'></s></li>"
		+"</for>"
		+"</ul>";
	var stepsFormatStr = Dazzle.util.DomUtils.template(stepsTemplateStr,{
		pages:this.pages
	});
	renderDom.innerHTML = stepsFormatStr;
	
	var stepsContainer = document.getElementsByTagName("ul",renderDom)[0];
	var steps = document.getElementsByTagName("li",stepsContainer);
	steps[0].className = "current";
	var firstStepBg = document.getElementsByTagName("s",steps[0])[0];
	firstStepBg.className = "first";
	
	var lastStepText = document.getElementsByTagName("span",steps)[stepsLen - 1];
	lastStepText.className += " last";
	var lastStepBg = document.createElement("s");
	lastStepBg.className = "last";
	steps[stepsLen - 1].appendChild(lastStepBg);
	
	var frameTemplateStr = "<iframe id='${id}' name='${name}' width='${width}' height='${height}' frameborder='0'></iframe>";
	var frameFormatStr = Dazzle.util.DomUtils.template(frameTemplateStr,{
		id:this.id,
		name:this.name,
		width:this.width,
		height:this.height
	});
	renderDom.innerHTML += frameFormatStr;
	
	this.prevPageBtnId = this.id+"PrevPageBtn";
	this.nextPageBtnId = this.id+"NextPageBtn";
	this.completeBtnId = this.id+"CompleteBtn";
	
	this.createBtn(this.prevPageBtnId,"上一步",renderDom);
	this.createBtn(this.nextPageBtnId,"下一步",renderDom);
	this.createBtn(this.completeBtnId,"完成",renderDom);
	
	this.bindBtnEvnet(1,this.prevPageBtnId,renderDom);
	this.bindBtnEvnet(2,this.nextPageBtnId,renderDom);
	this.bindBtnEvnet(3,this.completeBtnId,renderDom);
	
	this.step2Page(null,0);
}

/**
 * 创建按钮
 * @scope private
 * @param btnId 按钮ID
 * @param btnText 按钮文本
 * @param btnContainer 按钮容器
 */
Dazzle.panel.NavigatorPanel.prototype.createBtn = function(btnId,btnText,btnContainer){
	var btnTemplateStr = "<a class='stepBtn mt7 mb10 mr10' id='${btnId}'><em></em>${btnText}<s class='eBorL'></s><s class='eBorR'></s></a>";
	
	var btnFormatStr = Dazzle.util.DomUtils.template(btnTemplateStr,{
		btnId:btnId,
		btnText:btnText
	});
	btnContainer.innerHTML += btnFormatStr;
}

/**
 * 绑定按钮事件
 * @scope private
 * @param btnType 按钮类型
 * @param btnId 按钮ID
 * @param btnContainer 按钮容器
 */
Dazzle.panel.NavigatorPanel.prototype.bindBtnEvnet = function(btnType,btnId,btnContainer){
	var _this = this;
	var btn = document.getElementById(btnId,btnContainer);
	btn.attachEvent("onclick", function() {
		var curListener = _this.pages[_this.curPage].listener;
		var appendParams = null;
		if(curListener){
			var validateEnable = btnType == 2 || btnType == 3 ? true : false;
			var clickEnable = btnType == 2 ? true : false;
			var prevPageParamsEnable = btnType == 1 ? true : false;
			var nextPageParamsEnable = btnType == 2 ? true : false;
			//校验事件
			if(validateEnable && curListener.validate){
				if(!_this.execFrameFn(curListener.validate)){
					return;
				}
			}
			//单击事件
			if(clickEnable && curListener.click){
				_this.execFrameFn(curListener.click);
			}
			//更新上一步参数事件
			if(prevPageParamsEnable && curListener.prevPageParams){
				appendParams = _this.execFrameFn(curListener.prevPageParams);
			}
			//更新下一步参数事件
			if(nextPageParamsEnable && curListener.nextPageParams){
				appendParams = _this.execFrameFn(curListener.nextPageParams);
			}
		}
		var urlParams = Dazzle.util.ObjectUtils.extend(_this.baseParams,appendParams);
		//默认跳转事件
		switch(btnType){
			case 1:
				_this.step2Page(urlParams,_this.curPage - 1);
				break;
			case 2:
				_this.step2Page(urlParams,_this.curPage + 1);
				break;
			case 3:
				window.close();
		}
	});
}

/**
 * 执行框架页方法
 * @scope private
 * @param fn 框架页方法
 * @return 框架页方法返回值
 */
Dazzle.panel.NavigatorPanel.prototype.execFrameFn = function(fn){
	if(typeof fn == "string"){
		return window.frames[this.id][fn]();
	}
}

/**
 * 跳转至指定页
 * @scope private
 * @param urlParams URL参数集
 * @param pageIndex 页下标
 */
Dazzle.panel.NavigatorPanel.prototype.step2Page = function(urlParams, pageIndex){
	//当前页
	this.curPage = pageIndex;
	//当前作用域
	var curScope = document.getElementById(this.renderTo);
	//切换表头和按钮
	var steps = document.getElementsByTagName("li",curScope);
	var stepsLen = steps.length;
	var prevPageBtn = document.getElementById(this.prevPageBtnId,curScope);
	var nextPageBtn = document.getElementById(this.nextPageBtnId,curScope);
	var completeBtn = document.getElementById(this.completeBtnId,curScope);
	
	this.setBtnEnable(false);
	prevPageBtn.style.display = "none";
	nextPageBtn.style.display = "none";
	completeBtn.style.display = "none";
	
	for(var i=0; i<stepsLen; i++) {
		steps[i].className = "";
		if(pageIndex == i){
			if(stepsLen - i - 1 > 0){
				nextPageBtn.style.display = "";
			}
			else {
				completeBtn.style.display = "";
			}
			if(i > 0){
				prevPageBtn.style.display = "";
			}
			steps[i].className += "current";
		}
	}
	//格式化URL参数集
	var urlParamsStr = this.formatUrlParams(urlParams);
	//切换框架页
	var mainFrame = document.getElementById(this.id);
	mainFrame.src = this.pages[pageIndex].url + urlParamsStr;
}

/**
 * 设置按钮是否启用
 * @scope public
 * @param isEnable 启用标识
 */
Dazzle.panel.NavigatorPanel.prototype.setBtnEnable = function(isEnable){
	//当前作用域
	var curScope = document.getElementById(this.renderTo);
	//按钮
	var prevPageBtn = document.getElementById(this.prevPageBtnId,curScope);
	var nextPageBtn = document.getElementById(this.nextPageBtnId,curScope);
	var completeBtn = document.getElementById(this.completeBtnId,curScope);
	if(isEnable){
		prevPageBtn.disabled = "";
		nextPageBtn.disabled = "";
		completeBtn.disabled = "";
	}
	else {
		prevPageBtn.disabled = "disabled";
		nextPageBtn.disabled = "disabled";
		completeBtn.disabled = "disabled";
	}
}

/**
 * 格式化URL参数集
 * @scope private
 * @param urlParams URL参数集
 * @return 格式化后的URL参数字符串
 */
Dazzle.panel.NavigatorPanel.prototype.formatUrlParams = function(urlParams){
	var urlParamsArr = [];
	for(var p in urlParams){
		var urlParam = p + "=" + Dazzle.util.JsonUtils.encode(urlParams[p],this.autoEncode);
		urlParamsArr.push(urlParam);
	}
	if(urlParamsArr.length > 0){
		return "?" + urlParamsArr.join("&");
	}
	else {
		return ""
	}
}
