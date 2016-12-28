/**
 * Dazzle适配器工具
 * @author qiukq
 * @version 2.0 2012-11-22
 */
Dazzle.util.AdapterUtils = {
	/**
	 * 是否是IE浏览器
	 * @scope public
	 * @return 是否是IE浏览器
	 */
	isIE:function(){
		return navigator.appVersion.toLowerCase().indexOf("msie") != -1 ? true : false;
	},
	/**
	 * 是否是Opera浏览器
	 * @scope public
	 * @return 是否是Opera浏览器
	 */
	isOpera:function(){
		return navigator.userAgent.toLowerCase().indexOf("opera") != -1 ? true : false;
	},
	/**
	 * 是否是Windows系统
	 * @scope public
	 * @return 是否是Windows系统
	 */
	isWin:function(){
		return navigator.appVersion.toLowerCase().indexOf("win") != -1 ? true : false;
	},
	/**
	 * 是否已安装Flash指定或以上版本
	 * @scope public
	 * @param majorVersion 主版本号
	 * @param minorVersion 副版本号
	 * @param revisionVersion 小版本号
	 * @return 是否已安装Flash指定或以上版本
	 */
	isInstallFlash:function(majorVersion,minorVersion,revisionVersion){
		var versionStr = this.getSwfVer();
		if(versionStr == -1){
			return false;
		}
		else if(versionStr != 0) {
			if(this.isIE() && this.isWin() && !this.isOpera()){
				tempArray = versionStr.split(" ");
				tempString = tempArray[1];
				versionArray = tempString.split(",");
			}
			else {
				versionArray = versionStr.split(".");
			}
			var versionMajor = versionArray[0];
			var versionMinor = versionArray[1];
			var versionRevision = versionArray[2];
			if (versionMajor > parseFloat(majorVersion)) {
				return true;
			}
			else if(versionMajor == parseFloat(majorVersion)) {
				if (versionMinor > parseFloat(minorVersion)){
					return true;
				}
				else if(versionMinor == parseFloat(minorVersion)) {
					if(versionRevision >= parseFloat(revisionVersion)){
						return true;
					}
				}
			}
			return false;
		}
	},
	/**
	 * 获取Flash版本号
	 * @scope private
	 * @return Flash版本号
	 */
	getSwfVer:function(){
		var flashVer = -1;
		if (navigator.plugins != null && navigator.plugins.length > 0) {
			if (navigator.plugins["Shockwave Flash 2.0"] || navigator.plugins["Shockwave Flash"]) {
				var swVer2 = navigator.plugins["Shockwave Flash 2.0"] ? " 2.0" : "";
				var flashDescription = navigator.plugins["Shockwave Flash"+swVer2].description;
				var descArray = flashDescription.split(" ");
				var tempArrayMajor = descArray[2].split(".");			
				var versionMajor = tempArrayMajor[0];
				var versionMinor = tempArrayMajor[1];
				var versionRevision = descArray[3];
				if (versionRevision == "") {
					versionRevision = descArray[4];
				}
				if (versionRevision[0] == "d") {
					versionRevision = versionRevision.substring(1);
				}
				else if (versionRevision[0] == "r") {
					versionRevision = versionRevision.substring(1);
					if (versionRevision.indexOf("d") > 0) {
						versionRevision = versionRevision.substring(0,versionRevision.indexOf("d"));
					}
				}
				else if (versionRevision[0] == "b") {
					versionRevision = versionRevision.substring(1);
				}
				var flashVer = versionMajor+"."+versionMinor+"."+versionRevision;
			}
		}
		else if(navigator.userAgent.toLowerCase().indexOf("webtv/2.6") != -1){
			flashVer = 4;
		}
		else if(navigator.userAgent.toLowerCase().indexOf("webtv/2.5") != -1){
			flashVer = 3;
		}
		else if(navigator.userAgent.toLowerCase().indexOf("webtv") != -1){
			flashVer = 2;
		}
		else if(this.isIE() && this.isWin() && !this.isOpera()){
			flashVer = this.controlVersion();
		}
		return flashVer;
	},
	/**
	 * 检测Flash版本号
	 * @scope private
	 * @return Flash版本号
	 */
	controlVersion:function(){
		var version;
		var axo;
		try {
			axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.7");
			version = axo.GetVariable("$version");
		}
		catch (e) {
		}
		if(!version){
			try {
				axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.6");
				version = "WIN 6,0,21,0";
				axo.AllowScriptAccess = "always";
				version = axo.GetVariable("$version");
			}
			catch (e) {
				version = -1;
			}
		}
		if(!version){
			try {
				axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.3");
				version = axo.GetVariable("$version");
			}
			catch (e) {
				version = -1;
			}
		}
		if(!version){
			try {
				axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.3");
				version = "WIN 3,0,18,0";
			}
			catch (e) {
				version = -1;
			}
		}
		if(!version){
			try {
				axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash");
				version = "WIN 2,0,0,11";
			}
			catch (e) {
				version = -1;
			}
		}
		return version;
	}
};