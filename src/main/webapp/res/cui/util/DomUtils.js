/**
 * Dazzle文档工具
 * @author qiukq
 * @version 2.0 2012-11-26
 */
Dazzle.util.DomUtils = {
	/**
	 * 以模板格式渲染出文档字符串
	 * @scope public
	 * @param templateStr 文档模板：${属性名}，${数组名.length}，${数组名[n].属性名}，<for list=${数组名}>${数组名[i].属性名}</for>
	 * @param params 渲染参数集
	 * @return 渲染后的文档字符串
	 */
	template:function(templateStr,params){
		var _this = this;
		templateStr = templateStr.replace(/\n/g,"%0A");
		var forReg = /<for list=\$\{(.+)\}>(.*)<\/for>/g;
		//非贪婪捕获${参数}
		var replaceReg = /\$\{(.+?)\}/g;
		//替换<for list=${数组名}>循环内容</for>为展开的循环内容
		templateStr = templateStr.replace(forReg,function(match,forArrStr,forContent,index,originalText){
			//暂不支持循环嵌套
			if(forReg.test(forContent)){
				return originalText;
			}
			else {
				//获取循环次数
				var forArr = forArrStr.split(".");
				forArr.push("length");
				var forArrLen = _this.getParamVal(forArr,params);
				//替换${数组名[i].属性名}为${数组名[n].属性名}
				var forVal = "";
				for(var i=0; i<forArrLen; i++) {
					forVal += forContent.replace(replaceReg,function(match,captureGroup,index,originalText){
						var forArrI= captureGroup.replace(/\[(\w+)\]/g,function(match,forChar,index,originalText){
							return "[" + i + "]";
						});
						return "${" + forArrI + "}";
					});
				}
				return forVal;
			}
		});
		//替换${属性名}，${数组名.length}，${数组名[n].属性名}为属性值
		templateStr = templateStr.replace(replaceReg,function(match,cascadeParamStr,index,originalText){
			var cascadeParamArr = cascadeParamStr.split(".");
			var paramVal = _this.getParamVal(cascadeParamArr,params);
			return paramVal;
		});
		templateStr = templateStr.replace(/%0A/g,"\n");
		return templateStr;
	},
	/**
	 * 获取参数值
	 * @scope private
	 * @param cascadeParamArr 级联参数数组
	 * @param baseParam 基础参数
	 * @return 参数值
	 */
	getParamVal:function(cascadeParamArr,baseParam){
		var indexReg = /\[(\d+)\]/g;
		var paramVal = null;
		for(var i=0; i<cascadeParamArr.length; i++) {
			var arrIndex = indexReg.exec(cascadeParamArr[i]);
			if(arrIndex != null){
				if(i == 0){
					paramVal = baseParam[RegExp.leftContext][RegExp.lastParen];
				}
				else {
					paramVal = paramVal[RegExp.leftContext][RegExp.lastParen];
				}
			}
			else {
				if(i == 0){
					paramVal = baseParam[cascadeParamArr[i]];
				}
				else {
					paramVal = paramVal[cascadeParamArr[i]]
				}
			}
		}
		return paramVal;
	}
};
