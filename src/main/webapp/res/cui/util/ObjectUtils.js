/**
 * Dazzle对象工具
 * @author qiukq
 * @version 2.0 2012-11-26
 */
Dazzle.util.ObjectUtils = {
	/**
	 * 更新对象
	 * @scope public
	 * @param baseObj 基础对象
	 * @param updateParam 更新参数
	 * @param isAppend 是否追加缺失参数
	 * @return 更新后的对象
	 */
	update:function(baseObj,updateParam,isAppend){
		if(typeof updateParam != "undefined" && updateParam != null){
			for(var p in updateParam){
				if(typeof baseObj[p] != "undefined"){
					baseObj[p] = updateParam[p];
				}
				else {
					if(isAppend){
						baseObj[p] = updateParam[p];
					}
				}
			}
		}
		return baseObj;
	},
	/**
	 * 继承对象
	 * @scope public
	 * @param baseObj 基础对象
	 * @param extendParam 继承参数
	 * @return 继承后的对象
	 */
	extend:function(baseObj,extendParam){
		//JSON对象简单继承
		if(typeof baseObj == "object" && typeof extendParam == "object"){
			var extendObj = {};
			for(var p in baseObj){
				extendObj[p] = baseObj[p];
			}
			for(var p in extendParam){
				extendObj[p] = extendParam[p];
			}
			return extendObj;
		}
		//Function对象寄生组合继承，高效，只调用一次构造方法，并保持原型链
		else if(typeof baseObj == "function" && typeof extendParam == "function"){
			//创建父类对象副本
			var prototype = this.protoModel(baseObj.prototype);
			//追加子类对象属性和方法
			this.update(prototype,extendParam,true);
			this.update(prototype,extendParam.prototype,true);
			//增强对象，弥补因重写原型失去的默认constructor属性
			prototype.constructor = extendParam;
			//指定对象
			extendParam.prototype = prototype;
		}
	},
	/**
	 * 原型继承
	 * @scope private
	 * @param baseObj 基础对象
	 * @return 继承后的对象
	 */
	protoModel:function(baseObj) {
		function M() {};
		M.prototype = baseObj;
		return new M();
	}
};