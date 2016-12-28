/**
 * DazzleJson工具
 * @author qiukq
 * @version 2.0 2012-11-27
 */
Dazzle.util.JsonUtils ={
	/**
	 * 编码Json
	 * @scope public
	 * @param json Json
	 * @param isEncodeChinese 是否编码中文字符
	 * @return Json字符串
	 */
	encode:function(json,isEncodeChinese){
		var jsonStr = this.json2String(json);
		if(isEncodeChinese){
			jsonStr = encodeURI(encodeURIComponent(jsonStr));
		}
		return jsonStr;
	},
	/**
	 * Json转Json字符串
	 * @scope private
	 * @param json Json
	 * @return Json字符串
	 */
	json2String:function(json){
		var type = typeof json;
		if(type == "object"){
			if(Object.prototype.toString.call(json) == "[object Array]"){
				type = "array";
			}
			else if(RegExp == json.constructor){
				type = "regexp";
			}
			else{
				type = "object";
			}
		}
		switch(type){
			case "undefined":
			case "unknown":
				return "";
			case "function":
			case "boolean":
			case "regexp":
				return json.toString();
			case "number":
				return isFinite(json) ? json.toString() : "";
			case "string":
				return '"' + json.replace(/(\'|\")/g, '\\$1').replace(/\n|\t|\r/g, function(){
					var a = arguments[0];
					return(a == "\n")? "\\n" :(a == "\r") ? "\\r" :(a == "\t") ? "\\t" : "";
				}) + '"';
			case "object":
				if(json === null){
					return "";
				}
				else {
					var results = [];
					for(var p in json){
						var value = Dazzle.util.JsonUtils.json2String(json[p]);
						if(value != undefined){
							var temp = Dazzle.util.JsonUtils.json2String(p);
							results.push(temp + ':' + value);
						}
					}
					return "{" + results.join(",") + "}";
				}
			case "array":
				var results = [];
				for(var i = 0; i < json.length; i++){
					var value = Dazzle.util.JsonUtils.json2String(json[i]);
					if(value !== undefined){
						results.push(value);
					}
				}
				return "[" + results.join(",") + "]";
		}
	},
	/**
	 * 解码Json字符串
	 * @scope public
	 * @param jsonStr Json字符串
	 * @param isDecodeChinese 是否解码中文字符
	 * @return Json
	 */
	decode:function(jsonStr,isDecodeChinese){
		if(jsonStr == null || typeof jsonStr != "string"){
			return null;
		}
		else {
			if(isDecodeChinese){
				jsonStr = decodeURIComponent(decodeURI(jsonStr));
			}
			return eval("(" + jsonStr + ")");
		}
	}
}
