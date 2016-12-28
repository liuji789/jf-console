/**
 * Dazzle整合包
 * @author qiukq
 * @member lihp
 * @version 2.0 2012-11-22
 */
var Dazzle = {
	/**
	 * 工具集合
	 * @scope private
	 */
	util:{},
	/**
	 * 组件集合
	 * @scope private
	 */
	panel:{},
	/**
	 * 常量集合
	 * @scope private
	 */
	constant:{},
	/**
	 * 外链文件数组
	 * @scope private
	 */
	config:{
		UtilsEnums:{enable:true,src:rootPath+"/res/cui/constant/UtilsEnums.js"},
		PanelsEnums:{enable:true,src:rootPath+"/res/cui/constant/PanelsEnums.js"},
		AdapterUtils:{enable:false,src:rootPath+"/res/cui/util/AdapterUtils.js"},
		DateUtils:{enable:false,src:rootPath+"/res/cui/util/DateUtils.js"},
		DomUtils:{enable:false,src:rootPath+"/res/cui/util/DomUtils.js"},
		JsonUtils:{enable:false,src:rootPath+"/res/cui/util/JsonUtils.js"},
		MathUtils:{enable:false,src:rootPath+"/res/cui/util/MathUtils.js"},
		ObjectUtils:{enable:false,src:rootPath+"/res/cui/util/ObjectUtils.js"},
		StringUtils:{enable:false,src:rootPath+"/res/cui/util/StringUtils.js"},
		ValidUtils:{enable:false,src:rootPath+"/res/cui/util/ValidUtils.js"},
		MindXPanel:{enable:false,src:rootPath+"/res/cui/app/mindx/js/MindXPanel.js"},
		NavigatorPanel:{enable:false,src:rootPath+"/res/cui/app/navigator/js/NavigatorPanel.js"}
	},
	/**
	 * 工具或组件路由
	 * @scope private
	 */
	loadMap:{
		AdapterUtils:["AdapterUtils"],
		DateUtils:["DateUtils"],
		DomUtils:["DomUtils"],
		JsonUtils:["JsonUtils"],
		MathUtils:["MathUtils"],
		ObjectUtils:["ObjectUtils"],
		StringUtils:["StringUtils"],
		ValidUtils:["ValidUtils"],
		MindXPanel:["AdapterUtils","DomUtils","ObjectUtils","MindXPanelScript"],
		NavigatorPanel:["DomUtils","JsonUtils","ObjectUtils","NavigatorPanelScript"]
	},
	/**
	 * 批量加载工具或组件
	 * @scope public
	 * @param arguments 待加载工具或组件数组
	 */
	load:function(){
		for(var i=0; i<arguments.length; i++) {
			this.setEnable(this.loadMap[arguments[i]]);
		}
	},
	/**
	 * 批量启用外链文件
	 * @scope private
	 * @param enableArr 待启用外链文件数组
	 */
	setEnable:function(enableArr){
		for(var i=0; i<enableArr.length; i++) {
			this.config[enableArr[i]].enable = true;
		}
	},
	/**
	 * Dazzle加载完执行回调方法
	 * @scope public
	 * @param callback 回调方法引用
	 */
	onLoad:function(callback){
		var enableConfig = [];
		for(var configName in this.config) {
			var configFile = this.config[configName];
			if(configFile.enable) {
				enableConfig.push(configFile);
			}
		}
		this.checkLoad(0, enableConfig);
		this.callback = callback;
	},
	/**
	 * 顺序加载启用的外链文件
	 * @scope private
	 * @param i 外链文件数组索引
	 */
	checkLoad:function(i, enableConfig){
		if((i < enableConfig.length)){
			var src = enableConfig[i].src;
			var suffix = src.substr(src.lastIndexOf(".")+1);
			var curLoad = null;
			switch(suffix){
				case "js":
					curLoad = this.loadScript(src);
					break;
				case "css":
					curLoad = this.loadStyle(src);
					break;
			}
			var _this = this;
			var loadHandle = setInterval(function(){
				if(curLoad.readyState == "loaded" || curLoad.readyState == "complete"){
					clearInterval(loadHandle);
					if(i < enableConfig.length - 1){
						_this.checkLoad(i+1, enableConfig);
					}
					else {
						_this.callback();
					}
				}
			},50);
		}
	},
	/**
	 * 加载JS文件
	 * @scope private
	 * @param src JS文件路径
	 * @return JS文档对象
	 */
	loadScript:function(src){
		var head = document.getElementsByTagName("head")[0];
		var includeScript = document.createElement("script");
		includeScript.type = "text/javascript";
		includeScript.src = src;
		head.appendChild(includeScript);
		return includeScript;
	},
	/**
	 * 加载CSS文件
	 * @scope private
	 * @param href CSS文件路径
	 * @return CSS文档对象
	 */
	loadStyle:function(href){
		var head = document.getElementsByTagName("head")[0];
		var includeStyle = document.createElement("link");
		includeStyle.type = "text/css";
		includeStyle.rel = "stylesheet";
		includeStyle.href = href;
		head.appendChild(includeStyle);
		return includeStyle;
	}
};
