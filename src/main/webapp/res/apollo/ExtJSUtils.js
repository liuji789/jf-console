/**
 * ExtJs工具
 * @type
 * @author miaofc 
 */
var ExtJSUtils = {

	/**
	 * EXT时间页面展示变换
	 * @param {} value
	 * @param {} meta
	 * @param {} record
	 * @param {} rowIndex
	 * @param {} colIndex
	 * @param {} store
	 * @return {}
	 */
	datetimeRender : function(value, meta, record, rowIndex, colIndex, store) {
		var returnValue = "";
		if (value == "" || value == null || value == 0) {
			return returnValue;
		}
		if (typeof value == "object") {
			returnValue = Ext.util.Format.date(new Date(value.time),
					'Y-m-d H:i:s');
		}else if(typeof value  == "number") { 
			returnValue = new Date(parseInt(value)).toLocaleString().replace(/年|月/g, "-").replace(/日/g, " "); 
		}else{
			returnValue = value
		}
		return returnValue;
	},

	/**
	 * EXT日期页面展示变换
	 * @param {} value
	 * @param {} meta
	 * @param {} record
	 * @param {} rowIndex
	 * @param {} colIndex
	 * @param {} store
	 * @return {}
	 */ 
	dateRender : function(value, meta, record, rowIndex, colIndex, store) {
		var returnValue = "";
		if (value == "" || value == null || value == 0) {
			return returnValue;
		}
		if (typeof value == "object") {
			returnValue = Ext.util.Format.date(new Date(value.time), 'Y年m月d日');
		} else {
			returnValue = value.substr(0, 19);
		}
		return returnValue;
	}

}